Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942FD6839D9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 23:59:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMzYv-0000mz-6N; Tue, 31 Jan 2023 17:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYk-0000fP-KU
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:02 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYg-0003tY-O6
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:02 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VMtvsc008103; Tue, 31 Jan 2023 22:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LSCjToYKV9kAGohzeM0Zf0JShXAyvmuzd0NOc+E2lCY=;
 b=VU1nDRl/n8ziElGh+GABj2a2PThHlPYjIlj+3T9xVX7zutCTHlWVYNpu8NEBW14fKg9F
 OI0bCO5EFnhn5JKu0xWJYsphDqT7UuI/diczhjGaB/xeQH5Vd1rBqN/SPbcEM57fujqD
 zo+aeStcmxKqVM2Yc1h710yrlfWdb+wDuh+xVyEAU5IZ6lROv/DUpwe2z8rFbqsahQuf
 nGhPGlMGxaDfdHV7no2D+4rd3ONNiDfIG9Nc2eOYKa7hUSt9ujRPEiICJUMm5r9I9tX2
 UHpXgWva/I5zYisspzV4DEP7eFy999FApc6Vhln0bOFP5OB1TptlhPQH8dPLoSUhq4do lQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3netc4amju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 22:56:55 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30VMrBlN030267; 
 Tue, 31 Jan 2023 22:56:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ncvsmas81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 31 Jan 2023 22:56:54 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30VMurQv001889;
 Tue, 31 Jan 2023 22:56:53 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTP id 30VMurN0001619;
 Tue, 31 Jan 2023 22:56:53 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id EB7885000A8; Tue, 31 Jan 2023 14:56:52 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v5 01/14] Hexagon (target/hexagon) Add overrides for jumpr31
 instructions
Date: Tue, 31 Jan 2023 14:56:34 -0800
Message-Id: <20230131225647.25274-2-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: J1-KbiFQEDl0wFFGjVTu63IhadFekLLH
X-Proofpoint-ORIG-GUID: J1-KbiFQEDl0wFFGjVTu63IhadFekLLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 impostorscore=0 phishscore=0 mlxlogscore=604 mlxscore=0 spamscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

