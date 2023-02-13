Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3E7694F8D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:40:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdke-00070z-85; Mon, 13 Feb 2023 13:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRdkc-00070O-BV; Mon, 13 Feb 2023 13:40:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRdkZ-0007g7-OQ; Mon, 13 Feb 2023 13:40:30 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DHvNjo016541; Mon, 13 Feb 2023 18:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=pwbtxX9g5zsd7q6kMCuoqJZDJcfEk77Oj3V8s08v5dE=;
 b=UDP4+Efox3/8Tbcekb2MmGyfYcuOQowfGZEq6SbyKjFtjkYwTaCKjMVFASwIY7v1PMTH
 MFrVrZ8eNV951X7dbQdq7aihSCXFj11YcAztUwuIG7FjvZsOS669IWiXDqrPlkD/zN6E
 CzKLXYF/+1Re5PaGBNYNjZyYkn3FfdUC4IhFVOKm409vkznH5iqsz8KqjpGVvuOf/v+4
 DO6ROEZ+vNYAnpKpwUwtj3zZMCi9Hf7C8gLocpiaiVknFy1dGHwBVroK5tLNXI8wvD6i
 BLmppTuS05OMZSrs6Gv3gE1DXbZyc47ky5glUBX+ecQaU9rp7DwqzApMbr7cf4ojXDZI 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqt2fh06v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 18:40:15 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DHxTLj030068;
 Mon, 13 Feb 2023 18:40:15 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqt2fh05x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 18:40:15 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DGfo5t017171;
 Mon, 13 Feb 2023 18:40:13 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3np2n6kv6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 18:40:13 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DIeBFn62193978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 18:40:12 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8FD658058;
 Mon, 13 Feb 2023 18:40:11 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09F0058057;
 Mon, 13 Feb 2023 18:40:11 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.60.89.68]) by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 18:40:10 +0000 (GMT)
Message-ID: <b886f59f5b97e41036faeea7b7b3675a68e1b489.camel@linux.ibm.com>
Subject: Re: [PATCH v3 3/6] hw/vfio/ccw: Use intermediate S390CCWDevice
 variable
From: Eric Farman <farman@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Eduardo
 Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>
Date: Mon, 13 Feb 2023 13:40:10 -0500
In-Reply-To: <20230213170145.45666-4-philmd@linaro.org>
References: <20230213170145.45666-1-philmd@linaro.org>
 <20230213170145.45666-4-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xGL6hMWYJYTihbsDIuIQ8hAiDh9huk_s
X-Proofpoint-ORIG-GUID: 8qrYM30ZGPuKs0EbRsh7UTKxq2_yHuvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130165
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

T24gTW9uLCAyMDIzLTAyLTEzIGF0IDE4OjAxICswMTAwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSB3cm90ZToKPiAnY2RldicgaXMgVkZJT0NDV0RldmljZSdzIHByaXZhdGUgcGFyZW50IG9iamVj
dC4KPiBBY2Nlc3MgaXQgdXNpbmcgdGhlIFMzOTBfQ0NXX0RFVklDRSgpIFFPTSBtYWNyby4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5v
cmc+CgpSZXZpZXdlZC1ieTogRXJpYyBGYXJtYW4gPGZhcm1hbkBsaW51eC5pYm0uY29tPgoKPiAt
LS0KPiDCoGh3L3ZmaW8vY2N3LmMgfCA5ICsrKysrLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvdmZpby9j
Y3cuYyBiL2h3L3ZmaW8vY2N3LmMKPiBpbmRleCA1MDNkZTk0Y2UxLi4yYzIwZTNjMjAyIDEwMDY0
NAo+IC0tLSBhL2h3L3ZmaW8vY2N3LmMKPiArKysgYi9ody92ZmlvL2Njdy5jCj4gQEAgLTU4OCw5
ICs1ODgsMTAgQEAgc3RhdGljIHZvaWQgdmZpb19jY3dfcHV0X2RldmljZShWRklPQ0NXRGV2aWNl
Cj4gKnZjZGV2KQo+IMKgc3RhdGljIHZvaWQgdmZpb19jY3dfZ2V0X2RldmljZShWRklPR3JvdXAg
Kmdyb3VwLCBWRklPQ0NXRGV2aWNlCj4gKnZjZGV2LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRXJyb3IgKiplcnJwKQo+
IMKgewo+IC3CoMKgwqAgY2hhciAqbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigiJXguJXguJTA0eCIs
IHZjZGV2LQo+ID5jZGV2Lmhvc3RpZC5jc3NpZCwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2Y2Rldi0+Y2Rldi5ob3N0
aWQuc3NpZCwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB2Y2Rldi0+Y2Rldi5ob3N0aWQuZGV2aWQpOwo+ICvCoMKgwqAg
UzM5MENDV0RldmljZSAqY2RldiA9IFMzOTBfQ0NXX0RFVklDRSh2Y2Rldik7Cj4gK8KgwqDCoCBj
aGFyICpuYW1lID0gZ19zdHJkdXBfcHJpbnRmKCIleC4leC4lMDR4IiwgY2Rldi0+aG9zdGlkLmNz
c2lkLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNkZXYtPmhvc3RpZC5zc2lkLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNkZXYtPmhvc3Rp
ZC5kZXZpZCk7Cj4gwqDCoMKgwqAgVkZJT0RldmljZSAqdmJhc2VkZXY7Cj4gwqAKPiDCoMKgwqDC
oCBRTElTVF9GT1JFQUNIKHZiYXNlZGV2LCAmZ3JvdXAtPmRldmljZV9saXN0LCBuZXh0KSB7Cj4g
QEAgLTYxMSw3ICs2MTIsNyBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Njd19nZXRfZGV2aWNlKFZGSU9H
cm91cCAqZ3JvdXAsCj4gVkZJT0NDV0RldmljZSAqdmNkZXYsCj4gwqDCoMKgwqDCoCAqLwo+IMKg
wqDCoMKgIHZjZGV2LT52ZGV2LnJhbV9ibG9ja19kaXNjYXJkX2FsbG93ZWQgPSB0cnVlOwo+IMKg
Cj4gLcKgwqDCoCBpZiAodmZpb19nZXRfZGV2aWNlKGdyb3VwLCB2Y2Rldi0+Y2Rldi5tZGV2aWQs
ICZ2Y2Rldi0+dmRldiwKPiBlcnJwKSkgewo+ICvCoMKgwqAgaWYgKHZmaW9fZ2V0X2RldmljZShn
cm91cCwgY2Rldi0+bWRldmlkLCAmdmNkZXYtPnZkZXYsIGVycnApKSB7Cj4gwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIG91dF9lcnI7Cj4gwqDCoMKgwqAgfQo+IMKgCgo=


