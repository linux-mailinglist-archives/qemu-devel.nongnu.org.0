Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F3144556B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:37:36 +0100 (CET)
Received: from localhost ([::1]:52460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midrz-0006Cq-32
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1midRN-0006FN-JN; Thu, 04 Nov 2021 10:10:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1midRL-0002Ku-2h; Thu, 04 Nov 2021 10:10:05 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso4408758wmf.0; 
 Thu, 04 Nov 2021 07:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j0dbHIH7kx0P124G/r8aX5PzRPAKYNtVa7fkjmrzx54=;
 b=eICFF8UgvbcRDVz1yaCmvenYKGf7SFbB+BKeqFI2Po58kobhBhbzrSWX5lv1juaGly
 R4+IM4IkhyX3O6efsQMcLgPnk/ITFPunphX8pZDbvrL4PZIGQPacxZVHOwif04imkP4X
 oxj8lhg2o5GwHr8m8TlgR6C0onIm9exVMhWc++UhycxaY3X9jshMVqAkCxhn+DZoIulS
 EWn44uLBzcGLqwwHh/3zxOVPiN7DWZaEZpdDTewjoK+47c9j6BNSsF59p6Bhb4m07N1x
 Sps8yPjqcXRVjRGv5vBQVgys5YY1QU2sWE2t6k/YFCkFiKhkUXFtzGLbcsYAfptX6Qig
 6ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=j0dbHIH7kx0P124G/r8aX5PzRPAKYNtVa7fkjmrzx54=;
 b=EtpwMJR7o21xELwdsjJ6E68wLCJKjgMdfOTrWRlh5VxYzqqaflleOnwrEOXoSNsD5N
 ThqY0U8mEegrL3zDTudHbciB5YEvv8pt9I2/2trPcV7zcetZ6iuSviobt+jXvuqZvU/j
 EtrI+l5/U+TyLvKcvntOJthnqd6F6c8lphj3HcBjXPhwAKdBitnJnax+yoHUX9rSYfmG
 e3HVB8RL8GBCdtP1bzsw+aRHWpYLuSjgTmtrwY7ES+ynNlEsfD8XkCqCPpDhUmkj9Wyb
 6xbESXY8LjRMAQq3YXvY30VQlSx9eZl1hBypwBV4qYMMW7G27imUBcTLQl9L+ZByZFsS
 Njdw==
X-Gm-Message-State: AOAM533XxYxw/GnEkuYeCgv4VGC2U6JSXXUbk6VddkkU1ligpJw2+cu7
 /NoCu7+HcW9WelxRuvYrJXazxeXZgUs=
X-Google-Smtp-Source: ABdhPJwWUdLtgkn9d2XUNF1UnZ+mbaA0lh085txCxNpgMkWxOrqCAf6hodWoTkATP2y92mDvcboBCA==
X-Received: by 2002:a7b:cb12:: with SMTP id u18mr23268477wmj.109.1636035000821; 
 Thu, 04 Nov 2021 07:10:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n7sm5065330wra.37.2021.11.04.07.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:10:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target-i386: mmu: fix handling of noncanonical virtual
 addresses
Date: Thu,  4 Nov 2021 15:09:58 +0100
Message-Id: <20211104140958.445304-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mmu_translate is supposed to return an error code for page faults; it is
not able to handle other exceptions.  The #GP case for noncanonical
virtual addresses is not handled correctly, and incorrectly raised as
a page fault with error code 1.  Since it cannot happen for nested
page tables, move it directly to handle_mmu_fault, even before the
invocation of mmu_translate.

Fixes: 661ff4879e ("target/i386: extract mmu_translate", 2021-05-11)
Cc: qemu-stable@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: #676
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 492b777de9..5ba739fbed 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -94,15 +94,6 @@ static int mmu_translate(CPUState *cs, hwaddr addr, MMUTranslateFunc get_hphys_f
             bool la57 = pg_mode & PG_MODE_LA57;
             uint64_t pml5e_addr, pml5e;
             uint64_t pml4e_addr, pml4e;
-            int32_t sext;
-
-            /* test virtual address sign extension */
-            sext = la57 ? (int64_t)addr >> 56 : (int64_t)addr >> 47;
-            if (get_hphys_func && sext != 0 && sext != -1) {
-                env->error_code = 0;
-                cs->exception_index = EXCP0D_GPF;
-                return 1;
-            }
 
             if (la57) {
                 pml5e_addr = ((cr3 & ~0xfff) +
@@ -423,6 +414,18 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
         page_size = 4096;
     } else {
         pg_mode = get_pg_mode(env);
+        if (pg_mode & PG_MODE_LMA) {
+            int32_t sext;
+
+            /* test virtual address sign extension */
+            sext = (int64_t)addr >> (pg_mode & PG_MODE_LA57 ? 56 : 47);
+            if (sext != 0 && sext != -1) {
+                env->error_code = 0;
+                cs->exception_index = EXCP0D_GPF;
+                return 1;
+            }
+        }
+
         error_code = mmu_translate(cs, addr, get_hphys, env->cr[3], is_write1,
                                    mmu_idx, pg_mode,
                                    &paddr, &page_size, &prot);
-- 
2.33.1


