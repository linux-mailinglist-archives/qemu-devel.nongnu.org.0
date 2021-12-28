Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A5480CD3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:45:17 +0100 (CET)
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IPE-0007GY-NA
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:45:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIf-0003ie-7f; Tue, 28 Dec 2021 14:38:21 -0500
Received: from [2607:f8b0:4864:20::82d] (port=33330
 helo=mail-qt1-x82d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IId-00043q-IR; Tue, 28 Dec 2021 14:38:20 -0500
Received: by mail-qt1-x82d.google.com with SMTP id v4so14447659qtk.0;
 Tue, 28 Dec 2021 11:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eJ6+Ke1xC05ZgUOb+BKNnwR7Eg4U6KM0vXnMAljxOwI=;
 b=Wl2PKkHA7+6CR8ngCYI2Q7X92pnxesKw+lgQCG79Bvlc3phRGubx50c21bAgAyKXxE
 mdUGq305//tgKWoLmM71ESXG5ad1r1kX0+P8I7Rg/kqsmBjUtlWkcoyzrm3YB7n05/Tt
 YNosD2QKvkz6job+837G2Rsxh6EJvlbrWn0pNjFRPUooCA8bQmMq1A4TWLj4W2Dt17uI
 O/2U2y1U2SZ7Sf8g8vooY1F2NT8dGF6lVBcpKicYTDBufPVOfWTrIRt7YOAyBwbIT28b
 tAckKb0Fjy/8jMKtRV7/x7GxqDTEhPuPG3so7UNMYuoDoB0csUP83pJ66NGcqO820FsL
 SsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eJ6+Ke1xC05ZgUOb+BKNnwR7Eg4U6KM0vXnMAljxOwI=;
 b=tArT+SEQToAMsJI4M/HG9RjAi2dyasD6QGo07fWhWz21BwZjn32mcif2u4JOH5//VJ
 pvkCtRanvDlFH6CquwPvVQDhwT1q6MZqcNYb/WY+Aq9LgFxN6qJjsDohl5Hd9SRKRP5Y
 ZpaWfb7XE9zbUQmOcq37ZbDfV//mOoSWi8GaWE+6MN6aSOn/bX68xiE1d6MqkWm/apjq
 jNKc794VoTgVbAKP6HYubpp7zfpvEGAqTHitHAVND87TEhcwrGOaNwd5rkP1CcgmD5/5
 S0B9VkwK1+tpMeWaG2dRybd4QOqpplPfWgegVkiTClUNrlmY9NtdLPphoBumrlZLgc3+
 ElZA==
X-Gm-Message-State: AOAM532W0VH+mTwh3m9fP/Nq6lt7ZgU677fVwelALEtGUz3IIN1TMaYW
 WFlkZQ4ZThTOFi5zVEbHt1kil9EIvPk=
X-Google-Smtp-Source: ABdhPJxEj0D1qSuV90fNQ+Xam1DKB/em3wP04aZT66P4OsuZ9buDfhbTLMl3fioFe0AXAU9UYI6dJQ==
X-Received: by 2002:a05:622a:5:: with SMTP id
 x5mr19978778qtw.110.1640720298344; 
 Tue, 28 Dec 2021 11:38:18 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:18 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/17] pnv_phb3.c: add unique chassis and slot for
 pnv_phb3_root_port
Date: Tue, 28 Dec 2021 16:37:50 -0300
Message-Id: <20211228193806.1198496-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

When creating a pnv_phb3_root_port using the command line, the first
root port is created successfully, but the second fails with the
following error:

qemu-system-ppc64: -device pnv-phb3-root-port,bus=phb3-root.0,id=pcie.3:
Can't add chassis slot, error -16

This error comes from the realize() function of its parent type,
rp_realize() from TYPE_PCIE_ROOT_PORT. pcie_chassis_add_slot() fails
with -EBUSY if there's an existing PCIESlot that has the same
chassis/slot value, regardless of being in a different bus.

One way to prevent this error is simply set chassis and slot values in
the command line. However, since phb3 root buses only supports a single
root port, we can just get an unique chassis/slot value by checking
which root bus the pnv_phb3_root_port is going to be attached, get the
equivalent phb3 device and use its chip-id and index values, which are
guaranteed to be unique.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 4e2d680d44..130d392b3e 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1156,8 +1156,24 @@ static const TypeInfo pnv_phb3_root_bus_info = {
 static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
+    PCIDevice *pci = PCI_DEVICE(dev);
+    PCIBus *bus = pci_get_bus(pci);
+    PnvPHB3 *phb = NULL;
     Error *local_err = NULL;
 
+    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
+                                          TYPE_PNV_PHB3);
+
+    if (!phb) {
+        error_setg(errp,
+"pnv_phb3_root_port devices must be connected to pnv-phb3 buses");
+        return;
+    }
+
+    /* Set unique chassis/slot values for the root port */
+    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
+    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
+
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.33.1


