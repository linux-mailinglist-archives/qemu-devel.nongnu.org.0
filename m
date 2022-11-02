Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F8261683D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:17:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKk-00016Y-5x; Wed, 02 Nov 2022 12:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKQ-0000jl-Co
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKO-00038Y-8R
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E46n5gR8gy27RpCO2F1FgPBTeu/ARkeNqN+Q8EnBok8=;
 b=YtfU/YVQAb4uH9jOxjNDKI7gLJxk0uX7iHgI4KchpYBVbio535VJeRm9B6JRXURD+L4Ewx
 96EZ3f3eCoWsRVHxjmBWUQSaElJ/q4yCyQV0KLuLCkczQwyc56W1zy6f1g7Cy2qYjIrxf1
 fLycYGwcicrxG768sWQF6vZAWmrTUfA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-u7Of3elBNGC2j4Ec0dI1jQ-1; Wed, 02 Nov 2022 12:10:54 -0400
X-MC-Unique: u7Of3elBNGC2j4Ec0dI1jQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z15-20020a1c4c0f000000b003cf6f80007cso647704wmf.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E46n5gR8gy27RpCO2F1FgPBTeu/ARkeNqN+Q8EnBok8=;
 b=T/bvse8eMzd8s+sBc6rI4AhLbFpgsN2UgQgjzUPJbfKD0vDKZXait+s9zAR4F0+AHo
 UnqUMl1cwkBTowh6JRxqzG97xFlC1IoE+pahygGri2If019ppwQnFq2NAw2+eiy+6j4s
 OXOD3AcbK/YpKrzdfNECe2dzwkEm7mye9Uat83UBVvIH/FbcGiYFNdlMH1lD0/qzsXVr
 nNJbtTCxs/NQ6TxsUsvMwFacnrmgeUh5mKUrjqMKba9P0YfIptoRbGyAMfbFRmrT2L9n
 Ab4H4Z67naND/1eMCWLAiwSV2aW6zOTR6RsrbGyonJiOhxXJDRiB8xoHePAm22xe/Q1W
 8t5Q==
X-Gm-Message-State: ACrzQf0MEVb9gsrSVNoHhtw3aUsZtYlZztmGRpgDiMlAFypgk/wQ2966
 f2l5cmU266gUHhkSvV75DOXH89QfNYspdHksClX6waxhX0O/+5UEmms/sNbQDGhbOH9GpYuPh/0
 W8zw+voPD9L1Uv417S4+at8WB5ArxoFdAQgHlkCVWQqKRAznRXiOvgVu954PD
X-Received: by 2002:a5d:534b:0:b0:236:73ff:3605 with SMTP id
 t11-20020a5d534b000000b0023673ff3605mr15308555wrv.521.1667405452704; 
 Wed, 02 Nov 2022 09:10:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4d/av3igVjShKFNifu7Rx9q0sGJBCZ9PTHrmNPxpqYEvkN8sBOITZO3oMX1QMAJ9/FNOQKTQ==
X-Received: by 2002:a5d:534b:0:b0:236:73ff:3605 with SMTP id
 t11-20020a5d534b000000b0023673ff3605mr15308532wrv.521.1667405452462; 
 Wed, 02 Nov 2022 09:10:52 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d5544000000b002366fb99cdasm13124240wrw.50.2022.11.02.09.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:52 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 53/82] tests: acpi: whitelist DSDT before generating
 PCI-ISA bridge AML automatically
Message-ID: <20221102160336.616599-54-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..570b17478e 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,35 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.applesmc",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.ipmismbus",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
MST


