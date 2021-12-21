Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ECF47BE9A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:09:48 +0100 (CET)
Received: from localhost ([::1]:36042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzd1f-0004sl-KE
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxd-0005L1-89
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:37 -0500
Received: from [2a00:1450:4864:20::336] (port=42709
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxb-000502-IW
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:36 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso1826096wme.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ib90tZqm+itNZ7bMTWH//a4+m5K46RgXb+YLh8TmpQA=;
 b=WaTJRJFr9QMspMXUq3EZ4LIdOem7DhevoOwRv86notjAddmjN6ufz+vX7gGhkHslkI
 FtVcR4auaf8ArP2yrYjJxhrapZ951DHGXWHaw9brIXa3y08W3nZKCUWPFTWbRb27RJlH
 3iYMAUa9SJPC3yRTpfWYtrYhUl8zArQcXBmkEpxJSf0ti8f9ay5hykTmW0U3bO4LkozC
 cpMh18V1cF/BNGaRVMHHI7wmu3TRlCeG3YWQhAx4pkL+MoT3vduPkMPItutSfP84EmbC
 YRf3M8JHgrrJhog45wNNM/qEgFUwN9V6FotUqMw+J67IRWZH920vM/6FkDRR1cQc1Tf/
 WTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ib90tZqm+itNZ7bMTWH//a4+m5K46RgXb+YLh8TmpQA=;
 b=JSiIiod02najc1YjKUhbp9G3Sv9pBkWCsSddUklUgmhqHwYrLxYx0Wo3eX6+SlPLlS
 13FSXxqxdQDYPg9gfHx+/axpPXLJPQtroNQ8JP5OLW9HvbnB/LVOEE1LdgqGdj5Vj1ur
 S8LTa2+Y/l6X86WLMaTCY6vmGtDIzbc1nTtWq0C3ceaGpGyPKrE/YYgWsYAX0A0GnJWS
 MM4BAt8eG6xDMVbtgkwHRK6D3BV8aQq6mM+4sHtmOCZ4O96QtKik2MyIfI/L5p8aDwxG
 JqkFKRwNH9Y9jv//Xrm4bSBj/+QjwcnoLVzAtqQx0VNQxs4nN2adRpGDQ4MgJsAjBetw
 geFQ==
X-Gm-Message-State: AOAM5339OJxN/o4r+tXJbYIdRSOSQkd69/n2l/qJBxgokKxBnafwCgWn
 Xhg0pB3qc74MNE5ANPqUz68oho7barM=
X-Google-Smtp-Source: ABdhPJyqk9lTHHsKhdf5L6ivnhkK+Qi7ID5rH15ZZn1E/LZ0snMuCYmO8yHieaoCJRrb4WZ1O7QGhQ==
X-Received: by 2002:a05:600c:3783:: with SMTP id
 o3mr2228466wmr.78.1640084734264; 
 Tue, 21 Dec 2021 03:05:34 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id az11sm1949444wmb.30.2021.12.21.03.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 03:05:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] configure, meson: move config-poison.h to meson
Date: Tue, 21 Dec 2021 12:05:25 +0100
Message-Id: <20211221110526.351709-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211221110526.351709-1-pbonzini@redhat.com>
References: <20211221110526.351709-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: richard.henderson@linaro.org
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
index 810bc36490..aff371ca81 100755
--- a/configure
+++ b/configure
@@ -3858,17 +3858,6 @@ if test -n "${deprecated_features}"; then
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
index 2495360fd0..09ee427ca4 100644
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
+                      command: [find_program('scripts/make-config-poison.sh')] +
+                               (target_configs_h.length() > 0 ? ['@INPUT@'] : []))
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



