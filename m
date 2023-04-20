Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9B96E88C0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 05:29:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppKws-0003gy-5J; Wed, 19 Apr 2023 23:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwl-0003fz-59
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:26:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwh-0000Ig-AL
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:26:58 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33K2GTVp020259; Thu, 20 Apr 2023 03:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1b2O+qmlKf9WjWr8GTX3jBAtGg4oeFE29CaycHt1tLo=;
 b=QN3xz62hDbL/8lNKSbPCNYNzS7rAVvB8rFQFHDZXKOAkj0KTOPLcvtMCUCzP5P0mndZw
 cqpJPpnflSlMjptu9+ulneIaocNUW03Ckle2C5sqOBi2ht8aNQlVSf60HH+OH7hd9j0P
 E3U/Nzo09WWsc/1wcoRASj5zN/ms3wOWaxBJmw/ivM8JyhpxKWL1tZOvSU0ShpSPns2h
 TU1OcM6TD1CdbqeNCcG+XFWOjxa0JbCfJzK5etQkeojTheHVWtK1WayW4wmBj97G+/e8
 zDn5yrSD6bCKGORk/wvSeyvB67qVWoEqv3ZYZTW2EhYtRZstvv+WDQnljogq0vK3MWaw ng== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2qv3gjvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:49 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33K3QmEn006589; 
 Thu, 20 Apr 2023 03:26:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3pyn0mbucj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:48 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33K3QmOJ006571;
 Thu, 20 Apr 2023 03:26:48 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 33K3QlEV006558
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:48 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 09A70690; Wed, 19 Apr 2023 20:26:47 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 06/11] Hexagon (target/hexagon) Add overrides for count
 trailing zeros/ones
Date: Wed, 19 Apr 2023 20:26:29 -0700
Message-Id: <20230420032634.105311-7-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420032634.105311-1-tsimpson@quicinc.com>
References: <20230420032634.105311-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MNscqv5hPO5Z6HfdZTFwQFaFiSRJZ-wV
X-Proofpoint-ORIG-GUID: MNscqv5hPO5Z6HfdZTFwQFaFiSRJZ-wV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_16,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=609 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200025
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

