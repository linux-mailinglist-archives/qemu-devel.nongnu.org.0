Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72736BBBC6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 19:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVd8-0006uK-UJ; Wed, 15 Mar 2023 14:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcVd0-0006hB-IH; Wed, 15 Mar 2023 14:13:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcVcy-0006eE-Ja; Wed, 15 Mar 2023 14:13:34 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FHeHSW012259; Wed, 15 Mar 2023 18:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=TIJyolQw2yI+Ty44mdi/MT0s7Zggxgoy8odXfCu2e/I=;
 b=RIlEzFsDMIFT52b6ewKP5ZIWI1bt0qFViI9cdXhVQLvxB+fchIESDpYBEGjqXlvCtHQH
 BQ01exsyRcCw5Tw5TRaLX0pVjgBu2rQhFHEFwIBM5OvzkKh3PP/MzA/sGeHwbtDBzEzh
 lb/+qdUJp0F4U/6LmlhWVJCDZA1WsCn7162tl9qlpOgxRFKSnOjDmSzhYRpvJQhLUH2X
 9b+K2/qL8BkjAtzNy5eU6ZvresHD9NNMnimmTeChTLmhsKMiKZ4zjR72KyTdADyp550U
 Y6cL3iRSHVVUJdfA2DhiCzZ8HgB2RIgkmAaBFj220Is6lc9zVU+FH8PVtgrkB6WZKvY9 YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbjmfrswd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 18:13:30 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32FHhMsZ020014;
 Wed, 15 Mar 2023 18:13:30 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbjmfrsvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 18:13:29 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32FH9Kwi018557;
 Wed, 15 Mar 2023 18:13:28 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3pb29srx4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 18:13:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32FIDPxg32506604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 18:13:25 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B106C2004B;
 Wed, 15 Mar 2023 18:13:25 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 616BA20040;
 Wed, 15 Mar 2023 18:13:25 +0000 (GMT)
Received: from [9.171.20.11] (unknown [9.171.20.11])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 18:13:25 +0000 (GMT)
Message-ID: <ea75403f72fadac38b89e8b533d760664488422b.camel@linux.ibm.com>
Subject: Re: [PATCH v2 12/12] tests/tcg/s390x: Test unaligned accesses
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Date: Wed, 15 Mar 2023 19:13:25 +0100
In-Reply-To: <ef02ec32-cee8-6d89-4cdf-b8934ec9b1a4@redhat.com>
References: <20230313153844.9231-1-iii@linux.ibm.com>
 <20230313153844.9231-13-iii@linux.ibm.com>
 <ef02ec32-cee8-6d89-4cdf-b8934ec9b1a4@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3rPKApexGNm_W7aSe_ofowWHCIL12K0I
X-Proofpoint-ORIG-GUID: yMEBh12OUICr6imhb9Rx5T17akbxH_3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_10,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150151
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

T24gV2VkLCAyMDIzLTAzLTE1IGF0IDE5OjA5ICswMTAwLCBUaG9tYXMgSHV0aCB3cm90ZToKPiBP
biAxMy8wMy8yMDIzIDE2LjM4LCBJbHlhIExlb3Noa2V2aWNoIHdyb3RlOgo+ID4gQWRkIGEgbnVt
YmVyIG9mIHNtYWxsIHRlc3QgdGhhdCBjaGVjayB3aGV0aGVyIGFjY2Vzc2luZyB1bmFsaWduZWQK
PiA+IGFkZHJlc3NlcyBpbiB2YXJpb3VzIHdheXMgbGVhZHMgdG8gYSBzcGVjaWZpY2F0aW9uIGV4
Y2VwdGlvbi4KPiA+IAo+ID4gUnVuIHRoZXNlIHRlc3QgYm90aCBpbiBzb2Z0bW11IGFuZCB1c2Vy
IGNvbmZpZ3VyYXRpb25zOyBleHBlY3QgYQo+ID4gUEdNCj4gPiBpbiBvbmUgY2FzZSBhbmQgU0lH
SUxMIGluIHRoZSBvdGhlci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSWx5YSBMZW9zaGtldmlj
aCA8aWlpQGxpbnV4LmlibS5jb20+Cj4gPiAtLS0KPiAuLi4KPiA+IGRpZmYgLS1naXQgYS90ZXN0
cy90Y2cvczM5MHgvZXgtb2RkLlMgYi90ZXN0cy90Y2cvczM5MHgvZXgtb2RkLlMKPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMC4uMDQyN2M3OWQ4YTQKPiA+IC0t
LSAvZGV2L251bGwKPiA+ICsrKyBiL3Rlc3RzL3RjZy9zMzkweC9leC1vZGQuUwo+ID4gQEAgLTAs
MCArMSwxNyBAQAo+ID4gKy8qCj4gPiArICogVGVzdCBFWEVDVVRFaW5nIGEgbm9uLW1hcHBlZCBv
ZGQgYWRkcmVzcy4KPiA+ICsgKgo+ID4gKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9yLWxhdGVyCj4gPiArICovCj4gPiArI2luY2x1ZGUgImFzbS1jb25zdC5oIgo+ID4gKwo+
ID4gKyNkZWZpbmUKPiA+IENPREXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+IMKgwqDCoCBcCj4gPiArwqDCoMKg
IHN0cmluZ2lmeV9pbl9jKMKgwqDCoCBsZ3JsCj4gPiAlcjEsb2RkX2FkZHI7KcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcCj4gPiArwqDCoMKgCj4gPiBzdHJpbmdpZnlfaW5fYyhleHBlY3RlZF9vbGRfcHN3YTo7
KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAKPiA+IMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgc3RyaW5naWZ5X2luX2Mo
wqDCoMKgIGV4IDAsJXIxOykKPiAKPiBUaGlzIGZhaWxzIHRvIGNvbXBpbGUgd2l0aCBDbGFuZyAx
NToKPiAKPiAkIG1ha2UgY2hlY2stdGNnCj4gwqDCoCBCVUlMRMKgwqAgczM5MHgtc29mdG1tdSBn
dWVzdC10ZXN0cwo+IHRlc3RzL3RjZy9zMzkweC9wZ20tc3BlY2lmaWNhdGlvbi5pbmM6MjE6NDk6
IGVycm9yOiB1bmtub3duIHRva2VuIGluCj4gZXhwcmVzc2lvbgo+IMKgwqDCoMKgIGxncmwgJXIx
LG9kZF9hZGRyOyBleHBlY3RlZF9vbGRfcHN3YTo7IGV4IDAsJXIxOwo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeCj4gwqAgVGhvbWFzCj4gCgpUaGlzIHNob3VsZCBi
ZSAiZXggMCwwKCVyMSkiLiBJIHdpbGwgcmV0ZXN0IHdpdGggY2xhbmcgYW5kIHBvc3QgYSB2My4K



