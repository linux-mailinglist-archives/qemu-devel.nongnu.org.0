Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD80613776
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:10:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIV-0002q0-33; Mon, 31 Oct 2022 08:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUID-00013j-OJ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIB-00037C-V8
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E46n5gR8gy27RpCO2F1FgPBTeu/ARkeNqN+Q8EnBok8=;
 b=WgiqqfR5++8cFspv3LAfnjVnc0YwVy9ysUM9tej5tykFz3zzE/u+gBevWpkqG7WRqYRmGd
 BQHUXSQt5BAwr5ZgYLg2avz009Qm31sgFGkWpeZ9by2h/ejsLpjEY5BB4z2SSMoAWpmfeX
 y9yxg9GhgWSU9R0fAGq/ap/tkYvP1Ls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-pJ9TpOPuNNCrRrowu2LQLA-1; Mon, 31 Oct 2022 08:53:22 -0400
X-MC-Unique: pJ9TpOPuNNCrRrowu2LQLA-1
Received: by mail-wm1-f69.google.com with SMTP id
 az11-20020a05600c600b00b003c6e3d4d5b1so5258186wmb.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E46n5gR8gy27RpCO2F1FgPBTeu/ARkeNqN+Q8EnBok8=;
 b=NCSkZyPowDV9k4oTvYd/dlyXNrquxdWb1WLFl2U7Aaq6exId6jKs6gfusPqDJjKhjZ
 3l3dHIvATqLexK6mVv0PUC+T/otYJhr7OX8cmsIEeTwEf9HGZvJLinBjN2jbA9IjFZVR
 MExVmGQOE8qSt962LbSJnzx2RDcadFDRmLy9enC00J30XZYlZJ6WATGngLcvFExyBdbe
 qXhleqCz8TeVa/zRfjmOepMuG96GBMwzgCfc01qQIH4ZC86pFy62kBymMspJOv3AvdN4
 NAsAw7MCfYNLcGABQCJ1gJD0eKg4pZ1920RJPSj1/74SpdVeOMZuqTyCGDSQNDjna7A5
 //4w==
X-Gm-Message-State: ACrzQf2d56ICGz7XI3NgzGZ7nALL53BLvPyF1uoBs7iB+//dmxUjpfC+
 EjQRwIhSwQ/Ycr+VDW2QiGDmINshF5CyfW/9pUtEiNwx2yOvf9S45M9JUIdMM16qB+D6VWphN9L
 yQWvq0/pFczkN1qlAy1rkNLWb30JlF/poQ3YgnB2zdM1XxYjMw3U0SLPJXIx6
X-Received: by 2002:adf:f4ce:0:b0:236:6578:48b2 with SMTP id
 h14-20020adff4ce000000b00236657848b2mr7897150wrp.181.1667220801316; 
 Mon, 31 Oct 2022 05:53:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7FibYHBMcOy4952M3cBC+IXaPWPjiwIhLJ5jDY62TjBnIkEeCpiYPTY3kgmWs6ItVeIQbudg==
X-Received: by 2002:adf:f4ce:0:b0:236:6578:48b2 with SMTP id
 h14-20020adff4ce000000b00236657848b2mr7897130wrp.181.1667220800964; 
 Mon, 31 Oct 2022 05:53:20 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b003b4868eb71bsm6829814wmo.25.2022.10.31.05.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:20 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 55/86] tests: acpi: whitelist DSDT before generating PCI-ISA
 bridge AML automatically
Message-ID: <20221031124928.128475-56-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


