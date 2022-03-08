Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553464D1104
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:31:59 +0100 (CET)
Received: from localhost ([::1]:44874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUK6-0002sQ-D3
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:31:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9H-0005GM-Oq
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:52 -0500
Received: from [2607:f8b0:4864:20::52d] (port=43929
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9E-0006Pl-62
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:47 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 27so15658542pgk.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bw6rFTkskI2G9XcqtKPw9z5w66+BAr5hIkSHPWYFPfw=;
 b=NUiUXiMyH5AnfXPGh1sDOaFmusDcGTOYhcQ4RF3bjgaUK+OyBCTAiqzztFVtWU3wMH
 JMki9ZWXQZbjoYzEkYr33pk+alVZZY28I2kydXD9zHKPip1V2058VvwhcR6UfrpCgYtY
 /l1LaO0PtafS64D0fgFinyZxjC7uSvNFn1b/4F1wXcEowYj88g/5uw2+GeiD1VKxJ4Ru
 3RP4BN6kjo31YPmoPrtXlvEr3Ed3XZZ8sHyo1Tc60yWjCfH5PxeBnJeJ3YjdSJaGiF6J
 /TE4Ip37TipkhnmebTY4hVzkbtjE4XkfitgZysC9s0/AX7v062Si9y/ptS91LfDLdsTk
 LgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bw6rFTkskI2G9XcqtKPw9z5w66+BAr5hIkSHPWYFPfw=;
 b=MvFRp3i8ImRAj+8ECpevrwE8V/05DMi3aet/Dz8yKor5ZntHgRc3rg4joNXBnWwypI
 YP5PSqiURxjl/lY9IuZf2snjMwZVj8Ox/+JPnL3yOYuPp6iSanF9V+zIR8ZNiV20TyKP
 ogw56Tuj/boWbuq6aortvH/nY7N562Au8ZZNA+dHjvseOOFJScz0Qz/u8T/UtTmNdh2K
 eyCV3fchaaZ7/i1mo+krA/NeCuDSKTG4JmU3yEKUvdsbDJ1heBLtuw6Uw6DH3U02A+Uc
 uP5WJjebPspvsErHQt9dutzHhEefIP6qEnNS72HVXeNzjCeRDlkXvhA7hs5bgErSvaAI
 unRg==
X-Gm-Message-State: AOAM5335elpVERGQEcReB+rIJxx+XYG+qqUtPwnv31xfG4oqVCvVIe4T
 fcOFojsOoy0r23S8XX/FqNEd5RroVU42pA==
X-Google-Smtp-Source: ABdhPJwohXfB405ihzR7q+eXDC/jKyE43hxRpgPEB1uN1j8duLj0bwsxjeEce6FnlfXBdot64r7JHA==
X-Received: by 2002:a63:5a53:0:b0:373:9a98:6845 with SMTP id
 k19-20020a635a53000000b003739a986845mr13124801pgm.88.1646724040842; 
 Mon, 07 Mar 2022 23:20:40 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/33] target/nios2: Remove CPU_INTERRUPT_NMI
Date: Mon,  7 Mar 2022 21:19:52 -1000
Message-Id: <20220308072005.307955-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This interrupt bit is never set, so testing it in
nios2_cpu_has_work is pointless.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 2 --
 target/nios2/cpu.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index b418deec4c..f582e52aa4 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -175,8 +175,6 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define EXCP_MPUI     16
 #define EXCP_MPUD     17
 
-#define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
-
 struct CPUNios2State {
     uint32_t regs[NUM_GP_REGS];
     union {
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index ed7b9f9459..2779650128 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -36,7 +36,7 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
 
 static bool nios2_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
+    return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
 static void nios2_cpu_reset(DeviceState *dev)
-- 
2.25.1


