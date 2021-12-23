Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB047E2EA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:08:17 +0100 (CET)
Received: from localhost ([::1]:47586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0MtM-0005rY-Qd
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdQ-0004L0-6P
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:48 -0500
Received: from [2a00:1450:4864:20::433] (port=46963
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdN-0008QL-5d
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:47 -0500
Received: by mail-wr1-x433.google.com with SMTP id i22so10869276wrb.13
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lCTmqeld7Cn0/DS9onYUMtselzlMQj/7lzl64QKsiJE=;
 b=WtgejeNoXGKdyYlMqsrHa9BU1Tf0fabXqguugwurDGbskihm2XTeHayCYbK71UGqw3
 ZAHfKcDu0NBFFvHvSA//sTYqjtWq5xaJtISoVcWqnKB6bNSwDUAK1nCaUg2lnZ3b7VTX
 XHgvBGsWaqmKCde5vpeivCjjjoX3vAXQFxxVBwYGdUqv6zJH5VDoqleVHSm0lvOFsZ02
 8Z0CGKZ3VyySCUOYvsxFJDITz6JUea+oD2fHbYXtA3Zj6in8KYks3XCw9rsBscXimqpr
 9T2gF9CRs/gAkGuQudkKmKT3s+RO7Vw6G5GlwpcfovipZPLBbsrqddZTjvlZpJ0eVbl3
 qIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lCTmqeld7Cn0/DS9onYUMtselzlMQj/7lzl64QKsiJE=;
 b=lh0dVG1vU6VEtFccMniS7jhcXgUZYScGXe6dqbuzGk1NxJRbJDmvGhu1SHOE7j3Ix3
 r5TV+vXsoJZ/vX9Cmp2Utbwwy/8RdFOYqtROrvGMVEA7tffXn4vhrvO4j7VgRVzIT+na
 Feo6rDnKUQXWAyM+DxPLblKIw9szRicrYscASQelJ8p2DRXroWKFeZAAwujvESEpnOAe
 X9FOBflWrehL0+oNsF5TbAxniwsU38n6QGvR2wR0S9L0Qq0UgK/do7ws+2l50RD11BUL
 i/Y8ZXxp5gSLHQZ+Q8F+EFaHM7lfz4/4hH73B8xCCn/xWRPY9VFJT8tLOMncFsQpL5+x
 8/FQ==
X-Gm-Message-State: AOAM531/eZmNKjEpR9FnaGr+HnL7TP4Mft91InlSYi4Aa8Kqp12U3mJs
 hptuzNuvtJlVkNkTCmUEBegaAZq70Ko=
X-Google-Smtp-Source: ABdhPJzJrmkNayjA+tjTpVHEmSddxqrCstQq3rX+M4QQIhOtCTsuvQ62FI8+uJOaiZ4by+jfZCGHtQ==
X-Received: by 2002:a5d:4e92:: with SMTP id e18mr1547027wru.89.1640260302821; 
 Thu, 23 Dec 2021 03:51:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] configure, meson: move config-poison.h to meson
Date: Thu, 23 Dec 2021 12:51:31 +0100
Message-Id: <20211223115134.579235-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This ensures that the file is regenerated properly whenever config-target.h
or config-devices.h files change.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                      |  2 +-
 configure                     | 11 -----------
 meson.build                   | 12 ++++++++++++
 scripts/make-config-poison.sh | 16 ++++++++++++++++
 4 files changed, 29 insertions(+), 12 deletions(-)
 create mode 100755 scripts/make-config-poison.sh

diff --git a/Makefile b/Makefile
index 06ad8a61e1..2f80f56a4a 100644
--- a/Makefile
+++ b/Makefile
@@ -220,7 +220,7 @@ qemu-%.tar.bz2:
 
 distclean: clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
-	rm -f config-host.mak config-poison.h
+	rm -f config-host.mak
 	rm -f tests/tcg/config-*.mak
 	rm -f config.status
 	rm -f roms/seabios/config.mak
diff --git a/configure b/configure
index 8eb8e4c2cc..d2f12bc2d6 100755
--- a/configure
+++ b/configure
@@ -3827,17 +3827,6 @@ if test -n "${deprecated_features}"; then
     echo "  features: ${deprecated_features}"
 fi
 
-# Create list of config switches that should be poisoned in common code...
-# but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
-target_configs_h=$(ls *-config-devices.h *-config-target.h 2>/dev/null)
-if test -n "$target_configs_h" ; then
-    sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
-        -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
-        $target_configs_h | sort -u > config-poison.h
-else
-    :> config-poison.h
-fi
-
 # Save the configure command line for later reuse.
 cat <<EOD >config.status
 #!/bin/sh
diff --git a/meson.build b/meson.build
index 993a591983..a61eb7cee5 100644
--- a/meson.build
+++ b/meson.build
@@ -2006,6 +2006,18 @@ config_all += {
   'CONFIG_ALL': true,
 }
 
+target_configs_h = []
+foreach target: target_dirs
+  target_configs_h += config_target_h[target]
+  target_configs_h += config_devices_h.get(target, [])
+endforeach
+genh += custom_target('config-poison.h',
+                      input: [target_configs_h],
+                      output: 'config-poison.h',
+                      capture: true,
+                      command: [find_program('scripts/make-config-poison.sh'),
+                                target_configs_h])
+
 ##############
 # Submodules #
 ##############
diff --git a/scripts/make-config-poison.sh b/scripts/make-config-poison.sh
new file mode 100755
index 0000000000..d222a04304
--- /dev/null
+++ b/scripts/make-config-poison.sh
@@ -0,0 +1,16 @@
+#! /bin/sh
+
+if test $# = 0; then
+  exit 0
+fi
+
+# Create list of config switches that should be poisoned in common code...
+# but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
+exec sed -n \
+  -e' /CONFIG_TCG/d' \
+  -e '/CONFIG_USER_ONLY/d' \
+  -e '/^#define / {' \
+  -e    's///' \
+  -e    's/ .*//' \
+  -e    's/^/#pragma GCC poison /p' \
+  -e '}' "$@"
-- 
2.33.1



