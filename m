Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A0B47A0F9
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:33:45 +0100 (CET)
Received: from localhost ([::1]:46688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myxFw-0007KI-9K
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:33:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx2t-0003iK-9B
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:20:16 -0500
Received: from [2a00:1450:4864:20::534] (port=47017
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx2r-0006Mw-Gr
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:20:14 -0500
Received: by mail-ed1-x534.google.com with SMTP id y13so27698489edd.13
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eUgIGypOvlxmVLkE+IKIHLkcbtFMyPVsMQpyrCGpfZw=;
 b=N7wftzlwpOUUbKAf/xWcsJN+o/gLPqfwz2a51G3TTh7xAOclNwRGvZLnyzLNyKsO8H
 ru1GJkVP3sNDF/cOR7dVsDziDGbEh543JLGTvE83REx2UlNk6KauMvN301eLz1dWPM1q
 cmfMC4zjcZF3++h1zuMVWPL/stbMQ3jEOcpzXwEN8+p89tUSAvzW8VWVR4/zj961P6kR
 Xo0laXjz87NjE7q11ZqizTpahLgFDSwaWbyGGbk1Thl/yTrsnNygZoX5WxIyltVAtnKv
 y5+ich2tSpWcJqWi74m9sEy1yko5Dt+sNUmxdNsRGjqtnBXOmAnpviN9tDlyE6S64wAP
 WAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eUgIGypOvlxmVLkE+IKIHLkcbtFMyPVsMQpyrCGpfZw=;
 b=EyYjtFGbhe5S6WA14mJgMP9TxRswwjDILPCiPBzpFsm1qHW39YvqLVqjTWzmcqtlI9
 dY6yaNKiaK4zVofP7AufSRzStg8epqoUyxuX+U0apDFr3+M3Wicik0W8SU0dvbItIjhr
 X2BbbR2F4uumWT+mrsML1Cz8Bken/FGh8vTwS95EC5ORYi59ekdXaJkbsRAwUuYuK74H
 3cA98ryb163/1kMKyPNqfb5CKZ+lDLECzcprWBcG5ey3E75d5Xsjaxsj/9vlck44Pbru
 O/7W/1boAFUsZMLAlTHaSzhlFN1OMYqCqsnnqjTlK1PO/XzpPY59GxN5/PCc3+MFWDjV
 4A/g==
X-Gm-Message-State: AOAM533Y84OvF4scTpxF41AP1bbEmzP3XG/EcXvrWsgFlXeRAWpMj2hw
 k+YdHk22XYPmlHJSpTIhB5/ZOMal2Jw=
X-Google-Smtp-Source: ABdhPJxo+cCHS3ioU5D4z12sa+TajbOrouRynnork6E5HT2ZelrQQRXOGIwpHdDsYfgGnphaFcCOqw==
X-Received: by 2002:a05:6402:4413:: with SMTP id
 y19mr11482931eda.26.1639923612048; 
 Sun, 19 Dec 2021 06:20:12 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y19sm5791584edc.17.2021.12.19.06.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:20:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/16] tests/qtest/fuzz-megasas-test: Add test for GitLab issue
 #521
Date: Sun, 19 Dec 2021 15:20:07 +0100
Message-Id: <20211219142008.248807-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Without the previous commit, this test triggers:

  $ make check-qtest-x86_64
  [...]
  Running test qtest-x86_64/fuzz-megasas-test
  qemu-system-x86_64: softmmu/physmem.c:3229: address_space_unmap: Assertion `mr != NULL' failed.
  Broken pipe
  ERROR qtest-x86_64/fuzz-megasas-test - too few tests run (expected 2, got 1)

Suggested-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20211119201141.532377-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/fuzz-megasas-test.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/qtest/fuzz-megasas-test.c b/tests/qtest/fuzz-megasas-test.c
index 940a76bf25..e1141c58a4 100644
--- a/tests/qtest/fuzz-megasas-test.c
+++ b/tests/qtest/fuzz-megasas-test.c
@@ -34,6 +34,34 @@ static void test_lp1878263_megasas_zero_iov_cnt(void)
     qtest_quit(s);
 }
 
+/*
+ * Overflow SGL buffer.
+ * https://gitlab.com/qemu-project/qemu/-/issues/521
+ */
+static void test_gitlab_issue521_megasas_sgl_ovf(void)
+{
+    QTestState *s = qtest_init("-display none -m 32M -machine q35 "
+                               "-nodefaults -device megasas "
+                               "-device scsi-cd,drive=null0 "
+                               "-blockdev "
+                               "driver=null-co,read-zeroes=on,node-name=null0");
+    qtest_outl(s, 0xcf8, 0x80000818);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80000804);
+    qtest_outw(s, 0xcfc, 0x05);
+    qtest_bufwrite(s, 0x0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x7, "\x01", 0x1);
+    qtest_bufwrite(s, 0x10, "\x02", 0x1);
+    qtest_bufwrite(s, 0x16, "\x01", 0x1);
+    qtest_bufwrite(s, 0x28, "\x01", 0x1);
+    qtest_bufwrite(s, 0x33, "\x01", 0x1);
+    qtest_outb(s, 0xc040, 0x0);
+    qtest_outb(s, 0xc040, 0x20);
+    qtest_outl(s, 0xc040, 0x20000000);
+    qtest_outb(s, 0xc040, 0x20);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -43,6 +71,8 @@ int main(int argc, char **argv)
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
                        test_lp1878263_megasas_zero_iov_cnt);
+        qtest_add_func("fuzz/gitlab_issue521_megasas_sgl_ovf",
+                       test_gitlab_issue521_megasas_sgl_ovf);
     }
 
     return g_test_run();
-- 
2.33.1



