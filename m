Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3F6F0EA6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:01:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAb9-0001j8-10; Thu, 27 Apr 2023 19:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb6-0001hg-Bc
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb3-0001KT-Nb
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:20 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RMwB8j020120; Thu, 27 Apr 2023 23:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=I/M2wAUPWNC4VqfCdmtDO3h3EQeUQR3mVgqjORqOSdo=;
 b=KwfDRsrUd9SVO5AJtTJtLw64WthPjwdcMynL1HdXDH/Q9V0JCp8RXusIh/eeOGB3AuBD
 7sidGjM0nd4UdK50keYcEpeX0/xIKE8OVp77mtLXwRvYu7s3fosYQhj4poSbGXIh0+6G
 a6ZnVKwfy8HaP1/5WZ80tXSkbJeOEO9kVyGwIgVohdGMKoIi+Fn+DipUefx01q9qLUgn
 dVrjjRJyvLJzB6QFvFvPdpjlSgHbaZboU1rqSBf7sv6Wg4Ll1sWNa/IxUu+3P9IrkTSp
 ZB26US6vTHJllq53VpulxjyTGDZ02njfMx19/yEi2YClyrLXqGw1XFhtQPhMebXPj2X3 PQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7yg4g9bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RN0ErR000879; 
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3q80d2rg1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0E5V000867;
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 33RN0Dtp000859
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id BA8EF68F; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 03/21] Hexagon (target/hexagon) Add overrides for loop
 setup instructions
Date: Thu, 27 Apr 2023 15:59:54 -0700
Message-Id: <20230427230012.3800327-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427230012.3800327-1-tsimpson@quicinc.com>
References: <20230427230012.3800327-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FnXYazUCG-ZFgSZsMnctJqZjr8HMTlvU
X-Proofpoint-ORIG-GUID: FnXYazUCG-ZFgSZsMnctJqZjr8HMTlvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 mlxlogscore=424 priorityscore=1501 mlxscore=0
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

