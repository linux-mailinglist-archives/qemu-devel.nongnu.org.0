Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847443044B8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:17:28 +0100 (CET)
Received: from localhost ([::1]:59032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ry1-0005NU-Qi
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4RsF-0000sT-UM; Tue, 26 Jan 2021 12:11:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4RsE-0007CJ-8A; Tue, 26 Jan 2021 12:11:27 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10QH2ac8055267; Tue, 26 Jan 2021 12:11:07 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36aj4c1kc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 12:11:07 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QGwkDp031299;
 Tue, 26 Jan 2021 17:11:04 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 368be81hsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 17:11:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10QHB2UX39256404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 17:11:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 817BB4203F;
 Tue, 26 Jan 2021 17:11:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 471C242041;
 Tue, 26 Jan 2021 17:11:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 26 Jan 2021 17:11:02 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-70-48.uk.ibm.com [9.145.70.48])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8970622013C;
 Tue, 26 Jan 2021 18:11:01 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 1/7] ppc/pnv: Add trace events for PCI event notification
Date: Tue, 26 Jan 2021 18:10:53 +0100
Message-Id: <20210126171059.307867-2-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126171059.307867-1-clg@kaod.org>
References: <20210126171059.307867-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_09:2021-01-26,
 2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 mlxscore=0 spamscore=0 clxscore=1034 malwarescore=0
 mlxlogscore=948 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260086
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On POWER9 systems, PHB controllers signal the XIVE interrupt controller
of a source interrupt notification using a store on a MMIO region. Add
traces for such events.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/pnv_xive.c       | 3 +++
 hw/pci-host/pnv_phb4.c   | 3 +++
 hw/intc/trace-events     | 3 +++
 hw/pci-host/trace-events | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 5f69626b3a8d..ad43483612e5 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -24,6 +24,7 @@
 #include "hw/ppc/xive_regs.h"
 #include "hw/qdev-properties.h"
 #include "hw/ppc/ppc.h"
+#include "trace.h"
=20
 #include <libfdt.h>
=20
@@ -1319,6 +1320,8 @@ static void pnv_xive_ic_hw_trigger(PnvXive *xive, h=
waddr addr, uint64_t val)
     uint8_t blk;
     uint32_t idx;
=20
+    trace_pnv_xive_ic_hw_trigger(addr, val);
+
     if (val & XIVE_TRIGGER_END) {
         xive_error(xive, "IC: END trigger at @0x%"HWADDR_PRIx" data 0x%"=
PRIx64,
                    addr, val);
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 6328e985f81c..54f57c660a94 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -22,6 +22,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "trace.h"
=20
 #define phb_error(phb, fmt, ...)                                        =
\
     qemu_log_mask(LOG_GUEST_ERROR, "phb4[%d:%d]: " fmt "\n",            =
\
@@ -1257,6 +1258,8 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, =
uint32_t srcno)
     uint64_t data =3D XIVE_TRIGGER_PQ | offset | srcno;
     MemTxResult result;
=20
+    trace_pnv_phb4_xive_notify(notif_port, data);
+
     address_space_stq_be(&address_space_memory, notif_port, data,
                          MEMTXATTRS_UNSPECIFIED, &result);
     if (result !=3D MEMTX_OK) {
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 8ed397a0d587..45ddaf48df8e 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -236,3 +236,6 @@ xive_tctx_tm_write(uint64_t offset, unsigned int size=
, uint64_t value) "@0x0x%"P
 xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@=
0x0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
 xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "=
found NVT 0x%x/0x%x ring=3D0x%x"
 xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "=
END 0x%x/0x%x @0x0x%"PRIx64
+
+# pnv_xive.c
+pnv_xive_ic_hw_trigger(uint64_t addr, uint64_t val) "@0x%"PRIx64" val=3D=
0x%"PRIx64
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index d19ca9aef6f7..7d8063ac4212 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -20,3 +20,6 @@ unin_data_write(uint64_t addr, unsigned len, uint64_t v=
al) "write addr 0x%"PRIx6
 unin_data_read(uint64_t addr, unsigned len, uint64_t val) "read addr 0x%=
"PRIx64 " len %d val 0x%"PRIx64
 unin_write(uint64_t addr, uint64_t value) "addr=3D0x%" PRIx64 " val=3D0x=
%"PRIx64
 unin_read(uint64_t addr, uint64_t value) "addr=3D0x%" PRIx64 " val=3D0x%=
"PRIx64
+
+# pnv_phb4.c
+pnv_phb4_xive_notify(uint64_t notif_port, uint64_t data) "notif=3D@0x%"P=
RIx64" data=3D0x%"PRIx64
--=20
2.26.2


