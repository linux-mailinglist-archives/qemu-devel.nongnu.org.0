Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90B359529B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 08:37:43 +0200 (CEST)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNqCs-0005jl-T4
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 02:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq1A-0005ad-7G; Tue, 16 Aug 2022 02:25:36 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq18-0003Yn-Im; Tue, 16 Aug 2022 02:25:35 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso8730817pjl.4; 
 Mon, 15 Aug 2022 23:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/uxSNMtOiF3YH3Q+juusUgjtziotSgDrNrvuRHofnb4=;
 b=UPoEa1K5yB61j6YdbAJLSS1u1cRzpfDcg81cgG70w8B4vM7oqL3ngfgNtjCm5dlMPs
 Y9BmBx9HFfmvfIBu4nyY4Z4zSrvDShlmqIK8bUjecdgFuQiEbVjIrxwJalkhcQtQmma0
 66AMj7snsHpSN1QV70GTfzJyS0WWcSHLAQgluz5UiuGTzHGEcSkqqlCZT+aOZd9UUYeX
 IcwfGmQQJAIzQZNhNqwpktYQKVdedgyNxBxzWsHW7u33Z+jMI1QaEsEzxaSygREpBdB0
 gh5N84vW13vgHMzI9oFWK8aqDrAUIVE4I6El15vv/GnVCBC0Yf2QQQuS0InvtA93oI9d
 qwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/uxSNMtOiF3YH3Q+juusUgjtziotSgDrNrvuRHofnb4=;
 b=JQR/dbBDfNMVS1RyDeOKe74EPmkQ9cKnJl+foPgE9ySllRIoe9rbEPqFcLFfrqkpZ2
 c/nRz6pa5sWtSAPMPpNAXJgl2S2yGA1evFByTKn4UYzQORNSXfZ684nCs7xJY3uHBD7T
 dnKqaQZowlU+aCkng5pv1klgz1Vwg5Xwgev9cRoNhdPqNRE/y0CHj7QZZ2twvYWlTWkf
 GQvzD/TDd/RwNpZha8dlF+WLS7pPVFd85SYCTMWLuEJ7gPt9KXJ0lDnqq9cJpvjz59MJ
 Je/xBhs9kxtcvix2WiIYy+ETxqGlkEsuS63YodFMte87GBn4mCp8Mx91PmGk3QI0qasa
 gF7g==
X-Gm-Message-State: ACgBeo3AtHEr2We0J125gRAdMhLXhIQPI/C/b0fdgF5jt2E/4AE+x0+4
 DCHkPTT+sJBcDmHARHtY7ASk1C67NcA7ag==
X-Google-Smtp-Source: AA6agR5fIuzetMyMA7Ym0MIpR8D01ghKSDOBTg482V9QXujgbqVueXhL6HpGEMoXE0NVJjABAv7UYg==
X-Received: by 2002:a17:90a:4d8d:b0:1fa:9cc6:3408 with SMTP id
 m13-20020a17090a4d8d00b001fa9cc63408mr722797pjh.245.1660631132668; 
 Mon, 15 Aug 2022 23:25:32 -0700 (PDT)
Received: from roots.. ([106.84.129.185]) by smtp.gmail.com with ESMTPSA id
 e15-20020a170902784f00b0016f1c1f50f4sm8082868pln.235.2022.08.15.23.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 23:25:32 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org,
 damien.lemoal@opensource.wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v7 1/8] include: add zoned device structs
Date: Tue, 16 Aug 2022 14:25:15 +0800
Message-Id: <20220816062522.85714-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816062522.85714-1-faithilikerun@gmail.com>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102c.google.com
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
2.37.1


