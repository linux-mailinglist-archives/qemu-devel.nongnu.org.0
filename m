Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B54EC9A5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 18:27:00 +0200 (CEST)
Received: from localhost ([::1]:56292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZb9w-00075G-1j
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 12:27:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nZb7M-0003lx-EL
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:24:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nZb7J-0008Cn-OP
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:24:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648657456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nNh0jyVwRpxZY1X2S5//5oRq5Se/jf3j+y6HiBfbC+U=;
 b=iOwP9mhI4fYoyCzXhjNWUjMcJj1ms1wsO2BPxReD9vV/iEWuuMEr4Y5t00FLrEUosSwj6o
 wae+Qhf3WTFfPHdl3kfEUajv5TnBLIRG6uTiEyZ5LLGHaImsMxJQFkcGLt2F9JoThfh3eG
 gJdyIVF44l2GxIbXp/DIxdu9SKchFoA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-yI4o_bhuObqHcdpOnunLUQ-1; Wed, 30 Mar 2022 12:24:14 -0400
X-MC-Unique: yI4o_bhuObqHcdpOnunLUQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 h11-20020ac87d4b000000b002e1c9a3ae51so17845075qtb.0
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 09:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nNh0jyVwRpxZY1X2S5//5oRq5Se/jf3j+y6HiBfbC+U=;
 b=keyX+pGkaj/sjgUrG2v7FOg/a1D5/EJYuH8HayS750zR7qoKkS7aqsEkDJFZPs04ad
 a9xHu7QAO4RqAY07CGVR+x+6EtWNrRtLZxcF9n/nLNCmpB22RPCVGWSblnK++Ij2sCBS
 GN3jGoJbHrFZ0hi9f1aJ21MGZlOI8CuKah7VXzg+asx2Y0Oba5HhnYP7l07p6lQVcNJb
 P3ds0uPi41R79HTT/GTa9EIvhReGXDGYUGO39r5ReNqP4g0iHzreMxiFdnzz/0yg1fAa
 o0BW6JvpbvtlLlUkl+fO5G+2AIjPf0+hT5ET0Z0AK+IxSCttRg943h+i5vKmv+ffitn2
 f+FA==
X-Gm-Message-State: AOAM5300x0FwrQtepgKA1CpTtiH+7TEELVt3UuvyquryhfYwGRE1Zjr1
 U5HaH5xN7zHAtFVKd+5RiA5kojNQ4yvnRS3CEH335vFygf4iFCXuT1e4r1hoHB3acHxjXRvEZtY
 kp7CnNBRpO+5k7D4=
X-Received: by 2002:a05:622a:13cf:b0:2e2:3535:56ae with SMTP id
 p15-20020a05622a13cf00b002e2353556aemr279747qtk.373.1648657454384; 
 Wed, 30 Mar 2022 09:24:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqKHMugAxxgLhkoefY0Fjl5zmtT/kEqz5dAzdivs30VShIQ79nva5c4WTm+3dNEA7vDjL4AA==
X-Received: by 2002:a05:622a:13cf:b0:2e2:3535:56ae with SMTP id
 p15-20020a05622a13cf00b002e2353556aemr279714qtk.373.1648657454107; 
 Wed, 30 Mar 2022 09:24:14 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-67.retail.telecomitalia.it.
 [79.46.200.67]) by smtp.gmail.com with ESMTPSA id
 f8-20020ac859c8000000b002e232e04cafsm18562757qtf.88.2022.03.30.09.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 09:24:13 -0700 (PDT)
Date: Wed, 30 Mar 2022 18:24:06 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
Message-ID: <20220330162406.62cnedwmn4zn6ars@sgarzare-redhat>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eperezma@redhat.com, jasowang@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, eli@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 11:33:17PM -0700, Si-Wei Liu wrote:
>The vhost_vdpa_one_time_request() branch in
>vhost_vdpa_set_backend_cap() incorrectly sends down
>iotls on vhost_dev with non-zero index. This may

Little typo s/iotls/ioctls

>end up with multiple VHOST_SET_BACKEND_FEATURES
>ioctl calls sent down on the vhost-vdpa fd that is
>shared between all these vhost_dev's.
>
>To fix it, send down ioctl only once via the first
>vhost_dev with index 0. Toggle the polarity of the
>vhost_vdpa_one_time_request() test would do the trick.
>
>Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>---
> hw/virtio/vhost-vdpa.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index c5ed7a3..27ea706 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>
>     features &= f;
>
>-    if (vhost_vdpa_one_time_request(dev)) {
>+    if (!vhost_vdpa_one_time_request(dev)) {
>         r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
>         if (r) {
>             return -EFAULT;
>-- 
>1.8.3.1
>
>

With that:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>



Unrelated to this patch, but the name vhost_vdpa_one_time_request() is 
confusing IMHO.

Not that I'm good with names, but how about we change it to 
vhost_vdpa_skip_one_time_request()?

Thanks,
Stefano


