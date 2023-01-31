Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F29A6839CC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 23:57:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMzYx-0000np-Tk; Tue, 31 Jan 2023 17:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYs-0000ir-3b
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:10 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYp-0003tx-CV
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:08 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VMTeJI005158; Tue, 31 Jan 2023 22:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=KZeDpRZdSz7x761VsbQfAlZnIx/noUt+WOio+IcGJcY=;
 b=huoB5Ho9IrGKR/DEmNbRK/fbUfXpNyuTs3aLa19GV49O+WPNMbaT2arwuV6k2LjalddT
 TDfy3E+ZWVzkmA3lXS+p2OSkoachLNg8+WR2LRKUrzCryWTTIUTiypaPM2SqVnSqH8yB
 sKv1cxnIsy1Hrm/tezYbz+W3phQwBkuJMcnNU6MuCrr9JdoT3fQGAwqrHLWPY9WC5mkg
 em3gAQmxOWG4jZx680YuKf/sM1BqqWM12sz5W96gS1vhnjip+IqDiz9eSizv35didb9d
 KoEXYu8Y1lKNc5n6l3At+7Z46rb6YpQCin9PVL0gojxG5sBHHXkEDmf0SaIoLGLyRJil pA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3new3uaa41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 22:56:56 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30VMusiY000917; 
 Tue, 31 Jan 2023 22:56:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3ncvsm2s1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 31 Jan 2023 22:56:54 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30VMurCG000893;
 Tue, 31 Jan 2023 22:56:53 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 30VMuroe000891;
 Tue, 31 Jan 2023 22:56:53 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id E99B75000A7; Tue, 31 Jan 2023 14:56:52 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v5 00/14] Hexagon: COF overrides, new generator,
 test/bug update
