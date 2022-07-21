Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3406E57CEAD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:12:12 +0200 (CEST)
Received: from localhost ([::1]:56134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXqU-0001q5-Sp
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEXoe-00074u-Om; Thu, 21 Jul 2022 11:10:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEXoc-0007ID-C7; Thu, 21 Jul 2022 11:10:16 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LF6FrY013559;
 Thu, 21 Jul 2022 15:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PmwWjgrwgK+Nq+e10djEY/exoILnOBtM5hporfGt2ow=;
 b=fnmkBmssm0NesMPr5NEW7uKotYFJvGGgOU+p6iPMnJaNSr/KOhe5YZqD2daYRchEKSvC
 qrnfdsScXsRVV5UwKDw7Rq8dtafEMvc6E/kt5rXQW3SvlQtifpC6LfLhfL8DTBLYui5w
 cIUZWeSl6idpLnlQUJ+BEPb4vYFf2BWwo/VsWdavBuRUua5zEYbJrpnZ9Fty0BdQ+mZX
 51WtKq60KZeTzXcgxJ258JiT/P6TZ/HfPsYUr4C/zZX8H2dOax8ae5ArvlRY5nt3CdSj
 yqXjX9WvJyeaho/6T5K0ujBfKPQr9iq1puG9TgVDb/AHhesiAwKmYS9zy6ehbqXsStxv VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf8y8ranv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 15:10:11 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LF6kQ1015268;
 Thu, 21 Jul 2022 15:10:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf8y8raku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 15:10:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LF7E3k015010;
 Thu, 21 Jul 2022 15:10:08 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3hbmkj74bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 15:10:08 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26LFA5aS22151512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 15:10:05 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F026CA4054;
 Thu, 21 Jul 2022 15:10:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78CDDA405B;
 Thu, 21 Jul 2022 15:10:04 +0000 (GMT)
Received: from [9.145.177.237] (unknown [9.145.177.237])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 15:10:04 +0000 (GMT)
Message-ID: <a78ca84f-f51a-9bcf-cce5-320f0442ba06@linux.ibm.com>
Date: Thu, 21 Jul 2022 17:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 10/14] linux header sync
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo"
 <pbonzini@redhat.com>, mhartmay@linux.ibm.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 imbrenda@linux.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 seiden@linux.ibm.com
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-11-frankja@linux.ibm.com>
 <CAMxuvazJW2zuVQRfoQqHXF6AZyuhqV_HMfLA0D973eu2-yCF1w@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <CAMxuvazJW2zuVQRfoQqHXF6AZyuhqV_HMfLA0D973eu2-yCF1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0qOmu_-kV3Twf6S0j07y2SnKQkG1EI9R
