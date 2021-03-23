Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE48345EF2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:07:40 +0100 (CET)
Received: from localhost ([::1]:40738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgl1-0006r1-Kv
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOgjm-0005SP-0j; Tue, 23 Mar 2021 09:06:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOgjj-0002Ju-Hw; Tue, 23 Mar 2021 09:06:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j18so20697983wra.2;
 Tue, 23 Mar 2021 06:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+5eTiuWmbhLWopCKunYthhDZ4oxHC2qbNf0hg72RLtg=;
 b=B15ZanwA4mvb9+jXChDt5jjez64M2u9yEkNGtWd35Uo1xnEUsy+4F7HbkrqNOo3HL+
 76xhqpyeYfIZy3DYhA1gvDwMJupsS2aj2U4iV0VONYPVkPlk5WJjNvRiYcLVV7RcSwKI
 BzN8hLSNVpKsnTAYStQXpEzhfikZI3xbO7kv5Wf/0H/jUXr8AFghqMOGAhp0rO89FDQH
 Zj5bLXr3iWQPIFrnHiC96SF4Z6VMFDXip2i7GL7MbAauLUnC/Wj9K2g0m4CAqfiL1lsJ
 PQMlWOSCMdwoqvkhSvNtfcPdJMJVllbhaq0A5FjFEuytpfVyf1t66hjv6S9iziqaw69Y
 LNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+5eTiuWmbhLWopCKunYthhDZ4oxHC2qbNf0hg72RLtg=;
 b=JEQEyoxm/l4uuXleLadfKQ7XpKkqLQ6Q3/gOOorOpFjip+NIaupXL7t2o/dxlyfKUw
 6JIH3cCqxGZhfImpPrZRVmo380mVD8ZGF7lfwNIgmhkrHmU0Bdu3Dx5xNOAKo3ToiGm3
 CT4FQGSUFlJFMOeUAmhGH+mi/sSBPGYTb+9H3cIERzJP8R7sIl5j8Yab+Wc5umfX12/J
 tMCx7gEYqe6N3G5J0ERtg+9J2rQvRU92x+ec3kfA564tOcm90ZWKNY/fWZ5Sr+rTv1TH
 XtxlUQuMb+e0/0//al3/DbJK0D2ls2sgdRJljQ21jbvkRX+5Ql94edv17tCHeNpEeJ2d
 EeSw==
X-Gm-Message-State: AOAM5336gciPEZYNFQ7Yb73ox2HlOfVLnMJmin3MHSgkLQIhmNkKw2mc
 +uTbLmzJv+kNwKXGvN59hCOckmlZP7U=
X-Google-Smtp-Source: ABdhPJyLSkcGIfaEfweScPqbqQ0qyKvA7weTCpC2XPEHSOclyrl/pVSjaxOQgO0cU95xXylXaUKv3Q==
X-Received: by 2002:a05:6000:1789:: with SMTP id
 e9mr3951363wrg.237.1616504777519; 
 Tue, 23 Mar 2021 06:06:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i8sm2507590wmi.6.2021.03.23.06.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:06:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] qemu-iotests: allow passing unittest.main arguments to
 the test scripts
Date: Tue, 23 Mar 2021 14:06:11 +0100
Message-Id: <20210323130614.146399-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323130614.146399-1-pbonzini@redhat.com>
References: <20210323130614.146399-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: eesposit@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Python test scripts that use unittest consist of multiple tests.
unittest.main allows selecting which tests to run, but currently this
is not possible because the iotests wrapper ignores sys.argv.

unittest.main command line options also allow the user to pick the
desired options for verbosity, failfast mode, etc.  While "-d" is
currently translated to "-v", it also enables extra debug output,
and also there are no other options available.  Unfortunately, these
command line options only work if the unittest.main testRunner argument
is a type, rather than a TestRunner instance, and right now iotests.py
is using a TextTestRunner instance in order to pass the output stream.
By moving the machinery to obtain reproducible unittest output into a
TextTestRunner subclass, we can just pass the class name to unittest.main.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/iotests.py | 60 ++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 90d0b62523..b9f4edfc42 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1271,38 +1271,49 @@ def func_wrapper(*args, **kwargs):
             return func(*args, **kwargs)
     return func_wrapper
 
-def execute_unittest(debug=False):
-    """Executes unittests within the calling module."""
-
-    verbosity = 2 if debug else 1
-
-    if debug:
-        output = sys.stdout
-    else:
-        # We need to filter out the time taken from the output so that
-        # qemu-iotest can reliably diff the results against master output.
-        output = io.StringIO()
-
-    runner = unittest.TextTestRunner(stream=output, descriptions=True,
-                                     verbosity=verbosity)
-    try:
-        # unittest.main() will use sys.exit(); so expect a SystemExit
-        # exception
-        unittest.main(testRunner=runner)
-    finally:
-        # We need to filter out the time taken from the output so that
-        # qemu-iotest can reliably diff the results against master output.
-        if not debug:
-            out = output.getvalue()
+# We need to filter out the time taken from the output so that
+# qemu-iotest can reliably diff the results against master output.
+class ReproducibleTextTestRunner(unittest.TextTestRunner):
+    __output = None
+
+    @classmethod
+    @property
+    def output(cls):
+        if cls.__output is not None:
+            return cls.__output
+
+        cls.__output = io.StringIO()
+        def print_output():
+            out = cls.__output.getvalue()
             out = re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 tests', out)
 
             # Hide skipped tests from the reference output
             out = re.sub(r'OK \(skipped=\d+\)', 'OK', out)
             out_first_line, out_rest = out.split('\n', 1)
             out = out_first_line.replace('s', '.') + '\n' + out_rest
-
             sys.stderr.write(out)
 
+        atexit.register(print_output)
+        return cls.__output
+
+    def __init__(self, *args, **kwargs):
+        super().__init__(stream=ReproducibleTextTestRunner.output, *args, **kwargs)
+
+def execute_unittest(argv, debug=False):
+    """Executes unittests within the calling module."""
+
+    # If we see non-empty argv we must not be invoked as a test script,
+    # so do not bother making constant output; debuggability is more
+    # important.
+    if debug or len(argv) > 1:
+        argv += ['-v']
+        runner = unittest.TextTestRunner
+    else:
+        runner = ReproducibleTextTestRunner
+
+    unittest.main(argv=argv, testRunner=runner,
+                  warnings=None if sys.warnoptions else 'ignore')
+
 def execute_setup_common(supported_fmts: Sequence[str] = (),
                          supported_platforms: Sequence[str] = (),
                          supported_cache_modes: Sequence[str] = (),
@@ -1338,7 +1348,7 @@ def execute_test(*args, test_function=None, **kwargs):
 
     debug = execute_setup_common(*args, **kwargs)
     if not test_function:
-        execute_unittest(debug)
+        execute_unittest(sys.argv, debug)
     else:
         test_function()
 
-- 
2.30.1



