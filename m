Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8520A151277
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 23:38:48 +0100 (CET)
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iykMh-0002pQ-ID
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 17:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iykKV-0000c6-EF
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 17:36:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iykKU-0000Qn-81
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 17:36:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30626)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iykKT-0000KF-V1
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 17:36:30 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013MYrv1044404
 for <qemu-devel@nongnu.org>; Mon, 3 Feb 2020 17:36:29 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xxmkm0pn1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 17:36:28 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Mon, 3 Feb 2020 22:36:26 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 3 Feb 2020 22:36:24 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 013MaN7p50200592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Feb 2020 22:36:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27836AE090;
 Mon,  3 Feb 2020 22:36:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEF94AE095;
 Mon,  3 Feb 2020 22:36:22 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.55.193])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Feb 2020 22:36:22 +0000 (GMT)
Subject: [PATCH 3/3] spapr: Migrate SpaprDrc::unplug_requested
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Mon, 03 Feb 2020 23:36:22 +0100
In-Reply-To: <158076936422.2118610.5626450767672103134.stgit@bahia.lan>
References: <158076936422.2118610.5626450767672103134.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20020322-0008-0000-0000-0000034F696D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020322-0009-0000-0000-00004A6FF453
Message-Id: <158076938222.2118610.14456984179352959929.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_08:2020-02-02,
 2020-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1034
 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1911200001 definitions=main-2002030163
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hot unplugging a device is an asynchronous operation. If the guest is
migrated after the event was sent but before it could release the
device with RTAS, the destination QEMU doesn't know about the pending
unplug operation and doesn't actually remove the device when the guest
finally releases it. The device

Migrate SpaprDrc::unplug_requested to fix the inconsistency. This is
done with a subsection that is only sent if an unplug request is
pending. This allows to preserve migration with older guests in the
case of a pending hotplug request. This will cause migration to fail
if the destination can't handle the subsection, but this is better
than ending with an inconsistency.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_drc.c |   27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index d512ac6e1e7f..6f5cab70fc6b 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -455,6 +455,22 @@ void spapr_drc_reset(SpaprDrc *drc)
     }
 }
 
+static bool spapr_drc_unplug_requested_needed(void *opaque)
+{
+    return spapr_drc_unplug_requested(opaque);
+}
+
+static const VMStateDescription vmstate_spapr_drc_unplug_requested = {
+    .name = "spapr_drc/unplug_requested",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = spapr_drc_unplug_requested_needed,
+    .fields  = (VMStateField []) {
+        VMSTATE_BOOL(unplug_requested, SpaprDrc),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool spapr_drc_needed(void *opaque)
 {
     SpaprDrc *drc = (SpaprDrc *)opaque;
@@ -467,8 +483,11 @@ static bool spapr_drc_needed(void *opaque)
     /*
      * We need to migrate the state if it's not equal to the expected
      * long-term state, which is the same as the coldplugged initial
-     * state */
-    return !spapr_drc_device_ready(drc);
+     * state, or if an unplug request is pending.
+     */
+    return
+        spapr_drc_unplug_requested_needed(drc) ||
+        !spapr_drc_device_ready(drc);
 }
 
 static const VMStateDescription vmstate_spapr_drc = {
@@ -479,6 +498,10 @@ static const VMStateDescription vmstate_spapr_drc = {
     .fields  = (VMStateField []) {
         VMSTATE_UINT32(state, SpaprDrc),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_spapr_drc_unplug_requested,
+        NULL
     }
 };
 