VGhlc2UgaW5zdHJ1Y3Rpb25zIGhhdmUgaW1wbGljaXQgd3JpdGVzIHRvIHJlZ2lzdGVycywgc28g
d2UgZG9uJ3QKd2FudCB0aGVtIHRvIGJlIGhlbHBlcnMgd2hlbiBpZGVmLXBhcnNlciBpcyBvZmYu
CgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+CkFj
a2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4K
LS0tCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggfCAyMSArKysrKysrKysrKysrKysrKysrCiB0
YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgK
aW5kZXggMDYwYzExZjZjMC4uNTc3NGFmNGE1OSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24v
Z2VuX3RjZy5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaApAQCAtNjYzLDYgKzY2Mywy
NyBAQAogI2RlZmluZSBmR0VOX1RDR19KMl9jYWxscmYoU0hPUlRDT0RFKSBcCiAgICAgZ2VuX2Nv
bmRfY2FsbHIoY3R4LCBUQ0dfQ09ORF9ORSwgUHVWLCBSc1YpCiAKKyNkZWZpbmUgZkdFTl9UQ0df
SjJfbG9vcDByKFNIT1JUQ09ERSkgXAorICAgIGdlbl9sb29wMHIoY3R4LCBSc1YsIHJpVikKKyNk
ZWZpbmUgZkdFTl9UQ0dfSjJfbG9vcDFyKFNIT1JUQ09ERSkgXAorICAgIGdlbl9sb29wMXIoY3R4
LCBSc1YsIHJpVikKKyNkZWZpbmUgZkdFTl9UQ0dfSjJfbG9vcDBpKFNIT1JUQ09ERSkgXAorICAg
IGdlbl9sb29wMGkoY3R4LCBVaVYsIHJpVikKKyNkZWZpbmUgZkdFTl9UQ0dfSjJfbG9vcDFpKFNI
T1JUQ09ERSkgXAorICAgIGdlbl9sb29wMWkoY3R4LCBVaVYsIHJpVikKKyNkZWZpbmUgZkdFTl9U
Q0dfSjJfcGxvb3Axc3IoU0hPUlRDT0RFKSBcCisgICAgZ2VuX3Bsb29wTnNyKGN0eCwgMSwgUnNW
LCByaVYpCisjZGVmaW5lIGZHRU5fVENHX0oyX3Bsb29wMXNpKFNIT1JUQ09ERSkgXAorICAgIGdl
bl9wbG9vcE5zaShjdHgsIDEsIFVpViwgcmlWKQorI2RlZmluZSBmR0VOX1RDR19KMl9wbG9vcDJz
cihTSE9SVENPREUpIFwKKyAgICBnZW5fcGxvb3BOc3IoY3R4LCAyLCBSc1YsIHJpVikKKyNkZWZp
bmUgZkdFTl9UQ0dfSjJfcGxvb3Ayc2koU0hPUlRDT0RFKSBcCisgICAgZ2VuX3Bsb29wTnNpKGN0
eCwgMiwgVWlWLCByaVYpCisjZGVmaW5lIGZHRU5fVENHX0oyX3Bsb29wM3NyKFNIT1JUQ09ERSkg
XAorICAgIGdlbl9wbG9vcE5zcihjdHgsIDMsIFJzViwgcmlWKQorI2RlZmluZSBmR0VOX1RDR19K
Ml9wbG9vcDNzaShTSE9SVENPREUpIFwKKyAgICBnZW5fcGxvb3BOc2koY3R4LCAzLCBVaVYsIHJp
VikKKwogI2RlZmluZSBmR0VOX1RDR19KMl9lbmRsb29wMChTSE9SVENPREUpIFwKICAgICBnZW5f
ZW5kbG9vcDAoY3R4KQogI2RlZmluZSBmR0VOX1RDR19KMl9lbmRsb29wMShTSE9SVENPREUpIFwK
ZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0L2hleGFnb24vZ2Vu
cHRyLmMKaW5kZXggMTJjNzJjYmFjOS4uNGMzNGRhODQwNyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hl
eGFnb24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKQEAgLTUxOCw2ICs1
MTgsNTAgQEAgc3RhdGljIHZvaWQgZ2VuX2NvbXBhcmUoVENHQ29uZCBjb25kLCBUQ0d2IHJlcywg
VENHdiBhcmcxLCBUQ0d2IGFyZzIpCiAgICAgdGNnX2dlbl9tb3Zjb25kX3RsKGNvbmQsIHJlcywg
YXJnMSwgYXJnMiwgb25lLCB6ZXJvKTsKIH0KIAorI2lmbmRlZiBDT05GSUdfSEVYQUdPTl9JREVG
X1BBUlNFUgorc3RhdGljIGlubGluZSB2b2lkIGdlbl9sb29wMHIoRGlzYXNDb250ZXh0ICpjdHgs
IFRDR3YgUnNWLCBpbnQgcmlWKQoreworICAgIGZJTU1FWFQocmlWKTsKKyAgICBmUENBTElHTihy
aVYpOworICAgIGdlbl9sb2dfcmVnX3dyaXRlKGN0eCwgSEVYX1JFR19MQzAsIFJzVik7CisgICAg
Z2VuX2xvZ19yZWdfd3JpdGUoY3R4LCBIRVhfUkVHX1NBMCwgdGNnX2NvbnN0YW50X3RsKGN0eC0+
cGt0LT5wYyArIHJpVikpOworICAgIGdlbl9zZXRfdXNyX2ZpZWxkaShjdHgsIFVTUl9MUENGRywg
MCk7Cit9CisKK3N0YXRpYyB2b2lkIGdlbl9sb29wMGkoRGlzYXNDb250ZXh0ICpjdHgsIGludCBj
b3VudCwgaW50IHJpVikKK3sKKyAgICBnZW5fbG9vcDByKGN0eCwgdGNnX2NvbnN0YW50X3RsKGNv
dW50KSwgcmlWKTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIGdlbl9sb29wMXIoRGlzYXNDb250
ZXh0ICpjdHgsIFRDR3YgUnNWLCBpbnQgcmlWKQoreworICAgIGZJTU1FWFQocmlWKTsKKyAgICBm
UENBTElHTihyaVYpOworICAgIGdlbl9sb2dfcmVnX3dyaXRlKGN0eCwgSEVYX1JFR19MQzEsIFJz
Vik7CisgICAgZ2VuX2xvZ19yZWdfd3JpdGUoY3R4LCBIRVhfUkVHX1NBMSwgdGNnX2NvbnN0YW50
X3RsKGN0eC0+cGt0LT5wYyArIHJpVikpOworfQorCitzdGF0aWMgdm9pZCBnZW5fbG9vcDFpKERp
c2FzQ29udGV4dCAqY3R4LCBpbnQgY291bnQsIGludCByaVYpCit7CisgICAgZ2VuX2xvb3Axcihj
dHgsIHRjZ19jb25zdGFudF90bChjb3VudCksIHJpVik7Cit9CisKK3N0YXRpYyB2b2lkIGdlbl9w
bG9vcE5zcihEaXNhc0NvbnRleHQgKmN0eCwgaW50IE4sIFRDR3YgUnNWLCBpbnQgcmlWKQorewor
ICAgIGZJTU1FWFQocmlWKTsKKyAgICBmUENBTElHTihyaVYpOworICAgIGdlbl9sb2dfcmVnX3dy
aXRlKGN0eCwgSEVYX1JFR19MQzAsIFJzVik7CisgICAgZ2VuX2xvZ19yZWdfd3JpdGUoY3R4LCBI
RVhfUkVHX1NBMCwgdGNnX2NvbnN0YW50X3RsKGN0eC0+cGt0LT5wYyArIHJpVikpOworICAgIGdl
bl9zZXRfdXNyX2ZpZWxkaShjdHgsIFVTUl9MUENGRywgTik7CisgICAgZ2VuX2xvZ19wcmVkX3dy
aXRlKGN0eCwgMywgdGNnX2NvbnN0YW50X3RsKDApKTsKK30KKworc3RhdGljIHZvaWQgZ2VuX3Bs
b29wTnNpKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgTiwgaW50IGNvdW50LCBpbnQgcmlWKQorewor
ICAgIGdlbl9wbG9vcE5zcihjdHgsIE4sIHRjZ19jb25zdGFudF90bChjb3VudCksIHJpVik7Cit9
CisjZW5kaWYKKwogc3RhdGljIHZvaWQgZ2VuX2NvbmRfanVtcHIoRGlzYXNDb250ZXh0ICpjdHgs
IFRDR3YgZHN0X3BjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgVENHQ29uZCBjb25kLCBU
Q0d2IHByZWQpCiB7Ci0tIAoyLjI1LjEKCg==

