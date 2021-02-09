Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BC93154BC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:12:45 +0100 (CET)
Received: from localhost ([::1]:39870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WZA-0002NV-AS
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9WWx-0000BJ-N3
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9WWi-0006ml-7F
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612890611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/GpxlOUqXqUwMX5Xdf9xd5pVFjkoU/y33QCz5U4HCI=;
 b=YbzM/4UrnrFBV2TGC2O+WueWcHjZUF3ynuLxbwEmxyV7rw25LvtACmRZxBB9ow5RSktUQE
 og/QXUXBswG/VGETMxalyJ2l/BmhmSnx6ol9eQgOoR286hasUeIrgQl+hqI8wpAHhqCyP+
 EAEtSoNXyYiTZwNFa+8M3oTz0ENpOdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-rQVUF-2nP0eek1LHWRER9Q-1; Tue, 09 Feb 2021 12:10:07 -0500
X-MC-Unique: rQVUF-2nP0eek1LHWRER9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95CC4100CCC0;
 Tue,  9 Feb 2021 17:10:06 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-208.ams2.redhat.com
 [10.36.113.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13B87179B3;
 Tue,  9 Feb 2021 17:10:00 +0000 (UTC)
Subject: Re: [RFC PATCH] block/null: Use 'read-zeroes' mode by default
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210209170121.3310151-1-philmd@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <31432934-6e6a-6aea-6233-f686eced6efe@redhat.com>
Date: Tue, 9 Feb 2021 18:09:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209170121.3310151-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.02.21 18:01, Philippe Mathieu-Daudé wrote:
> The null-co driver is meant for (performance) testing.
> By default, read operation does nothing, the provided buffer
> is not filled with zero values and its content is unchanged.
> 
> This can confuse security experts. For example, using the default
> null-co driver, buf[] is uninitialized, the blk_pread() call
> succeeds and we then access uninitialized memory:

I suppose in practice it’s going to be uninitialized guest memory most 
of the time, so it isn’t that bad, but yes.

Thanks!

>    static int guess_disk_lchs(BlockBackend *blk,
>                               int *pcylinders, int *pheads,
>                               int *psectors)
>    {
>        uint8_t buf[BDRV_SECTOR_SIZE];
>        ...
> 
>        if (blk_pread(blk, 0, buf, BDRV_SECTOR_SIZE) < 0) {
>            return -1;
>        }
>        /* test msdos magic */
>        if (buf[510] != 0x55 || buf[511] != 0xaa) {
>            return -1;
>        }
> 
> We could audit all the uninitialized buffers and the
> bdrv_co_preadv() handlers, but it is simpler to change the
> default of this testing driver. Performance tests will have
> to adapt and use 'null-co,read-zeroes=on'.
> 
> Suggested-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> RFC maybe a stricter approach is required?

I think this is good.  If we do want a stricter approach, we might 
remove read-zeroes altogether (but I suppose that would require a 
deprecation period then) and add a new null-unsafe driver or something 
in its stead (that we can the conditionally compile out, or 
distributions can choose not to whitelist, or, or, or...).

If we just follow through with this patch, I don’t think we need a 
deprecation period, because this can well be considered a bug fix; and 
because I don’t know of any use for read-zeroes=false except for some 
very special performance tests.

> ---
>   block/null.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/null.c b/block/null.c
> index cc9b1d4ea72..f9658fd70ac 100644
> --- a/block/null.c
> +++ b/block/null.c
> @@ -93,7 +93,7 @@ static int null_file_open(BlockDriverState *bs, QDict *options, int flags,
>           error_setg(errp, "latency-ns is invalid");
>           ret = -EINVAL;
>       }
> -    s->read_zeroes = qemu_opt_get_bool(opts, NULL_OPT_ZEROES, false);
> +    s->read_zeroes = qemu_opt_get_bool(opts, NULL_OPT_ZEROES, true);
>       qemu_opts_del(opts);
>       bs->supported_write_flags = BDRV_REQ_FUA;
>       return ret;

The documentation in qapi/block-core.json has to be changed, too.

Are there any iotests (or other tests) that don’t set read-zeroes? 
Should they continue to use read-zeroes=false?

Max


