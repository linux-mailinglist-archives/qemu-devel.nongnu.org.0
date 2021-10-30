Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB9440AF3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:20:46 +0200 (CEST)
Received: from localhost ([::1]:57678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsyE-0008F6-0c
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1s-0001UZ-7W
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:28 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1o-0002CS-Qj
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:26 -0400
Received: by mail-pf1-x42f.google.com with SMTP id l1so5883274pfu.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuBUrcbK5IHnv9/MH2TrxQjSj4HGL7JlA8tE+X8E85A=;
 b=uzGAZOTROIjYZtqTo5srpp6DR2S9fF4wTxV/rSJiYJywDociAz4L0UgYP9V2T3OckI
 lx5i8BWjSoENUNMzCS94pcyvkPM+uYX/rATHhfZtL80Jn35+mJ9Vu+VqyC9q7sYkrcKy
 CFSjTi70bUQx94gGyNOvlj/Ova1WjkWLDCP0Q6Sg8A8RVELRMKrvmnsr7HD49amRVpj3
 hC4M+VA3axpV6Hyxond4Ocz22jHYkRVVPKbGYN51xXXigKsu4+QBmMCWtAu6f7WVfUsJ
 87UJnt2dKcqcsA9iLPAL4za67mLvicQ6yR7JgHgWkeESWCXokxIoKynvk5ruT4rG4Tta
 LcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuBUrcbK5IHnv9/MH2TrxQjSj4HGL7JlA8tE+X8E85A=;
 b=HOq3xEJ1VbJkjJsovYhgxeMywzU9IqOf0O6h8dEmDgrI+v5/gUsyFIg8ZSy2CSboft
 kkwCrWyE860uUog9OeH0v03+53p1jrvg1CDOi7k0cX7GWDOCM+QLwcrFnxxWv7k5Dd8M
 1P17A1RPR5539I320PLnRfiMnglqnlBW1N6N1CFWxYtO36CJCSuAP2B0zmnArrrf6tme
 HgGwUN9WbCXeQPLoEdqjnghrGDXttZ4hLxovKPYXA1topsC3vPZBtW/gupU8N4Sg7iWF
 cW9clwiLoIfMjx8wasamjlW/NRiW9xl5hzBeuNuKZ1pki4AnNUDv75yPp243PLOXOtK/
 eclg==
X-Gm-Message-State: AOAM5339sAi9CxjACok+0H6Raxls2h86zl5y0LaCeT7H5baVzGLhip5m
 jQ2ZYp40sao3hJqP7ZEB1acXNfZtN436VA==
X-Google-Smtp-Source: ABdhPJyif/41dccvglP3ypyx96BcjQVFy39VCuq9UvwTwJDGGzMio/TEIOhkzZ7a3xfyUnfHK/zlQQ==
X-Received: by 2002:a62:158b:0:b0:480:7e39:91a9 with SMTP id
 133-20020a62158b000000b004807e3991a9mr3931976pfv.64.1635614423538; 
 Sat, 30 Oct 2021 10:20:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 51/66] linux-user/ppc: Remove POWERPC_EXCP_ALIGN handling
Date: Sat, 30 Oct 2021 10:16:20 -0700
Message-Id: <20211030171635.1689530-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will raise SIGBUS directly from cpu_loop_exit_sigbus.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/cpu_loop.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 840b23736b..483e669300 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -162,14 +162,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "External interrupt while in user mode. "
                       "Aborting\n");
             break;
-        case POWERPC_EXCP_ALIGN:    /* Alignment exception                   */
-            /* XXX: check this */
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case POWERPC_EXCP_PROGRAM:  /* Program exception                     */
         case POWERPC_EXCP_HV_EMU:   /* HV emulation                          */
             /* XXX: check this */
-- 
2.25.1


