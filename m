Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C714F2D1C84
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:58:05 +0100 (CET)
Received: from localhost ([::1]:42538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmOWC-0004Pi-Ql
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmORV-00014A-OV
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:53:13 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:43757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmORU-0004hW-AT
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:53:13 -0500
Received: by mail-ed1-x544.google.com with SMTP id q16so15385985edv.10
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 13:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NSo7uQw+LW5Zk/MEaurkeWLiqdBxpgOS5sWCOL8p/vU=;
 b=uVNASsgd7RNtDU2zL6jRmIkmmr3sJ46WcV8GezgE+lqTjAaKmFLPa8XfGAlwPBTRlO
 VrHVxZ9CTA6rAlAxT13yXde6khY+ho5N7WWePq5XHU9GUE8QJjNG7kZLKbHCT5Tojsud
 EX3CJubpkWmMYKuEWDqOMIzJ6aYpYYtqdZT9AWLW76KOEn1lfttQjghYMhsh5MruNSuM
 vBpuC0a0Yod2962rncbZ1X8uvUCm518vJoQWuCoa0CgSXs+DtovtbiKJnHLcuR/EKeFA
 DSDPnXqYDDdUGNBcwyo6Sdsud65mmW5dRSz3qNB/cNXZ1cGxYDblSnGhXT5GoTN3kVni
 OlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NSo7uQw+LW5Zk/MEaurkeWLiqdBxpgOS5sWCOL8p/vU=;
 b=YY7z7POwGT31tNuKQvRyHNqBmrvuSKU0S98ulNMGUQVC2AESBodappiXnJQihca9+w
 I/lgB2ydYKMwyFnlTNDtG27wpurbbLrh3kotWsKs7xFMBMlWSHVXeju1pWyXsukG/x2a
 iIoZh7sxq8BRXfTI+eUL73y2Vebu+nYMq2wTQHt0f+C3cMSA2G72CyjrCft5H9w/N9sA
 ZGwB6UQtwoeeTspJd7GcHAekrdVMwgGX4iwW2pePXcIYCMuKekdgrm5qZPjQSSbR6yqq
 NGPgR8VlF7546IjYwHeN5d0GErmLarQjqVUHNusYswDyQt3OqdrMASyf0OzHs4Qa/nbR
 rdBQ==
X-Gm-Message-State: AOAM533DPyql1iuL2quA/UA5mrrMS1gofLd5FGyd/shZ3ThUE2NfXTCX
 B/1O5nemQC0tr9ayQVrY4AlcFg+Z4l8=
X-Google-Smtp-Source: ABdhPJwrxXFwsZBsSt3CyQRHyJ/YZkPg7xmr5P1/dEsMXMdHBfoFxdcz4nTwFxVel7SEoLdE+GcC2g==
X-Received: by 2002:a05:6402:949:: with SMTP id
 h9mr21662845edz.301.1607377990442; 
 Mon, 07 Dec 2020 13:53:10 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b9sm13600277ejb.0.2020.12.07.13.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:53:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] target/mips: Introduce cpu_supports_isa() taking
 CPUMIPSState argument
Date: Mon,  7 Dec 2020 22:52:57 +0100
Message-Id: <20201207215257.4004222-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207215257.4004222-1-f4bug@amsat.org>
References: <20201207215257.4004222-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce cpu_supports_isa() which takes a CPUMIPSState
argument, more useful at runtime when the CPU is created
(no need to call the extensive object_class_by_name()).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


