Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D1B619C44
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 16:55:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqz14-0006ae-EK; Fri, 04 Nov 2022 11:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1oqyxV-0004DW-V7; Fri, 04 Nov 2022 11:50:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1oqyxT-0005Ph-0x; Fri, 04 Nov 2022 11:50:17 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4F0BLj011837;
 Fri, 4 Nov 2022 15:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WfV8XVt1xohv74qusFVTP1K16VnCl0FebLq7zDLEwaw=;
 b=DY7YdZkp07WZCFkOwMh7yzN2ziUiJ21I4omuEIgp4x+YpzAzwXWF06Y+4KPUXREFymBS
 qlFng9FsvkWRfKQQ3xD7x6Z0LvAcPE3GJ3xeyGmxRzm6LeN2ZrHmRZSFAnWBwnFdJhb2
 Y2eBv6ZhXluUo27AxCgv6BGzyb2uaaW2V9MfD0BxrPY02JMDRbyNjRpWCPQ+I+VIgSrF
 283zfgP2scUxyf+gpFCHtgJ3ZO1dY67fi77gZfJVEb1D27vCjZluDxOzB/ePTb9NfWKz
 M2IdZ3iQhhQCBAuZYOkP6w//6Vo5Rjv1t0B//cR5XH7Avxy2hVYJGVoctx80oV4jluR5 FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpn9v2s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 15:50:09 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4ClsJN000770;
 Fri, 4 Nov 2022 15:50:09 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpn9v2r8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 15:50:09 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4Fnskp000876;
 Fri, 4 Nov 2022 15:50:07 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3kgutas22q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 15:50:07 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A4Fo32635455576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Nov 2022 15:50:03 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1C9B5805E;
 Fri,  4 Nov 2022 15:50:05 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECEDD58066;
 Fri,  4 Nov 2022 15:50:04 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.65.225.56]) by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  4 Nov 2022 15:50:04 +0000 (GMT)
Message-ID: <fb2201af4be59910309686fb821d6cb9bcadf437.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] s390x/pci: RPCIT second pass when mappings exhausted
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: pmorel@linux.ibm.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, qemu-devel@nongnu.org
Date: Fri, 04 Nov 2022 11:50:04 -0400
In-Reply-To: <20221028194758.204007-2-mjrosato@linux.ibm.com>
References: <20221028194758.204007-1-mjrosato@linux.ibm.com>
 <20221028194758.204007-2-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yADz4NAgxSRD9YkdSpRM-dHnDaFmvFpc
