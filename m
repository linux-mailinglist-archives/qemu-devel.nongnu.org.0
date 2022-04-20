Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273A0508C9D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:57:38 +0200 (CEST)
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCi0-0003DQ-Ug
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLk-0001Up-5M
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLi-0000wg-8y
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:35 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u3so2803346wrg.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnT37L9uJA7IvDjcWLI5ltU9Tg1bdp6nI/3gG4y0CI4=;
 b=CVQ6NeyqNrGvm738Kr0QalVA4QTt/97YAZk7JhVfOt2JonEd71yLeiYTG1Nq00EJnG
 TKnlPKodYya0Nhse6ecovnEAhs+Y7hQlljHV7ZqcjrW5uusJm9PNFlBk5YPjfsViSJYk
 R81Cz/rh628ugoFgNbHX/HBxVPUfm0SCI4+P00aAwXXmPuEgR2yCIwV0tTU2hV772m5H
 8FrQmbpj+id2Ycc8h9m5ipxDiCx6j2dxwH7DOJP/hDTJP9pMs2z0rOuc4IMyw7uTu+KP
 X6hn0rHHZsZs15eiksGFsRxpBoq/MvRzk3vFNPik6STDqhqg1jkA5bMnBrmdnudl0yRT
 L11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TnT37L9uJA7IvDjcWLI5ltU9Tg1bdp6nI/3gG4y0CI4=;
 b=R2cc0/p+4oY4/93LLg1XH0d8DV707W6b0JL4lBGzB91u+0vtEL5aOXYepSGprbzvxT
 TgEt36KcnODqGSBOuM0uEyiqHCH5ZRLLVGX+17t3wM/PmL9rHUZcmF+K7yMQ4a4hMd3g
 KnGDZ1w7K+TXfpoJfsDHJqwA0feDn6jh4uHbbuIMqdZetinrRpq5gXw7+fkIa+cv35In
 4i/1OG3kwsBQMa45D3/fRNqRHY9LzOt5ZI7ZDkxUN58Fiz1QN5+Q9i4W7U8LimzZICQ5
 CMjRHnNd0ygav4zASHPw55jdH/zTlDEw3cOTWJAvtbnKbAVQKDSExrcaVTM4LYefvhqJ
 2a3g==
X-Gm-Message-State: AOAM531uTycGahOJimifdk/4Hd11rslq6+80f4nZIIgfIyJjI/k65Hh3
 d7b3wwPZqqfG+QXsQ7YCnxpYa4q1afY+pA==
X-Google-Smtp-Source: ABdhPJzyZC1rnqMzD8SWK02ycH1u4k/LUnCSPqwqwSogu6dF59oq9PLoGVyNlwwioGpE4nhwa0ZZFg==
X-Received: by 2002:a05:6000:1e0e:b0:207:bb61:78d0 with SMTP id
 bj14-20020a0560001e0e00b00207bb6178d0mr16501420wrb.512.1650468872866; 
 Wed, 20 Apr 2022 08:34:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/34] meson-buildoptions: add support for string options
Date: Wed, 20 Apr 2022 17:33:48 +0200
Message-Id: <20220420153407.73926-16-pbonzini@redhat.com>
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

Allow using the buildoptions.json file for more options, namely anything
that is not a boolean or multiple-choice.

The mapping between configure and meson is messy for string options,
so allow configure to use to something other than the name in
meson_options.txt.  This will come in handy anyway for builtin
Meson options such as b_lto or b_coverage.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson_options.txt             |  2 +-
 scripts/meson-buildoptions.py | 65 ++++++++++++++++++++++++++++++-----
 scripts/meson-buildoptions.sh |  6 ++--
 3 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index cf18663833..415fcc448e 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -11,7 +11,7 @@ option('qemu_firmwarepath', type : 'string', value : '',
 option('smbd', type : 'string', value : '',
        description: 'Path to smbd for slirp networking')
 option('sphinx_build', type : 'string', value : '',
-       description: 'Use specified sphinx-build [$sphinx_build] for building document (default to be empty)')
+       description: 'Use specified sphinx-build for building document')
 option('iasl', type : 'string', value : '',
        description: 'Path to ACPI disassembler')
 option('default_devices', type : 'boolean', value : true,
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 693be7b966..4af8d6e732 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -38,6 +38,11 @@
     "trace_file",
 }
 
+OPTION_NAMES = {
+    "malloc": "enable-malloc",
+    "trace_backends": "enable-trace-backends",
+}
+
 BUILTIN_OPTIONS = {
     "strip",
 }
@@ -75,7 +80,7 @@ def help_line(left, opt, indent, long):
     right = f'{opt["description"]}'
     if long:
         value = value_to_help(opt["value"])
