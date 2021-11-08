Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC88A4481F9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:38:20 +0100 (CET)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5mu-0001xe-3L
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:38:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l8-0008Ao-7E
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:30 -0500
Received: from [2a00:1450:4864:20::52e] (port=45617
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l6-000752-CO
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:29 -0500
Received: by mail-ed1-x52e.google.com with SMTP id f4so63060828edx.12;
 Mon, 08 Nov 2021 06:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iHdXttUuLkFsoOSClyINDmKVq/XLT1QrgFTuJJMJyxE=;
 b=TBaChHeaIuFEoakPrA6HAwkPFPvxoGykxDzrm+8nf6binySVkdA/zRD5R1uHGAzSgm
 j3l8cT0abL0f1I3nhkpmRk3fabSOAim2sd2WBcVZjDTHIpB0qAxFkb+wO5Hmzvf15VAD
 e19aKxoMshdGORclKL+KsFboVKZyhc2g4g4ZtC+m7yze8Bq5UHlBaXrbTrLdo+rtOq1H
 2lwo48h0aotHRVqw7Adoc0JVFmgURlCovF3kzrZjcrBt0VF6p8UghWGjrDguUgd60Svz
 N87rHRUpN/N+tWLpB9f18fz4wV6sx8Muwx2U/aWav4Xcda5jr9ao8TxRLsqnLvJmpqzo
 ZwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iHdXttUuLkFsoOSClyINDmKVq/XLT1QrgFTuJJMJyxE=;
 b=q4PsSCf/VnduFpkb2KwmqawISp+U31B1b9SHEDp4NrGgR8t93BzgCrlDBiBmEhLjER
 KSG9FhEYY1UTb+ce44PgCHJEUsejLyKTPR7sma4uzvDdGYKlsMLo2Yq4v23fDB9a2q+e
 l14HUypSke9qDQ+L/snLRsCuC+H9FY+0oHUyM0+1nw2L4zs09TmQHu3NB3SAla0wRVAu
 nDxBxTopvpijxcmCwxcq/FjsvMUyviDTRkYURMJj4eBM/GVjbKnjB/TdjEgHqf67rXM0
 ZkVX0LSI9iR4G8CWAPMxlwmhBaQDuAbdr2M0g/mrp6+cvD1+J3LuiUnaQEj3IAKS2JG8
 cajg==
X-Gm-Message-State: AOAM533UoTjjSZ+4YTIviNsaHIk622APaXN5KFyUY9lSIGd2bf6Dez9M
 assx4DUMcWKtW1VQG/iM4sccPQErnPU=
X-Google-Smtp-Source: ABdhPJwB8sHYJ8pHSMbitol+Yu5J4v3c4S6CLi/1i7CK7IJ7cnai5uOjlbYgRtENr8HyadEoTMPREg==
X-Received: by 2002:aa7:c501:: with SMTP id o1mr82394edq.99.1636382180187;
 Mon, 08 Nov 2021 06:36:20 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hp3sm8366662ejc.61.2021.11.08.06.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:36:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] target-i386: mmu: fix handling of noncanonical virtual
 addresses
Date: Mon,  8 Nov 2021 15:36:08 +0100
Message-Id: <20211108143616.660340-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108143616.660340-1-pbonzini@redhat.com>
References: <20211108143616.660340-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Fixes: #676
Fixes: 661ff4879e ("target/i386: extract mmu_translate", 2021-05-11)
Cc: qemu-stable@nongnu.org
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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



