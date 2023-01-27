Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075B267ECEB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:59:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSxA-00015X-1A; Fri, 27 Jan 2023 12:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSww-0000u5-La
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:43 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-000612-Mi
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:42 -0500
Received: by mail-wr1-x429.google.com with SMTP id b7so5691809wrt.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/WSW/Q6d6knH8GYl/FV3+A6K1hH7FB23VjzRgI84OKw=;
 b=D7hZvGkNqUTj5kfiqMAnTYGx/9G+zF5kVmLt1RijWhS9j0fvy/x9b1ElKRhbvv//NY
 mzwtYkrs/m54xk0LglUCyec0Nkq9OFPHmx/D8xiJlXHs9aEdXElaKj0Mk3nTJNa4YRnH
 pQMEJzFc7nkAy3Y4rVqZarG8RmbsCrddQkkszHsr46rYD4N1MJMfeRN+/v3Au14TKNzG
 o04yhezdq67MxSJcRZveo8++7C6h30KFSv028itt7IeLv5Yu4wmKKz1CsNM0t+lA+gkJ
 SXfVVpQN0xyD0HR+voA8i5e+xG8qAFri3J/DA7dpfVcovke7uzxsqgqFvBqK6FfEZVaO
 PzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WSW/Q6d6knH8GYl/FV3+A6K1hH7FB23VjzRgI84OKw=;
 b=eMsLXJuDCz6bQXWVq2/sGJ5rzVNKYEKxZ9ivDYK6aucGluQfy7iNelpk2H4iYj/75I
 hBJ2vEigi8jvQZYy2/YXkkVv0qT/LsdZEbBaDJ/vTFbTHLXS/lJbqy25VfpXpkRcZ6ez
 yGGyG84PGyXwg/igrYpw2PIBeo04TWTNYGJJ3NbXoyznQPG9dGMvtQVbXP4UNTwdRIfk
 jZ7w+OvppUe9BwRHuon70s7Vg0xOgrk/Se/zezry0wlqXvK2+y5U469Kcxg6AvGkjMZ+
 FVs+/8/UnKDU0hiMMe9hsjx42mFh5x8Op77MBi/Bxr1CIp6SvoD8RbFtfCMEAh7TEZvc
 6uDg==
X-Gm-Message-State: AO0yUKW5TURDaan34BDLV6ogA+vxgERl5ck55QNGhu/UyTr/LX0pzxcM
 8Gk42rNWmTMgtg0x5MCxLOv05w==
X-Google-Smtp-Source: AK7set+8zm7oDIeM3LFSGxop6olYYMKYf6RAazU/A17pezXED1YlskiU+BMRgTFi91i1Onk5OUBviw==
X-Received: by 2002:adf:a2d4:0:b0:2bf:cfb4:2e1 with SMTP id
 t20-20020adfa2d4000000b002bfcfb402e1mr3732882wra.45.1674842118617; 
 Fri, 27 Jan 2023 09:55:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/23] target/arm: Define the FEAT_FGT registers
Date: Fri, 27 Jan 2023 17:54:52 +0000
Message-Id: <20230127175507.2895013-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Define the system registers which are provided by the
FEAT_FGT fine-grained trap architectural feature:
 HFGRTR_EL2, HFGWTR_EL2, HDFGRTR_EL2, HDFGWTR_EL2, HFGITR_EL2

All these registers are a set of bit fields, where each bit is set
for a trap and clear to not trap on a particular system register
access.  The R and W register pairs are for system registers,
allowing trapping to be done separately for reads and writes; the I
register is for system instructions where trapping is on instruction
execution.

The data storage in the CPU state struct is arranged as a set of
arrays rather than separate fields so that when we're looking up the
bits for a system register access we can just index into the array
rather than having to use a switch to select a named struct member.
The later FEAT_FGT2 will add extra elements to these arrays.

