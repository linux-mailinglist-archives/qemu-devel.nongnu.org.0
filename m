Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F0652DAC0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:00:07 +0200 (CEST)
Received: from localhost ([::1]:49920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrjVN-0000kj-UG
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangwenliang.1995@bytedance.com>)
 id 1nrhQz-0005UI-7q
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:47:30 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangwenliang.1995@bytedance.com>)
 id 1nrhQl-0000ls-Ib
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:47:21 -0400
Received: by mail-pg1-x536.google.com with SMTP id 137so5285460pgb.5
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=KGbT4fdqWnE3RW5+3tkusAJuvGtDSgAm254BmJ5v9G8=;
 b=G9EOUo3ujWw4PTec68tuX3LSQULQ5XE3nB4JftCq5Xj4yfoJQzh/82ghT9/XkfFayC
 Eqb4QvhDDu4cffH9GaGmnFJ/wIY9HozKwpEPK0v8geD1Tj2dPjv7zQmquf/iv88ErFCh
 q0oD/36e+4ZX6f0FlksM06Zodm63wb1Z3LKOAEqQu6Jp0mtj0ialwsH1TA0OIFVbSVrZ
 HH7IIAg9aj4EnZ0xWPZ4wHRqg4erXlUOnlyjJ1PPxupfl965mieWWG0czGd8zUlAMI3n
 AQ6aWx5cSzBgIdNHTgk83rrCiTs/4x+N57mkZfFbwi0S6UTsA8mi81XC30O3H/23jTyX
 BAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KGbT4fdqWnE3RW5+3tkusAJuvGtDSgAm254BmJ5v9G8=;
 b=iIR51xVNWa4WFd7dP8S0TPW4/afuBmIjxIACErPuHQnG7F/Q9LIdZSrZp+khvXGjqZ
 TvBFomrJehBY7LV05UpzQroH+4Th5ZG7EX97sQH6Z+18Xqhveq5AFB3uK5+WYdYj8II+
 etdX1z8Maz9UnKvrYfB7JBrDDrY4uzicavtnE4xNwJtIZkIgIO3GjxjkluFPFCzBweeP
 pmo02aVcKAGTb8pg7/QVD33RX3HC0NyJE2WT+WQ1iUbOtQ8TPidbMyzhOKX6d8s8nkmP
 nXsThrXLTkjj8IVq7U7ON0+Qs5pfLgZyxNUvUIWZPFgMr1RCyVnztkn6ECkkZeKeWS0I
 CmNA==
X-Gm-Message-State: AOAM531xrUQxodXjB/xzs8vFs5had2zUp308KFJv9K2EPGtslpcDg9Zu
 K86TOrILc3krCfffKz7dZ5UbmdXmjJSMSw==
X-Google-Smtp-Source: ABdhPJyLMdbafamzO/FlTgFEWcaGDzTYEDFv/IRfZZJTi/Lrd8JtuA3Gh9chOoVUsXLiO7gAoE0yQw==
X-Received: by 2002:a05:6a00:16c7:b0:4f7:e497:69b8 with SMTP id
 l7-20020a056a0016c700b004f7e49769b8mr5037405pfc.6.1652971628889; 
 Thu, 19 May 2022 07:47:08 -0700 (PDT)
Received: from localhost.localdomain
 ([2408:8207:2434:25c0:32b7:d302:7710:9f78])
 by smtp.gmail.com with ESMTPSA id
 jj17-20020a170903049100b0016170bb6528sm3844429plb.113.2022.05.19.07.47.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 May 2022 07:47:08 -0700 (PDT)
From: Wenliang Wang <wangwenliang.1995@bytedance.com>
To: qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com,
 Wenliang Wang <wangwenliang.1995@bytedance.com>
Subject: [PATCH] hw/pci/pcie.c: Fix invalid PCI_EXP_LNKCAP setting
Date: Thu, 19 May 2022 22:45:59 +0800
Message-Id: <1652971559-22126-1-git-send-email-wangwenliang.1995@bytedance.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=wangwenliang.1995@bytedance.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 19 May 2022 12:58:04 -0400
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

pcie_cap_fill_slot_lnk() wrongly set PCI_EXP_LNKCAP when slot speed
and width is not set, causing strange downstream port link cap
(Speed unknown, Width x0) and pcie devices native hotplug error on Linux:

[    3.545654] pcieport 0000:02:00.0: pciehp: link training error: status 0x2000
[    3.547143] pcieport 0000:02:00.0: pciehp: Failed to check link status

We do not touch PCI_EXP_LNKCAP when speed=0 or width=0, as pcie_cap_v1_fill()
already do the default setting for us.

Signed-off-by: Wenliang Wang <wangwenliang.1995@bytedance.com>
---
 hw/pci/pcie.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 68a62da..c82e7fc 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -92,6 +92,11 @@ static void pcie_cap_fill_slot_lnk(PCIDevice *dev)
         return;
     }
 
+    /* Use default LNKCAP setting */
+    if (s->speed == 0 || s->width == 0) {
+        return;
+    }
+
     /* Clear and fill LNKCAP from what was configured above */
     pci_long_test_and_clear_mask(exp_cap + PCI_EXP_LNKCAP,
                                  PCI_EXP_LNKCAP_MLW | PCI_EXP_LNKCAP_SLS);
-- 
2.7.4


