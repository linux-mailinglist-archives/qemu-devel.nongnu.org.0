Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F2E48444A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:10:48 +0100 (CET)
Received: from localhost ([::1]:57406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lSZ-0005nG-Qj
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:10:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGa-0007Ch-B3
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:24 -0500
Received: from [2a00:1450:4864:20::533] (port=33697
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGX-0004TN-98
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:22 -0500
Received: by mail-ed1-x533.google.com with SMTP id m21so150743983edc.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+E66IqNCT2gLnUgFCZeM7BI9JgDWyXcfb0XGm+77LJI=;
 b=joASk/TOleFA1ufQ0hR+4B/DzUKmHVmqpqQbPnyRicxwrJrERiBnht9NyQkm0Y705n
 JMW5nCbEMfgYLWl8luiie73o8getgmBf1KhN2wXONJExGHlbsv2PpHUiW1BAohxLfKS+
 2pz+t4kQ+ohFKlTrqUSnOfxoZw4vuobYq3ewjurKGz7iL7i7O5KIJ8erVB7EuwaOnZvb
 mh+hIKgOU34GtXKH+bcWGrqWvefnXANZHw0wTyaH2i/c6SGZ/m4DrL/C6/cp8obcfi1T
 +TfHh7oyU4VLNp2he+MzW0EKVQ1JEOwjkH3n1SBY8IDGpV82+DklK09S66ImfIYGDfhu
 3B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+E66IqNCT2gLnUgFCZeM7BI9JgDWyXcfb0XGm+77LJI=;
 b=kEHq0cGi1vZLH2O/Z3rHfZzM1XBGzhwHfVxhbqm/UFHlE5AXS4kKBNmESTWhZ5ogzh
 JYLFlRvvY7A8V4ZVTtA07EEXqfYV3NpuKe7ZsmslcRXBU5159esDzH/nUSDm3aZFO6gW
 FzshbO5bJEFsQoS8zuJnnS7wjRdeqVqA+CBVOJ3rjgPP17KHg9xziHGKlbEgQzan2FfS
 NOh6t20lYLfw3gdHSMdZ7vT4dHxh2Wjts+YgXu4Bfkyr4vM9isBVd32QrziE+3akS03y
 DfkxmwDdGge45layESVhlsI3e8FpL5qZMLk1bgEeA1PRqsuwdaDsr0aKASQJgRyVPdER
 JrmA==
X-Gm-Message-State: AOAM5318deRhz70REoKkqLWeS+itLDJ7I/tKcVXgd/ecuMmS7VMPmP/w
 XrIp85oEeJa1TLQ2AP8iiY/D5d42xec=
X-Google-Smtp-Source: ABdhPJwpm1kSiOB3yt6OqC60izgKcDZ9Dt5RQ0knmIs/bOHdbrtt7HH3GcvY6P0YShP4aH8152LvDA==
X-Received: by 2002:a17:907:2d12:: with SMTP id
 gs18mr40136439ejc.198.1641308299805; 
 Tue, 04 Jan 2022 06:58:19 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/15] configure, meson: move config-poison.h to meson
Date: Tue,  4 Jan 2022 15:57:45 +0100
Message-Id: <20220104145749.417387-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
index 8037f73b35..9e2e3bf004 100644
--- a/Makefile
+++ b/Makefile
@@ -221,7 +221,7 @@ qemu-%.tar.bz2:
 
 distclean: clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
-	rm -f config-host.mak config-poison.h
+	rm -f config-host.mak
 	rm -f tests/tcg/config-*.mak
 	rm -f config.status
 	rm -f roms/seabios/config.mak
diff --git a/configure b/configure
index e3d603d381..187632c371 100755
--- a/configure
+++ b/configure
@@ -3833,17 +3833,6 @@ if test -n "${deprecated_features}"; then
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
index 5a57906e98..36fc720ba3 100644
--- a/meson.build
+++ b/meson.build
@@ -2028,6 +2028,18 @@ config_all += {
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



