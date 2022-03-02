Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A304CAD64
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:21:41 +0100 (CET)
Received: from localhost ([::1]:37156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTbY-0006SD-FO
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:21:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS7-0006xR-Mc
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:57 -0500
Received: from [2a00:1450:4864:20::42b] (port=34546
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS6-0008RJ-3J
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:55 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d3so4115873wrf.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eRmkLnG1rWBHKyLOfVkycC10zsqH/5UMDEaprFf5ja0=;
 b=Yjz0/+HStflsXHHxQndc4kQZ9VDM8tibHEFBPhQw9rwkEwzA1JATgT7sGSz15AwRbm
 jtWWYOESAbS40+RDVvBWE0n9b+BLvmxUSfXDD5ZRN6YlDy27Xp8zUNMPrDCCPIiQ3RZZ
 bUaSnmw5NQX4Z6+4ZlmgF3du8chFx9uEgbsmfE1N2e86sbPn7ei31WNqF5/JH1BbyDYs
 3WDG3ODCiLgTaoxHrp4zUu0kG0ujg516nTfWzV8uO0PNnEPQM+0FZkXq2bx0/T3DjVYe
 5Dh6d9hCvKKmX2HcfSeBEsPc370sU9zBwJpRrTXGUuyvjCXYT3ej2X/4RKHvL6NsSpsO
 aTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eRmkLnG1rWBHKyLOfVkycC10zsqH/5UMDEaprFf5ja0=;
 b=yvfc+UwOuooiJ1Wl5H1j1jCoC9VZWpW6aicTsy0QJg7dM47LuOddd+IIuL/0hY1vFg
 lLcBHg6fwa+q/Znqh1qqpHAaTST1XJa9LAtUVok6oqpMJmMq46C7UzwEbuIMjqcdnnhQ
 uneze0VS39aYQhSBYFleC01o7B+BTyAK/Ft+GBP+1jVz/YJWo3m84+Rc5QBfQaBUD3uX
 WjH1aeWK+q833HFpx7t0yhgW19qCL9Ams36XWFUvfyrhAdyiFqxwp8svXg5tzJU1f2ji
 gKUziwiZ+jSARhm56y4ahFiWVc+3d2rD7/WYx55v3m4uvH4BrH3vLLA0xa+QlxBp3seP
 nwnw==
X-Gm-Message-State: AOAM530EHouTB1ow4+/RRFKrRATB/Fbkt7NrU+5L/8ccbFGJ0/qc8sXD
 7FSVjW8K9HfPoQKYQ0bplpaHgYrjY0M=
X-Google-Smtp-Source: ABdhPJzURRqPI3Vkay9lW3uRj5uKBWC9y156kJPNEqyE9h/niTyz3u3LPF1dhRVEZRQXKTyT/gBRuA==
X-Received: by 2002:adf:90ca:0:b0:1ea:99dd:db45 with SMTP id
 i68-20020adf90ca000000b001ea99dddb45mr23886247wri.262.1646244712824; 
 Wed, 02 Mar 2022 10:11:52 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] target/i386: only include bits in pg_mode if they are
 not ignored
Date: Wed,  2 Mar 2022 19:11:33 +0100
Message-Id: <20220302181134.285107-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
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



