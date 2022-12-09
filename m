Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDFE6481E8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:43:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bXj-0006TJ-JW; Fri, 09 Dec 2022 06:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVy-0004X5-1h
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVp-0001Oa-Sx
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKffBOnQ3NCwm5mK91PnkEuN7WOMVA1WCIp8ukU17gM=;
 b=Mwr5Om6wZ8h4/NPh8NaoBmM9qyhyUV8LTR2yg46DuhJxU/VjrDsvw0guAgn5/BJ6fdCdXU
 gUQPnhnKgWVdii+mfFCenyXs5i0QVZp63D7411y1whtdTqtw6IsjSvjxewLdhlNH6t1ulv
 5JR1TS6ou79o1QvGHIOqj9xRlNJEmKs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-o6wO_WBFO5C9rMUXTzUXPw-1; Fri, 09 Dec 2022 06:25:21 -0500
X-MC-Unique: o6wO_WBFO5C9rMUXTzUXPw-1
Received: by mail-ej1-f71.google.com with SMTP id
 qw20-20020a1709066a1400b007af13652c92so2951867ejc.20
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OKffBOnQ3NCwm5mK91PnkEuN7WOMVA1WCIp8ukU17gM=;
 b=mIPeBbPaEy8rE8mT4Po+4WLYRsNsTv4OF57EqUJrIcE4XcvwhthkJWRUgyFn2JyjNV
 xm4ZXekFq1N/8BbqamUKKJhNKMnFxzDowgLulATd0EhQF/qiz7GmZ8FTvg/N+Iuz6TYT
 Om/ezCz4ws6Dk3/Z/0sXnEpqAkPiU960/RM2TxgWqAqJGz66ART7SGSnLP5VsnkwpYuX
 X0fJc48Xbl84ZFeV84G2DKk9MC2TQwgLsBqVwiurmf90gtWEDAFSttOBQG4L41Y6ewya
 Io7mvhSpwjp7hvAKppBDAvN6HG+HL0XKcYq+s2YKdP8pJ4LaLylLFbYyO5mE4d9ibj/b
 X+QQ==
X-Gm-Message-State: ANoB5pnmT1nv8AL+VObAWrjoUP0eMIaH87xje+Io/Vbc0UW1rRDymdRU
 4FQFzmYHPYxcKHHgdpxlb9ikNE7Sg37dvsK9mykjmww3Rh7CqRxnTbq7nC/qtX+NK9V6ekg0GMt
 nUSE4ELApRZVjJxQCEPX30MI0jjFfwkxxbzhIhFcMJ03btLJW3wjHECbY4cS+J+t50bA=
X-Received: by 2002:a17:906:9d9f:b0:7c0:f90e:e5b6 with SMTP id
 fq31-20020a1709069d9f00b007c0f90ee5b6mr3738652ejc.31.1670585120464; 
 Fri, 09 Dec 2022 03:25:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5fLbJbYKcpdIUaMe2hQVEcC3YHp6wRO5jvkomxA32e+99/fpzbTV3BuxbQPk7kCSSOxmnHmg==
X-Received: by 2002:a17:906:9d9f:b0:7c0:f90e:e5b6 with SMTP id
 fq31-20020a1709069d9f00b007c0f90ee5b6mr3738637ejc.31.1670585120080; 
 Fri, 09 Dec 2022 03:25:20 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 er18-20020a056402449200b004588ef795easm524492edb.34.2022.12.09.03.25.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/30] configure, meson: move --enable-debug-info to Meson
Date: Fri,  9 Dec 2022 12:23:58 +0100
Message-Id: <20221209112409.184703-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Older versions of Meson had an unclear description of the -Ddebug option,
but this is fixed in 0.63.0 that is required now.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 5 -----
 scripts/meson-buildoptions.py | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 26d10aeffd82..b0df6c3cf754 100755
--- a/configure
+++ b/configure
@@ -700,10 +700,6 @@ for opt do
   ;;
   --cross-prefix-*)
   ;;
-  --enable-debug-info) meson_option_add -Ddebug=true
-  ;;
-  --disable-debug-info) meson_option_add -Ddebug=false
-  ;;
   --cpu=*)
   ;;
   --target-list=*) target_list="$optarg"
@@ -995,7 +991,6 @@ cat << EOF
   bsd-user        all BSD usermode emulation targets
   pie             Position Independent Executables
   debug-tcg       TCG debugging (default is disabled)
-  debug-info      debugging information
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
 
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 3e2b4785388f..8e4e5c4e8bd6 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -35,6 +35,7 @@
 OPTION_NAMES = {
     "b_coverage": "gcov",
     "b_lto": "lto",
+    "debug": "debug-info",
     "malloc": "enable-malloc",
     "pkgversion": "with-pkgversion",
     "qemu_firmwarepath": "firmwarepath",
@@ -45,6 +46,7 @@
 BUILTIN_OPTIONS = {
     "b_coverage",
     "b_lto",
+    "debug",
     "datadir",
     "includedir",
     "libdir",
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index f91797741eef..cb277347bb18 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -10,6 +10,7 @@ meson_options_help() {
   printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
   printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
   printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
+  printf "%s\n" '  --disable-debug-info     Enable debug symbols and other information'
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
   printf "%s\n" '                           (can be empty) [share/doc]'
@@ -242,6 +243,8 @@ _meson_option_parse() {
     --datadir=*) quote_sh "-Ddatadir=$2" ;;
     --enable-dbus-display) printf "%s" -Ddbus_display=enabled ;;
     --disable-dbus-display) printf "%s" -Ddbus_display=disabled ;;
+    --enable-debug-info) printf "%s" -Ddebug=true ;;
+    --disable-debug-info) printf "%s" -Ddebug=false ;;
     --enable-debug-mutex) printf "%s" -Ddebug_mutex=true ;;
     --disable-debug-mutex) printf "%s" -Ddebug_mutex=false ;;
     --enable-debug-stack-usage) printf "%s" -Ddebug_stack_usage=true ;;
-- 
2.38.1