X-Proofpoint-GUID: mL4TmpRbQCXx6Zv1eYZTLNCC6KlbQDaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_18,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210060
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gNy8yMS8yMiAxNzowNSwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBPbiBUaHUs
IEp1bCAyMSwgMjAyMiBhdCA1OjIzIFBNIEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXgu
aWJtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gQWRkIHRoZSB1YXBpIGRhdGEgZm9yIEtWTV9DQVBf
UzM5MF9QUk9URUNURURfRFVNUCB3aGljaCBJIGV4cGVjdCB0byBiZQ0KPj4gYWRkZWQgd2l0
aCA1LjIwLg0KPiANCj4gSXQncyBnb2luZyB0byBiZSBvdmVyd3JpdHRlbiBieSB0aGUgbmV4
dCB1cGRhdGUtbGludXgtaGVhZGVycy5zaC4gSSdkDQo+IG1hcmsgdGhpcyBwYXRjaCBhcyBX
SVAgb3IgRHJhZnQ6IGluIHRoZSB0aXRsZSB1bnRpbCBpdCdzIGFjdHVhbGx5IHN5bmMNCj4g
YW5kIGltcG9ydGVkIGZyb20gdGhlIGtlcm5lbC4NCg0KWWVzLCBzdWNoIHBhdGNoZXMgYXJl
IG5vcm1hbGx5IGp1c3QgaWdub3JlZCBieSBtYWludGFpbmVycyBhcyB0aGV5IA0KcHJvdmlk
ZSB0aGVpciBvd24gc3luYyBwYXRjaCB0aGF0J3Mgd2h5IGl0IGRvZXNuJ3QgaGF2ZSBhIHBy
b3BlciBzdWJqZWN0IA0Kb3IgYSBXSVAgcHJlZml4LiBJdCdzIG5lZWRlZCB0byBiZSBhYmxl
IHRvIGNvbXBpbGUgaXQgdW50aWwgdGhlIHByb3BlciANCnN5bmMgaGFzIGFycml2ZWQuDQoN
Cg0KDQo+IA0KPiANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW5vc2NoIEZyYW5rIDxmcmFu
a2phQGxpbnV4LmlibS5jb20+DQo+PiAtLS0NCj4+ICAgbGludXgtaGVhZGVycy9saW51eC9r
dm0uaCB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4g
ICAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9saW51eC1oZWFkZXJzL2xpbnV4L2t2bS5oIGIvbGludXgtaGVhZGVycy9saW51eC9rdm0u
aA0KPj4gaW5kZXggMGQwNWQwMmVlNC4uMjEzMjE2YzI3YyAxMDA2NDQNCj4+IC0tLSBhL2xp
bnV4LWhlYWRlcnMvbGludXgva3ZtLmgNCj4+ICsrKyBiL2xpbnV4LWhlYWRlcnMvbGludXgv
a3ZtLmgNCj4+IEBAIC0xMTUwLDYgKzExNTAsNyBAQCBzdHJ1Y3Qga3ZtX3BwY19yZXNpemVf
aHB0IHsNCj4+ICAgI2RlZmluZSBLVk1fQ0FQX0RJU0FCTEVfUVVJUktTMiAyMTMNCj4+ICAg
LyogI2RlZmluZSBLVk1fQ0FQX1ZNX1RTQ19DT05UUk9MIDIxNCAqLw0KPj4gICAjZGVmaW5l
IEtWTV9DQVBfU1lTVEVNX0VWRU5UX0RBVEEgMjE1DQo+PiArI2RlZmluZSBLVk1fQ0FQX1Mz
OTBfUFJPVEVDVEVEX0RVTVAgMjE3DQo+Pg0KPj4gICAjaWZkZWYgS1ZNX0NBUF9JUlFfUk9V
VElORw0KPj4NCj4+IEBAIC0xNjUxLDYgKzE2NTIsNTUgQEAgc3RydWN0IGt2bV9zMzkwX3B2
X3VucCB7DQo+PiAgICAgICAgICBfX3U2NCB0d2VhazsNCj4+ICAgfTsNCj4+DQo+PiArZW51
bSBwdl9jbWRfaW5mb19pZCB7DQo+PiArICAgICAgIEtWTV9QVl9JTkZPX1ZNLA0KPj4gKyAg
ICAgICBLVk1fUFZfSU5GT19EVU1QLA0KPj4gK307DQo+PiArDQo+PiArc3RydWN0IGt2bV9z
MzkwX3B2X2luZm9fZHVtcCB7DQo+PiArICAgICAgIF9fdTY0IGR1bXBfY3B1X2J1ZmZlcl9s
ZW47DQo+PiArICAgICAgIF9fdTY0IGR1bXBfY29uZmlnX21lbV9idWZmZXJfcGVyXzFtOw0K
Pj4gKyAgICAgICBfX3U2NCBkdW1wX2NvbmZpZ19maW5hbGl6ZV9sZW47DQo+PiArfTsNCj4+
ICsNCj4+ICtzdHJ1Y3Qga3ZtX3MzOTBfcHZfaW5mb192bSB7DQo+PiArICAgICAgIF9fdTY0
IGluc3RfY2FsbHNfbGlzdFs0XTsNCj4+ICsgICAgICAgX191NjQgbWF4X2NwdXM7DQo+PiAr
ICAgICAgIF9fdTY0IG1heF9ndWVzdHM7DQo+PiArICAgICAgIF9fdTY0IG1heF9ndWVzdF9h
ZGRyOw0KPj4gKyAgICAgICBfX3U2NCBmZWF0dXJlX2luZGljYXRpb247DQo+PiArfTsNCj4+
ICsNCj4+ICtzdHJ1Y3Qga3ZtX3MzOTBfcHZfaW5mb19oZWFkZXIgew0KPj4gKyAgICAgICBf
X3UzMiBpZDsNCj4+ICsgICAgICAgX191MzIgbGVuX21heDsNCj4+ICsgICAgICAgX191MzIg
bGVuX3dyaXR0ZW47DQo+PiArICAgICAgIF9fdTMyIHJlc2VydmVkOw0KPj4gK307DQo+PiAr
DQo+PiArc3RydWN0IGt2bV9zMzkwX3B2X2luZm8gew0KPj4gKyAgICAgICBzdHJ1Y3Qga3Zt
X3MzOTBfcHZfaW5mb19oZWFkZXIgaGVhZGVyOw0KPj4gKyAgICAgICB1bmlvbiB7DQo+PiAr
ICAgICAgICAgICAgICAgc3RydWN0IGt2bV9zMzkwX3B2X2luZm9fZHVtcCBkdW1wOw0KPj4g
KyAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fczM5MF9wdl9pbmZvX3ZtIHZtOw0KPj4gKyAg
ICAgICB9Ow0KPj4gK307DQo+PiArDQo+PiArZW51bSBwdl9jbWRfZG1wX2lkIHsNCj4+ICsg
ICAgICAgIEtWTV9QVl9EVU1QX0lOSVQsDQo+PiArICAgICAgICBLVk1fUFZfRFVNUF9DT05G
SUdfU1RBVEUsDQo+PiArICAgICAgICBLVk1fUFZfRFVNUF9DT01QTEVURSwNCj4+ICsgICAg
ICAgIEtWTV9QVl9EVU1QX0NQVSwNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0cnVjdCBrdm1fczM5
MF9wdl9kbXAgew0KPj4gKyAgICAgICAgX191NjQgc3ViY21kOw0KPj4gKyAgICAgICAgX191
NjQgYnVmZl9hZGRyOw0KPj4gKyAgICAgICAgX191NjQgYnVmZl9sZW47DQo+PiArICAgICAg
ICBfX3U2NCBnYWRkcjsNCj4+ICsgICAgICAgIF9fdTY0IHJlc2VydmVkWzRdOw0KPj4gK307
DQo+PiArDQo+PiAgIGVudW0gcHZfY21kX2lkIHsNCj4+ICAgICAgICAgIEtWTV9QVl9FTkFC
TEUsDQo+PiAgICAgICAgICBLVk1fUFZfRElTQUJMRSwNCj4+IEBAIC0xNjU5LDYgKzE3MDks
OCBAQCBlbnVtIHB2X2NtZF9pZCB7DQo+PiAgICAgICAgICBLVk1fUFZfVkVSSUZZLA0KPj4g
ICAgICAgICAgS1ZNX1BWX1BSRVBfUkVTRVQsDQo+PiAgICAgICAgICBLVk1fUFZfVU5TSEFS
RV9BTEwsDQo+PiArICAgICAgICBLVk1fUFZfSU5GTywNCj4+ICsgICAgICAgIEtWTV9QVl9E
VU1QLA0KPj4gICB9Ow0KPj4NCj4+ICAgc3RydWN0IGt2bV9wdl9jbWQgew0KPj4gQEAgLTIw
NjYsNCArMjExOCw2IEBAIHN0cnVjdCBrdm1fc3RhdHNfZGVzYyB7DQo+PiAgIC8qIEF2YWls
YWJsZSB3aXRoIEtWTV9DQVBfWFNBVkUyICovDQo+PiAgICNkZWZpbmUgS1ZNX0dFVF9YU0FW
RTIgICAgICAgICAgIF9JT1IoS1ZNSU8sICAweGNmLCBzdHJ1Y3Qga3ZtX3hzYXZlKQ0KPj4N
Cj4+ICsjZGVmaW5lIEtWTV9TMzkwX1BWX0NQVV9DT01NQU5EIF9JT1dSKEtWTUlPLCAweGQw
LCBzdHJ1Y3Qga3ZtX3B2X2NtZCkNCj4+ICsNCj4+ICAgI2VuZGlmIC8qIF9fTElOVVhfS1ZN
X0ggKi8NCj4+IC0tDQo+PiAyLjM0LjENCj4+DQo+IA0KDQo=

