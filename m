Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3EA6AD52C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:59:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNXJ-0000No-46; Mon, 06 Mar 2023 21:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXE-00007p-KE
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXA-0005n7-1u
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:40 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3270TnIV026899; Tue, 7 Mar 2023 02:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0ot7s5wF7j2actbW1XT7+7GpcORB1nCuiFWFlSNs4d4=;
 b=D7vV8J4ANrPiYVtvoWTDVNdMJ+i3OoFU2TEArZ/t8AqxRnO3fa26GldXRmDy2fnUYHTu
 0Y3hiOoaVdPII0faFvs+9QmEiVTO4IByOQcjurfdeUUmdC8VWjM+SXtUHvq2H7DomuG/
 lqRZ55W8tp5jYmwC55gkZkMTY5YLxm+wclNhsEGu5ZT6r1UZh+CXTBWBrps3hI9mqoRr
 gx1Rq7DKvkVA+Zsx365xW3q5lVEbIdDQ1aFuLqt8Pm35wNgaG+cEXXj/h9gtUjYvL4mw
 01WGu2cHPhzL3CTVxBifSd54o9tAnfHeS20Ys5B0TrXEMBHWOuzvurOVCVQaaXZw1vBy xg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p419d6p7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:32 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3272qOTX016175; 
 Tue, 7 Mar 2023 02:58:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3p4ffd3r7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:31 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272s2bg017694;
 Tue, 7 Mar 2023 02:58:31 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3272wUhM022222
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:31 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id C46C668C; Mon,  6 Mar 2023 18:58:30 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v6 03/14] Hexagon (target/hexagon) Add overrides for
 endloop1/endloop01
