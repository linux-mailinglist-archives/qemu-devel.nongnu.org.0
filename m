Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5FF4C1F11
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:46:37 +0100 (CET)
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0P6-0006ki-Lh
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:46:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0B0-00075l-AC
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:02 -0500
Received: from [2607:f8b0:4864:20::1035] (port=56269
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Ax-0001GC-Rf
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:01 -0500
Received: by mail-pj1-x1035.google.com with SMTP id gb21so294528pjb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEHpSJT8J9ebqqTQjfyKLCxLV+2FFN9FnOSHNM/yVQA=;
 b=kiY62SkrmyQWbDayOPFjfJYfbitMiww3SYSsE9+fJJtcUdtQ2/ZtABx+iTOLRtu7BA
 SNyzfun3bSubk7/e14xLtbHHMot6XIiqB2ue+Hz0B7HbpVZHuzPCZO8OUyAgeU5o2owh
 RJM8vZxXR20PubDIG6MEadGNoiJrqhXinj577l6Wf03p85OnOMuXgXRjC5CNkuwECs9P
 t2PJGLWPfAf8gb4Rjmcshkn5syu5wcESsuB29jV/PpV2TeddfBoqX80ntGVEgn+Qpkok
 XAAWiL/voPtjociSk4lUotdgyOZddcs4g1aWdKITGWQgwdXnlzq8T4D6+s/CafVjDyPS
 uypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEHpSJT8J9ebqqTQjfyKLCxLV+2FFN9FnOSHNM/yVQA=;
 b=hn9l+aFRLtC2mSiV1HF5JYut/Oa/GfDaJoziP2WgDbpDHdQc3PPS1BuJK3fFqR+Yz1
 sIOQLBtLoeA4aLZwofQcdQCCvGbnfv/DrwLpdTlJZy+gxvWdvwtwdHrdWvjiQqUNON8C
 qq8Mi9CufqAev9H9q6NwBkhpLwIjoC6O2wpWLoc2+BcPjmNyUXCjqlFnIRkVQjWiHv9A
 uUGZ/sFKyQQUqaI/nT8hxbBZFlVoRo87r/gFgJ/RJLtMlrUfaerGsE2I+kTPwkY44Fxh
 hFcAJ3eBley/9CBsQYDJxLaU/f8f7T8klmAHvhTgoarX6B8RnDcy+1vrfAxIgy4732dw
 KN+g==
X-Gm-Message-State: AOAM532rArhAy50vUsndZl4isv9YHrv7JaXrr/M5ZZKfs6d77NnCytBr
 YcZp4gBdZdAXjv3gWsJcVpW8CoJlenyJ9A==
X-Google-Smtp-Source: ABdhPJxHVxO3n6VHv8tKKO6vPJ2exXv7sP6qDqb0/aUOV9rT9qlF95ajK+GpOEN5reUMpMqagGrztA==
X-Received: by 2002:a17:902:b94b:b0:14e:f1a8:9b99 with SMTP id
 h11-20020a170902b94b00b0014ef1a89b99mr1909464pls.28.1645655518546; 
 Wed, 23 Feb 2022 14:31:58 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/17] target/arm: Extend arm_fi_to_lfsc to level -1
Date: Wed, 23 Feb 2022 12:31:31 -1000
Message-Id: <20220223223137.114264-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
fault types for which it is not defined, which allows some
masking of fi->level to be removed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


