Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2026C6839D5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 23:58:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMzYu-0000l5-TG; Tue, 31 Jan 2023 17:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYr-0000iK-EE
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:09 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYp-0003u5-EO
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:09 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VMt1T3025455; Tue, 31 Jan 2023 22:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tWNqIYgxwikEVRcM6tv5QP03sGhYWQavlZGAIg0dMds=;
 b=WGXr07XKb8Ve9WYydPBMqbhW9U6hMgC3m8OWeMhV1R7o+LPBnj0fGAeE41QWDPcGehWW
 A+yPMAGh6dvJgR3flMpE/TrLFEjV0lU96C3/bslYxE6Iieh+b4VQiRaB7bBHSkuf2Tt4
 pNx8cQoWlkiGVCOtF6UnCCdM9T3mp5dP+7kvTlGhnNN5pUdBmi1pz7WFlzxH/h9M1kUn
 znS6SXUlmuNztmdRvsIpCTZurW+pQnZZK2XxDx/QhP/4UU/8wJfD5gjpBHXMUq5MSyHe
 3NM5Kd83MnKCN+yDBPMVsq98G0fmH625pjWpf+z6KTtP8b/kNduSCSTlMnwiVgRXoOVZ MA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3neua9agr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 22:56:56 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30VMuskT016265; 
 Tue, 31 Jan 2023 22:56:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3ncvskts0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 31 Jan 2023 22:56:55 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30VMusA2016250;
 Tue, 31 Jan 2023 22:56:54 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 30VMurli016232;
 Tue, 31 Jan 2023 22:56:54 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 050AF5000B9; Tue, 31 Jan 2023 14:56:53 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v5 06/14] Hexagon (target/hexagon) Don't set pkt_has_store_s1
 when not needed
Date: Tue, 31 Jan 2023 14:56:39 -0800
Message-Id: <20230131225647.25274-7-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230131225647.25274-1-tsimpson@quicinc.com>
References: <20230131225647.25274-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NzK8oEXbjZ9lsDUveXj6Qh-eHbwq36EW
X-Proofpoint-ORIG-GUID: NzK8oEXbjZ9lsDUveXj6Qh-eHbwq36EW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxlogscore=549
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301310197
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