QWRkIG92ZXJyaWRlcyBmb3IKICAgIFNMMl9qdW1wcjMxICAgICAgICAgICAgVW5jb25kaXRpb25h
bAogICAgU0wyX2p1bXByMzFfdCAgICAgICAgICBQcmVkaWNhdGVkIHRydWUgKG9sZCB2YWx1ZSkK
ICAgIFNMMl9qdW1wcjMxX2YgICAgICAgICAgUHJlZGljYXRlZCBmYWxzZSAob2xkIHZhbHVlKQog
ICAgU0wyX2p1bXByMzFfdG5ldyAgICAgICBQcmVkaWNhdGVkIHRydWUgKG5ldyB2YWx1ZSkKICAg
IFNMMl9qdW1wcjMxX2ZuZXcgICAgICAgUHJlZGljYXRlZCBmYWxzZSAobmV3IHZhbHVlKQoKU2ln
bmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRh
cmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8IDE1ICsrKysrKysrKysrKysrLQogdGFyZ2V0L2hleGFn
b24vZ2VucHRyLmMgIHwgMTAgKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90
Y2cuaCBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaAppbmRleCAxOTY5N2I0MmE1Li5kNjQ0ZTU5
YTYzIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hl
eGFnb24vZ2VuX3RjZy5oCkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5cmlnaHQoYykgMjAx
OS0yMDIyIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2
ZWQuCisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMyBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRl
ciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHByb2dyYW0gaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICogIGl0
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVi
bGlzaGVkIGJ5CkBAIC0xMDE1LDYgKzEwMTUsMTkgQEAKICNkZWZpbmUgZkdFTl9UQ0dfUzJfYXNs
X3Jfcl9zYXQoU0hPUlRDT0RFKSBcCiAgICAgZ2VuX2FzbF9yX3Jfc2F0KFJkViwgUnNWLCBSdFYp
CiAKKyNkZWZpbmUgZkdFTl9UQ0dfU0wyX2p1bXByMzEoU0hPUlRDT0RFKSBcCisgICAgZ2VuX2p1
bXByKGN0eCwgaGV4X2dwcltIRVhfUkVHX0xSXSkKKworI2RlZmluZSBmR0VOX1RDR19TTDJfanVt
cHIzMV90KFNIT1JUQ09ERSkgXAorICAgIGdlbl9jb25kX2p1bXByMzEoY3R4LCBUQ0dfQ09ORF9F
USwgaGV4X3ByZWRbMF0pCisjZGVmaW5lIGZHRU5fVENHX1NMMl9qdW1wcjMxX2YoU0hPUlRDT0RF
KSBcCisgICAgZ2VuX2NvbmRfanVtcHIzMShjdHgsIFRDR19DT05EX05FLCBoZXhfcHJlZFswXSkK
KworI2RlZmluZSBmR0VOX1RDR19TTDJfanVtcHIzMV90bmV3KFNIT1JUQ09ERSkgXAorICAgIGdl
bl9jb25kX2p1bXByMzEoY3R4LCBUQ0dfQ09ORF9FUSwgaGV4X25ld19wcmVkX3ZhbHVlWzBdKQor
I2RlZmluZSBmR0VOX1RDR19TTDJfanVtcHIzMV9mbmV3KFNIT1JUQ09ERSkgXAorICAgIGdlbl9j
b25kX2p1bXByMzEoY3R4LCBUQ0dfQ09ORF9ORSwgaGV4X25ld19wcmVkX3ZhbHVlWzBdKQorCiAv
KiBGbG9hdGluZyBwb2ludCAqLwogI2RlZmluZSBmR0VOX1RDR19GMl9jb252X3NmMmRmKFNIT1JU
Q09ERSkgXAogICAgIGdlbl9oZWxwZXJfY29udl9zZjJkZihSZGRWLCBjcHVfZW52LCBSc1YpCmRp
ZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0
ci5jCmluZGV4IDkwZGI5OTAyNGYuLjIzZmI4MDhlMzcgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhh
Z29uL2dlbnB0ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC0xLDUgKzEsNSBA
QAogLyoKLSAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIyIFF1YWxjb21tIElubm92YXRpb24gQ2Vu
dGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAy
MyBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgog
ICoKICAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yIG1vZGlmeQogICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CkBAIC01OTMsNiArNTkzLDE0IEBA
IHN0YXRpYyB2b2lkIGdlbl9jb25kX2p1bXByKERpc2FzQ29udGV4dCAqY3R4LCBUQ0d2IGRzdF9w
YywKICAgICBnZW5fd3JpdGVfbmV3X3BjX2FkZHIoY3R4LCBkc3RfcGMsIGNvbmQsIHByZWQpOwog
fQogCitzdGF0aWMgdm9pZCBnZW5fY29uZF9qdW1wcjMxKERpc2FzQ29udGV4dCAqY3R4LCBUQ0dD
b25kIGNvbmQsIFRDR3YgcHJlZCkKK3sKKyAgICBUQ0d2IExTQiA9IHRjZ190ZW1wX25ldygpOwor
ICAgIHRjZ19nZW5fYW5kaV90bChMU0IsIHByZWQsIDEpOworICAgIGdlbl9jb25kX2p1bXByKGN0
eCwgaGV4X2dwcltIRVhfUkVHX0xSXSwgY29uZCwgTFNCKTsKKyAgICB0Y2dfdGVtcF9mcmVlKExT
Qik7Cit9CisKIHN0YXRpYyB2b2lkIGdlbl9jb25kX2p1bXAoRGlzYXNDb250ZXh0ICpjdHgsIFRD
R0NvbmQgY29uZCwgVENHdiBwcmVkLAogICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcGNf
b2ZmKQogewotLSAKMi4xNy4xCgo=

