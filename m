Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FD16C5E76
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:09:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfDC8-0005eL-JD; Thu, 23 Mar 2023 01:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDC6-0005dY-Df; Thu, 23 Mar 2023 01:08:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDC4-0002tp-Rd; Thu, 23 Mar 2023 01:08:58 -0400
Received: by mail-pl1-x629.google.com with SMTP id z19so10864666plo.2;
 Wed, 22 Mar 2023 22:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679548134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n+CbpVSwBJxpxcUkdWiFrKKRvpiWwCBIOF3ETh/P8ow=;
 b=eES+4a4gm3gtb83AIDx0EXdJVxCX8lZIAkRVtOlyNwYzzgP7Z2MoMFFYrDyg/+NSC5
 1T+SlRSrT1m3n+B2IssP5ZktgVApXeoxBB9QuomhQ8goEwe9I+tlDoGS66GIVwTExuej
 wJWvEHZQvBZKRx7QYtrdqpbENWA5ZegtTNJGyVXUIsASUWkqR/b1iyUA0Ug+Zn2CVNDm
 boaMUoaziN7viH/xKWKKDy7k4bNS/qE8I9zXL1akBAh+8572kvVy/zrcfNaXqm0PugWH
 gQop3fGSEH8B2mJoS8HFD7LkkCy11zB6PtkjBgDYRXuc9Z9PuX8+xWGcTR5eRyiNMOt6
 /6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679548134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+CbpVSwBJxpxcUkdWiFrKKRvpiWwCBIOF3ETh/P8ow=;
 b=QjfkcO5ZtmgnOO5pOMVwTHY5msEkuDBoaq1zy8dqZ4JkGhh4uhY5vZLIdt7rDhiLfB
 u2A94FI4LgLGsNYkgnjvNtrfkiH/pTUYzacDchX+MworSVhoSE3u5fvxsPUA243seDcX
 wS1Ye4zSU3nKN52nMGtPCvPa92pplTi2ZKiRXLRW6D0EAQ/sPzMj1g5sNn5jnVNig8nh
 V/3M7XoEgQQd5mmfzn4EpEdvXnZLzb6HFK0fNFfHw0DPicgVYJxU+BEUAXrXPF0GAkFx
 HOQV5aYcPcq92MeeRefgeKe4Os8XEEz26JXGdlGdEY2NGNnHU1Ifbu9fXbV6pv0fm9Rh
 J9Nw==
X-Gm-Message-State: AO0yUKUjpvgVCmbd6cD+6J68ubYD7wLDk+Olh2zSM9g8OJ48o5bvDbtf
 b8FF2UJ9FALY7ahxWq8WWHsOZLtZzdTBuSxuKGc=
X-Google-Smtp-Source: AK7set9uXXOs55AAaoJEZUsWiR5gXGTWqWScwfjgfoMQwKGb3xXRTbBgR6J6aN+aX+0Y59zTIJYlpw==
X-Received: by 2002:a05:6a20:3aaf:b0:d9:7d22:71b6 with SMTP id
 d47-20020a056a203aaf00b000d97d2271b6mr1861186pzh.8.1679548134042; 
 Wed, 22 Mar 2023 22:08:54 -0700 (PDT)
Received: from fedlinux.. ([106.84.129.82]) by smtp.gmail.com with ESMTPSA id
 y22-20020aa78556000000b00627eac32b11sm8157888pfn.192.2023.03.22.22.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 22:08:53 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, damien.lemoal@opensource.wdc.com,
 Fam Zheng <fam@euphon.net>, hare@suse.de, dmitry.fomichev@wdc.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v17 1/8] include: add zoned device structs
Date: Thu, 23 Mar 2023 13:08:27 +0800
Message-Id: <20230323050834.5199-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323050834.5199-1-faithilikerun@gmail.com>
References: <20230323050834.5199-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x629.google.com
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