VGhlIHBrdF9oYXNfc3RvcmVfczEgZmllbGQgaW4gQ1BVSGV4YWdvblN0YXRlIGlzIG9ubHkgbmVl
ZGVkIGluIGdlbmVyYXRlZApoZWxwZXJzIGZvciBzY2FsYXIgbG9hZCBpbnN0cnVjdGlvbnMuICBT
ZWUgY2hlY2tfbm9zaHVmIGFuZCBtZW1fbG9hZFsxMjQ4XQppbiBvcF9oZWxwZXIuYy4KCldlIGFk
ZCBsb2dpYyBpbiBnZW5fYW5hbHl6ZV9mdW5jcy5weSB0byBzZXQgbmVlZF9wa3RfaGFzX3N0b3Jl
X3MxIGluCkRpc2FzQ29udGV4dCB3aGVuIGl0IGlzIG5lZWRlZCBhdCBydW50aW1lLgoKU2lnbmVk
LW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRhcmdl
dC9oZXhhZ29uL3RyYW5zbGF0ZS5oICAgICAgICAgIHwgMSArCiB0YXJnZXQvaGV4YWdvbi9hdHRy
aWJzX2RlZi5oLmluYyAgICB8IDEgKwogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgICAgICAg
ICAgfCA2ICsrKysrLQogdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3MucHkgfCA1ICsr
KysrCiB0YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5ICAgICAgICB8IDEgKwogNSBmaWxlcyBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGFy
Z2V0L2hleGFnb24vdHJhbnNsYXRlLmggYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaAppbmRl
eCBkNDVkM2E0YmIwLi4zNDM2OGIyMTg2IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi90cmFu
c2xhdGUuaAorKysgYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaApAQCAtNjEsNiArNjEsNyBA
QCB0eXBlZGVmIHN0cnVjdCBEaXNhc0NvbnRleHQgewogICAgIFRDR0NvbmQgYnJhbmNoX2NvbmQ7
CiAgICAgdGFyZ2V0X3Vsb25nIGJyYW5jaF9kZXN0OwogICAgIGJvb2wgaXNfdGlnaHRfbG9vcDsK
KyAgICBib29sIG5lZWRfcGt0X2hhc19zdG9yZV9zMTsKIH0gRGlzYXNDb250ZXh0OwogCiBzdGF0
aWMgaW5saW5lIHZvaWQgY3R4X2xvZ19wcmVkX3dyaXRlKERpc2FzQ29udGV4dCAqY3R4LCBpbnQg
cG51bSkKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jIGIvdGFy
Z2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMKaW5kZXggNWQyYTEwMmMxOC4uOTg3NGQxNjU4
ZiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMKKysrIGIvdGFy
Z2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMKQEAgLTQ0LDYgKzQ0LDcgQEAgREVGX0FUVFJJ
QihNRU1TSVpFXzFCLCAiTWVtb3J5IHdpZHRoIGlzIDEgYnl0ZSIsICIiLCAiIikKIERFRl9BVFRS
SUIoTUVNU0laRV8yQiwgIk1lbW9yeSB3aWR0aCBpcyAyIGJ5dGVzIiwgIiIsICIiKQogREVGX0FU
VFJJQihNRU1TSVpFXzRCLCAiTWVtb3J5IHdpZHRoIGlzIDQgYnl0ZXMiLCAiIiwgIiIpCiBERUZf
QVRUUklCKE1FTVNJWkVfOEIsICJNZW1vcnkgd2lkdGggaXMgOCBieXRlcyIsICIiLCAiIikKK0RF
Rl9BVFRSSUIoU0NBTEFSX0xPQUQsICJMb2FkIGlzIHNjYWxhciIsICIiLCAiIikKIERFRl9BVFRS
SUIoU0NBTEFSX1NUT1JFLCAiU3RvcmUgaXMgc2NhbGFyIiwgIiIsICIiKQogREVGX0FUVFJJQihS
RUdXUlNJWkVfMUIsICJNZW1vcnkgd2lkdGggaXMgMSBieXRlIiwgIiIsICIiKQogREVGX0FUVFJJ
QihSRUdXUlNJWkVfMkIsICJNZW1vcnkgd2lkdGggaXMgMiBieXRlcyIsICIiLCAiIikKZGlmZiAt
LWdpdCBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNs
YXRlLmMKaW5kZXggZmVkY2Y4NzMwYy4uOGIzM2U2Y2Q4ZiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hl
eGFnb24vdHJhbnNsYXRlLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKQEAgLTMz
Myw2ICszMzMsNyBAQCBzdGF0aWMgdm9pZCBtYXJrX2ltcGxpY2l0X3ByZWRfd3JpdGVzKERpc2Fz
Q29udGV4dCAqY3R4KQogc3RhdGljIHZvaWQgYW5hbHl6ZV9wYWNrZXQoRGlzYXNDb250ZXh0ICpj
dHgpCiB7CiAgICAgUGFja2V0ICpwa3QgPSBjdHgtPnBrdDsKKyAgICBjdHgtPm5lZWRfcGt0X2hh
c19zdG9yZV9zMSA9IGZhbHNlOwogICAgIGZvciAoaW50IGkgPSAwOyBpIDwgcGt0LT5udW1faW5z
bnM7IGkrKykgewogICAgICAgICBJbnNuICppbnNuID0gJnBrdC0+aW5zbltpXTsKICAgICAgICAg
Y3R4LT5pbnNuID0gaW5zbjsKQEAgLTM2NywxMiArMzY4LDE1IEBAIHN0YXRpYyB2b2lkIGdlbl9z
dGFydF9wYWNrZXQoRGlzYXNDb250ZXh0ICpjdHgpCiAgICAgZm9yIChpID0gMDsgaSA8IFNUT1JF
U19NQVg7IGkrKykgewogICAgICAgICBjdHgtPnN0b3JlX3dpZHRoW2ldID0gMDsKICAgICB9Ci0g
ICAgdGNnX2dlbl9tb3ZpX3RsKGhleF9wa3RfaGFzX3N0b3JlX3MxLCBwa3QtPnBrdF9oYXNfc3Rv
cmVfczEpOwogICAgIGN0eC0+czFfc3RvcmVfcHJvY2Vzc2VkID0gZmFsc2U7CiAgICAgY3R4LT5w
cmVfY29tbWl0ID0gdHJ1ZTsKIAogICAgIGFuYWx5emVfcGFja2V0KGN0eCk7CiAKKyAgICBpZiAo
Y3R4LT5uZWVkX3BrdF9oYXNfc3RvcmVfczEpIHsKKyAgICAgICAgdGNnX2dlbl9tb3ZpX3RsKGhl
eF9wa3RfaGFzX3N0b3JlX3MxLCBwa3QtPnBrdF9oYXNfc3RvcmVfczEpOworICAgIH0KKwogICAg
IC8qCiAgICAgICogcHJlZ3Nfd3JpdHRlbiBpcyB1c2VkIGJvdGggaW4gdGhlIGFuYWx5emUgcGhh
c2UgYXMgd2VsbCBhcyB0aGUgY29kZQogICAgICAqIGdlbiBwaGFzZSwgc28gY2xlYXIgaXQgYWdh
aW4uCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fYW5hbHl6ZV9mdW5jcy5weSBiL3Rh
cmdldC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1bmNzLnB5CmluZGV4IGM0NTY5NmJlYzguLmZmNWI2
OTk3OGMgMTAwNzU1Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1bmNzLnB5Cisr
KyBiL3RhcmdldC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1bmNzLnB5CkBAIC0yMDAsNiArMjAwLDEx
IEBAIGRlZiBnZW5fYW5hbHl6ZV9mdW5jKGYsIHRhZywgcmVncywgaW1tcyk6CiAgICAgICAgIGFu
YWx5emVfb3BuKGYsIHRhZywgcmVndHlwZSwgcmVnaWQsIHRvc3MsIG51bXJlZ3MsIGkpCiAgICAg
ICAgIGkgKz0gMQogCisgICAgaGFzX2dlbmVyYXRlZF9oZWxwZXIgPSAobm90IGhleF9jb21tb24u
c2tpcF9xZW11X2hlbHBlcih0YWcpIGFuZAorICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5v
dCBoZXhfY29tbW9uLmlzX2lkZWZfcGFyc2VyX2VuYWJsZWQodGFnKSkKKyAgICBpZiAoaGFzX2dl
bmVyYXRlZF9oZWxwZXIgYW5kCisgICAgICAgICdBX1NDQUxBUl9MT0FEJyBpbiBoZXhfY29tbW9u
LmF0dHJpYmRpY3RbdGFnXSk6CisgICAgICAgIGYud3JpdGUoIiAgICBjdHgtPm5lZWRfcGt0X2hh
c19zdG9yZV9zMSA9IHRydWU7XG4iKQogCiAgICAgZi53cml0ZSgifVxuXG4iKQogCmRpZmYgLS1n
aXQgYS90YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5IGIvdGFyZ2V0L2hleGFnb24vaGV4X2Nv
bW1vbi5weQppbmRleCBhMjlmNjFiYjRmLi43NmRhMzYyYzExIDEwMDc1NQotLS0gYS90YXJnZXQv
aGV4YWdvbi9oZXhfY29tbW9uLnB5CisrKyBiL3RhcmdldC9oZXhhZ29uL2hleF9jb21tb24ucHkK
QEAgLTg5LDYgKzg5LDcgQEAgZGVmIGNhbGN1bGF0ZV9hdHRyaWJzKCk6CiAgICAgYWRkX3FlbXVf
bWFjcm9fYXR0cmliKCdmV1JJVEVfUDMnLCAnQV9XUklURVNfUFJFRF9SRUcnKQogICAgIGFkZF9x
ZW11X21hY3JvX2F0dHJpYignZlNFVF9PVkVSRkxPVycsICdBX0lNUExJQ0lUX1dSSVRFU19VU1In
KQogICAgIGFkZF9xZW11X21hY3JvX2F0dHJpYignZlNFVF9MUENGRycsICdBX0lNUExJQ0lUX1dS
SVRFU19VU1InKQorICAgIGFkZF9xZW11X21hY3JvX2F0dHJpYignZkxPQUQnLCAnQV9TQ0FMQVJf
TE9BRCcpCiAgICAgYWRkX3FlbXVfbWFjcm9fYXR0cmliKCdmU1RPUkUnLCAnQV9TQ0FMQVJfU1RP
UkUnKQogCiAgICAgIyBSZWN1cnNlIGRvd24gbWFjcm9zLCBmaW5kIGF0dHJpYnV0ZXMgZnJvbSBz
dWItbWFjcm9zCi0tIAoyLjE3LjEKCg==

