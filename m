Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644305BEA33
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 17:27:50 +0200 (CEST)
Received: from localhost ([::1]:51028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oafA5-0002hD-33
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 11:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oacen-0003IE-6b
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:47:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:16014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oaceg-0004pA-0T
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:47:16 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K7xnwB000545;
 Tue, 20 Sep 2022 12:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=lGKe4l4O9tCjS4640g8Z4QS+1KRkCseWg0XW4uUq4sg=;
 b=LXGQidIsqM1oqaJyHZfo3nCBShFBr2V22Ef0HYAUW1/VLExKy2ifXdMQmbZMFtd1p2Jw
 jA1i4BYy7M6e2k4r11O1p16DTzUzBJlWHK/0sgnaAwBdUrB3qG5rmYe57XescfyZ2Bzp
 Xyo00bDPyBKPbPHvyrOJQS2a1/kSyu8eQmzNGL5ES26iGdb0UrzkpxOQboagn3Vm4wKR
 QHEU6Q3EE/QEKnS/xPSn8Jg1MwZhZu3ImMp1e4ANTyqSTVY1Ve3xVGh8ZYv4OFXJ72Dc
 URH11dP7rWh7Rjv8tvyFTbXwwJlibIeaZk4MLrCzQmBaZZ/0d7GPhhpO/mHQPRe10L3Z nQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jq7321mbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:08 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28KCl7Aj013281; 
 Tue, 20 Sep 2022 12:47:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3jnqmj1670-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:07 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KCl7Yr013272;
 Tue, 20 Sep 2022 12:47:07 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 28KCl6J7013268
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:07 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id DBEFD4DD2; Tue, 20 Sep 2022 09:47:06 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: bcain@quicinc.com, alex.bennee@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org
Subject: [PATCH v3 3/3] gdbstub: add test for untimely stop-reply packets
Date: Tue, 20 Sep 2022 09:47:03 -0300
Message-Id: <352d1e6a9290ef7eb9a09e9b647f8d48edcd6ad5.1663677789.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1663677789.git.quic_mathbern@quicinc.com>
References: <cover.1663677789.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4Y-9uqdaxSJKxlW_3cgwooIQCY5jcmW_
X-Proofpoint-GUID: 4Y-9uqdaxSJKxlW_3cgwooIQCY5jcmW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209200074
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index 625ed792c6..1bb6d89097 100644
--- a/tests/tcg/multiarch/system/Makefile.softmmu-target
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -27,9 +27,23 @@ run-gdbstub-memory: memory
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/memory.py, \
 	"softmmu gdbstub support")
 
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
+
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb")
 endif
 
-MULTIARCH_RUNS += run-gdbstub-memory
+MULTIARCH_RUNS += run-gdbstub-memory run-gdbstub-untimely-packet
-- 
2.37.2


