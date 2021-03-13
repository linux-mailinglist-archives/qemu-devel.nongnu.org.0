Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA9C339C89
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 08:24:57 +0100 (CET)
Received: from localhost ([::1]:48344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKyds-0003W9-A5
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 02:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKyci-00028l-6A
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 02:23:44 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:38797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKycg-00060U-G5
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 02:23:43 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-9H3O9TcfPCWTf8_Gb9BimA-1; Sat, 13 Mar 2021 02:23:35 -0500
X-MC-Unique: 9H3O9TcfPCWTf8_Gb9BimA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B966018460E4;
 Sat, 13 Mar 2021 07:23:33 +0000 (UTC)
Received: from bahia.lan (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D21760657;
 Sat, 13 Mar 2021 07:23:32 +0000 (UTC)
Subject: [PATCH] spapr: Assert DIMM unplug state in spapr_memory_unplug()
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Sat, 13 Mar 2021 08:23:31 +0100
Message-ID: <161562021166.948373.15092876234470478331.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_memory_unplug() is the last step of the hot unplug sequence.
It is indirectly called by:

 spapr_lmb_release()
  hotplug_handler_unplug()

and spapr_lmb_release() already buys us that DIMM unplug state is
present : it gets restored with spapr_recover_pending_dimm_state()
if missing.

g_assert() that spapr_pending_dimm_unplugs_find() cannot return NULL
in spapr_memory_unplug() to make this clear and silence Coverity.

Fixes: Coverity CID 1450767
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d56418ca2942..73a06df3b1b1 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3660,6 +3660,9 @@ static void spapr_memory_unplug(HotplugHandler *hotpl=
ug_dev, DeviceState *dev)
     SpaprMachineState *spapr =3D SPAPR_MACHINE(hotplug_dev);
     SpaprDimmState *ds =3D spapr_pending_dimm_unplugs_find(spapr, PC_DIMM(=
dev));
=20
+    /* We really shouldn't get this far without anything to unplug */
+    g_assert(ds);
+
     pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
     qdev_unrealize(dev);
     spapr_pending_dimm_unplugs_remove(spapr, ds);



