Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D1A485A97
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:27:37 +0100 (CET)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Dol-0004o5-Fm
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:27:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlF-00012L-GX; Wed, 05 Jan 2022 16:23:57 -0500
Received: from [2607:f8b0:4864:20::935] (port=44640
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlE-0007pw-19; Wed, 05 Jan 2022 16:23:57 -0500
Received: by mail-ua1-x935.google.com with SMTP id e19so790732uaa.11;
 Wed, 05 Jan 2022 13:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HNGA8nNkO6AatbDDjhH8IMCuvb23bzKJhmefCv/hhI8=;
 b=dVz6weICTCX3FuiauC4/Ugn72WvmZComMgVVSMQ/ENyCGTwKO9qQRfVFU8OCg/aXKa
 QR+AF2xEqUDZwo/ZyPvkZccFv/8ysSuN5+M/D1UN86Xx6nnr7MYw2p7peSgv1LTjA1Iz
 wg6F9FWWzlz50m7BauUWwsb4cXJ33yHQfz940XJnMZQpBCbDQ7OpDm8wfWzzLE3MCqRN
 cE91heE+087tnsPO1UYTrw0AyB5GtOW0eKWd/AgIn4Kaq2hwo/6fbvcIdg7JIXlkRhSZ
 mTqhcOBEdk0xmpM8VN0cHqqtPegkjv182Pjllq2KxESg9nzFfZWjqVkNsVxU/7nRlWQ+
 hvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNGA8nNkO6AatbDDjhH8IMCuvb23bzKJhmefCv/hhI8=;
 b=xNi9fRKwC184MovyQ/pfeq4DearVOTYH5tIGO0ucgGfWcJ+VYjuiVqHKm2eBeUP5fj
 FGKtNGiTUGDp2EuBR/H/Elm2fHhnlh3u8cbG0QA8HOWJexYITT1q18osxL2DfXEDi4m6
 WZOYttkqYZjFQueU+VQXuLeSltFqO7JeeKOuQCoxHiV5o0TZi7pJnd9C2nV3edZ1hBzs
 JBLNEov8m0EH/rWP7tgUYekhl3dB8WA7Lsp6jkSXaNqOvi6JdiTolkoxxFhEgyxRpy/h
 DsV4Aty3Iqb3waV9vkeNLxn6V0s4ET7WIurFA6Ynr8JTz/0IbZ2p+eqbtrePoHuhtY4x
 Svxw==
X-Gm-Message-State: AOAM530YVa0HKnTe0222ZB9BklYkQWBQqtLbTiwUginmoM5U7RJ6kSdd
 svb0rbWlvx7wYgEidHqh5NtzwfqOwcQ=
X-Google-Smtp-Source: ABdhPJzQ7UwpiA65G5pqLuckQDn8soKXA/0xWlg8lF8EN/5D1/rcpzNICqWARGaqpN1y4VSx+Opeiw==
X-Received: by 2002:a05:6102:94e:: with SMTP id
 a14mr17627114vsi.55.1641417834886; 
 Wed, 05 Jan 2022 13:23:54 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:23:54 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/18] pnv_phb3.c: add unique chassis and slot for
 pnv_phb3_root_port
Date: Wed,  5 Jan 2022 18:23:21 -0300
Message-Id: <20220105212338.49899-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
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
index c78084cce7..3467bbb5d9 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1142,8 +1142,24 @@ static const TypeInfo pnv_phb3_root_bus_info = {
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


