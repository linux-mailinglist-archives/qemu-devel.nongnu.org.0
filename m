Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D73D5F96C2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 04:24:06 +0200 (CEST)
Received: from localhost ([::1]:58054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohiSb-0006Nj-0G
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 22:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiQO-0002In-62; Sun, 09 Oct 2022 22:21:48 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiQK-0006Iz-8Z; Sun, 09 Oct 2022 22:21:47 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so11877041pjs.4; 
 Sun, 09 Oct 2022 19:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7Vyf1KXlekn86IvpZl1aTdlqQKIB8UmDy2XqOY+20U=;
 b=PM0k5mWaqwCf7Ki+Kp61cRrUINjm3MkLUtl85+iJAY1p9A94laZN8kJVyfmqTbcSsA
 z/+UXZhTGeEvdNaZkiV1bUFZhzykUJUkDfzE6mD+EFhTmMe/NfJdfgC0iHZbK3N1likP
 8G+MLFXbmE4C6NebOQndwOfGZYc/QbPiGhud3xxaoX8kVGGYFIYSSZ4MPgZ2zIBfTgYX
 shrISTUIBEGTpQs3FhOjSjhOMFodO65aPQ1luYeTh0cQPiomSnWFN5T/vF52GVGccCMh
 PvNhP2Y3DaD4fkq/kDuIU4X1tFMXxRRCieoKYBhOn3bI4kSnT7+bYVAamv2FB/FsAk0e
 mEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u7Vyf1KXlekn86IvpZl1aTdlqQKIB8UmDy2XqOY+20U=;
 b=qKzzkthnAm7FDylU0sZtcH/m1FlMF5LJPoMaZ9Ek4MyOjsHIJpGVn1UHeCFWVWtIZA
 U+zEA6jy+jntYhNa5CjLvLZDLYTZQhWa8RqIGdKedEUOKS9mfAcIGbI4Y7L4ShgO1BJa
 /ZEOj80ht1vW6gPFr/IBvlNrcnboby2uYJX6lbVzd4A3sSqtZnXbJ//088Huh4AC2CVs
 Jj430BnYpwIrd9ITJf0vt6+zn7hMdFvhmwIaYwqCa4yERUM1AuKu3UvIpDXndQkMsNdt
 Fy3Q6UtUX82uNXp6ufZ3v1zVB8MkWLVYOeWlWbIMaLn+PkDPaBP3B2otx1q5KF7vPIjo
 fNRQ==
X-Gm-Message-State: ACrzQf3GMidIJsbzvSViQY+jhztLP35BlvNmqWnn/qexEIlFPcim38PN
 mHqUAaMv25+ZiVztHCQhYDSE6/DSj6okux5BFJU=
X-Google-Smtp-Source: AMsMyM7/dzc/p0UFHJsLfWbP0JGbswi+J/Aty4bOPOL77VcDv0wvFag/dgw2dGBZJPUllp97rnwp4A==
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr29862964pjb.164.1665368497877; 
 Sun, 09 Oct 2022 19:21:37 -0700 (PDT)
Received: from roots.. ([112.44.203.212]) by smtp.gmail.com with ESMTPSA id
 l12-20020a170902f68c00b00178323e689fsm5372740plg.171.2022.10.09.19.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 19:21:37 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 hare@suse.de, damien.lemoal@opensource.wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v11 1/7] include: add zoned device structs
Date: Mon, 10 Oct 2022 10:21:10 +0800
Message-Id: <20221010022116.41942-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010022116.41942-1-faithilikerun@gmail.com>
References: <20221010022116.41942-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102c.google.com
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