The field definitions for the new registers are in cpregs.h because
in practice the code that needs them is code that also needs
the cpregs information; cpu.h is included in a lot more files.
We're also going to add some FGT-specific definitions to cpregs.h
in the next commit.

We do not implement HAFGRTR_EL2, because we don't implement
FEAT_AMUv1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h | 285 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h    |  15 +++
 target/arm/helper.c |  40 +++++++
 3 files changed, 340 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 9744179df01..cb3dc567819 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -230,6 +230,291 @@ typedef enum CPAccessResult {
     CP_ACCESS_TRAP_UNCATEGORIZED = (2 << 2),
 } CPAccessResult;
 
+/* Indexes into fgt_read[] */
+#define FGTREG_HFGRTR 0
+#define FGTREG_HDFGRTR 1
+/* Indexes into fgt_write[] */
+#define FGTREG_HFGWTR 0
+#define FGTREG_HDFGWTR 1
+/* Indexes into fgt_exec[] */
+#define FGTREG_HFGITR 0
+
+FIELD(HFGRTR_EL2, AFSR0_EL1, 0, 1)
+FIELD(HFGRTR_EL2, AFSR1_EL1, 1, 1)
+FIELD(HFGRTR_EL2, AIDR_EL1, 2, 1)
+FIELD(HFGRTR_EL2, AMAIR_EL1, 3, 1)
+FIELD(HFGRTR_EL2, APDAKEY, 4, 1)
+FIELD(HFGRTR_EL2, APDBKEY, 5, 1)
+FIELD(HFGRTR_EL2, APGAKEY, 6, 1)
+FIELD(HFGRTR_EL2, APIAKEY, 7, 1)
+FIELD(HFGRTR_EL2, APIBKEY, 8, 1)
+FIELD(HFGRTR_EL2, CCSIDR_EL1, 9, 1)
+FIELD(HFGRTR_EL2, CLIDR_EL1, 10, 1)
+FIELD(HFGRTR_EL2, CONTEXTIDR_EL1, 11, 1)
+FIELD(HFGRTR_EL2, CPACR_EL1, 12, 1)
+FIELD(HFGRTR_EL2, CSSELR_EL1, 13, 1)
+FIELD(HFGRTR_EL2, CTR_EL0, 14, 1)
+FIELD(HFGRTR_EL2, DCZID_EL0, 15, 1)
+FIELD(HFGRTR_EL2, ESR_EL1, 16, 1)
+FIELD(HFGRTR_EL2, FAR_EL1, 17, 1)
+FIELD(HFGRTR_EL2, ISR_EL1, 18, 1)
+FIELD(HFGRTR_EL2, LORC_EL1, 19, 1)
+FIELD(HFGRTR_EL2, LOREA_EL1, 20, 1)
+FIELD(HFGRTR_EL2, LORID_EL1, 21, 1)
+FIELD(HFGRTR_EL2, LORN_EL1, 22, 1)
+FIELD(HFGRTR_EL2, LORSA_EL1, 23, 1)
+FIELD(HFGRTR_EL2, MAIR_EL1, 24, 1)
+FIELD(HFGRTR_EL2, MIDR_EL1, 25, 1)
+FIELD(HFGRTR_EL2, MPIDR_EL1, 26, 1)
+FIELD(HFGRTR_EL2, PAR_EL1, 27, 1)
+FIELD(HFGRTR_EL2, REVIDR_EL1, 28, 1)
+FIELD(HFGRTR_EL2, SCTLR_EL1, 29, 1)
+FIELD(HFGRTR_EL2, SCXTNUM_EL1, 30, 1)
+FIELD(HFGRTR_EL2, SCXTNUM_EL0, 31, 1)
+FIELD(HFGRTR_EL2, TCR_EL1, 32, 1)
+FIELD(HFGRTR_EL2, TPIDR_EL1, 33, 1)
+FIELD(HFGRTR_EL2, TPIDRRO_EL0, 34, 1)
+FIELD(HFGRTR_EL2, TPIDR_EL0, 35, 1)
+FIELD(HFGRTR_EL2, TTBR0_EL1, 36, 1)
+FIELD(HFGRTR_EL2, TTBR1_EL1, 37, 1)
+FIELD(HFGRTR_EL2, VBAR_EL1, 38, 1)
+FIELD(HFGRTR_EL2, ICC_IGRPENN_EL1, 39, 1)
+FIELD(HFGRTR_EL2, ERRIDR_EL1, 40, 1)
+FIELD(HFGRTR_EL2, ERRSELR_EL1, 41, 1)
+FIELD(HFGRTR_EL2, ERXFR_EL1, 42, 1)
+FIELD(HFGRTR_EL2, ERXCTLR_EL1, 43, 1)
+FIELD(HFGRTR_EL2, ERXSTATUS_EL1, 44, 1)
+FIELD(HFGRTR_EL2, ERXMISCN_EL1, 45, 1)
+FIELD(HFGRTR_EL2, ERXPFGF_EL1, 46, 1)
+FIELD(HFGRTR_EL2, ERXPFGCTL_EL1, 47, 1)
+FIELD(HFGRTR_EL2, ERXPFGCDN_EL1, 48, 1)
+FIELD(HFGRTR_EL2, ERXADDR_EL1, 49, 1)
+FIELD(HFGRTR_EL2, NACCDATA_EL1, 50, 1)
+/* 51-53: RES0 */
+FIELD(HFGRTR_EL2, NSMPRI_EL1, 54, 1)
+FIELD(HFGRTR_EL2, NTPIDR2_EL0, 55, 1)
+/* 56-63: RES0 */
+
+/* These match HFGRTR but bits for RO registers are RES0 */
+FIELD(HFGWTR_EL2, AFSR0_EL1, 0, 1)
+FIELD(HFGWTR_EL2, AFSR1_EL1, 1, 1)
+FIELD(HFGWTR_EL2, AMAIR_EL1, 3, 1)
+FIELD(HFGWTR_EL2, APDAKEY, 4, 1)
+FIELD(HFGWTR_EL2, APDBKEY, 5, 1)
+FIELD(HFGWTR_EL2, APGAKEY, 6, 1)
+FIELD(HFGWTR_EL2, APIAKEY, 7, 1)
+FIELD(HFGWTR_EL2, APIBKEY, 8, 1)
+FIELD(HFGWTR_EL2, CONTEXTIDR_EL1, 11, 1)
+FIELD(HFGWTR_EL2, CPACR_EL1, 12, 1)
+FIELD(HFGWTR_EL2, CSSELR_EL1, 13, 1)
+FIELD(HFGWTR_EL2, ESR_EL1, 16, 1)
+FIELD(HFGWTR_EL2, FAR_EL1, 17, 1)
+FIELD(HFGWTR_EL2, LORC_EL1, 19, 1)
+FIELD(HFGWTR_EL2, LOREA_EL1, 20, 1)
+FIELD(HFGWTR_EL2, LORN_EL1, 22, 1)
+FIELD(HFGWTR_EL2, LORSA_EL1, 23, 1)
+FIELD(HFGWTR_EL2, MAIR_EL1, 24, 1)
+FIELD(HFGWTR_EL2, PAR_EL1, 27, 1)
+FIELD(HFGWTR_EL2, SCTLR_EL1, 29, 1)
+FIELD(HFGWTR_EL2, SCXTNUM_EL1, 30, 1)
+FIELD(HFGWTR_EL2, SCXTNUM_EL0, 31, 1)
+FIELD(HFGWTR_EL2, TCR_EL1, 32, 1)
+FIELD(HFGWTR_EL2, TPIDR_EL1, 33, 1)
+FIELD(HFGWTR_EL2, TPIDRRO_EL0, 34, 1)
+FIELD(HFGWTR_EL2, TPIDR_EL0, 35, 1)
+FIELD(HFGWTR_EL2, TTBR0_EL1, 36, 1)
+FIELD(HFGWTR_EL2, TTBR1_EL1, 37, 1)
+FIELD(HFGWTR_EL2, VBAR_EL1, 38, 1)
+FIELD(HFGWTR_EL2, ICC_IGRPENN_EL1, 39, 1)
+FIELD(HFGWTR_EL2, ERRSELR_EL1, 41, 1)
+FIELD(HFGWTR_EL2, ERXCTLR_EL1, 43, 1)
+FIELD(HFGWTR_EL2, ERXSTATUS_EL1, 44, 1)
+FIELD(HFGWTR_EL2, ERXMISCN_EL1, 45, 1)
+FIELD(HFGWTR_EL2, ERXPFGCTL_EL1, 47, 1)
+FIELD(HFGWTR_EL2, ERXPFGCDN_EL1, 48, 1)
+FIELD(HFGWTR_EL2, ERXADDR_EL1, 49, 1)
+FIELD(HFGWTR_EL2, NACCDATA_EL1, 50, 1)
+FIELD(HFGWTR_EL2, NSMPRI_EL1, 54, 1)
+FIELD(HFGWTR_EL2, NTPIDR2_EL0, 55, 1)
+
+FIELD(HFGITR_EL2, ICIALLUIS, 0, 1)
+FIELD(HFGITR_EL2, ICIALLU, 1, 1)
+FIELD(HFGITR_EL2, ICIVAU, 2, 1)
+FIELD(HFGITR_EL2, DCIVAC, 3, 1)
+FIELD(HFGITR_EL2, DCISW, 4, 1)
+FIELD(HFGITR_EL2, DCCSW, 5, 1)
+FIELD(HFGITR_EL2, DCCISW, 6, 1)
+FIELD(HFGITR_EL2, DCCVAU, 7, 1)
+FIELD(HFGITR_EL2, DCCVAP, 8, 1)
+FIELD(HFGITR_EL2, DCCVADP, 9, 1)
+FIELD(HFGITR_EL2, DCCIVAC, 10, 1)
+FIELD(HFGITR_EL2, DCZVA, 11, 1)
+FIELD(HFGITR_EL2, ATS1E1R, 12, 1)
+FIELD(HFGITR_EL2, ATS1E1W, 13, 1)
+FIELD(HFGITR_EL2, ATS1E0R, 14, 1)
+FIELD(HFGITR_EL2, ATS1E0W, 15, 1)
+FIELD(HFGITR_EL2, ATS1E1RP, 16, 1)
+FIELD(HFGITR_EL2, ATS1E1WP, 17, 1)
+FIELD(HFGITR_EL2, TLBIVMALLE1OS, 18, 1)
+FIELD(HFGITR_EL2, TLBIVAE1OS, 19, 1)
+FIELD(HFGITR_EL2, TLBIASIDE1OS, 20, 1)
+FIELD(HFGITR_EL2, TLBIVAAE1OS, 21, 1)
+FIELD(HFGITR_EL2, TLBIVALE1OS, 22, 1)
+FIELD(HFGITR_EL2, TLBIVAALE1OS, 23, 1)
+FIELD(HFGITR_EL2, TLBIRVAE1OS, 24, 1)
+FIELD(HFGITR_EL2, TLBIRVAAE1OS, 25, 1)
+FIELD(HFGITR_EL2, TLBIRVALE1OS, 26, 1)
+FIELD(HFGITR_EL2, TLBIRVAALE1OS, 27, 1)
+FIELD(HFGITR_EL2, TLBIVMALLE1IS, 28, 1)
+FIELD(HFGITR_EL2, TLBIVAE1IS, 29, 1)
+FIELD(HFGITR_EL2, TLBIASIDE1IS, 30, 1)
+FIELD(HFGITR_EL2, TLBIVAAE1IS, 31, 1)
+FIELD(HFGITR_EL2, TLBIVALE1IS, 32, 1)
+FIELD(HFGITR_EL2, TLBIVAALE1IS, 33, 1)
+FIELD(HFGITR_EL2, TLBIRVAE1IS, 34, 1)
+FIELD(HFGITR_EL2, TLBIRVAAE1IS, 35, 1)
+FIELD(HFGITR_EL2, TLBIRVALE1IS, 36, 1)
+FIELD(HFGITR_EL2, TLBIRVAALE1IS, 37, 1)
+FIELD(HFGITR_EL2, TLBIRVAE1, 38, 1)
+FIELD(HFGITR_EL2, TLBIRVAAE1, 39, 1)
+FIELD(HFGITR_EL2, TLBIRVALE1, 40, 1)
+FIELD(HFGITR_EL2, TLBIRVAALE1, 41, 1)
+FIELD(HFGITR_EL2, TLBIVMALLE1, 42, 1)
+FIELD(HFGITR_EL2, TLBIVAE1, 43, 1)
+FIELD(HFGITR_EL2, TLBIASIDE1, 44, 1)
+FIELD(HFGITR_EL2, TLBIVAAE1, 45, 1)
+FIELD(HFGITR_EL2, TLBIVALE1, 46, 1)
+FIELD(HFGITR_EL2, TLBIVAALE1, 47, 1)
+FIELD(HFGITR_EL2, CFPRCTX, 48, 1)
+FIELD(HFGITR_EL2, DVPRCTX, 49, 1)
+FIELD(HFGITR_EL2, CPPRCTX, 50, 1)
+FIELD(HFGITR_EL2, ERET, 51, 1)
+FIELD(HFGITR_EL2, SVC_EL0, 52, 1)
+FIELD(HFGITR_EL2, SVC_EL1, 53, 1)
+FIELD(HFGITR_EL2, DCCVAC, 54, 1)
+FIELD(HFGITR_EL2, NBRBINJ, 55, 1)
+FIELD(HFGITR_EL2, NBRBIALL, 56, 1)
+
+FIELD(HDFGRTR_EL2, DBGBCRN_EL1, 0, 1)
+FIELD(HDFGRTR_EL2, DBGBVRN_EL1, 1, 1)
+FIELD(HDFGRTR_EL2, DBGWCRN_EL1, 2, 1)
+FIELD(HDFGRTR_EL2, DBGWVRN_EL1, 3, 1)
+FIELD(HDFGRTR_EL2, MDSCR_EL1, 4, 1)
+FIELD(HDFGRTR_EL2, DBGCLAIM, 5, 1)
+FIELD(HDFGRTR_EL2, DBGAUTHSTATUS_EL1, 6, 1)
+FIELD(HDFGRTR_EL2, DBGPRCR_EL1, 7, 1)
+/* 8: RES0: OSLAR_EL1 is WO */
+FIELD(HDFGRTR_EL2, OSLSR_EL1, 9, 1)
+FIELD(HDFGRTR_EL2, OSECCR_EL1, 10, 1)
+FIELD(HDFGRTR_EL2, OSDLR_EL1, 11, 1)
+FIELD(HDFGRTR_EL2, PMEVCNTRN_EL0, 12, 1)
+FIELD(HDFGRTR_EL2, PMEVTYPERN_EL0, 13, 1)
+FIELD(HDFGRTR_EL2, PMCCFILTR_EL0, 14, 1)
+FIELD(HDFGRTR_EL2, PMCCNTR_EL0, 15, 1)
+FIELD(HDFGRTR_EL2, PMCNTEN, 16, 1)
+FIELD(HDFGRTR_EL2, PMINTEN, 17, 1)
+FIELD(HDFGRTR_EL2, PMOVS, 18, 1)
+FIELD(HDFGRTR_EL2, PMSELR_EL0, 19, 1)
+/* 20: RES0: PMSWINC_EL0 is WO */
+/* 21: RES0: PMCR_EL0 is WO */
+FIELD(HDFGRTR_EL2, PMMIR_EL1, 22, 1)
+FIELD(HDFGRTR_EL2, PMBLIMITR_EL1, 23, 1)
+FIELD(HDFGRTR_EL2, PMBPTR_EL1, 24, 1)
+FIELD(HDFGRTR_EL2, PMBSR_EL1, 25, 1)
+FIELD(HDFGRTR_EL2, PMSCR_EL1, 26, 1)
+FIELD(HDFGRTR_EL2, PMSEVFR_EL1, 27, 1)
+FIELD(HDFGRTR_EL2, PMSFCR_EL1, 28, 1)
+FIELD(HDFGRTR_EL2, PMSICR_EL1, 29, 1)
+FIELD(HDFGRTR_EL2, PMSIDR_EL1, 30, 1)
+FIELD(HDFGRTR_EL2, PMSIRR_EL1, 31, 1)
+FIELD(HDFGRTR_EL2, PMSLATFR_EL1, 32, 1)
+FIELD(HDFGRTR_EL2, TRC, 33, 1)
+FIELD(HDFGRTR_EL2, TRCAUTHSTATUS, 34, 1)
+FIELD(HDFGRTR_EL2, TRCAUXCTLR, 35, 1)
+FIELD(HDFGRTR_EL2, TRCCLAIM, 36, 1)
+FIELD(HDFGRTR_EL2, TRCCNTVRn, 37, 1)
+/* 38, 39: RES0 */
+FIELD(HDFGRTR_EL2, TRCID, 40, 1)
+FIELD(HDFGRTR_EL2, TRCIMSPECN, 41, 1)
+/* 42: RES0: TRCOSLAR is WO */
+FIELD(HDFGRTR_EL2, TRCOSLSR, 43, 1)
+FIELD(HDFGRTR_EL2, TRCPRGCTLR, 44, 1)
+FIELD(HDFGRTR_EL2, TRCSEQSTR, 45, 1)
+FIELD(HDFGRTR_EL2, TRCSSCSRN, 46, 1)
+FIELD(HDFGRTR_EL2, TRCSTATR, 47, 1)
+FIELD(HDFGRTR_EL2, TRCVICTLR, 48, 1)
+/* 49: RES0: TRFCR_EL1 is WO */
+FIELD(HDFGRTR_EL2, TRBBASER_EL1, 50, 1)
+FIELD(HDFGRTR_EL2, TRBIDR_EL1, 51, 1)
+FIELD(HDFGRTR_EL2, TRBLIMITR_EL1, 52, 1)
+FIELD(HDFGRTR_EL2, TRBMAR_EL1, 53, 1)
+FIELD(HDFGRTR_EL2, TRBPTR_EL1, 54, 1)
+FIELD(HDFGRTR_EL2, TRBSR_EL1, 55, 1)
+FIELD(HDFGRTR_EL2, TRBTRG_EL1, 56, 1)
+FIELD(HDFGRTR_EL2, PMUSERENR_EL0, 57, 1)
+FIELD(HDFGRTR_EL2, PMCEIDN_EL0, 58, 1)
+FIELD(HDFGRTR_EL2, NBRBIDR, 59, 1)
+FIELD(HDFGRTR_EL2, NBRBCTL, 60, 1)
+FIELD(HDFGRTR_EL2, NBRBDATA, 61, 1)
+FIELD(HDFGRTR_EL2, NPMSNEVFR_EL1, 62, 1)
+FIELD(HDFGRTR_EL2, PMBIDR_EL1, 63, 1)
+
+/*
+ * These match HDFGRTR_EL2, but bits for RO registers are RES0.
+ * A few bits are for WO registers, where the HDFGRTR_EL2 bit is RES0.
+ */
+FIELD(HDFGWTR_EL2, DBGBCRN_EL1, 0, 1)
+FIELD(HDFGWTR_EL2, DBGBVRN_EL1, 1, 1)
+FIELD(HDFGWTR_EL2, DBGWCRN_EL1, 2, 1)
+FIELD(HDFGWTR_EL2, DBGWVRN_EL1, 3, 1)
+FIELD(HDFGWTR_EL2, MDSCR_EL1, 4, 1)
+FIELD(HDFGWTR_EL2, DBGCLAIM, 5, 1)
+FIELD(HDFGWTR_EL2, DBGPRCR_EL1, 7, 1)
+FIELD(HDFGWTR_EL2, OSLAR_EL1, 8, 1)
+FIELD(HDFGWTR_EL2, OSLSR_EL1, 9, 1)
+FIELD(HDFGWTR_EL2, OSECCR_EL1, 10, 1)
+FIELD(HDFGWTR_EL2, OSDLR_EL1, 11, 1)
+FIELD(HDFGWTR_EL2, PMEVCNTRN_EL0, 12, 1)
+FIELD(HDFGWTR_EL2, PMEVTYPERN_EL0, 13, 1)
+FIELD(HDFGWTR_EL2, PMCCFILTR_EL0, 14, 1)
+FIELD(HDFGWTR_EL2, PMCCNTR_EL0, 15, 1)
+FIELD(HDFGWTR_EL2, PMCNTEN, 16, 1)
+FIELD(HDFGWTR_EL2, PMINTEN, 17, 1)
+FIELD(HDFGWTR_EL2, PMOVS, 18, 1)
+FIELD(HDFGWTR_EL2, PMSELR_EL0, 19, 1)
+FIELD(HDFGWTR_EL2, PMSWINC_EL0, 20, 1)
+FIELD(HDFGWTR_EL2, PMCR_EL0, 21, 1)
+FIELD(HDFGWTR_EL2, PMBLIMITR_EL1, 23, 1)
+FIELD(HDFGWTR_EL2, PMBPTR_EL1, 24, 1)
+FIELD(HDFGWTR_EL2, PMBSR_EL1, 25, 1)
+FIELD(HDFGWTR_EL2, PMSCR_EL1, 26, 1)
+FIELD(HDFGWTR_EL2, PMSEVFR_EL1, 27, 1)
+FIELD(HDFGWTR_EL2, PMSFCR_EL1, 28, 1)
+FIELD(HDFGWTR_EL2, PMSICR_EL1, 29, 1)
+FIELD(HDFGWTR_EL2, PMSIRR_EL1, 31, 1)
+FIELD(HDFGWTR_EL2, PMSLATFR_EL1, 32, 1)
+FIELD(HDFGWTR_EL2, TRC, 33, 1)
+FIELD(HDFGWTR_EL2, TRCAUXCTLR, 35, 1)
+FIELD(HDFGWTR_EL2, TRCCLAIM, 36, 1)
+FIELD(HDFGWTR_EL2, TRCCNTVRn, 37, 1)
+FIELD(HDFGWTR_EL2, TRCIMSPECN, 41, 1)
+FIELD(HDFGWTR_EL2, TRCOSLAR, 42, 1)
+FIELD(HDFGWTR_EL2, TRCPRGCTLR, 44, 1)
+FIELD(HDFGWTR_EL2, TRCSEQSTR, 45, 1)
+FIELD(HDFGWTR_EL2, TRCSSCSRN, 46, 1)
+FIELD(HDFGWTR_EL2, TRCVICTLR, 48, 1)
+FIELD(HDFGWTR_EL2, TRFCR_EL1, 49, 1)
+FIELD(HDFGWTR_EL2, TRBBASER_EL1, 50, 1)
+FIELD(HDFGWTR_EL2, TRBLIMITR_EL1, 52, 1)
+FIELD(HDFGWTR_EL2, TRBMAR_EL1, 53, 1)
+FIELD(HDFGWTR_EL2, TRBPTR_EL1, 54, 1)
+FIELD(HDFGWTR_EL2, TRBSR_EL1, 55, 1)
+FIELD(HDFGWTR_EL2, TRBTRG_EL1, 56, 1)
+FIELD(HDFGWTR_EL2, PMUSERENR_EL0, 57, 1)
+FIELD(HDFGWTR_EL2, NBRBCTL, 60, 1)
+FIELD(HDFGWTR_EL2, NBRBDATA, 61, 1)
+FIELD(HDFGWTR_EL2, NPMSNEVFR_EL1, 62, 1)
+
 typedef struct ARMCPRegInfo ARMCPRegInfo;
 
 /*
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8cf70693be4..063024508af 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -529,6 +529,16 @@ typedef struct CPUArchState {
         uint64_t disr_el1;
         uint64_t vdisr_el2;
         uint64_t vsesr_el2;
+
+        /*
+         * Fine-Grained Trap registers. We store these as arrays so the
+         * access checking code doesn't have to manually select
+         * HFGRTR_EL2 vs HFDFGRTR_EL2 etc when looking up the bit to test.
+         * FEAT_FGT2 will add more elements to these arrays.
+         */
+        uint64_t fgt_read[2]; /* HFGRTR, HDFGRTR */
+        uint64_t fgt_write[2]; /* HFGWTR, HDFGWTR */
+        uint64_t fgt_exec[1]; /* HFGITR */
     } cp15;
 
     struct {
@@ -4164,6 +4174,11 @@ static inline bool isar_feature_aa64_tgran64_2(const ARMISARegisters *id)
     return t >= 2 || (t == 0 && isar_feature_aa64_tgran64(id));
 }
 
