Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F8F2DB2C6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:38:23 +0100 (CET)
Received: from localhost ([::1]:51868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEHG-0002BV-4l
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kpEFz-0001Qu-4F
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:37:03 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:48015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kpEFw-0007Oo-Qk
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:37:02 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-qYn4BY2fN2WFE3Y8uBd7rg-1; Tue, 15 Dec 2020 12:36:55 -0500
X-MC-Unique: qYn4BY2fN2WFE3Y8uBd7rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABDA010054FF;
 Tue, 15 Dec 2020 17:36:53 +0000 (UTC)
Received: from bahia.lan (ovpn-114-254.ams2.redhat.com [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76C675D9D7;
 Tue, 15 Dec 2020 17:36:52 +0000 (UTC)
Subject: [PATCH] spapr: DRC lookup cannot fail
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 15 Dec 2020 18:36:51 +0100
Message-ID: <160805381160.228955.5388294067094240175.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All memory DRC objects are created during machine init. It is thus safe
to assume spapr_drc_by_id() cannot return NULL when hot-plug/unplugging
memory.

Make this clear with an assertion, like the code already does a few lines
above when looping over memory DRCs. This fixes Coverity reports 1437757
and 1437758.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index dee48a0043bb..c283ff639040 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3424,6 +3424,7 @@ static void spapr_add_lmbs(DeviceState *dev, uint64_t=
 addr_start, uint64_t size,
         if (dedicated_hp_event_source) {
             drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
                                   addr_start / SPAPR_MEMORY_BLOCK_SIZE);
+            g_assert(drc);
             spapr_hotplug_req_add_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE=
_LMB,
                                                    nr_lmbs,
                                                    spapr_drc_index(drc));
@@ -3664,6 +3665,7 @@ static void spapr_memory_unplug_request(HotplugHandle=
r *hotplug_dev,
=20
     drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
                           addr_start / SPAPR_MEMORY_BLOCK_SIZE);
+    g_assert(drc);
     spapr_hotplug_req_remove_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE_LMB,
                                               nr_lmbs, spapr_drc_index(drc=
));
 }



