Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9332A60F640
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 13:32:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo16v-0008Ro-Kt; Thu, 27 Oct 2022 07:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oo15q-0007x0-As
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:30:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oo15o-0003Lc-Hn
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:30:37 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RAtqWm017109;
 Thu, 27 Oct 2022 11:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PBEphsV3Pk4oQvtOQy/b0rfqB6CaKSrMikw+5Jy8BRk=;
 b=lwPtZF6OavDxTERqt/gmV0CGp0V8ZIhXtKNArrPu5IIjvJQvxYTP4mc6T4MjuTkO/f4y
 MSpp5wx+iO+2XF8mrlJrJ7UQVNoEFp/JgEDzxqL5AgY9K9Ddq7w9ZY5C56z8ZejV8V7o
 7EQ4arpa9cQ7ZipPcancNbYbq1tMtCOKnibVk30BkYGvo2W/n5zR8lt13ba4pHGND/By
 QuhqpZmkczzlAzjqNDUteBtbBOFHQaz1pVndSG791kbZwFDvmV+tY1uX0qnBIUPa8+uX
 c5FDduBE+A7DWX2N9gbQDNyunQy37a4T3+gQitFWl2y0umeeokgRSIHtVefYktm4n103 WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfrnwh6av-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 11:30:34 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29RAttlo017226;
 Thu, 27 Oct 2022 11:30:33 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfrnwh69v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 11:30:33 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29RBLB0P002743;
 Thu, 27 Oct 2022 11:30:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3kfahu1vtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 11:30:31 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29RBV45K53215670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 11:31:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C474AE051;
 Thu, 27 Oct 2022 11:30:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9916AE045;
 Thu, 27 Oct 2022 11:30:28 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.39.72])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Oct 2022 11:30:28 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] tests/vm: use -o IdentitiesOnly=yes for ssh
Date: Thu, 27 Oct 2022 13:30:26 +0200
Message-Id: <20221027113026.2280863-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Xh5PCivWcyLOTt6nnZN7VJ5WgREbWYuq
X-Proofpoint-GUID: KuD66Npq8yP_Dc4uTuNYDXJWoIoUz8zc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_05,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270061
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When one has a lot of keys in ~/.ssh directory, the ssh command will
try all of them before the one specified on the command line, and this
may cause the remote ssh server to reject the connection due to too
many failed authentication attempts.

Fix by adding -o IdentitiesOnly=yes, which makes the ssh client
consider only the keys specified on the command line.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/vm/basevm.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 4fd9af10b7f..2276364c42f 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -233,7 +233,8 @@ def _ssh_do(self, user, cmd, check):
                    "-o", "UserKnownHostsFile=" + os.devnull,
                    "-o",
                    "ConnectTimeout={}".format(self._config["ssh_timeout"]),
-                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file]
+                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file,
+                   "-o", "IdentitiesOnly=yes"]
         # If not in debug mode, set ssh to quiet mode to
         # avoid printing the results of commands.
         if not self.debug:
-- 
2.37.2


