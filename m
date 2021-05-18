Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBC4387886
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:14:48 +0200 (CEST)
Received: from localhost ([::1]:47612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liycZ-0008G1-5h
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1liyYw-0004Y1-A2
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:11:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1liyYq-0004Pn-0H
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621339854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M+Z4eQhmavNlCPYyICDaPUVEnnQ0k/btTeSB8dY+VtQ=;
 b=UrI6z5XKdrrIWXJlTG942a8hF/2qGh635j3WB4T1U+NpprZhlCb82cgSZSJ45i+CMzzZFe
 DZvgp79Els9+AxMGzhagO9fr5NdojM5HI+Z8C0DvkWSDzO3wJslbQt7OCeIpYsQ8JQOT4X
 DB9uwcxegco/4P2gfdzc0q0G41E3d8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-lCv21t2VNpqP-cVqvGTL_w-1; Tue, 18 May 2021 08:10:52 -0400
X-MC-Unique: lCv21t2VNpqP-cVqvGTL_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12788800D55
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:10:52 +0000 (UTC)
Received: from work-vm (ovpn-115-45.ams2.redhat.com [10.36.115.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B3A35C1C5;
 Tue, 18 May 2021 12:10:44 +0000 (UTC)
Date: Tue, 18 May 2021 13:10:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 3/7] virtiofsd: Use iov_discard_front() to skip bytes
Message-ID: <YKOuwXRixkhFa9vW@work-vm>
References: <20210511213736.281016-1-vgoyal@redhat.com>
 <20210511213736.281016-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511213736.281016-4-vgoyal@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
> There are places where we need to skip few bytes from front of the iovec
> array. We have our own custom code for that. Looks like iov_discard_front()
> can do same thing. So use that helper instead.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Oh nice; I hadn't noticed that file; I bet there are loads of other
places that can use it (and I still don't get why iov functions aren't
part of libc)


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_virtio.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 5dcd08fccb..d56b225800 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -389,23 +389,15 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>      memcpy(in_sg_cpy, in_sg, sizeof(struct iovec) * in_num);
>      /* These get updated as we skip */
>      struct iovec *in_sg_ptr = in_sg_cpy;
> -    int in_sg_cpy_count = in_num;
> +    unsigned int in_sg_cpy_count = in_num;
>  
>      /* skip over parts of in_sg that contained the header iov */
>      size_t skip_size = iov_len;
>  
>      size_t in_sg_left = 0;
>      do {
> -        while (skip_size != 0 && in_sg_cpy_count) {
> -            if (skip_size >= in_sg_ptr[0].iov_len) {
> -                skip_size -= in_sg_ptr[0].iov_len;
> -                in_sg_ptr++;
> -                in_sg_cpy_count--;
> -            } else {
> -                in_sg_ptr[0].iov_len -= skip_size;
> -                in_sg_ptr[0].iov_base += skip_size;
> -                break;
> -            }
> +        if (skip_size != 0) {
> +	    iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, skip_size);
>          }
>  
>          int i;
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


