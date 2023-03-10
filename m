Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DA16B3BF8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:25:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZvC-0007st-4f; Fri, 10 Mar 2023 05:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paZv9-0007qg-JZ; Fri, 10 Mar 2023 05:24:19 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paZv8-0002Qi-2l; Fri, 10 Mar 2023 05:24:19 -0500
Received: by mail-pf1-x42f.google.com with SMTP id ay18so3321780pfb.2;
 Fri, 10 Mar 2023 02:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678443856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cV4cpNh8SauJymuql2kvn1bbRIlM6L2aipAAvasPZNE=;
 b=MC+CrQ+CPR+NIK6v6UvUxq1LIfyn7/fRVqIoVb/44ITmbvNK0MRSy5sbdlkTpCris7
 UeqduuD/ETCAakxGg27ZJdykPJO8hGKKo355Isl3uv2JsaOCC3sYVMQR/DIhY+f2A2Be
 PG8G5XPU0+p1WWKK2cVBaz6Tns0ToXiaBP1fUutoMM7Eo7hYFd1KQ3wblPsPmezpahXm
 6cjbkCeUM/kAiWG0fH9mW+UbcvF5ApydkV87eN68BYlSjJXkwm6oAWmzbLftdrIMxumQ
 WA+WjshR7jfcw9GXQewSFNEwTEUuJVs7GEgq6ncbMjqrFBDWq3qX/AcryZ8++Bk0rt7X
 4SWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678443856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cV4cpNh8SauJymuql2kvn1bbRIlM6L2aipAAvasPZNE=;
 b=zErUKSWSOdWu88Rt4noKVv4lzIflF6g6JIbhgfEou8raaV/eXuDy8k5cEB2OqmJvPa
 3nI7pFyw6sTnjRn2EwK+khFCKzUxQIv2EErjvPjzmPqxIyrchKT6XnkbKM5DxrTqW208
 jzLKRnV8aZ4g4mZnCoNojJdytGw8pO0kU+ICgE7Y9uEARq8TT9KYSKxKsQNbsfs4yAk7
 YxcFXj1Vc/0b4WomrrNbSJ+CwfKdAy3te2bFwxzd5bQttoZ+skPC1W0cSEOa1spmmmxZ
 YPVgC1DttXhUS9+WsztLy8uT1ApdiiKUO00LVXOYJENyRkZsGKhHEWRtl4Kay4A49W3+
 y93g==
X-Gm-Message-State: AO0yUKXwWsK4d84YahIT2A1mFVw7iM/nj0wSU/oKHbOmMP1bIUT5xIXG
 vTZqWW7hG6bczvJ0RMzXFJ7AfneYTpr8AGyw+vM=
X-Google-Smtp-Source: AK7set+EMDUAN5aBLxpfW25lBDQPMqpZYriXaH4WsEhqTpKpEZUQRharTQ23YG+MVyNumFh4RQC/PQ==
X-Received: by 2002:a05:6a00:27ac:b0:5a8:cc39:fc58 with SMTP id
 bd44-20020a056a0027ac00b005a8cc39fc58mr1438487pfb.6.1678443855459; 
 Fri, 10 Mar 2023 02:24:15 -0800 (PST)
Received: from fedlinux.. ([106.84.129.9]) by smtp.gmail.com with ESMTPSA id
 f8-20020a63f748000000b005030113f46dsm1008719pgk.37.2023.03.10.02.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:24:14 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, damien.lemoal@opensource.wdc.com, hare@suse.de,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 dmitry.fomichev@wdc.com, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v16 1/8] include: add zoned device structs
Date: Fri, 10 Mar 2023 18:23:56 +0800
Message-Id: <20230310102403.61347-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310102403.61347-1-faithilikerun@gmail.com>
References: <20230310102403.61347-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42f.google.com
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


