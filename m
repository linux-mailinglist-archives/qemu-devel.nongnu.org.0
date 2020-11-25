Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8FD2C37EF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:14:26 +0100 (CET)
Received: from localhost ([::1]:40010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khmCH-0006IX-GA
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm56-000565-KS
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:07:00 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm55-00065o-2U
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:07:00 -0500
Received: by mail-pl1-x643.google.com with SMTP id r2so459273pls.3
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0GArN05QL42PJKkh5e5g8eJMWLUKLJQ2bxbC2/N0XQ=;
 b=WaKb39oevq8pC/DZQaDhKHTXB2Lkb16p2n10ECBRxvi2+o1kh2KvB2F53K7JbHYSqb
 A3VBAzXqLIp11BaYWzP24ORfgTB7cTSKTAiXgJ5mWaknBnZm7tON7dSf4x/M4Bud6g4y
 URl+gyuMteTjxczZEyKVNnJ9RwYuO6f2PNrKrgKVd9sQOsFBOWbxearUOu17nS112Bfg
 0uo1cQ59LccSCa22QW5CtcvvXEEYxN2oXpSDbmog4Wz17HJd24IqyuWK4glILR6bboof
 FmJsdPLzkgaDevhU0z5McDc0BEFuyu0tEqimU4yp6SZbVxoR8HJ5n2uftqgwvH/d6dGL
 fdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A0GArN05QL42PJKkh5e5g8eJMWLUKLJQ2bxbC2/N0XQ=;
 b=oXNx17Vh6h3lrz8obMgQFGrULZfAmxVKnLp36T+1UPTEj2i5m3NG6x+VTlFK6vDqzU
 V/DGNxnc7JJT/jTW254bVFF3EMJ70F19dlh0BJRKxNCEeEJN0LP9YmTXr8/n/ch+WJ79
 cHTYLQyEaXvj/hpHUeXPNF8HHexm6dUnTTGFhP+8jg+aNT2W5jAiQnZcAAVy4SqmPRt7
 Wf8hSvkNOiGk3Z8XGM37R7MqNjxKUnQtksslS467Ek1gAAUBh8+hUKzPUU7eo+d1kTtc
 Y+k5hgiz8Rcq3qpYXRRUQpPE9PbC/4SF7+kANWrz7l85i75mx8RVkanFU5c38VTXb7ye
 q1Rw==
X-Gm-Message-State: AOAM532GpYFJIhSepH7m2g4z3R2OZX4sqBD+LRDCmaoqCdT9IUW2j6jw
 enC3ZMO1cd1F9qxnP6eEZMNf5nyXWPCqcA==
X-Google-Smtp-Source: ABdhPJxFDaPBmX/htfRNEb+Fl0K5ak5b+Jhe08pR5s2fRUovvSfDr5l9EjSEtRzF5lAlcGkHrmwQXg==
X-Received: by 2002:a17:902:930a:b029:d8:ca83:3108 with SMTP id
 bc10-20020a170902930ab02900d8ca833108mr1637830plb.60.1606277217482; 
 Tue, 24 Nov 2020 20:06:57 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] target/arm: Fix decode of align in VLDST_single
Date: Tue, 24 Nov 2020 20:06:41 -0800
Message-Id: <20201125040642.2339476-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The encoding of size = 2 and size = 3 had the incorrect decode
for align, overlapping the stride field.  This error was hidden
by what should have been unnecessary masking in translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-ls.decode       | 4 ++--
 target/arm/translate-neon.c.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/neon-ls.decode b/target/arm/neon-ls.decode
index c17f5019e3..0a2a0e15db 100644
--- a/target/arm/neon-ls.decode
+++ b/target/arm/neon-ls.decode
@@ -46,7 +46,7 @@ VLD_all_lanes  1111 0100 1 . 1 0 rn:4 .... 11 n:2 size:2 t:1 a:1 rm:4 \
 
 VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 00 n:2 reg_idx:3 align:1 rm:4 \
                vd=%vd_dp size=0 stride=1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 align:2 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 . align:1 rm:4 \
                vd=%vd_dp size=1 stride=%imm1_5_p1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 align:3 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 . align:2 rm:4 \
                vd=%vd_dp size=2 stride=%imm1_6_p1
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index c4be019d9c..330b5fc7b0 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -616,7 +616,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     switch (nregs) {
     case 1:
         if (((a->align & (1 << a->size)) != 0) ||
-            (a->size == 2 && ((a->align & 3) == 1 || (a->align & 3) == 2))) {
+            (a->size == 2 && (a->align == 1 || a->align == 2))) {
             return false;
         }
         break;
@@ -631,7 +631,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         }
         break;
     case 4:
-        if ((a->size == 2) && ((a->align & 3) == 3)) {
+        if (a->size == 2 && a->align == 3) {
             return false;
         }
         break;
-- 
2.25.1


