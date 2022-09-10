Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8915B4445
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 07:34:05 +0200 (CEST)
Received: from localhost ([::1]:33760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWt7y-00082y-Oh
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 01:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWt2m-0002A5-Up; Sat, 10 Sep 2022 01:28:42 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWt2k-0004n9-4H; Sat, 10 Sep 2022 01:28:39 -0400
Received: by mail-pl1-x634.google.com with SMTP id 9so3604505plj.11;
 Fri, 09 Sep 2022 22:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=u7Vyf1KXlekn86IvpZl1aTdlqQKIB8UmDy2XqOY+20U=;
 b=VKJfU61AGSiMm4RcCj4Z6wjfhDu1Qq91CZjhI65BI1hX11vIJWozqF9QxSkMi1tMwI
 mvgvIruw5hT6UhlJ0oMLjoBdTKZKNcSz7gmd0sihHMIfHIHD2Muxbzp7c4BvjmDN1Nf8
 ctToLQfuOlENLoocWfN7mK9Ep9oDsEZeSmjc5Q0PU14zeUDM5JQeplznn3INzGK5Gm5m
 kaU6xjy9+rnK+BvNgqd3X26LFt8tJRs+PBSgvcSDqfnaUrQ9DvCjpm2VoR3Na60mqnkC
 0aCBkawOv+ClR+CoQJcpCNGWgpq814P8btWcsviALFAS2WvfHR4fII36qSoJdywLSk1v
 QUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=u7Vyf1KXlekn86IvpZl1aTdlqQKIB8UmDy2XqOY+20U=;
 b=SiqhX3n+PqHJknP8j41B0CvezZoASAIlMrqqNUXyBGGJFzR31gpMbpBA6KLDJyAF7F
 kUwfmwUrXOdbFMoCovEk+twISGdXeo6GA0bvbSAyT6lVYRxf1SkVNeMk1xLdp7bXLvIY
 5tz7Wc4Fz9E+cBS8TFZndA+Rgmos53sfNX5AO0uNc7MptMGWdrBivz5eKb5TOrq/LYwS
 Tb6WNJC+n1kejkfVDNUK5pvfjFAEMOFT1BNTRN92ePPsgYl4gFH+L8BwSPN0o2QfIXn8
 H2N+WTrCU4uCTkgBmPumcp+jUqoTV4RvhUOekNsV7+FiaW+3xIscdPC48RTiCiE3U88s
 mopg==
X-Gm-Message-State: ACgBeo2c+qn4ss1KKRvgAortxx1RrOxP13SvFS61XaO/0EbBCAhVzOkt
 WvCzNr8Y8Vf5ssu+WL6OMsnwr2xZN5nkKvre
X-Google-Smtp-Source: AA6agR4TzcAIdX8nIYSRFraYJ+S0iDeEuhk6PRXDtMfdK23jex7/P3/vLjYodkRsdquKWoRNL7qsRw==
X-Received: by 2002:a17:902:6bca:b0:173:cfae:a7e5 with SMTP id
 m10-20020a1709026bca00b00173cfaea7e5mr16666051plt.39.1662787716176; 
 Fri, 09 Sep 2022 22:28:36 -0700 (PDT)
Received: from roots.. ([183.221.93.83]) by smtp.gmail.com with ESMTPSA id
 y6-20020aa793c6000000b00540d75197e5sm731994pff.47.2022.09.09.22.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 22:28:35 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 1/7] include: add zoned device structs
Date: Sat, 10 Sep 2022 13:27:53 +0800
Message-Id: <20220910052759.27517-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220910052759.27517-1-faithilikerun@gmail.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x634.google.com
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
2.37.3


