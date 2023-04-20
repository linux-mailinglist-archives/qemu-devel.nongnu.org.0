Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD676E945D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:32:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTSG-0006Wp-71; Thu, 20 Apr 2023 08:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSE-0006WX-2A
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:02 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSB-0002pn-Nd
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:01 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KAp5t9008336; Thu, 20 Apr 2023 12:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=cli39JR9znWhGRfM3LIckBq3WT2w+wWWyqimncUGvzo=;
 b=JYWr0v9+Dp/GYz5JP1Qhzszlt4KBAHCjMXr/3MHL3wyIWxiWm1108I6f8uZMNVhiX64i
 skbZ2NNyzbxqIGE+Xb1IwfgCCh69xbWvrJIoeednTE9g+uX6RJEMYcUDdATSi/2rFDT5
 InBZ5lAsKSjBv4ERSai0MKcaXh3j+IE5nqbrkZTLzTePe7F4FiM293blcYITWSxe2xXD
 7rXnTmrznag5Utiiy1F+ubLSOWE4V0ky8XWlw/dzoLZ10C7oraNP7MTzdfJYuq9iUo9x
 aUkB11IsD0NxfgKeN3Pt0K8OV7uQvSovHb3WImUMm5ehS1G6K+vOFgg0AYd3J+htU+pL 4w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2uj3sckb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:31:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KCVlJh015300
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:31:47 GMT
Received: from NASANPPMTA03.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 05:31:45 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <alex.bennee@linaro.org>, <bcain@quicinc.com>, <f4bug@amsat.org>,
 <peter.maydell@linaro.org>, <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 RESEND 1/7] gdbstub: only send stop-reply packets when
 allowed to
Date: Thu, 20 Apr 2023 09:31:22 -0300
Message-ID: <ec04a0d3cb1c1072703f776624e503ad6257dccd.1681993775.git.quic_mathbern@quicinc.com>
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
X-Proofpoint-GUID: boj9x8O90B026D2RD59suziHMho5CGW5
X-Proofpoint-ORIG-GUID: boj9x8O90B026D2RD59suziHMho5CGW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200102
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

GDB's remote serial protocol allows stop-reply messages to be sent by
the stub either as a notification packet or as a reply to a GDB command
(provided that the cmd accepts such a response). QEMU currently does not
implement notification packets, so it should only send stop-replies
synchronously and when requested. Nevertheless, it still issues
unsolicited stop messages through gdb_vm_state_change().

