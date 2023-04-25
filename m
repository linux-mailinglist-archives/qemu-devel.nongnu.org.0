Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA406EE584
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:18:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLKb-00021b-Pd; Tue, 25 Apr 2023 12:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1prLKO-0001iH-OE; Tue, 25 Apr 2023 12:15:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1prLKJ-0004JW-0m; Tue, 25 Apr 2023 12:15:39 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PGAJR4025777; Tue, 25 Apr 2023 16:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=58/fmJ9hc2UeeAcAzaiaPNmhukmnBY/8vh7F08+A2pQ=;
 b=gsGreOv6GZK/NLwDJZgl3j2H5T+vE7ANyznNP9q+DdZOZ8UCpkqqetRfDSgT/hicLCDC
 Z3tdV/XugJMxfiUJhF67LfgKxq5FM28vbLkzs2vYFQbls+hCjD8G3aMC1odMnGioTox3
 2EH65qopecwBavrHmnBDx+OmDrO++t7EktXnaK9wn4fe6hAL9bh4KG92wWfvZiYjuJ5a
 Qx/bsMF286TdTd6/euLFKnRjg/RlgZ4P6zndoQzQ9P1Rmmkl8maeWwCavcOCDRpFnz1e
 rSRdm433l9TtrVwnVoZTmhwViJ5jaAk0IUFDK9j42FQUfttP9o73qtWf/37yyWfAqsf6 LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6htbs027-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 16:15:20 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33PGCZ9x012997;
 Tue, 25 Apr 2023 16:15:20 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6htbryyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 16:15:20 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33ONbbuP026564;
 Tue, 25 Apr 2023 16:15:16 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q47771v74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 16:15:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33PGFBcO24445668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Apr 2023 16:15:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB5DD20077;
 Tue, 25 Apr 2023 16:15:10 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C96720071;
 Tue, 25 Apr 2023 16:15:10 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com (unknown
 [9.152.222.242])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 25 Apr 2023 16:15:10 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Subject: [PATCH v20 18/21] tests/avocado: s390x cpu topology test socket full
Date: Tue, 25 Apr 2023 18:14:53 +0200
Message-Id: <20230425161456.21031-19-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230425161456.21031-1-pmorel@linux.ibm.com>
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4lz-O5kTY2eUmH8tIorFnEXd3pOjme7z
X-Proofpoint-ORIG-GUID: HPVEVtFuz6XhF6fBuftAXVd5m0sAC3db
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_07,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250144
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This test verifies that QMP set-cpu-topology does not accept
to overload a socket.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 tests/avocado/s390_topology.py | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/avocado/s390_topology.py b/tests/avocado/s390_topology.py
index 59ec253f34..dfa33ada48 100644
--- a/tests/avocado/s390_topology.py
+++ b/tests/avocado/s390_topology.py
@@ -334,3 +334,30 @@ def test_dedicated(self):
                 '/bin/cat /sys/devices/system/cpu/dispatching', '0')
 
         self.check_topology(0, 0, 0, 0, 'high', True)
+
+    def test_socket_full(self):
+        """
+        This test verifies that QEMU does not accept to overload a socket.
+        The socket-id 0 on book-id 0 already contains CPUs 0 and 1 and can
+        not accept any new CPU while socket-id 0 on book-id 1 is free.
+
+        :avocado: tags=arch:s390x
+        :avocado: tags=machine:s390-ccw-virtio
+        """
+        self.kernel_init()
+        self.vm.add_args('-smp',
+                         '1,drawers=2,books=2,sockets=3,cores=2,maxcpus=24')
+        self.vm.add_args('-device', 'z14-s390x-cpu,core-id=1')
+        self.vm.add_args('-device', 'z14-s390x-cpu,core-id=2')
+        self.vm.launch()
+        self.wait_for_console_pattern('no job control')
+
+        self.system_init()
+
+        res = self.vm.qmp('set-cpu-topology',
+                          {'core-id': 2, 'socket-id': 0, 'book-id': 0})
+        self.assertEqual(res['error']['class'], 'GenericError')
+
+        res = self.vm.qmp('set-cpu-topology',
+                          {'core-id': 2, 'socket-id': 0, 'book-id': 1})
+        self.assertEqual(res['return'], {})
-- 
2.31.1


