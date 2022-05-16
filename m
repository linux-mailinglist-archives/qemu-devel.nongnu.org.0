Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D75528489
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:50:05 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqaAm-0004QG-Cz
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9t-0002yx-4y
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:41:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9p-000612-Rj
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q69k5cWYAalTMRjYeidAhJv4ss2mlbT9fBKmZgfvc8U=;
 b=bXPUchGVLsDghjDULkr+/VbQ0VblMtQP/uNizye5rF1ftKxthaLIHS8G+68GGn4C2lubkk
 toqEbNw4K7WgQ0520md07n8YHUij2XlQgGYtGbUjUgqVPISzEDJXhMa2CCWJ0lbg12ikdI
 Bmxog+JlHJnYA1VkRuEQx9AsBwrAfGw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-vWdOS0kjMeKgRb4iLTDibA-1; Mon, 16 May 2022 06:40:55 -0400
X-MC-Unique: vWdOS0kjMeKgRb4iLTDibA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v126-20020a1cac84000000b00396fe5959d2so2052436wme.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q69k5cWYAalTMRjYeidAhJv4ss2mlbT9fBKmZgfvc8U=;
 b=hIjY2PT087M4ROwW7gfsajLW4itmDLHpe1b1Ybg4KjXh54fzmCuzHsr/xsEY+YbTX6
 vhhoviitDfl0YR5unhSZiDfJ+8HpL52R/TuViKtKupqJ/vDYLeWRg3S4RjAjnyPNUX3E
 poyJG+ELHhA8VzEdvMGGdYJriBTi+ROgpa4evHGBOfkhN628UaD1QnGqbVrsUMBdY46m
 eXQlK6EbKTfQA5eXgAI9Envf/Vaxhdcb/qCxSDSvdNp53MqNfh9MyGs8fUazhfeiLlR5
 xTTqxfuJYN5AjIJxCtWB69GRKzpV4zyN2tyXODbZcYGJr4/utfxJCe8LMhIb2m5pPsD5
 QCFA==
X-Gm-Message-State: AOAM530pLYRBw5BAttVekLEcOP5VNpLy1dBZg0SzxXm25hy+uI7poc+y
 gGbnCxUZ14peeVAM+pWrJVnpyTNuywcdepSE4t+e1aWR660xFGMhoSADMkaE7pS+16UMHC1mWOe
 ZPR/9DbWrFGYmFzfi92sTvTtZQbvM4tBIuwQPUnfh0ll6SIePW/bPEFvzHHwj
X-Received: by 2002:a1c:4d0d:0:b0:394:4de:539 with SMTP id
 o13-20020a1c4d0d000000b0039404de0539mr25867636wmh.124.1652697654165; 
 Mon, 16 May 2022 03:40:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVHng5nysDGMCoPVdQRzmfVvn1rt3y4Gk/lJhIQHFY8VaavuX4M0a9ovcjvc6w1kv28vvzwA==
X-Received: by 2002:a1c:4d0d:0:b0:394:4de:539 with SMTP id
 o13-20020a1c4d0d000000b0039404de0539mr25867612wmh.124.1652697653874; 
 Mon, 16 May 2022 03:40:53 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 p2-20020adfaa02000000b0020cd0762f37sm9118918wrd.107.2022.05.16.03.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:53 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 90/91] vhost-vdpa: change name and polarity for
 vhost_vdpa_one_time_request()
Message-ID: <20220516095448.507876-91-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

From: Si-Wei Liu <si-wei.liu@oracle.com>

The name vhost_vdpa_one_time_request() was confusing. No
matter whatever it returns, its typical occurrence had
always been at requests that only need to be applied once.
And the name didn't suggest what it actually checks for.
Change it to vhost_vdpa_first_dev() with polarity flipped
for better readibility of code. That way it is able to
reflect what the check is really about.

This call is applicable to request which performs operation
only once, before queues are set up, and usually at the beginning
of the caller function. Document the requirement for it in place.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Message-Id: <1651890498-24478-7-git-send-email-si-wei.liu@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 870ab74b04..66f054a12c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -368,11 +368,18 @@ static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
                                     v->iova_range.last);
 }
 
-static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
+/*
+ * The use of this function is for requests that only need to be
+ * applied once. Typically such request occurs at the beginning
+ * of operation, and before setting up queues. It should not be
+ * used for request that performs operation until all queues are
+ * set, which would need to check dev->vq_index_end instead.
+ */
+static bool vhost_vdpa_first_dev(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v = dev->opaque;
 
-    return v->index != 0;
+    return v->index == 0;
 }
 
 static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
@@ -453,7 +460,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 
     vhost_vdpa_get_iova_range(v);
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -596,7 +603,7 @@ static int vhost_vdpa_memslots_limit(struct vhost_dev *dev)
 static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
                                     struct vhost_memory *mem)
 {
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -625,7 +632,7 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
     struct vhost_vdpa *v = dev->opaque;
     int ret;
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -667,7 +674,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 
     features &= f;
 
-    if (!vhost_vdpa_one_time_request(dev)) {
+    if (vhost_vdpa_first_dev(dev)) {
         r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
         if (r) {
             return -EFAULT;
@@ -1120,7 +1127,7 @@ static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
                                      struct vhost_log *log)
 {
     struct vhost_vdpa *v = dev->opaque;
-    if (v->shadow_vqs_enabled || vhost_vdpa_one_time_request(dev)) {
+    if (v->shadow_vqs_enabled || !vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -1242,7 +1249,7 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
 
 static int vhost_vdpa_set_owner(struct vhost_dev *dev)
 {
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
-- 
MST


