Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D1E34A9B3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:28:15 +0100 (CET)
Received: from localhost ([::1]:33078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnRe-0006hG-U9
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNg-00021P-Hw; Fri, 26 Mar 2021 10:24:09 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNe-0000hP-3z; Fri, 26 Mar 2021 10:24:08 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v11so5810992wro.7;
 Fri, 26 Mar 2021 07:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gvbSNeIZd5IJGTxW7zM4dCB0Uzkztx8q2xU47Lg0Gzs=;
 b=ipEq7m9RubysDGvjerYNh8NP3XcFk9c1r+gG0AZcnfZXb1snf6I68ARJlxWcV7bVQS
 krmgFXEq3A3gXyEQgmiY0I1WBwparweyO1qNshxV2N+LQ2Sn4nS0CSNm0N4yKQKLGHGW
 RPZ4uUX/zd2wInUBlQZLSIy+AvbM27TmfZSaGJWCnQpcMotUzdGBtP2o5SvTFrVUyz3m
 3yDL9qVoEiJj1fW411oSmdN9Q3zoY3AyzRMP8kRm2cviF1dG77aj9JC/yocuhZ2kCAC+
 yhE6eal5x/7WVKMl53UPcr8D5PWftOxmYAfo2qRvLiCyoDG0hbWJqjfNDtk5wB5kqqU6
 6XRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gvbSNeIZd5IJGTxW7zM4dCB0Uzkztx8q2xU47Lg0Gzs=;
 b=gEUCYaI4bsp/EUazB+Dto1Bx6bbOB/WCYmhduN/dFY/p7nwUbXPxx9JkoEXLrfoLj5
 zFPzRGV/LCCbAE4w4OstmuKQEuY1yfDexIKrl8n9VbIq/Rr9Nejsp+6gaJbW3oczCIpf
 VW23WCVaAYPs0mmL/P2LCWXXntX71X1EEotscdIqYaluPqgkfkGW7QX/5hrqmocWGG13
 yvl/m5ghq7UMhcdFfez3yCmWTmgA62S6dLa+acl1BX5N3m3D1XNS4+2UJWpvbT8hXF9h
 wHrDfb6Tj8G6pXwTtKEgbC7cmfaL6yl+k4T7kqkUVDgDSAAG+IEaTNAvOHJlakGbFRnB
 RXyQ==
X-Gm-Message-State: AOAM532Z9DHQJhy+NDG6pqDsyqj4TXZKG5wUq8WlLJY6ykLVNxseLuhD
 qdTwwq9hHw9NAyBYuxkfNbrNB5Zc34o=
X-Google-Smtp-Source: ABdhPJwAqm2LKQjyYweiU3Yf8pG2BCmsOemyV8sd2HXU/q0OYPkG+4bm6AlJbNkQVbzGE/kUPADwKw==
X-Received: by 2002:a5d:6404:: with SMTP id z4mr15202101wru.109.1616768644523; 
 Fri, 26 Mar 2021 07:24:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m5sm13084517wrq.15.2021.03.26.07.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:24:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] qemu-iotests: allow passing unittest.main arguments to
 the test scripts
Date: Fri, 26 Mar 2021 15:23:56 +0100
Message-Id: <20210326142359.431127-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210326142359.431127-1-pbonzini@redhat.com>
References: <20210326142359.431127-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 mreitz@redhat.com
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
index ccf3747ede..5ead94229f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1308,12 +1308,16 @@ def __init__(self, stream: Optional[TextIO] = None,
                          resultclass=resultclass,
                          **kwargs)
 
-def execute_unittest(debug=False):
+def execute_unittest(argv: List[str], debug: bool = False) -> None:
     """Executes unittests within the calling module."""
 
-    verbosity = 2 if debug else 1
-    runner = unittest.ReproducibleTestRunner(verbosity=verbosity)
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
2.30.1



