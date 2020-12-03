Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E302CD654
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:03:16 +0100 (CET)
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkoGR-0006m7-Cb
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kkoDP-0005Gx-1B
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:00:07 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:39115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kkoDN-0002I9-6C
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:00:06 -0500
Received: by mail-lf1-x133.google.com with SMTP id j205so2574030lfj.6
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 05:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GX6ankB3VIUsz6cmu/u03hWEiPljuvEMQ/2K8vSivlU=;
 b=A9CQqJCErse/hXH48A+Qi4a0x0xT5tOXb7m5qt6e+AOv7v0HeDKRG5e0Ggsif8+zuT
 Jq/+dRp+4UcTcjh56eHN4iS5jUlZbNeMgcLcAsF+AwOEqe7hGsGiQ7CC33RqafX2qNBD
 rDt89IdCpHqQ7acBOhbInfhRCJGc3rvIo0Z3dQgiJxUtq8iXJGhebQ6QiD4ms4ge1OgT
 JEZbMNqlb+IpYZ+zKx2IlX58kYgq2jg0l2VWhr+dCqwbWRuqgqpX74w8xcee+uZ3CK7n
 GlGuUQmdyfCUXqGutJU69j+DALj21DIFJ/eFTsB/QoNQDZXAwCy8Ok/r4xkcqzo4mDUR
 Vupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GX6ankB3VIUsz6cmu/u03hWEiPljuvEMQ/2K8vSivlU=;
 b=h89TBkV1+UnPDutxHgMCDoj+zEoiyOzev3FTKqVel5DJbyuddGQE4gR3HVnyIoHxlw
 5a0obl550VHvnyfoI93AGCMknlgLA4Q2J9X4CCUnz7E7ZNt1rwe+tEqqWxDXmPzBqjqT
 tfpvrrC8GCQAjqXphYlkerFxYaOXAIZGjt7XX/erippl5+Iu9eyTDW7WsBDMU5o3OJF2
 iXU6lVcyLOb7mpXkC1rFImdc6IpUvKRpsCkuqsjQVjqRxWqst7CArXvztkY63c7570mS
 ClYe2aWk54mij1gDKS+kwi3s33KnfxueGTrOg+rLK9PX+UiooFCmoEWzrXstorSRo1OS
 bl8A==
X-Gm-Message-State: AOAM531n0BV195sKMIJSdGqUJrWFdipxaLdjgYEuXoeQI/h5gk7By0U6
 B3Lzfy5jEg/puJTNDNwsmgbh+g==
X-Google-Smtp-Source: ABdhPJylFHHLY18Fb8zi+WQREE8TeB2FnUUseCAGPw7ofIEJSw4KLcEcTA1B1JAEsMDRUNM2Tp1Qpg==
X-Received: by 2002:a05:6512:33bc:: with SMTP id
 i28mr1262566lfg.52.1607000402705; 
 Thu, 03 Dec 2020 05:00:02 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id m7sm396487ljb.8.2020.12.03.05.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 05:00:02 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com
Subject: [PATCH v2] e1000e: Added ICR clearing by corresponding IMS bit.
Date: Thu,  3 Dec 2020 15:32:36 +0200
Message-Id: <20201203133236.222207-1-andrew@daynix.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::133;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: intel-wired-lan@lists.osuosl.org, qemu-devel@nongnu.org,
 alexander.duyck@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1707441
Added ICR clearing if there is IMS bit - according to the note by
section 13.3.27 of the 8257X developers manual.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/net/e1000e_core.c | 10 ++++++++++
 hw/net/trace-events  |  1 +
 2 files changed, 11 insertions(+)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 095c01ebc6..9705f5c52e 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2624,6 +2624,16 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
         e1000e_clear_ims_bits(core, core->mac[IAM]);
     }
 
+    /*
+     * PCIe* GbE Controllers Open Source Software Developer's Manual
+     * 13.3.27 Interrupt Cause Read Register
+     */
+    if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
+        (core->mac[ICR] & core->mac[IMS])) {
+        trace_e1000e_irq_icr_clear_icr_bit_ims(core->mac[ICR], core->mac[IMS]);
+        core->mac[ICR] = 0;
+    }
+
     trace_e1000e_irq_icr_read_exit(core->mac[ICR]);
     e1000e_update_interrupt_state(core);
     return ret;
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 5db45456d9..2c3521a19c 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -237,6 +237,7 @@ e1000e_irq_icr_read_entry(uint32_t icr) "Starting ICR read. Current ICR: 0x%x"
 e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current ICR: 0x%x"
 e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to zero IMS"
 e1000e_irq_icr_clear_iame(void) "Clearing ICR on read due to IAME"
+e1000e_irq_icr_clear_icr_bit_ims(uint32_t icr, uint32_t ims) "Clearing ICR on read due corresponding IMS bit: 0x%x & 0x%x"
 e1000e_irq_iam_clear_eiame(uint32_t iam, uint32_t cause) "Clearing IMS due to EIAME, IAM: 0x%X, cause: 0x%X"
 e1000e_irq_icr_clear_eiac(uint32_t icr, uint32_t eiac) "Clearing ICR bits due to EIAC, ICR: 0x%X, EIAC: 0x%X"
 e1000e_irq_ims_clear_set_imc(uint32_t val) "Clearing IMS bits due to IMC write 0x%x"
-- 
2.29.2


