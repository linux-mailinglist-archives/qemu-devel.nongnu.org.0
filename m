Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A42C8660CDD
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:56:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zU-0003kO-Lh; Sat, 07 Jan 2023 02:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zJ-0003g3-HS
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:34 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zH-0004DR-QL
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:33 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso7526700pjp.4
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=81bUyJ3q1hrBplCCzLWitqxn9dUaRZZOJiTy7eZWBno=;
 b=KLKPpoa8iMkycV2JQumPTOO+PNOp2uzGDYEFtybPm7OZCRsBndIv9C9Tuaqht/8jRh
 IZB3wR4TOI7JVllAjWYZrEl0XCTPYOWaLEsMqTUde5sODK1tsHbygmGJCfygo+pLbCDa
 8ooJzE1CdiL2YpNz03GnTArrfrQ+AaCjdvOsxk7NBt5FQfrPNE0eLe70rGr143qSxjtJ
 2WT6MNsL6ZFYq3R2G4bL+yukNnFORfuuU90hDZrRjPBNqBdJz4xAImsHFHszVNfY7S2q
 sXRZ8qOppzmHR1ORAigib2B/aaKHq/HrnrPKwNPYvbIOvjOyPyZ2m/tJEnuZkJqHzK+a
 cAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=81bUyJ3q1hrBplCCzLWitqxn9dUaRZZOJiTy7eZWBno=;
 b=ez2QW0xSFGcoW361trcuASyBIYISt6KQw7AbDObSJmepmckPmB/Anq54zT/KkOe3DC
 MoEWIVzGhQWNKiH0ZgFBvPYFOb96qvo/8DemW3ykjyuR34nv0ldjcZkWjhmUVOJb8SKX
 f7C+bwr5ToPoJOFO++nrlk4MU/zBxz28/b8yWRNMPZIHVExjKRuLprpxdLVFsCM2i++U
 NdaOxDZir16y16v7ILoxLBND/uudDXuV/t3ZEvZnTeyf3SSJxiIKWlS+Gg6k2XNppYd9
 IhunZBl/793yLwz3sWvrhTN0OwaSv6V1zMnz/T0M+LSELpprUNPxYpG/ogJlbM/JCCp5
 F36w==
X-Gm-Message-State: AFqh2krbLjTXtbquV4bNoqk5cLKTdogmI7IOQKfpkEJLuDY4chDLTlQK
 nTEWjusRExHIyy/71hQuWtY6BqEsN+p/Yr4X
X-Google-Smtp-Source: AMrXdXuDrgkqNAn3Y0LehVNqEd1KOag54kLMjCzeIDhXQoP/iiMxE9C4caI50QRrspfj8ZJWGRxjMQ==
X-Received: by 2002:a17:90a:bd11:b0:225:b29f:42 with SMTP id
 y17-20020a17090abd1100b00225b29f0042mr63888922pjr.14.1673077890408; 
 Fri, 06 Jan 2023 23:51:30 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 11/27] tcg/s390x: Use LARL+AGHI for odd addresses
Date: Fri,  6 Jan 2023 23:51:02 -0800
Message-Id: <20230107075118.1814503-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Add one instead of dropping odd addresses to the constant pool.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index e4403ffabf..6cf07152a5 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -806,6 +806,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long sval)
 {
     tcg_target_ulong uval;
+    ptrdiff_t pc_off;
 
     /* Try all 32-bit insns that can load it in one go.  */
     if (maybe_out_small_movi(s, type, ret, sval)) {
@@ -832,14 +833,14 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
         return;
     }
 
-    /* Try for PC-relative address load.  For odd addresses,
-       attempt to use an offset from the start of the TB.  */
-    if ((sval & 1) == 0) {
-        ptrdiff_t off = tcg_pcrel_diff(s, (void *)sval) >> 1;
-        if (off == (int32_t)off) {
-            tcg_out_insn(s, RIL, LARL, ret, off);
-            return;
+    /* Try for PC-relative address load.  For odd addresses, add one. */
+    pc_off = tcg_pcrel_diff(s, (void *)sval) >> 1;
+    if (pc_off == (int32_t)pc_off) {
+        tcg_out_insn(s, RIL, LARL, ret, pc_off);
+        if (sval & 1) {
+            tcg_out_insn(s, RI, AGHI, ret, 1);
         }
+        return;
     }
 
     /* Otherwise, stuff it in the constant pool.  */
-- 
2.34.1


