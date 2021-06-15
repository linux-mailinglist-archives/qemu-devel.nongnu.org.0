Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700463A74B7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 05:11:04 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lszTj-0002fb-Fo
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 23:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQf-0004ew-Jw
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:54 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQd-0008A3-OP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:53 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso1317647pjb.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 20:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rxs30+5uAa9OunefGQHMVoUkynnQ1zCC+uwySj1YTHA=;
 b=ph5NFs73tU0nzEs0hJ/7pO/9mjO6LIuUWtE1RCTv/zJCYwvpAhZZIxQSRNqB+48UZ2
 rrZK2lyOP4LDJ4PYtElI03nDZ3fBPi8oi0PdbToreQ850PlrGq3JVuVM316SuM7zuKIR
 2Qkaa+zakDiIvuPBwB8xe0taZYSavcHrb4dKYMsmH2fA/6hUUQvuoA9utFCENvIK9Wby
 8ls08GqQrEysKm178TqUegnDAIPNmg8xgJ2m1dZ4aMF1giTYdMzko5HRyK2zFEB2MEgh
 hz8krDUpLx+ljY7hcXsstuw3iOYZOaTWFl0R+BWSvTiFTnCRdNCHzrcwO03CbADy9+jE
 pKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rxs30+5uAa9OunefGQHMVoUkynnQ1zCC+uwySj1YTHA=;
 b=ZH1l14ubL3E+6C1M4SLFyoCPz8dn95LMehYjW64eCmbLiGTJ/HUOb8NsbwrJEm7iSR
 VoX3dZThGCcDAFTKm0+uhuxIa4bsBcqtkG/rK+75qa987iECeG4s0O6RJFOfymU5Z4HF
 dBLR2KMGviiucnqlDuU5kF4l2DYCgXZvHQ3B9isPtybjt2R3oquj9MXIfDRnnplxrDHI
 aEIpqxvjQPmZSaXdYOaARlRe3qkE3gnpvqM1TwrseBKxI3u+OfW7TUeC8TGqI3Aw/rbt
 SYkg7Yv/9CMKV653LGfEYTxV7eCH6VmtmvrvL3v9NY3gbdmyCgTaMh23ntjxHrnfQajI
 IRqw==
X-Gm-Message-State: AOAM53128ndbJgLm5W2CG8IDgdaSliWBt7Cmf37o5LG3jZ6EPThGFvlA
 BKXlwUWJ4c6d2ynDkjPtK6Z704kYK6sXZA==
X-Google-Smtp-Source: ABdhPJx1Hq1l9idtVeZCEJ6SwZstKx3iWCEI0QPugaOfQ3J7Jcz6I/Cjevz2v3rEXYgLAPpyoOKIrg==
X-Received: by 2002:a17:902:d3c3:b029:101:af83:cb1f with SMTP id
 w3-20020a170902d3c3b0290101af83cb1fmr2207550plb.80.1623726470520; 
 Mon, 14 Jun 2021 20:07:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id w71sm7554666pfc.164.2021.06.14.20.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 20:07:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/s390x: Use s390_cpu_{set_psw,
 get_psw_mask} in gdbstub
Date: Mon, 14 Jun 2021 20:07:43 -0700
Message-Id: <20210615030744.1252385-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615030744.1252385-1-richard.henderson@linaro.org>
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No change in behaviour, as gdbstub was correctly written to
install and extract the cc value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/gdbstub.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index d6fce5ff1e..5b4e38a13b 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -31,18 +31,10 @@ int s390_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
-    uint64_t val;
-    int cc_op;
 
     switch (n) {
     case S390_PSWM_REGNUM:
-        if (tcg_enabled()) {
-            cc_op = calc_cc(env, env->cc_op, env->cc_src, env->cc_dst,
-                            env->cc_vr);
-            val = deposit64(env->psw.mask, 44, 2, cc_op);
-            return gdb_get_regl(mem_buf, val);
-        }
-        return gdb_get_regl(mem_buf, env->psw.mask);
+        return gdb_get_regl(mem_buf, s390_cpu_get_psw_mask(env));
     case S390_PSWA_REGNUM:
         return gdb_get_regl(mem_buf, env->psw.addr);
     case S390_R0_REGNUM ... S390_R15_REGNUM:
@@ -59,10 +51,7 @@ int s390_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
     switch (n) {
     case S390_PSWM_REGNUM:
-        env->psw.mask = tmpl;
-        if (tcg_enabled()) {
-            env->cc_op = extract64(tmpl, 44, 2);
-        }
+        s390_cpu_set_psw(env, tmpl, env->psw.addr);
         break;
     case S390_PSWA_REGNUM:
         env->psw.addr = tmpl;
-- 
2.25.1


