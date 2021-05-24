Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F0C38F1ED
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:03:25 +0200 (CEST)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDzA-0004px-F1
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeK-0004jI-OX
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:53 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:42840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004LB-Em
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:52 -0400
Received: by mail-ej1-x631.google.com with SMTP id lg14so42763877ejb.9
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XYlIy29CAzsIXn+NuTHdzNwJB0PZQ/8OlU0zYweURUw=;
 b=hNS95ZkktK1O3RqVjEyvbJ8PBs8RvofKVZehbU11tRrw2ncopnG2ZyQONRI4hCDJbs
 QVvr5YPCWO4/7rZCU+n9YnCvxthy9rZvU1ivze2jlNQg4jNhzrssOENPEgOO820sYbGD
 LCivuJmBXH5jw0CnbAlGB7OVtUCTnWIxRf2xaOfNyrJYEJwTx8AFdgiAX4vlp38+4vbr
 6Y+G8nxd+fgYddlGcFlO1Dqqd+UMg/4RfNKRTXLxb8p8n/d4ak/C93hO546yJ0EN5oRI
 Xi4cA0LkLF1ez/0BcBoPROc2/nGjF4IVnCRSHSfZhqVBdkdrCYaLehmeg1RXONPDPNkj
 OkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XYlIy29CAzsIXn+NuTHdzNwJB0PZQ/8OlU0zYweURUw=;
 b=D6KiybS8tGlf/RkSTO0gH1rIKM1ML8KZO4gQlvIdzBYp8PCl1ZLMo+aVcXn0eWuRgq
 prJYpBBXwd2vagSLFU1o6Zyv701P4ED9wo61SWwf0pRSeprUbGsPkuVOlUjWlFQNbzxP
 brYN4pxVdpDkn3wmhibv9lYQdGGB+cfVPoKV/tNIGFB8Rq+065YiSOIIkk7PrBdpIwHt
 SzWz3RXCl9ZRylMBtQlDVgl5Ca7T26t8AezY+TNtw5T7/WDzxU4WM1xxPBNBsZrLIp6V
 Qv+JdK9gM6jLW271W1B89xZoHkpKyG7lcXHyjo6UWAkYpxHIGAKw+cjSj8bzWS1pzOr8
 KcgQ==
X-Gm-Message-State: AOAM5307lQzxchQ//3r7Yr7VO+O4gDedcuAb7l4jwiWCZp8Mnos7pBEX
 N5XS7+yoi8chnP4p01dYkcIn9jaErQ6VKw==
X-Google-Smtp-Source: ABdhPJyYKwnD95jW0OCBRnd5fGiY5+qWQvVoTLt2sKtDDIBmrPCEhfgwEHv/pTrsOrLtQyFdctREtw==
X-Received: by 2002:a17:906:7f0d:: with SMTP id
 d13mr24531044ejr.60.1621874494288; 
 Mon, 24 May 2021 09:41:34 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.33 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/28] configure: simplify assignment to GIT_SUBMODULES
Date: Mon, 24 May 2021 18:41:06 +0200
Message-Id: <20210524164131.383778-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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
index f32c6f1a26..cca532bb0c 100755
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
@@ -3627,9 +3627,7 @@ fi
 case "$fdt" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test "$git_submodules_action" != "ignore"; then
-      git_submodules="${git_submodules} dtc"
-    fi
+    git_submodules="${git_submodules} dtc"
     ;;
 esac
 
@@ -4351,9 +4349,7 @@ fi
 case "$capstone" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test "$git_submodules_action" != "ignore"; then
-      git_submodules="${git_submodules} capstone"
-    fi
+    git_submodules="${git_submodules} capstone"
     ;;
 esac
 
@@ -5283,9 +5279,7 @@ fi
 case "$slirp" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test "$git_submodules_action" != "ignore"; then
-      git_submodules="${git_submodules} slirp"
-    fi
+    git_submodules="${git_submodules} slirp"
     ;;
 esac
 
@@ -5477,9 +5471,7 @@ if test "$cpu" = "s390x" ; then
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



