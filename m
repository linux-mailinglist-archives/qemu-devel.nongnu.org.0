Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7163B3044B0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:17:25 +0100 (CET)
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ry0-0005LP-AL
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:17:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4RsE-0000qd-V6; Tue, 26 Jan 2021 12:11:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4RsC-0007C9-Uu; Tue, 26 Jan 2021 12:11:26 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10QH3XBP126232; Tue, 26 Jan 2021 12:11:07 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36amnnnn42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 12:11:07 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QGvXjH029222;
 Tue, 26 Jan 2021 17:11:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 368be8aywa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 17:11:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10QHAtj835127718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 17:10:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FCD94C052;
 Tue, 26 Jan 2021 17:11:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3B034C040;
 Tue, 26 Jan 2021 17:11:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 26 Jan 2021 17:11:02 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-70-48.uk.ibm.com [9.145.70.48])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 376532201ED;
 Tue, 26 Jan 2021 18:11:02 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 2/7] ppc/xive: Add firmware bit when dumping the ENDs
Date: Tue, 26 Jan 2021 18:10:54 +0100
Message-Id: <20210126171059.307867-3-clg@kaod.org>
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
 suspectscore=0 adultscore=0
 clxscore=1034 mlxlogscore=999 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260088
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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

ENDs allocated by OPAL for the HW thread VPs are tagged as owned by FW.
Dump the state in 'info pic'.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive_regs.h | 2 ++
 hw/intc/xive.c             | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/hw/ppc/xive_regs.h b/include/hw/ppc/xive_regs.h
index 787969282593..b7fde2354e31 100644
--- a/include/hw/ppc/xive_regs.h
+++ b/include/hw/ppc/xive_regs.h
@@ -236,6 +236,8 @@ typedef struct XiveEND {
     (be32_to_cpu((end)->w0) & END_W0_UNCOND_ESCALATE)
 #define xive_end_is_silent_escalation(end)              \
     (be32_to_cpu((end)->w0) & END_W0_SILENT_ESCALATE)
+#define xive_end_is_firmware(end)              \
+    (be32_to_cpu((end)->w0) & END_W0_FIRMWARE)
=20
 static inline uint64_t xive_end_qaddr(XiveEND *end)
 {
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index fa8c3d82877f..eeb4e62ba954 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1294,7 +1294,7 @@ void xive_end_pic_print_info(XiveEND *end, uint32_t=
 end_idx, Monitor *mon)
=20
     pq =3D xive_get_field32(END_W1_ESn, end->w1);
=20
-    monitor_printf(mon, "  %08x %c%c %c%c%c%c%c%c%c prio:%d nvt:%02x/%04=
x",
+    monitor_printf(mon, "  %08x %c%c %c%c%c%c%c%c%c%c prio:%d nvt:%02x/%=
04x",
                    end_idx,
                    pq & XIVE_ESB_VAL_P ? 'P' : '-',
                    pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
@@ -1305,6 +1305,7 @@ void xive_end_pic_print_info(XiveEND *end, uint32_t=
 end_idx, Monitor *mon)
                    xive_end_is_escalate(end) ? 'e' : '-',
                    xive_end_is_uncond_escalation(end)   ? 'u' : '-',
                    xive_end_is_silent_escalation(end)   ? 's' : '-',
+                   xive_end_is_firmware(end)   ? 'f' : '-',
                    priority, nvt_blk, nvt_idx);
=20
     if (qaddr_base) {
--=20
2.26.2


