Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC8A33345F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:28:05 +0100 (CET)
Received: from localhost ([::1]:33450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqS4-0002MW-3r
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqBH-0004BY-QL; Tue, 09 Mar 2021 23:10:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33263 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqBG-0004F1-2O; Tue, 09 Mar 2021 23:10:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWf1X15z9sXN; Wed, 10 Mar 2021 15:10:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349406;
 bh=3AWS7FrYmGGQRJ+786Ab9WyJLHqat13pZhoq+1nqIjQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=laoFRDlwyy8NCL7QCUeCiPYefEcKhnT8ucoJMtaTkAzQ7H5IErai5H7DQznLKRhrP
 08O0+fhO+AxazAlapz+2lIna4FWZXJMwFbNrK3Q2JP1cz7j0iFrWmCyy/p6gqyodUK
 9C2uj8IUZJmfIA6FAfhIeDnMlCPEN75nVQ9NH++U=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 16/20] spapr_pci.c: add 'unplug already in progress' message
 for PCI unplug
Date: Wed, 10 Mar 2021 15:09:58 +1100
Message-Id: <20210310041002.333813-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Hotunplug for all other devices are warning the user when the hotunplug
is already in progress. Do the same for PCI devices in
spapr_pci_unplug_request().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210226163301.419727-5-danielhb413@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index b00e9609ae..feba18cb12 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1743,6 +1743,10 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
                 }
             }
         }
+    } else {
+        error_setg(errp,
+                   "PCI device unplug already in progress for device %s",
+                   drc->dev->id);
     }
 }
 
-- 
2.29.2


