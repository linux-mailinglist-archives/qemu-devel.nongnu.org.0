Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B43719D107
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 09:17:58 +0200 (CEST)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKGaT-0000d8-I2
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 03:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jKGWU-0003ji-9B
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 03:13:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jKGWT-00042I-4X
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 03:13:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44383
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jKGWT-00040u-1B
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 03:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585898027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOxDemA543fI2L+xh6FprjzhpIkpNUjunEo/98XltUM=;
 b=BwlUSEU/Rrkl44stmGa0rZRxc0fXcyoKeu3G/RGZ5dVTyl2Nuviev9tfOcazhVl/Ql+E6P
 YZ0VkEt+7ODsWKuJt7qu7xL9p4SO8oz9S6iVmyuZpBSTJ/jwmon3nbf2RVoKvuCAnHLtqH
 L58WdVdDpzV27XixItcdM/HqPz4ArV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-Jv0KwsV9PPiQ_95d1iMhrg-1; Fri, 03 Apr 2020 03:13:43 -0400
X-MC-Unique: Jv0KwsV9PPiQ_95d1iMhrg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2663718C8C00;
 Fri,  3 Apr 2020 07:13:42 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B4A348;
 Fri,  3 Apr 2020 07:13:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v4 02/12] arm: pmu: Let pmu tests take a
 sub-test parameter
Date: Fri,  3 Apr 2020 09:13:16 +0200
Message-Id: <20200403071326.29932-3-eric.auger@redhat.com>
In-Reply-To: <20200403071326.29932-1-eric.auger@redhat.com>
References: <20200403071326.29932-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, andrew.murray@arm.com, drjones@redhat.com,
 alexandru.elisei@arm.com, andre.przywara@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we intend to introduce more PMU tests, let's add
a sub-test parameter that will allow to categorize
them. Existing tests are in the cycle-counter category.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

---

v2 -> v3:
- added report_prefix_pop()
---
 arm/pmu.c         | 25 ++++++++++++++++---------
 arm/unittests.cfg |  7 ++++---
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/arm/pmu.c b/arm/pmu.c
index d5a03a6..0122f0a 100644
--- a/arm/pmu.c
+++ b/arm/pmu.c
@@ -287,22 +287,29 @@ int main(int argc, char *argv[])
 {
 	int cpi =3D 0;
=20
-	if (argc > 1)
-		cpi =3D atol(argv[1]);
-
 	if (!pmu_probe()) {
 		printf("No PMU found, test skipped...\n");
 		return report_summary();
 	}
=20
+	if (argc < 2)
+		report_abort("no test specified");
+
 	report_prefix_push("pmu");
=20
-	report(check_pmcr(), "Control register");
-	report(check_cycles_increase(),
-	       "Monotonically increasing cycle count");
-	report(check_cpi(cpi), "Cycle/instruction ratio");
-
-	pmccntr64_test();
+	if (strcmp(argv[1], "cycle-counter") =3D=3D 0) {
+		report_prefix_push(argv[1]);
+		if (argc > 2)
+			cpi =3D atol(argv[2]);
+		report(check_pmcr(), "Control register");
+		report(check_cycles_increase(),
+		       "Monotonically increasing cycle count");
+		report(check_cpi(cpi), "Cycle/instruction ratio");
+		pmccntr64_test();
+		report_prefix_pop();
+	} else {
+		report_abort("Unknown sub-test '%s'", argv[1]);
+	}
=20
 	return report_summary();
 }
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 017958d..fe6515c 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -61,21 +61,22 @@ file =3D pci-test.flat
 groups =3D pci
=20
 # Test PMU support
-[pmu]
+[pmu-cycle-counter]
 file =3D pmu.flat
 groups =3D pmu
+extra_params =3D -append 'cycle-counter 0'
=20
 # Test PMU support (TCG) with -icount IPC=3D1
 #[pmu-tcg-icount-1]
 #file =3D pmu.flat
-#extra_params =3D -icount 0 -append '1'
+#extra_params =3D -icount 0 -append 'cycle-counter 1'
 #groups =3D pmu
 #accel =3D tcg
=20
 # Test PMU support (TCG) with -icount IPC=3D256
 #[pmu-tcg-icount-256]
 #file =3D pmu.flat
-#extra_params =3D -icount 8 -append '256'
+#extra_params =3D -icount 8 -append 'cycle-counter 256'
 #groups =3D pmu
 #accel =3D tcg
=20
--=20
2.20.1


