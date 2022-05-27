Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1A53650E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:55:08 +0200 (CEST)
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucIt-0003Bb-6s
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8I-0002zB-Gm
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8G-0003sE-SE
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id e2so6405774wrc.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdSlyPDDPtX82pxgqFfE4Rzo9SbtIBGE9nCCAk3jrrk=;
 b=fc1chRylpUKRplB14/32XwPa34kLJztdZcnHxlyViZh9HQYnF8ges3MoI6VayNFIrE
 5wgAe2eQcUb7HMavLbbg4wdx/VKEw+rdNjkhWxmWeQUrjW/uNBzoMamDcck3LKKjQ7Vi
 bVbXpUVuizydwcrT4vXkjRYaV1tRvl+BeIj9SEDOq2rr/qAQVv425Zb3968YlFjUQzOy
 RylLMlkGtPNC7YxAgBpAQQi28geKydyqVuRtx4PpgZTNngRwhQ4RB9zL2IO7WHRi2mT5
 eicAiF+JpXznTXvj1c/0j2SZhWXj/QF0uDB++uqrxC81+FC0P7ydNGqmuiUOCp52hjF0
 SazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdSlyPDDPtX82pxgqFfE4Rzo9SbtIBGE9nCCAk3jrrk=;
 b=XzdjuPmMpalGfpsIjzb7Q73RVLYs0NsQpapXgH7HfPKpJ0emSreRHCxe5BFDwQmRTb
 vddBsQqPD9Jd1Ab8xrtAoskXx+iDXZ2NfqM8vIiSGkHXDSRgX4NEluIZKaGDMDS73XsE
 qoSQ8IfxksV7EkhH5U5L0wze7gOrKdUj/CvLI2YXILrfq5c5j2Hx93zdfNocnYJyQfkd
 9vk5o+Jj803R4gJSn2EECRMLPpsSK/7aFiVWsBclANeAdfB7CIrB3z2OkXg2IM4NuNYS
 59KCvvu6tj/MQGx0IbR+FQ3yE/EB/J2j1N+/i6A85Z+um443dMf5tNPiVQxwHi12daNk
 Kf7w==
X-Gm-Message-State: AOAM533f0N5acR6HKrgEuN1udDci8DYfE0/Xlp/mkXcIJNjCdEegkUwZ
 /VcyfBdch9jiyLz2WccAA+R4TA==
X-Google-Smtp-Source: ABdhPJzkhnRlMBrtCicsU1jM4FaHX9VRl7XG48p+CuKkc6yDiJW7xYWPp0Gp/p+C0et5llwk4ZKLyA==
X-Received: by 2002:adf:f486:0:b0:20d:5ff:246b with SMTP id
 l6-20020adff486000000b0020d05ff246bmr35949855wro.127.1653666247577; 
 Fri, 27 May 2022 08:44:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a7bc5da000000b00397473ae25esm2445066wmk.34.2022.05.27.08.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:44:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D53F71FFCF;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 23/33] configure: move symlink configuration earlier
Date: Fri, 27 May 2022 16:35:53 +0100
Message-Id: <20220527153603.887929-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Paolo Bonzini <pbonzini@redhat.com>

Ensure that the pc-bios/optionrom and pc-bios/s390-ccw directory
exist at the time when we'll write out the compiler configuration
for them.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220517092616.1272238-13-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 49 ++++++++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/configure b/configure
index b8c21e096c..82c2ddc79a 100755
--- a/configure
+++ b/configure
@@ -2187,6 +2187,30 @@ fi
 
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
@@ -2405,31 +2429,6 @@ if test "$safe_stack" = "yes"; then
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
2.30.2


