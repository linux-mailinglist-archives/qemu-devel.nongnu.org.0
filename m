Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAA3303150
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 02:33:44 +0100 (CET)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DEl-0002ks-MB
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 20:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6X-0005f5-7h
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:22 -0500
Received: from mail-pg1-f171.google.com ([209.85.215.171]:36157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6V-0006B1-2Z
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:12 -0500
Received: by mail-pg1-f171.google.com with SMTP id c132so10189459pga.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 17:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgHwr+XWD/Cd3L80cQ4A0uAggOcUqWGoJtisPtR4O0c=;
 b=rfGnKTOqMXxQQWc/9Tte6vLT1D9n9/BsGEV32vaO+qbuzarqjVbaJnNVXO1kQfPUoX
 QebKY9HuTq2XV02Al6obDMCCLWPDGabSkn6M6Tem7yBjN6KkfYsjN1S5N7fsr1gDvn6C
 sa0faL4ilek/zNspqOdwxXCsoGUxFNiednJfA//vVwsOZp0HbJ6KeFj8md9QAwGjtx9i
 Wr5hmSJCQ3B/gyqU4dEqGD1x66PfuhqTHYBvGAwJY5Max8MtNrZJzijMdg2muhz3kKye
 EUJfi2ZszTWGVx0FFWgiZ/mkSsGBO5DIWeMXDX7fObDw7P8R+GNrUo6bu3oRoQ7GbFLq
 dzGg==
X-Gm-Message-State: AOAM533bwIU6K+zf6I3CqMqnafRCN/N4vSzII4t56hBAHQcF680Slkr7
 S+hOOGDf9DVdwIdWIcCh05zVbRVyxeE=
X-Google-Smtp-Source: ABdhPJzCeBDu8AeicKtmEGN5VZygwjeATZZQ3fCFvDG9uSi6LeI+DN6cB84q+/ZdkNRxoUIhFfMJpw==
X-Received: by 2002:aa7:9d84:0:b029:1bc:cebe:a15b with SMTP id
 f4-20020aa79d840000b02901bccebea15bmr2960367pfq.57.1611624309593; 
 Mon, 25 Jan 2021 17:25:09 -0800 (PST)
Received: from Yifans-Mac-Mini.hsd1.ca.comcast.net. ([98.35.5.7])
 by smtp.gmail.com with ESMTPSA id o14sm536921pjf.12.2021.01.25.17.25.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 17:25:09 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 10/11] darwin: detect CoreAudio for build
Date: Mon, 25 Jan 2021 17:24:56 -0800
Message-Id: <20210126012457.39046-11-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126012457.39046-1-j@getutm.app>
References: <20210126012457.39046-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.171;
 envelope-from=osy86github@gmail.com; helo=mail-pg1-f171.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On iOS there is no CoreAudio, so we should not assume Darwin always
has it.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index fddd11fed9..89836f8692 100755
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
@@ -779,7 +780,7 @@ Darwin)
     QEMU_CFLAGS="-arch x86_64 $QEMU_CFLAGS"
     QEMU_LDFLAGS="-arch x86_64 $QEMU_LDFLAGS"
   fi
-  audio_drv_list="coreaudio try-sdl"
+  audio_drv_list="try-coreaudio try-sdl"
   audio_possible_drivers="coreaudio sdl"
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
@@ -3162,6 +3163,24 @@ EOF
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
 
@@ -3218,8 +3237,20 @@ for drv in $audio_drv_list; do
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
2.28.0


