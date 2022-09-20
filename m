Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B642A5BEA29
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 17:27:14 +0200 (CEST)
Received: from localhost ([::1]:49484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaf9V-0002B6-RP
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 11:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oacej-0003Hb-DC
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:47:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:15748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oaceg-0004p1-0d
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:47:15 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K7xkRm003438;
 Tue, 20 Sep 2022 12:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=y1PTrX/+ADN5lCXMCjx3EmyRLGAjwLfMgEZlgTcOb6Q=;
 b=Sz8sQBV104aSlBxdzV9yu+ooDPTumH+9pSsCTrthY4uvBH29FecbQUmcTcLk55NAphE9
 9FuQ3RfvPt2P1wWHDYy3Pvy0rAWKA6YxFq55aqSfuP+lcq34xGB2OM6soV4TSVIG61AP
 44q80/4KFrTByXduIyG/mdbC079EE4VLPQ/Y9Uk6Za6Kwu4EQr0TLllINsDHqn6DMmhE
 OrTQIWFOxiuRagKnaS9Ixnss41YchcZGDsIe8Igf2a+zFOqo+jOXQKRvl/NHUmaSQ44m
 T4rGcR2O4wv5MeGHemb49Uh0fnipzzo8cXp5l4UR/J/yOVN1gUDuLIVLSEtZHUoa6D63 hA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jpw78b6tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:08 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28KCjwkr012348; 
 Tue, 20 Sep 2022 12:47:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3jnqmj166y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:07 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KCl74D013271;
 Tue, 20 Sep 2022 12:47:07 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 28KCl6s1013267
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:07 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id D8B034DD0; Tue, 20 Sep 2022 09:47:06 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: bcain@quicinc.com, alex.bennee@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org
Subject: [PATCH v3 2/3] gdbstub: only send stop-reply packets when allowed to
Date: Tue, 20 Sep 2022 09:47:02 -0300
Message-Id: <07bac78c85e9fef6201ec79f552b7267646b42e9.1663677789.git.quic_mathbern@quicinc.com>
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
X-Proofpoint-ORIG-GUID: mX15OK2L1KfaWlD1yLD5QHQVKGbgx8d0
X-Proofpoint-GUID: mX15OK2L1KfaWlD1yLD5QHQVKGbgx8d0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=985
 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200074
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

Instead, let's change the gdbstub to send stop messages only as a
response to a previous GDB command that accepts such a reply.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 gdbstub.c | 64 ++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 17 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index cf869b10e3..14b4348c18 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -369,6 +369,7 @@ typedef struct GDBState {
     GByteArray *mem_buf;
     int sstep_flags;
     int supported_sstep_flags;
+    bool allow_stop_reply;
 } GDBState;
 
 static GDBState gdbserver_state;
@@ -412,6 +413,7 @@ static void reset_gdbserver_state(void)
     g_free(gdbserver_state.processes);
     gdbserver_state.processes = NULL;
     gdbserver_state.process_num = 0;
+    gdbserver_state.allow_stop_reply = 0;
 }
 #endif
 
@@ -1484,6 +1486,7 @@ typedef struct GdbCmdParseEntry {
     const char *cmd;
     bool cmd_startswith;
     const char *schema;
+    bool allow_stop_reply;
 } GdbCmdParseEntry;
 
 static inline int startswith(const char *string, const char *pattern)
@@ -1517,6 +1520,7 @@ static int process_string_cmd(void *user_ctx, const char *data,
             }
         }
 
+        gdbserver_state.allow_stop_reply = cmd->allow_stop_reply;
         cmd->handler(params, user_ctx);
         return 0;
     }
@@ -2013,11 +2017,14 @@ static void handle_v_attach(GArray *params, void *user_ctx)
     gdbserver_state.g_cpu = cpu;
     gdbserver_state.c_cpu = cpu;
 
-    g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
-    gdb_append_thread_id(cpu, gdbserver_state.str_buf);
-    g_string_append_c(gdbserver_state.str_buf, ';');
+    if (gdbserver_state.allow_stop_reply) {
+        g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
+        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
+        g_string_append_c(gdbserver_state.str_buf, ';');
+        gdbserver_state.allow_stop_reply = 0;
 cleanup:
-    put_strbuf();
+        put_strbuf();
+    }
 }
 
 static void handle_v_kill(GArray *params, void *user_ctx)
