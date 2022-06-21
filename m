Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610AD553918
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:43:44 +0200 (CEST)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3huh-0003cQ-Em
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hmG-00034a-71; Tue, 21 Jun 2022 13:35:00 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:39562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hmE-0002Mp-O1; Tue, 21 Jun 2022 13:34:59 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-101dc639636so9465417fac.6; 
 Tue, 21 Jun 2022 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3COvtPLp8gq9jm3OulvWR91jjHHNwIwWcQWcPFWJeMc=;
 b=bTRo3X0vgA66CilyRKmEJGbz6hSYR9OaeKn4Sl8r7Q4a/wfixW716pTsUcHchhsz94
 4rARIeVBOirV5+5cpo29EqDwW7//V77MV7iPizIYSCuCNlyjXpjCSD9y74lP2MwB9TTN
 q+MHh7qcT1iAVPjuFLLI6+WRVIxcA3CQD6Y7pqFYmwMJcexGeVRJCQfXwgayzryEAmSw
 QK5wND6dp07OnpK5VxBK7la7zuUSVEmpcCtOVQGB3NruipjDgF7WHJeyleZvWLWCdhAT
 RaxbejSsJO18vKAgt61ATSiavnNQSUBgUn+b3GhgFrezDBx1R8K5OXuRmtoiF59GUJpW
 xuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3COvtPLp8gq9jm3OulvWR91jjHHNwIwWcQWcPFWJeMc=;
 b=Ip1eABLYJAXtNtWirFd48oZUBXsX+RCdG/QlRoubtxkGDKjCoOlvVr+4evnTS31FoY
 UYZ7fBO9BALKdwLEanFeLd6/7hhquDmYAoTCWfmPSEsfl9WNSYpc1iconib84mcQJkGr
 i2o9MdiZThnaCuLUEOIi/KzQqoNl1KKuwunGa4qXhtWNyA1JZIEsPRYCSo1hBaohygLW
 p+UBObYH/kW6hZ3gHc3ZYB1eT4wvzo8wkCAF0xox4twVYUPQO6JlwxlGpjEcWcTAbv3f
 OWXd4tbP2vfqCYIMOTkMgmc7CW5b7+d9q/xPxtSDMOC4qVKV8QHzWl+9xa5H50ElivxP
 cDjw==
X-Gm-Message-State: AJIora8o4dX4j/yUcbyqxJwCAt1nt+HHRkNY90NcqBGzs4CBNpBarjOO
 uMFrZEBB7ulz8m6seXHfvzB/PKh9PDocuw==
X-Google-Smtp-Source: AGRyM1vLSG5X0cuhBr4/i9T9kP36Ks0jxcDwir19qu47ki8o0X0vt+8r95LdlZY3fCPxan1dR8gMtw==
X-Received: by 2002:a05:6870:4210:b0:f3:20cd:7904 with SMTP id
 u16-20020a056870421000b000f320cd7904mr21960509oac.284.1655832896669; 
 Tue, 21 Jun 2022 10:34:56 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a056870385600b0010200e2828fsm2886556oal.30.2022.06.21.10.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:34:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 7/8] ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb3 root
 bus
Date: Tue, 21 Jun 2022 14:34:35 -0300
Message-Id: <20220621173436.165912-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621173436.165912-1-danielhb413@gmail.com>
References: <20220621173436.165912-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
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
Fixes: 9ae1329ee2fe ("ppc/pnv: Add models for POWER8 PHB3 PCIe Host bridge")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index afe5698167..d58d3c1701 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1130,10 +1130,6 @@ static const TypeInfo pnv_phb3_root_bus_info = {
     .name = TYPE_PNV_PHB3_ROOT_BUS,
     .parent = TYPE_PCIE_BUS,
     .class_init = pnv_phb3_root_bus_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_PCIE_DEVICE },
-        { }
-    },
 };
 
 static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
-- 
2.36.1


