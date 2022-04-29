Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFF6514CBD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:25:11 +0200 (CEST)
Received: from localhost ([::1]:38032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRYU-00081j-OZ
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRs-0005fv-MG
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:20 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRr-0004Yb-31
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:20 -0400
Received: by mail-ej1-x630.google.com with SMTP id y3so15684510ejo.12
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CKwxXqLYNV6OHtD6LrxQjyXmwSW3qhAClw+CCy5pf/g=;
 b=XVoZcaQxok5enJp4h9oiRzNh9sipSVIQoYbO0BTIqNKpJ+XgHQ+49tjlA0B7IHuNPJ
 RNdcYOePHoIw3Ivf7TSqXPzI/L++QciZDpnN5qLhR0u6JlolCiJtXiN0W7fALOm8dcOu
 RZom+pmaLLg0Psn6QIP4DU13ssUcuY1zbXSLOz6jZOQeLCJrEvBAP+foDNTo1a/L3i23
 ZcBgz8XCMUae97DPz2E+NN0A8Bg5M4etFDhiqp8ofAWU9dJVgAj29Hw3kjiqcuVn6g2B
 3GNuD6CoL3h5wBsfU4/YH27uF2L5j6PhXUGkxLcYuI1L38xNl41mPM12Pvr3cG8kT+s1
 ObcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CKwxXqLYNV6OHtD6LrxQjyXmwSW3qhAClw+CCy5pf/g=;
 b=1VyRk+xnTDKh4QUXetM+NUuK8P13jGoI3+/3NrM4TwmN7HngM2lIlXDPcvSFW1rGwL
 UlnRra503Uc1e7B47pwMM9je/27dKhc+8MHi2Za/ca+hTZcyPTnHyLaweDptGITWX7HX
 WMdJSSfCEIAG/WX+FbzEL1CKonBkKAFNhrxoxR+jY47JMQfeCfzpboVAM4VHdk7hxpK0
 jctS9aplN+fxKnByH6iWIYnF2TNPCwcS48NnRR5pIWG4qLtObp25nMl4MIrNX07LR3Hv
 Hjm8yQ5L54hMcZfgaj+DlF2WB2265pgq1BIu264iPR4sk/VSgVOyASTb5FHWWo0UKlmy
 sm3w==
X-Gm-Message-State: AOAM531BhixRhFOD1MWVK7HSeQvqQ2ZQZz53t2tJXnYwm85NwA2QP6Ng
 Y9xXX33LznGkOOne6Jx1fTg3NoYh60ii2Q==
X-Google-Smtp-Source: ABdhPJyl/f8R+pwQ+IA8yT5zJ24p6iWpq9xmkU174oA43gAAGYKjyLXgJWUfdDHB8fC8Lf0mNOhdFw==
X-Received: by 2002:a17:907:7254:b0:6db:ad8f:27b4 with SMTP id
 ds20-20020a170907725400b006dbad8f27b4mr36819858ejc.599.1651241897660; 
 Fri, 29 Apr 2022 07:18:17 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/12] configure: handle host compiler in
 probe_target_compiler
Date: Fri, 29 Apr 2022 16:18:04 +0200
Message-Id: <20220429141813.328975-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429141813.328975-1-pbonzini@redhat.com>
References: <20220429141813.328975-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for handling more binaries than just cc, handle
the case of "probe_target_compiler $cpu" directly in the function,
setting the target_* variables based on the ones that are used to
build QEMU.  The clang check also needs to be moved after this
fallback.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index a208459ff1..5277ac9092 100755
--- a/configure
+++ b/configure
@@ -965,10 +965,6 @@ case $git_submodules_action in
     ;;
 esac
 
-if eval test -z "\${cross_cc_$cpu}"; then
-    eval "cross_cc_${cpu}=\$cc"
-fi
-
 default_target_list=""
 mak_wilds=""
 
@@ -2026,13 +2022,6 @@ probe_target_compiler() {
   if eval test -n "\"\${cross_cc_$1}\""; then
     if eval has "\"\${cross_cc_$1}\""; then
       eval "target_cc=\"\${cross_cc_$1}\""
-      case $1 in
-        i386|x86_64)
-          if $target_cc --version | grep -qi "clang"; then
-            unset target_cc
-          fi
-          ;;
-      esac
     fi
   fi
   if eval test -n "\"\${cross_as_$1}\""; then
@@ -2045,6 +2034,20 @@ probe_target_compiler() {
       eval "target_ld=\"\${cross_ld_$1}\""
     fi
   fi
+  if test "$1" = $cpu; then
+    : ${target_cc:=$cc}
+    : ${target_as:=$as}
+    : ${target_ld:=$ld}
+  fi
+  if test -n "$target_cc"; then
+    case $1 in
+      i386|x86_64)
+        if $target_cc --version | grep -qi "clang"; then
+          unset target_cc
+        fi
+        ;;
+    esac
+  fi
 }
 
 write_target_makefile() {
-- 
2.35.1



