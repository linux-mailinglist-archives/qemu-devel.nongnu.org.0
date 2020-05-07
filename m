Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3501C8152
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 07:09:26 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWYmj-00088I-T8
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 01:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jWYhx-0007eV-UQ; Thu, 07 May 2020 01:04:29 -0400
Received: from ozlabs.org ([203.11.71.1]:55927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jWYhw-0007ep-JM; Thu, 07 May 2020 01:04:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49HhFp344yz9sTD; Thu,  7 May 2020 15:04:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1588827854;
 bh=BpNRLah7EfAeUCXd8VopYmqO50hFxTiTg0i15Mff6bY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kWu7/UTIujxTPzOmMkW/aYppXBZleKCykkBBp6K7cMlwb6ng1vwJGHaJv4BL1+exG
 6q0EQU/f6UU89ph8UzkHzf6mrtl1UwrceHmlRR/UEnLyXWzs0wZ9TwbJBg2HG5i69v
 EHoz5MKZxq7Dm010C8iQbIQzPle3IICyTUy5JJOc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 11/18] spapr: Don't allow unplug of NVLink2 devices
Date: Thu,  7 May 2020 15:02:21 +1000
Message-Id: <20200507050228.802395-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507050228.802395-1-david@gibson.dropbear.id.au>
References: <20200507050228.802395-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 01:04:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, npiggin@gmail.com, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, we can't properly handle unplug of NVLink2 devices, because we
don't have code to tear down their special memory resources.  There's not
a lot of impetus to implement that: since hardware NVLink2 devices can't
be hot unplugged, the guest side drivers don't usually support unplug
anyway.

Therefore, simply prevent unplug of NVLink2 devices.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/ppc/spapr_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 55ca9dee1e..61b84a392d 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1665,6 +1665,10 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
             error_setg(errp, "PCI: Hot unplug of PCI bridges not supported");
             return;
         }
+        if (object_property_get_uint(OBJECT(pdev), "nvlink2-tgt", NULL)) {
+            error_setg(errp, "PCI: Cannot unplug NVLink2 devices");
+            return;
+        }
 
         /* ensure any other present functions are pending unplug */
         if (PCI_FUNC(pdev->devfn) == 0) {
-- 
2.26.2


