Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2B42A3A8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:52:51 +0200 (CEST)
Received: from localhost ([::1]:55766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGKw-0002XN-0g
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFig-0000Yr-HD
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:18 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFie-0007XH-41
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:18 -0400
Received: by mail-ed1-x535.google.com with SMTP id y12so66813779eda.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDfe8bmDBbBfn69RwFgCJGTvzw7OlkgziGgK1aI31l8=;
 b=fsMTZOa+G31mumxvxyTeK2ELnslQqdkYS8BEVuhg0CYeIYLbmWD4+c994rCRPZfnIB
 QlKEcH/pF2cMJGcEHYdd7r1tm11YgGyKUTdz79Lqas01jyU4IGPNqdblaqcdQ1zlC2kr
 jLW8X4tmqQUgz+nCX+R7vQ+Yf8t/p5CofF1Up/aIMZaQ1xgd9VrY4vIwklsl7bqk7Ezm
 APeOi6R/bXwuRQY8pB3q5uMPiW36Vz+rtpHKJJgSF5jm2C4JFDxqJftISP+7ah+j31xS
 6K5RE7CeXcbYOldDi+1vzkUIwGwY0mnQhXAK+GRiCz35QNGu0C0CFdOe9PWhz1CqvuH+
 RU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DDfe8bmDBbBfn69RwFgCJGTvzw7OlkgziGgK1aI31l8=;
 b=u06Px5YOXCHcn7+txYdvU5FL66XmGdfdD6nnheR36EiZa2LgyedWKq8QKmHPZQ7pPS
 XnYGxy6dxiqmuSnvTvIfb8j4bMe88XG4ibkACF01EQJkBXhENisDtw0HnIcaQPUDbrk/
 9pk01iBXbldfwnzci5qV4HjFk/m9xc8FXKzX1FPRrdjURQtBbnH9QG0Ax9AG6iyv0OMy
 5V5yXluh0YPm96EqnvUFzZVMgpvRvKYK+mYaKFAG7cVUWcd96DETcOZVP4YL+t6hl6WN
 LkcGt1tReyshZgYoOHCWHKu4EoKI6Uz1oS4VhhRLFeJj6KbrVcCoeguO4qKX7wetKRg8
 v1BA==
X-Gm-Message-State: AOAM532j7y8dwBeABZlTv+cA9MqAJXbtnyYUjQaX3fUQMp25r0uj8+q7
 9n6MR0kyALm1HgV/KxMzFWwQSccL7Qc=
X-Google-Smtp-Source: ABdhPJzmJ5bB1FULO7ksl/8Fz3oBywuRSpbANoXq/8c4ByQgXa0hxxjMSR/omfKgWuiQE/EPCCdrmw==
X-Received: by 2002:a05:6402:5209:: with SMTP id
 s9mr16459879edd.250.1634037194934; 
 Tue, 12 Oct 2021 04:13:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/24] configure,
 meson: move remaining HAVE_* compiler tests to Meson
Date: Tue, 12 Oct 2021 13:12:51 +0200
Message-Id: <20211012111302.246627-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove some special cases by moving them to Meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-8-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 37 -------------------------------------
 meson.build | 22 ++++++++++++++++++++--
 2 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/configure b/configure
index 499c84859d..52f89b05d6 100755
--- a/configure
+++ b/configure
@@ -2401,18 +2401,6 @@ else
   l2tpv3=no
 fi
 
-cat > $TMPC <<EOF
-#include <sys/mman.h>
-int main(int argc, char *argv[]) {
-    return mlockall(MCL_FUTURE);
-}
-EOF
-if compile_prog "" "" ; then
-  have_mlockall=yes
-else
-  have_mlockall=no
-fi
-
 #########################################
 # vhost interdependencies and host support
 
@@ -3840,21 +3828,6 @@ if test "$fortify_source" != "no"; then
   fi
 fi
 
-##########################################
-# check if struct fsxattr is available via linux/fs.h
-
-have_fsxattr=no
-cat > $TMPC << EOF
-#include <linux/fs.h>
-struct fsxattr foo;
-int main(void) {
-  return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    have_fsxattr=yes
-fi
-
 ##########################################
 # check for usable membarrier system call
 if test "$membarrier" = "yes"; then
@@ -4356,13 +4329,6 @@ if test "$gdbus_codegen" != "" ; then
 fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
 
-# Work around a system header bug with some kernel/XFS header
-# versions where they both try to define 'struct fsxattr':
-# xfs headers will not try to redefine structs from linux headers
-# if this macro is set.
-if test "$have_fsxattr" = "yes" ; then
-    echo "HAVE_FSXATTR=y" >> $config_host_mak
-fi
 if test "$xen" = "enabled" ; then
   echo "CONFIG_XEN_BACKEND=y" >> $config_host_mak
   echo "CONFIG_XEN_CTRL_INTERFACE_VERSION=$xen_ctrl_version" >> $config_host_mak
@@ -4567,9 +4533,6 @@ fi
 if test "$parallels" = "yes" ; then
   echo "CONFIG_PARALLELS=y" >> $config_host_mak
 fi
-if test "$have_mlockall" = "yes" ; then
-  echo "HAVE_MLOCKALL=y" >> $config_host_mak
-fi
 
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index b551080523..c712963170 100644
--- a/meson.build
+++ b/meson.build
@@ -1601,6 +1601,23 @@ config_host_data.set('CONFIG_SPLICE', cc.links(gnu_source_prefix + '''
     return 0;
   }'''))
 
+config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
+  #include <sys/mman.h>
+  int main(int argc, char *argv[]) {
+    return mlockall(MCL_FUTURE);
+  }'''))
+
+# Work around a system header bug with some kernel/XFS header
+# versions where they both try to define 'struct fsxattr':
+# xfs headers will not try to redefine structs from linux headers
+# if this macro is set.
+config_host_data.set('HAVE_FSXATTR', cc.links('''
+  #include <linux/fs.h>'
+  struct fsxattr foo;
+  int main(void) {
+    return 0;
+  }'''))
+
 # Some versions of Mac OS X incorrectly define SIZE_MAX
 config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
     #include <stdint.h>
@@ -1609,7 +1626,8 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
-ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
+ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
+    'HAVE_GDB_BIN']
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
 strings = ['CONFIG_IASL']
 foreach k, v: config_host
@@ -1624,7 +1642,7 @@ foreach k, v: config_host
     config_host_data.set('HOST_' + v.to_upper(), 1)
   elif strings.contains(k)
     config_host_data.set_quoted(k, v)
-  elif k.startswith('CONFIG_') or k.startswith('HAVE_')
+  elif k.startswith('CONFIG_')
     config_host_data.set(k, v == 'y' ? 1 : v)
   endif
 endforeach
-- 
2.31.1



