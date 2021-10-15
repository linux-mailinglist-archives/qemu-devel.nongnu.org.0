Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98842E81A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:53:13 +0200 (CEST)
Received: from localhost ([::1]:41696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFDU-0003vM-2r
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc8-0006iK-H7
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:36 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc6-0002pj-Sx
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:36 -0400
Received: by mail-pl1-x636.google.com with SMTP id f21so5614484plb.3
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6inZETYo7qpmjRK6t8YVcWmKQsxE4jryCUSCrlDOgJc=;
 b=TFtza0gXQUWkgNtMoeuWv7RWk7RnSLsiD/44n+VWMCt1DFxZ3YVS/OslUNihITMFp0
 X3y+B74y8URJoQCIsdA30NpAxxXbi1jluRvZH4O0lIazJGzvVnxHtLBY3hdvUehJRuTF
 lScGm6BDIV4YdTXrdZ+KK9MAR1mUHb1rT7tZ0hjmrA6uN4A/L1oPkMQtcm144CVDZQtM
 1SnTb9VQe8KB98V0gVpcAKJo1Egb6ecUXu60sVwcmu07Q8edu9KhuN33lT/2yjBpbx/N
 B6KhtJmaVW4RA/bHHN07FVmTLihqoZY9bDMp5FNUl8y000lo6g86KADmcJxErOFwgEND
 ff5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6inZETYo7qpmjRK6t8YVcWmKQsxE4jryCUSCrlDOgJc=;
 b=kp3fsknnMBMlMWK62OAkjbh6P0/uqtbXnpBJKR/9mz7+Kcwx7uwMZrmmnq2EyMp1mo
 dEckkx9jlDlnLkQlBM/ECU4ZE14jEqdIpeR2gWFEK8eiL4250YEikFFhRlHpB/HnPa70
 mDp7ItMdv6nWiDoRE9gQB2i5K0opIJuD+PUIpFL+fs7WfGPh4m/N+J1ZFzP1z8PZaG9L
 oxOWwQI+joOlE+o5gCH3zmjDexlespwtCLWsap9PhJXgMdhTrm/ZhCAOCgUe/g8a9/qL
 ovjasJ/S6mgmU/POSYjCMbZMd7QW/pq7tuCW+wt9VfMmjcLrL9qLSQlo1SsRPKkaVozv
 +alg==
X-Gm-Message-State: AOAM531zojT+b/XRF/gKa8LHO2oWK7MC2R1ocqgVAl8WYne4blQPIgi5
 fjuT3J3rWJShynXqv7mU7q5qfioCeIDAQQ==
X-Google-Smtp-Source: ABdhPJxl6iHXmrw7qws7vj3CCinsx4rNIt4Lzlf6eRFgQchQwtSyInFaSNGv7PulzKmbUDUQTWzoxw==
X-Received: by 2002:a17:90b:4c86:: with SMTP id
 my6mr10961200pjb.203.1634271273613; 
 Thu, 14 Oct 2021 21:14:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 48/67] target/microblaze: Do not set MO_ALIGN for user-only
Date: Thu, 14 Oct 2021 21:10:34 -0700
Message-Id: <20211015041053.2769193-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel will fix up unaligned accesses, so emulate that
by allowing unaligned accesses to succeed.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index a14ffed784..ef44bca2fd 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -727,6 +727,7 @@ static TCGv compute_ldst_addr_ea(DisasContext *dc, int ra, int rb)
 }
 #endif
 
+#ifndef CONFIG_USER_ONLY
 static void record_unaligned_ess(DisasContext *dc, int rd,
                                  MemOp size, bool store)
 {
@@ -739,6 +740,7 @@ static void record_unaligned_ess(DisasContext *dc, int rd,
 
     tcg_set_insn_start_param(dc->insn_start, 1, iflags);
 }
+#endif
 
 static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
                     int mem_index, bool rev)
@@ -760,12 +762,19 @@ static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
         }
     }
 
+    /*
+     * For system mode, enforce alignment if the cpu configuration
+     * requires it.  For user-mode, the Linux kernel will have fixed up
+     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
+     */
+#ifndef CONFIG_USER_ONLY
     if (size > MO_8 &&
         (dc->tb_flags & MSR_EE) &&
         dc->cfg->unaligned_exceptions) {
         record_unaligned_ess(dc, rd, size, false);
         mop |= MO_ALIGN;
     }
+#endif
 
     tcg_gen_qemu_ld_i32(reg_for_write(dc, rd), addr, mem_index, mop);
 
@@ -906,12 +915,19 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
         }
     }
 
+    /*
+     * For system mode, enforce alignment if the cpu configuration
+     * requires it.  For user-mode, the Linux kernel will have fixed up
+     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
+     */
+#ifndef CONFIG_USER_ONLY
     if (size > MO_8 &&
         (dc->tb_flags & MSR_EE) &&
         dc->cfg->unaligned_exceptions) {
         record_unaligned_ess(dc, rd, size, true);
         mop |= MO_ALIGN;
     }
+#endif
 
     tcg_gen_qemu_st_i32(reg_for_read(dc, rd), addr, mem_index, mop);
 
-- 
2.25.1


