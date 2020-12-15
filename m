Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73A52DB6D4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:02:00 +0100 (CET)
Received: from localhost ([::1]:48418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJKR-0006IB-Oe
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHC-0003IZ-MI
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:39 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:37847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHA-0003hd-2B
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:38 -0500
Received: by mail-ej1-x643.google.com with SMTP id ga15so30035760ejb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74tnrNw+u4pr5iFSEHUsfynOPkwscuzwVbsLeoiPrug=;
 b=RtfvwoVk7Mzw/dylvxtjrTqWQj3l6D3IVMuqLvrBYihy6Ky+DdEmPh7kYq9vx/u4+9
 zrpqzx+QC1+jQmK1h6xKi+rxA0kdSPUsmFkcrJjEHsRFgXBy74LRRWKgbd2BlFilLz9b
 h/KiTiZDcnf+SM/rJ86ct5rK1PkmaltZeKTzz5+HkBObcgtDtMioCzbjhm/f0pKqlD3f
 JipOCfLPSPCxZ2FkbiQ8isFK1BvJY8Idyl1LHTHppeFLyVUjSjXN3fueMgPcVLssER6o
 MfdBM69UQgqGzA6zRw8eWV9+QPSP0EteFg6aki6wdZiEh7NjKFCLiGppVEs99VHCFxoG
 y+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=74tnrNw+u4pr5iFSEHUsfynOPkwscuzwVbsLeoiPrug=;
 b=OAZYlzF6a4uWCsI1z8pWJBmP1c0ua+4gm6T0Q4019KvKsQEZFvMag0IdUe9TVRX4ML
 NI6D11h2NrF/nuf5DfRDIcZgkhbVKBEmG9WK+WtqB1pz2v+k5aYdv08igaNVSBhnhZF2
 bN4ApdhQefYSSguI/HEXlxQM/EN71Wb8jZLyNLW/oOoMJgU4t9RS6+Y4JM4yqKk8rlqJ
 OjusXxFwK0um/KJq54Ny3ZIJh3cboqnmEnW5z8PV71Fht/AFkmwsBfLfujP9dzvwXfAj
 5QQ5vtqiVjDStAM2GKChVnht1WMSNB6Hi+cpyQM4oqNAh+UyvtPnBxw63GrDTqP5J3eE
 DAhA==
X-Gm-Message-State: AOAM532is5d48Wy8xEKTA1O55TPR3OZ21G6O9+ZVHnXbKasEKCyWOuXH
 9J3izeTMr1Enr2rDcxJ7Vh8=
X-Google-Smtp-Source: ABdhPJyHJfU6cpbNmDQETSsJGW3gJhXZe5NIxiaFlY9+UOp46AEFZAvVF2OyKmVq3Soh+D7y3deHsg==
X-Received: by 2002:a17:906:814a:: with SMTP id
 z10mr27884807ejw.96.1608073114782; 
 Tue, 15 Dec 2020 14:58:34 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id p24sm16660815edr.65.2020.12.15.14.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:58:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/24] target/mips: Use CP0_Config3 to set MIPS_HFLAG_MSA
Date: Tue, 15 Dec 2020 23:57:39 +0100
Message-Id: <20201215225757.764263-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MSA presence is expressed by the MSAP bit of CP0_Config3.
We don't need to check anything else.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 968a3a8db8f..1ab2454e61d 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -378,7 +378,7 @@ static inline void compute_hflags(CPUMIPSState *env)
             env->hflags |= MIPS_HFLAG_COP1X;
         }
     }
-    if (env->insn_flags & ASE_MSA) {
+    if (ase_msa_available(env)) {
         if (env->CP0_Config5 & (1 << CP0C5_MSAEn)) {
             env->hflags |= MIPS_HFLAG_MSA;
         }
-- 
2.26.2


