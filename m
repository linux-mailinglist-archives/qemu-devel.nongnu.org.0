Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92964345F03
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:10:31 +0100 (CET)
Received: from localhost ([::1]:46846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgnm-000138-JB
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOgjm-0005TW-IW; Tue, 23 Mar 2021 09:06:22 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOgjk-0002LE-Sh; Tue, 23 Mar 2021 09:06:22 -0400
Received: by mail-wr1-x435.google.com with SMTP id b9so20702749wrt.8;
 Tue, 23 Mar 2021 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0M8wW87BuDH+rmu9cePgKen5O5CaaJxYZ5OM4Z4+XQc=;
 b=EcBFcbtOSqvotXUwc8ZCZVIWS2nNdlxHeKDbQxruMsrHZvxlchZXXxKRARK8ZtXsMC
 ZTPUwJ55ZnRaSRJiSRKBVARDwE4c6njR2YZSlWZtIHiQjuRq4K29OzzkwyTmMYc6E4QG
 ZAHSXfL8O5h9kDfXplmduNhiIGefA/hwmhaxA4Bt18OR2Z8vOfvxE3xcU9g0F76fw0h+
 hcKOwdKqWLwXbCWHiD8oXnLQYQs5rcARRcuDGuU37TxStayOnT4iTLHZFd3H3FUj5ZJd
 6XggpD6anDH8E62L86ytcfy+ee5Vyphq0WBcZ6F1bso0HLNRkq+PUx4Kh3bl6th00NQV
 t0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0M8wW87BuDH+rmu9cePgKen5O5CaaJxYZ5OM4Z4+XQc=;
 b=KdZWO+OS2g3UN8xjLnDqs0ch5R8yx/P2rerqaSRDpNb72tXynzQ+u4xZ1uKbump1OU
 qSfAeIrZGbxM+FeNdT+09IlvA/eOro7hwhLpk44sVQfim8f2VoAIzAIVkslxSE7/b/nM
 hXN20eLHK6zmf0CP66+uT+x4/rUda73rPCVljn9MxSRXOwzLJZgvXNTD/jlcrt8U+APp
 +mGK2er2iR6ghVw/zqCywoIly+swjYvTeIWAmnO8a8Cjwe72cqewIXyVGlK0tlvbcs4G
 1Vz+X2BTuEMXC9JPCdk/O1Rkbi9Y9QUzfUfiC+4KHLDZAa9sv5e5tXuJygnz4QxsGQnC
 ySJA==
X-Gm-Message-State: AOAM532tFasPvU55/oxeqQ7U3v+UE0TbIga4ZII2C2s6Pq1ApVOH/ivD
 TlY/Gwnnl4ZeA59AtadYXa8TXCQMtuM=
X-Google-Smtp-Source: ABdhPJxKY6wx3tDNPnlFbxzT9zb2/sxe8Ug7kX0dy5Pr7yLX+HS2Ke/D4Z3z6cLqxnFsCqdt2HFp0A==
X-Received: by 2002:a5d:42d2:: with SMTP id t18mr3935711wrr.258.1616504779187; 
 Tue, 23 Mar 2021 06:06:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i8sm2507590wmi.6.2021.03.23.06.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:06:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] qemu-iotests: let "check" spawn an arbitrary test command
Date: Tue, 23 Mar 2021 14:06:13 +0100
Message-Id: <20210323130614.146399-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323130614.146399-1-pbonzini@redhat.com>
References: <20210323130614.146399-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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

Right now there is no easy way for "check" to print a reproducer command.
Because such a reproducer command line would be huge, we can instead teach
check to start a command of our choice.  This can be for example a Python
unit test with arguments to only run a specific subtest.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/check | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index d1c87ceaf1..aab25dac6a 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -19,6 +19,7 @@
 import os
 import sys
 import argparse
+import shutil
 from findtests import TestFinder
 from testenv import TestEnv
 from testrunner import TestRunner
@@ -100,8 +101,8 @@ def make_argparser() -> argparse.ArgumentParser:
                        'one to TEST (not inclusive). This may be used to '
                        'rerun failed ./check command, starting from the '
                        'middle of the process.')
-    g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
-                       help='tests to run')
+    g_sel.add_argument('tests', nargs=argparse.REMAINDER,
+                       help='tests to run, or "--" followed by a command')
 
     return p
 
@@ -114,6 +115,17 @@ if __name__ == '__main__':
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind)
 
+    if args.tests[0] == '--':
+        del args.tests[0]
+        cmd = args.tests
+        env.print_env()
+        exec_path = shutil.which(cmd[0])
+        if exec_path is None:
+            sys.exit('command not found: ' + cmd[0])
+        cmd[0] = exec_path
+        full_env = env.prepare_subprocess(cmd)
+        os.execve(cmd[0], cmd, full_env)
+
     testfinder = TestFinder(test_dir=env.source_iotests)
 
     groups = args.groups.split(',') if args.groups else None
-- 
2.30.1



