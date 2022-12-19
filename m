Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A765080B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 08:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Aai-0001IP-HM; Mon, 19 Dec 2022 02:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7Aag-0001Hp-4G; Mon, 19 Dec 2022 02:29:38 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7Aae-00036z-8X; Mon, 19 Dec 2022 02:29:37 -0500
Received: by mail-pf1-x42c.google.com with SMTP id t18so5574987pfq.13;
 Sun, 18 Dec 2022 23:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YReDMzSqjQLazmSkOWktnkSm7PTUdny211RAJOIKgA=;
 b=AGooUY9SMvu0wFfWT+20jmmWsjJLZmxAiPv1Mf/bNmIcHNh787X+RXYC13P/MKirT3
 FkfHsp7pP09KQlj+ts8LXF2qvBYCCw35DmRduBiKEiQvU7g11A/gH+4ZqdIaWZ39dfDE
 9yoLOQWo+Q/F3zO3O789PmhUeDU2BVckKh+k9NAyBmiCdMpKz6pgO4vKMkaAKBXIZkRJ
 MoH40C1sGgASAPgfIfGvTRNHECU6H+lp2mtP9dANTnFuinEkvf7L4CiVsGFYR8ZliSnO
 JFG+kVH0t4sUCzdT30pDQQcjDnxLQnG8WQqMcoMiIeXkMCTad9yaobdlGbafWc5lVXZi
 uu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+YReDMzSqjQLazmSkOWktnkSm7PTUdny211RAJOIKgA=;
 b=Rhm+TP2zygXGTwG5BmJyghL2ECdh+wBl/HTSTeyljmdfn5rsHEMuHyQd5Ip6242gEg
 MfBz8mUtfjy/H9S/cHNAyc1XGHJOAbcamA9Sx42Dcmul5SaeQW23QI9eFmP19zpcJ4ji
 sGCvUlXN+fKTOHR4KS+ahfG7bi707QQB6JYmXGCS9NUrPG3/h5BpWXpIXltMm9ByUHBE
 ABK7UkHz6kiEZTXdQLHfjNR47q1xRfcFwjs4wSJydwRCj+AXCBy0duLlDbei3JpBpVAG
 NQYbXmdygXpIvzAo/ZLAq3qxSy8gCM00/9A5pFIsTJkr9zIPfWriX5drdkTaznGwyQ1Z
 M4qA==
X-Gm-Message-State: AFqh2krJTZ7nEDpvU8DilqlvzS132h91GBqOz1vCM8j+ac0kThwMmhWE
 3HI3Ee5rEh2WsXEN5qFcWi6YkLkv6rghqk07
X-Google-Smtp-Source: AMrXdXs68WkgO/va87+DNYWEOGvFT6u+pFCbLtmBflWm6yDjcnO5dqvQ40H6VuDhO1j5Q6QMxZIOvg==
X-Received: by 2002:a05:6a00:d4b:b0:577:7cfb:a896 with SMTP id
 n11-20020a056a000d4b00b005777cfba896mr8441045pfv.31.1671434974107; 
 Sun, 18 Dec 2022 23:29:34 -0800 (PST)
Received: from fedlinux.. ([106.84.132.155]) by smtp.gmail.com with ESMTPSA id
 h12-20020a62830c000000b00577c5915138sm5765623pfe.128.2022.12.18.23.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 23:29:33 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Paolo Bonzini <pbonzini@redhat.com>, damien.lemoal@opensource.wdc.com,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v14 1/8] include: add zoned device structs
Date: Mon, 19 Dec 2022 15:29:12 +0800
Message-Id: <20221219072919.6204-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219072919.6204-1-faithilikerun@gmail.com>
References: <20221219072919.6204-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42c.google.com
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
index 4749c46a5e..8995066e4c 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -64,6 +64,49 @@ typedef struct BlockDriver BlockDriver;
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


