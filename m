Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1791C1F3AAD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 14:31:56 +0200 (CEST)
Received: from localhost ([::1]:48468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jidQ3-0003qh-2O
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 08:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jidII-0003Is-Or
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 08:23:54 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49798
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jidIG-0005Qz-Ji
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 08:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591705429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aeA0wfSJDMkjjGMJjWZntFIJpDitRTQft2H7vy8OhsM=;
 b=HTCIL1JFELfTlj+9lYL33WnbsYSmt7eLO++9faTO7VTQJF6fEdEvM4cQUrIByxk1e/BkSl
 E9fAoYgtI1AcecbN42j7sFljgO6LLyCbYUjaJT6M17iEMHBzaZVdRtHtfWToc9Hwuqg485
 SKEqCt1PXD4gjC5rlHkQ8GHYql9jsNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-7Egu5-9BMrmVI_J_eau8CQ-1; Tue, 09 Jun 2020 08:23:46 -0400
X-MC-Unique: 7Egu5-9BMrmVI_J_eau8CQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFF5AA0BDB;
 Tue,  9 Jun 2020 12:23:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F6D35C1C3;
 Tue,  9 Jun 2020 12:23:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1D4271138465; Tue,  9 Jun 2020 14:23:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/24] ppc/pnv: Put "*-pnv-chip" and "pnv-xive" on the main
 system bus
Date: Tue,  9 Jun 2020 14:23:31 +0200
Message-Id: <20200609122339.937862-17-armbru@redhat.com>
In-Reply-To: <20200609122339.937862-1-armbru@redhat.com>
References: <20200609122339.937862-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001, URIBL_SBL=1.623,
 URIBL_SBL_A=0.1 autolearn=_AUTOLEARN
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

pnv_init() creates "power10_v1.0-pnv-chip", "power8_v2.0-pnv-chip",
"power8e_v2.1-pnv-chip", "power8nvl_v1.0-pnv-chip", or
"power9_v2.0-pnv-chip" sysbus devices in a way that leaves them
unplugged.

pnv_chip_power9_instance_init() creates a "pnv-xive" sysbus device in
a way that leaves it unplugged.

Create them the common way that puts them into the main system bus.
Affects machines powernv8, powernv9, and powernv10.  Visible in "info
qtree".  Here's the change for powernv9:

     bus: main-system-bus
       type System
    +  dev: power9_v2.0-pnv-chip, id ""
    +    chip-id = 0 (0x0)
    +    ram-start = 0 (0x0)
    +    ram-size = 1879048192 (0x70000000)
    +    nr-cores = 1 (0x1)
    +    cores-mask = 72057594037927935 (0xffffffffffffff)
    +    nr-threads = 1 (0x1)
    +    num-phbs = 6 (0x6)
    +    mmio 000603fc00000000/0000000400000000
    [...]
    +  dev: pnv-xive, id ""
    +    ic-bar = 1692157036462080 (0x6030203100000)
    +    vc-bar = 1689949371891712 (0x6010000000000)
    +    pc-bar = 1690499127705600 (0x6018000000000)
    +    tm-bar = 1692157036986368 (0x6030203180000)

Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 806a5d9a8d..9d1a11adb7 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -818,7 +818,7 @@ static void pnv_init(MachineState *machine)
     pnv->chips = g_new0(PnvChip *, pnv->num_chips);
     for (i = 0; i < pnv->num_chips; i++) {
         char chip_name[32];
-        Object *chip = object_new(chip_typename);
+        Object *chip = OBJECT(qdev_create(NULL, chip_typename));
 
         pnv->chips[i] = PNV_CHIP(chip);
 
@@ -1317,8 +1317,8 @@ static void pnv_chip_power9_instance_init(Object *obj)
     PnvChipClass *pcc = PNV_CHIP_GET_CLASS(obj);
     int i;
 
-    object_initialize_child(obj, "xive", &chip9->xive, sizeof(chip9->xive),
-                            TYPE_PNV_XIVE, &error_abort, NULL);
+    sysbus_init_child_obj(obj, "xive", &chip9->xive, sizeof(chip9->xive),
+                          TYPE_PNV_XIVE);
     object_property_add_alias(obj, "xive-fabric", OBJECT(&chip9->xive),
                               "xive-fabric");
 
-- 
2.26.2


