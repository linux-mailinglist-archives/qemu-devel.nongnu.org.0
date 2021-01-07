Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888402ED01C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 13:44:23 +0100 (CET)
Received: from localhost ([::1]:35354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxUeM-0002mS-L8
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 07:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kxUcb-0001jG-NC
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:42:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kxUcY-0005CF-7W
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:42:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610023348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2/pXQXkDLe0IEu+TVXZjPsAia6NL/gehZzIzBouQuE=;
 b=W1Q6dP6533MDJp23F2cMqCTgyBQVBo5tInt1LzmVEOFpc6FLafSFAbRRR8mpOmqEwoUGYx
 f/mvsUzvdHxRNu0t+SF5tz81yhU9PL9gMYsUVqG3YQLZb0kyW0NF2QNC8SSilxbM6MN0hk
 WUDzg6YburZSLdOqg2VCW806g5CnvQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-0vEIdz09Oj6BqXCD-D2qiQ-1; Thu, 07 Jan 2021 07:42:25 -0500
X-MC-Unique: 0vEIdz09Oj6BqXCD-D2qiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27A8B803622;
 Thu,  7 Jan 2021 12:42:24 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-252.ams2.redhat.com
 [10.36.114.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B7B810013BD;
 Thu,  7 Jan 2021 12:42:18 +0000 (UTC)
Subject: Re: [PATCH v3 2/5] file-posix: add sg_get_max_segments that actually
 works with sg
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201217165612.942849-1-mlevitsk@redhat.com>
 <20201217165612.942849-3-mlevitsk@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5f05e682-157c-424e-6284-604bb964147b@redhat.com>
Date: Thu, 7 Jan 2021 13:42:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217165612.942849-3-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Tom Yan <tom.ty89@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.20 17:56, Maxim Levitsky wrote:
> From: Tom Yan <tom.ty89@gmail.com>
> 
> sg devices have different major/minor than their corresponding
> block devices. Using sysfs to get max segments never really worked
> for them.
> 
> Fortunately the sg driver provides an ioctl to get sg_tablesize,
> which is apparently equivalent to max segments.
> 
> Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   block/file-posix.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index cbf1271773..2bf4d095a7 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1179,6 +1179,26 @@ static int sg_get_max_transfer_length(int fd)
>   #endif
>   }
>   
> +static int sg_get_max_segments(int fd)
> +{
> +    /*
> +     * /dev/sg* character devices report 'max_segments' via
> +     * SG_GET_SG_TABLESIZE ioctl
> +     */
> +
> +#ifdef SG_GET_SG_TABLESIZE
> +    long max_segments = 0;
> +
> +    if (ioctl(fd, SG_GET_SG_TABLESIZE, &max_segments) == 0) {

As far as I can tell from googling, SG_GET_SG_TABLESIZE takes an int 
pointer.

Apart from that, looks good.

Max

> +        return max_segments;
> +    } else {
> +        return -errno;
> +    }
> +#else
> +    return -ENOSYS;
> +#endif
> +}
> +
>   static int get_max_transfer_length(int fd)
>   {
>   #if defined(BLKSECTGET)
> @@ -1265,7 +1285,7 @@ static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
>           bs->bl.max_transfer = pow2floor(ret);
>       }
>   
> -    ret = get_max_segments(s->fd);
> +    ret = bs->sg ? sg_get_max_segments(s->fd) : get_max_segments(s->fd);
>       if (ret > 0) {
>           bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
>                                              ret * qemu_real_host_page_size);
> 


