Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825432ED08D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 14:22:46 +0100 (CET)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVFV-0007rY-KV
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 08:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kxVCk-0006pj-TW
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:19:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kxVCi-0005Ia-Mf
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 08:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610025590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VE7zjZnzfhm9YK1ILnDVyK51WHxbNFGI+vtDwWhewFE=;
 b=aZv433oFEE6CJlSo4TsrVRquIPk+2qnUlmVGfKixihph+315HxfvsF4Fs6vGkCQr9a0o7u
 mT22XcyRaSrDtNb+EEbMakqVWw/rG0y7WspdOhVxrfhsQV60yN/A1yqEtP7uaVbErA4Nxo
 EFwS6pQw0jkJT6gXFNI0cnzwqLkWFBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-PyCwAhFHPqWQ8UelZJ_Vsg-1; Thu, 07 Jan 2021 08:19:49 -0500
X-MC-Unique: PyCwAhFHPqWQ8UelZJ_Vsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF3D01005504;
 Thu,  7 Jan 2021 13:19:47 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-252.ams2.redhat.com
 [10.36.114.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92B5719C66;
 Thu,  7 Jan 2021 13:19:42 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] block: use blk_get_max_ioctl_transfer for SCSI
 passthrough
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201217165612.942849-1-mlevitsk@redhat.com>
 <20201217165612.942849-5-mlevitsk@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6570e450-1157-cc6e-dd13-1bde3ae51f0a@redhat.com>
Date: Thu, 7 Jan 2021 14:19:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217165612.942849-5-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Switch file-posix to expose only the max_ioctl_transfer limit.
> 
> Let the iscsi driver work as it did before since it is bound by the transfer
> limit in both regular read/write and in SCSI passthrough case.
> 
> Switch the scsi-disk and scsi-block drivers to read the SG max transfer limits
> using the new blk_get_max_ioctl_transfer interface.
> 
> 
> Fixes: 867eccfed8 ("file-posix: Use max transfer length/segment count only for SCSI passthrough")
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   block/file-posix.c     | 7 ++++---
>   block/iscsi.c          | 1 +
>   hw/scsi/scsi-generic.c | 4 ++--
>   3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 2bf4d095a7..c34a7a9599 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1282,13 +1282,14 @@ static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
>                          get_max_transfer_length(s->fd);
>   
>       if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
> -        bs->bl.max_transfer = pow2floor(ret);
> +        bs->bl.max_ioctl_transfer = pow2floor(ret);
>       }
>   
>       ret = bs->sg ? sg_get_max_segments(s->fd) : get_max_segments(s->fd);
>       if (ret > 0) {
> -        bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
> -                                           ret * qemu_real_host_page_size);
> +        bs->bl.max_ioctl_transfer =
> +            MIN_NON_ZERO(bs->bl.max_ioctl_transfer,
> +                         ret * qemu_real_host_page_size);
>       }

Do non-SG devices even have a max transfer length then?  I would’ve 
thought max_ioctl_transfer simply doesn’t apply to them and so could be 
left 0.


(Rest looks good – from what I can tell...)

Max

>   
>       raw_refresh_limits(bs, errp);


