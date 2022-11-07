Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F4B6202CD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:57:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxo-0002wx-G5; Mon, 07 Nov 2022 17:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxm-0002sx-PE
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxa-000428-0G
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E46n5gR8gy27RpCO2F1FgPBTeu/ARkeNqN+Q8EnBok8=;
 b=VM9HgLrHczpnkn+YV2y67EM9Ec52l8442bTaT/A4o1qQ1Ll/JTqls2GyfV6fa4iUlsXe+z
 16rnezwsygUTLq9zrDARgnjJVQF3PyApDgu7kpcoEoy38e0hLA73TUK6oZipt8iMkGwc2A
 1eUj13ZulY0qoVjLszCIgAm4s5aFaFs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-Zf7WgYAZPBiORZRPAcqT3g-1; Mon, 07 Nov 2022 17:51:16 -0500
X-MC-Unique: Zf7WgYAZPBiORZRPAcqT3g-1
Received: by mail-qk1-f200.google.com with SMTP id
 bs7-20020a05620a470700b006fac7447b1cso4429500qkb.17
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E46n5gR8gy27RpCO2F1FgPBTeu/ARkeNqN+Q8EnBok8=;
 b=21YdkHoS+1C6coN+HoCEA4hlpd0q/O1SLHax9cvdYvrgz7PjnM9m1Gxi0HyS9ePPNJ
 WAOgNU3b7Ar8LPd8wmuQC5p6v69mpN+6TXUkcdT1G7tdpRwg9I4+iQkpMjGASUqziZ7B
 OgqHmLb84N9NBVuevw5kdRHIaW/XOjqu1OKgPCvkn/aw3pKXLy3NbT+UtC6xTg76jWh/
 FUCYVlu1p8EX3dUBsJmtq+AdkXhF4DIARKM1C0zGYZ/heswyil9ifmKW3o/QZXwM3OXh
 A9rQO5/H0+SkHL37iahB7eNjTuE0xi9Yjkj1dpenAAOLuMjMxqI3kq4Qrw2Gq2aWB2UT
 YKGQ==
X-Gm-Message-State: ACrzQf2Jn3WFfHN4hiQpGiJaYjbIkFmZ4oa8b2hQtROO90INyvVWb6tQ
 k0BVkUrr9owcL3WuWwf5PM6ZXSD0g8zvf+TiYdCy5Krb3g0JeiO1GNmLFdG13gXI6KGdvAuUczI
 r3QjSrJ8zGUplmiH3faQljhpBLfDgsm6IkCaM0Ex7tHsw5j25CQYVPC8DSXAC
X-Received: by 2002:a05:6214:2b08:b0:4bb:bd9b:64e9 with SMTP id
 jx8-20020a0562142b0800b004bbbd9b64e9mr47381583qvb.53.1667861475639; 
 Mon, 07 Nov 2022 14:51:15 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5NrUFXQ/FR/a+vRsxkVUbTq3n60ekUCxKTyUyaDPD+sEGFMyMoHyLa3Q8Ac/AUcO0CN3Mgwg==
X-Received: by 2002:a05:6214:2b08:b0:4bb:bd9b:64e9 with SMTP id
 jx8-20020a0562142b0800b004bbbd9b64e9mr47381568qvb.53.1667861475394; 
 Mon, 07 Nov 2022 14:51:15 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 d1-20020a05620a240100b006fa00941e9dsm7943054qkn.136.2022.11.07.14.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:51:15 -0800 (PST)
Date: Mon, 7 Nov 2022 17:51:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 45/83] tests: acpi: whitelist DSDT before generating
 PCI-ISA bridge AML automatically
Message-ID: <20221107224600.934080-46-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


