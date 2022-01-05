Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEAC485079
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:57:43 +0100 (CET)
Received: from localhost ([::1]:46742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5338-0003Qw-5c
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:57:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n52xt-00074A-DS; Wed, 05 Jan 2022 04:52:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n52xr-0003gV-Fv; Wed, 05 Jan 2022 04:52:16 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2056BnGX014469; 
 Wed, 5 Jan 2022 09:51:49 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcqu1sg5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 09:51:48 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2059oeBV022939;
 Wed, 5 Jan 2022 09:51:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3daeka88ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 09:51:47 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2059pinW32440644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 09:51:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E3B4A4040;
 Wed,  5 Jan 2022 09:51:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 535F6A405D;
 Wed,  5 Jan 2022 09:51:44 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  5 Jan 2022 09:51:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4A76622011D;
 Wed,  5 Jan 2022 10:51:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/2] spapr: Fix support of POWER5+ processors
Date: Wed,  5 Jan 2022 10:51:40 +0100
Message-Id: <20220105095142.3990430-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3pmPeh_UCUC8W385Xy2LH3SZFf_poXna
X-Proofpoint-GUID: 3pmPeh_UCUC8W385Xy2LH3SZFf_poXna
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_02,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1034
 adultscore=0 mlxlogscore=613 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050063
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Grab the images under :=20

  https://github.com/legoater/qemu-ppc-boot/tree/main/buildroot/qemu_ppc64_=
pseries_p5p-2021.11-730-g4f325ce788-20220104

and run with :

  qemu-system-ppc64 -M pseries -cpu POWER5+ -m 1G -smp 2 -kernel ./vmlinux =
-append "root=3D/dev/sda" -drive file=3D./rootfs.ext2,if=3Dscsi,index=3D0,f=
ormat=3Draw  -device spapr-vlan,netdev=3Dnet0 -netdev user,id=3Dnet0 -seria=
l mon:stdio -nographic -nodefaults

CPU 970, 970MP are also well supported.=20

Virtio devices and USB should be avoided because SLOF would use a
'stdbrx' instruction (cpu_to_le64 helper) which is invalid under
POWER5+ and 970 CPUs. SLOF needs to be compiled with -mcpu=3Dpower5 to
fix this issue.

Thanks,

C.=20

C=C3=A9dric Le Goater (2):
  target/ppc: Add popcntb instruction to POWER5+ processors
  spapr: Fix support of POWER5+ processors

 hw/ppc/spapr.c        | 10 ++++++----
 target/ppc/cpu_init.c |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

--=20
2.31.1


