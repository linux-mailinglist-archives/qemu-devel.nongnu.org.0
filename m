Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA40151276
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 23:38:25 +0100 (CET)
Received: from localhost ([::1]:47986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iykMK-0002JF-1e
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 17:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iykKS-0000WV-Ns
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 17:36:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iykKQ-00005Y-Kv
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 17:36:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13766)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iykKQ-0008S0-Be
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 17:36:26 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013MZBj1057387
 for <qemu-devel@nongnu.org>; Mon, 3 Feb 2020 17:36:25 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xxtbhuvu8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 17:36:23 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Mon, 3 Feb 2020 22:36:21 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 3 Feb 2020 22:36:18 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 013MaHjP28573842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Feb 2020 22:36:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37C0611C092;
 Mon,  3 Feb 2020 22:36:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0024A11C08C;
 Mon,  3 Feb 2020 22:36:16 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.55.193])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Feb 2020 22:36:16 +0000 (GMT)
Subject: [PATCH 2/3] spapr: Detect hot unplugged devices during CAS
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Mon, 03 Feb 2020 23:36:16 +0100
In-Reply-To: <158076936422.2118610.5626450767672103134.stgit@bahia.lan>
References: <158076936422.2118610.5626450767672103134.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20020322-0008-0000-0000-0000034F696C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020322-0009-0000-0000-00004A6FF452
Message-Id: <158076937624.2118610.5063572290769102838.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_08:2020-02-02,
 2020-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 clxscore=1034 mlxscore=0 mlxlogscore=808
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2002030163
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

We can't properly handle hotplug of a device as long the guest kernel isn't
fully booted. We detect this at CAS and potentially trigger a CAS reboot to
complete the hotplug sequence.

The same goes actually with hot unplug but we currently don't detect it.
Doing device_del before CAS hence seems to be ignored: when the guest
is booted, it still sees the _unplugged_ device in the DT and configures
it. But if some other hotplug event happens later, then the unplug request
is finally processed by the guest and the device goes away.

This doesn't seem to cause any crash but it is still very confusing. Detect
device unplug at CAS and request a CAS reboot.

Hopefully, when SLOF will know how to handle device addition and deletion
in its DT according to the FDT provided by QEMU at CAS, we'll be able to
address this differently (ie, coldplugging the new devices and removing the
ones with a pending unplug request).

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_hcall.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7a33d79bbae9..84690cc2c1ce 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1659,7 +1659,7 @@ static bool spapr_hotplugged_dev_before_cas(void)
         if (!drc->dev) {
             continue;
         }
-        if (!spapr_drc_device_ready(drc)) {
+        if (spapr_drc_unplug_requested(drc) || !spapr_drc_device_ready(drc)) {
             return true;
         }
     }