Date: Mon,  6 Mar 2023 18:58:17 -0800
Message-Id: <20230307025828.1612809-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307025828.1612809-1-tsimpson@quicinc.com>
References: <20230307025828.1612809-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -2JXj7GjGZfJVTog2Pv0tygWtZLGWzMA
X-Proofpoint-GUID: -2JXj7GjGZfJVTog2Pv0tygWtZLGWzMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 mlxlogscore=743 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070025
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

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZp
ZXdlZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KLS0tCiB0YXJnZXQvaGV4YWdv
bi9nZW5fdGNnLmggfCAgNCArKysKIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICB8IDc4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgODIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBiL3Rh
cmdldC9oZXhhZ29uL2dlbl90Y2cuaAppbmRleCBmYTBkYmJlYzdkLi40Zjg0YmFmMDNiIDEwMDY0
NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2Vu
X3RjZy5oCkBAIC02MDMsNiArNjAzLDEwIEBACiAKICNkZWZpbmUgZkdFTl9UQ0dfSjJfZW5kbG9v
cDAoU0hPUlRDT0RFKSBcCiAgICAgZ2VuX2VuZGxvb3AwKGN0eCkKKyNkZWZpbmUgZkdFTl9UQ0df
SjJfZW5kbG9vcDEoU0hPUlRDT0RFKSBcCisgICAgZ2VuX2VuZGxvb3AxKGN0eCkKKyNkZWZpbmUg
ZkdFTl9UQ0dfSjJfZW5kbG9vcDAxKFNIT1JUQ09ERSkgXAorICAgIGdlbl9lbmRsb29wMDEoY3R4
KQogCiAvKgogICogQ29tcG91bmQgY29tcGFyZSBhbmQganVtcCBpbnN0cnVjdGlvbnMKZGlmZiAt
LWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMK
aW5kZXggNTkyNDM4ZjYxZS4uZjcwMTdmZDQ4MyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24v
Z2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKQEAgLTc3MCw2ICs3NzAsODQg
QEAgc3RhdGljIHZvaWQgZ2VuX2VuZGxvb3AwKERpc2FzQ29udGV4dCAqY3R4KQogICAgIH0KIH0K
IAorc3RhdGljIHZvaWQgZ2VuX2VuZGxvb3AxKERpc2FzQ29udGV4dCAqY3R4KQoreworICAgIC8q
CisgICAgICogICAgaWYgKGhleF9ncHJbSEVYX1JFR19MQzFdID4gMSkgeworICAgICAqICAgICAg
ICBQQyA9IGhleF9ncHJbSEVYX1JFR19TQTFdOworICAgICAqICAgICAgICBoZXhfbmV3X3ZhbHVl
W0hFWF9SRUdfTEMxXSA9IGhleF9ncHJbSEVYX1JFR19MQzFdIC0gMTsKKyAgICAgKiAgICB9Cisg
ICAgICovCisgICAgVENHTGFiZWwgKmxhYmVsID0gZ2VuX25ld19sYWJlbCgpOworICAgIHRjZ19n
ZW5fYnJjb25kaV90bChUQ0dfQ09ORF9MRVUsIGhleF9ncHJbSEVYX1JFR19MQzFdLCAxLCBsYWJl
bCk7CisgICAgeworICAgICAgICBnZW5fanVtcHIoY3R4LCBoZXhfZ3ByW0hFWF9SRUdfU0ExXSk7
CisgICAgICAgIHRjZ19nZW5fc3ViaV90bChoZXhfbmV3X3ZhbHVlW0hFWF9SRUdfTEMxXSwgaGV4
X2dwcltIRVhfUkVHX0xDMV0sIDEpOworICAgIH0KKyAgICBnZW5fc2V0X2xhYmVsKGxhYmVsKTsK
K30KKworc3RhdGljIHZvaWQgZ2VuX2VuZGxvb3AwMShEaXNhc0NvbnRleHQgKmN0eCkKK3sKKyAg
ICBUQ0d2IGxwY2ZnID0gdGNnX3RlbXBfbmV3KCk7CisgICAgVENHTGFiZWwgKmxhYmVsMSA9IGdl
bl9uZXdfbGFiZWwoKTsKKyAgICBUQ0dMYWJlbCAqbGFiZWwyID0gZ2VuX25ld19sYWJlbCgpOwor
ICAgIFRDR0xhYmVsICpsYWJlbDMgPSBnZW5fbmV3X2xhYmVsKCk7CisgICAgVENHTGFiZWwgKmRv
bmUgPSBnZW5fbmV3X2xhYmVsKCk7CisKKyAgICBHRVRfVVNSX0ZJRUxEKFVTUl9MUENGRywgbHBj
ZmcpOworCisgICAgLyoKKyAgICAgKiAgICBpZiAobHBjZmcgPT0gMSkgeworICAgICAqICAgICAg
ICBoZXhfbmV3X3ByZWRfdmFsdWVbM10gPSAweGZmOworICAgICAqICAgICAgICBoZXhfcHJlZF93
cml0dGVuIHw9IDEgPDwgMzsKKyAgICAgKiAgICB9CisgICAgICovCisgICAgdGNnX2dlbl9icmNv
bmRpX3RsKFRDR19DT05EX05FLCBscGNmZywgMSwgbGFiZWwxKTsKKyAgICB7CisgICAgICAgIHRj
Z19nZW5fbW92aV90bChoZXhfbmV3X3ByZWRfdmFsdWVbM10sIDB4ZmYpOworICAgICAgICB0Y2df
Z2VuX29yaV90bChoZXhfcHJlZF93cml0dGVuLCBoZXhfcHJlZF93cml0dGVuLCAxIDw8IDMpOwor
ICAgIH0KKyAgICBnZW5fc2V0X2xhYmVsKGxhYmVsMSk7CisKKyAgICAvKgorICAgICAqICAgIGlm
IChscGNmZykgeworICAgICAqICAgICAgICBTRVRfVVNSX0ZJRUxEKFVTUl9MUENGRywgbHBjZmcg
LSAxKTsKKyAgICAgKiAgICB9CisgICAgICovCisgICAgdGNnX2dlbl9icmNvbmRpX3RsKFRDR19D
T05EX0VRLCBscGNmZywgMCwgbGFiZWwyKTsKKyAgICB7CisgICAgICAgIHRjZ19nZW5fc3ViaV90
bChscGNmZywgbHBjZmcsIDEpOworICAgICAgICBTRVRfVVNSX0ZJRUxEKFVTUl9MUENGRywgbHBj
ZmcpOworICAgIH0KKyAgICBnZW5fc2V0X2xhYmVsKGxhYmVsMik7CisKKyAgICAvKgorICAgICAq
ICAgIGlmIChoZXhfZ3ByW0hFWF9SRUdfTEMwXSA+IDEpIHsKKyAgICAgKiAgICAgICAgUEMgPSBo
ZXhfZ3ByW0hFWF9SRUdfU0EwXTsKKyAgICAgKiAgICAgICAgaGV4X25ld192YWx1ZVtIRVhfUkVH
X0xDMF0gPSBoZXhfZ3ByW0hFWF9SRUdfTEMwXSAtIDE7CisgICAgICogICAgfSBlbHNlIHsKKyAg
ICAgKiAgICAgICAgaWYgKGhleF9ncHJbSEVYX1JFR19MQzFdID4gMSkgeworICAgICAqICAgICAg
ICAgICAgaGV4X25leHRfcGMgPSBoZXhfZ3ByW0hFWF9SRUdfU0ExXTsKKyAgICAgKiAgICAgICAg
ICAgIGhleF9uZXdfdmFsdWVbSEVYX1JFR19MQzFdID0gaGV4X2dwcltIRVhfUkVHX0xDMV0gLSAx
OworICAgICAqICAgICAgICB9CisgICAgICogICAgfQorICAgICAqLworICAgIHRjZ19nZW5fYnJj
b25kaV90bChUQ0dfQ09ORF9MRVUsIGhleF9ncHJbSEVYX1JFR19MQzBdLCAxLCBsYWJlbDMpOwor
ICAgIHsKKyAgICAgICAgZ2VuX2p1bXByKGN0eCwgaGV4X2dwcltIRVhfUkVHX1NBMF0pOworICAg
ICAgICB0Y2dfZ2VuX3N1YmlfdGwoaGV4X25ld192YWx1ZVtIRVhfUkVHX0xDMF0sIGhleF9ncHJb
SEVYX1JFR19MQzBdLCAxKTsKKyAgICAgICAgdGNnX2dlbl9icihkb25lKTsKKyAgICB9CisgICAg
Z2VuX3NldF9sYWJlbChsYWJlbDMpOworICAgIHRjZ19nZW5fYnJjb25kaV90bChUQ0dfQ09ORF9M
RVUsIGhleF9ncHJbSEVYX1JFR19MQzFdLCAxLCBkb25lKTsKKyAgICB7CisgICAgICAgIGdlbl9q
dW1wcihjdHgsIGhleF9ncHJbSEVYX1JFR19TQTFdKTsKKyAgICAgICAgdGNnX2dlbl9zdWJpX3Rs
KGhleF9uZXdfdmFsdWVbSEVYX1JFR19MQzFdLCBoZXhfZ3ByW0hFWF9SRUdfTEMxXSwgMSk7Cisg
ICAgfQorICAgIGdlbl9zZXRfbGFiZWwoZG9uZSk7Cit9CisKIHN0YXRpYyB2b2lkIGdlbl9jbXBf
anVtcG52KERpc2FzQ29udGV4dCAqY3R4LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgVENH
Q29uZCBjb25kLCBUQ0d2IHZhbCwgVENHdiBzcmMsIGludCBwY19vZmYpCiB7Ci0tIAoyLjI1LjEK
Cg==

