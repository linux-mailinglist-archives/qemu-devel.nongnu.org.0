Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F083A67EB72
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 17:48:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLRtM-0002Vf-Oe; Fri, 27 Jan 2023 11:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRtE-0002Mn-4B; Fri, 27 Jan 2023 11:47:48 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRtB-0005gP-7q; Fri, 27 Jan 2023 11:47:47 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m7so5500819wru.8;
 Fri, 27 Jan 2023 08:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bwu9CwvqoSJic4qxTpKXLN2ZSVp5972X16Wu4OAdM2A=;
 b=HYavrvzEXAjwzfXGkvtOik1RETm75ljLQhvBRKNWiZAMsT73z6e+kJeDOCGYRRWbJE
 NR85lxJ4q9Ak5byGuLGiZiurv6QWw7W7w3/tNuop914Y3wNHlr2Nwst1aSFedmN+0kDC
 8lCrFQT+sP01/OS/W2jdHY1EuePnGPeg2G+G2l2ZICWRb4FtFOtEjGveOe+mA2RoBA3T
 Z521cYfMd0bWWxAl0eqhrhACrUVc4wD/TCG9vLoRc3Apvm3S5kwYUUafy4fE3iiQxmoh
 W8MjBs8CiEqr1pfSLjro/Up8l5jj5VgtQ89giRQLDHYC2C3xbi3nhuuwz/KgdxEaoxY3
 f+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bwu9CwvqoSJic4qxTpKXLN2ZSVp5972X16Wu4OAdM2A=;
 b=HFTWlfNj53MGnONKPUVuqmbb/wOYh4vf0qsrCbHB4Jk3ZO7eS7kOrGoGMaR8cRJQ2O
 cpBVcwvZ7VfN26kkJGPfxyRM5hvgJcvOsp7neoKXd2W82JKuuvWknsjlEd2HHUaVq+rV
 3X3HcPu3KsX+ZdgnvR0knf55q/AR0V43UALArcieeroohElR44bDlWEy4FO+Ii4oWz+e
 jqng2/1gtnDI6wLYP+lZFrKL1zxsN4QPag0JDz2PsVoFYgVEuXDVhYUlF2X5cvn0uGPS
 /VR1vo0eOzNioL9cdRd769oac4PbWo0HiUwYE8nYxhTjbcmoqSg2SL2opTs90u3trtIB
 rB/w==
X-Gm-Message-State: AFqh2krY43pb/VCzjHxwjSzimCxVK6mg8qPHsgG4uKNjubAKeHp7luMn
 a+n6GVLZtD/Kwv6qW4Gu0/fvfmQ7hWldVw==
X-Google-Smtp-Source: AMrXdXsYPf5V39fxV4giZLUKNF5G6Rg2Ev+YPu89tYbfjcm46Ng41XZaFF1h7BdOEsvxaJ2HlKqzig==
X-Received: by 2002:a05:6402:49:b0:49e:33ce:144d with SMTP id
 f9-20020a056402004900b0049e33ce144dmr97233015edu.37.1674838052615; 
 Fri, 27 Jan 2023 08:47:32 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056402050f00b0049ef70a2894sm2574414edv.38.2023.01.27.08.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 08:47:32 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/7] hw/pci-host/q35: Inline sysbus_add_io()
Date: Fri, 27 Jan 2023 17:47:13 +0100
Message-Id: <20230127164718.98156-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127164718.98156-1-shentey@gmail.com>
References: <20230127164718.98156-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Rather than using get_system_io() as the parent memory region, use
s->mch.address_space_io which is set up as an alias in the q35 machine.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/q35.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 26390863d6..fa05844319 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -50,10 +50,12 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
     Q35PCIHost *s = Q35_HOST_DEVICE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
+    memory_region_add_subregion(s->mch.address_space_io,
+                                MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, 4);
 
-    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, &pci->data_mem);
+    memory_region_add_subregion(s->mch.address_space_io,
+                                MCH_HOST_BRIDGE_CONFIG_DATA, &pci->data_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, 4);
 
     /* register q35 0xcf8 port as coalesced pio */
-- 
2.39.1


