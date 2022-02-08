Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77F04AD861
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:35:37 +0100 (CET)
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPia-0004kW-SB
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:35:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqw-0000p7-Nj
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:10 -0500
Received: from [2a00:1450:4864:20::42e] (port=37437
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-00029Q-80
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:08 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w11so30204489wra.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BBV95CWsxDrWvVC9C6IsOCCdTEjqLMSargWjpZxMzYw=;
 b=X7/9h0bRBaQ+1muTp/W2It/S2Uspmx0PWoodWrnPntpDFCH/e/5iRhFjbTOwPxlcoj
 pq7WnadD1mbQuq1SLnDhBNhUcZoYm3bwAi1aouSDyurrUimuv+tSBBBm5KjZGW4d2Z21
 LHZjFvETbVvNCZ3dwghjv02H2A3HiAXXHQiqocg+piiIiWtzvixW8dorGT+6/tLr0T/L
 QwVrsig5JL9DBNoHpytzUBkwwnM/PDA7j6W2nhQk+s4WPigXXzhIgkzh0eoFN2oEB03m
 pxBpMO6tq5Id3klbO4wBy+imN47TbmRfUB/9+AyOKL6lYSzGlYl70nCGBosbtsKDxAta
 xGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BBV95CWsxDrWvVC9C6IsOCCdTEjqLMSargWjpZxMzYw=;
 b=TIdH362/RrQhwI7E4NWFUJ6xx8EH9TFVCLOcSR1vrjdM19949RRI5Nx+bvVtUAFTmz
 AC4OM05CJt3cETIXGaD7fK9q9KAyUSs25ELZQV/nv0LgYatC/Lz5yBAyKDwQZGSc8Mdd
 sWm33macBT70JlK48UcbjkBvMqVmH9S+wvfkJpF+H4bYTU5rolnY/Tn8yoAD8VQ4uktD
 rMoGL8P3K0qdVq1143HzMpTnrj2gMVcWhbZT4Yt0gBj0HOxw9mMAgqoxYJDa2m2Mdcpg
 MmsJBtikmrNMkno88Al8F55FYFWhHabM828E9FSGlZ7iI0rHMk6AaCWHcxgRKpnv/PN8
 iVmg==
X-Gm-Message-State: AOAM532ol0kmKF6or0TCcP10F10xVJvE+fzeaT4eBHrstU7B+xwAN8zl
 1UbqozqpVaaShpkfkv21hMSfwqBYhoe/lg==
X-Google-Smtp-Source: ABdhPJx+6kDXcPwS/3h8b/KBRTAvQwfg0BaO6/9SuuU4M3GKs6gLnhnRlIZsBCGfQXAAUTqyDKJjng==
X-Received: by 2002:a05:6000:170c:: with SMTP id
 n12mr3304385wrc.380.1644320405087; 
 Tue, 08 Feb 2022 03:40:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/39] arm: force flag recalculation when messing with DAIF
Date: Tue,  8 Feb 2022 11:39:32 +0000
Message-Id: <20220208113948.3217356-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

The recently introduced debug tests in kvm-unit-tests exposed an error
in our handling of singlestep cause by stale hflags. This is caught by
--enable-debug-tcg when running the tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Andrew Jones <drjones@redhat.com>
Tested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220202122353.457084-1-alex.bennee@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index d6a6fd73d96..7cf953b1e64 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -83,12 +83,14 @@ void HELPER(msr_i_daifset)(CPUARMState *env, uint32_t imm)
 {
     daif_check(env, 0x1e, imm, GETPC());
     env->daif |= (imm << 6) & PSTATE_DAIF;
+    arm_rebuild_hflags(env);
 }
 
 void HELPER(msr_i_daifclear)(CPUARMState *env, uint32_t imm)
 {
     daif_check(env, 0x1f, imm, GETPC());
     env->daif &= ~((imm << 6) & PSTATE_DAIF);
+    arm_rebuild_hflags(env);
 }
 
 /* Convert a softfloat float_relation_ (as returned by
-- 
2.25.1


