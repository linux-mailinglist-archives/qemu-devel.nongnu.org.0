Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFE31D7034
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 07:13:53 +0200 (CEST)
Received: from localhost ([::1]:46834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaY64-00008o-FV
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 01:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwp-0008P0-7k
 for qemu-devel@nongnu.org; Mon, 18 May 2020 01:04:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45689
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwm-0004LX-DF
 for qemu-devel@nongnu.org; Mon, 18 May 2020 01:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589778255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1K6O/zox7EjOUyOTTH1db7YtCR92qCVauB09g8MwOZA=;
 b=djeW98jIjmNeDtocbZaKAdrwjFgvWUNzp/VCPYTYBKMnbb6cikntinwDFdNiVd4k48Ao5a
 g/kW5iklKYkSkZvpCG40alQbPwjb/brAE31jposAnLQ3Pt0nwRqTlcW2dAbDT60/5mC7S+
 nIY/X0Rvz9q67cEBTmPzHFCZ+oHVwfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-1pTQrExOOBOxh0TIZRMUew-1; Mon, 18 May 2020 01:04:13 -0400
X-MC-Unique: 1pTQrExOOBOxh0TIZRMUew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4972E180071D;
 Mon, 18 May 2020 05:04:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D28F60FB9;
 Mon, 18 May 2020 05:04:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 38A8B11358C7; Mon, 18 May 2020 07:04:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/24] pnv/phb4: Bury unwanted "pnv-phb4-pec-stack" devices
Date: Mon, 18 May 2020 07:03:55 +0200
Message-Id: <20200518050408.4579-12-armbru@redhat.com>
In-Reply-To: <20200518050408.4579-1-armbru@redhat.com>
References: <20200518050408.4579-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, pbonzini@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The number of stacks is controlled by property "num-stacks".
pnv_pec_instance_init() creates the maximum supported number, because
the property has not been set then.  pnv_pec_realize() realizes only
the wanted number.  Works, although it can leave unrealized devices
hanging around in the QOM composition tree.  Affects machine powernv9.

Bury the unwanted devices by making pnv_pec_realize() unparent them.
Visible in "info qom-tree":

     /machine (powernv9-machine)
       /chip[0] (power9_v2.0-pnv-chip)
         [...]
         /pec[0] (pnv-phb4-pec)
           /stack[0] (pnv-phb4-pec-stack)
             [...]
    -      /stack[1] (pnv-phb4-pec-stack)
    -        /phb (pnv-phb4)
    -          /pcie-mmcfg-mmio[0] (qemu:memory-region)
    -          /root (pnv-phb4-root-port)
    -          /source (xive-source)
    -      /stack[2] (pnv-phb4-pec-stack)
    -        /phb (pnv-phb4)
    -          /pcie-mmcfg-mmio[0] (qemu:memory-region)
    -          /root (pnv-phb4-root-port)
    -          /source (xive-source)
           /xscom-pec-0.0-nest[0] (qemu:memory-region)
           /xscom-pec-0.0-pci[0] (qemu:memory-region)
         /pec[1] (pnv-phb4-pec)
           /stack[0] (pnv-phb4-pec-stack)
             [...]
           /stack[1] (pnv-phb4-pec-stack)
             [...]
    -      /stack[2] (pnv-phb4-pec-stack)
    -        /phb (pnv-phb4)
    -          /pcie-mmcfg-mmio[0] (qemu:memory-region)
    -          /root (pnv-phb4-root-port)
    -          /source (xive-source)
           /xscom-pec-0.1-nest[0] (qemu:memory-region)
           /xscom-pec-0.1-pci[0] (qemu:memory-region)
         /pec[2] (pnv-phb4-pec)
           /stack[0] (pnv-phb4-pec-stack)
             [...]
           /stack[1] (pnv-phb4-pec-stack)
             [...]
           /stack[2] (pnv-phb4-pec-stack)
             [...]

Cc: Cédric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pci-host/pnv_phb4_pec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 911d147ffd..565345a018 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -397,6 +397,9 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
+    for (; i < PHB4_PEC_MAX_STACKS; i++) {
+        object_unparent(OBJECT(&pec->stacks[i]));
+    }
 
     /* Initialize the XSCOM regions for the PEC registers */
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest", pec->chip_id,
-- 
2.21.1