Although this behavior doesn't seem to cause problems with GDB itself
(the messages are just ignored), it can impact other debuggers that
implement the GDB remote serial protocol, like hexagon-lldb. Let's
change the gdbstub to send stop messages only as a response to a
previous GDB command that accepts such a reply.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 gdbstub/internals.h |  5 +++++
 gdbstub/gdbstub.c   | 37 ++++++++++++++++++++++++++++---------
 gdbstub/softmmu.c   | 13 +++++++++++--
 gdbstub/user.c      | 17 +++++++++++------
 4 files changed, 55 insertions(+), 17 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 94ddff4495..33d21d6488 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -65,6 +65,11 @@ typedef struct GDBState {
     GByteArray *mem_buf;
     int sstep_flags;
     int supported_sstep_flags;
+    /*
+     * Whether we are allowed to send a stop reply packet at this moment.
+     * Must be set off after sending the stop reply itself.
+     */
+    bool allow_stop_reply;
 } GDBState;
 
 /* lives in main gdbstub.c */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 0760d78685..be18568d0a 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -777,6 +777,10 @@ typedef void (*GdbCmdHandler)(GArray *params, void *user_ctx);
 /*
  * cmd_startswith -> cmd is compared using startswith
  *
+ * allow_stop_reply -> true iff the gdbstub can respond to this command with a
+ *   "stop reply" packet. The list of commands that accept such response is
+ *   defined at the GDB Remote Serial Protocol documentation. see:
+ *   https://sourceware.org/gdb/onlinedocs/gdb/Stop-Reply-Packets.html#Stop-Reply-Packets.
  *
  * schema definitions:
  * Each schema parameter entry consists of 2 chars,
@@ -802,6 +806,7 @@ typedef struct GdbCmdParseEntry {
     const char *cmd;
     bool cmd_startswith;
     const char *schema;
+    bool allow_stop_reply;
 } GdbCmdParseEntry;
 
 static inline int startswith(const char *string, const char *pattern)
@@ -835,6 +840,7 @@ static int process_string_cmd(void *user_ctx, const char *data,
             }
         }
 
+        gdbserver_state.allow_stop_reply = cmd->allow_stop_reply;
         cmd->handler(params, user_ctx);
         return 0;
     }
@@ -1283,11 +1289,14 @@ static void handle_v_attach(GArray *params, void *user_ctx)
     gdbserver_state.g_cpu = cpu;
     gdbserver_state.c_cpu = cpu;
 
-    g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
-    gdb_append_thread_id(cpu, gdbserver_state.str_buf);
-    g_string_append_c(gdbserver_state.str_buf, ';');
+    if (gdbserver_state.allow_stop_reply) {
+        g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
+        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
+        g_string_append_c(gdbserver_state.str_buf, ';');
+        gdbserver_state.allow_stop_reply = false;
 cleanup:
-    gdb_put_strbuf();
+        gdb_put_strbuf();
+    }
 }
 
 static void handle_v_kill(GArray *params, void *user_ctx)
@@ -1310,12 +1319,14 @@ static const GdbCmdParseEntry gdb_v_commands_table[] = {
         .handler = handle_v_cont,
         .cmd = "Cont",
         .cmd_startswith = 1,
+        .allow_stop_reply = true,
         .schema = "s0"
     },
     {
         .handler = handle_v_attach,
         .cmd = "Attach;",
         .cmd_startswith = 1,
+        .allow_stop_reply = true,
         .schema = "l0"
     },
     {
@@ -1698,10 +1709,13 @@ static void handle_gen_set(GArray *params, void *user_ctx)
 
 static void handle_target_halt(GArray *params, void *user_ctx)
 {
-    g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
-    gdb_append_thread_id(gdbserver_state.c_cpu, gdbserver_state.str_buf);
-    g_string_append_c(gdbserver_state.str_buf, ';');
-    gdb_put_strbuf();
+    if (gdbserver_state.allow_stop_reply) {
+        g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
+        gdb_append_thread_id(gdbserver_state.c_cpu, gdbserver_state.str_buf);
+        g_string_append_c(gdbserver_state.str_buf, ';');
+        gdb_put_strbuf();
+        gdbserver_state.allow_stop_reply = false;
+    }
     /*
      * Remove all the breakpoints when this query is issued,
      * because gdb is doing an initial connect and the state
@@ -1725,7 +1739,8 @@ static int gdb_handle_packet(const char *line_buf)
             static const GdbCmdParseEntry target_halted_cmd_desc = {
                 .handler = handle_target_halt,
                 .cmd = "?",
-                .cmd_startswith = 1
+                .cmd_startswith = 1,
+                .allow_stop_reply = true,
             };
             cmd_parser = &target_halted_cmd_desc;
         }
@@ -1736,6 +1751,7 @@ static int gdb_handle_packet(const char *line_buf)
                 .handler = handle_continue,
                 .cmd = "c",
                 .cmd_startswith = 1,
+                .allow_stop_reply = true,
                 .schema = "L0"
             };
             cmd_parser = &continue_cmd_desc;
@@ -1747,6 +1763,7 @@ static int gdb_handle_packet(const char *line_buf)
                 .handler = handle_cont_with_sig,
                 .cmd = "C",
                 .cmd_startswith = 1,
+                .allow_stop_reply = true,
                 .schema = "l0"
             };
             cmd_parser = &cont_with_sig_cmd_desc;
@@ -1785,6 +1802,7 @@ static int gdb_handle_packet(const char *line_buf)
                 .handler = handle_step,
                 .cmd = "s",
                 .cmd_startswith = 1,
+                .allow_stop_reply = true,
                 .schema = "L0"
             };
             cmd_parser = &step_cmd_desc;
@@ -1976,6 +1994,7 @@ void gdb_read_byte(uint8_t ch)
 {
     uint8_t reply;
 
+    gdbserver_state.allow_stop_reply = false;
 #ifndef CONFIG_USER_ONLY
     if (gdbserver_state.last_packet->len) {
         /* Waiting for a response to the last packet.  If we see the start
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 22ecd09d04..99d994e6bf 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -43,6 +43,7 @@ static void reset_gdbserver_state(void)
     g_free(gdbserver_state.processes);
     gdbserver_state.processes = NULL;
     gdbserver_state.process_num = 0;
+    gdbserver_state.allow_stop_reply = false;
 }
 
 /*
@@ -139,6 +140,10 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
         return;
     }
 
+    if (!gdbserver_state.allow_stop_reply) {
+        return;
+    }
+
     gdb_append_thread_id(cpu, tid);
 
     switch (state) {
@@ -205,6 +210,7 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
 
 send_packet:
     gdb_put_packet(buf->str);
+    gdbserver_state.allow_stop_reply = false;
 
     /* disable single step if it was enabled */
     cpu_single_step(cpu, 0);
@@ -422,8 +428,11 @@ void gdb_exit(int code)
 
     trace_gdbstub_op_exiting((uint8_t)code);
 
-    snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
-    gdb_put_packet(buf);
+    if (gdbserver_state.allow_stop_reply) {
+        snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
+        gdb_put_packet(buf);
+        gdbserver_state.allow_stop_reply = false;
+    }
 
     qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
 }
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 80488b6bb9..bb03622c83 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -127,11 +127,14 @@ int gdb_handlesig(CPUState *cpu, int sig)
 
     if (sig != 0) {
         gdb_set_stop_cpu(cpu);
-        g_string_printf(gdbserver_state.str_buf,
-                        "T%02xthread:", gdb_target_signal_to_gdb(sig));
-        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
-        g_string_append_c(gdbserver_state.str_buf, ';');
-        gdb_put_strbuf();
+        if (gdbserver_state.allow_stop_reply) {
+            g_string_printf(gdbserver_state.str_buf,
+                            "T%02xthread:", gdb_target_signal_to_gdb(sig));
+            gdb_append_thread_id(cpu, gdbserver_state.str_buf);
+            g_string_append_c(gdbserver_state.str_buf, ';');
+            gdb_put_strbuf();
+            gdbserver_state.allow_stop_reply = false;
+        }
     }
     /*
      * gdb_put_packet() might have detected that the peer terminated the
@@ -174,12 +177,14 @@ void gdb_signalled(CPUArchState *env, int sig)
 {
     char buf[4];
 
-    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_user_state.fd < 0 ||
+        !gdbserver_state.allow_stop_reply) {
         return;
     }
 
     snprintf(buf, sizeof(buf), "X%02x", gdb_target_signal_to_gdb(sig));
     gdb_put_packet(buf);
+    gdbserver_state.allow_stop_reply = false;
 }
 
 static void gdb_accept_init(int fd)
-- 
2.39.1


