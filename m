Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D42667A8F1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 03:44:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKVkN-0006oZ-Qy; Tue, 24 Jan 2023 21:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pKVkD-0006kv-5P
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:42:37 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pKVk8-00079O-HE
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:42:36 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30P2gIIG028669; Wed, 25 Jan 2023 02:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LSCjToYKV9kAGohzeM0Zf0JShXAyvmuzd0NOc+E2lCY=;
 b=VvjH5AH/VgvMVIDsK4y/WaK7GHFI7wVV3NDQvfhrzc//M7XgZYBbrpFwGILVj9tUg95o
 U4DFAa+aluBHS1vjyi/YzOFHyl6grScQv1D7NrGoTMVjWQycFgEYUwhnQDrsvXE41/5s
 RVa8IP/aFOE666R/WPxQ58J7dqI+R1nUQmQ0EdacDrQ0j2e7VlXlkyB179gP2rpVG7X+
 +Owy6cUAefvCl9QdDnmygyEeiY7LL8sWA9obAYreUjrDgwitHvTGxAFEWByz2vTAtD6V
 XcFjdPeEDm0o3r4PgrEXIN/kDvBFmQM7Z16zHaXWeHQo3TAH30Yhi+ASwAG94iQWv9nj mg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nanb68jt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 02:42:18 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30P2gHZg017539; 
 Wed, 25 Jan 2023 02:42:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 3n894kg76h-1;
 Wed, 25 Jan 2023 02:42:17 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30P2dPJ3014722;
 Wed, 25 Jan 2023 02:42:17 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 30P2gGjI017528;
 Wed, 25 Jan 2023 02:42:17 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 749ED5000A8; Tue, 24 Jan 2023 18:42:16 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v4 01/13] Hexagon (target/hexagon) Add overrides for jumpr31
 instructions
Date: Tue, 24 Jan 2023 18:42:03 -0800
Message-Id: <20230125024215.10430-2-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125024215.10430-1-tsimpson@quicinc.com>
References: <20230125024215.10430-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: CBDfNdAqMXGhnx_sVzhz5cGZoe2ruWof
X-Proofpoint-GUID: CBDfNdAqMXGhnx_sVzhz5cGZoe2ruWof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_17,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=624 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250020
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