VGhlIGZvbGxvd2luZyBpbnN0cnVjdGlvbnMgYXJlIG92ZXJyaWRlbgogICAgUzJfY3QwICAgICAg
ICAgICAgQ291bnQgdHJhaWxpbmcgemVyb3MKICAgIFMyX2N0MSAgICAgICAgICAgIENvdW50IHRy
YWlsaW5nIG9uZXMKICAgIFMyX2N0MHAgICAgICAgICAgIENvdW50IHRyYWlsaW5nIHplcm9zIChy
ZWdpc3RlciBwYWlyKQogICAgUzJfY3QxcCAgICAgICAgICAgQ291bnQgdHJhaWxpbmcgb25lcyAo
cmVnaXN0ZXIgcGFpcikKClRoZXNlIGluc3RydWN0aW9ucyBhcmUgbm90IGhhbmRsZWQgYnkgaWRl
Zi1wYXJzZXIgYmVjYXVzZSB0aGUKaW1wb3J0ZWQgc2VtYW50aWNzIHVzZXMgYml0LXJldmVyc2Uu
ICBIb3dldmVyLCB0aGV5IGFyZQpzdHJhaWdodGZvcndhcmQgdG8gaW1wbGVtZW50IGluIFRDRyB3
aXRoIHRjZ19nZW5fY3R6aV8qCgpUZXN0IGNhc2VzIGFkZGVkIHRvIHRlc3RzL3RjZy9oZXhhZ29u
L21pc2MuYwoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxp
bmFyby5vcmc+Ck1lc3NhZ2UtSWQ6IDwyMDIzMDQwNTE2NDIxMS4zMDAxNS0xLXRzaW1wc29uQHF1
aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8IDI0ICsrKysrKysrKysr
KysrKysrCiB0ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMgfCA1NiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggYi90
YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKaW5kZXggYmNmMGNmNDY2YS4uNDVmOTJhZGY2YyAxMDA2
NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dl
bl90Y2cuaApAQCAtMTA1OCw2ICsxMDU4LDMwIEBACiAjZGVmaW5lIGZHRU5fVENHX1NMMl9qdW1w
cjMxX2ZuZXcoU0hPUlRDT0RFKSBcCiAgICAgZ2VuX2NvbmRfanVtcHIzMShjdHgsIFRDR19DT05E
X05FLCBoZXhfbmV3X3ByZWRfdmFsdWVbMF0pCiAKKy8qIENvdW50IHRyYWlsaW5nIHplcm9zL29u
ZXMgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfUzJfY3QwKFNIT1JUQ09ERSkgXAorICAgIGRvIHsgXAor
ICAgICAgICB0Y2dfZ2VuX2N0emlfdGwoUmRWLCBSc1YsIDMyKTsgXAorICAgIH0gd2hpbGUgKDAp
CisjZGVmaW5lIGZHRU5fVENHX1MyX2N0MShTSE9SVENPREUpIFwKKyAgICBkbyB7IFwKKyAgICAg
ICAgdGNnX2dlbl9ub3RfdGwoUmRWLCBSc1YpOyBcCisgICAgICAgIHRjZ19nZW5fY3R6aV90bChS
ZFYsIFJkViwgMzIpOyBcCisgICAgfSB3aGlsZSAoMCkKKyNkZWZpbmUgZkdFTl9UQ0dfUzJfY3Qw
cChTSE9SVENPREUpIFwKKyAgICBkbyB7IFwKKyAgICAgICAgVENHdl9pNjQgdG1wID0gdGNnX3Rl
bXBfbmV3X2k2NCgpOyBcCisgICAgICAgIHRjZ19nZW5fY3R6aV9pNjQodG1wLCBSc3NWLCA2NCk7
IFwKKyAgICAgICAgdGNnX2dlbl9leHRybF9pNjRfaTMyKFJkViwgdG1wKTsgXAorICAgIH0gd2hp
bGUgKDApCisjZGVmaW5lIGZHRU5fVENHX1MyX2N0MXAoU0hPUlRDT0RFKSBcCisgICAgZG8geyBc
CisgICAgICAgIFRDR3ZfaTY0IHRtcCA9IHRjZ190ZW1wX25ld19pNjQoKTsgXAorICAgICAgICB0
Y2dfZ2VuX25vdF9pNjQodG1wLCBSc3NWKTsgXAorICAgICAgICB0Y2dfZ2VuX2N0emlfaTY0KHRt
cCwgdG1wLCA2NCk7IFwKKyAgICAgICAgdGNnX2dlbl9leHRybF9pNjRfaTMyKFJkViwgdG1wKTsg
XAorICAgIH0gd2hpbGUgKDApCisKIC8qIEZsb2F0aW5nIHBvaW50ICovCiAjZGVmaW5lIGZHRU5f
VENHX0YyX2NvbnZfc2YyZGYoU0hPUlRDT0RFKSBcCiAgICAgZ2VuX2hlbHBlcl9jb252X3NmMmRm
KFJkZFYsIGNwdV9lbnYsIFJzVikKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhhZ29uL21pc2Mu
YyBiL3Rlc3RzL3RjZy9oZXhhZ29uL21pc2MuYwppbmRleCBlNzNhYjU3MzM0Li5lMTI2NzUxZTNh
IDEwMDY0NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMKKysrIGIvdGVzdHMvdGNnL2hl
eGFnb24vbWlzYy5jCkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5cmlnaHQoYykgMjAxOS0y
MDIxIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQu
CisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMyBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwg
SW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBz
b2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICogIGl0IHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlz
aGVkIGJ5CkBAIC0yMSw2ICsyMSw3IEBACiB0eXBlZGVmIHVuc2lnbmVkIGNoYXIgdWludDhfdDsK
IHR5cGVkZWYgdW5zaWduZWQgc2hvcnQgdWludDE2X3Q7CiB0eXBlZGVmIHVuc2lnbmVkIGludCB1
aW50MzJfdDsKK3R5cGVkZWYgdW5zaWduZWQgbG9uZyBsb25nIHVpbnQ2NF90OwogCiAKIHN0YXRp
YyBpbmxpbmUgdm9pZCBTNF9zdG9yZXJobmV3X3JyKHZvaWQgKnAsIGludCBpbmRleCwgdWludDE2
X3QgdikKQEAgLTMzMyw2ICszMzQsNTcgQEAgdm9pZCB0ZXN0X2wyZmV0Y2godm9pZCkKICAgICAg
ICAgICAgICAgICAgICJsMmZldGNoKHIwLCByMzoyKVxuXHQiKTsKIH0KIAorc3RhdGljIGlubGlu
ZSBpbnQgY3QwKHVpbnQzMl90IHgpCit7CisgICAgaW50IHJlczsKKyAgICBhc20oIiUwID0gY3Qw
KCUxKVxuXHQiIDogIj1yIihyZXMpIDogInIiKHgpKTsKKyAgICByZXR1cm4gcmVzOworfQorCitz
dGF0aWMgaW5saW5lIGludCBjdDEodWludDMyX3QgeCkKK3sKKyAgICBpbnQgcmVzOworICAgIGFz
bSgiJTAgPSBjdDEoJTEpXG5cdCIgOiAiPXIiKHJlcykgOiAiciIoeCkpOworICAgIHJldHVybiBy
ZXM7Cit9CisKK3N0YXRpYyBpbmxpbmUgaW50IGN0MHAodWludDY0X3QgeCkKK3sKKyAgICBpbnQg
cmVzOworICAgIGFzbSgiJTAgPSBjdDAoJTEpXG5cdCIgOiAiPXIiKHJlcykgOiAiciIoeCkpOwor
ICAgIHJldHVybiByZXM7Cit9CisKK3N0YXRpYyBpbmxpbmUgaW50IGN0MXAodWludDY0X3QgeCkK
K3sKKyAgICBpbnQgcmVzOworICAgIGFzbSgiJTAgPSBjdDEoJTEpXG5cdCIgOiAiPXIiKHJlcykg
OiAiciIoeCkpOworICAgIHJldHVybiByZXM7Cit9CisKK3ZvaWQgdGVzdF9jb3VudF90cmFpbGlu
Z196ZXJvc19vbmVzKHZvaWQpCit7CisgICAgY2hlY2soY3QwKDB4MDAwMDAwMGYpLCAwKTsKKyAg
ICBjaGVjayhjdDAoMHgwMDAwMDAwMCksIDMyKTsKKyAgICBjaGVjayhjdDAoMHgwMDAwMDBmMCks
IDQpOworCisgICAgY2hlY2soY3QxKDB4MDAwMDAwZjApLCAwKTsKKyAgICBjaGVjayhjdDEoMHgw
MDAwMDAwZiksIDQpOworICAgIGNoZWNrKGN0MSgweDAwMDAwMDAwKSwgMCk7CisgICAgY2hlY2so
Y3QxKDB4ZmZmZmZmZmYpLCAzMik7CisKKyAgICBjaGVjayhjdDBwKDB4MDAwMDAwMDAwMDAwMDAw
ZlVMTCksIDApOworICAgIGNoZWNrKGN0MHAoMHgwMDAwMDAwMDAwMDAwMDAwVUxMKSwgNjQpOwor
ICAgIGNoZWNrKGN0MHAoMHgwMDAwMDAwMDAwMDAwMGYwVUxMKSwgNCk7CisKKyAgICBjaGVjayhj
dDFwKDB4MDAwMDAwMDAwMDAwMDBmMFVMTCksIDApOworICAgIGNoZWNrKGN0MXAoMHgwMDAwMDAw
MDAwMDAwMDBmVUxMKSwgNCk7CisgICAgY2hlY2soY3QxcCgweDAwMDAwMDAwMDAwMDAwMDBVTEwp
LCAwKTsKKyAgICBjaGVjayhjdDFwKDB4ZmZmZmZmZmZmZmZmZmZmZlVMTCksIDY0KTsKKyAgICBj
aGVjayhjdDFwKDB4ZmZmZmZmZmZmZjBmZmZmZlVMTCksIDIwKTsKKyAgICBjaGVjayhjdDFwKDB4
ZmZmZmZmMGZmZmZmZmZmZlVMTCksIDM2KTsKK30KKwogaW50IG1haW4oKQogewogICAgIGludCBy
ZXM7CkBAIC00NjgsNiArNTIwLDggQEAgaW50IG1haW4oKQogCiAgICAgdGVzdF9sMmZldGNoKCk7
CiAKKyAgICB0ZXN0X2NvdW50X3RyYWlsaW5nX3plcm9zX29uZXMoKTsKKwogICAgIHB1dHMoZXJy
ID8gIkZBSUwiIDogIlBBU1MiKTsKICAgICByZXR1cm4gZXJyOwogfQotLSAKMi4yNS4xCgo=

