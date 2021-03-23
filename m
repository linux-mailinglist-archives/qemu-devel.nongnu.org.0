Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24862346865
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:03:23 +0100 (CET)
Received: from localhost ([::1]:42552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmJG-0005nm-13
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlcv-000836-HP; Tue, 23 Mar 2021 14:19:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlcs-0006ft-S5; Tue, 23 Mar 2021 14:19:37 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo11387189wmq.4; 
 Tue, 23 Mar 2021 11:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjfYXuvapzfoicvsPzenNs9Pa0X+2b/AgIrWbXMqX7I=;
 b=XE1onioODOjbotMesjy3DnzkyuZeiMlPjInEAOB1lULRLeGVNmQ7Nptau7jX4+aw/8
 +Bg6HcqSjJ+btNWAxwW1wHyaWfoyYNKHD3GNMF+P1UfUlLHSpXs9Wedfv+1jlvW7cFo7
 i/XhqNbUcWh0wGHo+EP0LyplKR6iOWrxXvwINjtQYAfPo3xVfULhU/06QA1Ogcth9kKz
 XhG/+Sw+eR8n7DskTSo2RSa4G2xtlTFMF1QWoh8Z8XclJ7xOORctY+DPevZD8IRMac9B
 DKFOyaaObIePO8btMpRJHXjgwIpJm0+a/L5PDWrzTiI8eTmEqnakeobRp5Q6BqoHwuGE
 edOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OjfYXuvapzfoicvsPzenNs9Pa0X+2b/AgIrWbXMqX7I=;
 b=Oe9pw0Rr7BGhK8i7W5dZuk5npm/mHdAM5JxsrqZvKyVlfWLDIWR1fqjDd7oDpcNUfF
 6xwE0c7ONMYv9gXEuX9PZBtE1ps0Nl5R+7LHG4Zd9tjADNgQhlaXUlAfxVAEgn2jPrhU
 A8k9liD+U+HghjJhL6Hd3nkasBN4RiGN1Y2EAwdr4gq3WnfT5l9EmtBSgeiWShDGceYw
 xWZOrzL3LWeRwQUBfTsdrlWtl9UfPyqTsSMz5BXxH8IZ4YT/Vo4E9TucjzzvSQC7kZho
 XiRQvfeqpOjPwZsI/ciuwPjoLXwKTfmJfdpS1VF4gcGD3GIOmoRiCWNp1j56ZCKKP5OG
 Ga4w==
X-Gm-Message-State: AOAM530YE9/N/mkRJOsFjoAsw6blc5h5uCNnx1yb99Fa9vg1Qc+T6EaY
 v+UcGjV+9YgtHVN+Fl/bxJ9oGLAloWI=
X-Google-Smtp-Source: ABdhPJz3Inp5OeqcnPQGzwnRC84XWK/r1h+YxAN8bkIRyPw3AjjDVkjh98rol02IDjzgYxhgfmKtXA==
X-Received: by 2002:a1c:e041:: with SMTP id x62mr4485637wmg.95.1616523571229; 
 Tue, 23 Mar 2021 11:19:31 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u8sm24204412wrr.42.2021.03.23.11.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:19:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] qemu-iotests: allow passing unittest.main arguments to
 the test scripts
Date: Tue, 23 Mar 2021 19:19:24 +0100
Message-Id: <20210323181928.311862-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323181928.311862-1-pbonzini@redhat.com>
References: <20210323181928.311862-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
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
and other options are not available at all.

These command line options only work if the unittest.main testRunner
argument is a type, rather than a TestRunner instance.  Therefore, pass
the class name and "verbosity" argument to unittest.main, and adjust for
the different default warnings between TextTestRunner and unittest.main.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/iotests.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 0521235030..c7915684ba 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1308,12 +1308,16 @@ def __init__(self, stream: Optional[io.TextIOBase] = None,
                          resultclass=resultclass,
                          *args, **kwargs)
 
-def execute_unittest(debug=False):
+def execute_unittest(argv: List[str], debug: bool= False):
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



