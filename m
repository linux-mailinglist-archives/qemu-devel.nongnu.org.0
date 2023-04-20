Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DE66E9499
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:37:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTSR-0006eu-Vf; Thu, 20 Apr 2023 08:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSL-0006ZP-Ge
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSH-0002ry-2k
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:06 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KAoud1008092; Thu, 20 Apr 2023 12:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=yidt+xGODxX9s5IhV9MGV7XTimp8h2AQNVxtdcV7HrY=;
 b=Oq+b4HhRL3rXG92poYXrKAx406QSLciXE4nnrKX1u2ptQOmY1QM+oczLqJ+XgNvVnOd1
 OCW+iLwNd3AzvcPy3Xwbjn95cqRrBTmN6d7ABlncjm0KJXxmwcPegih2tBiykCIs+PJ8
 bNn2+Veu51yp0BkECiqU+ZUfJUMGFEDtEcFuQ+YvpZNat8JnHqHq0nhX5O38s7PYEK8T
 xH1SmC3OhUE0FWJaOOT07QROAUPyE0DfSY5Dd0PF6JkEj3uP4sJ4WHqu4nhF3dhL3Ipd
 ijNQghK29Uk/LUhBZ25xRuSIILPRTJ+nQHm4luq6X4tptv/8/Ers/It3yV/sp2nYfhh1 yQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2uj3sckh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:31:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KCVsme020265
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:31:54 GMT
Received: from NASANPPMTA03.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 05:31:50 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <alex.bennee@linaro.org>, <bcain@quicinc.com>, <f4bug@amsat.org>,
 <peter.maydell@linaro.org>, <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Eduardo
 Habkost" <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v2 RESEND 3/7] gdbstub: add support for the qRegisterInfo query
Date: Thu, 20 Apr 2023 09:31:24 -0300
Message-ID: <6414ff4730fb53bd210cce947c201ca011135831.1681993775.git.quic_mathbern@quicinc.com>
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
X-Proofpoint-GUID: v09ez0VBRsY-fL0Ugygg933NqL7GFgy5
X-Proofpoint-ORIG-GUID: v09ez0VBRsY-fL0Ugygg933NqL7GFgy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 mlxlogscore=866
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

From: Brian Cain <bcain@quicinc.com>

Signed-off-by: Brian Cain <bcain@quicinc.com>
Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 include/hw/core/cpu.h |  4 ++++
 gdbstub/gdbstub.c     | 27 +++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 397fd3ac68..cfdf5514d9 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -124,6 +124,8 @@ struct SysemuCPUOps;
  *       its Harvard architecture split code and data.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
+ * @gdb_qreg_info_lines: Array of lines of registers qRegisterInfo description.
+ * @gdb_qreg_info_line_count: Count of lines for @gdb_qreg_info_lines.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
  *           before the insn which triggers a watchpoint rather than after it.
  * @gdb_arch_name: Optional callback that returns the architecture name known
@@ -159,6 +161,8 @@ struct CPUClass {
     vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
 
     const char *gdb_core_xml_file;
+    const char **gdb_qreg_info_lines;
+    int gdb_qreg_info_line_count;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index be18568d0a..f19f8c58c3 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1409,6 +1409,27 @@ static void handle_query_curr_tid(GArray *params, void *user_ctx)
     gdb_put_strbuf();
 }
 
+static void handle_query_regs(GArray *params, void *user_ctx)
+{
+    if (!params->len) {
+        return;
+    }
+
+    CPUClass *cc = CPU_GET_CLASS(gdbserver_state.g_cpu);
+    if (!cc->gdb_qreg_info_lines) {
+        gdb_put_packet("");
+        return;
+    }
+
+    int reg_num = get_param(params, 0)->val_ul;
+    if (reg_num >= cc->gdb_qreg_info_line_count) {
+        gdb_put_packet("");
+        return;
+    }
+
+    gdb_put_packet(cc->gdb_qreg_info_lines[reg_num]);
+}
+
 static void handle_query_threads(GArray *params, void *user_ctx)
 {
     if (!gdbserver_state.query_cpu) {
@@ -1578,6 +1599,12 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
         .handler = handle_query_curr_tid,
         .cmd = "C",
     },
+    {
+        .handler = handle_query_regs,
+        .cmd = "RegisterInfo",
+        .cmd_startswith = 1,
+        .schema = "l0"
+    },
     {
         .handler = handle_query_threads,
         .cmd = "sThreadInfo",
-- 
2.39.1


