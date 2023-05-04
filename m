Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB26F711F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:36:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucom-0007Gj-1L; Thu, 04 May 2023 13:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pub1v-0003yI-59
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:38:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pub1e-0001DA-VH
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:38:02 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344Ck4Sn017958; Thu, 4 May 2023 15:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=STuseSvA3Qcd5nme5PJ+s144DjzyO15o9NUHFiPbfCE=;
 b=HUk9D5sWsQQgt85BWRqEV4PjSkRD1TkeR7pNxNeQH6vfd+AoCaT/OMYzsJXDXzcNg2Ez
 4wWtfKCScGtdT8lc+300NSKz+XlWQPP9VJi84f//heBWBf8pzEV13jNiqc8KMwTDifdw
 qKo4XtQ1kdMRvQ+roJblOlAtwbDQzHZTfrtT4QKpglFezbfp0/yLZcdKh1jFxu0ZR5hL
 44Fu98mCiuMdhfB4a7S34YEtQ6FShQ50KHAV6zONHnR4sZ9uOeS1olEmDyyJh6402HOM
 xZrq66jevR0UXZVl8+PpiCof24ZhzryJqr/zJdnHPZU4cGFbGYrtt5YU3g0c3EjN/NmB Cg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qc7a419u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:39 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 344Fbc0A031989; 
 Thu, 4 May 2023 15:37:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3q8vam6h1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:38 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 344FbcOO031978;
 Thu, 4 May 2023 15:37:38 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 344Fbb50031976
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:38 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id B3BCD70F1; Thu,  4 May 2023 12:37:37 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com, philmd@linaro.org,
 richard.henderson@linaro.org
Subject: [PATCH v3 2/6] gdbstub: add test for untimely stop-reply packets
Date: Thu,  4 May 2023 12:37:32 -0300
Message-Id: <a30d93b9a8d66e9d9294354cfa2fc3af35f00202.1683214375.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1683214375.git.quic_mathbern@quicinc.com>
References: <cover.1683214375.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fo8ofy_tBG10nqgkJP4ZV0Lx2YFujvog
X-Proofpoint-ORIG-GUID: fo8ofy_tBG10nqgkJP4ZV0Lx2YFujvog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_10,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040127
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In the previous commit, we modified gdbstub.c to only send stop-reply
packets as a response to GDB commands that accept it. Now, let's add a
test for this intended behavior. Running this test before the fix from
the previous commit fails as QEMU sends a stop-reply packet
asynchronously, when GDB was in fact waiting an ACK.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
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
2.37.2


