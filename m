Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C05508CF6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:14:21 +0200 (CEST)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCyC-0003mV-0m
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLy-00020F-DR
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:50 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLw-0000zw-NC
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:50 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x18so2829383wrc.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eN2PNaIJxUfg9ceUBiK92oB3fGuFQedFi7c0jPCnfIc=;
 b=maadqJpuYm6X+pncmMoPZK4yF9G8LUeSF5Rg+5BOEfw35TnNEn3qClCIs0r8PVMT/T
 tUayYds9nMghjeTo7EHQgB5W6QK9p6ghwTn953ACXRKrtagpBqQo+P08WEzWXpUgt3/r
 k9TFgX7TP8VsvmsUrZCalpwOnk/uWJNere/RVgTuIPGi9TZSfYadev06IaywxwhOK9Ew
 YNyiShVVOR5ssji1DgH1M4/P15w2PVbUZVTPdpQ697JSGhodjTTtJ4xLMLDRisjfy/tr
 BOZCvDHoJeV1kdiygvZs+A9k0ypV7k48PsLRcYGCabwqWhhyIxfWCyspDs9xVdQ0E+b0
 jKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eN2PNaIJxUfg9ceUBiK92oB3fGuFQedFi7c0jPCnfIc=;
 b=H+CwyBX97DHb164KVv0blxqjjXc2gwzxJvRTedBRPqW3ujlNFeuchAVCIdU3PNWbQW
 Sq1QwKnwqd9fgqv1GT2drmMjv4xR3WB2G/5fkbS0+tV1lhP+kqZABDn6pqttQnTyiLLD
 9Jd6DRLqip6OwDVV61l2P36fR3DJrR2BpgCdERE05uKM/j/mbiqxZmVwMyBjAWiIR2zU
 eQB4JAAyX8pLrF9jwiH2OkwBNYtFwyxkW0+Hf0XTAfT1YDRnxmwHqwjzVl5+qcTrTSlT
 GHLOLlu3hEWtBgu9JPJePvUKNglLFO/oNzYuD9avc50bRJZLydzinmi/KMHiQ7BUD/Ky
 B9Og==
X-Gm-Message-State: AOAM531+btBBOr+szuRbB10Ly/2hxX5hfrck7FWpqhU5QFfWJYkIy3rk
 s5IJZznMpuYqWvENxPGpFGYG3PmT6oDWDw==
X-Google-Smtp-Source: ABdhPJwG49+y/UqLW3fcarI0FXq86H9YqjGn32mj9o0KHt2qrG+OALdcMn8SIM2zWHidgTbjPjltYw==
X-Received: by 2002:adf:f046:0:b0:207:a457:5e52 with SMTP id
 t6-20020adff046000000b00207a4575e52mr15932476wro.708.1650468887393; 
 Wed, 20 Apr 2022 08:34:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/34] configure: omit options with default values from meson
 command line
Date: Wed, 20 Apr 2022 17:33:59 +0200
Message-Id: <20220420153407.73926-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has no functional change, it only makes the command line shorter
and nicer.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 29 +++++++++++++++++------------
 meson.build       |  2 +-
 meson_options.txt |  2 +-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/configure b/configure
index 4997983b5d..61b5acae10 100755
--- a/configure
+++ b/configure
@@ -2349,19 +2349,24 @@ if test "$skip_meson" = no; then
   mv $cross config-meson.cross
 
   rm -rf meson-private meson-info meson-logs
+
+  # Built-in options
+  test "$bindir" != "bin" && meson_option_add "-Dbindir=$bindir"
+  test "$default_feature" = no && meson_option_add -Dauto_features=disabled
+  test "$pie" = no && meson_option_add -Db_pie=false
+  test "$werror" = yes && meson_option_add -Dwerror=true
+
+  # QEMU options
+  test "$capstone" != auto && meson_option_add "-Dcapstone=$capstone"
+  test "$cfi" != false && meson_option_add "-Dcfi=$cfi"
+  test "$fdt" != auto && meson_option_add "-Dfdt=$fdt"
+  test -n "${LIB_FUZZING_ENGINE+xxx}" && meson_option_add "-Dfuzzing_engine=$LIB_FUZZING_ENGINE"
+  test "$qemu_suffix" != qemu && meson_option_add "-Dqemu_suffix=$qemu_suffix"
+  test "$slirp" != auto && meson_option_add "-Dslirp=$slirp"
+  test "$smbd" != '' && meson_option_add "-Dsmbd=$smbd"
+  test "$tcg" != enabled && meson_option_add "-Dtcg=$tcg"
   run_meson() {
-    NINJA=$ninja $meson setup \
-        --prefix "$prefix" \
-        --bindir "$bindir" \
-        -Dqemu_suffix="$qemu_suffix" \
-        -Dsmbd="$smbd" \
-        -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
-        -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
-        -Dcfi=$cfi -Dtcg=$tcg \
-        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
-        $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
-        $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
-        "$@" $cross_arg "$PWD" "$source_path"
+    NINJA=$ninja $meson setup --prefix "$prefix" "$@" $cross_arg "$PWD" "$source_path"
   }
   eval run_meson $meson_options
   if test "$?" -ne 0 ; then
diff --git a/meson.build b/meson.build
index 60e8c302e6..ff5c076805 100644
--- a/meson.build
+++ b/meson.build
@@ -1,6 +1,6 @@
 project('qemu', ['c'], meson_version: '>=0.59.3',
         default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
-                          'b_staticpic=false', 'stdsplit=false', 'optimization=2'],
+                          'b_staticpic=false', 'stdsplit=false', 'optimization=2', 'b_pie=true'],
         version: files('VERSION'))
 
 add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
diff --git a/meson_options.txt b/meson_options.txt
index a76fadbd7d..8efd5f520c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -78,7 +78,7 @@ option('xen', type: 'feature', value: 'auto',
        description: 'Xen backend support')
 option('xen_pci_passthrough', type: 'feature', value: 'auto',
        description: 'Xen PCI passthrough support')
-option('tcg', type: 'feature', value: 'auto',
+option('tcg', type: 'feature', value: 'enabled',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
        description: 'TCG with bytecode interpreter (slow)')
-- 
2.35.1



