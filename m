Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9A5A2C15
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:15:05 +0200 (CEST)
Received: from localhost ([::1]:40728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbz6-0004pQ-6S
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRbor-0002cb-No; Fri, 26 Aug 2022 12:04:30 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRbom-0005NG-2t; Fri, 26 Aug 2022 12:04:25 -0400
Received: by mail-pf1-x435.google.com with SMTP id 142so1940302pfu.10;
 Fri, 26 Aug 2022 09:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=M+DatxmpZVPjexrzp79M4RQhH3Af/G9By4KEv/QeAgQ=;
 b=jio+ySrN6XLqf6846aO2H8jV0NhUTwqr/2z28yw0RvwS4ZsjdgbRovsquYdoLfDLef
 iEHTl8TkULVsdPLsFdmVWcCYmkhfY8Pz0way8W9CzkEZnkEZ4OsrgYfcTxMpgycCXtBo
 gagasZ4xY5q+NXUvu/CyeMyqvMEwqq77thDsr25Yoy88yVJh2BqxQCnJz3TvqzROb83c
 21SKFykOmMSNiLLxG7U3dqwPoKFwSkWmimF4OMLhd/VFQSGONKpxn3okaRDQayq9/sMF
 08Ud5UzTi8PnTxnFc+zi+eu85+hI/YE3Tt2qkWpjA5SuxFL69l5ZPGQ/EoDjFUxL27lY
 YyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=M+DatxmpZVPjexrzp79M4RQhH3Af/G9By4KEv/QeAgQ=;
 b=vChH5iwYMXiwt0GqqmnOJ/3Co6RKdvjx5gAZnaBdZ/r0Je3jd4IUfTjzBWdYGOAiFC
 MwWK2ZREtvwag34fkTN0OTpbirWVI1C74PeJDNL3Stk4sr5+U1zn7TAEACDMgwLnwBCa
 TY2Okk6EJDufZjlcj4kMARgrKdukWHJa0iYF5HEmPLYwsBJDJZZnVcrijCQQDVeS1HGV
 SiM13H3dl6ei4WQYD7EAaHPZee1GS7nZNNXEcruJ7zy+LgiyWtuQfO0gBuRFun6A1DbX
 U5NCOfO7Xc3YpaZQy3qx3xlkwhay20cNoTGc/zXxntjQP33gc18vvGZi2s4/p7CpHQww
 CfhA==
X-Gm-Message-State: ACgBeo0EjRXjS++9rM6ISLHcauBZYRBmtj2n+iThxcMy8jYiBwmlpntA
 726Or3NSlz+4FsuwJa5Aktn7xIOdR/LWLw==
X-Google-Smtp-Source: AA6agR7whGm5/vY30eibA3wApwlTKYJBb5c+r0TIJrqEw2wf/R7yvEZ9CZFlBx0X+tPUmvz6OFNOqg==
X-Received: by 2002:a63:b03:0:b0:429:c549:d1f1 with SMTP id
 3-20020a630b03000000b00429c549d1f1mr3823298pgl.131.1661529861268; 
 Fri, 26 Aug 2022 09:04:21 -0700 (PDT)
Received: from roots.. ([106.84.135.2]) by smtp.gmail.com with ESMTPSA id
 z14-20020a1709027e8e00b00172f0184b54sm1732002pla.156.2022.08.26.09.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 09:04:20 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, damien.lemoal@opensource.wdc.com,
 Dmitry.Fomichev@wdc.com, hare@suse.de, qemu-block@nongnu.org,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com, fam@euphon.net,
 kwolf@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v8 1/7] include: add zoned device structs
Date: Sat, 27 Aug 2022 00:03:56 +0800
Message-Id: <20220826160356.6437-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..36bd0e480e 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDriver;
 typedef struct BdrvChild BdrvChild;
 typedef struct BdrvChildClass BdrvChildClass;
 
+typedef enum BlockZoneOp {
+    BLK_ZO_OPEN,
+    BLK_ZO_CLOSE,
+    BLK_ZO_FINISH,
+    BLK_ZO_RESET,
+} BlockZoneOp;
+
+typedef enum BlockZoneModel {
+    BLK_Z_NONE = 0x0, /* Regular block device */
+    BLK_Z_HM = 0x1, /* Host-managed zoned block device */
+    BLK_Z_HA = 0x2, /* Host-aware zoned block device */
+} BlockZoneModel;
+
+typedef enum BlockZoneCondition {
+    BLK_ZS_NOT_WP = 0x0,
+    BLK_ZS_EMPTY = 0x1,
+    BLK_ZS_IOPEN = 0x2,
+    BLK_ZS_EOPEN = 0x3,
+    BLK_ZS_CLOSED = 0x4,
+    BLK_ZS_RDONLY = 0xD,
+    BLK_ZS_FULL = 0xE,
+    BLK_ZS_OFFLINE = 0xF,
+} BlockZoneCondition;
+
+typedef enum BlockZoneType {
+    BLK_ZT_CONV = 0x1, /* Conventional random writes supported */
+    BLK_ZT_SWR = 0x2, /* Sequential writes required */
+    BLK_ZT_SWP = 0x3, /* Sequential writes preferred */
+} BlockZoneType;
+
+/*
+ * Zone descriptor data structure.
+ * Provides information on a zone with all position and size values in bytes.
+ */
+typedef struct BlockZoneDescriptor {
+    uint64_t start;
+    uint64_t length;
+    uint64_t cap;
+    uint64_t wp;
+    BlockZoneType type;
+    BlockZoneCondition cond;
+} BlockZoneDescriptor;
+
 typedef struct BlockDriverInfo {
     /* in bytes, 0 if irrelevant */
     int cluster_size;
-- 
2.37.2


