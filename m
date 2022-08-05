Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D458A7AE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:04:01 +0200 (CEST)
Received: from localhost ([::1]:55006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsJM-0008Iv-8x
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsDg-0002pG-QW; Fri, 05 Aug 2022 03:58:08 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsDf-0001v8-AI; Fri, 05 Aug 2022 03:58:08 -0400
Received: by mail-pg1-x52b.google.com with SMTP id f11so2036001pgj.7;
 Fri, 05 Aug 2022 00:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/uxSNMtOiF3YH3Q+juusUgjtziotSgDrNrvuRHofnb4=;
 b=bgbcajtxBExDi2i6IUq3tzOyho4Cc28LAo7XcC2ahfpUzTF0YYYNdMkBSC0/iKuuda
 Y8sfZG3CNq2cizw/2IZdfv79z3FxstltIVNG9hj+hqrU/9gKM9zPW+amUdwqkcqjz6RL
 XqlUYrJOj0dWjsf2jKYEp32rDhU3Pd5EzMiW+QzecD9lImLIhtWDmtsehhqhdHGA5jQ5
 T8js7anXngRHNQwxVI0pHTxpeDPeYLufKqSvuSp3CC8wuDf8dMSv42ksvWDiKVBmHN0/
 Q2I6bH4S7Q8FFgi3HeQQDsrtlnQWryMIx29mFEL8PB+e5tdZFJ3NFDM4x3DJmYwdkxDr
 N7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/uxSNMtOiF3YH3Q+juusUgjtziotSgDrNrvuRHofnb4=;
 b=Hm9pEpOvAgG/9KKhgN8qdJm1sxYZFze9QNRaUPF77TKNdogE42bEBdiJ28USEa0T0E
 79yZNfOu1S/hd49Os29ovpCzak/UXwqMLlftWxusMYrQjSIq5guuvHo8+hrAmHu+8nWp
 z5+rLevicgQhhSdabUc5mIvwUhsMGXXILa0UEV7Y68K1WFnCknLoA5ElkJg381qMF8pi
 74uYIG6BVHeQk1FwiGjgoUtT8a84YkJdBPZjtYqkQuDP8Y8AYOXeFsIiitlc0lS0wdZm
 PPl15IIkWcSGnpGNAuTKowWB4i//cw/nUHKlkb53+oXeO3j+o+fFH+HSzBOVL8b663cO
 mIGw==
X-Gm-Message-State: ACgBeo3EQrm4QxqwMizL3Cm3owFqyZJkaR70+C/cpsrw5hEDg5+H5D/w
 +YJCOwAFFVIC+XAJpwZTQBwOi5qfueLKtA==
X-Google-Smtp-Source: AA6agR4efXrnVMt7r0jugaJ2n42RoTTCYTeQysAWC2mji+ND1x4qD3BQm12Ss+PCKJPG0QV0jU5tWA==
X-Received: by 2002:a63:1726:0:b0:41d:b30:46d4 with SMTP id
 x38-20020a631726000000b0041d0b3046d4mr1033346pgl.27.1659686285581; 
 Fri, 05 Aug 2022 00:58:05 -0700 (PDT)
Received: from roots.. ([106.84.130.246]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b0016ee708350bsm2418564plg.14.2022.08.05.00.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:58:05 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hare@suse.de, Stefan Hajnoczi <stefanha@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6 1/8] include: add zoned device structs
Date: Fri,  5 Aug 2022 15:57:44 +0800
Message-Id: <20220805075751.77499-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805075751.77499-1-faithilikerun@gmail.com>
References: <20220805075751.77499-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x52b.google.com
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


