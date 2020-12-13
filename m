Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEEB2D907C
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:25:36 +0100 (CET)
Received: from localhost ([::1]:33782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXvz-0000h3-E8
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrP-0001zn-RT
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:52 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrO-0005Rc-EC
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id i9so14391283wrc.4
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vnT/tPVrq2N2FYMYgZtTYaFHIckks0AviU81Qc91KKs=;
 b=e7LJbWzXLCuWedqjvI5ydJ2stCtieu6T9nS0X2Z2XF1+hXLOERf0REW678SVLmTByf
 /KpoBrysIy6bH9ANZcG8c3oIefq4OOZdzYwUW/Hx6z6ZzcPJ6MKk/m01+u/1jayMf0n1
 J2Yb+7rQOJAifWCWTnmJ4kUIf4Xkx0uPWSDB0dRgQcV6iEydsv3upnUr04u1av3QxYKr
 Bp5FiYV4ab/2n/IR81zIlZ0p7RnBOUVGw4x2JBLaZdnAJLZ5KS0rp52l8MZtUqADo9UN
 mU7V24Xf1Sb7ebVUWeQQXyZcvtg9KJPohNXC2l1NaGFTMVoAi0s2yE3CYR4SOh/0Hnt5
 CnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vnT/tPVrq2N2FYMYgZtTYaFHIckks0AviU81Qc91KKs=;
 b=qetY5km+s6Uvv/Q2vP7j53/NFC3mDi+HzC1nZ7362c9R4/eaBJUgB/myMgImEaNYFO
 opjt3pNCfpu8EVxDNzoU4HS+gYEpp7wyBfPKvKQu9qxKOq084UMp4xhlg9eE933kQlGd
 a8dwJCS3vER467jsoIsld3zeC0PQinqM0DkXxwxpf3EJIlMly2jUti64WIEhDOlgkFHh
 qMlQxHWmIwxV47r5inQVJurmXmZjUIWOUuj3h6BUTNqEHVR8iiVqP+H9Tce+aJkrldJ4
 MhBo1gryI4d5HM/Akum+nkflUjcMKVvEfcM/D9vZUAE5xtWvmDRa5M+GhVTDpCsqkKUL
 G5CQ==
X-Gm-Message-State: AOAM533rBkX4rVX1HVj7b0hCCgLCKifNrkG3xzcGZmPzte6+3rc3MTbZ
 PNdXXk7B7d84O1STDTBAhGW/SKFGa3E=
X-Google-Smtp-Source: ABdhPJyNXoF7M7zDUTyKW48WK9Rf71RnICejRsTbBIzFiJxN3s8CoHQZP6272kqsV94+tQ9HPAT6nA==
X-Received: by 2002:adf:f344:: with SMTP id e4mr24467434wrp.25.1607890848889; 
 Sun, 13 Dec 2020 12:20:48 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j15sm28136891wrr.85.2020.12.13.12.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:20:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/26] target/mips: Introduce cpu_supports_isa() taking
 CPUMIPSState argument
Date: Sun, 13 Dec 2020 21:19:32 +0100
Message-Id: <20201213201946.236123-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce cpu_supports_isa() which takes a CPUMIPSState
argument, more useful at runtime when the CPU is created
(no need to call the extensive object_class_by_name()).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201207215257.4004222-3-f4bug@amsat.org>
---
 target/mips/cpu.h | 1 +
 target/mips/cpu.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 9c65c87bf99..e8bca75f237 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1287,6 +1287,7 @@ int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
 #define CPU_RESOLVING_TYPE TYPE_MIPS_CPU
 
 bool cpu_type_supports_cps_smp(const char *cpu_type);
+bool cpu_supports_isa(const CPUMIPSState *env, uint64_t isa_mask);
 bool cpu_type_supports_isa(const char *cpu_type, uint64_t isa);
 void cpu_set_exception_base(int vp_index, target_ulong address);
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 76d50b00b42..687e2680dd1 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -310,3 +310,8 @@ MIPSCPU *mips_cpu_create_with_clock(const char *cpu_type, Clock *cpu_refclk)
 
     return MIPS_CPU(cpu);
 }
+
+bool cpu_supports_isa(const CPUMIPSState *env, uint64_t isa_mask)
+{
+    return (env->cpu_model->insn_flags & isa_mask) != 0;
+}
-- 
2.26.2


