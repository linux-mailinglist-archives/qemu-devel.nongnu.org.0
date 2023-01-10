Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F8D664B7B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:45:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIb2-0003Pn-FU; Tue, 10 Jan 2023 12:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIay-0003LB-3n
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:32 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIav-0001Do-Bt
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:31 -0500
Received: by mail-wr1-x436.google.com with SMTP id co23so12596632wrb.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSooXar7HpN3Wg9/9ZGVkzt9+EmW4klxjSnXakXRJjM=;
 b=R/kK5xrfBtRf/FxzNct8OW+Ct8EtfkNKN9MVPkBmsUcYSdqu6ziqQlw1/Z9Wd3IsTL
 fouN9mOtm6Q6CKMogZ3qJvTKCg18EZfY4nWs46FJXTysQxPxbnAw3oYHgmZ/KIEC804o
 nu6eNPMdgnHNB9++e9yU7DE/vlJwGv+AoGbY4EsUhLpoBKm01nKgOc9pPTpOP9e96ieE
 8+L4PUfN7gqsahm37q6HmZUdQo0ryh+TLl5nvreFKBZ6MVQv8aAllVaTgmRRbnWGexd1
 xFR8lnX04kUD0PCtywjnhGRb0ClkDXdmD5R11I3bev091ftG27vx49URubDBFRrk8Nu5
 IaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSooXar7HpN3Wg9/9ZGVkzt9+EmW4klxjSnXakXRJjM=;
 b=PI//TRq9MWMCjoKhdLp3BJ8ABVtSh8ZmADm/mSrLLlN0VtKnMYqOteEWQ/EXQF3/4A
 e9Nwj3jfCcuHX3OVc8lNab8Pojzy40fmanb3TQ9XtxQOh7qdJ2RhQ7Rsk1PHSQHHhOYP
 QVv29XIfR9nfa2DzkehQUMLR0nTA05dNE0TuNTqYtFsBTPvQGEaHP4ZOWMpjolunMAmV
 Jw9uUiAeY32r4PRl7BMmjNVyDpRFbDFVm0Lr3dS6jB/wlqa2kp+1PqubK4h6Zow8eB8q
 YfbGPlry4D7vMsNxgIGuuLN6iat3ZXi6oF9D7DPhP1D74dk3SxVqOLcapmkB20cQSSBc
 YK6w==
X-Gm-Message-State: AFqh2krVh/++amDX8+4bf2MxAi9LNMv8D+FVU+VcgydMLltx+liFYxph
 e9XTfegFypYJogv8hIrb3Lv1og==
X-Google-Smtp-Source: AMrXdXvo6V1L5uXVe9KOePNH7ufN0D6ZEdJ9QotMY9Mpl80wIhoLIp6mubaNeli3yy+8TqXwCKuzVQ==
X-Received: by 2002:a5d:56c1:0:b0:288:d139:3690 with SMTP id
 m1-20020a5d56c1000000b00288d1393690mr30091172wrw.67.1673372368039; 
 Tue, 10 Jan 2023 09:39:28 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a5d6d49000000b002bc8130cca7sm3712663wri.23.2023.01.10.09.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4ED601FFBD;
 Tue, 10 Jan 2023 17:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 05/26] build-sys: fix crlf-ending C code
Date: Tue, 10 Jan 2023 17:39:01 +0000
Message-Id: <20230110173922.265055-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

On msys2, the shader-to-C script produces bad C:
./ui/shader/texture-blit-vert.h:2:5: error: missing terminating " character [-Werror]

Fix it by changing the line ending from crlf to lf, and convert the
script to Python (qemu build seems perl-free after that).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230110132700.833690-2-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build              |  2 +-
 scripts/shaderinclude.pl | 16 ----------------
 scripts/shaderinclude.py | 26 ++++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 17 deletions(-)
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100644 scripts/shaderinclude.py

diff --git a/meson.build b/meson.build
index 175517eafd..b3c6db8343 100644
--- a/meson.build
+++ b/meson.build
@@ -2781,7 +2781,7 @@ config_host_data.set('CONFIG_SLIRP', slirp.found())
 genh += configure_file(output: 'config-host.h', configuration: config_host_data)
 
 hxtool = find_program('scripts/hxtool')
-shaderinclude = find_program('scripts/shaderinclude.pl')
+shaderinclude = find_program('scripts/shaderinclude.py')
 qapi_gen = find_program('scripts/qapi-gen.py')
 qapi_gen_depends = [ meson.current_source_dir() / 'scripts/qapi/__init__.py',
                      meson.current_source_dir() / 'scripts/qapi/commands.py',
diff --git a/scripts/shaderinclude.pl b/scripts/shaderinclude.pl
deleted file mode 100644
index cd3bb40b12..0000000000
--- a/scripts/shaderinclude.pl
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/usr/bin/env perl
-use strict;
-use warnings;
-
-my $file = shift;
-open FILE, "<", $file or die "open $file: $!";
-my $name = $file;
-$name =~ s|.*/||;
-$name =~ s/[-.]/_/g;
-print "static GLchar ${name}_src[] =\n";
-while (<FILE>) {
-    chomp;
-    printf "    \"%s\\n\"\n", $_;
-}
-print "    \"\\n\";\n";
-close FILE;
diff --git a/scripts/shaderinclude.py b/scripts/shaderinclude.py
new file mode 100644
index 0000000000..ab2aade2cd
--- /dev/null
+++ b/scripts/shaderinclude.py
@@ -0,0 +1,26 @@
+#!/usr/bin/env python3
+#
+# Copyright (C) 2023 Red Hat, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import sys
+import os
+
+
+def main(args):
+    file_path = args[1]
+    basename = os.path.basename(file_path)
+    varname = basename.replace('-', '_').replace('.', '_')
+
+    with os.fdopen(sys.stdout.fileno(), "wt", closefd=False, newline='\n') as stdout:
+        with open(file_path, "r", encoding='utf-8') as file:
+            print(f'static GLchar {varname}_src[] =', file=stdout)
+            for line in file:
+                line = line.rstrip()
+                print(f'    "{line}\\n"', file=stdout)
+            print('    "\\n";', file=stdout)
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv))
-- 
2.34.1