+static inline bool isar_feature_aa64_fgt(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, FGT) != 0;
+}
+
 static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 66966869218..20527995359 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1869,6 +1869,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_hcx, cpu)) {
             valid_mask |= SCR_HXEN;
         }
+        if (cpu_isar_feature(aa64_fgt, cpu)) {
+            valid_mask |= SCR_FGTEN;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -7546,6 +7549,39 @@ static const ARMCPRegInfo scxtnum_reginfo[] = {
       .access = PL3_RW,
       .fieldoffset = offsetof(CPUARMState, scxtnum_el[3]) },
 };
+
+static CPAccessResult access_fgt(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    if (arm_current_el(env) == 2 &&
+        arm_feature(env, ARM_FEATURE_EL3) && !(env->cp15.scr_el3 & SCR_FGTEN)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static const ARMCPRegInfo fgt_reginfo[] = {
+    { .name = "HFGRTR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
+      .access = PL2_RW, .accessfn = access_fgt,
+      .fieldoffset = offsetof(CPUARMState, cp15.fgt_read[FGTREG_HFGRTR]) },
+    { .name = "HFGWTR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 5,
+      .access = PL2_RW, .accessfn = access_fgt,
+      .fieldoffset = offsetof(CPUARMState, cp15.fgt_write[FGTREG_HFGWTR]) },
+    { .name = "HDFGRTR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 1, .opc2 = 4,
+      .access = PL2_RW, .accessfn = access_fgt,
+      .fieldoffset = offsetof(CPUARMState, cp15.fgt_read[FGTREG_HDFGRTR]) },
+    { .name = "HDFGWTR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 1, .opc2 = 5,
+      .access = PL2_RW, .accessfn = access_fgt,
+      .fieldoffset = offsetof(CPUARMState, cp15.fgt_write[FGTREG_HDFGWTR]) },
+    { .name = "HFGITR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 6,
+      .access = PL2_RW, .accessfn = access_fgt,
+      .fieldoffset = offsetof(CPUARMState, cp15.fgt_exec[FGTREG_HFGITR]) },
+};
 #endif /* TARGET_AARCH64 */
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -8933,6 +8969,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_scxtnum, cpu)) {
         define_arm_cp_regs(cpu, scxtnum_reginfo);
     }
+
+    if (cpu_isar_feature(aa64_fgt, cpu)) {
+        define_arm_cp_regs(cpu, fgt_reginfo);
+    }
 #endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
-- 
2.34.1


