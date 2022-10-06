Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C85F5F91
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:24:24 +0200 (CEST)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHUl-0001wN-M6
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIJ-0005bT-69
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:31 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:42639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIH-0006xa-Gh
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:30 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso533161pjk.1
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rigLTfOjEWhrby8dAtjv2G2EQPsehXz3okL3LRGUdH4=;
 b=mTVByTsW/smJ+SUY88RjumFYZ+2Nn6vIKiQGOF9dEkOUVzuSbxFHuP3FVKMLDB71oY
 QfzoI4u2G1WGXWglm03iNr+RcPvo16yArSQcTtGQ6YY3p6uLRS3AoP30rqZ8B15bMsZ4
 6HvoXGU1e/7tl4lZxBAqWxNciE6Ym+3LK9eqlX5/5bcxxUo/GAh5h8u/rhmZnyiTMUCN
 WdXgtXOsevfSBu3aBJ9LT5TvFllSb35D2ALsjgl6YYThR9pLMTR9B+iUCsMniFBj6V7J
 U6s+BqgrT2mLkJ09I+J+jEFhGWnEnT3Of5aitA5YUY8IQpaEnSWFLPaqwfi0T2MwFKM6
 byXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rigLTfOjEWhrby8dAtjv2G2EQPsehXz3okL3LRGUdH4=;
 b=UTQp58GpHFKy2MCgKybpUOPlr9wBjxaDEYUO+KQPIN0hhraSdS0Qi6CfFrun0WWUyv
 JAbw5bN3GZr/yekZpGEcNCMINbzfWXJdbxO7HHPvfyvnyBkIPdwAAu3MegfDYF8t1yYn
 tmpdCOW11fZWKLwIfi79sfbQN9PO+f/GhU2aECcjiNdiyzChXidYH0Mc849ca5HVm/aF
 E9EoqV5DU7Ok0CQqGGY7iYU0Zbt6zae39gxb2buQ8fl7EGbWq7Yl0sgBRSOS84lQ3KRX
 VSIQq/h0LO3syuoDGgmDRq0Dgal6gfmsfJ0HXsUmvU+7pA4aw8XNCy4Vaw8+fC4y9nIj
 BRNw==
X-Gm-Message-State: ACrzQf0OH2SXJWMhIOqPvZUkHRvU35+nyGryAxl5EaxAeaEz7SgYas9o
 ZCGrleV5zOoM0vgul8Q8etUDm0fqXNWuug==
X-Google-Smtp-Source: AMsMyM4Rp/LvoKn/RKgn23CgnlQTzAJ9GGK61VCpkhXXLN22FkxkUADyE2tLyPUP+SJtyRPEoVbJ8g==
X-Received: by 2002:a17:903:32d2:b0:17a:e62:16e2 with SMTP id
 i18-20020a17090332d200b0017a0e6216e2mr2302608plr.93.1665025888062; 
 Wed, 05 Oct 2022 20:11:28 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 10/24] accel/tcg: Rename tb_invalidate_phys_page
Date: Wed,  5 Oct 2022 20:10:59 -0700
Message-Id: <20221006031113.1139454-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to tb_invalidate_phys_page_unwind to emphasize that
we also detect invalidating the current TB, and also to free
up that name for other usage.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      | 2 +-
 accel/tcg/tb-maint.c      | 2 +-
 accel/tcg/translate-all.c | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 1a704ee14f..1227bb69bd 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -105,7 +105,7 @@ void tb_htable_init(void);
 void tb_reset_jump(TranslationBlock *tb, int n);
 TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
                                tb_page_addr_t phys_page2);
-bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc);
+bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc);
 int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                               uintptr_t searched_pc, bool reset_icount);
 
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 15ec2f741d..92170cbbc1 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -657,7 +657,7 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
  * TB (because it was modified by this store and the guest CPU has
  * precise-SMC semantics).
  */
-bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
+bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
 {
     TranslationBlock *tb;
     PageDesc *p;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bef4c56cff..aa8d213514 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1382,7 +1382,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
         if (!(p->flags & PAGE_WRITE) &&
             (flags & PAGE_WRITE) &&
             p->first_tb) {
-            tb_invalidate_phys_page(addr, 0);
+            tb_invalidate_phys_page_unwind(addr, 0);
         }
         if (reset_target_data) {
             g_free(p->target_data);
@@ -1580,7 +1580,8 @@ int page_unprotect(target_ulong address, uintptr_t pc)
 
                 /* and since the content will be modified, we must invalidate
                    the corresponding translated code. */
-                current_tb_invalidated |= tb_invalidate_phys_page(addr, pc);
+                current_tb_invalidated |=
+                    tb_invalidate_phys_page_unwind(addr, pc);
             }
             mprotect((void *)g2h_untagged(host_start), qemu_host_page_size,
                      prot & PAGE_BITS);
-- 
2.34.1


