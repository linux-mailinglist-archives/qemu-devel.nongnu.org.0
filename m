Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6486D83F2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:44:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk6EU-0005ed-Oy; Wed, 05 Apr 2023 12:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pk6ES-0005eK-Ey
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:43:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pk6EQ-0005X5-OH
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:43:36 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3359cHEP018920; Wed, 5 Apr 2023 16:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=H9RWvQrwu8VjgUKWlN5VlxlTz/2sRHKBaKKgmYdskXc=;
 b=FxLNNxM3BoITTbdcBU7o1ci3L03zulggx2ZS+15n3+psTOrRBYAApHxiKQF2RJ4o6m+O
 GcMiDHPCg9ENak81uaIN0GASdnFX0QT7e5dnttkKslwvuYZx7EoPE6a7V8THr81GmqX8
 ap58dtUziFRqLZ6/yplu+KeDQbMLSVo8/ZXC1UwFskTltp1ATpyg6TErfSDKvG8mrJQr
 rZraO54EB2jb7FH3I6Z+fHeaX3457+25+Z4Ptb1krwddoBiVdI/60dyKejub9tZpZuNu
 BY3RHg4M4jrDzH81NShdgWfaLBQZ9cN/ztGEBKBeEq1Gb/KMsOxKxCrGakeBMdvM0aV5 OQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prn8b3j67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 16:43:31 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 335GcmQO025315; 
 Wed, 5 Apr 2023 16:43:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3ppdpm87c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 16:43:30 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 335GhTXo030223;
 Wed, 5 Apr 2023 16:43:29 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 335GhTLi030216
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 16:43:29 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id F02E5594; Wed,  5 Apr 2023 09:43:28 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH] Hexagon (target/hexagon) Add overrides for count trailing
 zeros/ones
Date: Wed,  5 Apr 2023 09:42:09 -0700
Message-Id: <20230405164211.30015-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: Jx0ZR1r8zv5LD05jszSwYiEPNKOq3tBr
X-Proofpoint-ORIG-GUID: Jx0ZR1r8zv5LD05jszSwYiEPNKOq3tBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_11,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=669 impostorscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050150
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

