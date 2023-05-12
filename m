Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D36701197
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 23:52:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxac1-0002dk-NT; Fri, 12 May 2023 17:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxabq-0002cf-Pl
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxabn-00065f-UX
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:29 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CKAfJU002665; Fri, 12 May 2023 21:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pNmeTYwu8VkEzKudAtiBQKu/VLqGASHKHOlREcFF1ug=;
 b=Bvo4crCg1RXCGXVo8qoOQKre/Cwaw67bGjFehvtedsMwJpDlaSaBsA5Ykx2Aqa2nVBSm
 /EKJEE+YrtvziSEk80/bfVP7X9Im/mxbF7nkD7Ne+U7dS0wFXzgpxvMjctMp3ZlJWhNa
 ZiFf7OtgngPLMFDqTJvsWIbLETOIZLQ9F285dIzxQIOuXWFbv6yimA4APu0de8QPv7lr
 ScVvpZtKEbOlZcxLXNRMOKemD+8y81Tzk3fJA8qatRtgdDhFOpG6zLvrvgljQQOrRfHy
 Wgv7P1APtvac2OoeEHGNB29kvtUKnLEUBJu50RW0cEu6JViDTxYvhTdzR4/cbXPF6Gv4 cQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qh24h3qjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:25 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34CLlMO0011621; 
 Fri, 12 May 2023 21:47:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3qhurt0jn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:23 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CLj8GQ009758;
 Fri, 12 May 2023 21:47:23 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 34CLlMM3011622
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:23 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id F064A6AF; Fri, 12 May 2023 14:47:21 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 12/44] Hexagon (target/hexagon) Add overrides for loop setup
 instructions
Date: Fri, 12 May 2023 14:46:34 -0700
Message-Id: <20230512214706.946068-13-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512214706.946068-1-tsimpson@quicinc.com>
References: <20230512214706.946068-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UMmDWPtLRiCasvaTBsqpQGH4S1z5Fl-m
X-Proofpoint-ORIG-GUID: UMmDWPtLRiCasvaTBsqpQGH4S1z5Fl-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=378 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120183
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

