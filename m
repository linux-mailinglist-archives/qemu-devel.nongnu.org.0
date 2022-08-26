Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D40E5A2B30
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:27:33 +0200 (CEST)
Received: from localhost ([::1]:57910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbF6-0007Yj-52
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oRaOe-0004FL-Lb; Fri, 26 Aug 2022 10:33:23 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:39754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oRaOb-0007As-DL; Fri, 26 Aug 2022 10:33:18 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 8A29A2E19C4;
 Fri, 26 Aug 2022 17:33:09 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b581::1:d])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7Ht2PirWaX-X8OqY4aI; Fri, 26 Aug 2022 17:33:08 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661524388; bh=AJeK5QA+uKLglCU8RKDByafd9uOq9TDrqs96cImo3aw=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=o8brJpHKcFDxyZ0VnHoENbRIR4lEHUe7bz0xSyBViy739JySfUCh7n4cITkSA/kZs
 7YAWhX4GtPHhjDgKJCDS5O0MO8PrVTwWQ5JDMt/N/iN1nODv+hGliiSMDMH0JUZES5
 aipnEVEkfrqTZAGCq/5i8zreEIQh2/I3jR7WVbJw=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, mst@redhat.com, stefanha@redhat.com,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, qemu-block@nongnu.org,
 jasowang@redhat.com, d-tatianin@yandex-team.ru
Subject: [PATCH v2 4/8] virtio: remove the virtio_feature_get_config_size
 helper
Date: Fri, 26 Aug 2022 17:32:44 +0300
Message-Id: <20220826143248.580939-5-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This has no more users and is superseded by virtio_get_config_size.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 hw/virtio/virtio.c         | 15 ---------------
 include/hw/virtio/virtio.h |  3 ---
 2 files changed, 18 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 8518382025..c0bf8dd6fd 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2999,21 +2999,6 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
     return ret;
 }
 
-size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes,
-                                      uint64_t host_features)
-{
-    size_t config_size = 0;
-    int i;
-
-    for (i = 0; feature_sizes[i].flags != 0; i++) {
-        if (host_features & feature_sizes[i].flags) {
-            config_size = MAX(feature_sizes[i].end, config_size);
-        }
-    }
-
-    return config_size;
-}
-
 size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
                               uint64_t host_features)
 {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 1991c58d9b..f3ff6710d5 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -53,9 +53,6 @@ typedef struct VirtIOConfigSizeParams {
 size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
                               uint64_t host_features);
 
-size_t virtio_feature_get_config_size(const VirtIOFeature *features,
-                                      uint64_t host_features);
-
 typedef struct VirtQueue VirtQueue;
 
 #define VIRTQUEUE_MAX_SIZE 1024
-- 
2.25.1


