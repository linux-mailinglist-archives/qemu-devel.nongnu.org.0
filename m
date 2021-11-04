Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F454454AE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:14:20 +0100 (CET)
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midVT-0004xw-Up
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNi-0006bO-9C
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:18 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:40857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNg-0000ym-3O
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:17 -0400
Received: by mail-io1-xd2c.google.com with SMTP id d70so6053559iof.7
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IfRWeGYD+0hbc23c7Edg1M5XjxcHd+iZ98b19hdHbHg=;
 b=LeP6zOjpqzmz7oAA6qpb8Uk9asUMapdUePjyRhueMQV+kiwVZEfH0Y16l4ZEQ/1s2a
 kHI6gDFepgYq0TEWkr3tmZVxEfOYr8FcH0stMeO9j1AENaszz57UpSBXQWVHsRsFYtQp
 CxlFHxcvJ1GMkICPXmcKWyujAQIcdvCOE4y39W7+E1pxlWy3Ei6jgYom4DIXV8oL0rVN
 Ej1Pe7H+DQybd4G2K66whFX1PMQRNoIub0xDP6CeCnlT1V80qDt+O+cOuna1zSA3ZBSg
 d5sh8f8BeYmnG4umzgpjJqdC8Rrll7bU14ay+pwa7toWa45yXI/GMVATyIvvkSP9OQdQ
 IftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IfRWeGYD+0hbc23c7Edg1M5XjxcHd+iZ98b19hdHbHg=;
 b=BxPSbscTceWJYgbF5V4PLqqAUC7+Xqod1nAud8bvle1NhQNXVzicQXkflc0L5lEDjc
 Ya2I/kX0XE5CtReGnBtZOWeTeBDBVC4SPbipaeIU6aH08E4Z2xEp+EI0CDfnlWXB43bw
 X7MIQdMDL9XrybubZOWs4qmwJs8Ir1CWTO70vPmxguD11lcI/gK+P2rcwb4vgGjn/eQM
 GfyXYBrFrlHrBf+gcEHwM+DduCCmj+2V12dr6K0lDBzIjGWACxDbL8y9pPQyeQWkruNJ
 hKydHkiAycf/PYyqxW5zyO2btrSA5OQUKWRadZDODI8lFd1mFEECOwoGcDR2I1k5zpGe
 8i0Q==
X-Gm-Message-State: AOAM530iwHKfipjpfqAqdHK6wM64GuaS/XqFQKr1r2M9RMM5JBKzsIWQ
 k5f7qPfH/3V07s5Ylz4XMSfH8tfBEZoj5g==
X-Google-Smtp-Source: ABdhPJwq8ymXxE1ym0hZw9FLXwwgOieua/vFimL1af6IM+AaaHmuei1o10IHt9STbPNq/9pSrZhBag==
X-Received: by 2002:a5d:9d85:: with SMTP id ay5mr26323164iob.203.1636034774788; 
 Thu, 04 Nov 2021 07:06:14 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:14 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/29] bsd-user/arm/target_arch_cpu.h: Implement data abort
 exceptions
Date: Thu,  4 Nov 2021 08:05:15 -0600
Message-Id: <20211104140536.42573-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Olivier Houchard <cognet@ci0.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement EXCP_PREFETCH_ABORT AND EXCP_DATA_ABORT. Both of these data
exceptions cause a SIGSEGV.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Olivier Houchard <cognet@ci0.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 9f9b380b13..905a5ffaff 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -65,6 +65,17 @@ static inline void target_cpu_loop(CPUARMState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
+        case EXCP_PREFETCH_ABORT:
+            /* See arm/arm/trap.c prefetch_abort_handler() */
+        case EXCP_DATA_ABORT:
+            /* See arm/arm/trap.c data_abort_handler() */
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            /* XXX: check env->error_code */
+            info.si_code = 0;
+            info.si_addr = env->exception.vaddress;
+            queue_signal(env, info.si_signo, &info);
+            break;
         case EXCP_DEBUG:
             {
 
-- 
2.33.0


