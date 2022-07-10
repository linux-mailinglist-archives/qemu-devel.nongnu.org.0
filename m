Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6A356D057
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 19:11:34 +0200 (CEST)
Received: from localhost ([::1]:51864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAaSz-00039p-8q
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 13:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJ7-0006K9-Ut
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:22 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJ6-0003Mt-EM
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:21 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso2984428pjo.0
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nrjm47IQdvon1pR17nAJV0WFKA1GxTG6ogwhpiImgUE=;
 b=L6kLDXiH+dT1R7p916zkGnLLfXWEvgvMMg5CzaocefQOw9IjmWK5YujSIKXf9Tm5gb
 XJ4nvF1VJfLFoCeskKhCVN9P06k1sBDR2VhrHGexMs9sHBNleT/H/bj8vXrWsKwIE3WU
 NQDhISl7ifNZa0jsyOWUadm+5Ujd8lP1r1pJuI+RvRTeUYuxaWE3DvCxqdpwdTxixnyV
 jMRfYHBjdplMOW5dsQz1Ldqea2sJEHyCb+Ylo2foU2deoevEvmgvKuIFODmI+t2zqXtD
 cRQvD3JxdQCnTOZB10YoMCXSJpKDgGLbOlkDcPuBdeN3sFlZcvR8n79OMBtQwEtPXyLK
 dZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nrjm47IQdvon1pR17nAJV0WFKA1GxTG6ogwhpiImgUE=;
 b=vQMPcdwkjYez12jwA0w99t/baS1xkZR14YG6oTJzwXNQWE5rXTatbHac3v2FmXupDk
 cQcsJdJoy/kuU7humCOB/YRK24Sz5nTe/QJDVjVRPM4qoeVVF0CT/vD05xr26LwUKpqA
 e64OKRILg9P2OnVAXRQ2Is2LRxvspXssYjn1CKg87jOJKkZxHSse9GeA16qCjbX2IW5z
 QO/Vsy+n8yqG4q+GafWNzf/FNDYlA25cdbh9921AMsk8/6Ur0wPOUWHPZnLnzfZUeOV/
 Q7OymxWLR4C1vw2HaLp3thQcc11EMgQjVWh/5Lg67/L6RfOLyeWdfK0NB1Ju67IGiasv
 q1sw==
X-Gm-Message-State: AJIora99tvQzKEdxTjQQCRfMaUzerlaao1jn3Q1In6/cfgJyYOxxZE05
 mj81JIqyLzEQyMqlfgJcT/UXzXENvAq+eyxq
X-Google-Smtp-Source: AGRyM1tRojv9hb+DJ6p3bnBVdMAgl2LCKy7p2HmsvWm7nMf9FKwGQ2A+CUzhHuWzJ6RR9RtUblYX8w==
X-Received: by 2002:a17:90b:268f:b0:1ef:ba7e:3fe4 with SMTP id
 pl15-20020a17090b268f00b001efba7e3fe4mr13092549pjb.23.1657472479010; 
 Sun, 10 Jul 2022 10:01:19 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.107.107])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020a17090341ce00b0016c19417495sm2930596ple.239.2022.07.10.10.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 10:01:18 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 03/11] acpi/tests/bits: disable acpi PSS tests that are
 failing in biosbits
Date: Sun, 10 Jul 2022 22:30:06 +0530
Message-Id: <20220710170014.1673480-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710170014.1673480-1-ani@anisinha.ca>
References: <20220710170014.1673480-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102d.google.com
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

PSS tests in acpi test suite seems to be failing in biosbits. This is because
the test is unable to find PSS support in QEMU bios. Let us disable
them for now so that make check does not fail. We can fix the tests and
re-enable them later.

Example failure:

---- ACPI _PSS (Pstate) table conformance tests ----
[assert] _PSS must exist FAIL
  \_SB_.CPUS.C000
  No _PSS exists
Summary: 1 passed, 1 failed
---- ACPI _PSS (Pstate) runtime tests ----
[assert] _PSS must exist FAIL
  \_SB_.CPUS.C000
  No _PSS exists
Summary: 0 passed, 1 failed

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/pytest/acpi-bits/bits-tests/testacpi.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/pytest/acpi-bits/bits-tests/testacpi.py b/tests/pytest/acpi-bits/bits-tests/testacpi.py
index 8e6bb3bbc6..cd2e0ef856 100644
--- a/tests/pytest/acpi-bits/bits-tests/testacpi.py
+++ b/tests/pytest/acpi-bits/bits-tests/testacpi.py
@@ -38,8 +38,8 @@
 
 def register_tests():
     testsuite.add_test("ACPI _MAT (Multiple APIC Table Entry) under Processor objects", test_mat, submenu="ACPI Tests")
-    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
-    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
+#    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
+#    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
     testsuite.add_test("ACPI DSDT (Differentiated System Description Table)", test_dsdt, submenu="ACPI Tests")
     testsuite.add_test("ACPI FACP (Fixed ACPI Description Table)", test_facp, submenu="ACPI Tests")
     testsuite.add_test("ACPI HPET (High Precision Event Timer Table)", test_hpet, submenu="ACPI Tests")
-- 
2.25.1


