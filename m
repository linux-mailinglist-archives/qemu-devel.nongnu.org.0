Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3584D94EB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:57:19 +0100 (CET)
Received: from localhost ([::1]:37806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU17O-0001Fd-CW
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:57:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0p5-0002Hg-7t; Tue, 15 Mar 2022 02:38:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0p3-0007vP-N8; Tue, 15 Mar 2022 02:38:22 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22F5mJqE001768; 
 Tue, 15 Mar 2022 06:37:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etmyr8uau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:50 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22F6X6en002791;
 Tue, 15 Mar 2022 06:37:49 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etmyr8ua8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:49 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22F6XFhc027473;
 Tue, 15 Mar 2022 06:37:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3erk58n09g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:47 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22F6bjlG58393050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 06:37:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D02A2AE3AB;
 Tue, 15 Mar 2022 06:37:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95D6CAEB72;
 Tue, 15 Mar 2022 06:37:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 15 Mar 2022 06:37:41 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.77.144])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E84DB2202F6;
 Tue, 15 Mar 2022 07:37:40 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 05/20] avocado/replay_kernel.py: make tcg-icount check in
 run_vm()
Date: Tue, 15 Mar 2022 07:37:21 +0100
Message-Id: <20220315063736.592808-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315063736.592808-1-clg@kaod.org>
References: <20220315063736.592808-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iQWpsrzNwZkoq9bS1FZipPNniXZWMFX0
X-Proofpoint-ORIG-GUID: nH8uUD0mpGV4wDNkcO_0xYE5TKM8BKbF
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 spamscore=0 clxscore=1034 phishscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150042
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The icount framework relies on TCG availability. If QEMU is built with
--disable-tcg we won't have icount either, and then this test will fail
with the following message in an IBM POWER9 host:

tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_pseries:
ERROR: ConnectError: Failed to establish session:
(...)
/11-tests_avocado_replay_kernel.py_ReplayKernelNormal.test_ppc64_pseries/re=
play.bin:
cannot configure icount, TCG support not available

Although this was revealed in a specific ppc64 scenario, the TCG check
is being done in the common code inside run_vm() because all archs need
TCG to have access to icount.

Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220303153517.168943-6-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/avocado/replay_kernel.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index c68a9537301d..0b2b0dc692b1 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -36,6 +36,9 @@ class ReplayKernelBase(LinuxKernelTest):
=20
     def run_vm(self, kernel_path, kernel_command_line, console_pattern,
                record, shift, args, replay_path):
+        # icount requires TCG to be available
+        self.require_accelerator('tcg')
+
         logger =3D logging.getLogger('replay')
         start_time =3D time.time()
         vm =3D self.get_vm()
@@ -243,6 +246,7 @@ def test_ppc64_pseries(self):
         """
         :avocado: tags=3Darch:ppc64
         :avocado: tags=3Dmachine:pseries
+        :avocado: tags=3Daccel:tcg
         """
         kernel_url =3D ('https://archives.fedoraproject.org/pub/archive'
                       '/fedora-secondary/releases/29/Everything/ppc64le/os'
--=20
2.34.1


