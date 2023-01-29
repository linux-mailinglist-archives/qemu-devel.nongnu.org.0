Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C7C67FE34
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 11:31:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM4wQ-0005Ji-0E; Sun, 29 Jan 2023 05:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pM4vv-0005Hc-Ue; Sun, 29 Jan 2023 05:29:17 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pM4vu-0007Ag-8Y; Sun, 29 Jan 2023 05:29:11 -0500
Received: by mail-pl1-x635.google.com with SMTP id be8so8892301plb.7;
 Sun, 29 Jan 2023 02:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqDn66EjQd4XlWrdM2GVsx0GNeNoXLpdBxKQzaRYzMY=;
 b=cn4fM91MTDXWKoft/t+y0OnX3dclfSljTqcR2zTqe/ApFN6/lFcna/nBYvZjavIlxI
 +0P5t8EUdeH4HbTPY2xuuuFVdATV//TwjVO1GCoClE2kDWav8i/8oEPgoWTWiiHrY0lY
 wcCbSxqu+PeuYop3j8Su58+d5RfwfyHicns6H1QKaiyKU02I3bsi1NsuBKyVGerx7CIm
 4il/C9fdgzdk3Fm7cb9F2pKA0Jcmuoptoc7267o6EF9p+pObBw5FyhYcF7bocozUjrjs
 s3yrcKrY2xL3pccIh4Q7wm2iu1qgbqZMgN/G3RA3b3GliyRNF5syU9zrvoTCTYlLCY9o
 PL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqDn66EjQd4XlWrdM2GVsx0GNeNoXLpdBxKQzaRYzMY=;
 b=tHTsF1qcjtYEHZwqUVG7tPZUrcwzQLMvdy3//bcjXA6iQUkj1Z6Rs4EZ6gfXn2FT7x
 uINKylmw/vbo0lt8mcb7zPwHBRLOaFC27UO04uodfkO0YASLak5FK8TX+yLQf92Q4svu
 eHle3AFtaeeI011ZIC9cvjUuWO/2Kcjs3mTSv+nEBU4vvfdO8KgWY610/pyFHI1KAS+1
 oo/cvr5bvvieZgXtSL0uesuWj9HaxHnU/lAHS1g7768m52WGRGTGBub+CuRVuN38pity
 7Vl0P7q3o31NJJabLOeha5TG+s/FHnArA8mJe9AEKpskqtJuX0q+9uQ8uzDau8MVG8Ej
 AO5Q==
X-Gm-Message-State: AFqh2kpOLOorBo1fOX5DYw0CE2VYcgMiReQ7oIN3ONH7mvF4x8G7i4qB
 Cz7MRVMQ3Oerdq7YC91TzSgQGExBF4kLXgxFiTU=
X-Google-Smtp-Source: AMrXdXsDz7mwfotFfuAMF1mM4Scdh29BPdGT+nSLTvg2m+Hzk7k7K6r3dDDKKN2QrBhkVfGCfKeTPQ==
X-Received: by 2002:a05:6a20:4295:b0:b8:9c66:cd64 with SMTP id
 o21-20020a056a20429500b000b89c66cd64mr60701740pzj.14.1674988147442; 
 Sun, 29 Jan 2023 02:29:07 -0800 (PST)
Received: from fedlinux.. ([106.84.129.237]) by smtp.gmail.com with ESMTPSA id
 jl1-20020a170903134100b0019644d4242dsm5439416plb.82.2023.01.29.02.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 02:29:06 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com, hare@suse.de,
 damien.lemoal@opensource.wdc.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v15 1/8] include: add zoned device structs
Date: Sun, 29 Jan 2023 18:28:43 +0800
Message-Id: <20230129102850.84731-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230129102850.84731-1-faithilikerun@gmail.com>
References: <20230129102850.84731-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index 41686810de..211fbc0847 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -58,6 +58,49 @@ typedef struct BlockDriver BlockDriver;
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
+typedef enum BlockZoneState {
+    BLK_ZS_NOT_WP = 0x0,
+    BLK_ZS_EMPTY = 0x1,
+    BLK_ZS_IOPEN = 0x2,
+    BLK_ZS_EOPEN = 0x3,
+    BLK_ZS_CLOSED = 0x4,
+    BLK_ZS_RDONLY = 0xD,
+    BLK_ZS_FULL = 0xE,
+    BLK_ZS_OFFLINE = 0xF,
+} BlockZoneState;
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
+    BlockZoneState state;
+} BlockZoneDescriptor;
+
 typedef struct BlockDriverInfo {
     /* in bytes, 0 if irrelevant */
     int cluster_size;
-- 
2.38.1


