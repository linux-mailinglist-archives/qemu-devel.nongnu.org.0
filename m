Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5095F35C9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 20:44:55 +0200 (CEST)
Received: from localhost ([::1]:58512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofQQw-0006rf-OY
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 14:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ofPyZ-0006DX-SH
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 14:15:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:53822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ofPyR-0000oi-Pn
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 14:15:35 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 293Fpaor023268;
 Mon, 3 Oct 2022 18:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=LvI9F00xKL9G5lAANx6RpbuECEfBO+jj+GdAuPWoV5Y=;
 b=VzsWHNYRQya5NqOq5eIFqjFFcFFm+dtDZdrxZcr/trx5IE5zcdi5JZ7w2Q67kL7LLop2
 VtLX+QBTbbGQi/Yr9PwuzatNgRL1/Xk7pi/ifR4AokIt3V4n/CKyM0WLLyx10yBKB+/s
 l4hOJRxyWoLyyYMZRHczvO+JWZolIkiGDbY4BWhvLq4ME8LEEr5aDw++SAhOjUPrx+au
 CbwC2zRkIgvh1uMvHn3Egl5784mp7xoNYUzjV3e3zbgyMoZSIoYpb9ZD2k3kbQJBwvSb
 So6kGsKu91HO+KHAxoBShL/OieOVoP6NRSLlUR7FqBfcFdBAbF0WqUhkZag+BD7AJRLd XA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jxcvtvay6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 18:15:15 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 293IFEjT011834; 
 Mon, 3 Oct 2022 18:15:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 3jxemkgpp2-1;
 Mon, 03 Oct 2022 18:15:14 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 293IFEi4011829;
 Mon, 3 Oct 2022 18:15:14 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 293IFDEG011827;
 Mon, 03 Oct 2022 18:15:14 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 7CCB45000A7; Mon,  3 Oct 2022 11:15:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com
Subject: [PULL v3 0/4] Hexagon (target/hexagon) improve store handling and
 gen_tcg_funcs.py
Date: Mon,  3 Oct 2022 11:15:07 -0700
Message-Id: <20221003181511.5535-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RFqH1KzZF9SD5ty4xaO-HiFi2xC2DXwo
X-Proofpoint-ORIG-GUID: RFqH1KzZF9SD5ty4xaO-HiFi2xC2DXwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 mlxlogscore=387 adultscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210030109
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjOGRlNmVjNjNkNzY2Y2ExOTk4YzVh
ZjQ2ODQ4M2NlOTEyZmRjMGMyOgoKICBNZXJnZSB0YWcgJ3B1bGwtcmVxdWVzdC0yMDIyLTA5LTI4
JyBvZiBodHRwczovL2dpdGxhYi5jb20vdGh1dGgvcWVtdSBpbnRvIHN0YWdpbmcgKDIwMjItMDkt
MjggMTc6MDQ6MTEgLTA0MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKCiAgaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvcWVtdSB0YWdzL3B1bGwtaGV4LTIwMjIxMDAz
Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNzcyYjNlYjRiNGZlMTVmMDU5NWJkOTU5
MjM3NzhhNWEwZjM1NThjYzoKCiAgSGV4YWdvbiAoZ2VuX3RjZ19mdW5jcy5weSk6IGF2b2lkIGR1
cGxpY2F0ZWQgdGNnIGNvZGUgb24gQV9DVklfTkVXICgyMDIyLTEwLTAzIDExOjA3OjQ0IC0wNzAw
KQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQoqKioqIENoYW5nZXMgaW4gdjMgKioqKgpBZGQgcGF0Y2ggZnJvbSBNYXRoZXVz
IFRhdmFyZXMgQmVybmFyZGlubwoqKioqIENoYW5nZXMgaW4gdjIgKioqKgpSZW9yZGVyIHBhdGNo
ZXMgc28gaW50ZXJtZWRpYXRlIHBhdGNoIGJ1aWxkcy90ZXN0cyBwcm9wZXJseQoKTWFrZSBzdG9y
ZSBoYW5kbGluZyBmYXN0ZXIgYW5kIG1vcmUgcm9idXN0CkJ1ZyBmaXggaW4gZ2VuX3RjZ19mdW5j
cy5weQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpNYXRoZXVzIFRhdmFyZXMgQmVybmFyZGlubyAoMSk6CiAgICAgIEhleGFn
b24gKGdlbl90Y2dfZnVuY3MucHkpOiBhdm9pZCBkdXBsaWNhdGVkIHRjZyBjb2RlIG9uIEFfQ1ZJ
X05FVwoKVGF5bG9yIFNpbXBzb24gKDMpOgogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikg
YWRkIGluc3RydWN0aW9uIGF0dHJpYnV0ZXMgZnJvbSBhcmNobGliCiAgICAgIEhleGFnb24gKHRh
cmdldC9oZXhhZ29uKSBDaGFuZ2UgZGVjaXNpb24gdG8gc2V0IHBrdF9oYXNfc3RvcmVfc1swMV0K
ICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIG1vdmUgc3RvcmUgc2l6ZSB0cmFja2luZyB0
byB0cmFuc2xhdGlvbgoKIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICAgICAgICAgICAgICAgfCAg
IDggKy0tCiB0YXJnZXQvaGV4YWdvbi9hdHRyaWJzX2RlZi5oLmluYyAgICAgIHwgIDM4ICsrKysr
KysrKystCiB0YXJnZXQvaGV4YWdvbi9kZWNvZGUuYyAgICAgICAgICAgICAgIHwgIDEzICsrLS0K
IHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICAgICAgICAgICAgICAgfCAgMzYgKysrKy0tLS0tLQog
dGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgICAgICAgICAgICB8ICAzNSArKysrKysrKy0tCiB0
YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5ICAgICAgIHwgICAyICstCiB0YXJnZXQvaGV4
YWdvbi9oZXhfY29tbW9uLnB5ICAgICAgICAgIHwgICAzICstCiB0YXJnZXQvaGV4YWdvbi9pbXBv
cnRlZC9sZHN0LmlkZWYgICAgIHwgMTIyICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0KIHRhcmdldC9oZXhhZ29uL2ltcG9ydGVkL3N1Ymluc25zLmlkZWYgfCAgNzIgKysrKysrKysr
Ky0tLS0tLS0tLS0KIDkgZmlsZXMgY2hhbmdlZCwgMTkyIGluc2VydGlvbnMoKyksIDEzNyBkZWxl
dGlvbnMoLSkK

