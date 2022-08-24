Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72515A0133
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:15:52 +0200 (CEST)
Received: from localhost ([::1]:37894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuus-0006nl-RF
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oQuXj-0006Ee-5z
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:51:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:1084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oQuXh-0006qD-0Y
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:51:54 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27OE6bL9017531;
 Wed, 24 Aug 2022 17:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=aS8Vqq2L2zOD3ax8tmNsRyTkaVLfYnC06R68svcmNvA=;
 b=bYrhOrPP3ek0DDzPbDKZC6C3yk+r31H+g3rhz0NGXri7CrY3LNo6P6DqjKtiPHVuyNkA
 9pbdbZDwbPVuIh+hw+JVb9Y5C5VgrI5Y+weZa+PZk3Bn8c6CjX6v7WwS7+BGPq/YCrFt
 QkK2kHqRep5JU+MpMRFEQq7j1kZcIZKn+N69+aj81/n1v0S/eDS/TJukmcano/SN+OZe
 7hSWEJ5D2g1EawjUYxJB/3n5mWHYn4FaAveGoxvor34cTgarF/SFV1JxCGwG+CsLMcVj
 cfP6Th40dF9vXfihsWRsdy9XDJQB79Wpn/Wips+QGJgrF7zR4flZhF7tPABgCsvJJWsI ww== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52pjmcpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 17:51:40 +0000
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27OHpdQq013641
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 17:51:39 GMT
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id DF07059B; Wed, 24 Aug 2022 14:51:39 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [RFC PATCH v2] gdbstub: only send stop-reply packets when allowed to
Date: Wed, 24 Aug 2022 14:51:32 -0300
Message-Id: <ba99db564c3aeb1812bdfbc9116849092334482f.1661362557.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9bb3ec5d407a5278524d54d7ad53db830b35a74c.1661260622.git.quic_mathbern@quicinc.com>
References: <9bb3ec5d407a5278524d54d7ad53db830b35a74c.1661260622.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: K8OOKvzvr5f5E3e3Fiucm_5gllJSfFdY
X-Proofpoint-GUID: K8OOKvzvr5f5E3e3Fiucm_5gllJSfFdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_11,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=645
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240065
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB's remote serial protocol allows stop-reply messages to be sent by
the stub either as a notification packet or as a reply to a GDB command
(provided that the cmd accepts such a response). QEMU currently does not
implement notification packets, so it should only send stop-replies
synchronously and when requested. Nevertheless, it may still issue
unsolicited stop messages through gdb_vm_state_change().

Although this behavior doesn't seem to cause problems with GDB itself,
it does with other debuggers that implement the GDB remote serial
protocol, like hexagon-lldb. In this case, the debugger fails upon an
unexpected stop-reply message from QEMU when lldb attaches to it.

Instead, let's change gdb_set_stop_cpu() to send stop messages only as a
response to a previous GDB command, also making sure to check that the
command accepts such a reply.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---

Thanks Peter for pointing out about the notification packets at v1.

Changes in this version include: improvements in the commit message;
proper handling of the idle state (so that stop-replies can be sent
later, e.g. when the program is stopped due to a watchpoint); and
inclusion of other implemented GDB cmds that accept stop-reply as a
response.

There are three additional places that I think may send stop-reply
packages asynchronously, but I haven't touched those as I'm not sure if
that is really needed:

- gdb_exit() sends a "W" reply.
- gdb_signalled() sends "X".
- gdb_handlesig() sends "T".

Should we also restrict the message sending at these functions with the
same rules added to gdb_vm_state_change()?

 gdbstub.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index cf869b10e3..23507f21ca 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -350,6 +350,7 @@ typedef struct GDBState {
     int line_buf_index;
     int line_sum; /* running checksum */
     int line_csum; /* checksum at the end of the packet */
+    char last_cmd[MAX_PACKET_LENGTH];
     GByteArray *last_packet;
     int signal;
 #ifdef CONFIG_USER_ONLY
@@ -412,6 +413,7 @@ static void reset_gdbserver_state(void)
     g_free(gdbserver_state.processes);
     gdbserver_state.processes = NULL;
     gdbserver_state.process_num = 0;
+    gdbserver_state.last_cmd[0] = '\0';
 }
 #endif
 
@@ -2558,7 +2560,7 @@ static void handle_target_halt(GArray *params, void *user_ctx)
     gdb_breakpoint_remove_all();
 }
 
-static int gdb_handle_packet(const char *line_buf)
+static void gdb_handle_packet(const char *line_buf)
 {
     const GdbCmdParseEntry *cmd_parser = NULL;
 
@@ -2800,8 +2802,6 @@ static int gdb_handle_packet(const char *line_buf)
     if (cmd_parser) {
         run_cmd_parser(line_buf, cmd_parser);
     }
-
-    return RS_IDLE;
 }
 
 void gdb_set_stop_cpu(CPUState *cpu)
@@ -2821,8 +2821,14 @@ void gdb_set_stop_cpu(CPUState *cpu)
 }
 
 #ifndef CONFIG_USER_ONLY
+static inline bool char_in(char c, const char *str)
+{
+    return strchr(str, c) != NULL;
+}
+
 static void gdb_vm_state_change(void *opaque, bool running, RunState state)
 {
+    const char *cmd = gdbserver_state.last_cmd;
     CPUState *cpu = gdbserver_state.c_cpu;
     g_autoptr(GString) buf = g_string_new(NULL);
     g_autoptr(GString) tid = g_string_new(NULL);
@@ -2843,6 +2849,18 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
         return;
     }
 
+    /*
+     * We don't implement notification packets, so we should only send a
+     * stop-reply in response to a previous GDB command. Commands that accept
+     * stop-reply packages are: C, c, S, s, ?, vCont, vAttach, vRun, and
+     * vStopped. We don't implement vRun, and vStopped. For vAttach and ?, the
+     * stop-reply is already sent from their respective cmd handler functions.
+     */
+    if (gdbserver_state.state != RS_IDLE || /* still parsing the cmd */
+        !(startswith(cmd, "vCont;") || (strlen(cmd) == 1 && char_in(cmd[0], "cCsS")))) {
+        return;
+    }
+
     gdb_append_thread_id(cpu, tid);
 
     switch (state) {
@@ -3130,11 +3148,14 @@ static void gdb_read_byte(uint8_t ch)
                 reply = '-';
                 put_buffer(&reply, 1);
                 gdbserver_state.state = RS_IDLE;
+                gdbserver_state.last_cmd[0] = '\0';
             } else {
                 /* send ACK reply */
                 reply = '+';
                 put_buffer(&reply, 1);
-                gdbserver_state.state = gdb_handle_packet(gdbserver_state.line_buf);
+                strcpy(gdbserver_state.last_cmd, gdbserver_state.line_buf);
+                gdbserver_state.state = RS_IDLE;
+                gdb_handle_packet(gdbserver_state.line_buf);
             }
             break;
         default:
-- 
2.25.1


