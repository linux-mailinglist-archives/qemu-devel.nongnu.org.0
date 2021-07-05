Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC313BC16F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:12:27 +0200 (CEST)
Received: from localhost ([::1]:47982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RCr-0001yG-CG
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1L-0001LM-35
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:31 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1J-0003dq-Ds
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:30 -0400
Received: by mail-wr1-x432.google.com with SMTP id i8so22713701wrc.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7IOWB9L8C5ZVMJR0h6DK/2DFyq1pG83qdF6FgW1CUf0=;
 b=AOHMSYtRJpZrlu2PsiFlhQPPAxVLfxqg0ykkiv6cTouT8PoOYu0qcF7Jdu8VTjucIF
 OP5k6qZnEDL0rusI/3lZk/o/QRBNiAi9mJgw+yD11R8Gb539oy+S6tx8iTMqDrtPn4bC
 6JPRK3WDVqnFysIcp02HKS5AQvfsuw5UTk9PEfIlwGmWqxV190nDEIlFYUlweMzagv32
 oEFa3nkFfW7/FxdSyo9iQpQFzmzxqV9FNUs4D4V08jZhE/fbb6St09V314wH8xSuYSKr
 Dbo4c7FO1SndWqKPgX+lGN8Nsp4t/GctqBAcvTwkNo0E6EfGgdqU9eb50sXrt5TlZE0s
 ABBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7IOWB9L8C5ZVMJR0h6DK/2DFyq1pG83qdF6FgW1CUf0=;
 b=Yl1VllZUAPtbf99tRJI/bTp+eVVot9DOYbjFsb9P8pnspES8ho3ReNj++d/mKDP8hn
 AW+ptvItIT94E8TuhHApyB/8WLqv7Nen6efRV92Lzjto447ROw4krdFL0zV1YBIx8tb7
 SppgQFokcTJOKH9Xq51NUow021wF+7tHlZbMh4wnLvCjjAkx0BHMwvRop4JaXfLUbZb6
 khMcvww5UI8p4Xy5gUHcg7C3zJragt9WtYZ0CDycnAYbC+OaIgFq29dqQtx1auyi5Dh0
 Ae+MxOLKBoICldUsHhzc8SZioCf8u5biWA/8XKCg88pqZQHNgqXD8/zJO1IQ7xlYMHgS
 kfzg==
X-Gm-Message-State: AOAM533S/uy4Du3LfWGqsqRk4Tb6Sgw7+A7pBF/ekrsZ/zoTQSeAIpQt
 eOobr5BmmAQZ1CA0x8buD88NodaFGtQ=
X-Google-Smtp-Source: ABdhPJy0qzXRsjmK7rNmtrqlf/NW01k5ciTSj5tUN2SCr64BiiKxnJ/erTgDmL6QqwkkO8tznb/hKw==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr17062870wrv.250.1625500828087; 
 Mon, 05 Jul 2021 09:00:28 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/17] configure: convert HAVE_BROKEN_SIZE_MAX to meson
Date: Mon,  5 Jul 2021 18:00:12 +0200
Message-Id: <20210705160018.241397-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
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