X-Proofpoint-ORIG-GUID: EE9GvZBTdf5VWlFomP8O4nIULAYr4HaY
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_09,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040101
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
PiBJZiB3ZSBlbmNvdW50ZXIgYSBuZXcgbWFwcGluZyB3aGlsZSB0aGUgbnVtYmVyIG9mIGF2YWls
YWJsZSBETUEKPiBlbnRyaWVzCj4gaW4gdmZpbyBpcyAwLCB3ZSBhcmUgY3VycmVudGx5IHNraXBw
aW5nIHRoYXQgbWFwcGluZyB3aGljaCBpcyBhCj4gcHJvYmxlbQo+IGlmIHdlIG1hbmFnZSB0byBm
cmVlIHVwIERNQSBzcGFjZSBhZnRlciB0aGF0IHdpdGhpbiB0aGUgc2FtZSBSUENJVCAtLQo+IHdl
IHdpbGwgcmV0dXJuIHRvIHRoZSBndWVzdCB3aXRoIENDMCBhbmQgaGF2ZSBub3QgbWFwcGVkIGV2
ZXJ5dGhpbmcKPiB3aXRoaW4gdGhlIHNwZWNpZmllZCByYW5nZS7CoCBUaGlzIGlzc3VlIHdhcyB1
bmNvdmVyZWQgd2hpbGUgdGVzdGluZwo+IGNoYW5nZXMgdG8gdGhlIHMzOTAgbGludXgga2VybmVs
IGlvbW11L2RtYSBjb2RlLCB3aGVyZSBhIGRpZmZlcmVudAo+IHVzYWdlIHBhdHRlcm4gd2FzIGVt
cGxveWVkIChuZXcgbWFwcGluZ3Mgc3RhcnQgYXQgdGhlIGVuZCBvZiB0aGUKPiBhcGVydHVyZSBh
bmQgd29yayBiYWNrIHRvd2FyZHMgdGhlIGZyb250LCBtYWtpbmcgdXMgZmFyIG1vcmUgbGlrZWx5
Cj4gdG8gZW5jb3VudGVyIG5ldyBtYXBwaW5ncyBiZWZvcmUgaW52YWxpZGF0ZWQgbWFwcGluZ3Mg
ZHVyaW5nIGEKPiBnbG9iYWwgcmVmcmVzaCkuCj4gCj4gRml4IHRoaXMgYnkgdHJhY2tpbmcgd2hl
dGhlciBhbnkgbWFwcGluZ3Mgd2VyZSBza2lwcGVkIGR1ZSB0byB2ZmlvCj4gRE1BIGxpbWl0IGhp
dHRpbmcgMDsgd2hlbiB0aGlzIG9jY3Vycywgd2Ugc3RpbGwgY29udGludWUgdGhlIHJhbmdlCj4g
YW5kIHVubWFwL21hcCBhbnl0aGluZyB3ZSBjYW4gLSB0aGVuIHdlIG11c3QgcmUtcnVuIHRoZSBy
YW5nZSBhZ2Fpbgo+IHRvIHBpY2t1cCBhbnl0aGluZyB0aGF0IHdhcyBtaXNzZWQuwqAgVGhpcyBt
dXN0IG9jY3VyIGluIGEgbG9vcCB1bnRpbAo+IGFsbCByZXF1ZXN0cyBhcmUgc2F0aXNmaWVkIChz
dWNjZXNzKSBvciB3ZSBkZXRlY3QgdGhhdCB3ZSBhcmUgc3RpbGwKPiB1bmFibGUgdG8gY29tcGxl
dGUgYWxsIG1hcHBpbmdzIChyZXR1cm4gWlBDSV9SUENJVF9TVF9JTlNVRkZfUkVTKS4KPiAKPiBM
aW5rOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXMzOTAvMjAyMjEwMTkxNDQ0MzUu
MzY5OTAyLTEtc2NobmVsbGVAbGludXguaWJtLmNvbS8KPiBGaXhlczogMzdmYTMyZGU3MCAoInMz
OTB4L3BjaTogSG9ub3IgRE1BIGxpbWl0cyBzZXQgYnkgdmZpbyIpCj4gUmVwb3J0ZWQtYnk6IE5p
a2xhcyBTY2huZWxsZSA8c2NobmVsbGVAbGludXguaWJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBN
YXR0aGV3IFJvc2F0byA8bWpyb3NhdG9AbGludXguaWJtLmNvbT4KClJldmlld2VkLWJ5OiBFcmlj
IEZhcm1hbiA8ZmFybWFuQGxpbnV4LmlibS5jb20+Cgo+IC0tLQo+IMKgaHcvczM5MHgvczM5MC1w
Y2ktaW5zdC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPiDCoDEgZmlsZSBj
aGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9ody9zMzkweC9zMzkwLXBjaS1pbnN0LmMgYi9ody9zMzkweC9zMzkwLXBjaS1pbnN0LmMKPiBp
bmRleCAyMGE5YmNjN2FmLi43Y2M0YmNmODUwIDEwMDY0NAo+IC0tLSBhL2h3L3MzOTB4L3MzOTAt
cGNpLWluc3QuYwo+ICsrKyBiL2h3L3MzOTB4L3MzOTAtcGNpLWluc3QuYwo+IEBAIC02NzcsOCAr
Njc3LDkgQEAgaW50IHJwY2l0X3NlcnZpY2VfY2FsbChTMzkwQ1BVICpjcHUsIHVpbnQ4X3QgcjEs
Cj4gdWludDhfdCByMiwgdWludHB0cl90IHJhKQo+IMKgwqDCoMKgIFMzOTBQQ0lCdXNEZXZpY2Ug
KnBiZGV2Owo+IMKgwqDCoMKgIFMzOTBQQ0lJT01NVSAqaW9tbXU7Cj4gwqDCoMKgwqAgUzM5MElP
VExCRW50cnkgZW50cnk7Cj4gLcKgwqDCoCBod2FkZHIgc3RhcnQsIGVuZDsKPiArwqDCoMKgIGh3
YWRkciBzdGFydCwgZW5kLCBzc3RhcnQ7Cj4gwqDCoMKgwqAgdWludDMyX3QgZG1hX2F2YWlsOwo+
ICvCoMKgwqAgYm9vbCBhZ2FpbjsKPiDCoAo+IMKgwqDCoMKgIGlmIChlbnYtPnBzdy5tYXNrICYg
UFNXX01BU0tfUFNUQVRFKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoCBzMzkwX3Byb2dyYW1faW50ZXJy
dXB0KGVudiwgUEdNX1BSSVZJTEVHRUQsIHJhKTsKPiBAQCAtNjkxLDcgKzY5Miw3IEBAIGludCBy
cGNpdF9zZXJ2aWNlX2NhbGwoUzM5MENQVSAqY3B1LCB1aW50OF90IHIxLAo+IHVpbnQ4X3QgcjIs
IHVpbnRwdHJfdCByYSkKPiDCoMKgwqDCoCB9Cj4gwqAKPiDCoMKgwqDCoCBmaCA9IGVudi0+cmVn
c1tyMV0gPj4gMzI7Cj4gLcKgwqDCoCBzdGFydCA9IGVudi0+cmVnc1tyMl07Cj4gK8KgwqDCoCBz
c3RhcnQgPSBzdGFydCA9IGVudi0+cmVnc1tyMl07Cj4gwqDCoMKgwqAgZW5kID0gc3RhcnQgKyBl
bnYtPnJlZ3NbcjIgKyAxXTsKPiDCoAo+IMKgwqDCoMKgIHBiZGV2ID0gczM5MF9wY2lfZmluZF9k
ZXZfYnlfZmgoczM5MF9nZXRfcGhiKCksIGZoKTsKPiBAQCAtNzMyLDYgKzczMyw5IEBAIGludCBy
cGNpdF9zZXJ2aWNlX2NhbGwoUzM5MENQVSAqY3B1LCB1aW50OF90IHIxLAo+IHVpbnQ4X3QgcjIs
IHVpbnRwdHJfdCByYSkKPiDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOwo+IMKgwqDCoMKgIH0K
PiDCoAo+ICsgcmV0cnk6Cj4gK8KgwqDCoCBzdGFydCA9IHNzdGFydDsKPiArwqDCoMKgIGFnYWlu
ID0gZmFsc2U7Cj4gwqDCoMKgwqAgd2hpbGUgKHN0YXJ0IDwgZW5kKSB7Cj4gwqDCoMKgwqDCoMKg
wqDCoCBlcnJvciA9IHMzOTBfZ3Vlc3RfaW9fdGFibGVfd2Fsayhpb21tdS0+Z19pb3RhLCBzdGFy
dCwKPiAmZW50cnkpOwo+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVycm9yKSB7Cj4gQEAgLTczOSwx
MyArNzQzLDI0IEBAIGludCBycGNpdF9zZXJ2aWNlX2NhbGwoUzM5MENQVSAqY3B1LCB1aW50OF90
Cj4gcjEsIHVpbnQ4X3QgcjIsIHVpbnRwdHJfdCByYSkKPiDCoMKgwqDCoMKgwqDCoMKgIH0KPiDC
oAo+IMKgwqDCoMKgwqDCoMKgwqAgc3RhcnQgKz0gZW50cnkubGVuOwo+IC3CoMKgwqDCoMKgwqDC
oCB3aGlsZSAoZW50cnkuaW92YSA8IHN0YXJ0ICYmIGVudHJ5LmlvdmEgPCBlbmQgJiYKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoZG1hX2F2YWlsID4gMCB8fCBlbnRyeS5wZXJtID09
IElPTU1VX05PTkUpKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2F2YWlsID0gczM5
MF9wY2lfdXBkYXRlX2lvdGxiKGlvbW11LCAmZW50cnkpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGVudHJ5LmlvdmEgKz0gVEFSR0VUX1BBR0VfU0laRTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBlbnRyeS50cmFuc2xhdGVkX2FkZHIgKz0gVEFSR0VUX1BBR0VfU0laRTsKPiArwqDCoMKg
wqDCoMKgwqAgd2hpbGUgKGVudHJ5LmlvdmEgPCBzdGFydCAmJiBlbnRyeS5pb3ZhIDwgZW5kKSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGRtYV9hdmFpbCA+IDAgfHwgZW50cnkucGVy
bSA9PSBJT01NVV9OT05FKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFf
YXZhaWwgPSBzMzkwX3BjaV91cGRhdGVfaW90bGIoaW9tbXUsICZlbnRyeSk7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRyeS5pb3ZhICs9IFRBUkdFVF9QQUdFX1NJWkU7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRyeS50cmFuc2xhdGVkX2FkZHIgKz0g
VEFSR0VUX1BBR0VfU0laRTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKiBXZSBhcmUgdW5hYmxlIHRvIG1ha2UgYSBuZXcgbWFwcGluZyBhdCB0aGlz
IHRpbWUsCj4gY29udGludWUKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBv
biBhbmQgaG9wZWZ1bGx5IGZyZWUgdXAgbW9yZSBzcGFjZS7CoCBUaGVuCj4gYXR0ZW1wdCBhbm90
aGVyCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogcGFzcy4KPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGFnYWluID0gdHJ1ZTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJy
ZWFrOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiDCoMKgwqDCoMKgwqDCoMKgIH0KPiDC
oMKgwqDCoCB9Cj4gK8KgwqDCoCBpZiAoYWdhaW4gJiYgZG1hX2F2YWlsID4gMCkKPiArwqDCoMKg
wqDCoMKgwqAgZ290byByZXRyeTsKPiDCoGVycjoKPiDCoMKgwqDCoCBpZiAoZXJyb3IpIHsKPiDC
oMKgwqDCoMKgwqDCoMKgIHBiZGV2LT5zdGF0ZSA9IFpQQ0lfRlNfRVJST1I7Cgo=

