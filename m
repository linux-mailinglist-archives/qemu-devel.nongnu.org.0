Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248664253F3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:23:58 +0200 (CEST)
Received: from localhost ([::1]:35086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTNN-0004aN-51
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8Z-0005QH-BF
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:40 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8X-0007lV-Co
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:39 -0400
Received: by mail-ed1-x534.google.com with SMTP id p13so23377053edw.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRyXlyE5klILFYU5zwXVDOYm1mI+FCWCDaKsZd6MCNU=;
 b=IGGGSuXID1ie3aQRRZDWloEn636nY7dtkCqazXoqTBcP6qq6eGXWgv8Ty7YcsBoK3i
 ZZdbYF6aVRQ0fva+5e5RGtSWLt946kCJaiGfiEQuQUdC++pnhyYs+LIH7CRC2IoCjwnr
 cgMDqBbNKiEQHnbbOn0fTHtCxDiVM6bJei7iWkUlICWCx/t9X40cHcIEMy0UumJwQOj6
 jRYS8OLpLiPAdlWFalkGd/6odxtvOr01r8waFFUMC7ic/RDpTCfbdiKGm3pP0AOrqYoy
 3GsfNRZonC05GVlRthz7LwWtYeKrcYKSlyFgiSLt7I3MN0GuvoCu1qwGUJuvuhEuFZSy
 iUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xRyXlyE5klILFYU5zwXVDOYm1mI+FCWCDaKsZd6MCNU=;
 b=oWvrW/CHR8l5+3m4dyovjz+OXQ3ADBWwhLne0cu9iOCDvzLFDRnWr/DjxzOKXq5U9q
 ndMYkHiic3lzzPS44q5k3O0LoHDBFbsvVHA25kOTzMDBQSzcIZmysmcZvjxWEZBJiXAI
 5BVnrsao+G5NTSwob8kGq0UAsI3h7rJVj5xjz1/anou/Lyhp4nnDdZMEgZRgb4jCNc+8
 BmB+bf7Klh8aAsoPXn7atVcv0heT8l/qqHLPAaZ9nYl8j1wL6qtzSTS3N+E4Wpp92gwv
 4fpz9R5L9orKLBgaTfoSLQVKNuizYQ/1UhEKg3WHiUqm0iwKVPwTDNZ468YTwNHBDCmk
 3hzw==
X-Gm-Message-State: AOAM532/xq9OY9ucN+YJyZPgxs38RcNiOzRT8meay509y8f5pxfgUFWZ
 lzZ785k874UPBZFR69vlXOX8yw5j+M8=
X-Google-Smtp-Source: ABdhPJypDuSsS+wTUcKRp5qABHdhI2yaH/TVnOXyoNBepJrpYSznMTyrzeuh2zjTm3Ccr6eFbyl+OQ==
X-Received: by 2002:aa7:dbd2:: with SMTP id v18mr6241495edt.315.1633612115739; 
 Thu, 07 Oct 2021 06:08:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/24] configure,
 meson: move remaining HAVE_* compiler tests to Meson
Date: Thu,  7 Oct 2021 15:08:18 +0200
Message-Id: <20211007130829.632254-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove some special cases by moving them to Meson.

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
index 2962c24eb5..935a20c198 100644
--- a/meson.build
+++ b/meson.build
@@ -1604,6 +1604,23 @@ config_host_data.set('CONFIG_SPLICE', cc.links(gnu_source_prefix + '''
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
@@ -1612,7 +1629,8 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
-ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
+ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
+    'HAVE_GDB_BIN']
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
 strings = ['CONFIG_IASL']
 foreach k, v: config_host
@@ -1627,7 +1645,7 @@ foreach k, v: config_host
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



