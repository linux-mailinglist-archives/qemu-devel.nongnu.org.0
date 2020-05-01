Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0F21C1B55
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 19:13:50 +0200 (CEST)
Received: from localhost ([::1]:46428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUZET-0007Y8-BU
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 13:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jUZDa-000739-AQ
 for qemu-devel@nongnu.org; Fri, 01 May 2020 13:12:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jUZDZ-00074A-Bw
 for qemu-devel@nongnu.org; Fri, 01 May 2020 13:12:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49008
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jUZDY-00073k-S4
 for qemu-devel@nongnu.org; Fri, 01 May 2020 13:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588353171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AfcTtOkzFbfeP2SI3l5uBXuaAgeoubRMLPUkeJGyU6Q=;
 b=GS+oUp6c7+V2msQyyFmU7UGwKWaFlKSDqUKl6+7etFG0X/K2GEftnCossMHZvGnVkmy5Br
 ajz3Wh/vP79eniy9oi8pjD84XYvU6bG9WE/ONLgF52fDuT5ivYs1fR+Oz4CJw0SfZxvpXN
 WCI3By32FHY/V3gSjeET8OECg+eDazY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-jDbQYZIxPaOs6V1CWGz8vg-1; Fri, 01 May 2020 13:12:45 -0400
X-MC-Unique: jDbQYZIxPaOs6V1CWGz8vg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74E481005510;
 Fri,  1 May 2020 17:12:44 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02F086152A;
 Fri,  1 May 2020 17:12:42 +0000 (UTC)
Subject: Re: [PATCH] qcow2: Avoid integer wraparound in qcow2_co_truncate()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <20200501131525.6745-1-berto@igalia.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5ba91898-9d3b-d55d-c360-83cca41d88f4@redhat.com>
Date: Fri, 1 May 2020 12:12:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501131525.6745-1-berto@igalia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 12:40:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/20 8:15 AM, Alberto Garcia wrote:
> After commit f01643fb8b47e8a70c04bbf45e0f12a9e5bc54de when an image is
> extended and BDRV_REQ_ZERO_WRITE is set then the new clusters are
> zeroized.
> 
> The code however does not detect correctly situations when the old and
> the new end of the image are within the same cluster. The problem can
> be reproduced with these steps:
> 
>     qemu-img create -f qcow2 backing.qcow2 1M
>     qemu-img create -f qcow2 -b backing.qcow2 top.qcow2

We should get in the habit of documenting -F qcow2 (I have a series, 
still awaiting review, that would warn if you don't).

>     qemu-img resize --shrink top.qcow2 520k
>     qemu-img resize top.qcow2 567k
> 
> In the last step offset - zero_start causes an integer wraparound.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   block/qcow2.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 2ba0b17c39..6d34d28c60 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -4234,6 +4234,9 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
>       if ((flags & BDRV_REQ_ZERO_WRITE) && offset > old_length) {
>           uint64_t zero_start = QEMU_ALIGN_UP(old_length, s->cluster_size);
>   
> +        /* zero_start should not be after the new end of the image */
> +        zero_start = MIN(zero_start, offset);
> +

So, using your numbers, pre-patch, we have zero_start = 0x90000 (0x82000 
rounded up to 0x10000 alignment).  post-patch, the new MIN() lowers it 
back to 0x8dc00 (the new size), which is unaligned.

>           /*
>            * Use zero clusters as much as we can. qcow2_cluster_zeroize()
>            * requires a cluster-aligned start. The end may be unaligned if it is
          * at the end of the image (which it is here).
          */
         ret = qcow2_cluster_zeroize(bs, zero_start, offset - 
zero_start, 0);

pre-patch, it called zeroize(, 0x90000, 0xffffffffffffdc00, )
post-patch, it calls zeroize(, 0x8dc00, 0, )

Looking at qcow2_cluster_zeroize, we have:
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));

which will now trigger.  This patch is a good idea, but needs a v2.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