@@ -2040,12 +2047,14 @@ static const GdbCmdParseEntry gdb_v_commands_table[] = {
         .handler = handle_v_cont,
         .cmd = "Cont",
         .cmd_startswith = 1,
+        .allow_stop_reply = 1,
         .schema = "s0"
     },
     {
         .handler = handle_v_attach,
         .cmd = "Attach;",
         .cmd_startswith = 1,
+        .allow_stop_reply = 1,
         .schema = "l0"
     },
     {
@@ -2546,10 +2555,13 @@ static void handle_gen_set(GArray *params, void *user_ctx)
 
 static void handle_target_halt(GArray *params, void *user_ctx)
 {
-    g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
-    gdb_append_thread_id(gdbserver_state.c_cpu, gdbserver_state.str_buf);
-    g_string_append_c(gdbserver_state.str_buf, ';');
-    put_strbuf();
+    if (gdbserver_state.allow_stop_reply) {
+        g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
+        gdb_append_thread_id(gdbserver_state.c_cpu, gdbserver_state.str_buf);
+        g_string_append_c(gdbserver_state.str_buf, ';');
+        put_strbuf();
+        gdbserver_state.allow_stop_reply = 0;
+    }
     /*
      * Remove all the breakpoints when this query is issued,
      * because gdb is doing an initial connect and the state
@@ -2573,7 +2585,8 @@ static int gdb_handle_packet(const char *line_buf)
             static const GdbCmdParseEntry target_halted_cmd_desc = {
                 .handler = handle_target_halt,
                 .cmd = "?",
-                .cmd_startswith = 1
+                .cmd_startswith = 1,
+                .allow_stop_reply = 1,
             };
             cmd_parser = &target_halted_cmd_desc;
         }
@@ -2584,6 +2597,7 @@ static int gdb_handle_packet(const char *line_buf)
                 .handler = handle_continue,
                 .cmd = "c",
                 .cmd_startswith = 1,
+                .allow_stop_reply = 1,
                 .schema = "L0"
             };
             cmd_parser = &continue_cmd_desc;
@@ -2595,6 +2609,7 @@ static int gdb_handle_packet(const char *line_buf)
                 .handler = handle_cont_with_sig,
                 .cmd = "C",
                 .cmd_startswith = 1,
+                .allow_stop_reply = 1,
                 .schema = "l0"
             };
             cmd_parser = &cont_with_sig_cmd_desc;
@@ -2633,6 +2648,7 @@ static int gdb_handle_packet(const char *line_buf)
                 .handler = handle_step,
                 .cmd = "s",
                 .cmd_startswith = 1,
+                .allow_stop_reply = 1,
                 .schema = "L0"
             };
             cmd_parser = &step_cmd_desc;
@@ -2843,6 +2859,10 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
         return;
     }
 
+    if (!gdbserver_state.allow_stop_reply) {
+        return;
+    }
+
     gdb_append_thread_id(cpu, tid);
 
     switch (state) {
@@ -2908,6 +2928,7 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
 
 send_packet:
     put_packet(buf->str);
+    gdbserver_state.allow_stop_reply = 0;
 
     /* disable single step if it was enabled */
     cpu_single_step(cpu, 0);
@@ -3000,6 +3021,7 @@ static void gdb_read_byte(uint8_t ch)
 {
     uint8_t reply;
 
+    gdbserver_state.allow_stop_reply = 0;
 #ifndef CONFIG_USER_ONLY
     if (gdbserver_state.last_packet->len) {
         /* Waiting for a response to the last packet.  If we see the start
@@ -3162,8 +3184,11 @@ void gdb_exit(int code)
 
   trace_gdbstub_op_exiting((uint8_t)code);
 
-  snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
-  put_packet(buf);
+  if (gdbserver_state.allow_stop_reply) {
+      snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
+      put_packet(buf);
+      gdbserver_state.allow_stop_reply = 0;
+  }
 
 #ifndef CONFIG_USER_ONLY
   qemu_chr_fe_deinit(&gdbserver_state.chr, true);
@@ -3212,11 +3237,14 @@ gdb_handlesig(CPUState *cpu, int sig)
 
     if (sig != 0) {
         gdb_set_stop_cpu(cpu);
-        g_string_printf(gdbserver_state.str_buf,
-                        "T%02xthread:", target_signal_to_gdb(sig));
-        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
-        g_string_append_c(gdbserver_state.str_buf, ';');
-        put_strbuf();
+        if (gdbserver_state.allow_stop_reply) {
+            g_string_printf(gdbserver_state.str_buf,
+                            "T%02xthread:", target_signal_to_gdb(sig));
+            gdb_append_thread_id(cpu, gdbserver_state.str_buf);
+            g_string_append_c(gdbserver_state.str_buf, ';');
+            put_strbuf();
+            gdbserver_state.allow_stop_reply = 0;
+        }
     }
     /* put_packet() might have detected that the peer terminated the
        connection.  */
@@ -3255,12 +3283,14 @@ void gdb_signalled(CPUArchState *env, int sig)
 {
     char buf[4];
 
-    if (!gdbserver_state.init || gdbserver_state.fd < 0) {
+    if (!gdbserver_state.init || gdbserver_state.fd < 0 ||
+        !gdbserver_state.allow_stop_reply) {
         return;
     }
 
     snprintf(buf, sizeof(buf), "X%02x", target_signal_to_gdb(sig));
     put_packet(buf);
+    gdbserver_state.allow_stop_reply = 0;
 }
 
 static void gdb_accept_init(int fd)
-- 
2.37.2


