Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C06698D5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:40:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKHS-0007v4-CI; Fri, 13 Jan 2023 08:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pGKHQ-0007sm-1Y
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:36 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pGKHN-000541-5t
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:35 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DDFUXN013491; Fri, 13 Jan 2023 13:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=GF+Q5mJQGEVKqzYPORfWzfcUjgNPFAR+SJE7hkjN1ec=;
 b=Dhd3tmdRKXKLS4qHAD4b5Nf/hhZR11+vqeunPyEQmbb/sUErnh480WchFvrABZ/GF0uH
 lVb6eY3IR+xJvGHKe0d910I/xm5SCoYPkQhwDnq7k5qk12kiIul433VZ9xO6u38cs5Nq
 cwztbIkfVayBubTfnZTVY/0MOUYZVd5LjnDfWtETXw4vAVXxB9FpswQoAGr9r2awB25E
 ITQr1dev53vWtUnKs1PuTO6pSwFBpwDk9xYspGwzZgarAyNHci70Bfzk0i3H6kkQxU4r
 0x1qZAIWVsTW3lxmVAqKYJaonq7ymapMxOI5XqAVgcGY1wbBlDxh9J8d18GjCL35R5i8 wQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n351f8ryw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 13:39:28 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30DDdSng018394; 
 Fri, 13 Jan 2023 13:39:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3n22jar4qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 13:39:28 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30DDdSMM018389;
 Fri, 13 Jan 2023 13:39:28 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 30DDdRO4018388
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 13:39:28 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 6AC745EA1; Fri, 13 Jan 2023 10:39:27 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>, Brian Cain <bcain@quicinc.com>,
 richard.henderson@linaro.org
Subject: [PATCH 1/2] Hexagon (iclass): update J4_hintjumpr slot constraints
Date: Fri, 13 Jan 2023 10:39:23 -0300
Message-Id: <0fcd8293642c6324119fbbab44741164bcbd04fb.1673616964.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1673616964.git.quic_mathbern@quicinc.com>
References: <cover.1673616964.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kOvG6nlrAYJYMlIqDrdQMTXnXAS8u5FG
X-Proofpoint-ORIG-GUID: kOvG6nlrAYJYMlIqDrdQMTXnXAS8u5FG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_06,2023-01-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=510 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130090
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The Hexagon PRM says that "The assembler automatically encodes
instructions in the packet in the proper order. In the binary encoding
of a packet, the instructions must be ordered from Slot 3 down to
Slot 0."

Prior to the architecture version v73, the slot constraints from
instruction "hintjr" only allowed it to be executed at slot 2.
With that in mind, consider the packet:

    {
        hintjr(r0)
        nop
        nop
        if (!p0) memd(r1+#0) = r1:0
    }

To satisfy the ordering rule quoted from the PRM, the assembler would,
thus, move one of the nops to the first position, so that it can be
assigned to slot 3 and the subsequent hintjr to slot 2.

However, since v73, hintjr can be executed at either slot 2 or 3. So
there is no need to reorder that packet and the assembler will encode it
as is. When QEMU tries to execute it, however, we end up hitting a
"misaliged store" exception because both the store and the hintjr will
be assigned to store 0, and some functions like `slot_is_predicated()`
expect the decode machinery to assign only one instruction per slot. In
particular, the mentioned function will traverse the packet until it
finds the first instruction at the desired slot which, for slot 0, will
be hintjr. Since hintjr is not predicated, the result is that we try to
execute the store regardless of the predicate. And because the predicate
is false, we had not previously loaded hex_store_addr[0] or
hex_store_width[0]. As a result, the store will decide de width based on
trash memory, causing it to be misaligned.

Update the slot constraints for hintjr so that QEMU can properly handle
such encodings.

Note: to avoid similar-but-not-identical issues in the future, we should
look for multiple instructions at the same slot during decoding time and
throw an invalid packet exception. That will be done in the subsequent
commit.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 target/hexagon/iclass.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/iclass.c b/target/hexagon/iclass.c
index 6091286993..081116fc4d 100644
--- a/target/hexagon/iclass.c
+++ b/target/hexagon/iclass.c
@@ -51,8 +51,10 @@ SlotMask find_iclass_slots(Opcode opcode, int itype)
         return SLOTS_0;
     } else if ((opcode == J2_trap0) ||
                (opcode == Y2_isync) ||
-               (opcode == J2_pause) || (opcode == J4_hintjumpr)) {
+               (opcode == J2_pause)) {
         return SLOTS_2;
+    } else if (opcode == J4_hintjumpr) {
+        return SLOTS_23;
     } else if (GET_ATTRIB(opcode, A_CRSLOT23)) {
         return SLOTS_23;
     } else if (GET_ATTRIB(opcode, A_RESTRICT_PREFERSLOT0)) {
-- 
2.37.2