-        if value != "auto":
+        if value != "auto" and value != "":
             right += f" [{value}]"
     if "choices" in opt and long:
         choices = "/".join(sorted(opt["choices"]))
@@ -96,6 +101,18 @@ def allow_arg(opt):
     return not (set(opt["choices"]) <= {"auto", "disabled", "enabled"})
 
 
+# Return whether the option (a dictionary) can be used without
+# arguments.  Booleans can only be used without arguments;
+# combos require an argument if they accept neither "enabled"
+# nor "disabled"
+def require_arg(opt):
+    if opt["type"] == "boolean":
+        return False
+    if opt["type"] != "combo":
+        return True
+    return not ({"enabled", "disabled"}.intersection(opt["choices"]))
+
+
 def filter_options(json):
     if ":" in json["name"]:
         return False
@@ -110,20 +127,48 @@ def load_options(json):
     return sorted(json, key=lambda x: x["name"])
 
 
+def cli_option(opt):
+    name = opt["name"]
+    if name in OPTION_NAMES:
+        return OPTION_NAMES[name]
+    return name.replace("_", "-")
+
+
+def cli_help_key(opt):
+    key = cli_option(opt)
+    if require_arg(opt):
+        return key
+    if opt["type"] == "boolean" and opt["value"]:
+        return f"disable-{key}"
+    return f"enable-{key}"
+
+
+def cli_metavar(opt):
+    if opt["type"] == "string":
+        return "VALUE"
+    if opt["type"] == "array":
+        return "CHOICES"
+    return "CHOICE"
+
+
 def print_help(options):
     print("meson_options_help() {")
-    for opt in options:
-        key = opt["name"].replace("_", "-")
+    for opt in sorted(options, key=cli_help_key):
+        key = cli_help_key(opt)
         # The first section includes options that have an arguments,
         # and booleans (i.e., only one of enable/disable makes sense)
-        if opt["type"] == "boolean":
-            left = f"--disable-{key}" if opt["value"] else f"--enable-{key}"
+        if require_arg(opt):
+            metavar = cli_metavar(opt)
+            left = f"--{key}={metavar}"
+            help_line(left, opt, 27, True)
+        elif opt["type"] == "boolean":
+            left = f"--{key}"
             help_line(left, opt, 27, False)
         elif allow_arg(opt):
             if opt["type"] == "combo" and "enabled" in opt["choices"]:
-                left = f"--enable-{key}[=CHOICE]"
+                left = f"--{key}[=CHOICE]"
             else:
-                left = f"--enable-{key}=CHOICE"
+                left = f"--{key}=CHOICE"
             help_line(left, opt, 27, True)
 
     sh_print()
@@ -142,9 +187,11 @@ def print_parse(options):
     print("_meson_option_parse() {")
     print("  case $1 in")
     for opt in options:
-        key = opt["name"].replace("_", "-")
+        key = cli_option(opt)
         name = opt["name"]
-        if opt["type"] == "boolean":
+        if require_arg(opt):
+            print(f'    --{key}=*) quote_sh "-D{name}=$2" ;;')
+        elif opt["type"] == "boolean":
             print(f'    --enable-{key}) printf "%s" -D{name}=true ;;')
             print(f'    --disable-{key}) printf "%s" -D{name}=false ;;')
         else:
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index a269534394..5a06b7915c 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -1,5 +1,7 @@
 # This file is generated by meson-buildoptions.py, do not edit!
 meson_options_help() {
+  printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
+  printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
   printf "%s\n" '                           use block whitelist also in tools instead of only'
   printf "%s\n" '                           QEMU'
@@ -8,7 +10,6 @@ meson_options_help() {
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-cfi             Control-Flow Integrity (CFI)'
   printf "%s\n" '  --enable-cfi-debug       Verbose errors in case of CFI violation'
-  printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
   printf "%s\n" '  --enable-debug-mutex     mutex debugging support'
   printf "%s\n" '  --enable-debug-stack-usage'
   printf "%s\n" '                           measure coroutine stack usage'
@@ -16,7 +17,6 @@ meson_options_help() {
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-fuzzing         build fuzzing targets'
   printf "%s\n" '  --enable-gprof           QEMU profiling with gprof'
-  printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to use [system] (choices:'
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
   printf "%s\n" '  --enable-module-upgrades try to load modules from alternate paths for'
@@ -29,7 +29,7 @@ meson_options_help() {
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-strip           Strip targets on install'
   printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (slow)'
-  printf "%s\n" '  --enable-trace-backends=CHOICE'
+  printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
   printf "%s\n" ''
-- 
2.35.1



