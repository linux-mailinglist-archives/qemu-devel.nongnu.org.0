Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAE56E945F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:32:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTST-0006gL-Mw; Thu, 20 Apr 2023 08:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSQ-0006e7-PY
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSL-0002tP-9w
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:14 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KBuGHj022007; Thu, 20 Apr 2023 12:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=9l+W59dDDb8fNHeexhqSHDYcEIc2aqK9wXJVbckN0Os=;
 b=LPm7Tm384bVCYn7zUrsbdRIdunC4dgdqwTKc2gSM5QMHad+8yZ3nQCtnyrUZnJC6aLHh
 x3JhGXLSGipN23TUOdj+j1kC+hfN9PBgoIUYNr+DDw/zlomXwEFf/GVNXv8/SE/2z9oU
 Lp32u830gSEumTFXhLXW1gegEundJwm4D/VFT2BQd7H7h0HvEGaZOy/3ohsXyQscHHMa
 LiqoZO6BEEm3KAwsEp+T3zw6aAvoWGkofpoZex++Xxu8G7qDSRqIKKEWFZpuEkdX8Deb
 sstgGnv1uQxs4uxv6duivSVxav7ZtsSv6agZPsx4jKimVpBao08FA9osxjEQDForzgsb OQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2p7at036-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:32:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KCVobc020236
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:31:50 GMT
Received: from NASANPPMTA03.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 05:31:47 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <alex.bennee@linaro.org>, <bcain@quicinc.com>, <f4bug@amsat.org>,
 <peter.maydell@linaro.org>, <tsimpson@quicinc.com>
Subject: [PATCH v2 RESEND 2/7] gdbstub: add test for untimely stop-reply
 packets
Date: Thu, 20 Apr 2023 09:31:23 -0300
Message-ID: <135d716c2f1cdc125a3d44f5f6a0e67da13de744.1681993775.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1681993775.git.quic_mathbern@quicinc.com>
References: <cover.1681993775.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YZvYjw-kdqssOqsBYokxW26UQ9ruH28N
X-Proofpoint-ORIG-GUID: YZvYjw-kdqssOqsBYokxW26UQ9ruH28N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_07,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304200102
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In the previous commit, we modified gdbstub.c to only send stop-reply
packets as a response to GDB commands that accept it. Now, let's add a
test for this intended behavior. Running this test before the fix from
the previous commit fails as QEMU sends a stop-reply packet
asynchronously, when GDB was in fact waiting an ACK.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 tests/guest-debug/run-test.py                    | 16 ++++++++++++----
 .../tcg/multiarch/system/Makefile.softmmu-target | 16 +++++++++++++++-
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index d865e46ecd..de6106a5e5 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -26,11 +26,12 @@ def get_args():
     parser.add_argument("--qargs", help="Qemu arguments for test")
     parser.add_argument("--binary", help="Binary to debug",
                         required=True)
-    parser.add_argument("--test", help="GDB test script",
-                        required=True)
+    parser.add_argument("--test", help="GDB test script")
     parser.add_argument("--gdb", help="The gdb binary to use",
                         default=None)
+    parser.add_argument("--gdb-args", help="Additional gdb arguments")
     parser.add_argument("--output", help="A file to redirect output to")
+    parser.add_argument("--stderr", help="A file to redirect stderr to")
 
     return parser.parse_args()
 
@@ -58,6 +59,10 @@ def log(output, msg):
         output = open(args.output, "w")
     else:
         output = None
+    if args.stderr:
+        stderr = open(args.stderr, "w")
+    else:
+        stderr = None
 
     socket_dir = TemporaryDirectory("qemu-gdbstub")
     socket_name = os.path.join(socket_dir.name, "gdbstub.socket")
@@ -77,6 +82,8 @@ def log(output, msg):
 
     # Now launch gdb with our test and collect the result
     gdb_cmd = "%s %s" % (args.gdb, args.binary)
+    if args.gdb_args:
+        gdb_cmd += " %s" % (args.gdb_args)
     # run quietly and ignore .gdbinit
     gdb_cmd += " -q -n -batch"
     # disable prompts in case of crash
@@ -84,13 +91,14 @@ def log(output, msg):
     # connect to remote
     gdb_cmd += " -ex 'target remote %s'" % (socket_name)
     # finally the test script itself
-    gdb_cmd += " -x %s" % (args.test)
+    if args.test:
+        gdb_cmd += " -x %s" % (args.test)
 
 
     sleep(1)
     log(output, "GDB CMD: %s" % (gdb_cmd))
 
-    result = subprocess.call(gdb_cmd, shell=True, stdout=output)
+    result = subprocess.call(gdb_cmd, shell=True, stdout=output, stderr=stderr)
 
     # A result of greater than 128 indicates a fatal signal (likely a
     # crash due to gdb internal failure). That's a problem for GDB and
diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
index 5f432c95f3..fe40195d39 100644
--- a/tests/tcg/multiarch/system/Makefile.softmmu-target
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -27,6 +27,20 @@ run-gdbstub-memory: memory
 		"-monitor none -display none -chardev file$(COMMA)path=$<.out$(COMMA)id=output $(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/memory.py, \
 	softmmu gdbstub support)
+
+run-gdbstub-untimely-packet: hello
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(HAVE_GDB_BIN) \
+		--gdb-args "-ex 'set debug remote 1'" \
+		--output untimely-packet.gdb.out \
+		--stderr untimely-packet.gdb.err \
+		--qemu $(QEMU) \
+		--bin $< --qargs \
+		"-monitor none -display none -chardev file$(COMMA)path=untimely-packet.out$(COMMA)id=output $(QEMU_OPTS)", \
+	"softmmu gdbstub untimely packets")
+	$(call quiet-command, \
+		(! grep -Fq 'Packet instead of Ack, ignoring it' untimely-packet.gdb.err), \
+		"GREP", "file  untimely-packet.gdb.err")
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "no guest arch support")
@@ -36,4 +50,4 @@ run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb")
 endif
 
-MULTIARCH_RUNS += run-gdbstub-memory
+MULTIARCH_RUNS += run-gdbstub-memory run-gdbstub-untimely-packet
-- 
2.39.1


