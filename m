Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C724881FA
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:07:28 +0100 (CET)
Received: from localhost ([::1]:52278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65p1-0004tn-Nt
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:07:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Le-0005i6-9y
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:09 -0500
Received: from [2607:f8b0:4864:20::62f] (port=34490
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lc-000497-3h
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:06 -0500
Received: by mail-pl1-x62f.google.com with SMTP id x15so6721549plg.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/LG8DOHxYfb1kWl3G1waKqt5lQyEB1CM556IjrEgvw4=;
 b=TBf0jrt081oDxr5ry+y0WZY1I7Dl3FcHsjEY/Hftnyn+RQpiXu+c1IAWI3IP8YMBFW
 uLWgVNUmtaXcPNn+5aqgNYMiM6l9MA/kISRoBvfvQ2e9wm7cJG18+hjiJTShtCMlIvQO
 7hcthTm0ta8sITjVy5VTIKRjOc9eJfa/HJSy6uxPEHVuvTpHTiqk9oln/Yek2Y48AzCH
 raFcplFDKSjXscfKy8D9b/TdMyDH7/+932fj0nRBFB74IcwItG6D5iJXOa55UY3S/i6x
 54wqZi34gFKVnyJIjneLI12uwV/yjfob6TvPnyN/pKOxhNEcxIEpaP8PVY+YQsnV+BPM
 35PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/LG8DOHxYfb1kWl3G1waKqt5lQyEB1CM556IjrEgvw4=;
 b=KFM25Fg1f1M1uxRUvDELsoSc0C8cqK1VPTQP2lYh7YUkIcZn6VzJp2EGAOyzmQxYsn
 cPuOJikQAe1ESb0hJMk0tm7HPw31JZaeaBhiWfktKzoX5vlK9n0qTLs9MbxuEUay/xJw
 tnuPIrOiLUxye6ZksdetgnweeYtY6k/ApRC5r35u15atDcrPCP9Rp3BWFarugq7JPS6q
 JaO7iQnbz/fp/GRBwJv32KFpQNCik8nZYWab6RX3TnV75/2afjC4/aSRi01Q74aJAnEO
 dAMokCg/4LTT7W33kT7Tzyyz3FLUaik++3ET59hqwL086DUwQ9gpFVpY1gxXy9CGJHAA
 545g==
X-Gm-Message-State: AOAM532p8T6qgrvwRbiV/Ad91dupC46UkpMeCTrFMohlsINmefZXqRuw
 /PTfXdVD3EQ9OndoE7x2hWbJ80x38k3Mug==
X-Google-Smtp-Source: ABdhPJzQVPpmhx6QoxssDyGdj8dloLw7U2oeO1jjvSz+5/AecTu+y5nY13ZC6eZaD+qF2ipL34C5mw==
X-Received: by 2002:a17:902:e5c2:b0:149:3cd:ebf5 with SMTP id
 u2-20020a170902e5c200b0014903cdebf5mr66215001plf.1.1641623822095; 
 Fri, 07 Jan 2022 22:37:02 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z4sm840954pfh.215.2022.01.07.22.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:37:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/12] tcg/mips: Aggressively use the constant pool for n64
 calls
Date: Fri,  7 Jan 2022 22:36:42 -0800
Message-Id: <20220108063644.478043-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063644.478043-1-richard.henderson@linaro.org>
References: <20220108063644.478043-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Repeated calls to a single helper are common -- especially
the ones for softmmu memory access.  Prefer the constant pool
to longer sequences to increase sharing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 41cb155eb0..e967f62869 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1057,9 +1057,19 @@ static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
 
 static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
 {
-    /* Note that the ABI requires the called function's address to be
-       loaded into T9, even if a direct branch is in range.  */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T9, (uintptr_t)arg);
+    /*
+     * Note that __mips_abicalls requires the called function's address
+     * to be loaded into $25 (t9), even if a direct branch is in range.
+     *
+     * For n64, always drop the pointer into the constant pool.
+     * We can re-use helper addresses often and do not want any
+     * of the longer sequences tcg_out_movi may try.
+     */
+    if (sizeof(uintptr_t) == 8) {
+        tcg_out_movi_pool(s, TCG_REG_T9, (uintptr_t)arg, TCG_REG_TB);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T9, (uintptr_t)arg);
+    }
 
     /* But do try a direct branch, allowing the cpu better insn prefetch.  */
     if (tail) {
-- 
2.25.1


