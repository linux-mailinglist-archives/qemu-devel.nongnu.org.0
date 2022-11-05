Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9777F61DC76
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMq3-0000GI-Qm; Sat, 05 Nov 2022 13:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMop-0007Zp-UP
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMon-0007mG-Bt
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vyFquoWhRBqop6d2QQCGoBYPqIvepuw7IXNadOdimWY=;
 b=begvqJr/kQNFl9W/ISh/dfB1GgkMeZUTJuPxDksXrNcplYqT02lSVbQj6dyG8HsQU83IHT
 qaU6JkHnjUC7zZSiR51YLK3gyQDyXmrqI2Ag3tPqZv5nE5UeYSAda8C8L2rtLPJ3Ka+t1e
 TN0bI9BiiUkVN1pwW5QH80wBux6tjd4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653--Xj8eLfWOCGuTMDOlF6JFw-1; Sat, 05 Nov 2022 13:18:49 -0400
X-MC-Unique: -Xj8eLfWOCGuTMDOlF6JFw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso3838752wms.5
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyFquoWhRBqop6d2QQCGoBYPqIvepuw7IXNadOdimWY=;
 b=0E01Mbqy3iG5bgj6/zaVl/y9ML5ej6clnDyb6SXDjXMOBez7mgjhYM+GVRn2K78DMd
 X9bkjoOHYxO0XdBiS9QpyMTH0bedz5LdbH2Hu48ylvWZ2jMN3jNpXHWyfLR+IXQxvMxG
 /J6q2PI+6SF+iNYWRY0ljArKRauUPTJhKqi/MJ/4U1fDcYg0/wM3QdDycnkHBuDJme+u
 JU7K+UiZSe3oegqnpWZ6yRLacp6IXlQ/RNqJQFpXpn7H6mjWprLdofNLnfg4ryb9+o9x
 60NYUeX+ftSK8sMaekl/vH9rqM6Ra7kWoXCpZ4NdV7IYjx3BgMn47w4MMBWpAJBEePpO
 Q6bQ==
X-Gm-Message-State: ACrzQf3S7au2a+lvIeuQZymoY/E+dVTdeEQ+W/z8rv1HPF/kyD8UIDDg
 d8rTJ6XCX6ZNRyI8zPnXLqGvLmRVYdMhT/0cQpKaW1RciFn9zvObftsgw8V7ttrNlw1XtesY+D7
 XF5DRE+ZJ3/Td7abdzpU+n++FpJC+eL6lLg46QzP44fJrlupW+7bEk1ITUFRA
X-Received: by 2002:adf:ebd2:0:b0:236:d5d6:7dab with SMTP id
 v18-20020adfebd2000000b00236d5d67dabmr20575280wrn.595.1667668728151; 
 Sat, 05 Nov 2022 10:18:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM50ijNvYZ+n6zASO14CtEu+3iLbdz1vATCQugLeJDwg6wWbJrkeyvecHkmkC6EZEwMne1sT2w==
X-Received: by 2002:adf:ebd2:0:b0:236:d5d6:7dab with SMTP id
 v18-20020adfebd2000000b00236d5d67dabmr20575260wrn.595.1667668727778; 
 Sat, 05 Nov 2022 10:18:47 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 w2-20020adfcd02000000b0022ac672654dsm2585565wrm.58.2022.11.05.10.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:47 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Brice Goglin <Brice.Goglin@inria.fr>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 68/81] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
Message-ID: <20221105171116.432921-69-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

From: Brice Goglin <Brice.Goglin@inria.fr>

.. which will be used by follow up hmat-noinitiator test-case.

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Message-Id: <20221027100037.251-3-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h   | 4 ++++
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | 0
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | 0
 tests/data/acpi/q35/HMAT.acpihmat-noinitiator | 0
 tests/data/acpi/q35/SRAT.acpihmat-noinitiator | 0
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..245fa66bcc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/APIC.acpihmat-noinitiator",
+"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/q35/HMAT.acpihmat-noinitiator",
+"tests/data/acpi/q35/SRAT.acpihmat-noinitiator",
diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/acpi/q35/APIC.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/HMAT.acpihmat-noinitiator b/tests/data/acpi/q35/HMAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/SRAT.acpihmat-noinitiator b/tests/data/acpi/q35/SRAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


