Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02456586F7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 22:15:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAdk5-0001V6-VJ; Wed, 28 Dec 2022 16:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pAdk0-0001U1-GQ
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 16:13:37 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pAdjx-0001AQ-Gc
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 16:13:36 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BSL0F07025878; Wed, 28 Dec 2022 21:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=+M0v/yKVUmVD9GNI92ajZDTljLr5JWUrLXT1UX0vR5o=;
 b=hUKZoLkNOFAgLJh33zuvfAPO7qsLkaaFxQjT1jr5RNAmVDQCBZ66eKTAD6vyqkT5XheB
 fsgOUziWu4iNv1p0tbOTCeKTVe6OZJYJRsx1gZ0/rn5YpteLl9QO2FRaoRbmFYJgluXs
 9hICSpTQ+HGyYQUYo5st66KbJoAADsehXcd4XWLBXwnfscMumdtjUf29usTl399EPpez
 YYLUDWYd5Rt+eFP8MrOhwEyQEFJ6r9V7m5xpSgjPLx5C5Vl1QjGLtwu8jkKo4aIsenQT
 jUo+cenv/dzLDnoFOYXn6jFy7JqSk89hko76MUUFXpSZKUf03vMRg9f8H+aiVcwcux1Z hw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mr5fuad54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 21:13:30 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2BSLDTo1010136; 
 Wed, 28 Dec 2022 21:13:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 3mntgkr0n6-1;
 Wed, 28 Dec 2022 21:13:29 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BSLDSRo010123;
 Wed, 28 Dec 2022 21:13:28 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 2BSLDS4O010117;
 Wed, 28 Dec 2022 21:13:28 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 52DC85000A7; Wed, 28 Dec 2022 13:13:28 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 0/6] Hexagon (target/hexagon) COF overrides and new
 generator
Date: Wed, 28 Dec 2022 13:13:18 -0800
Message-Id: <20221228211324.26989-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: Okyf6C_w_HJ7er3kHhapKpvXxyss7XdQ
X-Proofpoint-ORIG-GUID: Okyf6C_w_HJ7er3kHhapKpvXxyss7XdQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-28_15,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=359
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212280182
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

VGhlIGlkZWYtcGFyc2VyIHNraXBzIHRoZSBjaGFuZ2Utb2YtZmxvdyAoQ09GKSBpbnN0cnVjdGlv
bnMsIHNvIGFkZApvdmVycmlkZXMKCioqKiogQ2hhbmdlcyBpbiB2MiAqKioqCkFkZCBhIG5ldyBn
ZW5lcmF0b3IgZm9yIGFuYWx5emVfPHRhZz4gaW5zdHJ1Y3Rpb25zLiAgUG91cGxhdGUgdGhlCkRp
c2FzQ29udGV4dCBhaGVhZCBvZiBnZW5lcmF0aW5nIGNvZGUuCgpUYXlsb3IgU2ltcHNvbiAoNik6
CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGp1bXByMzEgaW5z
dHJ1Y3Rpb25zCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGNh
bGxyCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGVuZGxvb3Ax
L2VuZGxvb3AwMQogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBk
ZWFsbG9jLXJldHVybiBpbnN0cnVjdGlvbnMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQW5h
bHl6ZSBwYWNrZXQgYmVmb3JlIGdlbmVyYXRpbmcgVENHCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFn
b24pIEFuYWx5emUgcGFja2V0IHN0ZXAgMgoKIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCAgICAg
ICAgICAgICAgICAgICAgfCAgNzcgKysrKysrCiB0YXJnZXQvaGV4YWdvbi9pbnNuLmggICAgICAg
ICAgICAgICAgICAgICAgIHwgICAzICsKIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICAgICAgICAg
ICAgICAgICAgICAgfCAgMTAgLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmggICAgICAgICAg
ICAgICAgICB8ICA1MSArKy0tCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgICAgICAgICAgICAg
ICAgICAgIHwgMTk4ICsrKysrKysrKysrKysrKy0KIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2Vy
L3BhcnNlci1oZWxwZXJzLmMgfCAgIDUgLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgICAg
ICAgICAgICAgICAgICB8ICAyNCAtLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgICAgICAg
ICAgICAgICAgICB8IDE3MyArKysrKysrKystLS0tLQogdGFyZ2V0L2hleGFnb24vUkVBRE1FICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxMSArLQogdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVf
ZnVuY190YWJsZS5weSAgICB8ICA1MiArKysrCiB0YXJnZXQvaGV4YWdvbi9nZW5fYW5hbHl6ZV9m
dW5jcy5weSAgICAgICAgIHwgMjUwICsrKysrKysrKysrKysrKysrKysrCiB0YXJnZXQvaGV4YWdv
bi9nZW5fdGNnX2Z1bmNzLnB5ICAgICAgICAgICAgIHwgIDM5IC0tLQogdGFyZ2V0L2hleGFnb24v
bWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICB8ICAxOCArKwogMTMgZmlsZXMgY2hhbmdlZCwg
NzQyIGluc2VydGlvbnMoKyksIDE2OSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDc1NSB0
YXJnZXQvaGV4YWdvbi9nZW5fYW5hbHl6ZV9mdW5jX3RhYmxlLnB5CiBjcmVhdGUgbW9kZSAxMDA3
NTUgdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3MucHkKCi0tIAoyLjE3LjEKCg==

