Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4866FEF72
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:55:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2xI-0001EW-3V; Thu, 11 May 2023 05:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2xC-00012C-4Q
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x8-0006oz-Sd
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQ7VsAmOnriOy8MlCL17kZUKrDMGZj4kLDBL1zV5C90=;
 b=Ds8eaNmDwEc+vY6lQiEsVVxp9/e8TYyKgiCKk+hBhBLVof5/WJ7bwU3J28vcRySWNXrsUn
 RYvdY1R9Gwtqr/+E3GjbAJyo1kW8c6NZTqOYGyQG6ObDJCtorkO9dVdeHq3rDcYQ5nq6uI
 mL0z/xPUz0B0UpMqBZ1gAx8sUHPjnp0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-TJz0NQMsOMuL4OUXQHeWOQ-1; Thu, 11 May 2023 05:51:12 -0400
X-MC-Unique: TJz0NQMsOMuL4OUXQHeWOQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50bf9e97bdbso9467945a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798671; x=1686390671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UQ7VsAmOnriOy8MlCL17kZUKrDMGZj4kLDBL1zV5C90=;
 b=C037rVJUlQlWXkkbdAm/KZB8xILfCYT7eseLPMhoiuEpOik07H6jcMRxXehNykEfgV
 b/k5wcJJtzxEvA+zuYePfXIr2Cm5IgED7PcU1cHRqWIY92NWZsacUtz6wAFlp8vpifp3
 2kQmU4G9lRCT1WbCAezUR6FrnOD79M4pjkC3Xd/dCFE4HUxCAH4BQcNCWNZUeDqOu9vm
 m2T1xd6wMuDaC1IiGsRZ2HpwlcfMBY6sy30vj9grYMFyq9yIpEeG+/XuSYiUgwiC62BD
 gY6lclza/ZSYsjNVH8imArC6XQLROPb8ea9ZwJR3+bhSDoWhdJVKJBPMVnDvIrLV86Z+
 1f0w==
X-Gm-Message-State: AC+VfDyElD97rpwA/5rZVGaTqVcXGtipcTvuXJW+6DaYbsWzGKPFO38G
 JcX7IYudakSBl5Peo/aqCgTnEchqJhxxJiAOazvYCwGLS1gzNAoRqvTCf4fSr9RuTkLxfWuJrP8
 2Kh3e2jHiD4uSY5WeQ8E5Px/2qY1JlaOsFGpbb9svpa1HszZSQn7klIUH2In+qe+tFAwyB6baAu
 o=
X-Received: by 2002:a05:6402:3456:b0:50c:cde7:285b with SMTP id
 l22-20020a056402345600b0050ccde7285bmr18605820edc.29.1683798670741; 
 Thu, 11 May 2023 02:51:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5QVmyrRlAUC3TDucwliXu2ohkMMZQIEYaSpzGNukafGx7Uylru+tw/nQI+SXpqsr0i73ojSg==
X-Received: by 2002:a05:6402:3456:b0:50c:cde7:285b with SMTP id
 l22-20020a056402345600b0050ccde7285bmr18605805edc.29.1683798670427; 
 Thu, 11 May 2023 02:51:10 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a50fe85000000b004fbf6b35a56sm2867814edt.76.2023.05.11.02.51.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:51:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/24] configure: reorder option parsing code
Date: Thu, 11 May 2023 11:50:19 +0200
Message-Id: <20230511095021.1397802-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Move some variable assignments around for clarity and to remove
one of three loops on the command line arguments.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 122 ++++++++++++++++++++++++++----------------------------
 1 file changed, 58 insertions(+), 64 deletions(-)

diff --git a/configure b/configure
index fc76082c3896..074c98e7641d 100755
--- a/configure
+++ b/configure
@@ -177,29 +177,18 @@ then
   error_exit "main directory cannot contain spaces nor colons"
 fi
 
+# parse CC options first; some compiler tests are used to establish
+# some defaults, based on the host environment
+
 # default parameters
 cpu=""
-static="no"
 cross_compile="no"
 cross_prefix=""
 host_cc="cc"
