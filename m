Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2911C30881E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:12:58 +0100 (CET)
Received: from localhost ([::1]:43696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rhx-0004eV-5o
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW9-0004ck-S8
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:45 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVx-0006zU-JH
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id m13so8384001wro.12
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zFshe6a9XOs+UpYhaoy/bCbUaTZ0COXMECt5cI7PQd8=;
 b=yD4+BBLsRwM9XpgywxFDhTiYSby5V7R0G5WdUBdsYIuMS36w+UhTy6GwWCBgOUnZBW
 S+QPX9CtEdH6R3yJiHxv341fTGlf3ofCRZSOy5fNbYmJN3LoIyY3LpMkEouQYdd3/H+O
 FozKmNWJHyby6XAFf9bfcVUEmguvpeFyvWktnaWYY5/0TKwXx0YJdTcwbPbJM7opMViM
 d6JChUGvWOHC1WhU9jYP7NOaPakLoreA/dtsAfeuWFXPRJxrpUppkLzkCkgEmb2psUUO
 DaibqDKgW35tvRTY5DEdWuANR5/qSL739DGxLkQyVc+OqGdvKVYeLwCgygUQX/cDGXwA
 6HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zFshe6a9XOs+UpYhaoy/bCbUaTZ0COXMECt5cI7PQd8=;
 b=P1GE52z/byD0M6WMDs0yivXmteC7DqCVy+CDacuRQotAh33fN+RSpacFicWLUMU4b0
 r63i+FvRoI8XSJUqAX++82DLGnyF4VVgSyhQirRJpnkkkWBm5rSpiFAI1ObqJZMKPLJx
 9GewPHNACcTWV2pTTthVy+n/pYCcS1PKJfKX5NSiV6KvDYojkD+445MBKdB2LnAhn01+
 E76jGvgedBPTiyMABLmiW9fjuAusdVbP7swQNCPN+Q9IVOymKpSq7udBhLZQZWlEL2/O
 O2pVtUqDXlAXIfYL3nLqFViqT0RY83kAmMOMS7d3+HTpH/wG3LAbzHkd5p+pTcBEy1hv
 homw==
X-Gm-Message-State: AOAM531Z35b1PkvCMiozj5Ket4QyuGyVcwVnjd8CyIYx2afsoIp2NpGs
 2wMhw7bKNEsk418b4F3B80xYH8OywSwFSA==
X-Google-Smtp-Source: ABdhPJytGBSV6M4Dout4xPqTcitdIvuF5OU8ecgh/opSBelyZfewgzW6dx7V65b4kLDKLcx8NY2PDg==
X-Received: by 2002:adf:eb4e:: with SMTP id u14mr3882960wrn.99.1611918028674; 
 Fri, 29 Jan 2021 03:00:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/46] darwin: detect CoreAudio for build
Date: Fri, 29 Jan 2021 10:59:41 +0000
Message-Id: <20210129110012.8660-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Joelle van Dyne <j@getutm.app>

On iOS there is no CoreAudio, so we should not assume Darwin always
has it.

Signed-off-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210126012457.39046-11-j@getutm.app
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 5cf075ac60e..99bf6275087 100755
--- a/configure
+++ b/configure
@@ -319,6 +319,7 @@ fdt="auto"
 netmap="no"
 sdl="auto"
 sdl_image="auto"
+coreaudio="auto"
 virtiofsd="auto"
 virtfs="auto"
 libudev="auto"
@@ -778,7 +779,7 @@ Darwin)
     QEMU_CFLAGS="-arch x86_64 $QEMU_CFLAGS"
     QEMU_LDFLAGS="-arch x86_64 $QEMU_LDFLAGS"
   fi
-  audio_drv_list="coreaudio try-sdl"
+  audio_drv_list="try-coreaudio try-sdl"
   audio_possible_drivers="coreaudio sdl"
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
@@ -3146,6 +3147,24 @@ EOF
   fi
 fi
 
+##########################################
+# detect CoreAudio
+if test "$coreaudio" != "no" ; then
+  coreaudio_libs="-framework CoreAudio"
+  cat > $TMPC << EOF
+#include <CoreAudio/CoreAudio.h>
+int main(void)
+{
+  return (int)AudioGetCurrentHostTime();
+}
+EOF
+  if compile_prog "" "$coreaudio_libs" ; then
+    coreaudio=yes
+  else
+    coreaudio=no
+  fi
+fi
+
 ##########################################
 # Sound support libraries probe
 
@@ -3202,8 +3221,20 @@ for drv in $audio_drv_list; do
     fi
     ;;
 
-    coreaudio)
+    coreaudio | try-coreaudio)
+    if test "$coreaudio" = "no"; then
+      if test "$drv" = "try-coreaudio"; then
+        audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-coreaudio//')
+      else
+        error_exit "$drv check failed" \
+                "Make sure to have the $drv is available."
+      fi
+    else
       coreaudio_libs="-framework CoreAudio"
+      if test "$drv" = "try-coreaudio"; then
+        audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-coreaudio/coreaudio/')
+      fi
+    fi
     ;;
 
     dsound)
-- 
2.20.1


