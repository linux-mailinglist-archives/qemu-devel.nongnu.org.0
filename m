Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7F312944
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:19:11 +0100 (CET)
Received: from localhost ([::1]:46208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x4w-0004SI-Pg
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSV-0002bE-Pe
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:27 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSU-000694-0c
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:27 -0500
Received: by mail-pj1-x102b.google.com with SMTP id gx20so7943122pjb.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p6E9LDuPBslW5lnZ+lbP25axObg1A1JUNAlm8q5oVbA=;
 b=lWbvihMLWbvxLpQTBO/Xiy39ZtN3Z2mLTqZbmsRrxNh1hc+2A1iXrAPAZTiHu8BFdb
 XVCBzbxHOnqcWTVYncmMd246xkCKzePuZaH1qEongB2ghXmMX1HwHfBVxZqmjHSYf4qF
 v93RUORdCdZBWCjaLgVJZ15EEP0UQpfELyk/oNE8+nfPQmtdPRC5KW/dfJwvuOdljq2V
 lO0MRQk8kl9W9PdQVve2HVgHKWQoF4WLFkVrsR2q4KXjeR9OL3DMePqfl7rr/QzBQ64L
 CMHOkYhYdxIe8x1Vpfhk1bOI4MVatDazEzZPdDjesEC7QLOwBDIKiCI9V2aQu5y24Tqw
 zPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6E9LDuPBslW5lnZ+lbP25axObg1A1JUNAlm8q5oVbA=;
 b=kPvhffPU7S4kM2ZqjiVMU5gxsyPttu49iMuhe1gL9ygUBkiuSpwjirZTuCp3ZmVy8H
 7dBiBdY4coNZehdmiNpiavXG6Zu/17Uhk/ca2kRR98OIFjQoVhxLHAsp8/fg1WxNgiOi
 lXJCtBlWcH+qLcNptwL3COdl/lPDhAqoASIR3RrS44g0gKz3vES2X4yIanXtaIHdOmvI
 F7x4EWMHj2EknyAbne+gn8geJ7JyBvoEYUzOPAKDIxQsAtK7Afz32/FmgBcq8a4KeEBZ
 6VP32qtXOxnKfoxeaaFiMWKU8XN0hiSvDxhPUrbb5xQv0c2a1baCNuyh/1lOCWqeEyCd
 T5hA==
X-Gm-Message-State: AOAM53172W9/+R6f4GzNG9S3nBb6f3p2g5fGBO5Fs4bpOPkOkNU7Gaxm
 T8IwEW1q03Cx87vidyWFkxeeN2iXxeDM4A==
X-Google-Smtp-Source: ABdhPJwXcFTeRkodlllnSj9AosF7hidIdMru5aULyzac1s7PKJQ66XCf1iZK+rN2hKYtcoapUjjUDw==
X-Received: by 2002:a17:90a:1d0b:: with SMTP id
 c11mr4825702pjd.128.1612751964684; 
 Sun, 07 Feb 2021 18:39:24 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 50/70] tcg/tci: Split out tcg_out_op_rrcl
Date: Sun,  7 Feb 2021 18:37:32 -0800
Message-Id: <20210208023752.270606-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: sw@weilnetz.de
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


