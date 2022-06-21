Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B844655392E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:51:00 +0200 (CEST)
Received: from localhost ([::1]:57878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3i1j-00037M-Qc
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hmH-00036r-Qf; Tue, 21 Jun 2022 13:35:02 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:46014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hmG-0002NV-An; Tue, 21 Jun 2022 13:35:01 -0400
Received: by mail-oi1-x231.google.com with SMTP id u9so17930054oiv.12;
 Tue, 21 Jun 2022 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUxGvOjzbE+pLKSYI6StCyRo086XpSxbnsss/wkwQrA=;
 b=mD/ESzAWh8JTymmOY5U2u6CU8ZNvAIj3RY3p6/PeTJo0zzFmOmf6X6SfD2UmzN9XIF
 j3aCX/lcsiV2hhPXdKIHkAHI0xJnGL8zQIJuPpjy+gqQCO4DO5Iz+Ev6aSI0DLSsV95i
 HnTID88wB0qfsJISrporsaUXFrlmIewxwzQmYJUFTrjthtu4NhqNZMkL14W6ZeUVBIA/
 LQC8+q6mZNwIIuHYOql9ZyRDwttR03UoddXA460e2lC4+TrbIMDMrM/MkbePRg2BDBl4
 c6vSQLIZASxsnUDhCsvt/5f5qZIKt1VH8AzjGWn0SfQC30KjXd/3oYu1rg7s0i/W8JJh
 /SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUxGvOjzbE+pLKSYI6StCyRo086XpSxbnsss/wkwQrA=;
 b=6empr8/QTnqaNyzcfwPEvxzlEw9uolu8D7viMTXqzwDgkFVW0W4yPazGDpPm12XrTw
 95Q9zO70ut6Wighv3gAVI0+OPiy9RKyTJ9ZqVtRPabInP3Wssr1bkAAsXgqF4aPuNRQd
 HFn5GqyCwYKCwI0VCi+aRErB8O/2Y9w+On+359x4uima3riH5nYf7GoBSHTktGxM/u1S
 3mVno1SJZdqHTCJZ71N2deU0DhC2rLikzzTFwWzZXhf29HUCIH1QOghKJCvQbRA1+NK0
 IOJWfeEtVlNT1ZCCaAQ2largqLW81/R3KK4JmiSkS4Tfa3B+7uuRL3/lSx6yVHJ+pfPF
 nsow==
X-Gm-Message-State: AJIora+0B7Cm3pehU5YFAAShgwmAKJ6UR0z+hLQzbHhCajAXyIR+pqXk
 X5S3JDuVwrdkGdKqKj/m5HGqh56WF2oqMw==
X-Google-Smtp-Source: AGRyM1uk24YCwJ6i1T6rj+kW23RzzxpzLibm1AYLNyS8A9UqNikDR8s0/GXh/D06hi3WhcbfKIQBFw==
X-Received: by 2002:aca:618b:0:b0:32f:3e2c:60d1 with SMTP id
 v133-20020aca618b000000b0032f3e2c60d1mr14919499oib.123.1655832898680; 
 Tue, 21 Jun 2022 10:34:58 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a056870385600b0010200e2828fsm2886556oal.30.2022.06.21.10.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:34:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 8/8] ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb4 root
 bus
Date: Tue, 21 Jun 2022 14:34:36 -0300
Message-Id: <20220621173436.165912-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621173436.165912-1-danielhb413@gmail.com>
References: <20220621173436.165912-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's unneeded. No other PCIE_BUS implements this interface.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 725b3d740b..d225ab5b0f 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1752,10 +1752,6 @@ static const TypeInfo pnv_phb4_root_bus_info = {
     .name = TYPE_PNV_PHB4_ROOT_BUS,
     .parent = TYPE_PCIE_BUS,
     .class_init = pnv_phb4_root_bus_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_PCIE_DEVICE },
-        { }
-    },
 };
 
 static void pnv_phb4_root_port_reset(DeviceState *dev)
-- 
2.36.1


