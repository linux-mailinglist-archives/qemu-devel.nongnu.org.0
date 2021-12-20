Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F847B4CB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:10:36 +0100 (CET)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPvX-0000Ut-TE
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:10:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPql-0000Gy-Ga
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:39 -0500
Received: from [2607:f8b0:4864:20::634] (port=38669
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqk-0005tr-3A
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:39 -0500
Received: by mail-pl1-x634.google.com with SMTP id c7so259820plg.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+z+2wgajKIXNhb3GkYsTaJ6MztPE6mnhuYtE6HY72+A=;
 b=kCgsih/whxvrAX6yqcIjJzOSoDeZDMybnO18KyPV7CbctYALnbH0JmR2+0aXP6I0Jg
 zJ5xKvqZkTNi+pSUXBN8dhkAG8edZoUr6LUTg8Y4j4+BBfL0qHVUHZcgF5Rk1sJbfHa3
 N9JpK1SIoHI2mH7enUPB1mUrxTMW7zFpkEcsMxhLzsM0fe0znSojWplfnLuKEpkOk6dm
 GQkfGBSKaqIG+gsleU0lICxLXTQSyG8UvsdAneMLlDc3fBGClOZ5tGOXIb7O6EowINW2
 noDDOpM06y6HijzdgZovq3ItqEXzn50NHAwufJ+94tYJj/fLLw4sxUSnefS6Y00YCQ8H
 EtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+z+2wgajKIXNhb3GkYsTaJ6MztPE6mnhuYtE6HY72+A=;
 b=V/hhwYRv9iLHOlVqImRQJCgpUnnRgefAbda9UT7p0HVi7CYZsDm96X3Pc8iWVIbrTa
 RbCuD2e66668MQzVHdZ7Z58IDTpox27wssYDTa7kAo87Kl/McZ/wPoiuZAyVnNRN0acy
 Vtobn+9fGHZdWiVUupKGGO1gI3MKCaGMHCaPK16Rbn30802ayrDpVPPTTX4gyzLKSSdI
 OSMNe03ct3SyGF/X2gAF+E3AR/jKR+olzi9eMtLJLgdDXz2uI5tY4mJKSE7mfm/8pWI0
 4s1Z7bHqR/xwO93D+xZwixphmOOYoPkOeoRMALMkKiENcd/jZhGaN8CvlfuenN+Lx5hN
 TafA==
X-Gm-Message-State: AOAM533co4jps57bMZTcSaXuRT/vBJjhrg8iB6gwvjYrNXF6s/JsJS4x
 r0PaZdCVOWCqN3/7hoYLCIzHuiTioUAVTw==
X-Google-Smtp-Source: ABdhPJxz25SKHlC6yqeCb5hdz8FFAbio6aR4eI/1YB2o6gD+zPYPIrsPYpoNSy2xaKLk+XiXA0Io9w==
X-Received: by 2002:a17:90b:4d0e:: with SMTP id
 mw14mr965374pjb.151.1640034336870; 
 Mon, 20 Dec 2021 13:05:36 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/24] linux-user/hppa: Set FPE_CONDTRAP for COND
Date: Mon, 20 Dec 2021 13:05:12 -0800
Message-Id: <20211220210529.150423-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This si_code was changed in 75abf64287cab, for linux 4.17.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h  | 1 +
 linux-user/hppa/cpu_loop.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a738bdcecf..f9240702eb 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -688,6 +688,7 @@ typedef struct target_siginfo {
 #define TARGET_FPE_FLTINV      (7)  /* floating point invalid operation */
 #define TARGET_FPE_FLTSUB      (8)  /* subscript out of range */
 #define TARGET_FPE_FLTUNK      (14) /* undiagnosed fp exception */
+#define TARGET_FPE_CONDTRAP    (15) /* trap on condition */
 
 /*
  * SIGSEGV si_codes
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 8e13f84a64..c33a59fef5 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -156,6 +156,8 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
             break;
         case EXCP_COND:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_CONDTRAP, env->iaoq_f);
+            break;
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
-- 
2.25.1


