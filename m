Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B15F0CB4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:47:30 +0200 (CEST)
Received: from localhost ([::1]:52856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGMT-0006E0-9y
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAw-0000a3-35
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAg-0006Tn-HL
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso5064701wma.1
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=imEm8w++jV+IWXUhacU2AqCzT3xaB4Wyvb08UtO6IHo=;
 b=pSaYEbaDPim8DBnGM4T3g7g+xU9Mzd9sMWRyzC1JNWBuV4FaWWiEE7/K9z73vyKO6t
 em2Yjrtq+XLSh06ET3BMBT8s7OGNVcRZHYF9QTXh9XE4NsnEvT1oEALWeak8pqDYUJYG
 8aFw8FKkBUyanpviGgrkVOUU0AwJtiKp+dkm9VWYt0P6wcoY0Zscz3Cd0pQI577xuzuc
 8jIvtzHaz1S02CvsN8s/QVBu1IX2xtWC+RypN1IEGba3cQJdb6E/BOdsCT9An+7vZ1ZJ
 zDWi/HbAGsmkvaNjGJB34QvtLz9eUjSCX2psduej/iWiWPKwzPEDbtVBeBWLtpXYQsvN
 Y1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=imEm8w++jV+IWXUhacU2AqCzT3xaB4Wyvb08UtO6IHo=;
 b=BtkgXHSD3fs0TTQmtPVDMq31AiOz/QMocx/r7zox/GOw8QuXWFZ4YHszUAPCb6DuYv
 bTyoCZsDNPJmSP3ZD4yn/+mgwJZ+6HkrGINt9bmpZBQDrM3+FyOIRAdIOvSvsYTPX8RI
 56HW6gUwHxN3Th8i/UXPUrsq9Bp0g1QfArxzVnpXfwEGoIpjuD4fwdE+9xv+rHaqADcZ
 qwmlv+QQEzlG7YlD8SOFEo3rZhiXLpGnIVPGpCj3oFCtLRltw5gJ5+gVYe4sA/qf/+VK
 J8j1JYuUaBsZPCRessy3nMaDqOBsKh1DKSx+wd4dikCbgwGFeSLqziWESOstYsE/MeJp
 PWcw==
X-Gm-Message-State: ACrzQf1w3TJhUjFsMCVuFPgjJ2/frrttVcGR8sdTzAcnZW4plnt26e8A
 kxHb7AhALNItFgA7xdHWL4Nz1e3ClV3spg==
X-Google-Smtp-Source: AMsMyM7LDoTazrIHb2H87S05nk33ubaWeoOUycSFKAvFkrImFSgOtRoWxtGm6giG+1nLHWrsXJmXiQ==
X-Received: by 2002:a7b:ce97:0:b0:3b3:4136:59fe with SMTP id
 q23-20020a7bce97000000b003b3413659femr5956569wmj.24.1664544916646; 
 Fri, 30 Sep 2022 06:35:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b0021e4829d359sm1982551wrj.39.2022.09.30.06.35.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 06:35:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] target/arm: Update SDCR_VALID_MASK to include SCCD
Date: Fri, 30 Sep 2022 14:35:04 +0100
Message-Id: <20220930133511.2112734-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930133511.2112734-1-peter.maydell@linaro.org>
References: <20220930133511.2112734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our SDCR_VALID_MASK doesn't include all of the bits which are defined
by the current architecture.  In particular in commit 0b42f4fab9d3 we
forgot to add SCCD, which meant that an AArch32 guest couldn't
actually use the SCCD bit to disable counting in Secure state.

Add all the currently defined bits; we don't implement all of them,
but this makes them be reads-as-written, which is architecturally
valid and matches how we currently handle most of the others in the
mask.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220923123412.1214041-4-peter.maydell@linaro.org
---
 target/arm/cpu.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 33cdbc0143e..429ed42eece 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1334,11 +1334,15 @@ FIELD(CPTR_EL3, TTA, 20, 1)
 FIELD(CPTR_EL3, TAM, 30, 1)
 FIELD(CPTR_EL3, TCPAC, 31, 1)
 
+#define MDCR_MTPME    (1U << 28)
+#define MDCR_TDCC     (1U << 27)
 #define MDCR_HLP      (1U << 26)  /* MDCR_EL2 */
 #define MDCR_SCCD     (1U << 23)  /* MDCR_EL3 */
 #define MDCR_HCCD     (1U << 23)  /* MDCR_EL2 */
 #define MDCR_EPMAD    (1U << 21)
 #define MDCR_EDAD     (1U << 20)
+#define MDCR_TTRF     (1U << 19)
+#define MDCR_STE      (1U << 18)  /* MDCR_EL3 */
 #define MDCR_SPME     (1U << 17)  /* MDCR_EL3 */
 #define MDCR_HPMD     (1U << 17)  /* MDCR_EL2 */
 #define MDCR_SDD      (1U << 16)
@@ -1353,7 +1357,9 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define MDCR_HPMN     (0x1fU)
 
 /* Not all of the MDCR_EL3 bits are present in the 32-bit SDCR */
-#define SDCR_VALID_MASK (MDCR_EPMAD | MDCR_EDAD | MDCR_SPME | MDCR_SPD)
+#define SDCR_VALID_MASK (MDCR_MTPME | MDCR_TDCC | MDCR_SCCD | \
+                         MDCR_EPMAD | MDCR_EDAD | MDCR_TTRF | \
+                         MDCR_STE | MDCR_SPME | MDCR_SPD)
 
 #define CPSR_M (0x1fU)
 #define CPSR_T (1U << 5)
-- 
2.25.1


