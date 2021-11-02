Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C4C44395C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:10:12 +0100 (CET)
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2ux-0000o9-E3
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f3-0007So-9V
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:45 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:42562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f0-0002rn-2K
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:44 -0400
Received: by mail-io1-xd32.google.com with SMTP id n128so563003iod.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DBw1z07QxBjDRozLTIiFysXXDLukelVSqTbuJA83t5o=;
 b=vbCTh54/CADMH+2MA3WMBgkSSWLDBfiuc/042J+pOc9s5kz+L+ZOzpr6YtNuITV8f0
 Trr4IH1R/Rmr6ZB31dIcNe4gvU7c2qrlKoN4ZSbfBdVyDoxa86suuPMBVSXTGNN8ZG6A
 Qdxr5v2SlkIn4+8iMjpbRvk2jKCUQekFEjcXwfkQqVZttfZIrsUXYse+0B79lzNaU4B3
 fKvNTFmQbwBwtDlWCP55Lq/mPx+lb23flQV3LYWFBMJGqgeA0BRiZKJiuFf7XXHqzFO0
 ELb6IW5OcB0MqSIW8PKkTNn6zddB0yKz/kxte83AJmzspmJHWIxlLU57VwrYY6RCTfG+
 r2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DBw1z07QxBjDRozLTIiFysXXDLukelVSqTbuJA83t5o=;
 b=PE7Qi/NCv1eEn/qC02GgiNUH+kK2U00tCajypAX5wVPAZ63oheiXEB74MX8gMQOF4z
 ziwV1PqXvze31NPdX0IsIYANHTf9ADrayRPHSO1j2aKxIIQLI9uI9fG510vfHJ0liA37
 Ng+Kmjr3YC4G00ggV6waW1pnB3v+4vnmF88wqc03xF336Hl0flsIqnyl5JC8FMZv9wV8
 X8EPIkRngpLV7KzqN/rihOACfrg68qC6s7FSCZtiwqhfmcK9+e9De8QER6LOiu6Z1eef
 d7a0/HqvuuY9I5umBrynowYP09MbUjrcRMJYzUYG42PywjYrFWvx/s2tfm9NjZbGLkRm
 Z7+A==
X-Gm-Message-State: AOAM533wydUboflky+mK5Lkg4AbcopYAfyTS6KClFarb6zldFNrs+YL9
 PIe1ArlhPr493RC+gJVq3pMIX8DuRu2ueA==
X-Google-Smtp-Source: ABdhPJxF6umoMF9236OevwoUlaRrGwaQDt1jCgcqMbXn7J4pRuhLe2jZhE+r4aZrYh/tH+lgLXwVjQ==
X-Received: by 2002:a05:6638:144d:: with SMTP id
 l13mr30268056jad.121.1635893620870; 
 Tue, 02 Nov 2021 15:53:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:40 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/30] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
Date: Tue,  2 Nov 2021 16:52:38 -0600
Message-Id: <20211102225248.52999-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 973183d99c..3aaced474b 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -54,4 +54,24 @@
 #define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
 #define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
 
+/*
+ * Floating point register state
+ */
+typedef struct target_mcontext_vfp {
+    abi_ullong  mcv_reg[32];
+    abi_ulong   mcv_fpscr;
+} target_mcontext_vfp_t;
+
+typedef struct target_mcontext {
+    uint32_t    __gregs[32];
+
+    /*
+     * Originally, rest of this structure was named __fpu, 35 * 4 bytes
+     * long, never accessed from kernel.
+     */
+    abi_long    mc_vfp_size;
+    abi_ptr     *mc_vfp_ptr;
+    abi_int     mc_spare[33];
+} target_mcontext_t;
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


