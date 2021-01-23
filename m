Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78DB30132B
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 06:03:11 +0100 (CET)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3B4o-00070p-Sl
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 00:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Ayh-0006zc-OG
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:52 -0500
Received: from mail-pl1-f170.google.com ([209.85.214.170]:44411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Ayf-0005sq-PK
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:51 -0500
Received: by mail-pl1-f170.google.com with SMTP id r4so4423774pls.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 20:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZuNtUUuWJqekvxHjRaYPevC4YtgExki/9b72IU/Xt8A=;
 b=sgIal8pO0h93xfoTEx9y0ewNvXVjn9MGD3Agp0faCwPfP7/PLu2C8VXTcyItsDvw+h
 Ed55+ssTRDqTaVW09fopZa3JqTY/8qQRxxCCHvcmaP2ZRaD5oBbx3oz64zABft6kqN4M
 vqcndhGWckeA/0U94i/dKCMZdJfvXc9YjzE6rRIMaoSyXaDyQhUFu5azNgL4IxyH9ZRd
 FmLRfH7MjbZx0Y11UNvIoWE65G4vPwaowLPDM+HNINtxxQzqka5EiADexXnenxJhl7qf
 c3dFAUPSInt3lro4PZA6vhjy9eNqKqzKzN5WapRbaXtzL38NkCbRhcgfum4DMBnqvj2O
 LUuA==
X-Gm-Message-State: AOAM530w8vnVRCFfaEm+6TpPewYoyLLMjBIMNRJrUio7ZUDph17bN/CF
 ssEZl0h9143Tv27s5aOpiSJdMlw5/h4=
X-Google-Smtp-Source: ABdhPJzZRUhwZylnjFiAwpQk0BvbdmjqulMndOhTx/sqtLPylmLkeUSCYRSVmhvCfl1vMpQ3PAeFAg==
X-Received: by 2002:a17:902:d20e:b029:df:de2c:58f1 with SMTP id
 t14-20020a170902d20eb02900dfde2c58f1mr5895183ply.46.1611377808311; 
 Fri, 22 Jan 2021 20:56:48 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.229])
 by smtp.gmail.com with ESMTPSA id c62sm9872772pfa.116.2021.01.22.20.56.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 20:56:47 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/11] darwin: detect CoreAudio for build
Date: Fri, 22 Jan 2021 20:56:31 -0800
Message-Id: <20210123045632.18482-11-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210123045632.18482-1-j@getutm.app>
References: <20210123045632.18482-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.170;
 envelope-from=osy86github@gmail.com; helo=mail-pl1-f170.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
index b8ae4609fd..70061e195d 100755
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


