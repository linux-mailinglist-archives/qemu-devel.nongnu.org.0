Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D580732F98F
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:03:29 +0100 (CET)
Received: from localhost ([::1]:36012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUiW-0001H8-Sy
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZs-0005su-18; Sat, 06 Mar 2021 05:54:32 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZq-00087U-Ku; Sat, 06 Mar 2021 05:54:31 -0500
Received: by mail-wm1-x32c.google.com with SMTP id l22so3222406wme.1;
 Sat, 06 Mar 2021 02:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KBxRlsdH7b6tBF2h2wgskqjFMzn+Uz1MxquHphs0JBo=;
 b=gebeZE2KFW+/FnoOXq9TBJMLsj0R8hnAsZAVshzhrb6b81jKlrw/BTJmLjmbK5Of8E
 +mhjvclWPZKMwuU1b5XB5VMahNnCiYzt8aKVjnbbkGXeTGIur+W0aLLm6sMQQ/G2g+uR
 DCQau3QD3aoujck3A5ZFQAaGnY9Z2mgJ8iZzC4PXmOPnOGrBrLxF2hPhDgQWpDzB0BAT
 mgpMlNhztZ+P3twowkJM80AvbXoJaALVXAs1bkMSCNakC8Ag0AXKL0VAACKD63mV+d+k
 qfNYPNmC5TtWkYhnf1Zbf8tYIie+Vk4p+IzTfhsI/WdSyg275BccbMMQXu0XMqyjSpkk
 jxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KBxRlsdH7b6tBF2h2wgskqjFMzn+Uz1MxquHphs0JBo=;
 b=r/PRkak+rzrdlNLWYBlHmZWdyr94sFIco+Jr+P47OezEkpQsp4iKwvGz30kkwr+wre
 WymSx6nBhYx0UhiCMS4m26pHh0f+OdRskSYXN55E+zlTYHg7N6FsrNbZDeIZM6TKl6bP
 1aTgCft8NVoq/7I1/Rm2g+NitH7/znyqHcL8iMcXpiNoBItNRAZiSiaaTWe+eEWo8KTd
 CA8sfX6bDKoxholfJurG/dAwsffonXYiCFks9HMiTropYG4SMofDCHiK5xa6PtDnuPjr
 KWIFU2EO5egU2FSSrpSw+4YzDH45JBuSWvjU7hBljQFyngYNRPSf9AdEq/xHEKR2b+JE
 IeWw==
X-Gm-Message-State: AOAM533y3Mtr0fafznuI62i6I9Y1eYSvvA0XXt7+eVvNpVWzZucgaTPV
 DpWJganpPCMuMpuFENGA80PX3PVBk4s=
X-Google-Smtp-Source: ABdhPJxCicuP29eNKSLRjLIHL6EK1U1bIjwibaKBWuKhwXRqMDEN03c4nNZ3WYOM3zr0346Xkl46eg==
X-Received: by 2002:a7b:cc1a:: with SMTP id f26mr13063766wmh.19.1615028069091; 
 Sat, 06 Mar 2021 02:54:29 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/23] lsilogic: Use PCIDevice::exit instead of
 DeviceState::unrealize
Date: Sat,  6 Mar 2021 11:54:05 +0100
Message-Id: <20210306105419.110503-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peng Liang <liangpeng10@huawei.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peng Liang <liangpeng10@huawei.com>

PCI_DEVICE has overwritten DeviceState::unrealize (pci_qdev_unrealize).
However, LSI53C895A, which is a subclass of PCI_DEVICE, overwrites it
again and doesn't save the parent's implementation so the PCI_DEVICE's
implementation of DeviceState::unrealize will never be called when
unrealize a LSI53C895A device.  And it will lead to memory leak and
unplug failure.

For a PCI device, it's better to implement PCIDevice::exit instead of
DeviceState::unrealize.  So let's change to use PCIDevice::exit.

Fixes: a8632434c7e9 ("lsi: implement I/O memory space for Memory Move instructions")
Cc: qemu-stable@nongnu.org
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
Message-Id: <20210302133016.1221081-1-liangpeng10@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/lsi53c895a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index a4e58580e4..e2c19180a0 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -2312,7 +2312,7 @@ static void lsi_scsi_realize(PCIDevice *dev, Error **errp)
     scsi_bus_new(&s->bus, sizeof(s->bus), d, &lsi_scsi_info, NULL);
 }
 
-static void lsi_scsi_unrealize(DeviceState *dev)
+static void lsi_scsi_exit(PCIDevice *dev)
 {
     LSIState *s = LSI53C895A(dev);
 
@@ -2325,11 +2325,11 @@ static void lsi_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->realize = lsi_scsi_realize;
+    k->exit = lsi_scsi_exit;
     k->vendor_id = PCI_VENDOR_ID_LSI_LOGIC;
     k->device_id = PCI_DEVICE_ID_LSI_53C895A;
     k->class_id = PCI_CLASS_STORAGE_SCSI;
     k->subsystem_id = 0x1000;
-    dc->unrealize = lsi_scsi_unrealize;
     dc->reset = lsi_scsi_reset;
     dc->vmsd = &vmstate_lsi_scsi;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
-- 
2.29.2



