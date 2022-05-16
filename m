Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9FC529364
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 00:10:23 +0200 (CEST)
Received: from localhost ([::1]:57398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiv0-0000Vk-Nl
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 18:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhl5-0004GT-PR
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:56:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhl4-0007E9-3P
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q69k5cWYAalTMRjYeidAhJv4ss2mlbT9fBKmZgfvc8U=;
 b=eTu2ppQavkIK9f+8U7cOBpbyyn7SG1HWPSm74cC8Y2AkJhEESVv6hdzbbhpMbRRwCqlUhL
 ikEMA7zzeiSAmhOCLvdJhWzb1eVxYD3dA9ExZobkRONlV7X4XT4ZbvFY1qSKwvP9NmMZ2V
 tZ+e2oNefQAQ9Bg/hKfinogx3VkOsD8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-acbpK9XJM0-9dK6pvdh_iw-1; Mon, 16 May 2022 16:56:00 -0400
X-MC-Unique: acbpK9XJM0-9dK6pvdh_iw-1
Received: by mail-ed1-f72.google.com with SMTP id
 n12-20020aa7c44c000000b0042ab2159b3eso2546336edr.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q69k5cWYAalTMRjYeidAhJv4ss2mlbT9fBKmZgfvc8U=;
 b=Di1yMfiScO35loS84yhQC28J9ozsMmMC16GKL3PVfPGh7iO6xIa2yVreywfgtsDbSx
 gTJxbR1VrrpCIXYDE37C2p6HiXyePWdpfmV367pKWXxzKesmwaJBf2pNZucumF6y413s
 jpNoZpzgYxUuuPrOo0MrPWEZzYmLs/WVEu2f+NcpimYC0lwdN2j791gAx0FAUN1quz+F
 eAllmRidzRebbSFQLstas3fFdxGuLcnrAgrIuAlkCfIMpX8AnjWQxVavUIqUvEsxUO+c
 Syw6ojo8Y68GHWtU8GE3ZIUpvQxKfAUb0Vmx/0gXhmwfvuny9Ipciljk1qjZgpw67pva
 ttCA==
X-Gm-Message-State: AOAM532ZwuOcfIU+4XyousQodzxU3N7EEGkqcpHg68E3HX6MLcK8DMo4
 kIrQMIEH63G29sInSJBAo7zGDc7buqflR0ObsVWHnUiEf9pT4T0779mWL6Ux5PclM8y3SsfOPiZ
 DqnvSASd4A5mUYmQZzU+ZJAoDGcsdBivW/QIxrDwYMeyXt/RmQVhyzhbWYrZ5
X-Received: by 2002:a17:906:2883:b0:6e8:7012:4185 with SMTP id
 o3-20020a170906288300b006e870124185mr16426508ejd.204.1652734558822; 
 Mon, 16 May 2022 13:55:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8fbI5rfZ7fG+JnHtkUjVArTHpbTEL8RQCAfi+nZfAo97dSdJEUncCeogjyWJwNycI/JVLYA==
X-Received: by 2002:a17:906:2883:b0:6e8:7012:4185 with SMTP id
 o3-20020a170906288300b006e870124185mr16426483ejd.204.1652734558528; 
 Mon, 16 May 2022 13:55:58 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 gz27-20020a170907a05b00b006f3ef214df8sm164387ejc.94.2022.05.16.13.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:58 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 84/86] vhost-vdpa: change name and polarity for
 vhost_vdpa_one_time_request()
Message-ID: <20220516204913.542894-85-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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


