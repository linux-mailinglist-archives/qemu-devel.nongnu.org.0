Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F72D1F35
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:45:55 +0100 (CET)
Received: from localhost ([::1]:33814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmR8c-000088-6h
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0R-0003hl-AM
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:27 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:43493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0M-0001Bf-BE
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:24 -0500
Received: by mail-ed1-x543.google.com with SMTP id q16so15742404edv.10
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MK8p5/JI65dnw9C1ehTkiB134CDjpILH//LVRSp/y+4=;
 b=JQl/Lo9e1zD8sKqZt3xpzQFcocffgbQx0fKnBHhbv6FBOLuLCO9k7lVYKsJTNdKQqF
 9htsecuIE89uLySufcQcCJeDYqtqhaCzIL0Vz42GOnr/yHxj9k2ZOEbmGVDlqPepyfYR
 +oGVjn36ZaHyNmoaKv9jOU28pGlVakxJWXO6rUVJyKMP9PB1nXyCN5TLBWPKnnowyRf7
 WoU16EIQcG7jdG+GK09141mtaSlZOy+4Qufd4urUEhybldeYJPIRSE8jlQb3siR3zYPf
 WRoE2i5jXtmOdKxxBmvslG3lxAdal662tRyBzq08D98AhN+0U+i8dLD6VcH1HzLMJLHb
 3uHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MK8p5/JI65dnw9C1ehTkiB134CDjpILH//LVRSp/y+4=;
 b=MqshWDg5XOJElwMpuywQ2TAVu/6/HX146xurAFqfLh+LrFMw6ZgBC70uTGAtzuHPTu
 Gb+1dT7vn0hnad94jhP5vjuyhkhAmD48tmWFpK8VFAcm8idHbjoLQvGCvS0faZjt/AhH
 dSgcvHyCQ0P/Oo/9jx49eZ8+KGzgRJxC2ZhugGoWNBzNE5HMJInidfRatesBsXdkflEX
 6ZpIstnUdzyNzL8Gg5vUhyxb20w33H779i0HHJuee8pllK7wL6C2/swH5QFr3xiEoREr
 bC+1KtAmGAUb6me9ch1gpdhxeFNxamFEx4p5T3eHkT4QSgpLXoURhIDmvepBdUcKbfj1
 Cg9g==
X-Gm-Message-State: AOAM531r/Qkne02emW0Ze/8m5b41JhB31JYtDrR9IPVnsrVderfA/GkZ
 VILX0RoGM8X5VXx+p66J608W0Fp59WI=
X-Google-Smtp-Source: ABdhPJy0ccuK5jL3JysApdaWIyvf2n1/KBpbrQZrvbU7b+igqqSrf0FVUEuZq3kXmcBjiOns4mB5ww==
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr4216622edy.318.1607387840868; 
 Mon, 07 Dec 2020 16:37:20 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v18sm15235520edx.30.2020.12.07.16.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:37:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/17] target/mips: Use CP0_Config3 to set MIPS_HFLAG_MSA
Date: Tue,  8 Dec 2020 01:36:48 +0100
Message-Id: <20201208003702.4088927-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
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
index 6b9d1d4b93b..3bd41239b1d 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -379,7 +379,7 @@ static inline void compute_hflags(CPUMIPSState *env)
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