-use_containers="yes"
-gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
-gdb_arches=""
-
-if test -e "$source_path/.git"
-then
-    git_submodules_action="update"
-else
-    git_submodules_action="ignore"
-fi
-
-git_submodules="ui/keycodemapdb"
-git="git"
-
-# Don't accept a target_list environment variable.
-unset target_list
-unset target_list_exclude
+EXTRA_CFLAGS=""
+EXTRA_CXXFLAGS=""
+EXTRA_OBJCFLAGS=""
+EXTRA_LDFLAGS=""
 
 # Default value for a variable defining feature "foo".
 #  * foo="no"  feature will only be used if --enable-foo arg is given
@@ -212,50 +201,8 @@ unset target_list_exclude
 # Always add --enable-foo and --disable-foo command line args.
 # Distributions want to ensure that several features are compiled in, and it
 # is impossible without a --enable-foo that exits if a feature is not found.
-
 default_feature=""
-# parse CC options second
-for opt do
-  optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
-  case "$opt" in
-      --without-default-features)
-          default_feature="no"
-  ;;
-  esac
-done
 
-EXTRA_CFLAGS=""
-EXTRA_CXXFLAGS=""
-EXTRA_OBJCFLAGS=""
-EXTRA_LDFLAGS=""
-
-debug_tcg="no"
-docs="auto"
-EXESUF=""
-prefix="/usr/local"
-qemu_suffix="qemu"
-softmmu="yes"
-linux_user=""
-bsd_user=""
-pie=""
-plugins="$default_feature"
-meson=""
-ninja=""
-bindir="bin"
-skip_meson=no
-vfio_user_server="disabled"
-
-# The following Meson options are handled manually (still they
-# are included in the automatically generated help message)
-
-# 1. Track which submodules are needed
-fdt="auto"
-
-# 2. Automatically enable/disable other options
-tcg="auto"
-cfi="false"
-
-# parse CC options second
 for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
@@ -294,9 +241,60 @@ for opt do
   --cross-prefix-*) cc_arch=${opt#--cross-prefix-}; cc_arch=${cc_arch%%=*}
                     eval "cross_prefix_${cc_arch}=\$optarg"
   ;;
+  --without-default-features) default_feature="no"
+  ;;
   esac
 done
 
+
+if test -e "$source_path/.git"
+then
+    git_submodules_action="update"
+else
+    git_submodules_action="ignore"
+fi
+
+git_submodules="ui/keycodemapdb"
+git="git"
+debug_tcg="no"
+docs="auto"
+EXESUF=""
+prefix="/usr/local"
+qemu_suffix="qemu"
+softmmu="yes"
+linux_user=""
+bsd_user=""
+plugins="$default_feature"
+ninja=""
+python=
+pypi="enabled"
+bindir="bin"
+skip_meson=no
+vfio_user_server="disabled"
+use_containers="yes"
+gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
+gdb_arches=""
+werror=""
+
+# Don't accept a target_list environment variable.
+unset target_list
+unset target_list_exclude
+
+# The following Meson options are handled manually (still they
+# are included in the automatically generated help message)
+
+# 1. Track which submodules are needed
+fdt="auto"
+
+# 2. Automatically enable/disable other options
+tcg="auto"
+cfi="false"
+
+# 3. Need to check for -static-pie before Meson runs.  Also,
+# Meson has PIE as a boolean rather than enabled/disabled/auto.
+pie=""
+static="no"
+
 # Preferred compiler:
 #  ${CC} (if set)
 #  ${cross_prefix}gcc (if cross-prefix specified)
@@ -537,8 +535,6 @@ check_py_version() {
     "$1" -c 'import sys; sys.exit(sys.version_info < (3,7))'
 }
 
-python=
-pypi="enabled"
 first_python=
 if test -z "${PYTHON}"; then
     # A bare 'python' is traditionally python 2.x, but some distros
@@ -585,8 +581,6 @@ if test "$mingw32" = "yes" ; then
   qemu_suffix=""
 fi
 
-werror=""
-
 meson_option_build_array() {
   printf '['
   (if test "$targetos" = windows; then
-- 
2.40.1


