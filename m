Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7745F65B470
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 16:48:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCN25-0001MI-LX; Mon, 02 Jan 2023 10:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_rcran@quicinc.com>)
 id 1pCN1c-0001K3-5S; Mon, 02 Jan 2023 10:47:20 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_rcran@quicinc.com>)
 id 1pCN1Z-00034k-UJ; Mon, 02 Jan 2023 10:46:55 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 302FQ8UL017118; Mon, 2 Jan 2023 15:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Ebvt78D1dGQUeu3mnmAAaKecMikfFtZ9TiYMlfLwta0=;
 b=ICWS0LE3otuFiDOkQRHw92ubVdKseRGuPQQSSBVYxKSlTmi36lpqfmu14ZmZRmNT7DWU
 nBWDOCJoElFXzyJyoDrK5wh1UTJER0GHcyMTQ4I+TeXv6V9ZolVeQunsdRWZ+mp+Hlsn
 TgCJfJroSRYyKBpe2hhZFriDldXD+Q4wcHegjVwHxm/BrtHdjYRkXi7lOmpmJ949ZSFB
 sQwRpd7tjLOYUI7K83B/3MYu0lPGFaZr3P5Zj3Z+igfVWjWvHC9KLGCAr3AFRFFxzS4K
 IvdSWJMBPiJtP90QDH9oQyA2ij+3KIV0tt6r76tEdDE6ofQRcOS9v3uBS/UOBZI+xUM4 9w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mtaewbcpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Jan 2023 15:46:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 302Fkn06017835
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Jan 2023 15:46:49 GMT
Received: from linbox.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 2 Jan 2023
 07:46:48 -0800
From: Rebecca Cran <rebecca@quicinc.com>
To: Radoslaw Biernacki <rad@semihalf.com>, Peter Maydell
 <peter.maydell@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>
CC: Rebecca Cran <rebecca@quicinc.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: [PATCH 1/1] hw/arm/sbsa-ref.c: Start APs powered off
Date: Mon, 2 Jan 2023 08:46:30 -0700
Message-ID: <20230102154630.211785-1-rebecca@quicinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hbke2dw5Xglef_WOG4fqb_ZojJuwkxUH
X-Proofpoint-GUID: hbke2dw5Xglef_WOG4fqb_ZojJuwkxUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_10,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=687 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301020142
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_rcran@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For the SBSA-REF machine start all APs in the powered-off state.
This reduces host CPU usage until PSCI_CPU_ON is called when the APs
are needed.

Signed-off-by: Rebecca Cran <rebecca@quicinc.com>
---
 hw/arm/sbsa-ref.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4bb444684f40..cf0af35c7807 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -753,6 +753,12 @@ static void sbsa_ref_init(MachineState *machine)
                                     &error_abort);
         }
 
+        /* Configure all APs to be powered off at start */
+        if (n != 0 && object_property_find(cpuobj, "start-powered-off")) {
+            object_property_set_bool(cpuobj, "start-powered-off",
+                                     true, &error_abort);
+        }
+
         object_property_set_link(cpuobj, "memory", OBJECT(sysmem),
                                  &error_abort);
 
-- 
2.30.2


