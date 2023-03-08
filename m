Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038ED6AFBF7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:16:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNG-0001Fj-Pt; Tue, 07 Mar 2023 20:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiN7-0000pg-QG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiN5-0001uS-Kd
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dYqHvsIH8FToDb11McSEqIC0K23NImaszE63Tu3v/ug=;
 b=XudCQLUdODnSKAOE9+ZAVcqCxDP7DNzL+mQu6wzOMDcEjymR7eyPZItOvzKqoB1zR7vHNq
 kFctcPYKfCvNyqZ26Uqmr/6mpxDth5haOHXyu7bNyjnzv3eYd6kJhMBE3ZX6LZX/vQVfss
 QvhssbleJShoa3xaqoSoZaA6AuzSN2M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-cmlgmCoRNrGSyGGxM8clmw-1; Tue, 07 Mar 2023 20:13:32 -0500
X-MC-Unique: cmlgmCoRNrGSyGGxM8clmw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y1-20020a056402358100b004ea439d57b7so9289441edc.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238011;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dYqHvsIH8FToDb11McSEqIC0K23NImaszE63Tu3v/ug=;
 b=WYcRqJRCL1ESJaaqwjThCnt9d76bq+fcSxSlFhNk+Xdcx0SIzNyQYLonXcKHYcvFVE
 xFCka8b07PcOCBq08aoBbZ4T24rPChf5CqEe6ldyg51q319R21UQsa1/LDV/wv98vnYf
 Yc+dwi48ryB9KbmBZgquiJtMmzIth51yOSi10tGtq+GyFAxwXxZnAQNrXDE/n+onmZux
 Ir8KhRz/c+F7PRImKz4QZCDGeynNbPmFN+/Iu3OPRcqVSXSFRBKv/Ps9uA5xeQn7joJ5
 WEeQVk0LgujiKDlBXP4uObX3Y52745iC5WA3cZDVEH8s1F5zQ+C1JhkTY2Xrki+qHmID
 hNdg==
X-Gm-Message-State: AO0yUKWRK9+FncBILxOWXkdi2Vostd7nH+mNxmlWqkJlJWJL/2Yb9fK7
 y0zHOL189QF+dFo69up/i4pDm/59LrNhrrNhSH4MDjeXuYveoL+aGG0RBhxXYgZPqlfSsrnockQ
 Spr8QP9Ke+yp7JYeeNOEUphFKoWPoVQSKvqaAc5zO+nl/36oFOiT1K4TYbmQXleydExo8
X-Received: by 2002:a17:906:2297:b0:8f8:1501:be60 with SMTP id
 p23-20020a170906229700b008f81501be60mr13666825eja.7.1678238011373; 
 Tue, 07 Mar 2023 17:13:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/bDVvUmLPbYXen7PYZ9gvr38X89+BLOhcqqx8FJbMiwLFDwSrf59y1oTE7NB7+p8MRXKnAOg==
X-Received: by 2002:a17:906:2297:b0:8f8:1501:be60 with SMTP id
 p23-20020a170906229700b008f81501be60mr13666808eja.7.1678238011098; 
 Tue, 07 Mar 2023 17:13:31 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 rp21-20020a170906d97500b008de50990fa7sm6732223ejb.21.2023.03.07.17.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:30 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 53/73] tests: acpi: add non zero function device with
 acpi-index on non-hotpluggble bus
Message-ID: <bf5fde7964e616d3ccfd7d9cb19521e1af11a9a0.1678237635.git.mst@redhat.com>
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
Message-Id: <20230302161543.286002-28-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d7c34ba504..76d5100911 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1028,10 +1028,11 @@ static void test_acpi_q35_tcg_no_acpi_hotplug(void)
                                  "addr=7.0"
         " -device pci-testdev,bus=nohprp,acpi-index=501"
         " -device pcie-root-port,id=nohprpint,port=0x0,chassis=3,hotplug=off,"
-                                 "addr=8.0"
+                                 "multifunction=on,addr=8.0"
+        " -device pci-testdev,bus=nohprpint,acpi-index=601,addr=8.1"
         " -device pcie-root-port,id=hprp2,port=0x0,chassis=4,bus=nohprpint,"
                                  "addr=9.0"
-        " -device pci-testdev,bus=hprp2,acpi-index=601"
+        " -device pci-testdev,bus=hprp2,acpi-index=602"
         , &data);
     free_test_data(&data);
 }
@@ -1053,6 +1054,7 @@ static void test_acpi_q35_multif_bridge(void)
         " -device pcie-root-port,id=rphptgt2,port=0x0,chassis=6,addr=2.2"
         " -device pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3"
         " -device pci-testdev,bus=pcie.0,addr=2.4"
+        " -device pci-testdev,bus=pcie.0,addr=2.5,acpi-index=102"
         " -device pci-testdev,bus=pcie.0,addr=5.0"
         " -device pci-testdev,bus=pcie.0,addr=0xf.0,acpi-index=101"
         " -device pci-testdev,bus=rp0,addr=0.0"
-- 
MST


