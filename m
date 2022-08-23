Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BFE59E5A7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:07:47 +0200 (CEST)
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQVVJ-0001lx-RW
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oQU7n-0003hG-KV
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 09:39:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:16640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oQU7l-0000AP-GU
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 09:39:23 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NDNY8i015800;
 Tue, 23 Aug 2022 13:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=02wkF4vzNcBSuDrCPmTzaOSHatZifuSyB7ELZ4x5SY4=;
 b=IAYxDbDR1bx5XJG+BGuGyidJgQertI9Xx37ccKP9jJkfbK+cLT+FFo1QbwVU+SWKO1wy
 VgBKPPEwC7mTpGK3xD8zRq0UAPViqMQR/q/0EOAP1CD4xMFmq/gVgdo0VWm/P44ORyIf
 SE3iS0vzJdBoUkGvFXEV/88Mg7YOake75Up/AV3GuD1RAqIdAQ4uwWZ7EdZgvqngS1pS
 IeLbU4knJorqbCsO6Mpv7Ita6NHI6jxT823OWJ0rvYrGmplNQ0XQecIodqd0AHp/Gdz3
 Ay/a/LyEjd3+CQdXW8UvVgliJb1V4OuyJVVbSqBptcOOdweOvRPMJqS2DL+5t0Vzs6eE 6w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j4vxcgv0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 13:39:09 +0000
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27NDd8V9020755
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 13:39:08 GMT
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 173095F8; Tue, 23 Aug 2022 10:39:08 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org
Subject: [PATCH] gdbstub: only send stop-reply upon request
Date: Tue, 23 Aug 2022 10:39:08 -0300
Message-Id: <9bb3ec5d407a5278524d54d7ad53db830b35a74c.1661260622.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8B1tq6ZPdX3Fl9lC4_SSeqr4XrnqI0S0
X-Proofpoint-ORIG-GUID: 8B1tq6ZPdX3Fl9lC4_SSeqr4XrnqI0S0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_05,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=763 clxscore=1011 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230054
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 23 Aug 2022 11:02:42 -0400
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

The GDB remote serial protocol[1] specifies that the communication
between GDB and the stub is driven by GDB:

    The host (GDB) sends commands, and the target (the debugging
    stub incorporated in your program) sends a response.

This is further emphasized by Embecosm's "Howto: GDB Remote Serial
Protocol" document[2], which says:

    This is the only circumstance under which the server sends a
    packet: in reply to a packet from the client requiring a
    response.

However, QEMU may send stop-reply packets even when not solicited by
GDB, as these are currently issued whenever the vm stops. Although this
behavior doesn't seem to cause problems with GDB itself, it does with
other debuggers that implement the GDB remote serial protocol, like
hexagon-lldb. In this case, the debugger fails when it receives an
unexpected stop-reply from QEMU as attaching to it.

Instead, let's make QEMU send stop-reply messages only as a response to
a previous GDB command, and only to commands that accept a stop-reply
packet. According to [3], these are: 'C', 'c', 'S', 's', '?', 'vCont',
'vAttach', 'vRun', and 'vStopped'. The ones starting with 'v' are not
implemented by gdbstup.c, so we only have to handle the single-letter
ones.

[1]: https://sourceware.org/gdb/download/onlinedocs/gdb/Overview.html#Overview
[2]: https://www.embecosm.com/appnotes/ean4/embecosm-howto-rsp-server-ean4-issue-2.html
[3]: https://sourceware.org/gdb/download/onlinedocs/gdb/Stop-Reply-Packets.html#Stop-Reply-Packets

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 gdbstub.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index cf869b10e3..b8fc0ce07b 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -339,6 +339,7 @@ enum RSState {
     RS_GETLINE_RLE,
     RS_CHKSUM1,
     RS_CHKSUM2,
+    RS_HANDLING_CMD,
 };
 typedef struct GDBState {
     bool init;       /* have we been initialised? */
@@ -2562,6 +2563,7 @@ static int gdb_handle_packet(const char *line_buf)
 {
     const GdbCmdParseEntry *cmd_parser = NULL;
 
+    gdbserver_state.state = RS_HANDLING_CMD;
     trace_gdbstub_io_command(line_buf);
 
     switch (line_buf[0]) {
@@ -2821,6 +2823,23 @@ void gdb_set_stop_cpu(CPUState *cpu)
 }
 
 #ifndef CONFIG_USER_ONLY
+static bool cmd_allows_stop_reply(const char *cmd)
+{
+    if (strlen(cmd) != 1) {
+        return false;
+    }
+    switch (cmd[0]) {
+    case 'C':
+    case 'c':
+    case 'S':
+    case 's':
+    case '?':
+        return true;
+    default:
+        return false;
+    }
+}
+
 static void gdb_vm_state_change(void *opaque, bool running, RunState state)
 {
     CPUState *cpu = gdbserver_state.c_cpu;
@@ -2829,7 +2848,8 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
     const char *type;
     int ret;
 
-    if (running || gdbserver_state.state == RS_INACTIVE) {
+    if (running || gdbserver_state.state != RS_HANDLING_CMD ||
+        !cmd_allows_stop_reply(gdbserver_state.line_buf)) {
         return;
     }
     /* Is there a GDB syscall waiting to be sent?  */
-- 
2.25.1


