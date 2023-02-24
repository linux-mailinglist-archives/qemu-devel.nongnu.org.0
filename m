Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8486A1EAF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:39:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9U-0003pc-Cv; Fri, 24 Feb 2023 10:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9P-0003mz-U9
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9N-0006yx-TS
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+CkdU6npu94v51QXTwdbx/OtEM7l/t3FhsyRR6kpoY=;
 b=MkJH0WIkHQMfGVJoboNjLEciWOde3kTBelrTJdxpsfVoSXcX95jM+SrJpLItJcLpFBq8EJ
 EfGjfmax2Damfs59nS3AqRt0wFfzjK1c+7vWv+aF8eTUdMCF5rccMu4/RayISsJNRN/oXw
 CFy0OCypEiDs+Q7C1jAVzPCNEZOV9pI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-LtfyVlxuP36RTEyPCF2HtQ-1; Fri, 24 Feb 2023 10:38:19 -0500
X-MC-Unique: LtfyVlxuP36RTEyPCF2HtQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2506985D185;
 Fri, 24 Feb 2023 15:38:19 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A5CA492B12;
 Fri, 24 Feb 2023 15:38:18 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 05/33] tests: acpi: extend multi-bridge case with case
 'root-port, id=HOHP, hotplug=off root-port, bus=NOHP'
Date: Fri, 24 Feb 2023 16:37:44 +0100
Message-Id: <20230224153812.4176226-6-imammedo@redhat.com>
In-Reply-To: <20230224153812.4176226-1-imammedo@redhat.com>
References: <20230224153812.4176226-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Following corner case wasn't covered:

  -device pcie-root-port,id=NO_HOTPLUG,hotplug=off
  -device pcie-root-port,bus=NO_HOTPLUG

when intermediate root-port has explicitly disabled hotplug,
all hierarchy below it is not described anymore (used to be
described in 7.2)

So as result we see only NO_HOTPLUG root-port described

  +            Device (S50)
  +            {
  +                Name (_ADR, 0x000A0000)  // _ADR: Address
  +            }

and no children nor notification chain for them are being composed.
Follow up patches will fix missing leaf root-port descriptor
and notification chain that should accompany it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 5128b62634..638a193e13 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1061,7 +1061,10 @@ static void test_acpi_q35_multif_bridge(void)
         " -device pci-testdev,bus=pcie.0,addr=2.4"
         " -device pci-testdev,bus=pcie.0,addr=5.0"
         " -device pci-testdev,bus=rp0,addr=0.0"
-        " -device pci-testdev,bus=br1", &data);
+        " -device pci-testdev,bus=br1"
+        " -device pcie-root-port,id=rpnohp,chassis=8,addr=0xA.0,hotplug=off"
+        " -device pcie-root-port,id=rp3,chassis=9,bus=rpnohp"
+        , &data);
 
     /* hotplugged bridges section */
     qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr1",
-- 
2.39.1


