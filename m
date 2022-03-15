Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC24D94FB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:03:51 +0100 (CET)
Received: from localhost ([::1]:52006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU1Di-0002ZG-9U
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:03:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0ot-0002E5-Cy; Tue, 15 Mar 2022 02:38:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0oq-0007sx-Se; Tue, 15 Mar 2022 02:38:11 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22F6NZS8017147; 
 Tue, 15 Mar 2022 06:37:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eteqmy1v8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:52 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22F6QmIV006037;
 Tue, 15 Mar 2022 06:37:51 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eteqmy1uc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:51 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22F6XbwU027964;
 Tue, 15 Mar 2022 06:37:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3erk58n09j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:49 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22F6bkTI37290434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 06:37:47 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCF424C35E;
 Tue, 15 Mar 2022 06:37:46 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 937634C3F7;
 Tue, 15 Mar 2022 06:37:46 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 15 Mar 2022 06:37:46 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.77.144])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D5BFE22008A;
 Tue, 15 Mar 2022 07:37:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 13/20] avocado/ppc_prep_40p.py: check TCG accel in all tests
Date: Tue, 15 Mar 2022 07:37:29 +0100
Message-Id: <20220315063736.592808-14-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315063736.592808-1-clg@kaod.org>
References: <20220315063736.592808-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BmXo0KtQPQyqN3dv6N4VUjvkdgeEPEyl
X-Proofpoint-ORIG-GUID: fnT8ksvVcSnsModVbXWywM7sajxaQ7fd
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1034
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150042
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

All tests in the file times out when running in an IBM POWER host and
--disable-tcg with an error like the following:

        Command: ./qemu-system-ppc -display none -vga none (...)
-machine 40p (...)
        Output: qemu-system-ppc: Register sync failed... If you're using
kvm-hv.ko, only "-cpu host" is possible
qemu-system-ppc: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argu=
ment

Since we don't have a way to detect whether the host is running kvm_hv
or kvm_pr, skip all tests if TCG is not available.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220310183011.110391-9-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/avocado/ppc_prep_40p.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/avocado/ppc_prep_40p.py b/tests/avocado/ppc_prep_40p.py
index 4bd956584d6d..d4f1eb7e1d87 100644
--- a/tests/avocado/ppc_prep_40p.py
+++ b/tests/avocado/ppc_prep_40p.py
@@ -28,7 +28,9 @@ def test_factory_firmware_and_netbsd(self):
         :avocado: tags=3Dmachine:40p
         :avocado: tags=3Dos:netbsd
         :avocado: tags=3Dslowness:high
+        :avocado: tags=3Daccel:tcg
         """
+        self.require_accelerator("tcg")
         bios_url =3D ('http://ftpmirror.your.org/pub/misc/'
                     'ftp.software.ibm.com/rs6000/firmware/'
                     '7020-40p/P12H0456.IMG')
@@ -51,7 +53,9 @@ def test_openbios_192m(self):
         """
         :avocado: tags=3Darch:ppc
         :avocado: tags=3Dmachine:40p
+        :avocado: tags=3Daccel:tcg
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.add_args('-m', '192') # test fw_cfg
=20
@@ -65,7 +69,9 @@ def test_openbios_and_netbsd(self):
         :avocado: tags=3Darch:ppc
         :avocado: tags=3Dmachine:40p
         :avocado: tags=3Dos:netbsd
+        :avocado: tags=3Daccel:tcg
         """
+        self.require_accelerator("tcg")
         drive_url =3D ('https://archive.netbsd.org/pub/NetBSD-archive/'
                      'NetBSD-7.1.2/iso/NetBSD-7.1.2-prep.iso')
         drive_hash =3D 'ac6fa2707d888b36d6fa64de6e7fe48e'
--=20
2.34.1


