Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81DF6BEB78
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:36:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdBBG-0003tT-0K; Fri, 17 Mar 2023 10:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdBBD-0003t3-VM
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:35:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdBBC-0001oA-Aa
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:35:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j2so4619482wrh.9
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 07:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679063736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eDfCXi+1MsfqN5nrWBY5TwBGn9vJCmCJssbkM46yiM8=;
 b=XoPQs64VO/ud7ue7O5FnQIIccx4rc0vBxbAHRqH3VtOimrWpR22YzkoBwdTMZ+40Bo
 c+uRhwi7BhoIQ1ZBcJrhWFEB+I/7c96VvUOXoC5DkqAk2K9wFZ9rS/n7qc6+Vl8Bt65x
 yeD10kQZ8wKKRG4rTSS4Zmen+7udea2DTVUB7qKCg3+OYnjo0pP6eiraL5UfzsYwVj1V
 yY9rqW/DSWJ6WKdsCY5L6h8v5+gWFjVdZuh5QcuHikqHYF+Mrw/66G6wendvnsFIJD51
 C4B/+Hqe73mC/ZYTIY0VRkL7fNXdeam1gSyGQ1ggnHWpTvtUtbZxiZ9H/SrYdgbYjh59
 kAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679063736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eDfCXi+1MsfqN5nrWBY5TwBGn9vJCmCJssbkM46yiM8=;
 b=c//WlB2XeBw/Uv9J0nHQBB5ChVZuqP9iviITTG2BTZ2PpsZlLSXpsXBaUJW9e/ABg6
 P++ScjsKARs4/NHEvieLZXW8qDWLRiuRgCtTAsIr1P/62K/pevz0LA2BITB7wkBHtm8n
 Y9OAahOMHCT6nXAf1iVxk6gMTYX0VkgGzXlmG3aMaGzVX1PgQhs62WyOERbXMMaVYkQG
 g5gxUxrrOzfqe9JbcOw7Xy6hLL4XklqDsStcbrPeWUfSkmDVTN36+JKnTWCg2HaKtQyV
 +EkkwoMtaPxBURiuO4I50NVRJFub8p0gZ15XJTI2QeGslF6TN3SDON0ahEHdSlVMkfhY
 P8GQ==
X-Gm-Message-State: AO0yUKVaO2mnk+a7kVStVfjuTj6obaNF6jI3ES40MmJKFProD1u4QgYp
 yJTeZkqxAl8xZFxFLrKHYbQ+HVUBRu3E8M1OqYk=
X-Google-Smtp-Source: AK7set8PwQlHppwD8iyYRc4B0+e1coudHTXpoiPixmhCufDPmY7m64nQbL5Y92F9BGglEPoLP8twHg==
X-Received: by 2002:adf:fb0d:0:b0:2ce:a758:d6fb with SMTP id
 c13-20020adffb0d000000b002cea758d6fbmr2676785wrr.1.1679063736525; 
 Fri, 17 Mar 2023 07:35:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a5d6dc6000000b002c53f6c7599sm2104346wrz.29.2023.03.17.07.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 07:35:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH for-8.0] tests/unit/test-blockjob: Disable complete_in_standby
 test
Date: Fri, 17 Mar 2023 14:35:34 +0000
Message-Id: <20230317143534.1481947-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

The blockjob/complete_in_standby test is flaky and fails
intermittently in CI:


172/621 qemu:unit / test-blockjob
           ERROR           0.26s   killed by signal 6 SIGABRT
11:03:46 MALLOC_PERTURB_=176
G_TEST_SRCDIR=/Users/pm215/src/qemu-for-merges/tests/unit
G_TEST_BUILDDIR=/Users/pm215/src/qemu-for-merges/build/all/tests/unit
/Users/pm215/src/qemu-for-merges/build/all/tests/unit/test-blockjob
--tap -k
----------------------------------- output -----------------------------------
stdout:
# random seed: R02S8c79d6e1c01ce0b25475b2210a253242
1..9
# Start of blockjob tests
ok 1 /blockjob/ids
stderr:
Assertion failed: (job->status == JOB_STATUS_STANDBY), function
test_complete_in_standby, file ../../tests/unit/test-blockjob.c, line
499.

Seen on macOS/x86_64, FreeBSD 13/x86_64, msys2-64bit, eg:

https://gitlab.com/qemu-project/qemu/-/jobs/3872508803
https://gitlab.com/qemu-project/qemu/-/jobs/3950667240

Disable this subtest until somebody has time to investigate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/unit/test-blockjob.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index c0426bd10ca..a130f6fefba 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -531,6 +531,13 @@ int main(int argc, char **argv)
     g_test_add_func("/blockjob/cancel/standby", test_cancel_standby);
     g_test_add_func("/blockjob/cancel/pending", test_cancel_pending);
     g_test_add_func("/blockjob/cancel/concluded", test_cancel_concluded);
-    g_test_add_func("/blockjob/complete_in_standby", test_complete_in_standby);
+
+    /*
+     * This test is flaky and sometimes fails in CI and otherwise:
+     * don't run unless user opts in via environment variable.
+     */
+    if (getenv("QEMU_TEST_FLAKY_TESTS")) {
+        g_test_add_func("/blockjob/complete_in_standby", test_complete_in_standby);
+    }
     return g_test_run();
 }
-- 
2.34.1


