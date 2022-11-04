Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D74E619C97
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:09:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzEW-0008Pq-Gd; Fri, 04 Nov 2022 12:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1oqz8V-0002Vv-GF; Fri, 04 Nov 2022 12:01:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1oqz8T-0006sj-J8; Fri, 04 Nov 2022 12:01:39 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4FYWUb015429;
 Fri, 4 Nov 2022 16:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cyndVxpO68xeF2kLvEynoGF1c4wDnaPi7XVTk4biW24=;
 b=k4I+dXcp6ni0QI/EEyjpTwzqpLXJqcQfMk1+EwtV333f3hD6G4ZJjhiaV+uqnCfjuyTW
 HrKFRwVk+TjMmEXpB9l2o3xQFw9/ZHZG8L9WF6FfF90HF3Xj8fXzLQVpzmF7E5l59B2T
 m2ZNGGC5+wg6SXkGua7WxLIfUdjFiAg+WJmy1ladtKYpXj3wSwIPYnV5dkGkdB3t+KpB
 R+ENq/NYalh3/tm5ENUKGfXtFOyuJof8NxggdwCfNaMBNjqBEU5jC91LrgCU+xfnnhj4
 DtKvoH9W22xdJTKo79BN5WesebbjDzPHTCHBku/0RnFJoFhGTcteRJXT4qgikzBzAaEH jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kn2468n1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 16:01:34 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4DxJgs002732;
 Fri, 4 Nov 2022 16:01:33 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kn2468n15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 16:01:33 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4FotRl008524;
 Fri, 4 Nov 2022 16:01:33 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3kgutau81c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 16:01:32 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A4G1V8Q6816428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Nov 2022 16:01:31 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 523F058052;
 Fri,  4 Nov 2022 16:01:30 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0239C58054;
 Fri,  4 Nov 2022 16:01:29 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.65.225.56]) by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  4 Nov 2022 16:01:28 +0000 (GMT)
Message-ID: <dfff7d9d9809bd6676e16170e5bde222351b0e0b.camel@linux.ibm.com>
Subject: Re: [PATCH 2/3] s390x/pci: coalesce unmap operations
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: pmorel@linux.ibm.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, qemu-devel@nongnu.org
Date: Fri, 04 Nov 2022 12:01:28 -0400
In-Reply-To: <20221028194758.204007-3-mjrosato@linux.ibm.com>
References: <20221028194758.204007-1-mjrosato@linux.ibm.com>
 <20221028194758.204007-3-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oBgL95Y7c1wImwb5S8sTEFcVUj9UJQ4M
