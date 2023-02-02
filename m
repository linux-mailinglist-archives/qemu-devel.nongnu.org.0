Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89891687294
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:54:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNq7-0006I4-Hd; Wed, 01 Feb 2023 19:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNq5-0006DC-Km
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:33 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNq4-0000Rw-2p
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:33 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so4056324pjd.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=99mKRPmhuKoadjBj2q33vILsr06N7+B7c/sSXSWRdhI=;
 b=HY/n1Ql+PQ8SLcDNHlfymT7uyflmPdTfAGyScmHtSw3qJJ7acvSgFVg2gf8Efigz1T
 txyzOd8pTBFqH+Wx+yKjWY6/1gBKMBMvsRn8b066RPYInL/GYd/Ah8KtagPGmMgz8SSo
 q4GDLEU2m2PumgpIPWl9SaUIwvz+1M+khEVq8QmSl15SLmPww3a7wzZbLUV3s2UEnTzU
 cBbdf5IsURiVnNNux6ODmujduW7AvlklVUXomBuo0xQhB9YdcsiHyOmxNveRw5FdFbgi
 QZnnGq3FdeVkyQScbaUHgFxsP6UHXzuOW7RYFAPr8Do0zdJipZ4txaL3SYNk1nKGEAb2
 PYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=99mKRPmhuKoadjBj2q33vILsr06N7+B7c/sSXSWRdhI=;
 b=iOOW5miHY4Hc33jZjJh28+ojkGpoY04LWZ3n2xXcHeEirfK/Kw7beguGHjqT/5s7aX
 rmJ1U6Phlufy3x0DJyyPDs4ZEqoKlUAYZHOL415ZjVOz3Q/5BC86RDP8v/Kc+iuVHHik
 PGJRMFTDLiYMbvtrQ/OBXvS5pyBkgyUMmRP4MB+alVT8rXqYcofz8k3rB8g+E+K2KDft
 xdqVmDnixYjzR9UHQZTPIpcu5i1csA6qvywtEGJGJLEv050Qsx0dz2jr2d7Z2OTQdC/1
 e1FAzE6w82yuzN2t6QC+ttT0kd8VQAgWRWu09dbp+AlqCTuvz8D+//NfIIVPwrpkWe1l
 hqOQ==
X-Gm-Message-State: AO0yUKUPIjDbeAXXGYq/GpA6GCvHLyvUxqAd2CMnXzGMx0c/WdMIxe2s
 O5lmTmXhaY5u/uUH1EHGeUzrt25hhWs/uY3b
X-Google-Smtp-Source: AK7set9VYH1chNoSU7Om8bJqxK/JEZEa7QV714yhJ2vcWqwFOaZyBYcK3XQLEBDFlhU3JgrrBJAqkA==
X-Received: by 2002:a17:902:db0a:b0:196:11b1:101d with SMTP id
 m10-20020a170902db0a00b0019611b1101dmr6291152plx.28.1675299150748; 
 Wed, 01 Feb 2023 16:52:30 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 13/14] linux-user/sparc: Handle floating-point exceptions
Date: Wed,  1 Feb 2023 14:52:03 -1000
Message-Id: <20230202005204.2055899-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Raise SIGFPE for ieee exceptions.

The other types, such as FSR_FTT_UNIMPFPOP, should not appear,
because we enable normal emulation of missing insns at the
start of sparc_cpu_realizefn().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.h          |  3 +--
 linux-user/sparc/cpu_loop.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index e478c5eb16..ae8de606d5 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -197,8 +197,7 @@ enum {
 #define FSR_FTT2   (1ULL << 16)
 #define FSR_FTT1   (1ULL << 15)
 #define FSR_FTT0   (1ULL << 14)
-//gcc warns about constant overflow for ~FSR_FTT_MASK
-//#define FSR_FTT_MASK (FSR_FTT2 | FSR_FTT1 | FSR_FTT0)
+#define FSR_FTT_MASK (FSR_FTT2 | FSR_FTT1 | FSR_FTT0)
 #ifdef TARGET_SPARC64
 #define FSR_FTT_NMASK      0xfffffffffffe3fffULL
 #define FSR_FTT_CEXC_NMASK 0xfffffffffffe3fe0ULL
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 7ba543983a..18109f545d 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -301,6 +301,28 @@ void cpu_loop (CPUSPARCState *env)
             restore_window(env);
             break;
 
+        case TT_FP_EXCP:
+            {
+                int code = TARGET_FPE_FLTUNK;
+                target_ulong fsr = env->fsr;
+
+                if ((fsr & FSR_FTT_MASK) == FSR_FTT_IEEE_EXCP) {
+                    if (fsr & FSR_NVC) {
+                        code = TARGET_FPE_FLTINV;
+                    } else if (fsr & FSR_OFC) {
+                        code = TARGET_FPE_FLTOVF;
+                    } else if (fsr & FSR_UFC) {
+                        code = TARGET_FPE_FLTUND;
+                    } else if (fsr & FSR_DZC) {
+                        code = TARGET_FPE_FLTDIV;
+                    } else if (fsr & FSR_NXC) {
+                        code = TARGET_FPE_FLTRES;
+                    }
+                }
+                force_sig_fault(TARGET_SIGFPE, code, env->pc);
+            }
+            break;
+
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
-- 
2.34.1


