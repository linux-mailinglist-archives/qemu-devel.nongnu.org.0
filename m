Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199ED699B08
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:16:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnD-0007yZ-9C; Thu, 16 Feb 2023 12:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnB-0007ul-8E
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:33 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShn9-0007o5-AR
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:32 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v30so1349468wrv.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a6imo2uk4gluBMlTk8m75RyQDRZFDd/gMQZ6xj9C6ro=;
 b=aYk+RePKgdyghgdkT6evJzvW7mRPtwxY7gO9cFCEN3ovEELv8UjbRIDZm2chHCPuPr
 wUkVm/utMDxJ+rfB/2AcOuxMfJGNU7dBG7M+tD9DJjN5Uy4EeWXkHavcx088JQKIduV1
 XcO0HH9Vj5zfYp+B/S8RkSW6aw8npVb6uVtyuN0RBMqhJJ1BWpEEL3HiRqLRJ/9bT8uW
 KgVf/4c4i8RDFYttzuDT8bT2+VuVePbXT7gvxZArV7HzHaUMDkL7b/8JIKzbgJP0MaSH
 fBqq8fahjKPrtS2XncFzDTus8A90Te7T5apYCtVbkbFgE2xkh3lisTG78fUrsrLLdLAi
 ZYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6imo2uk4gluBMlTk8m75RyQDRZFDd/gMQZ6xj9C6ro=;
 b=fZY/5HSTjtZuKQevVAk3KhMhRu45+B4M19+s2g/IQMnHXbjzEwKn5qGgFjNkjoOrgX
 IPI86aquraagjjjqm/FGNGgtffpRUXtziFqyEfPurXXluWHn4YaTi252zLFOuqNqwxTT
 ZbAPapytfZVYHs2rJmjHfluLdqrArSC1nCuMHa953f/tV1w+Khmbi0n6Zd11SUns3isn
 ZUDhLtd4DUavYzDnwOIj5dQTOpFv747MsAUNbGTph40cLiYnAuNNc7ypPHBAQUlCKL0M
 h0X7HbVmoETrvJZm9Lf5FzQs8VGrdPupf0DKTWEZ3NMHzLU2vVhujqSiTDEt+x+A12KT
 Lx8g==
X-Gm-Message-State: AO0yUKXTsXQM0lmwGOiPfTWHCqEbaOryB/U557T+svG2ocYhUsqmFQNM
 PY0Fxo+s+Tk5Ufp/jJhNaYlXLmV/WTpCcAsj
X-Google-Smtp-Source: AK7set+cvu4Bp8kksxcucyXV/zrGt8CZuvZR219NuZmwAkEiapSLlkHDP0vSZdV2HT7U7yQDpUyKKg==
X-Received: by 2002:adf:de8d:0:b0:2c5:4dd0:5df6 with SMTP id
 w13-20020adfde8d000000b002c54dd05df6mr5002367wrl.41.1676567490606; 
 Thu, 16 Feb 2023 09:11:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/30] target/arm: Avoid resetting CPUARMState::eabi field
Date: Thu, 16 Feb 2023 17:10:59 +0000
Message-Id: <20230216171123.2518285-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Although the 'eabi' field is only used in user emulation where
CPU reset doesn't occur, it doesn't belong to the area to reset.
Move it after the 'end_reset_fields' for consistency.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230206223502.25122-7-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 05b9012cee9..1c1e0334f01 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -721,11 +721,6 @@ typedef struct CPUArchState {
     ARMVectorReg zarray[ARM_MAX_VQ * 16];
 #endif
 
-#if defined(CONFIG_USER_ONLY)
-    /* For usermode syscall translation.  */
-    bool eabi;
-#endif
-
     struct CPUBreakpoint *cpu_breakpoint[16];
     struct CPUWatchpoint *cpu_watchpoint[16];
 
@@ -776,6 +771,10 @@ typedef struct CPUArchState {
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
+#if defined(CONFIG_USER_ONLY)
+    /* For usermode syscall translation.  */
+    bool eabi;
+#endif /* CONFIG_USER_ONLY */
 
 #ifdef TARGET_TAGGED_ADDRESSES
     /* Linux syscall tagged address support */
-- 
2.34.1


