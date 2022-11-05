Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493AF61DC89
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:36:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpi-0008Il-SK; Sat, 05 Nov 2022 13:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMo4-0007F3-7S
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMo2-0007e0-Gg
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WMGHKMTuV3NWmf5zc/IrtRbi4j/EPK5ANMvuhukrkpA=;
 b=MF4RmXTM8FKmRaej4pkXaukkVpW7rQCWe+bEP64KHnhxnrJJQdmXYzv9W4WJ7C2Jm/R2kJ
 YHBRqyI/8yGkA+taVP88kEnaLkkv+uJRrRy8DcNIETVhoZzEeHJV4GPglNTw+2RN3TNoD9
 q0YO01XysSP1bM4sfeYdAsK6jmsTd7A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-332-jXt7SwTmPLaI_EdatJNEzg-1; Sat, 05 Nov 2022 13:18:04 -0400
X-MC-Unique: jXt7SwTmPLaI_EdatJNEzg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso6009560wms.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMGHKMTuV3NWmf5zc/IrtRbi4j/EPK5ANMvuhukrkpA=;
 b=Rmc0XVlr3GpgzJechug9xfdGsuDVZeDhhId76px9u74pdgNWvKOlNbb5SatR1cezsJ
 iBYWPBzzQ+Zx3R+pkG9cWr4C+J3+8Xp7N7KcBatF5ay7AXECITY7UooKWCULQo+bkmWB
 61O4bnqo5gEUPP38bsCa/4oXZXYE5wazKExBP8qhx06XJyGCnFHkpSTruXdonm4phquf
 T7vKSv4pS2S4izT3qkuvj2HKjY4pyk/hMWCXk20beavwIyAhN6f33ZJbQht6i4QVKLe9
 XoFoJC6zW2ZMc6uQVUI9JFkWqi79xjD/sj0qsxN0tB8YZMoXjeJhBDEYnLflHUIwd7/V
 rQLA==
X-Gm-Message-State: ACrzQf0/fJ521+dED0xnHEGV8u+sXcmpE3VToFRLMaMX7VXvU585C1zZ
 rjatU/oxwk95vX957fTrw9NTTivXLDjcqm349DKRkAKrx6a0VjccCn7Ayt+Da0mPNuH2TPG3wzl
 ZjQGMJ3OUjemeJxRIVTofuLiw8Is3Ajb4j9KjWjGp25LHVt/C79HaN3XY7GGo
X-Received: by 2002:a5d:6d89:0:b0:236:7d7d:1e79 with SMTP id
 l9-20020a5d6d89000000b002367d7d1e79mr27249792wrs.673.1667668683463; 
 Sat, 05 Nov 2022 10:18:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4p7pejhXbu8pzNMwzi5tCG/yO/mFs/YzD0WZkZt8xuRQ4QB95VHax4gtYP1iqMIE71CLZAmQ==
X-Received: by 2002:a5d:6d89:0:b0:236:7d7d:1e79 with SMTP id
 l9-20020a5d6d89000000b002367d7d1e79mr27249780wrs.673.1667668683227; 
 Sat, 05 Nov 2022 10:18:03 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b003cf87623c16sm7188541wmb.4.2022.11.05.10.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:02 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 53/81] tests: acpi: whitelist DSDT before generating
 ICH9_SMB AML automatically
Message-ID: <20221105171116.432921-54-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-6-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..fd5852776c 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,22 @@
 /* List of comma-separated changed AML files to ignore */
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


