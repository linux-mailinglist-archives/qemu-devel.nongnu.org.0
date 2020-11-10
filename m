Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0381D2AD43E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:59:37 +0100 (CET)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRNA-0001Qt-22
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcRJF-0005Lb-46; Tue, 10 Nov 2020 05:55:33 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcRJD-00078P-6j; Tue, 10 Nov 2020 05:55:32 -0500
Received: by mail-wr1-x442.google.com with SMTP id d12so10651875wrr.13;
 Tue, 10 Nov 2020 02:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FP2chADdb4fP7ale0Ec6mavOF6tnDZOuScUYkQlkT1E=;
 b=BWC4wXHJ5n2nIFcyZATL9pgdxrBs1+IvLAcGHB0t0DTOJXTv4h7A796UMOj3pY82vY
 4r/fGwdLNAtugZm452oPthVgtXDDK7VkmlYhmtDT4HV5MqsRbqKBvx8zZC3pUViRdakG
 LcQVa4FgzUl4H8dFkOybEjiVMNjlXMYWy8Fkygbrsc+FuytYAi1+EJKZup7+wlzSO5nW
 0d5mC7iOVUluVyVSlgJsBlohzzOu7S/HACayi69eOArLqqvYDHtRsF+8TvPGyioVk9qg
 ywtwvKbIbBNsQ/2jTRDqnN+t9K9vZ4fXQfSQs4k651IeT0W7rrXqkw1o/oGYDarinFRP
 RxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FP2chADdb4fP7ale0Ec6mavOF6tnDZOuScUYkQlkT1E=;
 b=FKFKtX7gOhGz6rGzD1+Br9G05ifoZPFDZFSmbrF08lgMeSBRJ2T9BQ9pRzYxbXyUOj
 eUQHS3AMYsrKC7sLxDfG5K+HDxjCE3HRk9exfu62GMPDhmH3Uj1bGS6Qji3aCVzbKHKG
 dbhhIYAN6wUpOu3AlJAuXOJh0besC6nxfZO1R5CaWEfaauqdQixzu9GiUGBc+OW5nyG7
 VHFDf3KVm+lkX+4jiKCRRCa5EQzucBHrDCNxePvwA27Lbzh+QJtM57iOn7cjnhetKLuY
 VOgw2pUgBCfrPPENlWfhLL4DPP5N2zAZqoKwm8rUi2Qqy85/O7oMMGkkOOGXtSalmhoc
 iOIw==
X-Gm-Message-State: AOAM531f/jWLKx82H6laAY3RaVpnyG/Eu1D7v8V8EP9nPuhHZ02zqCek
 +TV/JX0yruCXJqpkHax0Aj7ZHG7Kj9Xb2g==
X-Google-Smtp-Source: ABdhPJwK7Zv13skUXat8Rp7Jn8DqojUfQf0lQc1lh9aqDklM7TRQiIDU84DK7HUn06htJO+obYid7w==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr25053658wrt.158.1605005729062; 
 Tue, 10 Nov 2020 02:55:29 -0800 (PST)
Received: from localhost.localdomain ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id x6sm2567891wmc.48.2020.11.10.02.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 02:55:28 -0800 (PST)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] ppc/translate: Raise exceptions after setting the cc
Date: Tue, 10 Nov 2020 11:53:21 +0100
Message-Id: <20201110105321.25889-5-thatlemon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110105321.25889-1-thatlemon@gmail.com>
References: <20201110105321.25889-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=thatlemon@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: LemonBoy <thatlemon@gmail.com>, richard.henderson@linaro.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PowerISA reference states that the comparison operators update the
FPCC, CR and FPSCR and, if VE=1, jump to the exception handler.

Moving the exception-triggering code after the CC update sequence solves
the problem.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
---
 target/ppc/fpu_helper.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 315959f681..c851ac8f5a 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2501,13 +2501,6 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
             }
         }
 
-        if (vxsnan_flag) {
-            float_invalid_op_vxsnan(env, GETPC());
-        }
-        if (vxvc_flag) {
-            float_invalid_op_vxvc(env, 0, GETPC());
-        }
-
         break;
     }
 
@@ -2515,6 +2508,13 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
     env->fpscr |= cc << FPSCR_FPCC;
     env->crf[crf_idx] = cc;
 
+    if (vxsnan_flag) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+    if (vxvc_flag) {
+        float_invalid_op_vxvc(env, 0, GETPC());
+    }
+
     do_float_check_status(env, GETPC());
 }
 
@@ -2564,13 +2564,6 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
             }
         }
 
-        if (vxsnan_flag) {
-            float_invalid_op_vxsnan(env, GETPC());
-        }
-        if (vxvc_flag) {
-            float_invalid_op_vxvc(env, 0, GETPC());
-        }
-
         break;
     }
 
@@ -2578,6 +2571,13 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
     env->fpscr |= cc << FPSCR_FPCC;
     env->crf[crf_idx] = cc;
 
+    if (vxsnan_flag) {
+        float_invalid_op_vxsnan(env, GETPC());
+    }
+    if (vxvc_flag) {
+        float_invalid_op_vxvc(env, 0, GETPC());
+    }
+
     do_float_check_status(env, GETPC());
 }
 
-- 
2.27.0


