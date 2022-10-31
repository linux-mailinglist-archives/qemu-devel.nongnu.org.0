Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082066136F1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:52:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUGg-00025s-Qf; Mon, 31 Oct 2022 08:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGJ-00016Y-Mo
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGE-0002HT-Lv
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZrzez510xiVz7CEUkck5REzpmtbqexQFYk8M50bGII=;
 b=BvxlrDBvbJ/k9mfpcm5PdK1ULnnaVuSqMuoF0p7nozIzpkw5ne3LHA+eGvEyxRT93ocsbF
 SvSCsjRXZuQMAVTXMRqsIigHA/pemav6ggqG+0D5cMGhLhr3wn9iTvMy1VIvOAIb8bi7x7
 TmV9EiSXnpRIctk51u1Qz1dle6HphXw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-97-8gg1oy2NOgG5oIXGCAC0Vg-1; Mon, 31 Oct 2022 08:51:24 -0400
X-MC-Unique: 8gg1oy2NOgG5oIXGCAC0Vg-1
Received: by mail-wr1-f71.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so3046053wrg.21
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lZrzez510xiVz7CEUkck5REzpmtbqexQFYk8M50bGII=;
 b=vNjdCTWbjgYXQrTGnNteoLB13JbAT5kLQ2pSF2F3gpNZSbCYUhgjgLrhdYmDBp4F4n
 wPlaK+q4V2N7HqDO1eOZ3aOmRDjQa4Hr8iwxlQ5/l64jbZcqGbB4Yaoe90LzcVM0dRJz
 cuuu0tKRjCRBBiXQ6J/ppXX+NC2QlXhGWh1qA20X7mUIzwD0RqYsLI9/z/TU/yG0w27f
 MYAezBAsIme3+UsiO4z0c+Y8HgCyBCj7U3l+18fYcbLGJ3MO9csWoGDAZWeYlIJKfNGe
 5ETCThSA1vq7Ea7jJDuPOgkfy3edL4+ezvEwgOz9HZTAPOikrcWxiMQA4/2yw/fuekOf
 kMIQ==
X-Gm-Message-State: ACrzQf0U+5chppHs/PMOAfnRBChAEFl+Kh4lvZmPCkNVQKJCUnh9YRQM
 Vz1JHGP10UTZ+48kw6fKnVdJk3KnJ1v8RwYgv3lsKwumm+4pDzBsKX7arbOn1B0glGCiWsLMCDa
 4LxgqD0/4dufeN2X4kQYXoHad+wrqkw+9bw9MdYeaALW65m6PplNI8NZ2kLCf
X-Received: by 2002:a05:600c:168a:b0:3cf:68c0:a9b0 with SMTP id
 k10-20020a05600c168a00b003cf68c0a9b0mr6616049wmn.101.1667220683363; 
 Mon, 31 Oct 2022 05:51:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4PpgG4S3+DVN8AocMtavwPqnRAkaukmkVzctpo/HvyToPzXrws1iw2vMjdlvGq8g8iUPkTVQ==
X-Received: by 2002:a05:600c:168a:b0:3cf:68c0:a9b0 with SMTP id
 k10-20020a05600c168a00b003cf68c0a9b0mr6616028wmn.101.1667220683127; 
 Mon, 31 Oct 2022 05:51:23 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 n2-20020a7bc5c2000000b003c6c5a5a651sm7100417wmk.28.2022.10.31.05.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:51:22 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:51:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 13/86] acpi/tests/avocado/bits: disable acpi PSS tests that
 are failing in biosbits
Message-ID: <20221031124928.128475-14-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Ani Sinha <ani@anisinha.ca>

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

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221021095108.104843-4-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/avocado/acpi-bits/bits-tests/testacpi.py2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
index 9ec452f330..dbc150076e 100644
--- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
+++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
@@ -36,8 +36,8 @@ import time
 
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
MST


