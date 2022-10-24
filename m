Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D278D60BF09
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:53:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on7F0-00033K-BE; Mon, 24 Oct 2022 19:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1on7E8-0000kT-Iv
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:51:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1on7E4-0005Cd-Up
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:51:28 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29ONbQCs029786;
 Mon, 24 Oct 2022 23:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=QfJupkI4lG4o5CWsNViyCgAEm1gEaa2bQvibQgZ7s/U=;
 b=A9BXTadb3u7ucWuMzfIG2VhDZxeksCRW03i3f1QFrBDbOUWiD6/5Uw4hT90gdDq8c12N
 JuUCgIQPppdvHJUOqp0lGRD9TYaQgVrywRddfWeuw7Mspu8q7KSfYTUz1jrq17cYDJxJ
 iBQJXV76nsfIze3zXfGOUbg9q3f8uAGH5u5pK0/AAJQgMPZ9GlCRxqY7h4+RRhCObJ5/
 pt2u4UHJ/gRtH7TroPkgUW5wxT1LZkRourpOG77p7CMHFBkRKoKPua9FtoxhYfAzxlgA
 YULeuQwHCbsAYl9dCDt0glM828YrgLrar8ID1Jkyw9w7dlF5shFfDP2HMDfuU4GAbg25 cQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kc7utcr4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 23:51:21 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 29ONpJso021251; 
 Mon, 24 Oct 2022 23:51:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 3kc9kkr1y2-1;
 Mon, 24 Oct 2022 23:51:19 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29ONpJfd021246;
 Mon, 24 Oct 2022 23:51:19 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 29ONpJrh021244;
 Mon, 24 Oct 2022 23:51:19 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 3523B5000A7; Mon, 24 Oct 2022 16:51:19 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 0/8] Hexagon (target/hexagon) Improve change-of-flow
Date: Mon, 24 Oct 2022 16:51:09 -0700
Message-Id: <20221024235117.3663-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 7Mi6cDa0UIYh-p4v0pQBAepGVvMji71U
X-Proofpoint-GUID: 7Mi6cDa0UIYh-p4v0pQBAepGVvMji71U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_07,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=5
 priorityscore=1501
 impostorscore=0 mlxscore=5 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=5 bulkscore=0 mlxlogscore=125 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240142
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

