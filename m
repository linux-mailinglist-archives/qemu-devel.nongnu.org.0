Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846EA496787
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:47:22 +0100 (CET)
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB1ke-0000kI-Mb
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:47:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nB1cn-0004LR-4T; Fri, 21 Jan 2022 16:39:14 -0500
Received: from [2607:f8b0:4864:20::333] (port=38868
 helo=mail-ot1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nB1cc-0003MQ-SD; Fri, 21 Jan 2022 16:39:04 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 k13-20020a056830150d00b0059c6afb8627so11200662otp.5; 
 Fri, 21 Jan 2022 13:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/uJC9/bYCxhu6D/1sgpkQOihdP7dQbwa96H4PVeAg0=;
 b=YsW4yNTUJBPfqojpjQCjVqUW9D9ixxcMJ5MWu9FaiFJBRgrbB5jwb89w+exvvniqPI
 AahYc67CGymHbDDittanOwwGCSwS+ZBgywqUPoDpBXiFImGtgQjvI9DRZY8i5quF2eAE
 gbM7Ci+i005p+fU4OFvr281Cwsy3TYwaMfAOYcKgK0FHtqOs+ksHYusnDnZlpKlSd4VP
 irOMwcxrNlrjf9Fkuyq/V3gdhfnhxIZQ9tv0sDcLRD3O6ZzNbnOtavSc9ib3lp+F3BKN
 o27WCymH/QUeprSJCVGF+p4TyyzJR1kEOXU/jwg6rPh1/3qGyWsa9dRJkPHtw30Bj7iI
 1Vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/uJC9/bYCxhu6D/1sgpkQOihdP7dQbwa96H4PVeAg0=;
 b=CMv1nMLjMosHZiNx2VXGKzrWqfJYbiMR7vmyv0AGH8loG8Aa8qsnbWJcJ5f4eJ6c0w
 FamPIEZggOigzu1q/jPYbt8vXe+MDoD5dQcoRASfM1TImarXzH+MQaslp8JHhs/NNV2S
 exYGdVuQfYpPtClcNhnUOQ5EjFklzXhhQUxWsIRgyIJxLsIahxl15HHSkKBeXpczJFKK
 4rgPiGNSFx0G74x7ekL5CbbVGzS8knQWW5FnL6t6YYcchioZtovwn62XJro257/NsfYg
 d95yTXv8uFN21oi/fN3aqXNGJ7anlMRPirtoDC7Yq1ARVr1ecSiWKebxxZcTYk579Kri
 X4sg==
X-Gm-Message-State: AOAM531JDIoDEjq2kRrOVcwVvLGYv5Jnwd5yDkVbY5IpMWMwHYzzg5wp
 ztVPmFiBmq9bPoHznWH/kICgw+6gyKQ=
X-Google-Smtp-Source: ABdhPJx035x4sFzwfJgAIOux4o5+zN2YwvH253EBIx1j38KIdOwgFLjL2w0U2XSnwTD39IXQYNFbjA==
X-Received: by 2002:a9d:6a47:: with SMTP id h7mr4048488otn.65.1642801141215;
 Fri, 21 Jan 2022 13:39:01 -0800 (PST)
Received: from rekt.ibmuc.com ([191.8.61.226])
 by smtp.gmail.com with ESMTPSA id u4sm1514402ots.37.2022.01.21.13.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:39:00 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] spapr.c: check bus != NULL in spapr_get_fw_dev_path()
Date: Fri, 21 Jan 2022 18:38:52 -0300
Message-Id: <20220121213852.30243-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::333
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_get_fw_dev_path() is an impl of
FWPathProviderClass::get_dev_path(). This interface is used by
hw/core/qdev-fw.c via fw_path_provider_try_get_dev_path() in two
functions:

- static char *qdev_get_fw_dev_path_from_handler(), which is used only in
qdev_get_fw_dev_path_helper() and it's guarded by "if (dev &&
dev->parent_bus)";

- char *qdev_get_own_fw_dev_path_from_handler(), which is used in
softmmu/bootdevice.c in get_boot_device_path() like this:

    if (dev) {
        d = qdev_get_own_fw_dev_path_from_handler(dev->parent_bus, dev);

This means that, when called via softmmu/bootdevice.c, there's no check
of 'dev->parent_bus' being not NULL. The result is that the "BusState
*bus" arg of spapr_get_fw_dev_path() can potentially be NULL and if, at
the same time, "SCSIDevice *d" is not NULL, we'll hit this line:

    void *spapr = CAST(void, bus->parent, "spapr-vscsi");

And we'll SIGINT because 'bus' is NULL and we're accessing bus->parent.

Adding a simple 'bus != NULL' check to guard the instances where we
access 'bus->parent' can avoid this altogether.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 72f5dce751..3d6ec309dd 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3053,7 +3053,7 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
     VHostSCSICommon *vsc = CAST(VHostSCSICommon, dev, TYPE_VHOST_SCSI_COMMON);
     PCIDevice *pcidev = CAST(PCIDevice, dev, TYPE_PCI_DEVICE);
 
-    if (d) {
+    if (d && bus) {
         void *spapr = CAST(void, bus->parent, "spapr-vscsi");
         VirtIOSCSI *virtio = CAST(VirtIOSCSI, bus->parent, TYPE_VIRTIO_SCSI);
         USBDevice *usb = CAST(USBDevice, bus->parent, TYPE_USB_DEVICE);
-- 
2.34.1


