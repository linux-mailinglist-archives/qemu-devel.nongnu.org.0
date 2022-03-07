Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8574D0681
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:27:22 +0100 (CET)
Received: from localhost ([::1]:43436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI4n-0005lb-Rj
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:27:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuh-00013q-QC
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:55 -0500
Received: from [2a00:1450:4864:20::62a] (port=38540
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005NN-5v
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:55 -0500
Received: by mail-ej1-x62a.google.com with SMTP id r13so33858686ejd.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eRmkLnG1rWBHKyLOfVkycC10zsqH/5UMDEaprFf5ja0=;
 b=EK1n1z6e8MlHEd9m0yk7mY+z2rCvZ88k3GuPSW/2h9MjBVClamCdXVRWKnK2xtK7uG
 6UXzgNfAjVzE1X4ASF7pKjfLtmqsGeo/GN6qTJTRvOipz+kYV32u8LYYTDL4lW1L2uW7
 riCkeXRblKOTXWqIxZmy1rKAOnLpKmGofJprnkbSRGGppYbX7ADwXG11bhFXit8zkBX9
 vcCYsuhOvjelJYKvzE67psi4ctOSOBRLNnzqLb4zMd+jojOeOEfrt137Qsx6h6ceiMtp
 fuJbmxsdfDxa0+7RDiuyyOn8GLO0K/gOjt6BVVj1MQ3tydxj44fSGOifvSBgSHgK544g
 aX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eRmkLnG1rWBHKyLOfVkycC10zsqH/5UMDEaprFf5ja0=;
 b=G6VVqlw7UJKMJ/U5n81WC8e7nSnjBRE+2Zofsy5RPvDHzEig6BkZ2Bj9USqTWtjujV
 Q7Ok7fLiCMsLRb8/89ZAI4cq6J+VObRh9/s12iQlnc1AWid04amI08eoQnPzUnljC9QA
 P8G5kQESVYu8cBpi30Jmc4SlQzcyrdGf1muj43l+yV7YiUYIWpm3NZkH+W1mkb8vLVaW
 qIc+cXzq/kOszFFuveVmWdbQ4nW61Xi19PosGIUYRd9YH4T4Ir6v2V0YeqVN1LHOXV8G
 tcrOPtny0/gMp0dm80twoRTC8dwuKJWaMUYXhAg7ocpcSJxmzxDd6f5Ok4P9JT4IgQ0e
 pZaw==
X-Gm-Message-State: AOAM5335fjxcsF1ZVpnvsryNy//HWinnjtlfXnSDEW9xKT/fJdnZsuh0
 JNYNJ+DV4Q1NylcBeE5ZKrCxSKPQUU8=
X-Google-Smtp-Source: ABdhPJyQOHP4R9N26/VYX+0PwA1pG5Hb1HBqEJsm0PVjHwKXG1R67Om9d5OvqBOPxECx5BR1t3ZZig==
X-Received: by 2002:a17:907:97d5:b0:6da:5b9f:6133 with SMTP id
 js21-20020a17090797d500b006da5b9f6133mr9952201ejc.343.1646677003478; 
 Mon, 07 Mar 2022 10:16:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/23] target/i386: only include bits in pg_mode if they are
 not ignored
Date: Mon,  7 Mar 2022 19:16:20 +0100
Message-Id: <20220307181633.596898-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
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
2.34.1



