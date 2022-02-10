Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E10B4B046E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:22:19 +0100 (CET)
Received: from localhost ([::1]:51044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0yI-0002TG-Gy
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:22:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0he-0004C3-Lv
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:05:30 -0500
Received: from [2607:f8b0:4864:20::435] (port=41484
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hc-0004EU-LN
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:05:05 -0500
Received: by mail-pf1-x435.google.com with SMTP id i30so7964424pfk.8
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aZMJ4LHirkyrTFUMYXP3OGnbkdQ4YiqE1mw9fVX5Eu8=;
 b=dFiizMjuyAOlvpLu5BMIdCQJsiTAzJkRTbwCTyy3hUVEIrv4mlOyx434t0mPJEcMwj
 fFdfhVuEa8L57O6vmsO+0w53JIqIGp9TfXymIm+LXTydF4L3U7+1iHCOjF/Ry8HYwj94
 bi10uJLjD7DxPDNRtr1zNDlTPbY08CtnCh6WtcFmj05FoWhcnC4sPoEpwoii3dge5QlL
 lxWG2QoNKKYnLPvN4WvIkijNXtRH8t6F4riu3QLwnuaYVcnrQD+/FFVIBnQHx5cSxMtE
 evDS/i3tysK1Wd4spYyEzZw5CIPeBcBrFotJsiLqFSdCRLyoEJ2uhrqZwjkFujtQWS1Z
 Z9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZMJ4LHirkyrTFUMYXP3OGnbkdQ4YiqE1mw9fVX5Eu8=;
 b=LX5IhGzv3ujQT+wvpT9GILnRsKqQtuR4rIimEhHTqUq6fbd46QL8QqRkDys75n/GXb
 l8hW70G/Tb3rlTIXAuGZxNfEDhYlHVmqbZBH+02joybJJIiaoTeVFbJXCjXNfOprqLDO
 Cctul1NhdPr/M5oq1g3dUD+BaQRHWqX3uli9UXXgcKQqk3w/pweNj1A2eHjQyjEL8kCT
 8yEWRKuKhpwaNoYGqeUp0EXNOmk/PaD5whNrYvh7/j8XOdR/QhL+cUVNIEyPRBJDGJqd
 zXlIZP51SWHmq0xEobaI2iTWgZIQrKoCQuBK6k0vcnT1zLRYxvEWl/kybiAU9J/iv/KF
 Gf4A==
X-Gm-Message-State: AOAM530ESSG3WgxYFIYJugBtUaFLzBOQhpn8CyVuMZw5IjSqd6+d/awd
 7/A5Q3pJWBUo1uYBF+475dnhkCbi2CHsV/bN
X-Google-Smtp-Source: ABdhPJxy0s3Ze8bTt8IOrs4J51aKpB5h/1mWWKMzCc3721UNkxernbxQU6A+2BljfDSDl0pafEhRgg==
X-Received: by 2002:a63:5c0e:: with SMTP id q14mr4607661pgb.491.1644465903236; 
 Wed, 09 Feb 2022 20:05:03 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:05:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] target/arm: Extend arm_fi_to_lfsc to level -1
Date: Thu, 10 Feb 2022 15:04:19 +1100
Message-Id: <20220210040423.95120-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With FEAT_LPA2, rather than introducing translation level 4,
we introduce level -1, below the current level 0.  Extend
arm_fi_to_lfsc to handle these faults.

Assert that this new translation level does not leak into
faults types for which it is not defined, which allows some
masking of fi->level to be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3d3d41ba2b..00af41d792 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -462,28 +462,51 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_None:
         return 0;
     case ARMFault_AddressSize:
-        fsc = fi->level & 3;
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b101001;
+        } else {
+            fsc = fi->level;
+        }
         break;
     case ARMFault_AccessFlag:
-        fsc = (fi->level & 3) | (0x2 << 2);
+        assert(fi->level >= 0 && fi->level <= 3);
+        fsc = 0b001000 | fi->level;
         break;
     case ARMFault_Permission:
-        fsc = (fi->level & 3) | (0x3 << 2);
+        assert(fi->level >= 0 && fi->level <= 3);
+        fsc = 0b001100 | fi->level;
         break;
     case ARMFault_Translation:
-        fsc = (fi->level & 3) | (0x1 << 2);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b101011;
+        } else {
+            fsc = 0b000100 | fi->level;
+        }
         break;
     case ARMFault_SyncExternal:
         fsc = 0x10 | (fi->ea << 12);
         break;
     case ARMFault_SyncExternalOnWalk:
-        fsc = (fi->level & 3) | (0x5 << 2) | (fi->ea << 12);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b010011;
+        } else {
+            fsc = 0b010100 | fi->level;
+        }
+        fsc |= fi->ea << 12;
         break;
     case ARMFault_SyncParity:
         fsc = 0x18;
         break;
     case ARMFault_SyncParityOnWalk:
-        fsc = (fi->level & 3) | (0x7 << 2);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b011011;
+        } else {
+            fsc = 0b011100 | fi->level;
+        }
         break;
     case ARMFault_AsyncParity:
         fsc = 0x19;
-- 
2.25.1


