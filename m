Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2188C53236C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:42:47 +0200 (CEST)
Received: from localhost ([::1]:57896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntOFi-00074B-6k
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtG-0008D1-5I
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:34 -0400
Received: from mga17.intel.com ([192.55.52.151]:41983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtE-0000HO-F5
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373172; x=1684909172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pfQR45LZch1v1vRjXbsnVrV5Nq/XR+Tvb/OTap5qN9o=;
 b=Ks7j8/WT6b/LaSoeWE8mgCW517oFqKcDQJgbYDRyWztxjGYKN0lrGLvb
 Nu48B6BctitBFM1H4Hw36kd83l0d8OCrOC+XRiE3tL7SYQxM5xTw1ZsVT
 YUCgdHhn1XpxZcU/599VrUGSXbeNTsgUdmb1gVwjn8CTu/vEEblNNE86p
 7Io2wZxYZ8pULrJRvwWosmn0sbYV3ts05rHudHkahSJA5r6+ugvdlD4sn
 jVewAhBYsGESJ1gBgawdI94xWTJfen8h2JpQGlaVtmvDMcPLoE2oaNMOF
 1GQCoapF5O5eLXVpCfvnKodxxEXNoIpYVesYE1g4vGVK8N81pVyCfbrAt A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943221"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943221"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059758"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:27 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 07/13] vfio/migration: move the statistics of
 bytes_transferred to generic VFIO migration layer
Date: Tue, 24 May 2022 14:18:42 +0800
Message-Id: <20220524061848.1615706-8-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524061848.1615706-1-lei.rao@intel.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The statistics of bytes transferred conceptually belong to The VFIO live
migration framework, and should not belong to any specific implementation
such In-Band approach, so move it out from vfio_migration_region_save_buffer(),
which makes it easier to add other implementations.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
---
 hw/vfio/migration.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 4736af90e7..c114fab3a2 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -257,7 +257,6 @@ static int vfio_migration_save_buffer_local(QEMUFile *f, VFIODevice *vbasedev,
         *size = data_size;
     }
 
-    bytes_transferred += data_size;
     return ret;
 }
 
@@ -540,6 +539,7 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
                          vbasedev->name, strerror(errno));
             return ret;
         }
+        bytes_transferred += data_size;
     }
 
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
@@ -592,6 +592,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
                 error_report("%s: Failed to save buffer", vbasedev->name);
                 return ret;
             }
+            bytes_transferred += data_size;
         }
 
         if (data_size == 0) {
-- 
2.32.0


