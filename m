Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD1750A4B4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:52:59 +0200 (CEST)
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ74-0001U1-LI
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ8-000726-Sr
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:54 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ7-0006ER-CA
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:54 -0400
Received: by mail-pf1-x429.google.com with SMTP id i24so5287521pfa.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=S7sC/4UmY0KkIUVa0dACgOcIdGoqizVt2fv89FCsswE=;
 b=SJ3r5cC9pUnPIf2w6QxTRAB4MJkBXBUl5UgaLtapgha7WFxkwHjKdj6YTzAme4ErwC
 UPrrKl0FCZu9CTmqaAnuhdrucL5Mta4KguDItDSO2jTz3zQSQ0JO5eZtGRmmVTG0xoai
 lUsKGxGiUFh3zVmdE9webXJoqmaHPl6CydYzM31nsKtzAXBC7eqjvMJcIdWe+Mik+g+h
 zsibtL1lqHpsvdpURdt3iwpDf/Kbcv4XdKPSny95UPVBSzyAOl+iNMyFeH70ih6W/3LN
 E9TFGgRDcqTxFq63aBNFlXGcHbCIFcZ/GdQmevNDnOYlh22SxtHptWdB4Ar9V92mbI0W
 P8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S7sC/4UmY0KkIUVa0dACgOcIdGoqizVt2fv89FCsswE=;
 b=prX84jjWcpaOVIbvreRJ6iXt16ZTkU3hdr04v4y64uTtXhWO/1kj3JQDKiOFDe7A99
 upY7srcPUWmz82Aq3x572sS1dYICSo9gtgWz7lgDx5KkIoqXaVDLcs10h/mO0wthysm4
 zJlYQYxMNLJJTlC6JkyIxkNDEy+HgmwM9Sk9cNq2ZM1lvmXv2WeV3v8ldWoZl5AZwt3A
 TwPECChXHLqaNrUBnHtAYfx03bPKErpPLpB65ihMwhj5FaNEhmsku2WUdY1CBTToiyyr
 5GM+UXRzS7ATKgF3IA9dUyz3iylQx27tSKzYcPY4Q/Ekig1yzK3WmppMPOpwa8juXbNj
 70EQ==
X-Gm-Message-State: AOAM532pXc3fmyDuzqEHSrx7qRXtgkhki/gjKhJZeJuSYckXMrUYH28+
 cm3Nc9mouKYkq8z2QpaiZbJNkSV+VNKb3Q==
X-Google-Smtp-Source: ABdhPJxzllWjzXtEtyRzPmjdxTJ/IW8bIn9ZECh5B/T8+O6W3Lb8cnIPLp6MHCa7ZpiZc3zbRcjXxg==
X-Received: by 2002:a63:4b1e:0:b0:3a3:9226:594c with SMTP id
 y30-20020a634b1e000000b003a39226594cmr24208430pga.5.1650554272100; 
 Thu, 21 Apr 2022 08:17:52 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/64] target/nios2: Remove user-only nios2_cpu_do_interrupt
Date: Thu, 21 Apr 2022 08:16:40 -0700
Message-Id: <20220421151735.31996-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 78271684719, this function is unused for user-only,
when the TCGCPUOps.do_interrupt hook itself became system-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index e5c98650e1..678fd96c4e 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -30,14 +30,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void nios2_cpu_do_interrupt(CPUState *cs)
-{
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
-    cs->exception_index = -1;
-    env->regs[R_EA] = env->regs[R_PC] + 4;
-}
-
 void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
                               MMUAccessType access_type,
                               bool maperr, uintptr_t retaddr)
-- 
2.34.1


