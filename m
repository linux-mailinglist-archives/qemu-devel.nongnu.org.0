Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF04DAA4A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:03:57 +0100 (CET)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMlI-0002T9-Vf
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:03:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgK-0002FB-Nb
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:48 -0400
Received: from [2607:f8b0:4864:20::635] (port=39567
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgJ-0006Rj-74
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:48 -0400
Received: by mail-pl1-x635.google.com with SMTP id d18so965355plr.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ehpxZ29mtpv/DF1Yig/a5VXZ+HirfhJWuKpWkD2o0Q=;
 b=y4G0I8CNjJRzy97+08JKSQjT9njWensRXfXMXQK3neAoKgK/Od0bgXwwBLTa1wPW0E
 4afwwuLhchzEgI4VGTngeKwP9H0uWwm3HUeLeeLLuQPyjtX7NtECpp/mTUYGR0SyA7MZ
 3HyO1mbPAUgCg7AHNrYr+EuvF4cm2ieX39cOTwN1cmM9wY49Ytd0jPJNecEROabOpl60
 nDsU8k3dWGyQNTzPmvUyBhuXBkOKpixy2+tbCFiBoHKYCbak3B5TAEApdERZ1B01iwmd
 soFIbV8rmIoPbyvDvFyljvKbLHmqIzFNpiBB6WPqVwhWTrtr7m2JSWskPTQzXIF5r3G9
 BlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ehpxZ29mtpv/DF1Yig/a5VXZ+HirfhJWuKpWkD2o0Q=;
 b=Y1bQkkTSM/exmU5Ol/VDWncktCICuBIraorYZZwOOcyN7msVdq02DRMyuUOQ9GIeCH
 jhJ/CxX+vkyVkvyFY47NAko9mHzEho1dH1wSREN8dsInhJ8zUP/btYCrSMzCESAjGwzG
 t10tnAKbKfosZB16rM5Qy8rDQP842EXbtgLAZ71kjNcdtRE4nOC7qJKpi19wO6vPhBhs
 o9UoZx+ZsLJO1R4LURVOqroB/PLWgQ7jVmEUS9pi2Wvnu6p9WOvBt17/SStn7EG9usmT
 ZyEhXEZdbcnMsIyjZepk8TWvRSn5pwh2KOpxTELnnCN6E04HX0ORW7eE8ksXXpgoC6vF
 KxUw==
X-Gm-Message-State: AOAM531N3r06gRnGSDIgQs3AXJ/PcxapKWyQOtNH3niOg3sLm3kYh4/e
 Xm+6HWKxTaCQZJRjl2cKz2FLzRC5x3sNFQ==
X-Google-Smtp-Source: ABdhPJxaMKKPD6QC6cJKW3vE109IvzVQF9LtQ6vPeDYiJcgwZK8iw1szPOagNdh3AeFNTCAInkXAQQ==
X-Received: by 2002:a17:90b:68c:b0:1c6:308d:81b3 with SMTP id
 m12-20020a17090b068c00b001c6308d81b3mr8528104pjz.65.1647410325975; 
 Tue, 15 Mar 2022 22:58:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/17] linux-user/m68k: Handle EXCP_TRAP1 through
 EXCP_TRAP15
Date: Tue, 15 Mar 2022 22:58:27 -0700
Message-Id: <20220316055840.727571-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

These are raised by guest instructions, and should not
fall through into the default abort case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index a152567624..ac2555f47b 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -45,6 +45,7 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_ILLEGAL:
         case EXCP_LINEA:
         case EXCP_LINEF:
+        case EXCP_TRAP0 + 1 ... EXCP_TRAP0 + 14:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
@@ -77,6 +78,7 @@ void cpu_loop(CPUM68KState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
+        case EXCP_TRAP15:
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
-- 
2.25.1


