Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6AC613713
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUJA-0004nh-Ks; Mon, 31 Oct 2022 08:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIi-00041x-0A
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIg-0003Na-1O
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86Unsx2wQ2bsPsc8yY4Dt3c7f8SIJXtCrIwZmB0N9K8=;
 b=cPSphG3r/HiZ3tObm1kYkQLh5nobFbYhCHHWwQuHCH7NNVHqnqrqgE2boHwzmhIUzC3nvW
 PA+Sz6kYgFfUzleWgX5VWroAY/G2h/0cys9iVW/Vg7TVZaexdPjnObuJEcr7JF94u7hDjH
 LwpVu6AH4NnYP1vnRohx35OKCjSdbSA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-9vpbY7qFNWKE3OCnn0niog-1; Mon, 31 Oct 2022 08:53:56 -0400
X-MC-Unique: 9vpbY7qFNWKE3OCnn0niog-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfa287000000b00236c367fcddso1381521wra.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86Unsx2wQ2bsPsc8yY4Dt3c7f8SIJXtCrIwZmB0N9K8=;
 b=W7J1x3Khg9IGFk/u0JLKz9X09lzWVSP9J+iTtTJvaPy0Z9GluGftVef8Cc8NoYVrEP
 9UDLYulTRjj7sqgHw3+5uXVT1IeW5L7p7Fst5zuCzStmh9grYieQgFsvjcqYO10Va7K8
 ioJNyYiP/ff2EjLd+SGLLGNipkKnOYwlJDrRVpwMnfPyVfQ+GrC+EYe7BjD7CRyNzbSh
 pN6dXrZyl+LxHfRdXBAXkBmJtzaCEHeFtv72h13BJB6Afkj2F2TS1a8SzQqcJE0V+KR3
 0g/4YPdtc87lsSbOF/cWMzNVsEwzg45fPvH+/QgVOiGczq4EcjQat7xqT2T4zxs248qi
 OlZA==
X-Gm-Message-State: ACrzQf1OxB/nXn2XRDacvPrN4sEHfdPaUs/axNhpW1FCGwCw9ykifXtf
 ijXyfadtkWZpMz/pr27UmD0Tdot78lapsR4Q233ouxIVS1vITvW4HEMnMYVuS2/S4LJXRVGmulr
 usxz97atgSnVwnRTkGKXvd1+YmgTf0AvQvUZr4ujAqtfePilxIh9T0y8alwAM
X-Received: by 2002:a05:600c:21a:b0:3cf:6e76:9830 with SMTP id
 26-20020a05600c021a00b003cf6e769830mr4246836wmi.159.1667220834547; 
 Mon, 31 Oct 2022 05:53:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Kd4HOQD5I/WaE7YIp6vNhJiPgJn8Bj/9IkkDISmdwv1eVwr2zL/XejmRLGoLlBlbQn9U7Jg==
X-Received: by 2002:a05:600c:21a:b0:3cf:6e76:9830 with SMTP id
 26-20020a05600c021a00b003cf6e769830mr4246819wmi.159.1667220834249; 
 Mon, 31 Oct 2022 05:53:54 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003cf774c31a0sm1165270wmq.16.2022.10.31.05.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:53 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lev Kujawski <lkujaw@mailbox.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 67/86] qpci_device_enable: Allow for command bits hardwired to 0
Message-ID: <20221031124928.128475-68-mst@redhat.com>
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

From: Lev Kujawski <lkujaw@mailbox.org>

Devices like the PIIX3/4 IDE controller do not support certain modes
of operation, such as memory space accesses, and indicate this lack of
support by hardwiring the applicable bits to zero.  Extend the QEMU
PCI device testing framework to accommodate such devices.

* tests/qtest/libqos/pci.h: Add the command_disabled word to indicate
  bits hardwired to 0.
* tests/qtest/libqos/pci.c: Verify that hardwired bits are actually
  hardwired.

Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>
Message-Id: <20221024094621.512806-2-lkujaw@mailbox.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/libqos/pci.h |  1 +
 tests/qtest/libqos/pci.c | 13 +++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index 8389614523..eaedb98588 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -68,6 +68,7 @@ struct QPCIDevice
     bool msix_enabled;
     QPCIBar msix_table_bar, msix_pba_bar;
     uint64_t msix_table_off, msix_pba_off;
+    uint16_t command_disabled;
 };
 
 struct QPCIAddress {
diff --git a/tests/qtest/libqos/pci.c b/tests/qtest/libqos/pci.c
index b23d72346b..4f3d28d8d9 100644
--- a/tests/qtest/libqos/pci.c
+++ b/tests/qtest/libqos/pci.c
@@ -220,18 +220,19 @@ int qpci_secondary_buses_init(QPCIBus *bus)
 
 void qpci_device_enable(QPCIDevice *dev)
 {
-    uint16_t cmd;
+    const uint16_t enable_bits =
+        PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
+    uint16_t cmd, new_cmd;
 
     /* FIXME -- does this need to be a bus callout? */
     cmd = qpci_config_readw(dev, PCI_COMMAND);
-    cmd |= PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
+    cmd |= enable_bits;
     qpci_config_writew(dev, PCI_COMMAND, cmd);
 
     /* Verify the bits are now set. */
-    cmd = qpci_config_readw(dev, PCI_COMMAND);
-    g_assert_cmphex(cmd & PCI_COMMAND_IO, ==, PCI_COMMAND_IO);
-    g_assert_cmphex(cmd & PCI_COMMAND_MEMORY, ==, PCI_COMMAND_MEMORY);
-    g_assert_cmphex(cmd & PCI_COMMAND_MASTER, ==, PCI_COMMAND_MASTER);
+    new_cmd = qpci_config_readw(dev, PCI_COMMAND);
+    new_cmd &= enable_bits;
+    g_assert_cmphex(new_cmd, ==, enable_bits & ~dev->command_disabled);
 }
 
 /**
-- 
MST


