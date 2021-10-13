Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6AA42B2DD
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:48:40 +0200 (CEST)
Received: from localhost ([::1]:44610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUJr-00074L-5k
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHa-0004A4-BQ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:18 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHY-0004ly-QJ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:18 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so1137572pji.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6inZETYo7qpmjRK6t8YVcWmKQsxE4jryCUSCrlDOgJc=;
 b=ig7PRgpdG8n7pzAMr6+UCtGuWTa1lI5O+SsKxqvAYQemcR8a7yS5tMZRhE4Q/2CbVK
 ajYp3L8EPG8zAqSFljv/y56lcfhOgl7gXii+HGbSUBv5IjUocANYQFG58MBZjNEPo6VJ
 5MNykvGDteAL1Od7uelu9roOiwc5/Hks+UUFaZJ5I5QdZlsh9hVM18tE4Hh7qb0zqYu0
 Ik0v32E/y5JFODWbZJ14fz6HsndpjHrNidYADHZxaG5B72NcXt071NWqKSNhXXw9BD1u
 lxflxB2nFD2MDNUu9HWG831ze+nZxTRH8g8tPYaBZSdMt1LkGSfF85F+UaCTgcNmba5V
 xiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6inZETYo7qpmjRK6t8YVcWmKQsxE4jryCUSCrlDOgJc=;
 b=1GhRtDZcNvMIipfZLvWj8c3r0dbcKM9RlibDTroKj0q7LTnGHgfXP8ep3BzEdCoPuZ
 oVMUvGDHY1X15oWsHELTeELOnU5aLYO8fLNE5bBihXYUrW89lrdTPKHz6tBNHQFF3Y62
 iOmMoQ+1n28ViUYfl5klt6xTauVtDJzzQfvynNv5uXveSlDgSR03TG/FNAk4YfIOweZQ
 Akub2fEmBsIStuSkB6BVCkrvyQxa9LlNKLq5vDVVzF4nOiVapEaURbidlNXassjDfuqo
 kVhm5M3nNzuVY2uGncf9nUAbFQXUfN5qhHPb+bWpFc6yXrCciu9vW/pKqDpD6TM8qtlA
 0rHA==
X-Gm-Message-State: AOAM5304wIgGndUSMHYM3q6Da8pBOMpGloJ+ywpHKAlbfVx6sAMtXQbr
 dgMjMNHP6IQPGzoAr/d738XzBRuxFk3a2g==
X-Google-Smtp-Source: ABdhPJxUnZ76d5VkiVXifBrj2rbbZBHKv3H5E5qQJVuES6lJEHg12uP0lMBIOzyct7cZnCqNTRPDnw==
X-Received: by 2002:a17:90a:a88a:: with SMTP id
 h10mr10369400pjq.226.1634093175440; 
 Tue, 12 Oct 2021 19:46:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/48] target/microblaze: Do not set MO_ALIGN for user-only
Date: Tue, 12 Oct 2021 19:45:25 -0700
Message-Id: <20211013024607.731881-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
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


