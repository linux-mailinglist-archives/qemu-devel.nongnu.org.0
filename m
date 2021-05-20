Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8CF389FEC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:35:47 +0200 (CEST)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lje9i-0000N0-9W
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxY-0005Mz-9m
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxQ-0001TK-9e
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id q5so16672209wrs.4
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KQzNl8zfqVtZdobfUUEZ5QYEJ0jQDvY20mVSPHPLVm0=;
 b=I1W9sJ5tsIia86k6doWbz5+z/cQ9uHu8a0FaPjMRqnky2pJuo4gz5E/IQY/ti/kKhG
 Ko4KKCHz+3gkl0MZDVpDOdzgPEmrC9BpTIKtjt35fehmBpuue0JDFdVnLtm6A1U77zDV
 kVZVsrkN6TUWPwFFMxX3xZVGtT6CX6+PUpiHTdcKKTtrM74CSVDowQj4+SZn2arCbue7
 CuI5TLMiuX0EhYVY4sYP76jaiS+qnnu1E+MJCaJ5e7sI/+hYGxXQtgF2c4mOwzzEA+ao
 jbNS4ypomkwmbwfD+xpyLc3cd8i7AhXqZmXisj581XWUC2iBDXrhaqUMZ6+apZw4WRog
 JAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KQzNl8zfqVtZdobfUUEZ5QYEJ0jQDvY20mVSPHPLVm0=;
 b=p/mq6d5HQC1XI4GeObZG3e1yNzz8SNdh6wkxaEB7N6ntVqUnbUJubE57MPc2v4i/5d
 y8t24xAIkHPsh/WX8gSaBnxhFJJcEqKywZJiy3meuttyzxrCdq0QSaFukZzB80HWD7Rb
 m18KWuY0Rb1uPzJi2rmk06RPZXcIZV3xngRB+mhRRvewtL+fGCwc8tzjfGzHgc+ne1YW
 m6ENH7AJqZfD0fdMOGQXyoU6bjVTumPlOTjPg8kAByZWcmy/V8k+bY+uIkaOLB9SDYuh
 lAh4z2LBH0kCsFu9acWM5TLO7sL/+6s6+rC8XKR2ApdX7yzjQaz05uPgrNaY/P4ZR3aG
 26hg==
X-Gm-Message-State: AOAM530k75hkCD2SYiejgq8mEIaQDihDDfvHQRAc/3fE2IvrHlfbriXe
 s1T5fR/cLbN8he3E8FjgSra4rjoKkGf67g==
X-Google-Smtp-Source: ABdhPJzC57ToSBPEUfxIWcKg3wvmWcHa3hZ9Z/XvVLGuFnSv2opTnHyVKSnc971fBFNZYqftJP2lTg==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr3009970wrm.87.1621498980631; 
 Thu, 20 May 2021 01:23:00 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.00 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/26] configure: simplify assignment to GIT_SUBMODULES
Date: Thu, 20 May 2021 10:22:34 +0200
Message-Id: <20210520082257.187061-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not guard each assignment with a check for --with-git-submodules=ignore.
To avoid a confusing "GIT" line from the Makefile, guard the git-submodule-update
recipe so that it is empty when --with-git-submodules=ignore.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile  |  2 ++
 configure | 20 ++++++--------------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 4cab10a2a4..30f19d33bb 100644
--- a/Makefile
+++ b/Makefile
@@ -48,9 +48,11 @@ Makefile: .git-submodule-status
 
 .PHONY: git-submodule-update
 git-submodule-update:
+ifneq ($(GIT_SUBMODULES_ACTION),ignore)
 	$(call quiet-command, \
 		(GIT="$(GIT)" "$(SRC_PATH)/scripts/git-submodule.sh" $(GIT_SUBMODULES_ACTION) $(GIT_SUBMODULES)), \
 		"GIT","$(GIT_SUBMODULES)")
+endif
 
 # 0. ensure the build tree is okay
 
diff --git a/configure b/configure
index 4681cbe2d7..55049fe930 100755
--- a/configure
+++ b/configure
@@ -256,11 +256,11 @@ gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 if test -e "$source_path/.git"
 then
     git_submodules_action="update"
-    git_submodules="ui/keycodemapdb"
 else
     git_submodules_action="ignore"
-    git_submodules=""
 fi
+
+git_submodules="ui/keycodemapdb"
 git="git"
 
 # Don't accept a target_list environment variable.
@@ -3617,9 +3617,7 @@ fi
 case "$fdt" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test "$git_submodules_action" != "ignore"; then
-      git_submodules="${git_submodules} dtc"
-    fi
+    git_submodules="${git_submodules} dtc"
     ;;
 esac
 
@@ -4328,9 +4326,7 @@ fi
 case "$capstone" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test "$git_submodules_action" != "ignore"; then
-      git_submodules="${git_submodules} capstone"
-    fi
+    git_submodules="${git_submodules} capstone"
     ;;
 esac
 
@@ -5260,9 +5256,7 @@ fi
 case "$slirp" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test "$git_submodules_action" != "ignore"; then
-      git_submodules="${git_submodules} slirp"
-    fi
+    git_submodules="${git_submodules} slirp"
     ;;
 esac
 
@@ -5454,9 +5448,7 @@ if test "$cpu" = "s390x" ; then
     roms="$roms s390-ccw"
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
-    if test "$git_submodules_action" != "ignore"; then
-      git_submodules="${git_submodules} roms/SLOF"
-    fi
+    git_submodules="${git_submodules} roms/SLOF"
   fi
 fi
 
-- 
2.31.1



