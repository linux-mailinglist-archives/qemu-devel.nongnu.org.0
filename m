Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B695B586239
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 03:37:52 +0200 (CEST)
Received: from localhost ([::1]:51530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIKNT-0007kg-Cw
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 21:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKHs-0002ei-CG; Sun, 31 Jul 2022 21:32:04 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKHn-0000Tb-OD; Sun, 31 Jul 2022 21:32:04 -0400
Received: by mail-pl1-x631.google.com with SMTP id z19so9165257plb.1;
 Sun, 31 Jul 2022 18:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ml9KuDp/EbRk0534Hyeav3hLJwJ/69H1x0qXo/Nx1gc=;
 b=HwebBxuJCurzOF7+HpUXIvaz3W3by0luKJZM84+r9tvkEr2H3g2oAXh8ZojE9NnJE8
 /DShHf6pZE6+MEsEcQcEAp2cFXurXgjIy9QgkZQpaxObH3QhvyPS0+dgz0Az0F0VplbL
 6yhjb3bOw1FCVGm9oBkVpL8/RYMUVdxO/Rt6ICCO6P57PofTDwsz5c7thIa1aBi6ricG
 ExX/WWA/jO9dCmt2ATRWTrWW++1z0ZbCMdw402ltSX4388RBhKqsRAwJnTsILtCGxvHy
 FSm7BaRp1jIhYxYiRj0Z98xmWEF1/fBL4UaZKs+UrpzOMrTEJQ0tKX46p6DdpCL9GWs6
 NI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ml9KuDp/EbRk0534Hyeav3hLJwJ/69H1x0qXo/Nx1gc=;
 b=hivdTk3Wxq6ks9k4ZRcHuwSOOEZopd8+2D8RF9rooJEZ+M9dib0chzHuPJxmwKmlkY
 kwx3zRGVGnCUMPntidu303JhNCXUU0ogRDR8z6uwPEC+UOCctFuBb2XDsmn6p5bOUPVF
 CItZeWxmS3Qa1i7DWTleEi+BqaaCUFUE0MrkPragHV6LDmPv90PtHoF+oYyBbjaMImOz
 1zAZZwD+NuT2zVqMaJSnjgwa1MRHxNpUgspHIhHKFkJ3vAbbLncRDv3cyYNPA/VjgtUt
 hZewU889YNSKn8tZZaWhUyLlyNOt/SyVXcDWnPKz5BsEBmFsRqCCBQXOdwVc9L7Vbors
 XtwQ==
X-Gm-Message-State: ACgBeo1iGqio/DvJJt1g7/yxmaM0LEU2oMaynSZ+JV5ZMPD6a61fP+1C
 HYo4kPWcQ3+A2oxLB+ovwACdrIi7QO613VJV
X-Google-Smtp-Source: AA6agR4nEjNOXW7VfKEJPguagTjIyzhNmDRL0eY3jWYwYLXniEVNlHfgE5E2jVUhyE3jRG1rvp88UQ==
X-Received: by 2002:a17:902:da92:b0:16e:f2ee:b98a with SMTP id
 j18-20020a170902da9200b0016ef2eeb98amr1247390plx.154.1659317517709; 
 Sun, 31 Jul 2022 18:31:57 -0700 (PDT)
Received: from roots.. ([106.84.131.7]) by smtp.gmail.com with ESMTPSA id
 z14-20020a170902d54e00b0016edff78844sm2106716plf.277.2022.07.31.18.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 18:31:57 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de,
 stefanha@redhat.com, mst@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 01/11] include: add zoned device structs
Date: Mon,  1 Aug 2022 09:31:48 +0800
Message-Id: <20220801013148.10334-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x631.google.com
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
---
 include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..c9d28b1c51 100644
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
+    BLK_Z_HM = 0x1, /* Host-aware zoned block device */
+    BLK_Z_HA = 0x2, /* Host-managed zoned block device */
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
+    BLK_ZT_CONV = 0x1,
+    BLK_ZT_SWR = 0x2,
+    BLK_ZT_SWP = 0x3,
+} BlockZoneType;
+
+/*
+ * Zone descriptor data structure.
+ * Provide information on a zone with all position and size values in bytes.
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
2.37.1


