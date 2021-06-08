Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7432139F510
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:35:39 +0200 (CEST)
Received: from localhost ([::1]:40260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqa1B-0006SF-Sk
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpL-0006lv-8g
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:23 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpI-00084D-VU
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:22 -0400
Received: by mail-wm1-x333.google.com with SMTP id f17so1604981wmf.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NFLOcSjovIsq0rrJu+JQcv0N5noAupJu88dEwIvRBvs=;
 b=k7lwZJxT+tGDa0Kp5wJ2ioyIX3cNdBXbn7Nk6/MFhDZyRrASb0uYwJVRRtOIT3MTKy
 +2EeFALgP79J7rHV82HybsH3k1ixkw4KqZiKVREXQzSoLGcWw1ro8X8vdGHpDuGWFnKr
 GhpPlYUUusk60/+GDZFT41o3w4sSbTIyPeM1iQhZ5IqJh7UhD4VTsxLK6ME/aV7qj82o
 muMZ4PFPclOcZTb+mhsmXpR49LG0RdxkVuwQAFhTkVQ8hqz3xsUrLytTVCYAn7U1n4rh
 dP0MCbXWX/Naom38SpecWwdSs25LO384t/XO1HLR1d1lixSEKsi/Yf66FiuZat00gEC6
 8Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NFLOcSjovIsq0rrJu+JQcv0N5noAupJu88dEwIvRBvs=;
 b=dyGPCV5SMvzIspdQvMpwWP0Osoi3qeHBVifrlN7iIbI49UNzxHz0DHXlOFSGCPEhwR
 3+7hbKYUYm5ctOBav8ezClTvok4Nv2af0m3x9ZoJ6t6ALGKWQsgeN/7aVb6FLdBEKCKs
 ozSe6Jy5xHEmRS4fuBazDLHO6pe/b0qPzDci9lmxJ6tx5ZmbwZA7kNPcH2GOtQs2JFRz
 NrqtTB6sKtcHKAHCCWBuosK9APR6Es6wwkyS3fxajjAbPh1QzfIopcYEf8VN+CygrZjz
 oOgxFk7mlLuQKRY+QJCu66xLnsjQMowbWtHG9EWyqgzlaRjQLHWWH3kbcNb06QKRglyg
 0QWQ==
X-Gm-Message-State: AOAM533iMMB6g/tOpBvrJQJB9nvAmoPA381c/nBeZIqhN6fe+M1JTIha
 tzRjetuC6umAYrHQCLrulj3oW/wNWIussA==
X-Google-Smtp-Source: ABdhPJxAofrY7Ll0s4AavDjEgeIh+vE8iQbv2Vc2tsNIXJ025g/lQPnvmLLqyvHkSrTaBh7WDJvxdQ==
X-Received: by 2002:a1c:9a45:: with SMTP id c66mr16649376wme.43.1623151399243; 
 Tue, 08 Jun 2021 04:23:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/26] configure: convert HAVE_BROKEN_SIZE_MAX to meson
Date: Tue,  8 Jun 2021 13:22:53 +0200
Message-Id: <20210608112301.402434-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 17 -----------------
 meson.build |  9 +++++++++
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index c95259435f..e11174f810 100755
--- a/configure
+++ b/configure
@@ -2375,20 +2375,6 @@ if test "$softmmu" = "no"; then
     audio_drv_list=""
 fi
 
-##########################################
-# Some versions of Mac OS X incorrectly define SIZE_MAX
-cat > $TMPC << EOF
-#include <stdint.h>
-#include <stdio.h>
-int main(int argc, char *argv[]) {
-    return printf("%zu", SIZE_MAX);
-}
-EOF
-have_broken_size_max=no
-if ! compile_object -Werror ; then
-    have_broken_size_max=yes
-fi
-
 ##########################################
 # L2TPV3 probe
 
@@ -5358,9 +5344,6 @@ if test "$gdbus_codegen" != "" ; then
     echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
 fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
-if test "$have_broken_size_max" = "yes" ; then
-    echo "HAVE_BROKEN_SIZE_MAX=y" >> $config_host_mak
-fi
 if test "$have_openpty" = "yes" ; then
     echo "HAVE_OPENPTY=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 3be3ef0982..2a19f6c1bd 100644
--- a/meson.build
+++ b/meson.build
@@ -1270,6 +1270,15 @@ config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 
+# Some versions of Mac OS X incorrectly define SIZE_MAX
+config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
+    #include <stdint.h>
+    #include <stdio.h>
+    int main(int argc, char *argv[]) {
+        return printf("%zu", SIZE_MAX);
+    }''', args: ['-Werror']))
+
+
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
 strings = ['HOST_DSOSUF', 'CONFIG_IASL']
-- 
2.31.1



