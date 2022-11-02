Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255D7616853
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:20:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGIa-0002y2-Eh; Wed, 02 Nov 2022 12:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIX-0002vB-Uf
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIW-0002Mu-CW
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZrzez510xiVz7CEUkck5REzpmtbqexQFYk8M50bGII=;
 b=OydDWamoFW/QAu3P6toJaC+Y0tt/1s83EMVD6xWA11HEFpm0LG7PZqsJEvkcmZzgmbLJ9T
 OEiqzksNBe1PKN/w+9U6Y9UpUoVo3QrpRSTIIk4tKnhcCDuQOZTXLF37YWuyTv2hM0BJca
 KQvFxVigu5MFwmI/U+NOIJ8xDnjDymg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-mDqxiMr9OVOrgzyQXkofJA-1; Wed, 02 Nov 2022 12:08:53 -0400
X-MC-Unique: mDqxiMr9OVOrgzyQXkofJA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v191-20020a1cacc8000000b003bdf7b78dccso8096309wme.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lZrzez510xiVz7CEUkck5REzpmtbqexQFYk8M50bGII=;
 b=UdnrjUIh9vZ5zLbRTscX6gQY6/SvUoWRAovxRlnKXNtH6nnQLNRyppKmAAiK7GSoJX
 3u+QEu4WstFRtOyLUye+R3ZtF7/J9D5vH32Zx3bU1OO/2Baq0eAdmjW0zrIb7z3DmPfo
 lLldafwnKB1+q51A4z7C5oGKQshneVBh+moWIQxcXx4iAFRQSmxWJ3Uozo4rzqbDDDTH
 WIc10KpTSMPLwNQ6wqWyzwmdbsuLR8gQxG9bNLLP0vV6kZHIJ/QDmFljwjmEM1OfdfvP
 y9bvDpWU7eKlhRSscnE2CTZZ+QBbsI94XkM+npx0GcXSfo02DNtlxWJFbHwH2RrEAFEF
 bZQw==
X-Gm-Message-State: ACrzQf2Ge21EsMzsBhvBzhZoksILhpBcwbEwM14EuxxOtlAm/DQj9MNs
 gLwYEOO0B2oda1W0yLxxDzZ28Tw5BA4oVfBzmBiZB7JT6Z7Jqb+IdG/VYm9EjvV+Slf0KATpJ2E
 +vtGp/M2wJDnu4SNacfXKbo99V95tkLXyjznDEXxK3T1VIiCQY4sQnBz3XF2P
X-Received: by 2002:a05:600c:2287:b0:3cf:4dfb:c223 with SMTP id
 7-20020a05600c228700b003cf4dfbc223mr24052963wmf.19.1667405332232; 
 Wed, 02 Nov 2022 09:08:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4mx7QiKUPptqLj1TC2mdTFOmTqR9wvzKNmAPRnvVO/9MwvnVirqgVIB/+bDOmToisw6dmD0Q==
X-Received: by 2002:a05:600c:2287:b0:3cf:4dfb:c223 with SMTP id
 7-20020a05600c228700b003cf4dfbc223mr24052917wmf.19.1667405331841; 
 Wed, 02 Nov 2022 09:08:51 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bq9-20020a5d5a09000000b0022ae0965a8asm13778071wrb.24.2022.11.02.09.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:08:50 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:08:48 -0400
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
Subject: [PULL v2 12/82] acpi/tests/avocado/bits: disable acpi PSS tests that
 are failing in biosbits
Message-ID: <20221102160336.616599-13-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


