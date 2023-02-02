Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8B9687292
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:54:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNpo-0005zF-RO; Wed, 01 Feb 2023 19:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpm-0005yh-GA
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:14 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpk-0000Of-Uy
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:14 -0500
Received: by mail-pl1-x631.google.com with SMTP id 5so299729plo.3
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UYdAcIsSiQ4fxqXbfF/P4rINlyMeoGQOg1RWsaI41p8=;
 b=uyY+/2XZp4/KHzW5RN7FPJQIrALQ5pJtmKV0bkdjHShkzGaevux5XDjBFcWtP/QdCU
 aRaq52nXrRjeHLp3OH6pX65ZdwhoLn+IMl8ho7BuWxAT8YcRp1hKOYGamQKwtouu8C3h
 DNVknC8KJkGxTR6mBZjAh7FjbBi5gc9+NhS70GNqerr7qdOK9p+hOvO6DZUlnr4Zqt4W
 wgOXZG+ATsp9VOqQ7rnur+fvCQhckeDek1ICpu7Tr790bodshP/8bhxKXvXHrxX0f26M
 I7wU/6QDfQqNbZyYLYzRbjZeOUS6+mJXtDxIV7t9OJv2HxZZSBIBlxtGFPCcFMMvrcVG
 PO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UYdAcIsSiQ4fxqXbfF/P4rINlyMeoGQOg1RWsaI41p8=;
 b=D4q4RDwcJSjPi2NKQuasd2d7Ctl9E5WmytRWlURx3UOyie1ekwJS2zzu5nYFjZDwUu
 yduG+E8Z1XetOAztiS5xeW32qRg4Lp3mMRLzQC8xnXzaXURubRKm0dBZ+dSwM3GnJu/7
 +LwmEBEyyE7lfqY+MP/cgd3tus06JAZY7w9i+wEbFsqkW4BRxAJAGMEAeM88emIhY/wZ
 XcjfkTQSiDB9q7Vc3SsuBTSO8tvsLuQ1fnpkIFkPcMA1VO3BoyNnG/lR3jXs+dQqb4MP
 8mXIiVfKyiWPZjj8gxnqj03W+MzYhtGQMyzYM17S7uRaPTDeW7uWCRssfvW+yxz+5HVa
 l3Ag==
X-Gm-Message-State: AO0yUKWJt80jHTQO85yycZJXIcoOTqPPAWvc2/vvhpC2Ms+4KTnjKto1
 Wgk3o5q4YGIaxer9YQTo/dPjPgKQHpkPBDpL
X-Google-Smtp-Source: AK7set9NX/Tv5Rcsb+RqINBY+h0Zvd8y1v8JVyzReCZ7fxCgquQ8PJgZlzC01cssnVYEHcurhHX7lA==
X-Received: by 2002:a17:902:d2c9:b0:198:b284:c2f4 with SMTP id
 n9-20020a170902d2c900b00198b284c2f4mr4288696plc.61.1675299131699; 
 Wed, 01 Feb 2023 16:52:11 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 02/14] linux-user/sparc: Tidy syscall trap
Date: Wed,  1 Feb 2023 14:51:52 -1000
Message-Id: <20230202005204.2055899-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Use TT_TRAP.

For sparc32, 0x88 is the "Slowaris" system call, currently
BAD_TRAP in the kernel's ttable_32.S.

For sparc64, 0x110 is tl0_linux32, the sparc32 trap, as also
seen in the adjacent code.  We do not implement multiple abis,
so treat this as !defined(CONFIG_COMPAT), which vectors this
case to BTRAP.  This was presumably a typo for 0x111, which is
the "old" linux64 syscall number.  Both old and new linux64
syscalls traps vector to LINUX_64BIT_SYSCALL_TRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index c120c42278..18d5c24af1 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -167,12 +167,11 @@ void cpu_loop (CPUSPARCState *env)
         }
 
         switch (trapnr) {
-#ifndef TARGET_SPARC64
-        case 0x88:
-        case 0x90:
+#ifdef TARGET_SPARC64
+        case TT_TRAP + 0x11: /* tl0_oldlinux64 */
+        case TT_TRAP + 0x6d: /* tl0_linux64 */
 #else
-        case 0x110:
-        case 0x16d:
+        case TT_TRAP + 0x10: /* t_linux */
 #endif
             ret = do_syscall (env, env->gregs[1],
                               env->regwptr[0], env->regwptr[1],
-- 
2.34.1


