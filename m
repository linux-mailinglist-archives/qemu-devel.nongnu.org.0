Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C736818F5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:26:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqF-00011y-Bo; Mon, 30 Jan 2023 13:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq7-0000yh-Ec
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:11 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq3-0008IP-Bx
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id q10so11991963wrm.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rq0lR9ne6I1nZstcxCOL1EodaQTBuWKIlIMnYQtQVEQ=;
 b=CWBNV5kpX6yRYgoF+3K/zfNPHilLx7rVI7ZPhV9eX5W/Q66I20JRXkNF1ugMm6S4BM
 Dd9DNjnzaWbrncSHM8BzU89sjBwqxmD2fWyhcqS1uxyGmEHHvRGpC3eBDNom5AJJsyns
 zNfrnw9nDKSs2bjpiQnUcbg84hK59iTVYEBwPeqzp6/nMibgUcaclpSAxnUyUn1Sm4dF
 ZNleYuioKtbCjP6F5IHAimgP4cx++3MtoQaqFKeIGrYtTMgK1NWXUxQCzQ5NiIFw/ANN
 5V7VGrSFu1PsGJNHcsxCeOlzJGqLewxYY3qbRaOvzWbr/JOypH5vYzzCtUTt7DpWaebU
 jiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rq0lR9ne6I1nZstcxCOL1EodaQTBuWKIlIMnYQtQVEQ=;
 b=qgfHToq25vibMVCTCWTB2Hqfxv1GbA+TkSyGlwP3TaQiYNJP4UFBZ9gu/RVIp8i2eT
 lllVbS8vfRSxle6tK+VqcNoeM+rDjyTD3pWVMBT63vropEveAy0pV8cXKHdmJh+xJZou
 +3a6mgPzF/NoYsFqmiayAq1KTfo2RV2QhB8tbEx5bSG7GRu93dx3g4LAfAPq3dchIDHS
 fQQfQMXgaiEcPA30mcYfyDYAEXnhY3GYCgEZT0qpjuwBoUysY+6wLKy5hla8i759v7W0
 FaZC0Ssr+yGWyTeX1aMylDTUOat402ODs/qljpbeml//Tq6b/guDyTxiDnXujJ7qXUID
 KlNQ==
X-Gm-Message-State: AO0yUKV2qrjQJAMnXESYLmPvTG4ONtznwm2+AcH6dG8s9SxwakdCsvz7
 UfMDjQBPLekBAUP34RunduePhA==
X-Google-Smtp-Source: AK7set/MHq2NGtButXFb0sZ+cSHbDmXBxS7gKzGnzONKFC/XNlHskhCa9MBSYWWqftPRUuDAwNQp3A==
X-Received: by 2002:a5d:5b0c:0:b0:2bf:eb2c:369 with SMTP id
 bx12-20020a5d5b0c000000b002bfeb2c0369mr320600wrb.66.1675103103713; 
 Mon, 30 Jan 2023 10:25:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/23] target/arm: Correct syndrome for ATS12NSO* at Secure
 EL1
Date: Mon, 30 Jan 2023 18:24:38 +0000
Message-Id: <20230130182459.3309057-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

The AArch32 ATS12NSO* address translation operations are supposed to
trap to either EL2 or EL3 if they're executed at Secure EL1 (which
can only happen if EL3 is AArch64).  We implement this, but we got
the syndrome value wrong: like other traps to EL2 or EL3 on an
AArch32 cpreg access, they should report the 0x3 syndrome, not the
0x0 'uncategorized' syndrome.  This is clear in the access pseudocode
for these instructions.

Fix the syndrome value for these operations by correcting the
returned value from the ats_access() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-3-peter.maydell@linaro.org
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ccb7d1e1712..6f6772d8e04 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3284,9 +3284,9 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
         if (arm_current_el(env) == 1) {
             if (arm_is_secure_below_el3(env)) {
                 if (env->cp15.scr_el3 & SCR_EEL2) {
-                    return CP_ACCESS_TRAP_UNCATEGORIZED_EL2;
+                    return CP_ACCESS_TRAP_EL2;
                 }
-                return CP_ACCESS_TRAP_UNCATEGORIZED_EL3;
+                return CP_ACCESS_TRAP_EL3;
             }
             return CP_ACCESS_TRAP_UNCATEGORIZED;
         }
-- 
2.34.1


