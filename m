Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BA548820A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:13:18 +0100 (CET)
Received: from localhost ([::1]:60726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65ub-0002IZ-Gd
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:13:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lf-0005i9-5W
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:09 -0500
Received: from [2607:f8b0:4864:20::42f] (port=39589
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lc-00049B-QA
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:06 -0500
Received: by mail-pf1-x42f.google.com with SMTP id s15so7086484pfk.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=APMyiBbMfTnvrByjN9FXgMAg/ptb1gS5tnwqgT0NITM=;
 b=Nc7LM3r+QxnF1xD/qeyvVsh0T1IyzObZ6wO8mvCw671nRdSygDXudC2YyLHrrAkZpV
 0ihMzhWS3mrg+8C6eCVtzxkhyJe3r1dqKhFnP3o5q11Z3OcU2XousGPAcr9IMcSvWdsU
 NeFK/MD5YyyfUFK7UjKkUVNEG7mN461GRnNxM0aIrAQyL3DiqthvI40vN4rLLm6D2te2
 jUOo8Vp0YSg0dqZtvkirOGoN0TGoqhNvfZYQWQCUs6EwOKeBMOzMuUH46aUck0+AXNnB
 70/gut37W7b3tSxHGR/aeBlFsM7QQx8GCnbh69JDlRNIhUgSf/YFFGfvgQzqiceN2LuK
 7dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=APMyiBbMfTnvrByjN9FXgMAg/ptb1gS5tnwqgT0NITM=;
 b=J0rEtL5D6h9Im0LI2IynjijQNcEFOr2yWJNJQeBGYDrUcTiL9k/cJ5bcz8uTbzmmV3
 41xEnIca/RbVfixputG+NLOOrx8jK2Uoxs5bc0cpNF+IwPfTHNLIA0RQxKzUAh1V5phW
 p4NWOebYSKjAMqQrzARhyHkUeKCacq5D0VDb+zPMTQIUHgxL1w/yNubq3FWS2QP7ij8U
 IP61pRoAB9epe1TVcmwHP5Hw+gg1JbaRAsyXYnZ5GQ8gxEVn88rrsRezrKUAPmOvih0w
 BFKwK2hKSZ0DKSDdaxFClRm1zEVfxeursaSqgjRfMwBr1iDeqOUUTb5QsyaF5tK6bJnT
 cnbQ==
X-Gm-Message-State: AOAM5304gf8ag4sZisGpaRyzrbB1EsWjadntwOmGVHQJSs0iFJVb1quL
 Vpb821WwwwCwfiMpPQ7em+I/O3HBOx7hPw==
X-Google-Smtp-Source: ABdhPJyYVwc41DamJTDCLhOl4Gj9ZcWeCFz9GuTr5COO05YiayQzLgNtglDpZ6MSMTIBVYh+siWyZw==
X-Received: by 2002:a63:1422:: with SMTP id u34mr59839850pgl.135.1641623823254; 
 Fri, 07 Jan 2022 22:37:03 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z4sm840954pfh.215.2022.01.07.22.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:37:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/12] tcg/mips: Try tb-relative addresses in tcg_out_movi
Date: Fri,  7 Jan 2022 22:36:43 -0800
Message-Id: <20220108063644.478043-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063644.478043-1-richard.henderson@linaro.org>
References: <20220108063644.478043-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

These addresses are often loaded by the qemu_ld/st slow path,
for loading the retaddr value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index e967f62869..a128c70154 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -582,6 +582,8 @@ static void tcg_out_movi_pool(TCGContext *s, TCGReg ret,
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
                              tcg_target_long arg, TCGReg tbreg)
 {
+    tcg_target_long tmp;
+
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
         arg = (int32_t)arg;
     }
@@ -592,6 +594,17 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
     assert(TCG_TARGET_REG_BITS == 64);
 
+    /* Load addresses within 2GB of TB with 1 or 3 insns. */
+    tmp = tcg_tbrel_diff(s, (void *)arg);
+    if (tmp == (int16_t)tmp) {
+        tcg_out_opc_imm(s, OPC_DADDIU, ret, tbreg, tmp);
+        return;
+    }
+    if (tcg_out_movi_two(s, ret, tmp)) {
+        tcg_out_opc_reg(s, OPC_DADDU, ret, ret, tbreg);
+        return;
+    }
+
     /* Otherwise, put 64-bit constants into the constant pool. */
     tcg_out_movi_pool(s, ret, arg, tbreg);
 }
-- 
2.25.1