Date: Tue, 31 Jan 2023 14:56:33 -0800
Message-Id: <20230131225647.25274-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: 8NdbHItWpviWmf1aTgKi47tODa_Egi9A
X-Proofpoint-ORIG-GUID: 8NdbHItWpviWmf1aTgKi47tODa_Egi9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=746
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310197
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
bnMsIHNvIGFkZApvdmVycmlkZXMKClRoZSBuZXcgdG9vbGNoYWluIGFsbG93cyB1cyB0byBleGVj
dXRlIHRoZSBIVlggdGVzdHMKCk5ldyBnZW5lcmF0b3IgZW5hYmxlcyBzaWduaWZpY2FudCBpbXBy
b3ZlbWVudCB0byBUQ0cgZ2VuZXJhdGlvbiBmb3IKcHJlZGljYXRlZCBpbnN0cnVjdGlvbnMgYnkg
cmVtb3ZpbmcgdGhlIG5lZWQgZm9yIHNsb3RfY2FuY2VsbGVkCgoqKioqIENoYW5nZXMgaW4gdjIg
KioqKgpBZGQgYSBuZXcgZ2VuZXJhdG9yIGZvciBhbmFseXplXzx0YWc+IGluc3RydWN0aW9ucy4g
IFBvdXBsYXRlIHRoZQpEaXNhc0NvbnRleHQgYWhlYWQgb2YgZ2VuZXJhdGluZyBjb2RlLgoKKioq
KiBDaGFuZ2VzIGluIHYzICoqKioKQ2xlYW51cCBvZiBhbmFseXNpcyBjb2RlCkFkZGVkIHRlc3Qg
dXBkYXRlcyBlbmFibGVkIGJ5IG5ldyB0b29sY2hhaW4gY29udGFpbmVyCgoqKioqIENoYW5nZXMg
aW4gdjQgKioqKgpBZGRpdGlvbmFsIHBhdGNoIGZvciBidWcgZml4ClJlbW92ZSBwa3RfaGFzX3N0
b3JlX3MxIGZyb20gcnVudGltZSBzdGF0ZSB3aXRoIGRlYWxsb2MtcmV0dXJuIHBhdGNoCk5ldyBw
YXRjaGVzIHRvIHV0aWxpemUgbmV3IGFuYWx5emVyIHRvIGltcHJvdmUgcHJlZGljYXRlZCBpbnN0
cnVjdGlvbnMKCioqKiogQ2hhbmdlcyBpbiB2NSAqKioqCkRvbid0IHJlbW92ZSBjb2RlIHRoYXQg
aXMgbmVlZGVkIGZvciAtLWRpc2FibGUtaGV4YWdvbi1pZGVmLXBhcnNlciBjb25maWcKICAgIHBr
dF9oYXNfc3RvcmVfczEgcnVudGltZSBmaWVsZCBhbmQgbWVtX2xvYWRbMTI0OF0gZnVuY3Rpb25z
CkFkZCB1bmRlcnN0YW5kaW5nIG9mIGlkZWYtcGFyc2VyIHRvIGFuYWx5emVyCkFkZGl0aW9uYWwg
cGF0Y2ggdG8gZGV0ZXJtaW5lIHdoZW4gcGt0X2hhc19zdG9yZV9zMSBuZWVkcyB0byBiZSBzZXQK
VXBkYXRlIGZHRU5fVENHXzx0YWc+IHRvIHByZXNlcnZlIC0tZGlzYWJsZS1oZXhhZ29uLWlkZWYt
cGFyc2VyIGNvbmZpZwogICAgaW4gUmVtb3ZlIGdlbl9sb2dfcHJlZGljYXRlZF9yZWdfd3JpdGVb
X3BhaXJdIHBhdGNoCk1vdmUgdGNnX3RlbXBfZnJlZV9pNjQgaW50byBnZW5fbG9nX3ZyZWdfd3Jp
dGUKQWRkIGdldF9yZXN1bHRfcXJlZyBmdW5jdGlvbgoKCgpUYXlsb3IgU2ltcHNvbiAoMTQpOgog
IEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBqdW1wcjMxIGluc3Ry
dWN0aW9ucwogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBjYWxs
cgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBlbmRsb29wMS9l
bmRsb29wMDEKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IgZGVh
bGxvYy1yZXR1cm4gaW5zdHJ1Y3Rpb25zCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFuYWx5
emUgcGFja2V0IGJlZm9yZSBnZW5lcmF0aW5nIFRDRwogIEhleGFnb24gKHRhcmdldC9oZXhhZ29u
KSBEb24ndCBzZXQgcGt0X2hhc19zdG9yZV9zMSB3aGVuIG5vdCBuZWVkZWQKICBIZXhhZ29uICh0
YXJnZXQvaGV4YWdvbikgQW5hbHl6ZSBwYWNrZXQgZm9yIEhWWAogIEhleGFnb24gKHRlc3RzL3Rj
Zy9oZXhhZ29uKSBVcGRhdGUgcHJlZ19hbGlhcy5jCiAgSGV4YWdvbiAodGVzdHMvdGNnL2hleGFn
b24pIFJlbW92ZSBfX2J1aWx0aW4gZnJvbSBzY2F0dGVyX2dhdGhlcgogIEhleGFnb24gKHRlc3Rz
L3RjZy9oZXhhZ29uKSBFbmFibGUgSFZYIHRlc3RzCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24p
IENoYW5nZSBzdWJ0cmFjdCBmcm9tIHplcm8gdG8gY2hhbmdlIHNpZ24KICBIZXhhZ29uICh0YXJn
ZXQvaGV4YWdvbikgUmVtb3ZlIGdlbl9sb2dfcHJlZGljYXRlZF9yZWdfd3JpdGVbX3BhaXJdCiAg
SGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFJlZHVjZSBtYW5pcHVsYXRpb24gb2Ygc2xvdF9jYW5j
ZWxsZWQKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgSW1wcm92ZSBjb2RlIGdlbiBmb3IgcHJl
ZGljYXRlZCBIVlgKICAgIGluc3RydWN0aW9ucwoKIHRhcmdldC9oZXhhZ29uL2NwdS5oICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCAgICAg
ICAgICAgICAgICAgICAgfCAgODIgKysrLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCAg
ICAgICAgICAgICAgICB8ICAxNyArLQogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggICAgICAgICAg
ICAgICAgICAgICB8ICAzMSArLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmggICAgICAgICAg
ICAgICAgICB8ICAgMyArLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmggICAgICAgICAgICAg
ICAgICB8ICA3NyArLS0KIHRhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jICAgICAgICAg
ICAgfCAgIDEgKwogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgICAgICAgICAgICAgICAgICB8
IDMwNiArKysrKysrLS0tLS0KIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNlci1oZWxw
ZXJzLmMgfCAgMTIgKy0KIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jICAgICAgICAgICAgICAg
ICAgfCAgNTEgKy0KIHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jICAgICAgICAgICAgICAgICAg
fCAyNzMgKysrKysrLS0tLS0KIHRlc3RzL3RjZy9oZXhhZ29uL2Zwc3R1ZmYuYyAgICAgICAgICAg
ICAgICAgfCAgMzEgKy0KIHRlc3RzL3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYyAgICAgICAgICAg
ICAgfCAgMTAgKy0KIHRlc3RzL3RjZy9oZXhhZ29uL3NjYXR0ZXJfZ2F0aGVyLmMgICAgICAgICAg
fCA1MTMgKysrKysrKysrKystLS0tLS0tLS0KIHRhcmdldC9oZXhhZ29uL1JFQURNRSAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMzggKy0KIHRhcmdldC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1bmNz
LnB5ICAgICAgICAgfCAyNTIgKysrKysrKysrKwogdGFyZ2V0L2hleGFnb24vZ2VuX2hlbHBlcl9m
dW5jcy5weSAgICAgICAgICB8ICAxOSArLQogdGFyZ2V0L2hleGFnb24vZ2VuX2hlbHBlcl9wcm90
b3MucHkgICAgICAgICB8ICAxMiArLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weSAg
ICAgICAgICAgICB8IDE2NiArKystLS0tCiB0YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5ICAg
ICAgICAgICAgICAgIHwgIDEwICstCiB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9pZGVmLXBh
cnNlci5sZXggIHwgICA0ICstCiB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9pZGVmLXBhcnNl
ci55ICAgIHwgICA3ICstCiB0YXJnZXQvaGV4YWdvbi9tZXNvbi5idWlsZCAgICAgICAgICAgICAg
ICAgIHwgIDExICstCiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgICAgICAgICAg
IHwgIDEzICstCiAyNCBmaWxlcyBjaGFuZ2VkLCAxMTg1IGluc2VydGlvbnMoKyksIDc1OSBkZWxl
dGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDc1NSB0YXJnZXQvaGV4YWdvbi9nZW5fYW5hbHl6ZV9m
dW5jcy5weQoKLS0gCjIuMTcuMQoK

