Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EC14B043E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:09:37 +0100 (CET)
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0m0-00070v-8z
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:09:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hG-0003uh-Dt
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:42 -0500
Received: from [2607:f8b0:4864:20::62b] (port=38778
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hE-00046X-CK
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:42 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c3so747323pls.5
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6GEKuSQX+CG8gt0Gp9cWbbYI/Mw1WHwT/DCHRQdQ0Wo=;
 b=C0+Zc979DKm0HtHVIYzphg2iahc5MEGH3giJcDjotVxWiX9WGysmtfpqykIAhJDNqL
 C6By6zaYx2M5lThzs4F9vLKkudL+HbEvbJB1cZ71+xPRacDan+RLcksfYKa3wkk/T2NF
 bN3wtfc7hgQtYW19Hea2WUF5y3wEYztDsrZnYHD4zxnqq7FUU4OfK0HBCNCZR2sbqnyf
 xos1qUn2DKUmsjRenneyiOO4CGbbd/cQhmtnv9os6quloGLDsrZ+8xkIvzmHXCOXAtTB
 tLcYfP/7TB4ItpRyh0FB6Bf7hRJFqR0On5ZLHIq+Fob8y+m/VNlxw7FParuRUi9JpOhF
 BdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6GEKuSQX+CG8gt0Gp9cWbbYI/Mw1WHwT/DCHRQdQ0Wo=;
 b=JKqYW8Bsfb5tV87JtrfRTBBsKCAE4QQoJ6Udns7VGcBrjtNBRNqN1j4C4OwM1Mozkf
 U/FJxkoZmSbRltY5X3dSwui/lJh3Tt45MWFiNfwbzJs90SfUYQsLvyIzdWlA8XtJQYua
 vKQk2Ufe2iaTFM6jVT48w6utlL5ZpsmY90NdmRFZNmlOTf5MN7BhqoZdqqVDc7PoDarH
 epCD1q5T6L8okMn8/yoArlEJgQniaDuvS3A8d/M5LMsP1dtsNl7t3cf8/5VCEnDHWmKY
 z+X+AmUlUCxhnBAcRM7spyN5AvJiX/5uDtGVFxEEO4/8Rq82NFvMGk330ylnGl0u7gvn
 0dlg==
X-Gm-Message-State: AOAM533qknUkEKsw6C0A0mGeUvlU7v9Cl1x5TMZ0TUHKzqbkrADVApZS
 VbsHymgVNAx0bGpE3v8hPCddkfxTpvr4g4QP
X-Google-Smtp-Source: ABdhPJzVGqBtuSreWgvu904LP4dfn2quNXp3d0Crw2xoyeoJqgE+Gt5mBZmpNSXHpgtwlv+9+JrciA==
X-Received: by 2002:a17:902:ccc2:: with SMTP id
 z2mr5498369ple.145.1644465878436; 
 Wed, 09 Feb 2022 20:04:38 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:04:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/15] target/arm: Set TCR_EL1.TSZ for user-only
Date: Thu, 10 Feb 2022 15:04:10 +1100
Message-Id: <20220210040423.95120-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set this as the kernel would, to 48 bits, to keep the computation
of the address space correct for PAuth.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5a9c02a256..92f19f919a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -206,10 +206,11 @@ static void arm_cpu_reset(DeviceState *dev)
                 aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
         }
         /*
+         * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
          * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = 5 | (1ULL << 37);
 
         /* Enable MTE */
         if (cpu_isar_feature(aa64_mte, cpu)) {
-- 
2.25.1


