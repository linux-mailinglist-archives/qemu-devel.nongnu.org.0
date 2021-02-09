Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D303154BD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:13:09 +0100 (CET)
Received: from localhost ([::1]:41018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WZY-0002uM-D5
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9WXo-0001ft-DX
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:11:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9WXm-0007Kp-6Y
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612890676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFkm8Jc8V1QLYMEDhWj03Cgm4tR/J/YYcnSssT93Mrc=;
 b=b/Kw/C1FddEmEpZ5+HcHbeEkJ4J+UujUPmfo2rRsahvtOriLtYgK5ky+iSRttYS6Dij6o8
 XuMpSA9m83X3KF/MdmfZnHZJ6dsyiFNLEEn2kwekjQQcu3O3uZjm2LCThyjETrlaKGtLIM
 Uwcvywmxlp0COhOqJTRJ9GUAiJws5ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-SSXP7gYtOu-BD0M5FgsJ-Q-1; Tue, 09 Feb 2021 12:11:13 -0500
X-MC-Unique: SSXP7gYtOu-BD0M5FgsJ-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12F0E9126D;
 Tue,  9 Feb 2021 17:11:11 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64A62171F4;
 Tue,  9 Feb 2021 17:11:04 +0000 (UTC)
Subject: Re: [RFC PATCH] block/null: Use 'read-zeroes' mode by default
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210209170121.3310151-1-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8abd4d2a-8afc-5386-e888-1a4302b25514@redhat.com>
Date: Tue, 9 Feb 2021 11:11:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209170121.3310151-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 11:01 AM, Philippe Mathieu-Daudé wrote:
> The null-co driver is meant for (performance) testing.
> By default, read operation does nothing, the provided buffer
> is not filled with zero values and its content is unchanged.
> 
> This can confuse security experts. For example, using the default
> null-co driver, buf[] is uninitialized, the blk_pread() call
> succeeds and we then access uninitialized memory:
> 
>   static int guess_disk_lchs(BlockBackend *blk,
>                              int *pcylinders, int *pheads,
>                              int *psectors)
>   {
>       uint8_t buf[BDRV_SECTOR_SIZE];
>       ...
> 
>       if (blk_pread(blk, 0, buf, BDRV_SECTOR_SIZE) < 0) {
>           return -1;
>       }
>       /* test msdos magic */
>       if (buf[510] != 0x55 || buf[511] != 0xaa) {
>           return -1;
>       }
> 
> We could audit all the uninitialized buffers and the
> bdrv_co_preadv() handlers, but it is simpler to change the
> default of this testing driver. Performance tests will have
> to adapt and use 'null-co,read-zeroes=on'.

Wouldn't this rather be read-zeroes=off when doing performance testing?

> 
> Suggested-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> RFC maybe a stricter approach is required?

Since the null driver is only for testing in the first place, opting in
to speed over security seems like a reasonable tradeoff.  But I consider
the patch incomplete without an audit of the iotests that will want to
use explicit read-zeroes=off.

> ---
>  block/null.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/null.c b/block/null.c
> index cc9b1d4ea72..f9658fd70ac 100644
> --- a/block/null.c
> +++ b/block/null.c
> @@ -93,7 +93,7 @@ static int null_file_open(BlockDriverState *bs, QDict *options, int flags,
>          error_setg(errp, "latency-ns is invalid");
>          ret = -EINVAL;
>      }
> -    s->read_zeroes = qemu_opt_get_bool(opts, NULL_OPT_ZEROES, false);
> +    s->read_zeroes = qemu_opt_get_bool(opts, NULL_OPT_ZEROES, true);
>      qemu_opts_del(opts);
>      bs->supported_write_flags = BDRV_REQ_FUA;
>      return ret;
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


