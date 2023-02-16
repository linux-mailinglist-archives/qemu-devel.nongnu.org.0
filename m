Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D26698C5F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX8M-0004of-6S; Thu, 16 Feb 2023 00:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX83-0004Ux-BI
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:26 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX81-0005Rz-H2
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:23 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so4786979pjq.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDYAg9I9XuYyh8hpIEHsfEqclaDeqHesV69onSq1kZI=;
 b=jmHyrIzahPLDXsOmIsPHZ4tg2OiSnp/vI0nw74/VGHNeR27wFiMSOjxVOGd76SEosJ
 YzuCGyYUDytU1b5n/73N9ySSZvMxBIJfE/USGSazrE7a8ZwL2FjrVYWObbDBklN9sr/k
 hQfrSiBUI9MMw1gxmhp7iIgMH8Ed9bJyd68RbmMWYBViIjFvXwGAaIxVFN+NogCiFgO3
 RHPogN8E/KFc2RTbyFpaheumA74ujjuyVKuREPVkHyiGDz9JorxDrauB+TUz+o+tQhrD
 hn5jB14xDwb5COOgahMjumOORDOGgpVK66NB/3bKZbH5SuiH3jtIZcbOgaZC8OjQdBqJ
 gqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDYAg9I9XuYyh8hpIEHsfEqclaDeqHesV69onSq1kZI=;
 b=0hKEPXoO7WVd/NBGDYjnh3R5vXvLI7hpRruE68qnJNVwCQAIZq+ZTA8dANOk0qjT7d
 SSczcQoKd4vRFmzwpjgCsLyVxnVIAvgKTMOpfN2b7WFxoWIEi4NJHj/QCfMx4FlR8yQ2
 n+oDjpUqBidhf9lIP87e7tWdpOSEh+tXF5jVkVCrtpDIea1hdIyT22ASszqHixMfXSEq
 qDP6jVFbruSR9YER9MveBT6E23VnRt/nmgeFOO5HkEOkf/6LEhpPNZDdocfjb42HAvnU
 z+5Oz/k7SkSEPlLWTrKw7yoZnwkap4GqC89qRAf7U7didZcSqKj6CW8USGQkPm92bthS
 j5sQ==
X-Gm-Message-State: AO0yUKWtqx61lNMpRUq47Nq/azrJKEabu1k07wBCtyqBSxB5jX8CnQeH
 GK27zupIs1Tg9Ahtz6e21Zq3Q8ZkpbOle7Mwlw0=
X-Google-Smtp-Source: AK7set+/tFqrNILQq3GGiJ8CR9QRMoDocaYJoyMKBXyqC6EaDtfkHoQisOI3ni49gEjKG6Oc2cyJ1Q==
X-Received: by 2002:a05:6a20:a1a5:b0:be:b878:6d77 with SMTP id
 r37-20020a056a20a1a500b000beb8786d77mr3603822pzk.1.1676526500213; 
 Wed, 15 Feb 2023 21:48:20 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:48:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 14/15] linux-user/sparc: Handle floating-point exceptions
Date: Wed, 15 Feb 2023 19:45:15 -1000
Message-Id: <20230216054516.1267305-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
index 093358a39a..5a8a71e976 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -297,6 +297,28 @@ void cpu_loop (CPUSPARCState *env)
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


