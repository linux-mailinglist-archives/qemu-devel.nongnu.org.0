Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB103BC9F0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:30:15 +0200 (CEST)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iLF-0004VY-Vk
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htz-000174-8l
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:03 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htx-0002OO-8Q
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:02 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a13so25330207wrf.10
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7IOWB9L8C5ZVMJR0h6DK/2DFyq1pG83qdF6FgW1CUf0=;
 b=F1tO58RdujAJ/wZ0ui9BzZfhXGbx7eqak1I8n2Nj2ynYB8U9q/lFMfeQkO7+hZ7Npf
 Vmm/stR+nQMMkDz+5O3JM5Qtt4d5OzZjYOMUPaCTBLHqMMZmvYMKKemzqtPES0StjR66
 97yM0KlGoeWMIqauFAb3NBeKtJuu0zWDh8ZmmwxOWJslKEqRLlwx4gh+Lru58xgLs24k
 PuxU3quKUXzDVysNTuYVVBN23RYgdwRPufUeSmqYeMWf9EEj9IqPR0EJ138VkmqT+AjE
 Nap0SLHW4rEptmKO4lNnZkz7BSx0W+N3Ag5e1To4l5HsH8xOX3SIN9+Guz8IW87YbmO9
 N3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7IOWB9L8C5ZVMJR0h6DK/2DFyq1pG83qdF6FgW1CUf0=;
 b=EeMVHZHDaurWYdtIl9nzGNJZa4bNhUM8LhPBGxSb3mYOyo3UEKl6ua5NlgQhUpoTeX
 wwcB9kQRXGYAPjDrko5IZSW720m1uvwnAnQEODn/15jD/qhHt9RTvmZFwZcp2QEfdorM
 K/9o0BmZ96ueYrYB/q3lNcDPYVTqW1Hfn3lApTj+lhjqn/cBt8Aeh9M5qJNCJ6J6yzIy
 fq6u4d45FWjUuqlh8cn8V5wk5JIVGpFWYKM2DyBXR04B0w70iIwSKOo/4ztowV/Gli9r
 IhR5NSpOcOJKkfNBJ2JObg86ASqGxWUWBdHG8Kc+2XihAwTMlX40sT+HuYgRoaVgrHet
 L2Ow==
X-Gm-Message-State: AOAM531j7Xs1O48Frx9hWExRkWDM9ptx1eC8gjn8fmotwDRwsAihYzM9
 SPV3bW9WBPUgZ1iHFsi254lDaLXpf3Y=
X-Google-Smtp-Source: ABdhPJxT/uP5/FzXjQuiFwzQe7mNZ9Zzo37Vx/IjDVBKpcrKMnD5eaoPGdh4yr16q6x6XNnnvMF2cg==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr20232278wrv.423.1625565719809; 
 Tue, 06 Jul 2021 03:01:59 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/40] configure: convert HAVE_BROKEN_SIZE_MAX to meson
Date: Tue,  6 Jul 2021 12:01:27 +0200
Message-Id: <20210706100141.303960-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 17 -----------------
 meson.build |  9 +++++++++
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index a524104120..98d6068941 100755
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
 
@@ -5360,9 +5346,6 @@ if test "$gdbus_codegen" != "" ; then
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
index b5dcc3d70e..79b5834266 100644
--- a/meson.build
+++ b/meson.build
@@ -1268,6 +1268,15 @@ config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
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