VGhpcyBwYXRjaCBzZXJpZXMgaW1wcm92ZXMgY2hhbmdlLW9mLWZsb3cgaGFuZGxpbmcuCgpDdXJy
ZW50bHksIHdlIHNldCB0aGUgUEMgdG8gYSBuZXcgYWRkcmVzcyBiZWZvcmUgZXhpdGluZyBhIFRC
LiAgVGhlCnVsdGltYXRlIGdvYWwgaXMgdG8gdXNlIGRpcmVjdCBibG9jayBjaGFpbmluZy4gIEhv
d2V2ZXIsIHNldmVyYWwgc3RlcHMKYXJlIG5lZWRlZCBhbG9uZyB0aGUgd2F5LgoKMSkKV2hlbiBh
IHBhY2tldCBoYXMgbW9yZSB0aGFuIG9uZSBjaGFuZ2Utb2YtZmxvdyAoQ09GKSBpbnN0cnVjdGlv
biwgb25seQp0aGUgZmlyc3Qgb25lIHRha2VuIGlzIGNvbnNpZGVyZWQuICBUaGUgcnVudGltZSBi
b29ra2VlcGluZyBpcyBvbmx5Cm5lZWRlZCB3aGVuIHRoZXJlIGlzIG1vcmUgdGhhbiBvbmUgQ09G
IGluc3RydWN0aW9uIGluIGEgcGFja2V0LgoKMiwgMykKUmVtb3ZlIFBDIGFuZCBuZXh0X1BDIGZy
b20gdGhlIHJ1bnRpbWUgc3RhdGUgYW5kIGFsd2F5cyB1c2UgYQp0cmFuc2xhdGlvbi10aW1lIGNv
bnN0YW50LiAgTm90ZSB0aGF0IG5leHRfUEMgaXMgdXNlZCBieSBjYWxsIGluc3RydWN0aW9ucwp0
byBzZXQgTFIgYW5kIGJ5IGNvbmRpdGlvbmFsIENPRiBpbnN0cnVjdGlvbnMgdG8gc2V0IHRoZSBm
YWxsLXRocm91Z2gKYWRkcmVzcy4KCjQsIDUsIDYpCkFkZCBoZWxwZXIgb3ZlcnJpZGVzIGZvciBD
T0YgaW5zdHJ1Y3Rpb25zLiAgSW4gcGFydGljdWxhciwgd2UgbXVzdApkaXN0aW5ndWlzaCB0aG9z
ZSB0aGF0IHVzZSBhIFBDLXJlbGF0aXZlIGFkZHJlc3MgZm9yIHRoZSBkZXN0aW5hdGlvbi4KVGhl
c2UgYXJlIGNhbmRpZGF0ZXMgZm9yIGRpcmVjdCBibG9jayBjaGFpbmluZyBsYXRlci4KCjcpClVz
ZSBkaXJlY3QgYmxvY2sgY2hhaW5pbmcgZm9yIHBhY2tldHMgdGhhdCBoYXZlIGEgc2luZ2xlIFBD
LXJlbGF0aXZlCkNPRiBpbnN0cnVjdGlvbi4gIEluc3RlYWQgb2YgZ2VuZXJhdGluZyB0aGUgY29k
ZSB3aGlsZSBwcm9jZXNzaW5nIHRoZQppbnN0cnVjdGlvbiwgd2UgcmVjb3JkIHRoZSBlZmZlY3Qg
aW4gRGlzYXNDb250ZXh0IGFuZCBnZW5lcmF0ZSB0aGUgY29kZQpkdXJpbmcgZ2VuX2VuZF90Yi4K
CjgpClVzZSBkaXJlY3QgYmxvY2sgY2hhaW5pbmcgZm9yIHRpZ2h0IGxvb3BzLiAgV2UgbG9vayBm
b3IgVEJzIHRoYXQgZW5kCndpdGggYW4gZW5kbG9vcDAgdGhhdCB3aWxsIGJyYW5jaCBiYWNrIHRv
IHRoZSBUQiBzdGFydCBhZGRyZXNzLgoKCioqKiogQ2hhbmdlcyBpbiBWMiAqKioqClNpbXBsaWZ5
IHRlc3QgaW4gbmVlZF9wa3RfaGFzX211bHRpX2NvZgpBZGRyZXNzIGZlZWRiYWNrIGZyb20gTWF0
aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5jb20+CiAgICBS
ZWFycmFuZ2UgbmV3LXZhbHVlLWp1bXAgb3ZlcnJpZGVzCiAgICBTaW1wbGlmeSBnZW5fd3JpdGVf
bmV3X3BjX2FkZHIKCgoKVGF5bG9yIFNpbXBzb24gKDgpOgogIEhleGFnb24gKHRhcmdldC9oZXhh
Z29uKSBPbmx5IHVzZSBicmFuY2hfdGFrZW4gd2hlbiBwYWNrZXQgaGFzIG11bHRpCiAgICBjb2YK
ICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgUmVtb3ZlIFBDIGZyb20gdGhlIHJ1bnRpbWUgc3Rh
dGUKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgUmVtb3ZlIG5leHRfUEMgZnJvbSBydW50aW1l
IHN0YXRlCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGRpcmVj
dCBjYWxsIGluc3RydWN0aW9ucwogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJp
ZGVzIGZvciBjb21wb3VuZCBjb21wYXJlIGFuZCBqdW1wCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFn
b24pIEFkZCBvdmVycmlkZXMgZm9yIHZhcmlvdXMgZm9ybXMgb2YganVtcAogIEhleGFnb24gKHRh
cmdldC9oZXhhZ29uKSBVc2UgZGlyZWN0IGJsb2NrIGNoYWluaW5nIGZvciBkaXJlY3QKICAgIGp1
bXAvYnJhbmNoCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFVzZSBkaXJlY3QgYmxvY2sgY2hh
aW5pbmcgZm9yIHRpZ2h0IGxvb3BzCgogdGFyZ2V0L2hleGFnb24vY3B1LmggICAgICAgICAgICAg
ICAgfCAgMTggKy0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCAgICAgICAgICAgIHwgMzkwICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIHRhcmdldC9oZXhhZ29uL2luc24uaCAgICAgICAg
ICAgICAgIHwgICAyICsKIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICAgICAgICAgICAgIHwgICA2
ICstCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaCAgICAgICAgICB8ICAgNiArLQogdGFyZ2V0
L2hleGFnb24vZGVjb2RlLmMgICAgICAgICAgICAgfCAgMTUgKy0KIHRhcmdldC9oZXhhZ29uL2dl
bnB0ci5jICAgICAgICAgICAgIHwgMjYwICsrKysrKysrKysrKysrKysrKysKIHRhcmdldC9oZXhh
Z29uL29wX2hlbHBlci5jICAgICAgICAgIHwgIDI4ICstCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xh
dGUuYyAgICAgICAgICB8IDEyMCArKysrKysrLS0KIHRhcmdldC9oZXhhZ29uL2dlbl9oZWxwZXJf
ZnVuY3MucHkgIHwgIDExICsKIHRhcmdldC9oZXhhZ29uL2dlbl9oZWxwZXJfcHJvdG9zLnB5IHwg
IDEyICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5ICAgICB8ICAxMSArCiB0YXJn
ZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5ICAgICAgICB8ICAyOSArKy0KIDEzIGZpbGVzIGNoYW5n
ZWQsIDg2MyBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCg==

