Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40D93878F4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:37:09 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liyyC-0006WW-Qx
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1liyoM-0004Ek-UV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:26:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1liyoK-0004il-FF
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621340814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gxu4dXdf0eOqXf14fATiu/H99i4nPLwxb/xOalwebso=;
 b=AtBB4GroxBuUQvWKUZSB28SsyXSRxIAzHMmnO+nOBeKjKINreJOrL2UUOYCcRT7RPWB/cI
 l4Ez94cR/AjGbT5AkzYH7xhfpfFMoygODZ1YLjswguWiM8T5T+Ifk6NdtOx13P+EnGkoC/
 QrRsduFvo/KWjHVaDlLRM2aWpuShHLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-dTrK5jZSMiS72GhynqYEbw-1; Tue, 18 May 2021 08:26:53 -0400
X-MC-Unique: dTrK5jZSMiS72GhynqYEbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 564B5107ACE3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:26:52 +0000 (UTC)
Received: from work-vm (ovpn-115-45.ams2.redhat.com [10.36.115.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 162225D9C0;
 Tue, 18 May 2021 12:26:47 +0000 (UTC)
Date: Tue, 18 May 2021 13:26:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 5/7] virtiofsd: Simplify skip byte logic
Message-ID: <YKOyhfMDmahKOxsj@work-vm>
References: <20210511213736.281016-1-vgoyal@redhat.com>
 <20210511213736.281016-6-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511213736.281016-6-vgoyal@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> We need to skip bytes in two cases.
> 
> a. Before we start reading into in_sg, we need to skip iov_len bytes
>    in the beginning which typically will have fuse_out_header.
> 
> b. If preadv() does a short read, then we need to retry preadv() with
>    remainig bytes and skip the bytes preadv() read in short read.
> 
> For case a, there is no reason that skipping logic be inside the while
> loop. Move it outside. And only retain logic "b" inside while loop.
> 
> Also get rid of variable "skip_size". Looks like we can do without it.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Yep, now iov_discard_front makes it easy to skip.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_virtio.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index ccad2b3f8a..434fe401cf 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -392,17 +392,11 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>      unsigned int in_sg_cpy_count = in_num;
>  
>      /* skip over parts of in_sg that contained the header iov */
> -    size_t skip_size = iov_len;
> +    iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, iov_len);
>  
>      do {
> -        if (skip_size != 0) {
> -	    iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, skip_size);
> -        }
> -
> -        fuse_log(FUSE_LOG_DEBUG,
> -                 "%s: after skip skip_size=%zd in_sg_cpy_count=%d "
> -                 "len remaining=%zd\n", __func__, skip_size, in_sg_cpy_count,
> -                 len);
> +        fuse_log(FUSE_LOG_DEBUG, "%s: in_sg_cpy_count=%d len remaining=%zd\n",
> +                 __func__, in_sg_cpy_count, len);
>  
>          ret = preadv(buf->buf[0].fd, in_sg_ptr, in_sg_cpy_count,
>                       buf->buf[0].pos);
> @@ -421,7 +415,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>          if (ret < len && ret) {
>              fuse_log(FUSE_LOG_DEBUG, "%s: ret < len\n", __func__);
>              /* Skip over this much next time around */
> -            skip_size = ret;
> +            iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, ret);
>              buf->buf[0].pos += ret;
>              len -= ret;
>  
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


