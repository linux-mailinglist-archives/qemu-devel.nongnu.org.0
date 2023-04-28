Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035846F1F9E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 22:44:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psUx4-0000Cc-6Z; Fri, 28 Apr 2023 16:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psUx2-0000CN-UO
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 16:44:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psUx0-0002yR-Iu
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 16:44:20 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SJ8Lr1019376; Fri, 28 Apr 2023 20:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=IwXHtb4nXYOEJwrflDMyX7yfJHmgM1MTzsmXyhZ2H3c=;
 b=XbeTVgwphOSgEtD/Gl2s5dEh5vsOIXnu49wjsMLtboP9AmQLVHxrLiXTcZnI5RUpMhwm
 w7IgQXq61aop5hwj73cGXwD4OC0dXvxFE2SZ5ap95JXIY5rPi4RUJHteKfJVu5aOzm3B
 GQUMsZ27c/P4343Ik4xTqGRewVWD4P3UVIagdQt6iDMyGgHSqVj2khEv+A9Uh4IxgB3Z
 DuFijyUciWk7Za1jeHzGkBtOGfjnY4PB7hkD51oQZ3pL8eZmo5VOn43bU1osb/qxJ4tP
 2elm8uivHpO+qtkZpGLYGV/huER+UNkljdoHdyC8bfnaC5V//Dpn7Eeg8Una6QjmDdya jQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8fvngw7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 20:44:15 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33SKiEtd008231; 
 Fri, 28 Apr 2023 20:44:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3q87ypvg5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 20:44:14 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33SKiEdE008226;
 Fri, 28 Apr 2023 20:44:14 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 33SKiEpZ008202
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 20:44:14 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 1346966C; Fri, 28 Apr 2023 13:44:14 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, tsimpson@quicinc.com, richard.henderson@linaro.org,
 philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
Subject: [PATCH v2] target/hexagon: fix = vs. == mishap
Date: Fri, 28 Apr 2023 13:44:11 -0700
Message-Id: <20230428204411.1400931-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Cr31RS8wvteo7EscQnJfd7rYLMCRlo7b
X-Proofpoint-GUID: Cr31RS8wvteo7EscQnJfd7rYLMCRlo7b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_06,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=711 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304280170
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

RnJvbTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KCioqKiogQ2hhbmdlcyBp
biB2MiAqKioqCkZpeCB5eWFzc2VydCdzIGZvciBzaWduIGFuZCB6ZXJvIGV4dGVuZHMKCkNvdmVy
aXR5IHJlcG9ydHMgYSBwYXJhbWV0ZXIgdGhhdCBpcyAic2V0IGJ1dCBuZXZlciB1c2VkIi4gIFRo
aXMgaXMgY2F1c2VkCmJ5IGFuIGFzc2lnbm1lbnQgb3BlcmF0b3IgYmVpbmcgdXNlZCBpbnN0ZWFk
IG9mIGVxdWFsaXR5LgoKQ28tYXV0aG9yZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBx
dWljaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0
LmNvbT4KU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29t
PgotLS0KIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNlci1oZWxwZXJzLmMgfCAyICst
CiB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9pZGVmLXBhcnNlci55ICAgIHwgNCArKy0tCiAy
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jIGIvdGFyZ2V0
L2hleGFnb24vaWRlZi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMuYwppbmRleCA4NjUxMWVmYjYyLi4w
YTAxZWMzOWI3IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXIt
aGVscGVycy5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNlci1oZWxwZXJz
LmMKQEAgLTExMjMsNyArMTEyMyw3IEBAIEhleFZhbHVlIGdlbl9leHRlbmRfb3AoQ29udGV4dCAq
YywKICAgICAgICAgICAgICAgICAgICAgICAgSGV4VmFsdWUgKnZhbHVlLAogICAgICAgICAgICAg
ICAgICAgICAgICBIZXhTaWduZWRuZXNzIHNpZ25lZG5lc3MpCiB7Ci0gICAgdW5zaWduZWQgYml0
X3dpZHRoID0gKGRzdF93aWR0aCA9IDY0KSA/IDY0IDogMzI7CisgICAgdW5zaWduZWQgYml0X3dp
ZHRoID0gKGRzdF93aWR0aCA9PSA2NCkgPyA2NCA6IDMyOwogICAgIEhleFZhbHVlIHZhbHVlX20g
PSAqdmFsdWU7CiAgICAgSGV4VmFsdWUgc3JjX3dpZHRoX20gPSAqc3JjX3dpZHRoOwogCmRpZmYg
LS1naXQgYS90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9pZGVmLXBhcnNlci55IGIvdGFyZ2V0
L2hleGFnb24vaWRlZi1wYXJzZXIvaWRlZi1wYXJzZXIueQppbmRleCA1NDQ0ZmQ0NzQ5Li4yNTYx
ZjBlYmIwIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9pZGVmLXBhcnNl
ci55CisrKyBiL3RhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL2lkZWYtcGFyc2VyLnkKQEAgLTY4
NSw3ICs2ODUsNyBAQCBydmFsdWUgOiBGQUlMCiAgICAgICAgICAgICAgeXlhc3NlcnQoYywgJkAx
LCAkNS50eXBlID09IElNTUVESUFURSAmJgogICAgICAgICAgICAgICAgICAgICAgICQ1LmltbS50
eXBlID09IFZBTFVFLAogICAgICAgICAgICAgICAgICAgICAgICJTWFQgZXhwZWN0cyBpbW1lZGlh
dGUgdmFsdWVzXG4iKTsKLSAgICAgICAgICAgICAkJCA9IGdlbl9leHRlbmRfb3AoYywgJkAxLCAm
JDMsICQ1LmltbS52YWx1ZSwgJiQ3LCBTSUdORUQpOworICAgICAgICAgICAgICQkID0gZ2VuX2V4
dGVuZF9vcChjLCAmQDEsICYkMywgNjQsICYkNywgU0lHTkVEKTsKICAgICAgICAgIH0KICAgICAg
ICB8IFpYVCAnKCcgcnZhbHVlICcsJyBJTU0gJywnIHJ2YWx1ZSAnKScKICAgICAgICAgIHsKQEAg
LTY5Myw3ICs2OTMsNyBAQCBydmFsdWUgOiBGQUlMCiAgICAgICAgICAgICAgeXlhc3NlcnQoYywg
JkAxLCAkNS50eXBlID09IElNTUVESUFURSAmJgogICAgICAgICAgICAgICAgICAgICAgICQ1Lmlt
bS50eXBlID09IFZBTFVFLAogICAgICAgICAgICAgICAgICAgICAgICJaWFQgZXhwZWN0cyBpbW1l
ZGlhdGUgdmFsdWVzXG4iKTsKLSAgICAgICAgICAgICAkJCA9IGdlbl9leHRlbmRfb3AoYywgJkAx
LCAmJDMsICQ1LmltbS52YWx1ZSwgJiQ3LCBVTlNJR05FRCk7CisgICAgICAgICAgICAgJCQgPSBn
ZW5fZXh0ZW5kX29wKGMsICZAMSwgJiQzLCA2NCwgJiQ3LCBVTlNJR05FRCk7CiAgICAgICAgICB9
CiAgICAgICAgfCAnKCcgcnZhbHVlICcpJwogICAgICAgICAgewotLSAKMi4yNS4xCgo=

