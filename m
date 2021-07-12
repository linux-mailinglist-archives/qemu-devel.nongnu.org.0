Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA1C3C5FF1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:58:50 +0200 (CEST)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2yKX-0007lF-89
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2yJ9-0005au-EP
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:57:23 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2yJ7-0005c1-1A
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:57:22 -0400
Received: by mail-ed1-x52b.google.com with SMTP id l26so20413531eda.10
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zDAJ3AUAWV14jHZU6jgRbyE693LSkFWsPzEstYbo31k=;
 b=YUAaWPYAXgLyhRTWVLWB1DnKf9jEN7GCiUDfWPz83GgqOq6TfZxqNAeYCdjunG88QF
 nOplaWBFbFFHjaDn12N1lHRUzPYAjCd7dewm1nvNV/7/kxg6G47mAL2FV3CtNq8WOS3a
 CM0UItGxnJCcUrzKTLVNpgEV0p9QtV24ziVWRnCWU7CqkDbi9H1/OvBdVOvMYVosNenC
 T2ekWUs8ihae5EQD3RnQp2ro6sUDPy/tfbZ2Rppl/Ws5kSuuXCERsNTiF8Zos0mXkwq0
 MGKH4ZFXjWO90cccCTY6WuzG1jb+s4zbROVSaz1wPuu3j0fvx059Rd6FhJYG5bjCRCwe
 r2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zDAJ3AUAWV14jHZU6jgRbyE693LSkFWsPzEstYbo31k=;
 b=jb/mRsdQLBrjJTaymUGWWodby//aNeU1/K+RDMRVr4CZQUKyL2RDEChdKx++o+z0IB
 /PZ+VnAaRjpL8kF2eI6gGrTtLfeH6Zo5Jb+B87v1UwteiKalPzdPug93Aq+rZ6szvV8N
 /UQDEdzu+2brH1d/pARsDOKEGM/iiklc6GoROvCj1e272/SRGeSdcIG1jWN2TsPJs5mO
 l9JcVh6AV1xe/EacpmJrabzu/UHssAXIjhMKztVaskJ1n+E5fFzVWGBLVOmxzO5sGBw6
 4ZB4+kvK8jf4gcrnwxQCLfrSk6NBg9en49gwFCtvR324HOhMXI2JHckT8+hVbc7YYG0q
 FMjQ==
X-Gm-Message-State: AOAM532ng88CO5/Qa5nT6aV6qRMc9t/6Nyd+0AaWxA5ggtUUZjpoJF2H
 tthpVne40mPK4944yJmghPVhau9WhYY=
X-Google-Smtp-Source: ABdhPJywyY3WA9pEcMIaMJh9RcyNHtkvOkgp/p3gbd9N4pOJrM1+yLearDEZMDLG9DmgVOo77I+3oA==
X-Received: by 2002:a05:6402:b79:: with SMTP id
 cb25mr65447075edb.164.1626105439516; 
 Mon, 12 Jul 2021 08:57:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k14sm8331316edq.79.2021.07.12.08.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:57:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] trace, lttng: require .pc files
Date: Mon, 12 Jul 2021 17:57:10 +0200
Message-Id: <20210712155710.520889-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next version of lttng-libs will not require liburcu at run time anymore.
Therefore, it is expected that distros will not include the urcubp libraries
anymore when installing lttng-ust-devel.

To avoid future problems, just require pkg-config to detect lttng-ust.
The .pc files for lttng-ust correctly include liburcubp.a for static
builds, and have always done since pkg-config files were added in 2011.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 18 ++----------------
 meson.build       |  4 ----
 trace/meson.build |  2 +-
 3 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/configure b/configure
index 85db248ac1..4d0a2bfdd8 100755
--- a/configure
+++ b/configure
@@ -3606,21 +3606,8 @@ fi
 ##########################################
 # For 'ust' backend, test if ust headers are present
 if have_backend "ust"; then
-  cat > $TMPC << EOF
-#include <lttng/tracepoint.h>
-int main(void) { return 0; }
-EOF
-  if compile_prog "" "-Wl,--no-as-needed -ldl" ; then
-    if $pkg_config lttng-ust --exists; then
-      lttng_ust_libs=$($pkg_config --libs lttng-ust)
-    else
-      lttng_ust_libs="-llttng-ust -ldl"
-    fi
-    if $pkg_config liburcu-bp --exists; then
-      urcu_bp_libs=$($pkg_config --libs liburcu-bp)
-    else
-      urcu_bp_libs="-lurcu-bp"
-    fi
+  if $pkg_config lttng-ust --exists; then
+    lttng_ust_libs=$($pkg_config --libs lttng-ust)
   else
     error_exit "Trace backend 'ust' missing lttng-ust header files"
   fi
@@ -4773,7 +4760,6 @@ fi
 if have_backend "ust"; then
   echo "CONFIG_TRACE_UST=y" >> $config_host_mak
   echo "LTTNG_UST_LIBS=$lttng_ust_libs" >> $config_host_mak
-  echo "URCU_BP_LIBS=$urcu_bp_libs" >> $config_host_mak
 fi
 if have_backend "dtrace"; then
   echo "CONFIG_TRACE_DTRACE=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 6b4b7bfb48..def209a287 100644
--- a/meson.build
+++ b/meson.build
@@ -323,10 +323,6 @@ lttng = not_found
 if 'CONFIG_TRACE_UST' in config_host
   lttng = declare_dependency(link_args: config_host['LTTNG_UST_LIBS'].split())
 endif
-urcubp = not_found
-if 'CONFIG_TRACE_UST' in config_host
-  urcubp = declare_dependency(link_args: config_host['URCU_BP_LIBS'].split())
-endif
 pixman = not_found
 if have_system or have_tools
   pixman = dependency('pixman-1', required: have_system, version:'>=0.21.8',
diff --git a/trace/meson.build b/trace/meson.build
index 08f83a15c3..ef18f11d64 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -26,7 +26,7 @@ foreach dir : [ '.' ] + trace_events_subdirs
                                 input: trace_events_file,
                                 command: [ tracetool, group, '--format=ust-events-h', '@INPUT@', '@OUTPUT@' ],
                                 depend_files: tracetool_depends)
-    trace_ss.add(trace_ust_h, lttng, urcubp)
+    trace_ss.add(trace_ust_h, lttng)
     genh += trace_ust_h
   endif
   trace_ss.add(trace_h, trace_c)
-- 
2.31.1


