Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA06D5813DA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 15:08:28 +0200 (CEST)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGKIV-0005XZ-GT
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 09:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGKCI-0001PN-BV; Tue, 26 Jul 2022 09:02:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGKC3-0007bH-CD; Tue, 26 Jul 2022 09:02:01 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QBql9v008736;
 Tue, 26 Jul 2022 13:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=d5DXfTRGMwYQoEvJzlsfNojUh1wMQPFm4JnVK5MW1uI=;
 b=qGj4XiZ+s/lJn4TnJxPL1o/7xFZX0w8MP4HvYJgKmGxS/rH+cLxzbXRqMDA0HRUhPiUh
 ahO4KB8yJgVndDLi8zD1ObPvbtjbCAKV0aKYJ8bVg6ZdEYeL74q69MDUABGUFyw5pCRv
 UXsQle1dFkPsI9w1mlUcUtbUje+/OxQPc4EblVuWGw1v9LNnjQGTWOVQU9BXLIgqR3Q/
 chRqkhn95nnuzJRiuU9T5VUJ7hBjNT6bUFa1VoZIbKlakNjTuM8c+8WWwf6LZBlkrjxZ
 9l/tY+qs1Q03akmjzOcJShfryMKAqX8TbvrMsF2kq7gOHONTdpFBzrrBHB5u5PLyHzfQ UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjfsjj2wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 13:01:44 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QBu76q020492;
 Tue, 26 Jul 2022 13:01:42 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjfsjj2uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 13:01:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26QCp8kR023395;
 Tue, 26 Jul 2022 13:01:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3hh6eujfv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 13:01:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26QD1ZT522872414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 13:01:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EFB4A405F;
 Tue, 26 Jul 2022 13:01:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20BECA405C;
 Tue, 26 Jul 2022 13:01:35 +0000 (GMT)
Received: from [9.145.6.94] (unknown [9.145.6.94])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 13:01:35 +0000 (GMT)
Message-ID: <8a8afcc3-a3cd-23f3-e7d3-f9a7a951da85@linux.ibm.com>
Date: Tue, 26 Jul 2022 15:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo"
 <pbonzini@redhat.com>, mhartmay@linux.ibm.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 imbrenda@linux.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 seiden@linux.ibm.com, scgl@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-3-frankja@linux.ibm.com>
 <CAMxuvazFw2eD1dTQJOQniQCc4faJd3zQw0jtfKdKygWEEtPe5A@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v4 02/17] dump: Introduce GuestPhysBlock offset and length
 filter functions
In-Reply-To: <CAMxuvazFw2eD1dTQJOQniQCc4faJd3zQw0jtfKdKygWEEtPe5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9i8thh8G0uZCOD986Yz1venLpBeElsjv
X-Proofpoint-GUID: ycola3Zb2yYV-3Drvy0-1iD58OnGavIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260050
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

