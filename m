Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940436B91F6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 12:45:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc356-0001KT-GY; Tue, 14 Mar 2023 07:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc354-0001KI-3p
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:44:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc352-0003jV-7A
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:44:37 -0400
Received: by mail-wr1-x433.google.com with SMTP id v16so14104358wrn.0
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 04:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678794274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4+tdz/RaMkDRxWJNfENiUIVO5q89SsxENDZjnTQygTU=;
 b=kk6Vo3MYaIr9S1hCSzGnnQP1BhDJ+oiaBwv4mZaH/IKlno/z5KSPGt/JjW1e4YhGPF
 DN7yL242CueOTP//fg6eQ7w+f6w8m84td89ohU75getEXbQylBPGOBrb76oJ2q9NAuQl
 G4fOboJ2a4h+P6zQrxVjn1p1WUcUTWeU1QuaeF3LlNuwep5uG/XCc3KHpst+T6/+Baxp
 RRkllY7IlyxpGMGFhFqf0Z/0q1cRF5cJkQX1F0Yt8oHVwJhd4bDYDEOmB01rhALquwDL
 4P+0yW2SGpVJKbhcXEXwClEQHM0zFUV1Mm0dCnkKcF6ZiDKtc13nVRS4YMgV8PW2H0Fv
 QD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678794274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4+tdz/RaMkDRxWJNfENiUIVO5q89SsxENDZjnTQygTU=;
 b=jiLozqUMtsbFwf9su1GyyPqymDCINmA5cQC2c4FUt3r9U6sh9oeGL8tYZtvXM3XJ/o
 k0XkILRj3jPOZ6m9Yv5r39lsHH7eW697ElbRuoswAL1CF+4CZmaumsnzs/Uf9TzBwzUh
 oA944NFr1QSN5RUiyAmHo7qSSuTsjMHOPpx3zGxHmkRlLw3SaID4s4OvidqKm4wqoFTG
 TV8gGnwB11zcRGsC8pvk1mJ+0lVIeMqtGt0rgkeNTnylMJiL1n4/zRolpJsnkNjYoRpR
 Idd1Uu5YpCg6r5i4YBQzeYAq11lPe9ialtpPLvJB9mCITcP65J/zv08y/F4XO2Lon9Fp
 oYjg==
X-Gm-Message-State: AO0yUKXbUVVeSnSuH/rb02xSBzoMn3dfJu7MOwDYtiK2LaEcvc2H2lBq
 Dck9/NdZHzazvy/Ed7PHyf/7RtJHO3gzgHcM3g0=
X-Google-Smtp-Source: AK7set8iZY8y93Nu/aUS/uy8NgQaB99DW5tybeTskxTxttlmywJpXAg4hQyPCEsZKTwkBm1h6jbL8w==
X-Received: by 2002:a5d:4581:0:b0:2c5:4f45:90b0 with SMTP id
 p1-20020a5d4581000000b002c54f4590b0mr10154590wrq.3.1678794274236; 
 Tue, 14 Mar 2023 04:44:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d6-20020adfe2c6000000b002c70851fdd8sm1872326wrj.75.2023.03.14.04.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 04:44:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] docs/sphinx/kerneldoc.py: Honour --enable-werror
Date: Tue, 14 Mar 2023 11:44:31 +0000
Message-Id: <20230314114431.1096972-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Currently, the kerneldoc Sphinx plugin doesn't honour the
--enable-werror configure option, so its warnings are never fatal.
This is because although we do pass sphinx-build the -W switch, the
warnings from kerneldoc are produced by the scripts/kernel-doc script
directly and don't go through Sphinx's "emit a warning" function.

When --enable-werror is in effect, pass sphinx-build an extra
argument -Dkerneldoc_werror=1.  The kerneldoc plugin can then use
this to determine whether it should be passing the kernel-doc script
-Werror.

We do this because there is no documented mechanism for
a Sphinx plugin to determine whether sphinx-build was
passed -W or not; if one is provided then we can switch to
that at a later date:
https://github.com/sphinx-doc/sphinx/issues/11239

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB: we need to land the fix for the current outstanding
warning before this one can go in...
https://lore.kernel.org/qemu-devel/20230310103123.2118519-11-alex.bennee@linaro.org/
---
 docs/meson.build         | 2 +-
 docs/sphinx/kerneldoc.py | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/meson.build b/docs/meson.build
index bb72c10ea8c..f220800e3e5 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -7,7 +7,7 @@ if sphinx_build.found()
   SPHINX_ARGS = ['env', 'CONFDIR=' + qemu_confdir, sphinx_build, '-q']
   # If we're making warnings fatal, apply this to Sphinx runs as well
   if get_option('werror')
-    SPHINX_ARGS += [ '-W' ]
+    SPHINX_ARGS += [ '-W', '-Dkerneldoc_werror=1' ]
   endif
 
   # This is a bit awkward but works: create a trivial document and
diff --git a/docs/sphinx/kerneldoc.py b/docs/sphinx/kerneldoc.py
index bf442150165..72c403a7379 100644
--- a/docs/sphinx/kerneldoc.py
+++ b/docs/sphinx/kerneldoc.py
@@ -74,6 +74,10 @@ def run(self):
         # Sphinx versions
         cmd += ['-sphinx-version', sphinx.__version__]
 
+        # Pass through the warnings-as-errors flag
+        if env.config.kerneldoc_werror:
+            cmd += ['-Werror']
+
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
         export_file_patterns = []
 
@@ -167,6 +171,7 @@ def setup(app):
     app.add_config_value('kerneldoc_bin', None, 'env')
     app.add_config_value('kerneldoc_srctree', None, 'env')
     app.add_config_value('kerneldoc_verbosity', 1, 'env')
+    app.add_config_value('kerneldoc_werror', 0, 'env')
 
     app.add_directive('kernel-doc', KernelDocDirective)
 
-- 
2.34.1


