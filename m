Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86623FDDEE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:44:57 +0200 (CEST)
Received: from localhost ([::1]:49146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRU0-00067T-Mh
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLMEB-0003W5-O2
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:15 -0400
Received: from relay.sw.ru ([185.231.240.75]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME6-0005OU-1M
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=c3dOGEHsnOZpdJ7FWaBjC7ETDtLHO0PC4IyBH1MkttQ=; b=F2Mbn00vbbKr
 yr1En0kxKKe0CsZ0M6zKjTI5OrsGDIswVuoCki85GArYuc/Nf0uljxyZK83OdXSuL1DunsoT+gxFl
 bFPd57rJtlMuAz/2yDN0oK85iAQ52Xeipr7lkmC4aaCZJEZJKlcEE0ya9XlB7sz56CR7rl8V/tek0
 qDd0k=;
Received: from [192.168.15.100] (helo=max-Swift-SF314-57.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME1-000RwD-7b; Wed, 01 Sep 2021 12:08:05 +0300
From: Maxim Davydov <maxim.davydov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@openvz.org, mst@redhat.com, stefanha@redhat.com, fam@euphon.net,
 amit@kernel.org, kraxel@redhat.com, berrange@redhat.com,
 Maxim Davydov <maxim.davydov@virtuozzo.com>
Subject: [PATCH v1 8/8] virtio-balloon: Add tracking of the virtio guest
 feature bits
Date: Wed,  1 Sep 2021 12:08:04 +0300
Message-Id: <20210901090804.7139-9-maxim.davydov@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
References: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=maxim.davydov@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Sep 2021 10:43:12 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add tracking of the bits acknowledged by the guest

Signed-off-by: Maxim Davydov <maxim.davydov@virtuozzo.com>
---
 hw/virtio/virtio-balloon.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 4b5d9e5..61575b7 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -1029,14 +1029,18 @@ static const VMStateDescription vmstate_virtio_balloon = {
 };
 
 static Property virtio_balloon_properties[] = {
-    DEFINE_PROP_BIT("deflate-on-oom", VirtIOBalloon, host_features,
-                    VIRTIO_BALLOON_F_DEFLATE_ON_OOM, false),
-    DEFINE_PROP_BIT("free-page-hint", VirtIOBalloon, host_features,
-                    VIRTIO_BALLOON_F_FREE_PAGE_HINT, false),
-    DEFINE_PROP_BIT("page-poison", VirtIOBalloon, host_features,
-                    VIRTIO_BALLOON_F_PAGE_POISON, true),
-    DEFINE_PROP_BIT("free-page-reporting", VirtIOBalloon, host_features,
-                    VIRTIO_BALLOON_F_REPORTING, false),
+    DEFINE_VIRTIO_FEATURE_BIT("deflate-on-oom", VirtIOBalloon, host_features,
+                              parent_obj.guest_features,
+                              VIRTIO_BALLOON_F_DEFLATE_ON_OOM, false),
+    DEFINE_VIRTIO_FEATURE_BIT("free-page-hint", VirtIOBalloon, host_features,
+                              parent_obj.guest_features,
+                              VIRTIO_BALLOON_F_FREE_PAGE_HINT, false),
+    DEFINE_VIRTIO_FEATURE_BIT("page-poison", VirtIOBalloon, host_features,
+                              parent_obj.guest_features,
+                              VIRTIO_BALLOON_F_PAGE_POISON, true),
+    DEFINE_VIRTIO_FEATURE_BIT("free-page-reporting", VirtIOBalloon,
+                              host_features, parent_obj.guest_features,
+                              VIRTIO_BALLOON_F_REPORTING, false),
     /* QEMU 4.0 accidentally changed the config size even when free-page-hint
      * is disabled, resulting in QEMU 3.1 migration incompatibility.  This
      * property retains this quirk for QEMU 4.1 machine types.
-- 
1.8.3.1


