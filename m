Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925257055B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:20:38 +0200 (CEST)
Received: from localhost ([::1]:53990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuH6-0002T7-Vr
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvj-0006hK-LV
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvd-0002nJ-6O
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:31 -0400
Received: by mail-wm1-x32e.google.com with SMTP id l42so3021510wms.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=korErL6tl7BONUfbCJvMnIcz8S+EeAk7Q1N3xczdPYQ=;
 b=aNRZw6Cv3AT25izA7eoSLfHdSL8q/3m51gaXovFYWRCtJC3ywnNbqQPHbED+OWP20T
 MZFKO4Pg4pDZfZT7wz+/VnkDXfD6pCbMBeM5fM+xlxjIAuregI57lWUqyzyu1Y5tfE/D
 b9iTDtQETUW99DYvPkzWx+NXbnFatFkh8jjHOpkiKVJuc9Q+G0w1ftBkgFZk9kBpJEs3
 SArHKUbRZ9ClsARGJUAA0U6ImxK4kxPK0kznl/KPCLGiHNAWrJO21neYouoINKqV3zJ1
 z+9UqbAxNI8RrhEnT3lChQrlylQTu9ipyEVF9wzr7fUmXeE2IPz8cOwIrGpfikJoP/GL
 URjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=korErL6tl7BONUfbCJvMnIcz8S+EeAk7Q1N3xczdPYQ=;
 b=h55P6221mNulEFV+2R8j9ZarExWfvkKHyZyds+5+5RsCBwemEBNwUTDlZXquwS4q20
 5SOjhPFgH1gyGlz2ZDXBc5BqkB0HnE8Bij/9BM85NH6YQ3A3yly6u3aHmEwWoN+bk32Z
 mfjXXmBT5fmgjzeySU8Kvj0dPdLluRrYehey8m/GyIJupsLgxGpR76eaZ+upZGPDIlcO
 CfWYlrTf6w6hNXNJNCbfydJKIt31w3CcUZbNqwfx9zLCYqWxBVJHaO77bud9CuH+QP/z
 I05CrzsaVQcwpYQKpBC7CTFS48tzwX68PaqRqb192wUr72WzLcKOW0Nvpl0i1GBTn6ZY
 oPrg==
X-Gm-Message-State: AJIora/NiP/Hmg7hZ2EmYPBQRX6bDQ8FQmR8QKtb2OCDLL6A5Iq35e/N
 bDNCgpY/0XTmC3xmBuZI5TQG+JKFSrXvSQ==
X-Google-Smtp-Source: AGRyM1uNLp7QGqT8fRvkEElE0cRzvxPnlsxCDGjiEeaCgRvlBs1+wfh7aDFnX53pnV36wUl9gECRvA==
X-Received: by 2002:a05:600c:4eca:b0:3a1:9c39:ac20 with SMTP id
 g10-20020a05600c4eca00b003a19c39ac20mr16217566wmq.61.1657547900178; 
 Mon, 11 Jul 2022 06:58:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/45] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Mon, 11 Jul 2022 14:57:38 +0100
Message-Id: <20220711135750.765803-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-34-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/target_cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
index 97a477bd3e9..f90359faf20 100644
--- a/linux-user/aarch64/target_cpu.h
+++ b/linux-user/aarch64/target_cpu.h
@@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
 
 static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
 {
-    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
+    /*
+     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
      * different from AArch32 Linux, which uses TPIDRRO.
      */
     env->cp15.tpidr_el[0] = newtls;
+    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
+    env->cp15.tpidr2_el0 = 0;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
-- 
2.25.1


