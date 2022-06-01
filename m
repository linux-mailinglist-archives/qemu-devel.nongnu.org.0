Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3E753ACFD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:46:48 +0200 (CEST)
Received: from localhost ([::1]:36508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwTMl-0006Gq-7l
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwT0k-0005fK-RL
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:24:03 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwT0j-0007uz-0z
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:24:02 -0400
Received: by mail-ed1-x52c.google.com with SMTP id fd25so3342440edb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J4oIXDaFkPNgpbtozhms7v34rFtzZXvcjlt+SBmQ1bM=;
 b=Ry9IwEci1BH58bNoqJ/AJg4HC86bwCOnYkf4y1tlIVjV5PNW0uCcOvhw45F27NSFkz
 23PKwzsMFk0Rf0mx6qPQAUPxn0Sepgn2MlHcXowF3qSF/UQVgJGSTQcOWwd8hAkI00jb
 8rqvEYUI6TL5vQYhCtocpzapzdarDvApKMeI7ufL0VVvrP3eW9NzHJeB0icR2qh/nhA/
 my3jA3zdmFecoFc0MxqGUo/mDvOL98Msp4STHg+DuL4oi1dctNm4y2yRkfmAmeZAwTlP
 iDnCua2y2v9PAu44xkhCDwlkyMG/QnY8exfKEhLvHX/0V2aocvnnVLRQQlMpe0J7vys4
 QrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J4oIXDaFkPNgpbtozhms7v34rFtzZXvcjlt+SBmQ1bM=;
 b=yR9hcL86Pl8+wQhBXQZ+EH3hGD05g6O22yehLMDFQT/kVjyJd/xflVMyiV6zb06+zD
 +i3H6VJkrpkhjNuabO7lx8c8Qn/sxlmBO1tlGbHSbBbaPNeY2znzFRptWTkH4vrwqdmg
 pdMmf8mi5jzJ1xgWRT0Cl18zj9/aNgdPkO+yCZ+8v/yZKPgHFD/SSp9At8jVB46bol/R
 vkrwxYUj80kpI7XlzKqs8YOp9jYtwzHLuwC3JgwELCv3zO8zt1ld7wuYsEHzbl02Ygb6
 U2VsnC2I4tqGTgWiQO7PXsJunr7UBB1PLoJxO0lFe2d9pPx2eoA/eDDJZ/zMjiz/O1q2
 6F0A==
X-Gm-Message-State: AOAM533Q6bJyHXuJZ7UMEpFTdbYt7QiqjgDvzvIF942MR8I+KhD8wKM9
 m0ZJr27SHQfbjW5KaogoWEi/PQ==
X-Google-Smtp-Source: ABdhPJwk8WV8GM4zvTmAUkQBXFvdHoMjcgkgL856ZumxUYlPgXhOu5i73kBFdXMMy1tsgXxqxB+hlw==
X-Received: by 2002:a05:6402:40d4:b0:42b:3203:aafe with SMTP id
 z20-20020a05640240d400b0042b3203aafemr1117280edb.376.1654107838965; 
 Wed, 01 Jun 2022 11:23:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05640214d800b0042617ba63basm1341619edx.68.2022.06.01.11.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:23:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C0B891FFCE;
 Wed,  1 Jun 2022 19:05:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 23/33] configure: move symlink configuration earlier
Date: Wed,  1 Jun 2022 19:05:27 +0100
Message-Id: <20220601180537.2329566-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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
Message-Id: <20220527153603.887929-24-alex.bennee@linaro.org>

diff --git a/configure b/configure
index ced8283b98..aa17b0fa55 100755
--- a/configure
+++ b/configure
@@ -2190,6 +2190,30 @@ if test "$QEMU_GA_VERSION" = ""; then
     QEMU_GA_VERSION=$(cat $source_path/VERSION)
 fi
 
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
@@ -2408,31 +2432,6 @@ if test "$safe_stack" = "yes"; then
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


