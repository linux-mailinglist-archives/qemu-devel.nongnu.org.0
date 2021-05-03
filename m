Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0323713EF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:03:08 +0200 (CEST)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWLz-00037e-5Z
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKK-0001rg-D2
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:24 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKI-0004rG-8p
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:24 -0400
Received: by mail-ed1-x52e.google.com with SMTP id bf4so5749607edb.11
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f2TUvLfi/bunpIY74wAKSOpvmTKQ7RTzmZv40TStSOI=;
 b=P+6SPlcgcgaNAA58JqJJAcXSXv94sssT/ETaL4VCwHx9/WiLUNvpHWEiCL69xSWrFZ
 Fr8UC89Hh/tkg884MPm9siyDBybq2DIUkgfgFcLFxPCuw0l53CWT0k2fjqcbZc7O4+aY
 2pmcoBTLx4mwvnIFvoJFHADP7SpMqhYF1NfrnZiUso85i0ECeU92QsykEZOQG2TNzcAs
 juJoPTU8Omo8S26w0tLAhaxzfGiExtdjGtQ+nH2LS2boF+quE5BKH4XLasfUHUDiwCnX
 GheLMHih0//rZOJHveHGFbs6Bn2fYX72bNOEYGPdae/WhN4oU65vjrNXB9A2hN37mfq3
 Q8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=f2TUvLfi/bunpIY74wAKSOpvmTKQ7RTzmZv40TStSOI=;
 b=gwhkgt2/O/lknCyLrwTlLlaxyV5Z7qZuuFlizDyLPh86kC2IPaeVpjP3/vQ9s9/xoF
 plD0QMUxASt5E1wO3uNECO8lILv9jlp4ABOhHfZ2N0Yx+ikIAwsp4e3zUDl33qQ10sCp
 HPfFUaNUJ+9PU6LGLg+qnpiKcH2KtTVIQZdnEG7cJ7E98nYPPJ/1h4iZx/2l2dbzD8Ji
 4DQNfrqAQbd0TO+Cd9oVQMHnexSCLH20MAGYzMzYx7F1XtHJSG1RHrofNPgWD/slMXN7
 FaKkQNdv/psGFx4CtZHBPU7OCwoWPzyrsjRUBwPzokphD/pZZmixI1QauyihYn+EYNJv
 f4Xg==
X-Gm-Message-State: AOAM533HGv6yycTNI2eP9B/q2kyvSrQdwDm/ksMHsISchDIuCbLkfWrJ
 MvVTQ9oDG39lPxoh2FzCv70w9SeB5Q0=
X-Google-Smtp-Source: ABdhPJzAvPzbHw0WszKbMwemlxZyxhgZfmWIYMdLzS+oTUesOna/NvS2+hZyZWKAjHYbdRAqn7jkPw==
X-Received: by 2002:a05:6402:30bc:: with SMTP id
 df28mr18021666edb.67.1620039675964; 
 Mon, 03 May 2021 04:01:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id v16sm12041464edt.53.2021.05.03.04.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:01:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] qemu-iotests: allow passing unittest.main arguments to
 the test scripts
Date: Mon,  3 May 2021 13:01:07 +0200
Message-Id: <20210503110110.476887-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503110110.476887-1-pbonzini@redhat.com>
References: <20210503110110.476887-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Python test scripts that use unittest consist of multiple tests.
unittest.main allows selecting which tests to run, but currently this
is not possible because the iotests wrapper ignores sys.argv.

unittest.main command line options also allow the user to pick the
desired options for verbosity, failfast mode, etc.  While "-d" is
currently translated to "-v", it also enables extra debug output,
and other options are not available at all.

These command line options only work if the unittest.main testRunner
argument is a type, rather than a TestRunner instance.  Therefore, pass
the class name and "verbosity" argument to unittest.main, and adjust for
the different default warnings between TextTestRunner and unittest.main.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210323181928.311862-3-pbonzini@redhat.com>
---
 tests/qemu-iotests/iotests.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 55a017577f..5ead94229f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1308,12 +1308,16 @@ def __init__(self, stream: Optional[TextIO] = None,
                          resultclass=resultclass,
                          **kwargs)
 
-def execute_unittest(debug=False):
+def execute_unittest(argv: List[str], debug: bool = False) -> None:
     """Executes unittests within the calling module."""
 
-    verbosity = 2 if debug else 1
-    runner = ReproducibleTestRunner(verbosity=verbosity)
-    unittest.main(testRunner=runner)
+    # Some tests have warnings, especially ResourceWarnings for unclosed
+    # files and sockets.  Ignore them for now to ensure reproducibility of
+    # the test output.
+    unittest.main(argv=argv,
+                  testRunner=ReproducibleTestRunner,
+                  verbosity=2 if debug else 1,
+                  warnings=None if sys.warnoptions else 'ignore')
 
 def execute_setup_common(supported_fmts: Sequence[str] = (),
                          supported_platforms: Sequence[str] = (),
@@ -1350,7 +1354,7 @@ def execute_test(*args, test_function=None, **kwargs):
 
     debug = execute_setup_common(*args, **kwargs)
     if not test_function:
-        execute_unittest(debug)
+        execute_unittest(sys.argv, debug)
     else:
         test_function()
 
-- 
2.31.1



