Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B2F0869
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 22:32:50 +0100 (CET)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iS6RV-0007tC-3E
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 16:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59401)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iS5qZ-0002iK-Vm
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:54:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iS5qY-0003A6-E6
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:54:39 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47290
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
 id 1iS5qY-00039d-9I; Tue, 05 Nov 2019 15:54:38 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA5Ksbeu009168; Tue, 5 Nov 2019 15:54:37 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w3dex64qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 15:54:37 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id xA5Ksal3009125;
 Tue, 5 Nov 2019 15:54:36 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w3dex64q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 15:54:36 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA5KnuW3017656;
 Tue, 5 Nov 2019 20:53:15 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 2w11e7h8uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 20:53:15 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA5KrFO551053052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2019 20:53:15 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11A12124060;
 Tue,  5 Nov 2019 20:53:15 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2118124058;
 Tue,  5 Nov 2019 20:53:14 +0000 (GMT)
Received: from localhost (unknown [9.53.179.218])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  5 Nov 2019 20:53:14 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 49/55] COLO-compare: Fix incorrect `if` logic
Date: Tue,  5 Nov 2019 14:52:37 -0600
Message-Id: <20191105205243.3766-50-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105205243.3766-1-mdroth@linux.vnet.ibm.com>
References: <20191105205243.3766-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=38 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=985 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911050170
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-001b2d01.pphosted.com id xA5Ksbeu009168
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: Jason Wang <jasowang@redhat.com>, Fan Yang <Fan_Yang@sjtu.edu.cn>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fan Yang <Fan_Yang@sjtu.edu.cn>

'colo_mark_tcp_pkt' should return 'true' when packets are the same, and
'false' otherwise.  However, it returns 'true' when
'colo_compare_packet_payload' returns non-zero while
'colo_compare_packet_payload' is just a 'memcmp'.  The result is that
COLO-compare reports inconsistent TCP packets when they are actually
the same.

Fixes: f449c9e549c ("colo: compare the packet based on the tcp sequence n=
umber")
Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Fan Yang <Fan_Yang@sjtu.edu.cn>
Signed-off-by: Jason Wang <jasowang@redhat.com>
(cherry picked from commit 1e907a32b77e5d418538453df5945242e43224fa)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 net/colo-compare.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 7489840bde..7ee17f2cf8 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -319,7 +319,7 @@ static bool colo_mark_tcp_pkt(Packet *ppkt, Packet *s=
pkt,
     *mark =3D 0;
=20
     if (ppkt->tcp_seq =3D=3D spkt->tcp_seq && ppkt->seq_end =3D=3D spkt-=
>seq_end) {
-        if (colo_compare_packet_payload(ppkt, spkt,
+        if (!colo_compare_packet_payload(ppkt, spkt,
                                         ppkt->header_size, spkt->header_=
size,
                                         ppkt->payload_size)) {
             *mark =3D COLO_COMPARE_FREE_SECONDARY | COLO_COMPARE_FREE_PR=
IMARY;
@@ -329,7 +329,7 @@ static bool colo_mark_tcp_pkt(Packet *ppkt, Packet *s=
pkt,
=20
     /* one part of secondary packet payload still need to be compared */
     if (!after(ppkt->seq_end, spkt->seq_end)) {
-        if (colo_compare_packet_payload(ppkt, spkt,
+        if (!colo_compare_packet_payload(ppkt, spkt,
                                         ppkt->header_size + ppkt->offset=
,
                                         spkt->header_size + spkt->offset=
,
                                         ppkt->payload_size - ppkt->offse=
t)) {
@@ -348,7 +348,7 @@ static bool colo_mark_tcp_pkt(Packet *ppkt, Packet *s=
pkt,
         /* primary packet is longer than secondary packet, compare
          * the same part and mark the primary packet offset
          */
-        if (colo_compare_packet_payload(ppkt, spkt,
+        if (!colo_compare_packet_payload(ppkt, spkt,
                                         ppkt->header_size + ppkt->offset=
,
                                         spkt->header_size + spkt->offset=
,
                                         spkt->payload_size - spkt->offse=
t)) {
--=20
2.17.1


