Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D612268728C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:53:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNpz-00067W-70; Wed, 01 Feb 2023 19:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpw-00061g-VF
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:24 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpv-0000QM-9O
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:24 -0500
Received: by mail-pl1-x62f.google.com with SMTP id jh15so279372plb.8
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7p89/1SscirMpmVjsVuG7CRSn1YGBHWjDAFStdyXspc=;
 b=VeLDJeeFGoovUH+Cmgb7vAgJ4dSqjAn0GL7kb64hFDLz2y9m8IP/fDOjs4s++j1Xkd
 PrF9IRlht5UUD1RFSuMUtqpht/rzZ9O95nMkLNfVaiiNVuVRJrn80DfP0+Onz03hipPF
 VbRlPGviaHjvsEe14wtC3RCLHBMT1713+BZ+qMUcZuu/GGeZRHdVLL6YJWDsDtz8uKoM
 3Us/us+EsHV+r4z7quIL5TU9t8bu7AkELkmBrk4hudzi+S0pxlWZ4fpBytqJc7s81Gj6
 isjcKr3Ga4q/6Vj/KdOJwkW18FKQ8einGYg7cDJOmyPT40dd3dDdHZtMLx7TxN5nNpf8
 jS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7p89/1SscirMpmVjsVuG7CRSn1YGBHWjDAFStdyXspc=;
 b=1CiNJj/U35XgkeeuP3sNuHqVT4GkI4LHCZCg66EUJhUCtBQFh5/iOikY+g2M1iKltt
 nlBK8vockEILe616AGW8T5BY/ntNcRXv+DjUfC3UtW5SSH87Qxq8r+OnIOYxQ1a/5hFh
 Mk5V38bAuXgP72vl0fmEWQlzx++iaGxMe9q9EuKlc3gpynU3fI0qHl/bYixvq1FxHhhP
 EFo1YH6YpcbWwqKiGZGvDgLKH6R6nadf615TRbSVTr5ZWV3GwQBvPJts7U15Acfces9h
 PLBEx6/HTbr/qoYo0aZUi/RJtnK+GDlOtas1xPZod+m3aK7Dot3PLrhwhdxEmxIGSCAn
 8zmA==
X-Gm-Message-State: AO0yUKXk6k9rOPvJG6Le8rTZ9um9RsVG/eYXWvclTcZDhMRGeyKk/rUl
 IZ5L/5pCmWGjOESPnHzd2WbR3wujkpA4DXKb
X-Google-Smtp-Source: AK7set9Y+q1snmgQXy0fmbU2d6zCaU5Da2OTWxJqdYHAbASTEnv1Qp05CDswMJDipHo/Hfmk0XRQUQ==
X-Received: by 2002:a17:903:2342:b0:196:595b:2580 with SMTP id
 c2-20020a170903234200b00196595b2580mr6019358plh.0.1675299142047; 
 Wed, 01 Feb 2023 16:52:22 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 08/14] linux-user/sparc: Handle getcc, setcc, getpsr traps
Date: Wed,  1 Feb 2023 14:51:58 -1000
Message-Id: <20230202005204.2055899-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

These are really only meaningful for sparc32, but they're
still present for backward compatibility for sparc64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 62 +++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 3 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 398418174f..370eb4e1a1 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -149,6 +149,51 @@ static void flush_windows(CPUSPARCState *env)
 #endif
 }
 
+static void next_instruction(CPUSPARCState *env)
+{
+    env->pc = env->npc;
+    env->npc = env->npc + 4;
+}
+
+static uint32_t do_getcc(CPUSPARCState *env)
+{
+#ifdef TARGET_SPARC64
+    return cpu_get_ccr(env) & 0xf;
+#else
+    return extract32(cpu_get_psr(env), 20, 4);
+#endif
+}
+
+static void do_setcc(CPUSPARCState *env, uint32_t icc)
+{
+#ifdef TARGET_SPARC64
+    cpu_put_ccr(env, (cpu_get_ccr(env) & 0xf0) | (icc & 0xf));
+#else
+    cpu_put_psr(env, deposit32(cpu_get_psr(env), 20, 4, icc));
+#endif
+}
+
+static uint32_t do_getpsr(CPUSPARCState *env)
+{
+#ifdef TARGET_SPARC64
+    const uint64_t TSTATE_CWP = 0x1f;
+    const uint64_t TSTATE_ICC = 0xfull << 32;
+    const uint64_t TSTATE_XCC = 0xfull << 36;
+    const uint32_t PSR_S      = 0x00000080u;
+    const uint32_t PSR_V8PLUS = 0xff000000u;
+    uint64_t tstate = sparc64_tstate(env);
+
+    /* See <asm/psrcompat.h>, tstate_to_psr. */
+    return ((tstate & TSTATE_CWP)                   |
+            PSR_S                                   |
+            ((tstate & TSTATE_ICC) >> 12)           |
+            ((tstate & TSTATE_XCC) >> 20)           |
+            PSR_V8PLUS);
+#else
+    return (cpu_get_psr(env) & (PSR_ICC | PSR_CWP)) | PSR_S;
+#endif
+}
+
 /* Avoid ifdefs below for the v9 and pre-v9 hw traps. */
 #ifdef TARGET_SPARC64
 #define TARGET_TT_SPILL  TT_SPILL
@@ -222,9 +267,20 @@ void cpu_loop (CPUSPARCState *env)
 
         case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
-            /* next instruction */
-            env->pc = env->npc;
-            env->npc = env->npc + 4;
+            next_instruction(env);
+            break;
+
+        case TT_TRAP + 0x20: /* getcc */
+            env->gregs[1] = do_getcc(env);
+            next_instruction(env);
+            break;
+        case TT_TRAP + 0x21: /* setcc */
+            do_setcc(env, env->gregs[1]);
+            next_instruction(env);
+            break;
+        case TT_TRAP + 0x22: /* getpsr */
+            env->gregs[1] = do_getpsr(env);
+            next_instruction(env);
             break;
 
 #ifdef TARGET_SPARC64
-- 
2.34.1


