Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EDE56D056
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 19:11:17 +0200 (CEST)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAaSi-0002u9-Do
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 13:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJC-0006Rn-3S
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:27 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJA-0003OV-7Q
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:25 -0400
Received: by mail-pl1-x632.google.com with SMTP id d5so2626040plo.12
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JfdvqcHmbo+RPt+FsFZbMjLtImA9WyDidr/j6jDQgDQ=;
 b=YfdP8DOwZtb2UcwPgk/bAYuFHXa6yLz4VamYpEOOvd99y903rXEOLVqnfLfbWM9X8M
 yLLTEpXL0ylG8qj5FHcN15gHvI6cxkaQ0C3Fiv3OZVt31htcFNsxPxV3cJboSorRSRfF
 n45DMKBwlBwaJc2wkMSPfpUL4/8s6xmkOi/23r6iPv1IPjUhXwjyA9pdp7x+tqCtb/sE
 6uKAMvVzPOGZUJyS7ZIqbeupwxd7H4sGQSIIUQt/SzQXNrKV1lZpdygyde4wYiAriNaT
 KjuB5baECdT/UZzRiknudY2Qc+QIWYvFxonmsc9CpVIivbfsJIQ3Kcrow5CeFVOkHNTJ
 Vc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JfdvqcHmbo+RPt+FsFZbMjLtImA9WyDidr/j6jDQgDQ=;
 b=R7RSdObUOSEF6JtCNmxwx0NTvuLJKLdO4V/ytzkcljeFLDR2ZPtPG77poCqDucN13E
 jL+c8r3JV6IQ/J09xp5aSwXsFDludmWTgh5jGWZyX84UxhnSgn3tYiY6pv9Eu2Qu2pdJ
 skPQd7BPkobv/tynbCVJJ/tKefb6ZCzjhG0GYSdSpfrCMandvZa1Lez+eAOcqRIvkGkc
 DimGusiRsyCXTgx2Iz+ddAbgbkZqcaCyrDrjXSIinBXHt3vtlBNfWqveBtm09INssfHQ
 1gl37AWDh8QhpPofR6fsqAcNyA4Ou7DnyrAxpvRY6e3ZqsKl8YEwIYEAQNUJhpTVCq1k
 iYXA==
X-Gm-Message-State: AJIora+1Dp08eguxAdPhsu7RGB+OzQXmju3dfHdqiNl6PatqqlBMDEvH
 YrzKMVY2CWR7EUzvMUYBuhwdEMq6TG6LcA2s
X-Google-Smtp-Source: AGRyM1uL1F53bzxtjmAtkKtvG4tft0Mwjdkp7g1KAYnvn6258bHyfeMCWSM2gW+cpnkxGXwV8iZXng==
X-Received: by 2002:a17:902:ce05:b0:16c:2a1:c335 with SMTP id
 k5-20020a170902ce0500b0016c02a1c335mr14407627plg.5.1657472482673; 
 Sun, 10 Jul 2022 10:01:22 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.107.107])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020a17090341ce00b0016c19417495sm2930596ple.239.2022.07.10.10.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 10:01:22 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 04/11] acpi/tests/bits: add smilatency test suite from bits
 in order to disable it
Date: Sun, 10 Jul 2022 22:30:07 +0530
Message-Id: <20220710170014.1673480-5-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710170014.1673480-1-ani@anisinha.ca>
References: <20220710170014.1673480-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

smilatency tests does not reliably pass every time it is run from QEMU. This
change adds the test file unchanged from bits so that the next change can
disable the test.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/pytest/acpi-bits/bits-tests/meson.build |   2 +-
 .../pytest/acpi-bits/bits-tests/smilatency.py | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 tests/pytest/acpi-bits/bits-tests/smilatency.py

