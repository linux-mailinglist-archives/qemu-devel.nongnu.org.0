Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940166AFC07
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:17:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMd-0007uR-6g; Tue, 07 Mar 2023 20:13:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMa-0007iL-5o
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMY-0001iA-A0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m5rr5IpPPDGOUsKcdUwoNYKsT4lBju+PDcSDFh4/Yw8=;
 b=V/IE3M2SDYp+OoqHwwQ97udxJ/PdZzEMJFJk681Uq9p2uQj5L+QnstoI1OVnvlKdRn2fvM
 3cnWDZeh9nf6JnLDmAxwa24jDWUoIE2o6erHanuJo42yzQpCSef5EMAIjJs2XBB/VPfYSe
 3OIu9poGtcQ/KE6mwc80A8SZFP7uQL8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-JP1oaIFBNzOQ8SP6WUlwSA-1; Tue, 07 Mar 2023 20:13:00 -0500
X-MC-Unique: JP1oaIFBNzOQ8SP6WUlwSA-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee15-20020a056402290f00b004f059728d91so4496598edb.23
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m5rr5IpPPDGOUsKcdUwoNYKsT4lBju+PDcSDFh4/Yw8=;
 b=n9PN1eYiWwQLFq2mX4AmTx5vwTeX/SYgIl4APbVAG/1+TZmlyCm7qSV6mst1ubnvar
 28Tzmavu5RjA9HgfypwrSWmwNYR5amImVxuSHb3EeKqZMuxnxUIT9aH6aMkswWKTjBVe
 WDpuoNb6ljaBSHYmhVyDULqt3ohkr8MCd4QnSrP5lh0ICvqq2ri2ZvHNIIUmywZ5zLyr
 abtNzKCuYjLAK8u5GZkt8IZBdPAfSZEzkDAo3wMdw6zPXz4ylUxjs05BbJmZXNs1cXMR
 yjNgQK0d/ZFlMY0anMk+ZrctMwFrw1Lfxe1S5K0r/NAaRF4kQp9ESMqajkKLWL44K7q0
 t8cg==
X-Gm-Message-State: AO0yUKVVLXcb9VordfoCKHbYAlAcSm4mFBpV+uuI8Lq60lqjCZb1PV+Y
 JWVmAcl78ViWD7+bW3maYzznJeKZacwpcTaEPMUJ+3JXRaF2fEZpbuPEGsdzuV/I4pmpxAgjdzh
 Tedy/KkRimlzXf9acFCA+GivyvqWQqo9ZjXKhVE5PWfA+NTqZ2lTE30DV6puP7JfFIDcW
X-Received: by 2002:a17:907:80ca:b0:889:58bd:86f1 with SMTP id
 io10-20020a17090780ca00b0088958bd86f1mr16831636ejc.14.1678237978919; 
 Tue, 07 Mar 2023 17:12:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8PHsO9Ff6WORaBQ9SLBJQpe7g5MB3HdOfm3an1njmir1YCoYJUHiQRxx6CanDMmyO1UpO+nw==
X-Received: by 2002:a17:907:80ca:b0:889:58bd:86f1 with SMTP id
 io10-20020a17090780ca00b0088958bd86f1mr16831623ejc.14.1678237978701; 
 Tue, 07 Mar 2023 17:12:58 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 rp21-20020a170906d97500b008de50990fa7sm6731741ejb.21.2023.03.07.17.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:58 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 42/73] tests: acpi: whitelist DSDT before adding EDSM method
Message-ID: <d6cfe1d834ec219df6b0034112a33f0dd202d2ec.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-17-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..8911b10650 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,38 @@
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
+"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/q35/DSDT.applesmc",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.core-count2",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.ipmismbus",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.noacpihp",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
MST


