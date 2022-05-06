Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43F51D816
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 14:44:23 +0200 (CEST)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmxJm-0006q5-Qk
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 08:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nmwzB-00007P-1j
 for qemu-devel@nongnu.org; Fri, 06 May 2022 08:23:05 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:56426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nmwz7-0006Gb-Rx
 for qemu-devel@nongnu.org; Fri, 06 May 2022 08:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651839778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G0omzTmM8PJl+sJl+odY7k4o5IMXiJ2dNR//Z2a+Jac=;
 b=VOXnpFX5jP7eUFoWjEpgR5c2OHfzzJv7LWw11uOmpVcXAOEkNxAnGMxrH7xdoUMze1uJj/
 8xQi32eDRLw5+M4XQoKUfA9CN4Zn1XdvWl4uQgAz8jnngpIjAvoLz9WpVM6pV3zcMlT/qm
 eNj/4lGF6r1GJlaM72Czur+eqfvdiz0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-osGXEcHYOjWO3515SPxnWg-1; Fri, 06 May 2022 08:22:56 -0400
X-MC-Unique: osGXEcHYOjWO3515SPxnWg-1
Received: by mail-wr1-f70.google.com with SMTP id
 j27-20020adfb31b000000b0020c4ca11566so2509220wrd.14
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 05:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=G0omzTmM8PJl+sJl+odY7k4o5IMXiJ2dNR//Z2a+Jac=;
 b=kRo1AlpgWJ80Fn72q8J2CDBHwo2LmmLCXhdqTThku7qvcfHnVZBYD+DuXemVG2kHGj
 A8uV1gsuq8zy+yusWD/jn1lunkW0uTZb6Lwb9pHzcoaCjyGkH/3sR3D5PfNyRfeW5Egz
 F19WFjNfSLuaFlXrZe6Umpmhg1tzx+sryv4Zoohfr3bvgUMhgjzzSNAmXk0rY38muaHY
 ghdyT27HUNJYXqj7VGlkj1+Z9MDa0GwsRy+OmhTTnzjIq61CqSTvXoKlN27Sb3pjdrwb
 6xfbgwfeGfd37edTVqdD6FC0lu+6M1P3kCXzThuKvXrnxA92re/K7i2k8p1V8jvml1P0
 Le6Q==
X-Gm-Message-State: AOAM531DZQ8ZQWXune/3xQMEBDMX9DldtfHrvAn/ctWKS7uwgC7ULCG4
 hrpPAas9udYgll6rA/BLkEz2ejhz1hFuGoQi+pIm9BnH4M5NyUjZ/EfGMeEKcQJjQkbyK27+lil
 rJKZLTUMBui98dw8=
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr2463933wry.342.1651839775760; 
 Fri, 06 May 2022 05:22:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT9Wm50bTx2qxiqKnMFY9KTXrudFcEvBtWkmOMB8hCzjiC3Lz9wZCn6vcPOWJhRUyJyKXxxA==
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr2463917wry.342.1651839775496; 
 Fri, 06 May 2022 05:22:55 -0700 (PDT)
Received: from sgarzare-redhat (host-82-57-51-85.retail.telecomitalia.it.
 [82.57.51.85]) by smtp.gmail.com with ESMTPSA id
 n21-20020a7bc5d5000000b003942a244f47sm9654583wmk.32.2022.05.06.05.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 05:22:54 -0700 (PDT)
Date: Fri, 6 May 2022 14:22:51 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, mst@redhat.com,
 eperezma@redhat.com, eli@mellanox.com
Subject: Re: [PATCH v3 5/6] vhost-vdpa: backend feature should set only once
Message-ID: <20220506122251.336r27ydv4vlamzr@sgarzare-redhat>
References: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
 <1651812874-31967-6-git-send-email-si-wei.liu@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1651812874-31967-6-git-send-email-si-wei.liu@oracle.com>
