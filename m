Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BB6C7FCF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 15:24:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfdO9-0002bE-5g; Fri, 24 Mar 2023 05:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdO7-0002ay-38; Fri, 24 Mar 2023 05:07:07 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdNw-0000Ca-PK; Fri, 24 Mar 2023 05:07:06 -0400
Received: by mail-pl1-x634.google.com with SMTP id kq3so1226311plb.13;
 Fri, 24 Mar 2023 02:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679648783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n+CbpVSwBJxpxcUkdWiFrKKRvpiWwCBIOF3ETh/P8ow=;
 b=I4/ueIsbMc/1JXz1gU4xwKu+EidXSlFTI6jgE9c7E8bCMr3oWKYAZqJDZwCj0hEvIb
 Zn0el8uYZa2tBeCi5yEWkMnnuFS5DidLVQuLvI/Vwqdk2b4Y5JDDk7vWxylJRFeJNQT3
 izcpNOl4V4LGSi6Pg8N9YNXcKv8wlxSsrhBJ5h+61z0Fp2DWU7JrZYIDSRM47qKCD8Mp
 8k2jVmvOcf/x8oFBU5t4w/UtFpXTZQ+JPFco88ggx9ug0H9mbtk2ojQ5hFvofm+p9ey5
 nmAyTW6PCY9t2BPXvYNL+t9rnEpTAcBJZ20LcBBc3wlXkrhq46fbIZOKighF3p4dPeaZ
 Vs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679648783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+CbpVSwBJxpxcUkdWiFrKKRvpiWwCBIOF3ETh/P8ow=;
 b=NfpVN/O6AuzZWoyAIEAS6fxxwvpcZCeQkDbF0zG4zr/WGm2/URjm5NaPAwGzmTPsvv
 g4FlLFKBnxhJa1jsyLoJEmXS8xljRa63199TfduVbpSj+hqOKVDouApxnBeAUvVL24Me
 fM2FNW20Nsyc5U58ko0derTxRpoSBP0d04FJwt9dOFlywuWC4OglnZOAviJlqx0wLZCa
 /exlk83fzSpR0rqz5oIke+43GILTKvR7GDf7LagbiQtNAmCst8A/Jimabmzo8w/kPyWU
 gMPKe+RdsbnUU72xE1Nu86gpx7EPcd7QUwNiY9BXvvBBR1IX+D/D91yMEl4qlnuWBYqH
 fJeg==
X-Gm-Message-State: AAQBX9d/HIwtLwO8LiOCs5xldQhuTrXyuHJz3tRej31SU2tr5urHjOOG
 QA4ACZkxaT8l7esARjnAc/uwAvNzDf3ZEXBF
X-Google-Smtp-Source: AKy350bdlX5tXGQxl3vkPNLLVtAsAkiu2dOoed7a0zRXNpgMWydj3ug9XM0GM1g3qgDpQTsDR3kIJQ==
X-Received: by 2002:a17:903:7cf:b0:1a1:c792:8e73 with SMTP id
 ko15-20020a17090307cf00b001a1c7928e73mr1605936plb.60.1679648782284; 
 Fri, 24 Mar 2023 02:06:22 -0700 (PDT)
Received: from fedlinux.. ([106.84.130.185]) by smtp.gmail.com with ESMTPSA id
 u4-20020a170902b28400b001a06b33923bsm13722350plr.164.2023.03.24.02.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:06:21 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hare@suse.de,
 damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v18 1/8] include: add zoned device structs
Date: Fri, 24 Mar 2023 17:05:58 +0800
Message-Id: <20230324090605.28361-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324090605.28361-1-faithilikerun@gmail.com>
References: <20230324090605.28361-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x634.google.com
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
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index b5122ef8ab..1576fcf2ed 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -75,6 +75,49 @@ typedef struct BlockDriver BlockDriver;
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
2.39.2


