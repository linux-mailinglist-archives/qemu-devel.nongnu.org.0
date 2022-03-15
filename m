Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6594D94D5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:48:51 +0100 (CET)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU0zC-0003sX-HW
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:48:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0om-0002Az-Ko; Tue, 15 Mar 2022 02:38:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50096
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0ok-0007rY-BU; Tue, 15 Mar 2022 02:38:03 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22F5gDBU015110; 
 Tue, 15 Mar 2022 06:37:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3etmvf8x62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:47 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22F6PXkY032459;
 Tue, 15 Mar 2022 06:37:47 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3etmvf8x5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22F6XCSS000698;
 Tue, 15 Mar 2022 06:37:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3erk58wun0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:45 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22F6bgMY27066658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 06:37:42 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41561AE17C;
 Tue, 15 Mar 2022 06:37:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4047BAE219;
 Tue, 15 Mar 2022 06:37:40 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 15 Mar 2022 06:37:40 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.77.144])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9614F2202F6;
 Tue, 15 Mar 2022 07:37:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 03/20] avocado/boot_linux_console.py: check for tcg in
 test_ppc_powernv8/9
Date: Tue, 15 Mar 2022 07:37:19 +0100
Message-Id: <20220315063736.592808-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315063736.592808-1-clg@kaod.org>
References: <20220315063736.592808-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MmTXv4lC--EKK7zJyRY_Ih23dedSUFwJ
X-Proofpoint-ORIG-GUID: 1ihxwgDbFYmz0PK793ey6QSpWqw54Fps
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=859 bulkscore=0 lowpriorityscore=0 clxscore=1034 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150042
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The PowerNV8/9 machines does not work with KVM acceleration, meaning
that boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8/9 tests
will always fail when QEMU is compiled with --disable-tcg:

ERROR 1-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_power=
nv8
-> VMLaunchFailure: ConnectError: Failed to establish session:
[Errno 104] Connection reset by peer
        Exit code: 1
        Command: ./qemu-system-ppc64 -display none -vga none -chardev socke=
t,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_no19zg0m/qemu-1936936-7fffa77cff98=
-monitor.sock -mon chardev=3Dmon,mode=3Dcontrol -machine powernv8 -chardev =
socket,id=3Dconsole,path=3D/var/tmp/avo_qemu_sock_no19zg0m/qemu-1936936-7ff=
fa77cff98-console.sock,server=3Don,wait=3Doff -serial chardev:console -kern=
el /home/danielhb/avocado/data/cache/by_location/4514304e2c4ee84c5f0b5c8bac=
edda783891df68/zImage.epapr -append console=3Dtty0 console=3Dhvc0 -device p=
cie-pci-bridge,id=3Dbridge1,bus=3Dpcie.1,addr=3D0x0 -device nvme,bus=3Dpcie=
.2,addr=3D0x0,serial=3D1234 -device e1000e,bus=3Dbridge1,addr=3D0x3 -device=
 nec-usb-xhci,bus=3Dbridge1,addr=3D0x2
        Output: qemu-system-ppc64: The powernv machine does not work with K=
VM acceleration

Let's add the TCG accel requirement in both tests to skip them if we
don't have TCG support available.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220303153517.168943-4-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/avocado/boot_linux_console.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux=
_console.py
index 9c618d4809f9..d7d913032985 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1170,6 +1170,7 @@ def test_ppc64_e500(self):
         self.do_test_advcal_2018('19', tar_hash, 'uImage')
=20
     def do_test_ppc64_powernv(self, proc):
+        self.require_accelerator("tcg")
         images_url =3D ('https://github.com/open-power/op-build/releases/d=
ownload/v2.7/')
=20
         kernel_url =3D images_url + 'zImage.epapr'
@@ -1194,6 +1195,7 @@ def test_ppc_powernv8(self):
         """
         :avocado: tags=3Darch:ppc64
         :avocado: tags=3Dmachine:powernv8
+        :avocado: tags=3Daccel:tcg
         """
         self.do_test_ppc64_powernv('P8')
=20
@@ -1201,6 +1203,7 @@ def test_ppc_powernv9(self):
         """
         :avocado: tags=3Darch:ppc64
         :avocado: tags=3Dmachine:powernv9
+        :avocado: tags=3Daccel:tcg
         """
         self.do_test_ppc64_powernv('P9')
=20
--=20
2.34.1