Received-SPF: pass client-ip=170.10.129.74; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 05, 2022 at 09:54:33PM -0700, Si-Wei Liu wrote:
>The vhost_vdpa_one_time_request() branch in
>vhost_vdpa_set_backend_cap() incorrectly sends down
>ioctls on vhost_dev with non-zero index. This may
>end up with multiple VHOST_SET_BACKEND_FEATURES
>ioctl calls sent down on the vhost-vdpa fd that is
>shared between all these vhost_dev's.
>
>To fix it, send down ioctl only once via the first
>vhost_dev with index 0. For more readibility of
>code, vhost_vdpa_one_time_request() is renamed to
>vhost_vdpa_first_dev() with polarity flipped.

Sorry for being late, you may have already discussed this, but IMHO it 
would be better to split this patch into two:
- fix the problem in vhost_vdpa_set_backend_cap()
- change name and polarity of vhost_vdpa_one_time_request()

Thanks,
Stefano

>This call is only applicable to the request that
>performs operation before setting up queues, and
>usually at the beginning of operation. Document
>the requirement for it in place.
>
>Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>Acked-by: Jason Wang <jasowang@redhat.com>
>Acked-by: Eugenio Pérez <eperezma@redhat.com>
>---
> hw/virtio/vhost-vdpa.c | 23 +++++++++++++++--------
> 1 file changed, 15 insertions(+), 8 deletions(-)
>
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index 8adf7c0..fd1268e 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -366,11 +366,18 @@ static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
>                                     v->iova_range.last);
> }
>
>-static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
>+/*
>+ * The use of this function is for requests that only need to be
>+ * applied once. Typically such request occurs at the beginning
>+ * of operation, and before setting up queues. It should not be
>+ * used for request that performs operation until all queues are
>+ * set, which would need to check dev->vq_index_end instead.
>+ */
>+static bool vhost_vdpa_first_dev(struct vhost_dev *dev)
> {
>     struct vhost_vdpa *v = dev->opaque;
>
>-    return v->index != 0;
>+    return v->index == 0;
> }
>
> static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
>@@ -451,7 +458,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>
>     vhost_vdpa_get_iova_range(v);
>
>-    if (vhost_vdpa_one_time_request(dev)) {
>+    if (!vhost_vdpa_first_dev(dev)) {
>         return 0;
>     }
>
>@@ -594,7 +601,7 @@ static int vhost_vdpa_memslots_limit(struct vhost_dev *dev)
> static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
>                                     struct vhost_memory *mem)
> {
>-    if (vhost_vdpa_one_time_request(dev)) {
>+    if (!vhost_vdpa_first_dev(dev)) {
>         return 0;
>     }
>
>@@ -623,7 +630,7 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
>     struct vhost_vdpa *v = dev->opaque;
>     int ret;
>
>-    if (vhost_vdpa_one_time_request(dev)) {
>+    if (!vhost_vdpa_first_dev(dev)) {
>         return 0;
>     }
>
>@@ -665,7 +672,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>
>     features &= f;
>
>-    if (vhost_vdpa_one_time_request(dev)) {
>+    if (vhost_vdpa_first_dev(dev)) {
>         r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
>         if (r) {
>             return -EFAULT;
>@@ -1118,7 +1125,7 @@ static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
>                                      struct vhost_log *log)
> {
>     struct vhost_vdpa *v = dev->opaque;
>-    if (v->shadow_vqs_enabled || vhost_vdpa_one_time_request(dev)) {
>+    if (v->shadow_vqs_enabled || !vhost_vdpa_first_dev(dev)) {
>         return 0;
>     }
>
>@@ -1240,7 +1247,7 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
>
> static int vhost_vdpa_set_owner(struct vhost_dev *dev)
> {
>-    if (vhost_vdpa_one_time_request(dev)) {
>+    if (!vhost_vdpa_first_dev(dev)) {
>         return 0;
>     }
>
>-- 
>1.8.3.1
>


