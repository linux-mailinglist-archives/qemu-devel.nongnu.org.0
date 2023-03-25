Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B7D6C8DA8
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 12:53:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg2S1-00050J-U1; Sat, 25 Mar 2023 07:52:49 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2S0-0004uW-68
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:52:48 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Ry-0007np-7Z
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:52:47 -0400
Received: by mail-qt1-x82c.google.com with SMTP id t19so3937121qta.12
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 04:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4cy1xP5OQWUfnynTXfbvIKGvVE6egHD8uv4kncq6BSo=;
 b=Jt3L1RgS0vWFeAIfr06VQeQCJw+/RijrDmO4ZwHpniQTUNjZccZRVT4/UzBajg4AqH
 Qf/3uDA2oSgNoOMfsOuzT0Sqm67GQF23CqGnnLzA6niK0N7rD85kuEA2Jili4yTfm8kd
 WObDP5sr5btFNQXuBW2fR0QxQZLvVfGZ2dQ0BSAmCRd9zO5QnBh0xVIHZKCYlKELTGit
 273XFHG8ueGuJxJM97gg8+YTi+hOypsVn8u04+wZJ+HJT8lNsB6xmnjstLP8H1WOzomB
 gE213VKtU2iZy85EW5WvNMKSklQQHmO+gq+FJHEpoXlbhxJbb/48uiEUB2uEUSg7InR+
 U1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4cy1xP5OQWUfnynTXfbvIKGvVE6egHD8uv4kncq6BSo=;
 b=m6AgiWeW8q/0ly7OeSSKfubJSiyO3+AXJm2J75PvCXNLVg7XpUfPSF7fO6e3RLCexf
 8E1i+uZVp7P+ow1w5h7SkRTbwigLZA09Eef1yo1iO2Af1OAbEWPtKVclzGjFfWZS6ATv
 x53iCgKAeNbksFS0CE/WkLfsItT03806vuPc8gc8MrYlkyRVT4LfH/5+LNDikaWPLfVf
 SHx7AxBm1PYi2PTCM0ABmVRkqxNvhrEhTd2JXCyfbenQvr04O/am+eWV6Ih7kWP3HpOv
 Bz1fdomP96W/UWDwVhR7WcSY8TKwSkByyJkxREe7bnCZQr4vjpsu65C47kBqW2dAfrYS
 d2EQ==
X-Gm-Message-State: AO0yUKX3hUF6mUl3f3e6iNum62DAWMmk0Y6z6fEAAlZWnqnXCmTKSGUu
 aLYAiXEisQRH/tFmfwcntjN8qT4U5SbP1VkQgII=
X-Google-Smtp-Source: AKy350Y6Ddeh8S703GLVtfoqfnHWkMTPZPGIe6t6xnVAiBA/hiKgKznrbiU5WZAJXfgQA9LzEIKg/Q==
X-Received: by 2002:a17:90a:4fe5:b0:23d:48a9:3408 with SMTP id
 q92-20020a17090a4fe500b0023d48a93408mr5797910pjh.41.1679741678718; 
 Sat, 25 Mar 2023 03:54:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 09/25] target/riscv: Use cpu_ld*_code_mmu for HLVX
Date: Sat, 25 Mar 2023 03:54:13 -0700
Message-Id: <20230325105429.1142530-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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

Use the new functions to properly check execute permission
for the read rather than read permission.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/op_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 962a061228..b2169a99ff 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -427,18 +427,27 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
     helper_hyp_tlb_flush(env);
 }
 
+/*
+ * TODO: These implementations are not quite correct.  They perform the
+ * access using execute permission just fine, but the final PMP check
+ * is supposed to have read permission as well.  Without replicating
+ * a fair fraction of cputlb.c, fixing this requires adding new mmu_idx
+ * which would imply that exact check in tlb_fill.
+ */
 target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
 {
     int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    MemOpIdx oi = make_memop_idx(MO_TEUW, mmu_idx);
 
-    return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
+    return cpu_ldw_code_mmu(env, address, oi, GETPC());
 }
 
 target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
 {
     int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    MemOpIdx oi = make_memop_idx(MO_TEUL, mmu_idx);
 
-    return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
+    return cpu_ldl_code_mmu(env, address, oi, GETPC());
 }
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.34.1


