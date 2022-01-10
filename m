Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D972B489BE8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:11:26 +0100 (CET)
Received: from localhost ([::1]:56720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wKU-0008VL-0H
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:11:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vr0-0002MI-Qv
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:58 -0500
Received: from [2a00:1450:4864:20::536] (port=40746
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqz-0000Vy-5J
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:58 -0500
Received: by mail-ed1-x536.google.com with SMTP id a18so53408339edj.7
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YFWh1/aUGnhtQvWNSPmrQpsKEyfAJp2BXqiV0h3xjk8=;
 b=KArp8jIRDSfXy9nNgjNZRT86rSHQhAT6Q5xAfnGklvxNyxEdhBu9Jh3M634267Fh0x
 MG2BHB0HJQ2DOYl7rjHUn8OH6ZN6HYDaQYcNGu0gm96nuTgJIrcJORKI/QqcuB485wo/
 qVlpg3pZMun4N7AfYEnLMD//bWczHOqtds0bpyReolmPEgxYC9gCuxdhPd/2G9lsnQSc
 YmPuJyaJUn7RBoZoYgMx03lKwAtsoxfWvdIr5Lg7Kt9fcmZcvnFIsseyuZYmmTBfyPg8
 0ThknhMy56feaSbZaLxQUfzpseLoI05E6AaRJ8YO1597WPJl5TIGz5kpxmd1bMeNuv2S
 0BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YFWh1/aUGnhtQvWNSPmrQpsKEyfAJp2BXqiV0h3xjk8=;
 b=iBM6KE3kospLEZdXBL/fh76mEb6xtUXIhjir3/Ecre1er6b8JGfhO7MzbUj5YLG6gI
 lUOJpfG7UK/g9BOUCwKpdP39hUEdGH7SL9K/0uJ4DKRTfUZzlUd24u9z9dc5X2W5kwHW
 7CGH62yQeFE451FOaLbdLraqWey+6KVm0FGKwnt34FVDYzWCdtPJzNCSbs0TKHGXa+qq
 RlDpqkGq4ownT5W0u3F+gg6JQYEf2skJc9/s/QyaPSp2Z7Fk8+OLwUCZ2A2Idm7BfabX
 db++WSickPYkTywdTqfkxfxIsSgpnAXxHz3Tj/AzNO/eVDQw6DP51ROgmJw8kJC4hafT
 pknA==
X-Gm-Message-State: AOAM533MrP5WxHW0NC/1cPtdGPmHawVlsVKUA7TTrLr7qo/dvrhaZlxP
 BBZFH5YZCXTzpSpgbzKrTGejS/c0rRs=
X-Google-Smtp-Source: ABdhPJwYL6J+/dGBjvEMhmURz7iTOzWLMfjYChNqr1ywkBCX6AUu5mA73pj+Sr8IAGQOeXXCki/1PA==
X-Received: by 2002:a17:906:7305:: with SMTP id
 di5mr39535ejc.255.1641825655873; 
 Mon, 10 Jan 2022 06:40:55 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/18] configure, meson: move config-poison.h to meson
Date: Mon, 10 Jan 2022 15:40:27 +0100
Message-Id: <20220110144034.67410-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
index 56c113bd83..0026388343 100755
--- a/configure
+++ b/configure
@@ -3834,17 +3834,6 @@ if test -n "${deprecated_features}"; then
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



