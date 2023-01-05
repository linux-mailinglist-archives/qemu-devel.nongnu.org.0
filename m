Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82865F6D8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:33:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYUa-0006yc-Fu; Thu, 05 Jan 2023 17:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDYUX-0006wk-Hx
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:13:41 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDYUU-000285-Jl
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:13:41 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305LoJPr026836; Thu, 5 Jan 2023 22:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=24p7fEvzC8gBs5uLFfyFgabASx86hUFmIM9N27e2Pqs=;
 b=dTVE/tW9TBtAv00PTzpq9YAK0BsWIWtW4NPqCiij+Vvryqf4H94oJdZgGBx2A88ogfbQ
 yf17o3h40Ppg7cNE2izDQVZnXKDJVbOicZR4zKmjro8NxBG70Z9ck9yzNUxqz/6HTCO/
 fVQdyzTZpkn3DOXUZHOJoVS8oLx2T6Ghp/DnTpQo887YjMi4XTWdiCTaSwgXmgcR6w3P
 ImwW48x6hgJXX36Rp08NAqQgWZ1eY7VrW1WBukjaWehLIiJ2SWOm5kw8FcxkacF0VaEK
 /IO+fhPdQ0Z7gRoVsxInLto6bfn9WsHXlvEydewRkTMwaDzwPsdLo/7cPNXTYNPJOsi+ +g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mx5b0g6fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 22:13:35 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 305MDZ3a003960; 
 Thu, 5 Jan 2023 22:13:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 3mte5kxjvv-1;
 Thu, 05 Jan 2023 22:13:35 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305MDYcn003954;
 Thu, 5 Jan 2023 22:13:34 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 305MDY60003951;
 Thu, 05 Jan 2023 22:13:34 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 331E65000A7; Thu,  5 Jan 2023 14:13:34 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v3 0/9] Hexagon: COF overrides, new generator, test update
Date: Thu,  5 Jan 2023 14:13:22 -0800
Message-Id: <20230105221331.12069-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 3ar86KcgubXT_Sbkn6HrkXDkDViQvhhc
X-Proofpoint-GUID: 3ar86KcgubXT_Sbkn6HrkXDkDViQvhhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_12,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxlogscore=481 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301050174
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

VGhlIGlkZWYtcGFyc2VyIHNraXBzIHRoZSBjaGFuZ2Utb2YtZmxvdyAoQ09GKSBpbnN0cnVjdGlv
bnMsIHNvIGFkZApvdmVycmlkZXMKCioqKiogQ2hhbmdlcyBpbiB2MiAqKioqCkFkZCBhIG5ldyBn
ZW5lcmF0b3IgZm9yIGFuYWx5emVfPHRhZz4gaW5zdHJ1Y3Rpb25zLiAgUG91cGxhdGUgdGhlCkRp
c2FzQ29udGV4dCBhaGVhZCBvZiBnZW5lcmF0aW5nIGNvZGUuCgoqKioqIENoYW5nZXMgaW4gdjMg
KioqKgpDbGVhbnVwIG9mIGFuYWx5c2lzIGNvZGUKQWRkZWQgdGVzdCB1cGRhdGVzIGVuYWJsZWQg
YnkgbmV3IHRvb2xjaGFpbiBjb250YWluZXIKClRheWxvciBTaW1wc29uICg5KToKICBIZXhhZ29u
ICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IganVtcHIzMSBpbnN0cnVjdGlvbnMK
ICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IgY2FsbHIKICBIZXhh
Z29uICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IgZW5kbG9vcDEvZW5kbG9vcDAx
CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGRlYWxsb2MtcmV0
dXJuIGluc3RydWN0aW9ucwogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBbmFseXplIHBhY2tl
dCBiZWZvcmUgZ2VuZXJhdGluZyBUQ0cKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQW5hbHl6
ZSBwYWNrZXQgZm9yIEhWWAogIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKSBVcGRhdGUgcHJl
Z19hbGlhcy5jCiAgSGV4YWdvbiAodGVzdHMvdGNnL2hleGFnb24pIFJlbW92ZSBfX2J1aWx0aW4g
ZnJvbSBzY2F0dGVyX2dhdGhlcgogIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKSBFbmFibGUg
SFZYIHRlc3RzCgogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oICAgICAgICAgICAgICAgICAgICB8
ICA3OSArKy0KIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICAgICAgICAgICAgICAgICAgICAgfCAg
MTIgKy0KIHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oICAgICAgICAgICAgICAgICAgfCAgNjAg
KystCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgICAgICAgICAgICAgICAgICAgIHwgMjAwICsr
KysrKystCiB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jIHwgICA3
ICstCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyAgICAgICAgICAgICAgICAgIHwgIDI2ICst
CiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyAgICAgICAgICAgICAgICAgIHwgMTg3ICsrKyst
LS0KIHRlc3RzL3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYyAgICAgICAgICAgICAgfCAgMTAgKy0K
IHRlc3RzL3RjZy9oZXhhZ29uL3NjYXR0ZXJfZ2F0aGVyLmMgICAgICAgICAgfCA1MTMgKysrKysr
KysrKystLS0tLS0tLS0KIHRhcmdldC9oZXhhZ29uL1JFQURNRSAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTEgKy0KIHRhcmdldC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1bmNfdGFibGUucHkgICAg
fCAgNTIgKysKIHRhcmdldC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1bmNzLnB5ICAgICAgICAgfCAy
NTAgKysrKysrKysrKwogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weSAgICAgICAgICAg
ICB8ICA0MSArLQogdGFyZ2V0L2hleGFnb24vbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICB8
ICAyMCArLQogdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0ICAgICAgICAgICB8ICAx
MyArLQogMTUgZmlsZXMgY2hhbmdlZCwgMTA1MyBpbnNlcnRpb25zKCspLCA0MjggZGVsZXRpb25z
KC0pCiBjcmVhdGUgbW9kZSAxMDA3NTUgdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY190
YWJsZS5weQogY3JlYXRlIG1vZGUgMTAwNzU1IHRhcmdldC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1
bmNzLnB5CgotLSAKMi4xNy4xCgo=

