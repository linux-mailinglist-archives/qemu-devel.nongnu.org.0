Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918125F1339
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 22:10:01 +0200 (CEST)
Received: from localhost ([::1]:37100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeMKe-0000OP-4O
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 16:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oeMJK-0007Oq-4x
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 16:08:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:25930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oeMJH-0002eD-FO
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 16:08:37 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28UI1jrK012714
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 20:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=Id1SBUO1HPWr5bT6FexmnhF9ZCuaYlEoXgszosS0hyk=;
 b=mOC+r6mbjHoHXbJHPEFURh5BYijKIQOwy8fLN3I1s+nm+H7Vst/+35DI8UPcJSJUBUUB
 6UL1XBiYvMRRAxD91NqYnQaUFiSZ847nLvnSeLbYucK1BzF17OkrjMaULQsl0xLUqWZx
 RTKyRKKrFYYAoOoy4CsHrFooAluqnENStnU+jQklK3dndinJB+W9/R42PCZKZfkqdLDg
 0iMNWmQhgyznSNBgjg/f8aEBqpuniUbFo8MRt3/EeCYFG8dJdW+puUvWX/YxgJLiK5Gz
 i5fS6Kx71S0sm8l5n6wvuFCmOotU2i00fm7SMpUMlgM6ZBm0b03tEOKdEma8e5yb73S8 8w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jwkee3kmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 20:08:28 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28UK0Bde028212
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 20:08:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3jwhmvmw5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 20:08:26 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28UK7gh2002886
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 20:08:26 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 28UK8PMk003584
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 20:08:26 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 31D7B4EA0; Fri, 30 Sep 2022 17:08:25 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com
Subject: [PATCH] Hexagon (gen_tcg_funcs.py): avoid duplicated tcg code on
 A_CVI_NEW
Date: Fri, 30 Sep 2022 17:08:23 -0300
Message-Id: <fa706b192b2a3a0ffbd399fa8dbf0d5b2c5b82d9.1664568492.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: h06gCTtBo-E17oqQ1jm9MDLr3ch9JtDS
X-Proofpoint-ORIG-GUID: h06gCTtBo-E17oqQ1jm9MDLr3ch9JtDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=575 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300126
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Hexagon instructions with the A_CVI_NEW attribute produce a vector value
that can be used in the same packet. The python function responsible for
generating code for such instructions has a typo ("if" instead of
"elif"), which makes genptr_dst_write_ext() be executed twice, thus also
generating the same tcg code twice. Fortunately, this doesn't cause any
problems for correctness, but it is less efficient than it could be. Fix
it by using an "elif" and avoiding the unnecessary extra code gen.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 target/hexagon/gen_tcg_funcs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index d72c689ad7..6dea02b0b9 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -548,7 +548,7 @@ def genptr_dst_write_opn(f,regtype, regid, tag):
         if (hex_common.is_hvx_reg(regtype)):
             if (hex_common.is_new_result(tag)):
                 genptr_dst_write_ext(f, tag, regtype, regid, "EXT_NEW")
-            if (hex_common.is_tmp_result(tag)):
+            elif (hex_common.is_tmp_result(tag)):
                 genptr_dst_write_ext(f, tag, regtype, regid, "EXT_TMP")
             else:
                 genptr_dst_write_ext(f, tag, regtype, regid, "EXT_DFL")
-- 
2.37.2


