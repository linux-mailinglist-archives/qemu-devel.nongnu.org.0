Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920784D1693
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:47:48 +0100 (CET)
Received: from localhost ([::1]:57218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYJf-0001hx-L6
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:47:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7X-0007nj-4o
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:18 -0500
Received: from [2a00:1450:4864:20::62a] (port=40717
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7O-0005zD-Gb
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:07 -0500
Received: by mail-ej1-x62a.google.com with SMTP id p15so38546082ejc.7
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GU+DDg+7U1IccGbjF8TSYQhJcv2NvDn70R8rbM/9+v8=;
 b=DDvqlSPqYP9MXnbOuDfu37OCHSBGY2DAuSqwa+rbKkjTFZXfx9xC5ncKvCeWrPZq44
 9qjxif7WyDav12qZ5bguhSrjPel2A5HkS/rirdo1Jrk6K+fbDQ187sgtoaHhZ8rCX7qG
 UyjMHaM5NFf+9AM32hpXES05gcQUk06g20gVxiSb6V+z681wJD+A1Pjqjb2a6+Qm1AKm
 SUfWJ1kGXeHHokVHQHWxyXf5dEQkNgVwVyUMwsycKQ9IA4TD6urLjUT0ekEOttijOGSe
 310I9WthJhrIW3VVxhhVgIwuZ/br+1UliDqKD8cpqr+IgVd955ZRDZ+ZKyqRo5AwnwiR
 LT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GU+DDg+7U1IccGbjF8TSYQhJcv2NvDn70R8rbM/9+v8=;
 b=PBbBVeo1ssT/reS6NrBF0pIf87L2FrS9L07eeB5EzU6KLMr+cZzq2xYF7YrGdSmB+u
 qhxbmQR6bGkA6Sj1wxO3FAI1jsLKKdqeNUk6fWM6X5KBBDhegHQPSC7NsjmTxcYBRt+w
 Pq5S1EnIEUDx9/ENPpf6eBZmIBewZm1hlLZKVjIdevme9mOJet0WNR/lf0svE873pXBd
 9yK3uIhj3HSowDrvffAYotb0CurO2mOOCZ/YsTRcuraeDLR0TR2R2xXBHYMxyVsYa+jr
 r/taQr2BBHLmzqMuV/8f8sQhAcqxPQZxFpplNETTG3QunfjgVXgOkqAFRxWyMVoa6HT2
 HF8w==
X-Gm-Message-State: AOAM531RTZoSrD2t10TQdj3+EU4NMy41F2sG+VRQ/4B8IebEmNrMWeuf
 gufnKi07v1CUXz2rmrJApfwW6n688CM=
X-Google-Smtp-Source: ABdhPJyGH/lxyv+3obiDlSUcOFFsmWQWqxVCpi8PFR4ilJPCnrZCpKyX/TQ9Vjlw92Oyk0+WOJZ+hg==
X-Received: by 2002:a17:907:8a04:b0:6b6:1f22:a5e with SMTP id
 sc4-20020a1709078a0400b006b61f220a5emr12814003ejc.528.1646739305229; 
 Tue, 08 Mar 2022 03:35:05 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/22] target/i386: only include bits in pg_mode if they are
 not ignored
Date: Tue,  8 Mar 2022 12:34:33 +0100
Message-Id: <20220308113445.859669-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LA57/PKE/PKS is only relevant in 64-bit mode, and NXE is only relevant if
PAE is in use.  Since there is code that checks PG_MODE_LA57 to determine
the canonicality of addresses, make sure that the bit is not set by
mistake in 32-bit mode.  While it would not be a problem because 32-bit
addresses by definition fit in both 48-bit and 57-bit address spaces,
it is nicer if get_pg_mode() actually returns whether a feature is enabled,
and it allows a few simplifications in the page table walker.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 34 ++++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 5ba739fbed..0410170d64 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -24,32 +24,35 @@
 int get_pg_mode(CPUX86State *env)
 {
     int pg_mode = 0;
+    if (!(env->cr[0] & CR0_PG_MASK)) {
+        return 0;
+    }
     if (env->cr[0] & CR0_WP_MASK) {
         pg_mode |= PG_MODE_WP;
     }
     if (env->cr[4] & CR4_PAE_MASK) {
         pg_mode |= PG_MODE_PAE;
+        if (env->efer & MSR_EFER_NXE) {
+            pg_mode |= PG_MODE_NXE;
+        }
     }
     if (env->cr[4] & CR4_PSE_MASK) {
         pg_mode |= PG_MODE_PSE;
     }
-    if (env->cr[4] & CR4_PKE_MASK) {
-        pg_mode |= PG_MODE_PKE;
-    }
-    if (env->cr[4] & CR4_PKS_MASK) {
-        pg_mode |= PG_MODE_PKS;
-    }
     if (env->cr[4] & CR4_SMEP_MASK) {
         pg_mode |= PG_MODE_SMEP;
     }
-    if (env->cr[4] & CR4_LA57_MASK) {
-        pg_mode |= PG_MODE_LA57;
-    }
     if (env->hflags & HF_LMA_MASK) {
         pg_mode |= PG_MODE_LMA;
-    }
-    if (env->efer & MSR_EFER_NXE) {
-        pg_mode |= PG_MODE_NXE;
+        if (env->cr[4] & CR4_PKE_MASK) {
+            pg_mode |= PG_MODE_PKE;
+        }
+        if (env->cr[4] & CR4_PKS_MASK) {
+            pg_mode |= PG_MODE_PKS;
+        }
+        if (env->cr[4] & CR4_LA57_MASK) {
+            pg_mode |= PG_MODE_LA57;
+        }
     }
     return pg_mode;
 }
@@ -278,9 +281,7 @@ do_check_protect_pse36:
         *prot |= PAGE_EXEC;
     }
 
-    if (!(pg_mode & PG_MODE_LMA)) {
-        pkr = 0;
-    } else if (ptep & PG_USER_MASK) {
+    if (ptep & PG_USER_MASK) {
         pkr = pg_mode & PG_MODE_PKE ? env->pkru : 0;
     } else {
         pkr = pg_mode & PG_MODE_PKS ? env->pkrs : 0;
@@ -343,8 +344,7 @@ do_check_protect_pse36:
     if (is_user)
         error_code |= PG_ERROR_U_MASK;
     if (is_write1 == 2 &&
-        (((pg_mode & PG_MODE_NXE) && (pg_mode & PG_MODE_PAE)) ||
-         (pg_mode & PG_MODE_SMEP)))
+        ((pg_mode & PG_MODE_NXE) || (pg_mode & PG_MODE_SMEP)))
         error_code |= PG_ERROR_I_D_MASK;
     return error_code;
 }
-- 
2.35.1



