Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F656F722D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 20:54:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pue57-0003lM-Hk; Thu, 04 May 2023 14:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pue4w-0003iz-AK
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:53:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pue4s-0004dV-5p
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:53:21 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344IQvqY018667
 for <qemu-devel@nongnu.org>; Thu, 4 May 2023 18:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=gdkUuzfDepmGDmH4qS+yCyWMFLpf3YIYFmhx/2mlh5w=;
 b=MvTslPRVw5TZFxBj/VOZ6gPbXX09I6IgPO4kUTAcJeyTdp73NF1Z7MywZfXH9qODcm54
 bj/vwBC18tHeNfyfXeASsIYuXeFwJYWf1dV/FnnW+4Nj0toMu1W5brHRiPFEaVZyq0It
 +ppvb2Ucdw7u0/R7VIwj75cLVfh4MQMovjnLZ4XamoA8ZVSnYTrPafrmacFIvDhYHHeF
 HbcOMAx4oYXMyjtOdRMyZauPoPYEMJ8vXbtBU5bTcBXUCya6KD+tjlX93zqooxBlmTVO
 phTfD2Qu0spm0Oqw+u9j/hCKZPl0yxhIr4duU1HrLQ0pc6qf3NEQT28h6rSc69Eybo6I DA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qc50421r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:53:15 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 344IrExT024335
 for <qemu-devel@nongnu.org>; Thu, 4 May 2023 18:53:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q8vamfe0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:53:14 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 344IrEIg024329
 for <qemu-devel@nongnu.org>; Thu, 4 May 2023 18:53:14 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 344IrD3j024325
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 18:53:14 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 8389570F3; Thu,  4 May 2023 15:53:13 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: bcain@quicinc.com, tsimpson@quicinc.com
Subject: [PATCH 1/2] Hexagon: list available CPUs with `-cpu help`
Date: Thu,  4 May 2023 15:53:11 -0300
Message-Id: <b946e17c7e17eed9095700b54c5ead36e5d55dfa.1683225804.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1683225804.git.quic_mathbern@quicinc.com>
References: <cover.1683225804.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Y_BDlsoEZVfuSfqM-RDj6kPRCQivLesj
X-Proofpoint-ORIG-GUID: Y_BDlsoEZVfuSfqM-RDj6kPRCQivLesj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_12,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=931 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305040150
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Currently, qemu-hexagon only models the v67 cpu. Nonetheless if we try
to get this information with `-cpu help`, qemu just exists with an error
code and no output. Let's correct that.

The code is basically a copy from target/alpha/cpu.h, but we strip the
"-hexagon-cpu" suffix before printing. This is to avoid confusing
situations like the following:

    $ qemu-hexagon -cpu help

    Available CPUs:
      v67-hexagon-cpu

    $ qemu-hexagon -cpu v67-hexagon-cpu ./prog

    qemu-hexagon: unable to find CPU model 'v67-hexagon-cpu'

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 target/hexagon/cpu.h |  3 +++
 target/hexagon/cpu.c | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 81b663ecfb..d59e5bbff8 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -44,6 +44,9 @@
 
 #define TYPE_HEXAGON_CPU_V67 HEXAGON_CPU_TYPE_NAME("v67")
 
+void hexagon_cpu_list(void);
+#define cpu_list hexagon_cpu_list
+
 #define MMU_USER_IDX 0
 
 typedef struct {
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index ab40cfc283..e8c2b5e910 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -29,6 +29,26 @@ static void hexagon_v67_cpu_init(Object *obj)
 {
 }
 
+static void hexagon_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    char *name = g_strdup(object_class_get_name(oc));
+    if (g_str_has_suffix(name, HEXAGON_CPU_TYPE_SUFFIX)) {
+        name[strlen(name) - strlen(HEXAGON_CPU_TYPE_SUFFIX)] = '\0';
+    }
+    qemu_printf("  %s\n", name);
+    g_free(name);
+}
+
+void hexagon_cpu_list(void)
+{
+    GSList *list;
+    list = object_class_get_list_sorted(TYPE_HEXAGON_CPU, false);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, hexagon_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
 static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
-- 
2.37.2