VGhlc2UgaW5zdHJ1Y3Rpb25zIGhhdmUgaW1wbGljaXQgd3JpdGVzIHRvIHJlZ2lzdGVycywgc28g
d2UgZG9uJ3QKd2FudCB0aGVtIHRvIGJlIGhlbHBlcnMgd2hlbiBpZGVmLXBhcnNlciBpcyBvZmYu
CgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+CkFj
a2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4K
TWVzc2FnZS1JZDogPDIwMjMwNDI3MjMwMDEyLjM4MDAzMjctNC10c2ltcHNvbkBxdWljaW5jLmNv
bT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggfCAyMSArKysrKysrKysrKysrKysrKysr
CiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNn
LmgKaW5kZXggZDRiZDM4ODEwZS4uOGQ1ZTk4MjZhMCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZy5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaApAQCAtNjY1LDYgKzY2
NSwyNyBAQAogI2RlZmluZSBmR0VOX1RDR19KMl9jYWxscmYoU0hPUlRDT0RFKSBcCiAgICAgZ2Vu
X2NvbmRfY2FsbHIoY3R4LCBUQ0dfQ09ORF9ORSwgUHVWLCBSc1YpCiAKKyNkZWZpbmUgZkdFTl9U
Q0dfSjJfbG9vcDByKFNIT1JUQ09ERSkgXAorICAgIGdlbl9sb29wMHIoY3R4LCBSc1YsIHJpVikK
KyNkZWZpbmUgZkdFTl9UQ0dfSjJfbG9vcDFyKFNIT1JUQ09ERSkgXAorICAgIGdlbl9sb29wMXIo
Y3R4LCBSc1YsIHJpVikKKyNkZWZpbmUgZkdFTl9UQ0dfSjJfbG9vcDBpKFNIT1JUQ09ERSkgXAor
ICAgIGdlbl9sb29wMGkoY3R4LCBVaVYsIHJpVikKKyNkZWZpbmUgZkdFTl9UQ0dfSjJfbG9vcDFp
KFNIT1JUQ09ERSkgXAorICAgIGdlbl9sb29wMWkoY3R4LCBVaVYsIHJpVikKKyNkZWZpbmUgZkdF
Tl9UQ0dfSjJfcGxvb3Axc3IoU0hPUlRDT0RFKSBcCisgICAgZ2VuX3Bsb29wTnNyKGN0eCwgMSwg
UnNWLCByaVYpCisjZGVmaW5lIGZHRU5fVENHX0oyX3Bsb29wMXNpKFNIT1JUQ09ERSkgXAorICAg
IGdlbl9wbG9vcE5zaShjdHgsIDEsIFVpViwgcmlWKQorI2RlZmluZSBmR0VOX1RDR19KMl9wbG9v
cDJzcihTSE9SVENPREUpIFwKKyAgICBnZW5fcGxvb3BOc3IoY3R4LCAyLCBSc1YsIHJpVikKKyNk
ZWZpbmUgZkdFTl9UQ0dfSjJfcGxvb3Ayc2koU0hPUlRDT0RFKSBcCisgICAgZ2VuX3Bsb29wTnNp
KGN0eCwgMiwgVWlWLCByaVYpCisjZGVmaW5lIGZHRU5fVENHX0oyX3Bsb29wM3NyKFNIT1JUQ09E
RSkgXAorICAgIGdlbl9wbG9vcE5zcihjdHgsIDMsIFJzViwgcmlWKQorI2RlZmluZSBmR0VOX1RD
R19KMl9wbG9vcDNzaShTSE9SVENPREUpIFwKKyAgICBnZW5fcGxvb3BOc2koY3R4LCAzLCBVaVYs
IHJpVikKKwogI2RlZmluZSBmR0VOX1RDR19KMl9lbmRsb29wMChTSE9SVENPREUpIFwKICAgICBn
ZW5fZW5kbG9vcDAoY3R4KQogI2RlZmluZSBmR0VOX1RDR19KMl9lbmRsb29wMShTSE9SVENPREUp
IFwKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0L2hleGFnb24v
Z2VucHRyLmMKaW5kZXggZGQ3MDdhOWRjNy4uNmU1NzY3ZWM1ZSAxMDA2NDQKLS0tIGEvdGFyZ2V0
L2hleGFnb24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKQEAgLTUxOCw2
ICs1MTgsNTAgQEAgc3RhdGljIHZvaWQgZ2VuX2NvbXBhcmUoVENHQ29uZCBjb25kLCBUQ0d2IHJl
cywgVENHdiBhcmcxLCBUQ0d2IGFyZzIpCiAgICAgdGNnX2dlbl9tb3Zjb25kX3RsKGNvbmQsIHJl
cywgYXJnMSwgYXJnMiwgb25lLCB6ZXJvKTsKIH0KIAorI2lmbmRlZiBDT05GSUdfSEVYQUdPTl9J
REVGX1BBUlNFUgorc3RhdGljIGlubGluZSB2b2lkIGdlbl9sb29wMHIoRGlzYXNDb250ZXh0ICpj
dHgsIFRDR3YgUnNWLCBpbnQgcmlWKQoreworICAgIGZJTU1FWFQocmlWKTsKKyAgICBmUENBTElH
TihyaVYpOworICAgIGdlbl9sb2dfcmVnX3dyaXRlKGN0eCwgSEVYX1JFR19MQzAsIFJzVik7Cisg
ICAgZ2VuX2xvZ19yZWdfd3JpdGUoY3R4LCBIRVhfUkVHX1NBMCwgdGNnX2NvbnN0YW50X3RsKGN0
eC0+cGt0LT5wYyArIHJpVikpOworICAgIGdlbl9zZXRfdXNyX2ZpZWxkaShjdHgsIFVTUl9MUENG
RywgMCk7Cit9CisKK3N0YXRpYyB2b2lkIGdlbl9sb29wMGkoRGlzYXNDb250ZXh0ICpjdHgsIGlu
dCBjb3VudCwgaW50IHJpVikKK3sKKyAgICBnZW5fbG9vcDByKGN0eCwgdGNnX2NvbnN0YW50X3Rs
KGNvdW50KSwgcmlWKTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIGdlbl9sb29wMXIoRGlzYXND
b250ZXh0ICpjdHgsIFRDR3YgUnNWLCBpbnQgcmlWKQoreworICAgIGZJTU1FWFQocmlWKTsKKyAg
ICBmUENBTElHTihyaVYpOworICAgIGdlbl9sb2dfcmVnX3dyaXRlKGN0eCwgSEVYX1JFR19MQzEs
IFJzVik7CisgICAgZ2VuX2xvZ19yZWdfd3JpdGUoY3R4LCBIRVhfUkVHX1NBMSwgdGNnX2NvbnN0
YW50X3RsKGN0eC0+cGt0LT5wYyArIHJpVikpOworfQorCitzdGF0aWMgdm9pZCBnZW5fbG9vcDFp
KERpc2FzQ29udGV4dCAqY3R4LCBpbnQgY291bnQsIGludCByaVYpCit7CisgICAgZ2VuX2xvb3Ax
cihjdHgsIHRjZ19jb25zdGFudF90bChjb3VudCksIHJpVik7Cit9CisKK3N0YXRpYyB2b2lkIGdl
bl9wbG9vcE5zcihEaXNhc0NvbnRleHQgKmN0eCwgaW50IE4sIFRDR3YgUnNWLCBpbnQgcmlWKQor
eworICAgIGZJTU1FWFQocmlWKTsKKyAgICBmUENBTElHTihyaVYpOworICAgIGdlbl9sb2dfcmVn
X3dyaXRlKGN0eCwgSEVYX1JFR19MQzAsIFJzVik7CisgICAgZ2VuX2xvZ19yZWdfd3JpdGUoY3R4
LCBIRVhfUkVHX1NBMCwgdGNnX2NvbnN0YW50X3RsKGN0eC0+cGt0LT5wYyArIHJpVikpOworICAg
IGdlbl9zZXRfdXNyX2ZpZWxkaShjdHgsIFVTUl9MUENGRywgTik7CisgICAgZ2VuX2xvZ19wcmVk
X3dyaXRlKGN0eCwgMywgdGNnX2NvbnN0YW50X3RsKDApKTsKK30KKworc3RhdGljIHZvaWQgZ2Vu
X3Bsb29wTnNpKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgTiwgaW50IGNvdW50LCBpbnQgcmlWKQor
eworICAgIGdlbl9wbG9vcE5zcihjdHgsIE4sIHRjZ19jb25zdGFudF90bChjb3VudCksIHJpVik7
Cit9CisjZW5kaWYKKwogc3RhdGljIHZvaWQgZ2VuX2NvbmRfanVtcHIoRGlzYXNDb250ZXh0ICpj
dHgsIFRDR3YgZHN0X3BjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgVENHQ29uZCBjb25k
LCBUQ0d2IHByZWQpCiB7Ci0tIAoyLjI1LjEKCg==

