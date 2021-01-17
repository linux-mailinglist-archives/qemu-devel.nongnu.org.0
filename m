Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E92F913E
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 08:29:32 +0100 (CET)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l12V9-0007fm-JA
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 02:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1l12TW-0007D8-Lo
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 02:27:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1l12TU-0005TR-2X
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 02:27:50 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10H71aFA087510
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 02:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=SEWBEd8oU6OEvCbtNFzk0KBL9ncBgpubXWhk2y5xORI=;
 b=dunIrq/Jcp+rTd16bIlfxF8MGFnMWOIEdmbMLnAcQYiWN+uKGhWx6osV5taRYiQf6t6I
 p8jTr/PIZ4iqLs+m1z1qZ7uuEELtzxu59KiGvO/MU6XDEthsob/pD5Ji+EurTJ0hKPu1
 3ZQCnRqiJHmq7nUvtVfar1cKjMkkzqPvtMarjKWj5FX4t+7o+tm46j+CGVeUmBADzMnr
 Lh67bazrEp1PcVaIbzpp7qlhD+UoWKOxa2xrBLP3ed7/ZnXY5/2ssugbeZrMqtA6ugEb
 U8kKJdNNoXse5+Py2t/MwkzfXi8lk2wQJZzl/vPuyHkxYMX7MS8vezGmJ6t9oW5u3XWe Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 364g7arp0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 02:27:45 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10H7I4iW130371
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 02:27:45 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 364g7arp0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 17 Jan 2021 02:27:45 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10H7ME5l008783;
 Sun, 17 Jan 2021 07:27:44 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 363qs8gyd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 17 Jan 2021 07:27:44 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10H7RhDL27197700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 17 Jan 2021 07:27:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E3D87805F;
 Sun, 17 Jan 2021 07:27:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E784178064;
 Sun, 17 Jan 2021 07:27:42 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 17 Jan 2021 07:27:42 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qmp-shell: Suppress banner and prompt when stdin is not a TTY
Date: Sun, 17 Jan 2021 02:27:42 -0500
Message-Id: <20210117072742.119377-1-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-17_01:2021-01-15,
 2021-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101170041
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Dov Murik <dovmurik@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Detect whether qmp-shell's standard input is not a TTY; in such case,
assume a non-interactive mode, which suppresses the welcome banner and
the "(QEMU)" prompt.  This allows for easier consumption of qmp-shell's
output in scripts.

Example usage before this change:

    $ printf "query-status\nquery-kvm\n" | sudo scripts/qmp/qmp-shell qmp-unix-sock
    Welcome to the QMP low-level shell!
    Connected to QEMU 5.1.50

    (QEMU) {"return": {"status": "running", "singlestep": false, "running": true}}
    (QEMU) {"return": {"enabled": true, "present": true}}
    (QEMU)

Example usage after this change:

    $ printf "query-status\nquery-kvm\n" | sudo scripts/qmp/qmp-shell qmp-unix-sock
    {"return": {"status": "running", "singlestep": false, "running": true}}
    {"return": {"enabled": true, "present": true}}

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---

Notes:
    Note that this might be considered a breaking change; if users have
    automated scripts which assume that qmp-shell prints 3 lines of banner,
    this change will break their scripts.  If there are special
    considerations/procedures for breaking changes, please let me know.
    
    The rationale behaind the TTY check is to imitate python's behaviour:
    
        $ python3
        Python 3.7.5 (default, Apr 19 2020, 20:18:17)
        [GCC 9.2.1 20191008] on linux
        Type "help", "copyright", "credits" or "license" for more information.
        >>> print(19+23)
        42
        >>>
    
        $ echo 'print(19+23)' | python3
        42

 scripts/qmp/qmp-shell | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index b4d06096ab..9336066fa8 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -288,6 +288,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         self.__completer_setup()
 
     def show_banner(self, msg='Welcome to the QMP low-level shell!'):
+        if not self._interactive:
+            return
         print(msg)
         if not self._greeting:
             print('Connected')
@@ -300,6 +302,15 @@ class QMPShell(qmp.QEMUMonitorProtocol):
             return "TRANS> "
         return "(QEMU) "
 
+    def read_command(self, prompt):
+        if self._interactive:
+            return input(prompt)
+        else:
+            line = sys.stdin.readline()
+            if not line:
+                raise EOFError
+            return line
+
     def read_exec_command(self, prompt):
         """
         Read and execute a command.
@@ -307,7 +318,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         @return True if execution was ok, return False if disconnected.
         """
         try:
-            cmdline = input(prompt)
+            cmdline = self.read_command(prompt)
         except EOFError:
             print()
             return False
@@ -322,6 +333,9 @@ class QMPShell(qmp.QEMUMonitorProtocol):
     def set_verbosity(self, verbose):
         self._verbose = verbose
 
+    def set_interactive(self, interactive):
+        self._interactive = interactive
+
 class HMPShell(QMPShell):
     def __init__(self, address):
         QMPShell.__init__(self, address)
@@ -449,8 +463,9 @@ def main():
     except qemu.error:
         die('Could not connect to %s' % addr)
 
-    qemu.show_banner()
     qemu.set_verbosity(verbose)
+    qemu.set_interactive(sys.stdin.isatty())
+    qemu.show_banner()
     while qemu.read_exec_command(qemu.get_prompt()):
         pass
     qemu.close()
-- 
2.20.1


