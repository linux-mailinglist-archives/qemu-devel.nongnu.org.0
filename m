Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F110B67C9E1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:29:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LS-0002e9-QR; Thu, 26 Jan 2023 06:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LK-0001ig-Aa
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:58 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LI-0003iq-0F
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bk16so1403964wrb.11
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OuzaFTwfGMNndbyVLGZzkIKY+y7zC81Hu7O+CK8pY9I=;
 b=d0gVdMoqTUoCEp5YC3rTiOUpturM6eilLiAPl2kjoc3JmjykAuWSjxbgyLolPUe6Mb
 jvEcfrwh8h83sP1T6nTLz8q0FAcKToJkOLT4zOmDnHsXd1m0VHcQjb6rh2Jv5H9rWwng
 V5mIV6FcWYPu5ApsN2FZCShK1suoWypteZdC+GRT7w+WJav2Hwjrq06hlzUQBelFk+N5
 4f8FsSrLmDblEMrAnH8Yx5fkGaEWik06g+hlTTCFbv2L4Qo7lxXlDouA51ucXaI+S5eB
 dREWmmHfuBGxpxHtj1bJHppCVL+kOAieGDmW4omA79RlMkiKcCwPJE4ONARMu9IPs6vL
 OJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OuzaFTwfGMNndbyVLGZzkIKY+y7zC81Hu7O+CK8pY9I=;
 b=ZagNQ6WjLXQD6QfcTeTnw4M7WgBsDHtehtuyzG3IEXl8yOhe64Vvu3i3ChUpssMX7H
 +DQkG2xRz5EER9AuhrfcJ3UnX4QEB4tc0GI7E2Gs5DOk8+iMdiMv5ioP98DMWl9SWWLr
 9O1dpwJsOuBUcwoStPaiClcCpNFo0LbtZyQbM3d6BIFiOiBqd8rrOuKT+2J8Gal74afV
 hMLxeP7bvUiQOernRqfbuIeJNf6N1lfjIZO34500GgkX97vKmv3wjHk51vcdN2DOvfuj
 dCKhfkFRYuJjt4XLi6sjA4j4OVNVIScAZBT9w5VXoZOJkFFu4G8XmMM0IYja4dC258eJ
 3ktg==
X-Gm-Message-State: AO0yUKUfc2MyoPcInDGIM4QMYeJtyHIIxcY8OtRVgycITUZHkARIvkWG
 QvyNEAiq8m8Q+6AQtv8YDBjkag==
X-Google-Smtp-Source: AK7set/GNiUEQkviIxq7NG7So7IpweFVyt1dz+S8utKboBgQ4lM8BAG01nhOH/ScLzBvluvY5UuD+A==
X-Received: by 2002:a5d:65c5:0:b0:2bf:c338:8673 with SMTP id
 e5-20020a5d65c5000000b002bfc3388673mr2181792wrw.41.1674732174564; 
 Thu, 26 Jan 2023 03:22:54 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm974494wrj.103.2023.01.26.03.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 138351FFB7;
 Thu, 26 Jan 2023 11:22:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: [PULL 05/35] build-sys: fix crlf-ending C code
Date: Thu, 26 Jan 2023 11:22:20 +0000
Message-Id: <20230126112250.2584701-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Message-Id: <20230124180127.1881110-6-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 6d3b665629..56320ae717 100644
--- a/meson.build
+++ b/meson.build
@@ -2779,7 +2779,7 @@ config_host_data.set('CONFIG_SLIRP', slirp.found())
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