VGhlIGZvbGxvd2luZyBpbnN0cnVjdGlvbnMgYXJlIG92ZXJyaWRlbgogICAgUzJfY3QwICAgICAg
ICAgICAgQ291bnQgdHJhaWxpbmcgemVyb3MKICAgIFMyX2N0MSAgICAgICAgICAgIENvdW50IHRy
YWlsaW5nIG9uZXMKICAgIFMyX2N0MHAgICAgICAgICAgIENvdW50IHRyYWlsaW5nIHplcm9zIChy
ZWdpc3RlciBwYWlyKQogICAgUzJfY3QxcCAgICAgICAgICAgQ291bnQgdHJhaWxpbmcgb25lcyAo
cmVnaXN0ZXIgcGFpcikKClRoZXNlIGluc3RydWN0aW9ucyBhcmUgbm90IGhhbmRsZWQgYnkgaWRl
Zi1wYXJzZXIgYmVjYXVzZSB0aGUKaW1wb3J0ZWQgc2VtYW50aWNzIHVzZXMgYml0LXJldmVyc2Uu
ICBIb3dldmVyLCB0aGV5IGFyZQpzdHJhaWdodGZvcndhcmQgdG8gaW1wbGVtZW50IGluIFRDRyB3
aXRoIHRjZ19nZW5fY3R6aV8qCgpUZXN0IGNhc2VzIGFkZGVkIHRvIHRlc3RzL3RjZy9oZXhhZ29u
L21pc2MuYwoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8IDI0ICsrKysrKysrKysrKysrKysr
CiB0ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggYi90YXJnZXQv
aGV4YWdvbi9nZW5fdGNnLmgKaW5kZXggYmNmMGNmNDY2YS4uNDVmOTJhZGY2YyAxMDA2NDQKLS0t
IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cu
aApAQCAtMTA1OCw2ICsxMDU4LDMwIEBACiAjZGVmaW5lIGZHRU5fVENHX1NMMl9qdW1wcjMxX2Zu
ZXcoU0hPUlRDT0RFKSBcCiAgICAgZ2VuX2NvbmRfanVtcHIzMShjdHgsIFRDR19DT05EX05FLCBo
ZXhfbmV3X3ByZWRfdmFsdWVbMF0pCiAKKy8qIENvdW50IHRyYWlsaW5nIHplcm9zL29uZXMgKi8K
KyNkZWZpbmUgZkdFTl9UQ0dfUzJfY3QwKFNIT1JUQ09ERSkgXAorICAgIGRvIHsgXAorICAgICAg
ICB0Y2dfZ2VuX2N0emlfdGwoUmRWLCBSc1YsIDMyKTsgXAorICAgIH0gd2hpbGUgKDApCisjZGVm
aW5lIGZHRU5fVENHX1MyX2N0MShTSE9SVENPREUpIFwKKyAgICBkbyB7IFwKKyAgICAgICAgdGNn
X2dlbl9ub3RfdGwoUmRWLCBSc1YpOyBcCisgICAgICAgIHRjZ19nZW5fY3R6aV90bChSZFYsIFJk
ViwgMzIpOyBcCisgICAgfSB3aGlsZSAoMCkKKyNkZWZpbmUgZkdFTl9UQ0dfUzJfY3QwcChTSE9S
VENPREUpIFwKKyAgICBkbyB7IFwKKyAgICAgICAgVENHdl9pNjQgdG1wID0gdGNnX3RlbXBfbmV3
X2k2NCgpOyBcCisgICAgICAgIHRjZ19nZW5fY3R6aV9pNjQodG1wLCBSc3NWLCA2NCk7IFwKKyAg
ICAgICAgdGNnX2dlbl9leHRybF9pNjRfaTMyKFJkViwgdG1wKTsgXAorICAgIH0gd2hpbGUgKDAp
CisjZGVmaW5lIGZHRU5fVENHX1MyX2N0MXAoU0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisgICAg
ICAgIFRDR3ZfaTY0IHRtcCA9IHRjZ190ZW1wX25ld19pNjQoKTsgXAorICAgICAgICB0Y2dfZ2Vu
X25vdF9pNjQodG1wLCBSc3NWKTsgXAorICAgICAgICB0Y2dfZ2VuX2N0emlfaTY0KHRtcCwgdG1w
LCA2NCk7IFwKKyAgICAgICAgdGNnX2dlbl9leHRybF9pNjRfaTMyKFJkViwgdG1wKTsgXAorICAg
IH0gd2hpbGUgKDApCisKIC8qIEZsb2F0aW5nIHBvaW50ICovCiAjZGVmaW5lIGZHRU5fVENHX0Yy
X2NvbnZfc2YyZGYoU0hPUlRDT0RFKSBcCiAgICAgZ2VuX2hlbHBlcl9jb252X3NmMmRmKFJkZFYs
IGNwdV9lbnYsIFJzVikKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhhZ29uL21pc2MuYyBiL3Rl
c3RzL3RjZy9oZXhhZ29uL21pc2MuYwppbmRleCBlNzNhYjU3MzM0Li5lMTI2NzUxZTNhIDEwMDY0
NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMKKysrIGIvdGVzdHMvdGNnL2hleGFnb24v
bWlzYy5jCkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIxIFF1
YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKiAg
Q29weXJpZ2h0KGMpIDIwMTktMjAyMyBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBB
bGwgUmlnaHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2Fy
ZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICogIGl0IHVuZGVyIHRo
ZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5
CkBAIC0yMSw2ICsyMSw3IEBACiB0eXBlZGVmIHVuc2lnbmVkIGNoYXIgdWludDhfdDsKIHR5cGVk
ZWYgdW5zaWduZWQgc2hvcnQgdWludDE2X3Q7CiB0eXBlZGVmIHVuc2lnbmVkIGludCB1aW50MzJf
dDsKK3R5cGVkZWYgdW5zaWduZWQgbG9uZyBsb25nIHVpbnQ2NF90OwogCiAKIHN0YXRpYyBpbmxp
bmUgdm9pZCBTNF9zdG9yZXJobmV3X3JyKHZvaWQgKnAsIGludCBpbmRleCwgdWludDE2X3QgdikK
QEAgLTMzMyw2ICszMzQsNTcgQEAgdm9pZCB0ZXN0X2wyZmV0Y2godm9pZCkKICAgICAgICAgICAg
ICAgICAgICJsMmZldGNoKHIwLCByMzoyKVxuXHQiKTsKIH0KIAorc3RhdGljIGlubGluZSBpbnQg
Y3QwKHVpbnQzMl90IHgpCit7CisgICAgaW50IHJlczsKKyAgICBhc20oIiUwID0gY3QwKCUxKVxu
XHQiIDogIj1yIihyZXMpIDogInIiKHgpKTsKKyAgICByZXR1cm4gcmVzOworfQorCitzdGF0aWMg
aW5saW5lIGludCBjdDEodWludDMyX3QgeCkKK3sKKyAgICBpbnQgcmVzOworICAgIGFzbSgiJTAg
PSBjdDEoJTEpXG5cdCIgOiAiPXIiKHJlcykgOiAiciIoeCkpOworICAgIHJldHVybiByZXM7Cit9
CisKK3N0YXRpYyBpbmxpbmUgaW50IGN0MHAodWludDY0X3QgeCkKK3sKKyAgICBpbnQgcmVzOwor
ICAgIGFzbSgiJTAgPSBjdDAoJTEpXG5cdCIgOiAiPXIiKHJlcykgOiAiciIoeCkpOworICAgIHJl
dHVybiByZXM7Cit9CisKK3N0YXRpYyBpbmxpbmUgaW50IGN0MXAodWludDY0X3QgeCkKK3sKKyAg
ICBpbnQgcmVzOworICAgIGFzbSgiJTAgPSBjdDEoJTEpXG5cdCIgOiAiPXIiKHJlcykgOiAiciIo
eCkpOworICAgIHJldHVybiByZXM7Cit9CisKK3ZvaWQgdGVzdF9jb3VudF90cmFpbGluZ196ZXJv
c19vbmVzKHZvaWQpCit7CisgICAgY2hlY2soY3QwKDB4MDAwMDAwMGYpLCAwKTsKKyAgICBjaGVj
ayhjdDAoMHgwMDAwMDAwMCksIDMyKTsKKyAgICBjaGVjayhjdDAoMHgwMDAwMDBmMCksIDQpOwor
CisgICAgY2hlY2soY3QxKDB4MDAwMDAwZjApLCAwKTsKKyAgICBjaGVjayhjdDEoMHgwMDAwMDAw
ZiksIDQpOworICAgIGNoZWNrKGN0MSgweDAwMDAwMDAwKSwgMCk7CisgICAgY2hlY2soY3QxKDB4
ZmZmZmZmZmYpLCAzMik7CisKKyAgICBjaGVjayhjdDBwKDB4MDAwMDAwMDAwMDAwMDAwZlVMTCks
IDApOworICAgIGNoZWNrKGN0MHAoMHgwMDAwMDAwMDAwMDAwMDAwVUxMKSwgNjQpOworICAgIGNo
ZWNrKGN0MHAoMHgwMDAwMDAwMDAwMDAwMGYwVUxMKSwgNCk7CisKKyAgICBjaGVjayhjdDFwKDB4
MDAwMDAwMDAwMDAwMDBmMFVMTCksIDApOworICAgIGNoZWNrKGN0MXAoMHgwMDAwMDAwMDAwMDAw
MDBmVUxMKSwgNCk7CisgICAgY2hlY2soY3QxcCgweDAwMDAwMDAwMDAwMDAwMDBVTEwpLCAwKTsK
KyAgICBjaGVjayhjdDFwKDB4ZmZmZmZmZmZmZmZmZmZmZlVMTCksIDY0KTsKKyAgICBjaGVjayhj
dDFwKDB4ZmZmZmZmZmZmZjBmZmZmZlVMTCksIDIwKTsKKyAgICBjaGVjayhjdDFwKDB4ZmZmZmZm
MGZmZmZmZmZmZlVMTCksIDM2KTsKK30KKwogaW50IG1haW4oKQogewogICAgIGludCByZXM7CkBA
IC00NjgsNiArNTIwLDggQEAgaW50IG1haW4oKQogCiAgICAgdGVzdF9sMmZldGNoKCk7CiAKKyAg
ICB0ZXN0X2NvdW50X3RyYWlsaW5nX3plcm9zX29uZXMoKTsKKwogICAgIHB1dHMoZXJyID8gIkZB
SUwiIDogIlBBU1MiKTsKICAgICByZXR1cm4gZXJyOwogfQotLSAKMi4yNS4xCgo=

