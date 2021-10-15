Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4E842E80E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:48:21 +0200 (CEST)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF8m-00022n-5Y
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc5-0006YW-Iv
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:33 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc3-0002me-Oe
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:33 -0400
Received: by mail-pj1-x102c.google.com with SMTP id ls18so6335456pjb.3
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wpoZicnTiBlydK+sFdKdK9FSFNaqNFWg+Zx3DgtSaaA=;
 b=X5WBD+7bcnTQNUibf/XWQDujaRiE8XXZglpfDAgA/kP2gXTnWVRfywtW6143hmEk8d
 Zld794Ip4VggTwMRRDnXmgzJA2l7Oy4R3qmhNIrN4Lc0Y9/X9sR5srDHuMSZKMO7GP9q
 YY0MOK4xt4q4TaZ1s379aeHzYDk6Z9R5XnECzyknD/r15KSctF2wvREpWFpZLGiam7Uc
 MP2BCWbpGPLgWNrKbQ/IMv9XtMU62er3ockLXT7xIHS0HywDxQ15NMJ751MQMNhR9dsR
 9ZUp5EyNiczLVKBfcipn0yq3pfa/djHvdebJnvAQnAdd4GYDV6sdzhDZzTwBrmz6LgJw
 551A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wpoZicnTiBlydK+sFdKdK9FSFNaqNFWg+Zx3DgtSaaA=;
 b=hBeqLpII2pcioL+RCB0LZPK6ec+SgUU4tFCyIgelOA9LSNz2R1xc0t3MFssaBIbXVF
 SptIk2xkek6I/RwFhgqX+Os7NadWSwJE4PIXEcstZ4gq7t/8s8ouexVvCvxbT9CcNcOT
 Wxm8yDyIW5gqOiYJX9Bk11UuMbKg2JwssEjW+3M3EMB7ODNBcwxJpePY/yvxO+MXXcxi
 Ox02t8sUN++a7iFMygDOevnm88BhMGFNxE5AG54rEcgFbovhZlJZ6juY4I837j2XkiOA
 VsxtGUmeHhD4+oQcDyr2Qi9olelaYPd66DB0cqGnX8Iu3weRDum1AiZUMa31imeHw26r
 Hi0w==
X-Gm-Message-State: AOAM531H9F76pszPBipeHd/svRdrm/ojk0N9FutNy9nqCBd6r7yFhDgq
 n2bpqnQ+u8UxkBC6QnEu+OBLWF5w5JbkVg==
X-Google-Smtp-Source: ABdhPJwIcZN2Dzt846KqpzYg1mu+XXRMZV38reNMWJMLam1ZUFU6Ck8/Av29r1xauTlWYvvyzz7+aA==
X-Received: by 2002:a17:90b:4011:: with SMTP id
 ie17mr25111929pjb.41.1634271270276; 
 Thu, 14 Oct 2021 21:14:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 43/67] hw/core: Add TCGCPUOps.record_sigbus
Date: Thu, 14 Oct 2021 21:10:29 -0700
Message-Id: <20211015041053.2769193-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new user-only interface for updating cpu state before
raising a signal.  This will take the place of do_unaligned_access
for user-only and should result in less boilerplate for each guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 8eadd404c8..e13898553a 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -135,6 +135,29 @@ struct TCGCPUOps {
     void (*record_sigsegv)(CPUState *cpu, vaddr addr,
                            MMUAccessType access_type,
                            bool maperr, uintptr_t ra);
+    /**
+     * record_sigbus:
+     * @cpu: cpu context
+     * @addr: misaligned guest address
+     * @access_type: access was read/write/execute
+     * @ra: host pc for unwinding
+     *
+     * We are about to raise SIGBUS with si_code BUS_ADRALN,
+     * and si_addr set for @addr.  Record anything further needed
+     * for the signal ucontext_t.
+     *
+     * If the emulated kernel does not provide the signal handler with
+     * anything besides the user context registers, and the siginfo_t,
+     * then this hook need do nothing and may be omitted.
+     * Otherwise, record the data and return; the caller will raise
+     * the signal, unwind the cpu state, and return to the main loop.
+     *
+     * If it is simpler to re-use the sysemu do_unaligned_access code,
+     * @ra is provided so that a "normal" cpu exception can be raised.
+     * In this case, the signal must be raised by the architecture cpu_loop.
+     */
+    void (*record_sigbus)(CPUState *cpu, vaddr addr,
+                          MMUAccessType access_type, uintptr_t ra);
 #endif /* CONFIG_SOFTMMU */
 #endif /* NEED_CPU_H */
 
-- 
2.25.1


