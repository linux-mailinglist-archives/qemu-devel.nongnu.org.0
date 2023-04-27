Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4C6F0EA4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:01:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAbB-0001kq-Lk; Thu, 27 Apr 2023 19:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb8-0001iw-5v
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb3-0001KU-NF
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:21 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RMu1TO015446; Thu, 27 Apr 2023 23:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=24cGa+5lKgaVRy0guvfzG164ckqIR+tG4TQDa2OiYPE=;
 b=pD6ZhXlqyNBB8n9HYQCY+OsaFNyXECtH7KDWNhOgpicaCpO3QBr6h1Y2u0juqp7Pfkqf
 NSks37JhQWlLdyKyiuZ2j8EwAz4r2pqodp0FJqZOVCR/acc6G9fkxQ9PgqXrVvcXhOow
 jylfg7TBKSAdZ4QCIQf7+TCgjobMMLH161PRb5d3y8Bh1GnaKwbpA6qbBvXlAIokns0y
 bcMqbqy9sgISM0duP6tqYBYreYKxK43mhbqPTyYVhGqzl3zEqnEs160ECNQPAbXEz0SE
 rZGHNU114/aiPKA2wD5gOpvXT2kX7Yau9Qbhbc8SQ+RYKm7dbVCQA+nU4psYLoJT44yp Iw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7yg4g9bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RMt5Xb020047; 
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3q48nmt9ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0EWt025271;
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 33RN0DFQ025250
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id B3DAC660; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 00/21] Hexagon (target/hexagon) short-circuit and move to
 DisasContext
Date: Thu, 27 Apr 2023 15:59:51 -0700
Message-Id: <20230427230012.3800327-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: 0LX-2GeENFIklO_MjR-gF6UKzoeMLdwH
X-Proofpoint-ORIG-GUID: 0LX-2GeENFIklO_MjR-gF6UKzoeMLdwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 mlxlogscore=517 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270202
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