T24gNy8yNi8yMiAxMzozNSwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBPbiBUdWUs
IEp1bCAyNiwgMjAyMiBhdCAxOjIzIFBNIEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXgu
aWJtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gVGhlIGl0ZXJhdGlvbiBvdmVyIHRoZSBtZW1ibG9j
a3MgaXMgaGFyZCB0byB1bmRlcnN0YW5kIHNvIGl0J3MgYWJvdXQNCj4+IHRpbWUgdG8gY2xl
YW4gaXQgdXAuIEluc3RlYWQgb2YgbWFudWFsbHkgZ3JhYmJpbmcgdGhlIG5leHQgbWVtYmxv
Y2sgd2UNCj4+IGNhbiB1c2UgUVRBSUxRX0ZPUkVBQ0ggdG8gaXRlcmF0ZSBvdmVyIGFsbCBt
ZW1ibG9ja3MuDQo+Pg0KPj4gQWRkaXRpb25hbGx5IHdlIG1vdmUgdGhlIGNhbGN1bGF0aW9u
IG9mIHRoZSBvZmZzZXQgYW5kIGxlbmd0aCBvdXQgYnkNCj4+IHVzaW5nIHRoZSBkdW1wX2dl
dF9tZW1ibG9ja18qKCkgZnVuY3Rpb25zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEphbm9z
Y2ggRnJhbmsgPGZyYW5ramFAbGludXguaWJtLmNvbT4NCj4+IC0tLQ0KPj4gICBkdW1wL2R1
bXAuYyAgICAgICAgICAgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+PiAgIGluY2x1ZGUvc3lzZW11L2R1bXAuaCB8ICA1ICsrKysrDQo+PiAgIDIgZmls
ZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kdW1w
L2R1bXAuYyBiL2R1bXAvZHVtcC5jDQo+PiBpbmRleCAwZWQ3Y2Y5YzdiLi4wZmQ3Yzc2YzFl
IDEwMDY0NA0KPj4gLS0tIGEvZHVtcC9kdW1wLmMNCj4+ICsrKyBiL2R1bXAvZHVtcC5jDQo+
PiBAQCAtNTkxLDYgKzU5MSw0MyBAQCBzdGF0aWMgdm9pZCBkdW1wX2JlZ2luKER1bXBTdGF0
ZSAqcywgRXJyb3IgKiplcnJwKQ0KPj4gICAgICAgd3JpdGVfZWxmX25vdGVzKHMsIGVycnAp
Ow0KPj4gICB9DQo+Pg0KPj4gK2ludDY0X3QgZHVtcF9nZXRfbWVtYmxvY2tfc2l6ZShHdWVz
dFBoeXNCbG9jayAqYmxvY2ssIGludDY0X3QgZmlsdGVyX2FyZWFfc3RhcnQsDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludDY0X3QgZmlsdGVyX2FyZWFfbGVuZ3Ro
KQ0KPj4gK3sNCj4+ICsgICAgaW50NjRfdCBzaXplLCBsZWZ0LCByaWdodDsNCj4+ICsNCj4+
ICsgICAgLyogTm8gZmlsdGVyLCByZXR1cm4gZnVsbCBzaXplICovDQo+PiArICAgIGlmICgh
ZmlsdGVyX2FyZWFfbGVuZ3RoKSB7DQo+PiArICAgICAgICByZXR1cm4gYmxvY2stPnRhcmdl
dF9lbmQgLSBibG9jay0+dGFyZ2V0X3N0YXJ0Ow0KPj4gKyAgICB9DQo+PiArDQo+PiArICAg
IC8qIGNhbGN1bGF0ZSB0aGUgb3ZlcmxhcHBlZCByZWdpb24uICovDQo+PiArICAgIGxlZnQg
PSBNQVgoZmlsdGVyX2FyZWFfc3RhcnQsIGJsb2NrLT50YXJnZXRfc3RhcnQpOw0KPj4gKyAg
ICByaWdodCA9IE1JTihmaWx0ZXJfYXJlYV9zdGFydCArIGZpbHRlcl9hcmVhX2xlbmd0aCwg
YmxvY2stPnRhcmdldF9lbmQpOw0KPj4gKyAgICBzaXplID0gcmlnaHQgLSBsZWZ0Ow0KPj4g
KyAgICBzaXplID0gc2l6ZSA+IDAgPyBzaXplIDogMDsNCj4+ICsNCj4+ICsgICAgcmV0dXJu
IHNpemU7DQo+PiArfQ0KPj4gKw0KPj4gK2ludDY0X3QgZHVtcF9nZXRfbWVtYmxvY2tfc3Rh
cnQoR3Vlc3RQaHlzQmxvY2sgKmJsb2NrLCBpbnQ2NF90IGZpbHRlcl9hcmVhX3N0YXJ0LA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50NjRfdCBmaWx0ZXJfYXJl
YV9sZW5ndGgpDQo+PiArew0KPj4gKyAgICBpZiAoZmlsdGVyX2FyZWFfbGVuZ3RoKSB7DQo+
PiArICAgICAgICAvKiByZXR1cm4gLTEgaWYgdGhlIGJsb2NrIGlzIG5vdCB3aXRoaW4gZmls
dGVyIGFyZWEgKi8NCj4+ICsgICAgICAgIGlmIChibG9jay0+dGFyZ2V0X3N0YXJ0ID49IGZp
bHRlcl9hcmVhX3N0YXJ0ICsgZmlsdGVyX2FyZWFfbGVuZ3RoIHx8DQo+PiArICAgICAgICAg
ICAgYmxvY2stPnRhcmdldF9lbmQgPD0gZmlsdGVyX2FyZWFfc3RhcnQpIHsNCj4+ICsgICAg
ICAgICAgICByZXR1cm4gLTE7DQo+PiArICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICBp
ZiAoZmlsdGVyX2FyZWFfc3RhcnQgPiBibG9jay0+dGFyZ2V0X3N0YXJ0KSB7DQo+PiArICAg
ICAgICAgICAgcmV0dXJuIGZpbHRlcl9hcmVhX3N0YXJ0IC0gYmxvY2stPnRhcmdldF9zdGFy
dDsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gMDsN
Cj4+ICt9DQo+PiArDQo+PiAgIHN0YXRpYyBpbnQgZ2V0X25leHRfYmxvY2soRHVtcFN0YXRl
ICpzLCBHdWVzdFBoeXNCbG9jayAqYmxvY2spDQo+PiAgIHsNCj4+ICAgICAgIHdoaWxlICgx
KSB7DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zeXNlbXUvZHVtcC5oIGIvaW5jbHVkZS9z
eXNlbXUvZHVtcC5oDQo+PiBpbmRleCBmZmMyZWExMDcyLi42Y2UzYzI0MTk3IDEwMDY0NA0K
Pj4gLS0tIGEvaW5jbHVkZS9zeXNlbXUvZHVtcC5oDQo+PiArKysgYi9pbmNsdWRlL3N5c2Vt
dS9kdW1wLmgNCj4+IEBAIC0yMDMsNCArMjAzLDkgQEAgdHlwZWRlZiBzdHJ1Y3QgRHVtcFN0
YXRlIHsNCj4+ICAgdWludDE2X3QgY3B1X3RvX2R1bXAxNihEdW1wU3RhdGUgKnMsIHVpbnQx
Nl90IHZhbCk7DQo+PiAgIHVpbnQzMl90IGNwdV90b19kdW1wMzIoRHVtcFN0YXRlICpzLCB1
aW50MzJfdCB2YWwpOw0KPj4gICB1aW50NjRfdCBjcHVfdG9fZHVtcDY0KER1bXBTdGF0ZSAq
cywgdWludDY0X3QgdmFsKTsNCj4+ICsNCj4+ICtpbnQ2NF90IGR1bXBfZ2V0X21lbWJsb2Nr
X3NpemUoR3Vlc3RQaHlzQmxvY2sgKmJsb2NrLCBpbnQ2NF90IGZpbHRlcl9hcmVhX3N0YXJ0
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQ2NF90IGZpbHRlcl9h
cmVhX2xlbmd0aCk7DQo+PiAraW50NjRfdCBkdW1wX2dldF9tZW1ibG9ja19zdGFydChHdWVz
dFBoeXNCbG9jayAqYmxvY2ssIGludDY0X3QgZmlsdGVyX2FyZWFfc3RhcnQsDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQ2NF90IGZpbHRlcl9hcmVhX2xlbmd0
aCk7DQo+IA0KPiBUaGUgZnVuY3Rpb25zIGRvbid0IG5lZWQgdG8gYmUgZXhwb3J0ZWQuIFlv
dSBwcm9iYWJseSBuZWVkIHRvDQo+IGludHJvZHVjZSB0aGVtIGJhY2sgd2l0aCB0aGVpciB1
c2FnZSwgdG8gYXZvaWQgc29tZSBjb21waWxlciB3YXJuaW5nLg0KDQpSaWdodCwgSSdsbCBh
ZGQgdGhlbSBpbiB0aGUgbGFzdCBzMzkwIGR1bXAgcGF0Y2ggYW5kIG1ha2UgdGhlbSBzdGF0
aWMNCg0KPiBJZiB5b3UgY2FuJ3Qgc3BsaXQgdGhlIGludHJvZHVjdGlvbiBhbmQgcmVsYXRl
ZCByZWZhY3RvcmluZywgdGhlbg0KPiBsZXQncyBoYXZlIGEgc2luZ2xlIHBhdGNoLg0KDQpT
byBzcXVhc2hpbmcgdGhpcyB3aXRoIHRoZSBuZXh0IG9uZSBidXQgbGVhdmUgdGhlIG90aGVy
IHJlZmFjdG9yaW5nIA0KcGF0Y2hlcyAoZHVtcF9jYWxjdWxhdGVfc2l6ZSgpIGFuZCBnZXRf
c3RhcnRfYmxvY2soKSkgYXMgdGhleSBhcmU/DQoNCj4gDQo+IFRoYW5rcw0KPiANCj4+ICAg
I2VuZGlmDQo+PiAtLQ0KPj4gMi4zNC4xDQo+Pg0KPiANCj4gDQoNCg==