diff --git a/tests/pytest/acpi-bits/bits-tests/meson.build b/tests/pytest/acpi-bits/bits-tests/meson.build
index 3056731a53..06bca75d99 100644
--- a/tests/pytest/acpi-bits/bits-tests/meson.build
+++ b/tests/pytest/acpi-bits/bits-tests/meson.build
@@ -1,4 +1,4 @@
-test_files = ['smbios.py', 'testacpi.py', 'testcpuid.py']
+test_files = ['smbios.py', 'smilatency.py', 'testacpi.py', 'testcpuid.py']
 
 copytestfiles = custom_target('copy test files',
   input : test_files,
diff --git a/tests/pytest/acpi-bits/bits-tests/smilatency.py b/tests/pytest/acpi-bits/bits-tests/smilatency.py
new file mode 100644
index 0000000000..fb1b7228e3
--- /dev/null
+++ b/tests/pytest/acpi-bits/bits-tests/smilatency.py
@@ -0,0 +1,102 @@
+# Copyright (c) 2015, Intel Corporation
+# All rights reserved.
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions are met:
+#
+#     * Redistributions of source code must retain the above copyright notice,
+#       this list of conditions and the following disclaimer.
+#     * Redistributions in binary form must reproduce the above copyright notice,
+#       this list of conditions and the following disclaimer in the documentation
+#       and/or other materials provided with the distribution.
+#     * Neither the name of Intel Corporation nor the names of its contributors
+#       may be used to endorse or promote products derived from this software
+#       without specific prior written permission.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
+# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
+# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+"""SMI latency test."""
+
+import bits
+from collections import namedtuple
+import testsuite
+import time
+import usb
+
+def register_tests():
+    testsuite.add_test("SMI latency test", smi_latency);
+    testsuite.add_test("SMI latency test with USB disabled via BIOS handoff", test_with_usb_disabled, runall=False);
+
+def smi_latency():
+    MSR_SMI_COUNT = 0x34
+
+    print "Warning: touching the keyboard can affect the results of this test."
+
+    tsc_per_sec = bits.tsc_per_sec()
+    tsc_per_usec = tsc_per_sec / (1000 * 1000)
+    bins = [long(tsc_per_usec * 10**i) for i in range(9)]
+    bin_descs = [
+        "0     < t <=   1us",
+        "1us   < t <=  10us",
+        "10us  < t <= 100us",
+        "100us < t <=   1ms",
+        "1ms   < t <=  10ms",
+        "10ms  < t <= 100ms",
+        "100ms < t <=   1s ",
+        "1s    < t <=  10s ",
+        "10s   < t <= 100s ",
+        "100s  < t         ",
+    ]
+
+    print "Starting test. Wait here, I will be back in 15 seconds."
+    (max_latency, smi_count_delta, bins) = bits.smi_latency(long(15 * tsc_per_sec), bins)
+    BinType = namedtuple('BinType', ("max", "total", "count", "times"))
+    bins = [BinType(*b) for b in bins]
+
+    testsuite.test("SMI latency < 150us to minimize risk of OS timeouts", max_latency / tsc_per_usec <= 150)
+    if not testsuite.show_detail():
+        return
+
+    for bin, desc in zip(bins, bin_descs):
+        if bin.count == 0:
+            continue
+        testsuite.print_detail("{}; average = {}; count = {}".format(desc, bits.format_tsc(bin.total/bin.count), bin.count))
+        deltas = (bits.format_tsc(t2 - t1) for t1,t2 in zip(bin.times, bin.times[1:]))
+        testsuite.print_detail(" Times between first few observations: {}".format(" ".join("{:>6}".format(delta) for delta in deltas)))
+
+    if smi_count_delta is not None:
+        testsuite.print_detail("{} SMI detected using MSR_SMI_COUNT (MSR {:#x})".format(smi_count_delta, MSR_SMI_COUNT))
+
+    testsuite.print_detail("Summary of impact: observed maximum latency = {}".format(bits.format_tsc(max_latency)))
+
+def test_with_usb_disabled():
+    if usb.handoff_to_os():
+        smi_latency()
+
+def average_io_smi(port, value, count):
+    def f():
+        tsc_start = bits.rdtsc()
+        bits.outb(port, value)
+        return bits.rdtsc() - tsc_start
+    counts = [f() for i in range(count)]
+    return sum(counts)/len(counts)
+
+def time_io_smi(port=0xb2, value=0, count=1000):
+    count_for_estimate = 10
+    start = time.time()
+    average_io_smi(port, value, count_for_estimate)
+    avg10 = time.time() - start
+    estimate = avg10 * count/count_for_estimate
+    if estimate > 1:
+        print "Running test, estimated time: {}s".format(int(estimate))
+    average = average_io_smi(port, value, count)
+    print "Average of {} SMIs (via outb, port={:#x}, value={:#x}): {}".format(count, port, value, bits.format_tsc(average))
-- 
2.25.1


