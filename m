Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC385EEAAF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 03:07:28 +0200 (CEST)
Received: from localhost ([::1]:41692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odi1O-00076T-OP
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 21:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1odhya-0004L4-Fk
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 21:04:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:25122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1odhyX-0007N8-UU
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 21:04:31 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SNekK9003071;
 Thu, 29 Sep 2022 01:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=eUqPcb0ODuhrO3Py+x9dg9hvVdc0McM1N+yWya0G13Q=;
 b=hnS//cZ5II9K4Kp9NP6vJiCirqe37srkby/SdNbhPPt0aJKUQOZkwjF95IZYx6qWVKDA
 L80pedrXJE0ddmLht4QSJl268lmxsD2MmGUuEfvF0AndGIuojubYyExmQ2LpNXFRwrXp
 /5E1zeFacbJswUk+WWqRyjT6ZZgSmqsTBDdqB6awqsynYAlWBiTBAKBU8LtFCnsWwi9C
 1NBdcOpLBNyAPdTttGooHH45+228p0MdHwp+uU9Vum0J2fm4d8DP8/1NdB/5ZoMoEtEx
 AvQaPVdxfELhTWGcyO5goFM2tyV3msiafPuyMXGuCiyxAaLzgzCKBV75yCuuvppFZkLg AA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jvm4vhk5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Sep 2022 01:04:25 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28T0tPcx019865; 
 Thu, 29 Sep 2022 01:04:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 3jvm5sjj9v-1;
 Thu, 29 Sep 2022 01:04:24 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28T12X0U028666;
 Thu, 29 Sep 2022 01:04:24 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 28T14NRi030845;
 Thu, 29 Sep 2022 01:04:24 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id C719E5000A7; Wed, 28 Sep 2022 18:04:23 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com
Subject: [PULL 0/3] Hexagon (target/hexagon) improve store handling
Date: Wed, 28 Sep 2022 18:04:13 -0700
Message-Id: <20220929010416.7418-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Cbyh6G7tg4tl1PRkn1WivenBzt3GXXG8
X-Proofpoint-GUID: Cbyh6G7tg4tl1PRkn1WivenBzt3GXXG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_11,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 mlxlogscore=432 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290005
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBkYmM0ZjQ4YjVhYjNlNmQ4NWY3OGFh
NGRmNmJkNmFkNTYxYzNkMTUyOgoKICBNZXJnZSB0YWcgJ25ldC1wdWxsLXJlcXVlc3QnIG9mIGh0
dHBzOi8vZ2l0aHViLmNvbS9qYXNvd2FuZy9xZW11IGludG8gc3RhZ2luZyAoMjAyMi0wOS0yNyAx
MTowODozNiAtMDQwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBodHRwczovL2dpdGh1Yi5jb20vcXVpYy9xZW11IHRhZ3MvcHVsbC1oZXgtMjAyMjA5MjgKCmZv
ciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAxMWEzNWI5Yzg4YjgxODgzZjk4YmI5ZWRjN2Uw
NGMxMmI2OTBkZmZmOgoKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQ2hhbmdlIGRlY2lzaW9u
IHRvIHNldCBwa3RfaGFzX3N0b3JlX3NbMDFdICgyMDIyLTA5LTI4IDE1OjU2OjA1IC0wNzAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQoKTWFrZSBzdG9yZSBoYW5kbGluZyBmYXN0ZXIgYW5kIG1vcmUgcm9idXN0CgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tClRheWxvciBTaW1wc29uICgzKToKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGFk
ZCBpbnN0cnVjdGlvbiBhdHRyaWJ1dGVzIGZyb20gYXJjaGxpYgogICAgICBIZXhhZ29uICh0YXJn
ZXQvaGV4YWdvbikgbW92ZSBzdG9yZSBzaXplIHRyYWNraW5nIHRvIHRyYW5zbGF0aW9uCiAgICAg
IEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBDaGFuZ2UgZGVjaXNpb24gdG8gc2V0IHBrdF9oYXNf
c3RvcmVfc1swMV0KCiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCAgICAgICAgICAgICAgIHwgICA4
ICstLQogdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMgICAgICB8ICAzOCArKysrKysr
KysrLQogdGFyZ2V0L2hleGFnb24vZGVjb2RlLmMgICAgICAgICAgICAgICB8ICAxMyArKy0tCiB0
YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgICAgICAgICAgICAgIHwgIDM2ICsrKystLS0tLS0KIHRh
cmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jICAgICAgICAgICAgfCAgMzUgKysrKysrKystLQogdGFy
Z2V0L2hleGFnb24vaGV4X2NvbW1vbi5weSAgICAgICAgICB8ICAgMyArLQogdGFyZ2V0L2hleGFn
b24vaW1wb3J0ZWQvbGRzdC5pZGVmICAgICB8IDEyMiArKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tCiB0YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9zdWJpbnNucy5pZGVmIHwgIDcyICsr
KysrKysrKystLS0tLS0tLS0tCiA4IGZpbGVzIGNoYW5nZWQsIDE5MSBpbnNlcnRpb25zKCspLCAx
MzYgZGVsZXRpb25zKC0pCg==

