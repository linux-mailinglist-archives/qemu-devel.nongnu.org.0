Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E8F312975
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:40:44 +0100 (CET)
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xPn-00084M-Vw
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdr-00080d-Py
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:12 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdp-0001Jb-AO
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:11 -0500
Received: by mail-pg1-x533.google.com with SMTP id r38so9241049pgk.13
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SRq7hg6Vj1nHDtcJzgW8chIU3xuJIIPY1S3vOosE/88=;
 b=eaHP7OIBxnormXq1xbNgkGqC2uLhOa+WJFD6d8BZ9+b8mfJgUgCdb2bJHJQRulmvVc
 dkD0twko/i0hFfFUv+dDR56sGZGe0x2ZxrF66mBAGfO+elvQnd5L+P81ymb7kdkEYqPr
 1eRYFOlIqHhoIHMI8I5HHtR1NxGHgGT8dVtJ08ywdQCGSRPsPL3ljrYAA4QmG2Ksok1h
 8Jky31QstuwnC9gyBFcRPfl6oA0ZFjKHWuo5ga/dH53BiLsbAcAL4T+GWUo8wJudNUxp
 T3mTJ8H+/hbvQDRUF/VdIcM/3ZGSGHH5s+E5YmlxaJzMX02bYgM9knAJbuo5nr3fb8l8
 a7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRq7hg6Vj1nHDtcJzgW8chIU3xuJIIPY1S3vOosE/88=;
 b=HDzeKncEYP1kRsdpmrlJl5/fb6qm4nCRS8Ivt4RlHNzhZqw5omGzt0rgil35yXKmNg
 V4BQKcXZxvQ/pL/huShM8Rbv21Qixu///n/cB9OpUpXEvdvG/MjIqhQ3aBe9yA9Y1sJU
 uNYnfy/hznb5nmvK015p32cm7Y7M67uAYUZ94+DRGqcdjgt1qsyGtYQ+OF3tf4NXBzmu
 ifW7oPutGNIC0sAXt/oesC6uwvW3OlfGdc1T+y8mjdoJ0B2tEGRf5MfYc6IV7E7d5H5y
 r5UlEQYTPJnGaniVHchdhj0/oLRFK4zGmYDG9X7+zaGyBdYMbZhDo1OAVVHuYhU+CAog
 bxyw==
X-Gm-Message-State: AOAM532WfnkGTVGQ9JlUjJxlAfo3yWPiQeImqVUVLnr/fFrvAbFcHbyq
 OxsYIixbSeRB2Pj3w/+DavqINwfEaYchhw==
X-Google-Smtp-Source: ABdhPJzLC+7WgU+hYvklHWBlPFi9xpnQYN5cIF4KF+S71dedaVtef0O/YBTp0rGo/POzqPOUWZ85/A==
X-Received: by 2002:a63:a804:: with SMTP id o4mr15487987pgf.67.1612752666724; 
 Sun, 07 Feb 2021 18:51:06 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p12sm10308690pju.35.2021.02.07.18.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:51:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/16] tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK
 into TCGReg
Date: Sun,  7 Feb 2021 18:50:48 -0800
Message-Id: <20210208025101.271726-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208025101.271726-1-richard.henderson@linaro.org>
References: <20210208025101.271726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They are rightly values in the same enumeration.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index c612d24803..3a701d9256 100644
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
@@ -136,7 +127,6 @@ extern uint64_t s390_facilities[1];
 #define TCG_TARGET_HAS_mulsh_i64      0
 
 /* used for function call generation */
-#define TCG_REG_CALL_STACK		TCG_REG_R15
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
 
@@ -145,10 +135,6 @@ extern uint64_t s390_facilities[1];
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
-enum {
-    TCG_AREG0 = TCG_REG_R10,
-};
-
 static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                                             uintptr_t jmp_rw, uintptr_t addr)
 {
-- 
2.25.1