X-Proofpoint-GUID: TdMMisN1nygvg9vb48i4JaRC4uyIYRDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040104
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gRnJpLCAyMDIyLTEwLTI4IGF0IDE1OjQ3IC0wNDAwLCBNYXR0aGV3IFJvc2F0byB3cm90ZToK
PiBDdXJyZW50bHksIGVhY2ggdW5tYXBwZWQgcGFnZSBpcyBoYW5kbGVkIGFzIGFuIGluZGl2aWR1
YWwgaW9tbXUKPiByZWdpb24gbm90aWZpY2F0aW9uLsKgIEF0dGVtcHQgdG8gZ3JvdXAgY29udGln
dW91cyB1bm1hcCBvcGVyYXRpb25zCj4gaW50byBmZXdlciBub3RpZmljYXRpb25zIHRvIHJlZHVj
ZSBvdmVyaGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFJvc2F0byA8bWpyb3NhdG9A
bGludXguaWJtLmNvbT4KPiAtLS0KPiDCoGh3L3MzOTB4L3MzOTAtcGNpLWluc3QuYyB8IDUxCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDUxIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvczM5MHgvczM5MC1wY2kt
aW5zdC5jIGIvaHcvczM5MHgvczM5MC1wY2ktaW5zdC5jCj4gaW5kZXggN2NjNGJjZjg1MC4uNjZl
NzY0ZjkwMSAxMDA2NDQKPiAtLS0gYS9ody9zMzkweC9zMzkwLXBjaS1pbnN0LmMKPiArKysgYi9o
dy9zMzkweC9zMzkwLXBjaS1pbnN0LmMKPiBAQCAtNjQwLDYgKzY0MCw4IEBAIHN0YXRpYyB1aW50
MzJfdAo+IHMzOTBfcGNpX3VwZGF0ZV9pb3RsYihTMzkwUENJSU9NTVUgKmlvbW11LAo+IMKgwqDC
oMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqAgZ19oYXNoX3RhYmxlX3JlbW92ZShpb21t
dS0+aW90bGIsICZlbnRyeS0+aW92YSk7Cj4gwqDCoMKgwqDCoMKgwqDCoCBpbmNfZG1hX2F2YWls
KGlvbW11KTsKPiArwqDCoMKgwqDCoMKgwqAgLyogRG9uJ3Qgbm90aWZ5IHRoZSBpb21tdSB5ZXQs
IG1heWJlIHdlIGNhbiBidW5kbGUKPiBjb250aWd1b3VzIHVubWFwcyAqLwo+ICvCoMKgwqDCoMKg
wqDCoCBnb3RvIG91dDsKPiDCoMKgwqDCoCB9IGVsc2Ugewo+IMKgwqDCoMKgwqDCoMKgwqAgaWYg
KGNhY2hlKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChjYWNoZS0+cGVybSA9PSBl
bnRyeS0+cGVybSAmJgo+IEBAIC02NjMsMTUgKzY2NSw0NCBAQCBzdGF0aWMgdWludDMyX3QKPiBz
MzkwX3BjaV91cGRhdGVfaW90bGIoUzM5MFBDSUlPTU1VICppb21tdSwKPiDCoMKgwqDCoMKgwqDC
oMKgIGRlY19kbWFfYXZhaWwoaW9tbXUpOwo+IMKgwqDCoMKgIH0KPiDCoAo+ICvCoMKgwqAgLyoK
PiArwqDCoMKgwqAgKiBBbGwgYXNzb2NpYXRlZCBpb3RsYiBlbnRyaWVzIGhhdmUgYWxyZWFkeSBi
ZWVuIGNsZWFyZWQsCj4gdHJpZ2dlciB0aGUKPiArwqDCoMKgwqAgKiB1bm1hcHMuCj4gK8KgwqDC
oMKgICovCj4gwqDCoMKgwqAgbWVtb3J5X3JlZ2lvbl9ub3RpZnlfaW9tbXUoJmlvbW11LT5pb21t
dV9tciwgMCwgZXZlbnQpOwo+IMKgCj4gwqBvdXQ6Cj4gwqDCoMKgwqAgcmV0dXJuIGlvbW11LT5k
bWFfbGltaXQgPyBpb21tdS0+ZG1hX2xpbWl0LT5hdmFpbCA6IDE7Cj4gwqB9Cj4gwqAKPiArc3Rh
dGljIHZvaWQgczM5MF9wY2lfYmF0Y2hfdW5tYXAoUzM5MFBDSUlPTU1VICppb21tdSwgdWludDY0
X3QgaW92YSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdCBsZW4pCj4gK3sKPiArwqDCoMKgIHVpbnQ2NF90
IHJlbWFpbiA9IGxlbiwgc3RhcnQgPSBpb3ZhLCBlbmQgPSBzdGFydCArIGxlbiAtIDEsCj4gbWFz
aywgc2l6ZTsKPiArwqDCoMKgIElPTU1VVExCRXZlbnQgZXZlbnQgPSB7Cj4gK8KgwqDCoMKgwqDC
oMKgIC50eXBlID0gSU9NTVVfTk9USUZJRVJfVU5NQVAsCj4gK8KgwqDCoMKgwqDCoMKgIC5lbnRy
eSA9IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAudGFyZ2V0X2FzID0gJmFkZHJlc3Nfc3Bh
Y2VfbWVtb3J5LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC50cmFuc2xhdGVkX2FkZHIgPSAw
LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5wZXJtID0gSU9NTVVfTk9ORSwKPiArwqDCoMKg
wqDCoMKgwqAgfSwKPiArwqDCoMKgIH07Cj4gKwo+ICvCoMKgwqAgd2hpbGUgKHJlbWFpbiA+PSBU
QVJHRVRfUEFHRV9TSVpFKSB7Cj4gK8KgwqDCoMKgwqDCoMKgIG1hc2sgPSBkbWFfYWxpZ25lZF9w
b3cyX21hc2soc3RhcnQsIGVuZCwgNjQpOwo+ICvCoMKgwqDCoMKgwqDCoCBzaXplID0gbWFzayAr
IDE7Cj4gK8KgwqDCoMKgwqDCoMKgIGV2ZW50LmVudHJ5LmlvdmEgPSBzdGFydDsKPiArwqDCoMKg
wqDCoMKgwqAgZXZlbnQuZW50cnkuYWRkcl9tYXNrID0gbWFzazsKPiArwqDCoMKgwqDCoMKgwqAg
bWVtb3J5X3JlZ2lvbl9ub3RpZnlfaW9tbXUoJmlvbW11LT5pb21tdV9tciwgMCwgZXZlbnQpOwo+
ICvCoMKgwqDCoMKgwqDCoCBzdGFydCArPSBzaXplOwo+ICvCoMKgwqDCoMKgwqDCoCByZW1haW4g
LT0gc2l6ZTsKPiArwqDCoMKgIH0KPiArfQo+ICsKPiDCoGludCBycGNpdF9zZXJ2aWNlX2NhbGwo
UzM5MENQVSAqY3B1LCB1aW50OF90IHIxLCB1aW50OF90IHIyLAo+IHVpbnRwdHJfdCByYSkKPiDC
oHsKPiDCoMKgwqDCoCBDUFVTMzkwWFN0YXRlICplbnYgPSAmY3B1LT5lbnY7Cj4gK8KgwqDCoCB1
aW50NjRfdCBpb3ZhLCBjb2FsZXNjZSA9IDA7Cj4gwqDCoMKgwqAgdWludDMyX3QgZmg7Cj4gwqDC
oMKgwqAgdWludDE2X3QgZXJyb3IgPSAwOwo+IMKgwqDCoMKgIFMzOTBQQ0lCdXNEZXZpY2UgKnBi
ZGV2Owo+IEBAIC03NDIsNiArNzczLDIxIEBAIGludCBycGNpdF9zZXJ2aWNlX2NhbGwoUzM5MENQ
VSAqY3B1LCB1aW50OF90IHIxLAo+IHVpbnQ4X3QgcjIsIHVpbnRwdHJfdCByYSkKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4gwqAKPiArwqDC
oMKgwqDCoMKgwqAgLyoKPiArwqDCoMKgwqDCoMKgwqDCoCAqIElmIHRoaXMgaXMgYW4gdW5tYXAg
b2YgYSBQVEUsIGxldCdzIHRyeSB0byBjb2FsZXNjZQo+IG11bHRpcGxlIHVubWFwcwo+ICvCoMKg
wqDCoMKgwqDCoMKgICogaW50byBhcyBmZXcgbm90aWZpZXIgZXZlbnRzIGFzIHBvc3NpYmxlLgo+
ICvCoMKgwqDCoMKgwqDCoMKgICovCj4gK8KgwqDCoMKgwqDCoMKgIGlmIChlbnRyeS5wZXJtID09
IElPTU1VX05PTkUgJiYgZW50cnkubGVuID09Cj4gVEFSR0VUX1BBR0VfU0laRSkgewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChjb2FsZXNjZSA9PSAwKSB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpb3ZhID0gZW50cnkuaW92YTsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29hbGVzY2UgKz0gZW50cnkubGVuOwo+
ICvCoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKGNvYWxlc2NlID4gMCkgewo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC8qIFVubGVhc2ggdGhlIGNvYWxlc2NlZCB1bm1hcCBiZWZvcmUgcHJvY2Vz
c2luZyBhIG5ldwo+IG1hcCAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHMzOTBfcGNpX2Jh
dGNoX3VubWFwKGlvbW11LCBpb3ZhLCBjb2FsZXNjZSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29hbGVzY2UgPSAwOwo+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gKwo+IMKgwqDCoMKgwqDCoMKg
wqAgc3RhcnQgKz0gZW50cnkubGVuOwo+IMKgwqDCoMKgwqDCoMKgwqAgd2hpbGUgKGVudHJ5Lmlv
dmEgPCBzdGFydCAmJiBlbnRyeS5pb3ZhIDwgZW5kKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChkbWFfYXZhaWwgPiAwIHx8IGVudHJ5LnBlcm0gPT0gSU9NTVVfTk9ORSkgewo+IEBA
IC03NTksNiArODA1LDExIEBAIGludCBycGNpdF9zZXJ2aWNlX2NhbGwoUzM5MENQVSAqY3B1LCB1
aW50OF90IHIxLAo+IHVpbnQ4X3QgcjIsIHVpbnRwdHJfdCByYSkKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgIH0KPiArwqDCoMKgIGlm
IChjb2FsZXNjZSkgewoKSSdkIGd1ZXNzIHRoaXMgc2hvdWxkIGJlICJjb2FsZXNjZSA+IDAiIGFz
IGFib3ZlLiBSZWdhcmRsZXNzLAoKUmV2aWV3ZWQtYnk6IEVyaWMgRmFybWFuIDxmYXJtYW5AbGlu
dXguaWJtLmNvbT4KCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogVW5sZWFzaCB0aGUgY29h
bGVzY2VkIHVubWFwIGJlZm9yZSBmaW5pc2hpbmcgcnBjaXQgKi8KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzMzkwX3BjaV9iYXRjaF91bm1hcChpb21tdSwgaW92YSwgY29hbGVzY2UpOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvYWxlc2NlID0gMDsKPiArwqDCoMKgIH0KPiDCoMKgwqDC
oCBpZiAoYWdhaW4gJiYgZG1hX2F2YWlsID4gMCkKPiDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmV0
cnk7Cj4gwqBlcnI6Cgo=