VGhpcyBwYXRjaCBzZXJpZXMgYWNoaWV2ZXMgdHdvIG1ham9yIGdvYWxzCkdvYWwgMTogIFNob3J0
LWNpcmN1aXQgcGFja2V0IHNlbWFudGljcwogICAgSW4gY2VydGFpbiBjYXNlcywgd2UgY2FuIGF2
b2lkIHRoZSBvdmVyaGVhZCBvZiB3cml0aW5nIHRvCiAgICBoZXhfbmV3X3ZhbHVlIGFuZCB3cml0
ZSBkaXJlY3RseSB0byBoZXhfZ3ByLgoKICAgIEhlcmUncyBhIHNpbXBsZSBleGFtcGxlIG9mIHRo
ZSBUQ0cgZ2VuZXJhdGVkIGZvcgogICAgMHgwMDQwMDBiNDogIDB4NzgwMGMwMjAgeyAgICAgICBS
MCA9ICMweDEgfQoKICAgIEJFRk9SRToKICAgICAtLS0tIDAwNDAwMGI0CiAgICAgbW92aV9pMzIg
bmV3X3IwLCQweDEKICAgICBtb3ZfaTMyIHIwLG5ld19yMAoKICAgIEFGVEVSOgogICAgIC0tLS0g
MDA0MDAwYjQKICAgICBtb3ZpX2kzMiByMCwkMHgxCkdvYWwgMjogIE1vdmUgYm9va2tlZXBpbmcg
aXRlbXMgZnJvbSBDUFVIZXhhZ29uU3RhdGUgdG8gRGlzYXNDb250ZXh0CiAgICBTdWdnZXN0ZWQt
Ynk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgogICAg
U2V2ZXJhbCBmaWVsZHMgaW4gQ1BVSGV4YWdvblN0YXRlIGFyZSBvbmx5IHVzZWQgZm9yIGJvb2tr
ZWVwaW5nCiAgICB3aXRoaW4gdGhlIHRyYW5zbGF0aW9uIG9mIGEgcGFja2V0LiAgV2l0aCByZWNl
bnQgY2hhbmdlcyB0byBlbGltaW5hdGUKICAgIHRoZSBuZWVkIHRvIGZyZWUgVENHdiB2YXJpYWJs
ZXMsIHRoZXNlIG1ha2UgbW9yZSBzZW5zZSB0byBiZQogICAgdHJhbnNpZW50IGFuZCBrZXB0IGlu
IERpc2FzQ29udGV4dC4KCgpUaGlzIHBhdGNoIHNlcmllcyBjYW4gYmUgZGl2aWRlZCBpbnRvIDMg
bWFpbiBwYXJ0cwpQYXJ0IDE6ICBQYXRjaGVzIDEtOQogICAgQ2xlYW51cCBpbiBwcmVwYXJhdGlv
biBmb3IgcGFydHMgMiBhbmQgMwogICAgVGhlIG1haW4gZ29hbCBpcyB0byBtb3ZlIGZ1bmN0aW9u
YWxpdHkgb3V0IG9mIGdlbmVyYXRlZCBoZWxwZXJzClBhcnQgMjogIFBhdGNoZXMgMTAtMTUKICAg
IFNob3J0LWNpcmN1aXQgcGFja2V0IHNlbWFudGljcwpQYXJ0IDM6ICBQYXRjaGVzIDE2LTIxCiAg
ICBNb3ZlIGJvb2trZWVwaW5nIGl0ZW1zIGZyb20gQ1BVSGV4YWdvblN0YXRlIHRvIERpc2FzQ29u
dGV4dAoKCioqKiogQ2hhbmdlcyBpbiB2MiAqKioqCkFkZHJlc3MgZmVlZGJhY2sgZnJvbSBSaWNo
YXJkIEhlbmRlcnNvbiA8PHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+CiAgICBDbGVhbmVy
IGltcGxlbWVudGF0aW9uIG9mIGdlbl9mcmFtZV9zY3JhbWJsZQogICAgQWRkIGdfYXNzZXJ0X25v
dF9yZWFjaGVkKCkgaW4gZ2VuX2ZyYW1lY2hlY2sKICAgIE1vdmUgVENHdiBhbGxvY2F0aW9uIGlu
c2lkZSBnZW5fZnJhbWVfc2NyYW1ibGUKICAgIENoYW5nZSB0Y2dfZ2VuX2JyY29uZF90bCB0byB0
Y2dfZ2VuX21vdmNvbmRfdGwKICAgIENoYW5nZSBzdGF0aWMgaW5saW5lIHRvIEdfR05VQ19VTlVT
RUQKICAgICAgICBSZW1vdmVkIGluIGxhdGVyIHBhdGNoCiAgICBDaGFuZ2UgdGNnX2dlbl9ub3Rf
aTY0ICsgdGNnX2dlbl9hbmRfaTY0IHRvIHRjZ19nZW5fYW5kY19pNjQKICAgIFVzZSBmdWxsIGNv
bnN0YW50IGluIGdlbl9zbG90dmFsCiAgICAKCgoKClRheWxvciBTaW1wc29uICgyMSk6CiAgbWVz
b24uYnVpbGQgQWRkIENPTkZJR19IRVhBR09OX0lERUZfUEFSU0VSCiAgSGV4YWdvbiAodGFyZ2V0
L2hleGFnb24pIEFkZCBEaXNhc0NvbnRleHQgYXJnIHRvIGdlbl9sb2dfcmVnX3dyaXRlCiAgSGV4
YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGxvb3Agc2V0dXAgaW5zdHJ1
Y3Rpb25zCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGFsbG9j
ZnJhbWUvZGVhbGxvY2ZyYW1lCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlk
ZXMgZm9yIGNsclt0Zl1uZXcKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgUmVtb3ZlIGxvZ19y
ZWdfd3JpdGUgZnJvbSBvcF9oZWxwZXIuW2NoXQogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBF
bGltaW5hdGUgdXNlcyBvZiBsb2dfcHJlZF93cml0ZSBmdW5jdGlvbgogIEhleGFnb24gKHRhcmdl
dC9oZXhhZ29uKSBDbGVhbiB1cCBwcmVkX3dyaXR0ZW4gdXNhZ2UKICBIZXhhZ29uICh0YXJnZXQv
aGV4YWdvbikgRG9uJ3Qgb3ZlcmxhcCBkZXN0IHdyaXRlcyB3aXRoIHNvdXJjZSByZWFkcwogIEhl
eGFnb24gKHRhcmdldC9oZXhhZ29uKSBNYXJrIHJlZ2lzdGVycyBhcyByZWFkIGR1cmluZyBwYWNr
ZXQgYW5hbHlzaXMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgU2hvcnQtY2lyY3VpdCBwYWNr
ZXQgcmVnaXN0ZXIgd3JpdGVzCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFNob3J0LWNpcmN1
aXQgcGFja2V0IHByZWRpY2F0ZSB3cml0ZXMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgU2hv
cnQtY2lyY3VpdCBwYWNrZXQgSFZYIHdyaXRlcwogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBT
aG9ydC1jaXJjdWl0IG1vcmUgSFZYIHNpbmdsZSBpbnN0cnVjdGlvbgogICAgcGFja2V0cwogIEhl
eGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBkaXNhYmxlZCBpZGVmLXBh
cnNlciBpbnNucwogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBNYWtlIHNwZWNpYWwgbmV3X3Zh
bHVlIGZvciBVU1IKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgTW92ZSBuZXdfdmFsdWUgdG8g
RGlzYXNDb250ZXh0CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIE1vdmUgbmV3X3ByZWRfdmFs
dWUgdG8gRGlzYXNDb250ZXh0CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIE1vdmUgcHJlZF93
cml0dGVuIHRvIERpc2FzQ29udGV4dAogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBNb3ZlIHBr
dF9oYXNfc3RvcmVfczEgdG8gRGlzYXNDb250ZXh0CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24p
IE1vdmUgaXRlbXMgdG8gRGlzYXNDb250ZXh0CgogbWVzb24uYnVpbGQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCiB0YXJnZXQvaGV4YWdvbi9jcHUuaCAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEwICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggICAgICAgICAg
ICAgICAgICAgIHwgMTE2ICsrKysrKy0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggICAg
ICAgICAgICAgICAgfCAgMjMgKysKIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5oICAgICAgICAgICAg
ICAgICAgICAgfCAgIDYgKy0KIHRhcmdldC9oZXhhZ29uL2hlbHBlci5oICAgICAgICAgICAgICAg
ICAgICAgfCAgIDYgKy0KIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICAgICAgICAgICAgICAgICAg
ICAgfCAgNTcgKystLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmggICAgICAgICAgICAgICAg
ICB8ICAxNiArLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmggICAgICAgICAgICAgICAgICB8
ICA1MiArKy0KIHRhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jICAgICAgICAgICAgfCAg
IDYgKy0KIHRhcmdldC9oZXhhZ29uL2FyY2guYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMg
Ky0KIHRhcmdldC9oZXhhZ29uL2NwdS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0K
IHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICAgICAgICAgICAgICAgICAgICAgfCAzNDcgKysrKysr
KysrKysrKysrKy0tLS0KIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNlci1oZWxwZXJz
LmMgfCAgIDQgKy0KIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jICAgICAgICAgICAgICAgICAg
fCAxNTQgKysrKysrLS0tCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyAgICAgICAgICAgICAg
ICAgIHwgMjcyICsrKysrKysrKystLS0tLQogdGVzdHMvdGNnL2hleGFnb24vaHZ4X21pc2MuYyAg
ICAgICAgICAgICAgICB8ICAyMSArKwogdGVzdHMvdGNnL2hleGFnb24vcmVhZF93cml0ZV9vdmVy
bGFwLmMgICAgICB8IDEzNiArKysrKysrKwogdGFyZ2V0L2hleGFnb24vUkVBRE1FICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgNiArLQogdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3Mu
cHkgICAgICAgICB8ICA1MSArKy0KIHRhcmdldC9oZXhhZ29uL2dlbl9oZWxwZXJfZnVuY3MucHkg
ICAgICAgICAgfCAgIDkgKy0KIHRhcmdldC9oZXhhZ29uL2dlbl9oZWxwZXJfcHJvdG9zLnB5ICAg
ICAgICAgfCAgMTAgKy0KIHRhcmdldC9oZXhhZ29uL2dlbl9pZGVmX3BhcnNlcl9mdW5jcy5weSAg
ICAgfCAgIDcgKwogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weSAgICAgICAgICAgICB8
ICAyMSArLQogdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weSAgICAgICAgICAgICAgICB8ICAx
NiArLQogdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0ICAgICAgICAgICB8ICAgMSAr
CiAyNiBmaWxlcyBjaGFuZ2VkLCAxMDYzIGluc2VydGlvbnMoKyksIDI5MyBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy90Y2cvaGV4YWdvbi9yZWFkX3dyaXRlX292ZXJsYXAu
YwoKLS0gCjIuMjUuMQoK

