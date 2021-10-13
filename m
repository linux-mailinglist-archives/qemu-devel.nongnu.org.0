Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C6142B2E3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:50:12 +0200 (CEST)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maULL-0004Ns-4y
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHY-00047E-9t
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:16 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHW-0004k8-K8
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:16 -0400
Received: by mail-pf1-x42d.google.com with SMTP id f189so78043pfg.12
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=volRuwbkN3bEYM3ufnxsPhODmGd5KdNsFtolY6QzjdI=;
 b=uRcS+hJrUAEluAfdxPdDAitQhzQpEqYCQKC7ENamHdxmAW6fKetS0fhM5f9gvo0T8m
 9Q0kqy4C01a+jl3YXjTEWkGljKzSo6T7T9SsUdFNy7mBB9PpSO0BIZ2J3p1JWxcg7YIE
 ZQPbGLk/WambLGYakznozEzi6o2RxpOgv/mYZil9fKqxLepGt9HRLowqIRV9fan2CGWk
 PV7FRkHFGKO0luz2IN0z3WUhoxhljtx3CfeCNlYYwdWa5UCPafm/+qWqTLkFHy1MSQkl
 PvnuC0CWBxYazgF22Ie1fmbT96/x2b21aEcIs3AMsSvRVHnaCiZDsoJh0f6hmCLPio/+
 GGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=volRuwbkN3bEYM3ufnxsPhODmGd5KdNsFtolY6QzjdI=;
 b=alY4hR7qMAoMpOcW7RwAAOZmQx0ljG4CI56dZRYWxUJavHaY0KCGarMEF3U2JpZPQx
 QrxEwhM6N1fXrdXlJfQ4cN/AR8N7Dt4j1jeBeRNiPSs9qzjfAY1onwIwbi0suqN/SgQ6
 RK8Vo2KBb3z1p0qhpfXAWCjLrJdSanub7jz/0V0dwwChRR5W8lq+vOdGJqEQb7Fqe7Nl
 oH4CJftSGFNb1ByTdmDPf5KiCTQgOhrNQ5ku71epkpTnicStSgT/HnK7rKqWNGbo2PFz
 P4WdSUwf2qEZMX3PPh5oopYR9ZwkliZ1mQNwENlEQZKRpG8DvoVsi3fFDrb/cDhhccsm
 gKWA==
X-Gm-Message-State: AOAM530nao6+Cx7l6Zli1ShhktQFSJ1XcvRjNlt8taCxqFNQyrWux2NK
 fLzEjK/E4IbWIN1YErqJLwN7ncKcAhgjaw==
X-Google-Smtp-Source: ABdhPJxE5dU4RU4mLt91uluRzmTX13CQDxpJxRWoiZJGuAUSwZ5j18G9saUr9uTz7jWwUdLPS8jlRQ==
X-Received: by 2002:aa7:92d0:0:b0:44c:ab24:cce7 with SMTP id
 k16-20020aa792d0000000b0044cab24cce7mr35071370pfa.6.1634093172835; 
 Tue, 12 Oct 2021 19:46:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/48] linux-user/alpha: Remove EXCP_UNALIGN handling
Date: Tue, 12 Oct 2021 19:45:22 -0700
Message-Id: <20211013024607.731881-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will raise SIGBUS directly from cpu_loop_exit_sigbus.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/cpu_loop.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 1b00a81385..4029849d5c 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -54,21 +54,6 @@ void cpu_loop(CPUAlphaState *env)
             fprintf(stderr, "External interrupt. Exit\n");
             exit(EXIT_FAILURE);
             break;
-        case EXCP_MMFAULT:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = (page_get_flags(env->trap_arg0) & PAGE_VALID
-                            ? TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR);
-            info._sifields._sigfault._addr = env->trap_arg0;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
-        case EXCP_UNALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->trap_arg0;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_OPCDEC:
         do_sigill:
             info.si_signo = TARGET_SIGILL;
-- 
2.25.1


