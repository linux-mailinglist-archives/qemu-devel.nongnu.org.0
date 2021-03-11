Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE74E337638
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:54:23 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMhi-0003nS-RJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUo-0003pn-60
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:02 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:38717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUb-0006eY-Sd
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:01 -0500
Received: by mail-qv1-xf35.google.com with SMTP id t5so2639438qvs.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p6E9LDuPBslW5lnZ+lbP25axObg1A1JUNAlm8q5oVbA=;
 b=ASq7KldhmieksOJm09/u9RCvwCGSmMY+UY1zq5mX9bUQaCfi6F/IQbRN2eoAx1JmD9
 LpEEMJETRGZzlp/Bsm80g2yabQ43LyYsZ28b39zjHQdsTgWZxxu8eaCxNLb6rkUdLUDb
 n4dhAoGJrkwkX/dQCUKR5DTwJ+OTM5UFWm5ANp8InpgrySxJUVW9mWYSsUFgHBveOfHU
 W6XImoD+TUES34EwBbg3SRmQkKdBvbWDdJT0CWAf/p//03hMM0+VGUs+8AMnD/ccDC4t
 H/gp8xdhAwF8Z4slEzKF5Zf+BRfCD8JA0DPy+Wf7m6kmA8VchvS0be4otXvu4IZ9Smk1
 Mk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6E9LDuPBslW5lnZ+lbP25axObg1A1JUNAlm8q5oVbA=;
 b=jfrPt0irmbe4TCrospIySrxZVsU35YvEA7sCpYWHcwNNhyNWdWCtcJQKB0k3jeydKq
 2iXwQE/cllgqy4gSTtm41IgASzkEFuMQaCZy2oRzR2kifGlJsFQIHrl0cAKo8Anr6M5P
 wFGn1wTr83rmj2B/eByzJ6aoY701vL1YD4x8AZjefl9B6l5X8IynLfGqIgGAqwhtaMG/
 zckFGJw3oGtaG+5E/aTFsJcnV68HtclN+GLaMJhh0keklTLOhUAmjmUnyQaA/cnQC35o
 eSn97WfdpIFJTfQYfoU6qvWg849IzdR+cCPOPy8PzmLFxq00tz+Pt3sKwUK9cIIaGsvm
 7Tng==
X-Gm-Message-State: AOAM532oqvIJ58LQzD7EjN7sqe6Lp+be8mk6lLfe79DdJel4MYwk2K/m
 Z1r1ps9H/DGsFyKy1OxA4j7a8SfF7o7VSwHh
X-Google-Smtp-Source: ABdhPJxAZARGUeEhiWxZ0E0H7TFhcA96MDRUxl1veMu5en8VtpI8OK1iM6S+o5m68+5F/eEcbkR8QA==
X-Received: by 2002:ad4:4991:: with SMTP id t17mr7668608qvx.33.1615473648889; 
 Thu, 11 Mar 2021 06:40:48 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 35/57] tcg/tci: Split out tcg_out_op_rrcl
Date: Thu, 11 Mar 2021 08:39:36 -0600
Message-Id: <20210311143958.562625-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 6c743a8fbd..8cc63124d4 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -341,6 +341,20 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrcl(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGCond c2, TCGLabel *l3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out8(s, c2);
+    tci_out_label(s, l3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
 {
@@ -565,12 +579,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(brcond)
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out8(s, args[2]);           /* condition */
-        tci_out_label(s, arg_label(args[3]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrcl(s, opc, args[0], args[1], args[2], arg_label(args[3]));
         break;
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
-- 
2.25.1


