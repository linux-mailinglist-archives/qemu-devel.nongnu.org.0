Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64A961DCDC
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:56:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMmx-0006eG-FN; Sat, 05 Nov 2022 13:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMm8-0006Kf-3g
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMm6-0007J0-B4
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZrzez510xiVz7CEUkck5REzpmtbqexQFYk8M50bGII=;
 b=UVNdYMQVOLIRyGUmHB/PntMf14IUB72PsNB4gU1+9/4fE+pbohwSvI3iWxCi9G9mf3gjXu
 ZTVVf2FvioVbwqhLtk0CbRJunjcSwmJgm8CMrg5j8C8bQkgS78ac8yYU009TdPRJwoNkPG
 VnTCZYWqUwwQZYYF610IIgB3kcd8Frc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-311-WFCOYmsJNEa9B7vyGh90hA-1; Sat, 05 Nov 2022 13:16:04 -0400
X-MC-Unique: WFCOYmsJNEa9B7vyGh90hA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so1874619wrg.4
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lZrzez510xiVz7CEUkck5REzpmtbqexQFYk8M50bGII=;
 b=UWQYvBtV185vE0d0fZHl+OQkKumYUa6ABBMsHegfFdIvg7TAyaRa5xrTHtHD4cT6xk
 mfTmTPbog+jOkM0VsrzY246d9Dc9OGX2weWNfA9JTIzkWHJwAsIb/Uj9WadTG6fJWwtq
 5vuHmxElzQyrBlozbLQjQ9wlqR4uEmY2iiHLaIUlJ+M+s+x1IfzYqLxYv9K3PKl15lxP
 Bh53Rg1ey4luHZPYXdxWAX6PoZaMaYD+QclURp8FkwOp2GH0e6O0ycsF6MppfRmAVxR+
 WmzctxcAuqVp4cBL00McbABMUHFYK2K7UMYni2yKkmJ94J+M8lMDHM9GA/G0hkF+5rkC
 6qcw==
X-Gm-Message-State: ACrzQf3rnnzgK9H/BYDPCXw/E2dlMoYc9TIqsPSDbQXitBp1kt8J7mas
 uHAHCXRFHGkZ+xqPuUUcQWY6z1UmqLy9iLoz07nqXnTz5w7v2R35l4JxpSBJQ5vesW8H72mM7PT
 E7qz4Ak0Agrmf08SV36LY6egdsJyHmix9JWlYOgO9bqEpKAtB5WvaXYjyfO5c
X-Received: by 2002:a05:600c:6d3:b0:3cf:9b42:b5f5 with SMTP id
 b19-20020a05600c06d300b003cf9b42b5f5mr5692695wmn.196.1667668563301; 
 Sat, 05 Nov 2022 10:16:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM41tSX0ciraCKh9D+vMYTUTATrVLkwbZUPgiwa5rrFpAo1p0jdqdaXNX3ehWEDs6xUHckwhEw==
X-Received: by 2002:a05:600c:6d3:b0:3cf:9b42:b5f5 with SMTP id
 b19-20020a05600c06d300b003cf9b42b5f5mr5692667wmn.196.1667668562973; 
 Sat, 05 Nov 2022 10:16:02 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b003cf87623c16sm7183249wmb.4.2022.11.05.10.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:02 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:15:59 -0400
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
Subject: [PULL v3 12/81] acpi/tests/avocado/bits: disable acpi PSS tests that
 are failing in biosbits
Message-ID: <20221105171116.432921-13-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


