Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A24514CA0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:20:32 +0200 (CEST)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRTz-0000Cs-FT
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRw-0005j8-Ui
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:24 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRv-0004ZS-1n
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:24 -0400
Received: by mail-ej1-x635.google.com with SMTP id m20so15700785ejj.10
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PddrXv+5hIHFaBzhxiEaPLVSrYwbMHaHDvw3rtbFC3s=;
 b=B5SFEoqZt1jVqOC8eooJnyPt/c+QIhu1cJs6F9oHvjKcG6xy4GU0E5mLUOweoKtYAn
 Y+FRmvOKOQRplDyEO0gySv3LKG/tgcqaXiCiYpJaiK1XaDZ1Z9c1yUSXtss7lgue+/K1
 IxjbFtdW/QSedfE/6whA6v+kQptQjPl6zjGxNru3wCnOo5eUjG4Jp0zhLjXJo4G8SCSo
 TtYMZpcnUjRwY276b7l3+eBNKtVJxnGMjdrSi78XQbsHE0kCJ1Gi5mnQXPW5sfbCHSqF
 YSPXfKa52w74yr2hIqbbWY+mlmY1yIX3RAskULQe/9Ct1yC/ancbBXy8Sns+S7PANRs0
 X6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PddrXv+5hIHFaBzhxiEaPLVSrYwbMHaHDvw3rtbFC3s=;
 b=zdhtWs2OXH2Bjd4+m3zl/OxjnpfbZHpwnfcRgdSsYXkJLMjWrhOfG+74mHk/gWrgdt
 uP/ocBQ1u/x5XQuPElh2278fehW9Yv8LjkiVaAMX332yAI4vfLcpVjWMRsqHIU1YAPUo
 CqXuLeLcosXC8AumlHWaugRxPgg8v3U4EvFg743DNSxyJBBYKn0qsgnGaSfYIcLdqf62
 l63tEg09LVZOP+KR3ls+RWF4qArnFySWLxY7cDrnuv8TzTvbJTJVWicZBwkf9Xz2Mb/U
 LyUUM5fqHYRO1JZoM6VJ6MBsgLhsv42FmvM83H2e0vMX9M34+q2lW5FSCaBqrdZv7mHx
 2HMA==
X-Gm-Message-State: AOAM532K7WNvHdQz9hWBC30/MbxCtliqxKp2ewTRq/ZCchE9nodZKcIs
 QFv4yyHfmGE/mkPI4gfRJzXLl6QI1BUtfQ==
X-Google-Smtp-Source: ABdhPJwp591uQBikpIaUUC+ujzlKGrdioQoIqnvw5wi2lJWxbje03vOMBUdYKRl2GO68AAAZmnJj+A==
X-Received: by 2002:a17:907:9493:b0:6f3:9be8:237 with SMTP id
 dm19-20020a170907949300b006f39be80237mr23020085ejc.598.1651241901601; 
 Fri, 29 Apr 2022 07:18:21 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/12] configure: move symlink configuration earlier
Date: Fri, 29 Apr 2022 16:18:08 +0200
Message-Id: <20220429141813.328975-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429141813.328975-1-pbonzini@redhat.com>
References: <20220429141813.328975-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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

Ensure that the pc-bios/optionrom and pc-bios/s390-ccw directory
exist at the time when we'll write out the compiler configuration
for them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 49 ++++++++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/configure b/configure
index bdb0cc35a8..de2bc799cd 100755
--- a/configure
+++ b/configure
@@ -2210,6 +2210,30 @@ fi
 
 QEMU_GA_MSI_MINGW_BIN_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
 
+# Set up build tree symlinks that point back into the source tree
+# (these can be both files and directories).
+# Caution: avoid adding files or directories here using wildcards. This
+# will result in problems later if a new file matching the wildcard is
+# added to the source tree -- nothing will cause configure to be rerun
+# so the build tree will be missing the link back to the new file, and
+# tests might fail. Prefer to keep the relevant files in their own
+# directory and symlink the directory instead.
+LINKS="Makefile"
+LINKS="$LINKS tests/tcg/Makefile.target"
+LINKS="$LINKS pc-bios/optionrom/Makefile"
+LINKS="$LINKS pc-bios/s390-ccw/Makefile"
+LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
+LINKS="$LINKS tests/avocado tests/data"
+LINKS="$LINKS tests/qemu-iotests/check"
+LINKS="$LINKS python"
+LINKS="$LINKS contrib/plugins/Makefile "
+for f in $LINKS ; do
+    if [ -e "$source_path/$f" ]; then
+        mkdir -p `dirname ./$f`
+        symlink "$source_path/$f" "$f"
+    fi
+done
+
 # Mac OS X ships with a broken assembler
 roms=
 if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
@@ -2431,31 +2455,6 @@ if test "$safe_stack" = "yes"; then
   echo "CONFIG_SAFESTACK=y" >> $config_host_mak
 fi
 
-# If we're using a separate build tree, set it up now.
-# LINKS are things to symlink back into the source tree
-# (these can be both files and directories).
-# Caution: do not add files or directories here using wildcards. This
-# will result in problems later if a new file matching the wildcard is
-# added to the source tree -- nothing will cause configure to be rerun
-# so the build tree will be missing the link back to the new file, and
-# tests might fail. Prefer to keep the relevant files in their own
-# directory and symlink the directory instead.
-LINKS="Makefile"
-LINKS="$LINKS tests/tcg/Makefile.target"
-LINKS="$LINKS pc-bios/optionrom/Makefile"
-LINKS="$LINKS pc-bios/s390-ccw/Makefile"
-LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
-LINKS="$LINKS tests/avocado tests/data"
-LINKS="$LINKS tests/qemu-iotests/check"
-LINKS="$LINKS python"
-LINKS="$LINKS contrib/plugins/Makefile "
-for f in $LINKS ; do
-    if [ -e "$source_path/$f" ]; then
-        mkdir -p `dirname ./$f`
-        symlink "$source_path/$f" "$f"
-    fi
-done
-
 # tests/tcg configuration
 (makefile=tests/tcg/Makefile.prereqs
 echo "# Automatically generated by configure - do not modify" > $makefile
-- 
2.35.1



