Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB52E2C52
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:26:24 +0100 (CET)
Received: from localhost ([::1]:38788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kstfL-0008Km-TH
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZH-0002yx-PJ
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:07 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZF-00059d-8R
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:07 -0500
Received: by mail-pj1-x102d.google.com with SMTP id f14so2675526pju.4
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8HiXBeIwsexO2t9WEInvhxfOSjvRfRmoEdDEiBM8nzc=;
 b=ASk730HXYbzjZM81H6t8WObJVRPyrDXiEJEV51jAW2pBnSBrwizrivUZ7Ax75FYqQ0
 oA+cUavBWlQ4yUvpgGOigfLY9EYTgOjQZsMq1vMZsve5c9i8NkrbFnyfDNTpXRJ0RSUN
 ChZnJu3QfOaGVEj7G7MPlLygzpUTXZepyOzJRLliWGC0nz4i6c+YmKOaAgWu1jvyHExm
 yzludOtlw5OmcW2LZ1NZns4LFNyG2aDcmg507bYpJmqIdeejrgGueKVutmqfZa+3RLbI
 RwYkrYtb0xxBoV13AmFKGMrNt2INEbqOwMrI+McYP/ekylFDTcBm2nelGQul7Qv8Gf6r
 Db+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8HiXBeIwsexO2t9WEInvhxfOSjvRfRmoEdDEiBM8nzc=;
 b=V5DDPdu1E6G0yayHbgf87vKxoh8JHzM9zCAvXBOOqfLAtwLXO2hj8+IPOkNneXPkSd
 8npO7YvXyEXwSRKzroHEbQZCKTQO7rOaO+iRXK6E2N6wUnk36lFXTYEG1aYQc85w5S0Q
 750d8Bk6Ah56FAqVtqtDlQsZJO8QxS3iJbK3NcNeenmd5eS7x8WTOp0itqKe/IFhaez3
 NOWEVRGhvRKbhqINn5/7NIQgEsL+VJbVF2b8rMn7IUEXQKqR7k1XLb/5Qm7H66Q/eKTN
 smkW9vAcYSl923E/Bo9jus/m87ym2CmtErGleyHdkbGyUMDA+oCt1Jh/SoFT3SdvMtRa
 1mAg==
X-Gm-Message-State: AOAM532AO+fWfIfeHozykVO20DqdbujasPSFmdXWJY/1Ow8Za4/KDeFv
 wnvcV9pVQBrd1vqbtPLXwyutQHgjBhrO6A==
X-Google-Smtp-Source: ABdhPJw53G60CHKmkcp9gjnv+zBHj84YNk6EUWQGNDjtrTE5IzgzJiBcyDF2qhJutIgMqQWq7m0Ajg==
X-Received: by 2002:a17:90a:4083:: with SMTP id
 l3mr9961015pjg.109.1608927601983; 
 Fri, 25 Dec 2020 12:20:01 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/16] tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK into
 TCGReg
Date: Fri, 25 Dec 2020 12:19:43 -0800
Message-Id: <20201225201956.692861-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They are rightly values in the same enumeration.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 264c8c1e97..a78a2c4398 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -29,22 +29,13 @@
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 19
 
 typedef enum TCGReg {
-    TCG_REG_R0 = 0,
-    TCG_REG_R1,
-    TCG_REG_R2,
-    TCG_REG_R3,
-    TCG_REG_R4,
-    TCG_REG_R5,
-    TCG_REG_R6,
-    TCG_REG_R7,
-    TCG_REG_R8,
-    TCG_REG_R9,
-    TCG_REG_R10,
-    TCG_REG_R11,
-    TCG_REG_R12,
-    TCG_REG_R13,
-    TCG_REG_R14,
-    TCG_REG_R15
+    TCG_REG_R0,  TCG_REG_R1,  TCG_REG_R2,  TCG_REG_R3,
+    TCG_REG_R4,  TCG_REG_R5,  TCG_REG_R6,  TCG_REG_R7,
+    TCG_REG_R8,  TCG_REG_R9,  TCG_REG_R10, TCG_REG_R11,
+    TCG_REG_R12, TCG_REG_R13, TCG_REG_R14, TCG_REG_R15,
+
+    TCG_AREG0 = TCG_REG_R10,
+    TCG_REG_CALL_STACK = TCG_REG_R15
 } TCGReg;
 
 #define TCG_TARGET_NB_REGS 16
@@ -135,7 +126,6 @@ extern uint64_t s390_facilities[1];
 #define TCG_TARGET_HAS_mulsh_i64      0
 
 /* used for function call generation */
-#define TCG_REG_CALL_STACK		TCG_REG_R15
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
 
@@ -144,10 +134,6 @@ extern uint64_t s390_facilities[1];
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
-enum {
-    TCG_AREG0 = TCG_REG_R10,
-};
-
 static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
 {
 }
-- 
2.25.1


