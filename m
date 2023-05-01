Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACFF6F2BEA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 04:03:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptIsA-0003pb-Ej; Sun, 30 Apr 2023 22:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptIs6-0003p8-Gz
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 22:02:37 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptIs3-0003Ek-Q7
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 22:02:33 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4edcc885d8fso2507385e87.1
 for <qemu-devel@nongnu.org>; Sun, 30 Apr 2023 19:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682906550; x=1685498550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uu05r/+K3irfDIVs7fuNdmkBiFU8/kzPnfrcMrQcERY=;
 b=Z4iV/adCxTqovc3jUUQpRrj6SxHjxVJsC7xhMSUNFu7JIfUmwHCppfdGKC5Ihs6T3b
 ng3Bx40r+hJNPFuaagJx9GeF5ZHmvJ24AkxqpaI4vSptaFZ7hqCNEENKL7FKk6hH149s
 bNMTZiRqf2tqWr0W+X0XtMYj5dpngK2a/eT+VYEizTnqYvLEePGZqfxVsSLhRbw1QWAi
 Er/J/Tnoq8s24GFzqfs6K7yfNXpfq2oUJmK0ryVKu4roigp/dOIJlu8noSEJ5J0q+Kao
 2yZcdF2mXN83rFmBxg0VLWwpZvnNarBLTK7oLi/UOWXgLPaElL0jCYI4JyRRBN+1v4JD
 edBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682906550; x=1685498550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uu05r/+K3irfDIVs7fuNdmkBiFU8/kzPnfrcMrQcERY=;
 b=cFPVlLUa5LuAMhqKJiziZLBv4XSXYYEMnnacVj4cc+sOiQ24KkNlwC5rNMtjcyIVTr
 AfVIBAwMdGcI4y/eAcGmA1sFj7SdvSktyCYBnJmQ0cFYibVwPMfAbACjxfwWTN+StaJH
 Rkd4GwA//ds72tZsT0tPE3+tw3KR+oerGaxsXpXU9XL688GesCuusdbWnI1azz9q/vIj
 yO+gT0Gw3nahk2c+QBKaz+F/J94fpAsH38pROD90+w4H38184/LQwjvRAgKYERAe19VS
 i6TuCnT/dk/YO/6Edsym2afYaOYjHm7QZzx+CFG6xlWaqJMd8N1/Z6TQExlek2GmEDpt
 vKkQ==
X-Gm-Message-State: AC+VfDy/kdGSTdlr3FUVjnt8KvwKcdSR/M/4Er1vI4SGWQW5grDj9WYe
 bVGqbjIeVV1OrfBdgz6os7EHyg==
X-Google-Smtp-Source: ACHHUZ51URhgEBgB1Z5BziqDBmOb0w3F3USll/JoB4mbowkntLDJTrI9vgeUOslBSmoLfrxTsBr/ZQ==
X-Received: by 2002:ac2:446f:0:b0:4dd:9fd8:3a36 with SMTP id
 y15-20020ac2446f000000b004dd9fd83a36mr3246542lfl.1.1682906549953; 
 Sun, 30 Apr 2023 19:02:29 -0700 (PDT)
Received: from vp-pc.. (109-252-127-135.nat.spd-mgts.ru. [109.252.127.135])
 by smtp.gmail.com with ESMTPSA id
 w7-20020ac254a7000000b004efe73ee01fsm3783271lfk.306.2023.04.30.19.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 19:02:29 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com, jasowang@redhat.com, peterx@redhat.com,
 marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com, yan@daynix.com,
 yuri.benditovich@daynix.com
Subject: [RFC PATCH v2 1/4] pci: add handling of Enable bit in ATS Control
 Register
Date: Mon,  1 May 2023 05:02:18 +0300
Message-Id: <20230501020221.188376-2-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230501020221.188376-1-viktor@daynix.com>
References: <20230501020221.188376-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::129;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

According to PCIe Address Translation Services specification 5.1.3.,
ATS Control Register has Enable bit to enable/disable ATS.
A trigger function is called at the Enable bit change, so that PCIe
devices can handle ATS enable/disable.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 hw/pci/pcie.c         | 22 ++++++++++++++++++++++
 include/hw/pci/pcie.h |  5 +++++
 2 files changed, 27 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index b8c24cf45f..14ac1b0fb9 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -1063,6 +1063,28 @@ void pcie_ats_init(PCIDevice *dev, uint16_t offset, bool aligned)
     pci_set_word(dev->wmask + dev->exp.ats_cap + PCI_ATS_CTRL, 0x800f);
 }
 
+void pcie_ats_config_write(PCIDevice *dev, uint32_t address,
+                           uint32_t val, int len,
+                           void (*trigger_func)(PCIDevice *dev, bool enable))
+{
+    uint32_t off;
+    uint16_t ats_cap = dev->exp.ats_cap;
+
+    if (!ats_cap || address < ats_cap) {
+        return;
+    }
+    off = address - ats_cap;
+    if (off >= PCI_EXT_CAP_ATS_SIZEOF) {
+        return;
+    }
+
+    if (range_covers_byte(off, len, PCI_ATS_CTRL + 1)) {
+        if (trigger_func) {
+            trigger_func(dev, !!(val & PCI_ATS_CTRL_ENABLE));
+        }
+    }
+}
+
 /* ACS (Access Control Services) */
 void pcie_acs_init(PCIDevice *dev, uint16_t offset)
 {
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 3cc2b15957..f5571527d3 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -146,4 +146,9 @@ void pcie_cap_slot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                              Error **errp);
 void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
                                      DeviceState *dev, Error **errp);
+
+void pcie_ats_config_write(PCIDevice *dev, uint32_t address,
+                           uint32_t val, int len,
+                           void (*trigger_func)(PCIDevice *dev, bool enable));
+
 #endif /* QEMU_PCIE_H */
-- 
2.35.1


