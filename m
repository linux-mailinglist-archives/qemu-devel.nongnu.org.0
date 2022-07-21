Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C2357CEB8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:16:15 +0200 (CEST)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXuQ-0006Vj-JR
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEXsL-00042h-Ux; Thu, 21 Jul 2022 11:14:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEXsK-0007j4-5w; Thu, 21 Jul 2022 11:14:05 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LF6Fbo013519;
 Thu, 21 Jul 2022 15:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DDMnqYW76HNbGsvBgQToQ/kSvq19qsjj1YoDAwcytlU=;
 b=MV+t+M3NlzOnAQwEiLfyBMcZXx/ZtGdPsZaxLka9lW6B+0KHye1RsKqfgtB9XZPrpypo
 OLbgsrQCl+3T3+/q12iyjpFwg9U0lG5h58jR1BI22LWY22DpPP2dfoKFO+BaV9zz3bWr
 9r82CSwNmSi/ZSh41O152DutnkHBM1rxByf8puBB5Ib/1itvyHBsuONrwNErxUsI593z
 B7CtoFlqZ57I6/CZ7eZQ5HEE6q+bOBROx2zHeC/P97Q0IqPLdKiWTQYHfZqUxauueAeM
 EK84fNiZ/TI/fwg/Qda4FcAdVbdboBL+2ic0+RUCqXOSnNI4s+5Iza542XMFvSqFmYKw Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf8y8rf6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 15:14:02 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LF7A1t018716;
 Thu, 21 Jul 2022 15:14:02 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf8y8rf5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 15:14:01 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LF7r9G022491;
 Thu, 21 Jul 2022 15:13:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3hbmkhsytu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 15:13:59 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26LFC76p23462306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 15:12:07 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFCEEA405C;
 Thu, 21 Jul 2022 15:13:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5731FA4054;
 Thu, 21 Jul 2022 15:13:55 +0000 (GMT)
Received: from [9.145.177.237] (unknown [9.145.177.237])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 15:13:55 +0000 (GMT)
Message-ID: <96a72084-f918-4fb7-7685-6cabfe5d2d34@linux.ibm.com>
Date: Thu, 21 Jul 2022 17:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 07/14] dump: Swap segment and section header locations
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
 <20220721132256.2171-8-frankja@linux.ibm.com>
 <CAMxuvaz7uzVAX5RYUyh5E4vPfWsV+-FdFgDKakn+BfRHCX5c_A@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <CAMxuvaz7uzVAX5RYUyh5E4vPfWsV+-FdFgDKakn+BfRHCX5c_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Cmb1CWXq_Kq8CCGQlrOf2tjMnM3Fb9d-
X-Proofpoint-GUID: 1kNrZVyAQMoiBrc7MtkSHIGejoHsMy-W
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

T24gNy8yMS8yMiAxNzowNywgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBIaQ0KPiAN
Cj4gT24gVGh1LCBKdWwgMjEsIDIwMjIgYXQgNToyMyBQTSBKYW5vc2NoIEZyYW5rIDxmcmFu
a2phQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPj4NCj4+IEZvciB0aGUgdXBjb21pbmcgc3Ry
aW5nIHRhYmxlIGFuZCBhcmNoIHNlY3Rpb24gc3VwcG9ydCB3ZSBuZWVkIHRvDQo+PiBtb2Rp
ZnkgdGhlIGVsZiBsYXlvdXQgYSBiaXQuIEluc3RlYWQgb2YgdGhlIHNlZ21lbnRzLCBpLmUu
IHRoZSBndWVzdCdzDQo+PiBtZW1vcnkgY29udGVudHMsIGJlZWluZyB0aGUgbGFzdCBhcmVh
IHRoZSBzZWN0aW9uIGRhdGEgd2lsbCBsaXZlIGF0DQo+PiB0aGUgZW5kIG9mIHRoZSBmaWxl
LiBUaGlzIHdpbGwgYWxsb3cgdXMgdG8gd3JpdGUgdGhlIHNlY3Rpb24gZGF0YQ0KPj4gYWZ0
ZXIgYWxsIGd1ZXN0IG1lbW9yeSBoYXMgYmVlbiBkdW1wZWQgd2hpY2ggaXMgaW1wb3J0YW50
IGZvciB0aGUgczM5MA0KPj4gUFYgZHVtcCBzdXBwb3J0Lg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXguaWJtLmNvbT4NCj4+IC0tLQ0KPj4g
ICBkdW1wL2R1bXAuYyB8IDIxICsrKysrKysrKysrKy0tLS0tLS0tLQ0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHVtcC9kdW1wLmMgYi9kdW1wL2R1bXAuYw0KPj4gaW5kZXggOTgwNzAyZDQ3
Ni4uNmYzMjc0YzVhZiAxMDA2NDQNCj4+IC0tLSBhL2R1bXAvZHVtcC5jDQo+PiArKysgYi9k
dW1wL2R1bXAuYw0KPj4gQEAgLTU5MCw2ICs1OTAsOSBAQCBzdGF0aWMgdm9pZCBkdW1wX2Jl
Z2luKER1bXBTdGF0ZSAqcywgRXJyb3IgKiplcnJwKQ0KPj4gICAgICAgICogICAtLS0tLS0t
LS0tLS0tLQ0KPj4gICAgICAgICogICB8ICBtZW1vcnkgICAgIHwNCj4+ICAgICAgICAqICAg
LS0tLS0tLS0tLS0tLS0NCj4+ICsgICAgICogICB8ICBzZWN0biBkYXRhIHwNCj4+ICsgICAg
ICogICAtLS0tLS0tLS0tLS0tLQ0KPj4gKw0KPj4gICAgICAgICoNCj4+ICAgICAgICAqIHdl
IG9ubHkga25vdyB3aGVyZSB0aGUgbWVtb3J5IGlzIHNhdmVkIGFmdGVyIHdlIHdyaXRlIGVs
ZiBub3RlIGludG8NCj4+ICAgICAgICAqIHZtY29yZS4NCj4+IEBAIC0xODE3LDE4ICsxODIw
LDE4IEBAIHN0YXRpYyB2b2lkIGR1bXBfaW5pdChEdW1wU3RhdGUgKnMsIGludCBmZCwgYm9v
bCBoYXNfZm9ybWF0LA0KPj4gICAgICAgICAgIH0NCj4+ICAgICAgIH0NCj4+DQo+PiArICAg
IHRtcCA9IChzLT5waGRyX251bSA9PSBQTl9YTlVNKSA/IHMtPnNoX2luZm8gOiBzLT5waGRy
X251bTsNCj4+ICAgICAgIGlmIChkdW1wX2lzXzY0Yml0KHMpKSB7DQo+PiAtICAgICAgICBz
LT5waGRyX29mZnNldCA9IHNpemVvZihFbGY2NF9FaGRyKTsNCj4+IC0gICAgICAgIHMtPnNo
ZHJfb2Zmc2V0ID0gcy0+cGhkcl9vZmZzZXQgKyBzaXplb2YoRWxmNjRfUGhkcikgKiBzLT5w
aGRyX251bTsNCj4+IC0gICAgICAgIHMtPm5vdGVfb2Zmc2V0ID0gcy0+c2hkcl9vZmZzZXQg
KyBzaXplb2YoRWxmNjRfU2hkcikgKiBzLT5zaGRyX251bTsNCj4+IC0gICAgICAgIHMtPm1l
bW9yeV9vZmZzZXQgPSBzLT5ub3RlX29mZnNldCArIHMtPm5vdGVfc2l6ZTsNCj4+ICsgICAg
ICAgIHMtPnNoZHJfb2Zmc2V0ID0gc2l6ZW9mKEVsZjY0X0VoZHIpOw0KPj4gKyAgICAgICAg
cy0+cGhkcl9vZmZzZXQgPSBzLT5zaGRyX29mZnNldCArIHNpemVvZihFbGY2NF9TaGRyKSAq
IHMtPnNoZHJfbnVtOw0KPj4gKyAgICAgICAgcy0+bm90ZV9vZmZzZXQgPSBzLT5waGRyX29m
ZnNldCArIHNpemVvZihFbGY2NF9QaGRyKSAqIHRtcDsNCj4+ICAgICAgIH0gZWxzZSB7DQo+
PiAtDQo+PiAtICAgICAgICBzLT5waGRyX29mZnNldCA9IHNpemVvZihFbGYzMl9FaGRyKTsN
Cj4+IC0gICAgICAgIHMtPnNoZHJfb2Zmc2V0ID0gcy0+cGhkcl9vZmZzZXQgKyBzaXplb2Yo
RWxmMzJfUGhkcikgKiBzLT5waGRyX251bTsNCj4+IC0gICAgICAgIHMtPm5vdGVfb2Zmc2V0
ID0gcy0+c2hkcl9vZmZzZXQgKyBzaXplb2YoRWxmMzJfU2hkcikgKiBzLT5zaGRyX251bTsN
Cj4+IC0gICAgICAgIHMtPm1lbW9yeV9vZmZzZXQgPSBzLT5ub3RlX29mZnNldCArIHMtPm5v
dGVfc2l6ZTsNCj4+ICsgICAgICAgIHMtPnNoZHJfb2Zmc2V0ID0gc2l6ZW9mKEVsZjMyX0Vo
ZHIpOw0KPj4gKyAgICAgICAgcy0+cGhkcl9vZmZzZXQgPSBzLT5zaGRyX29mZnNldCArIHNp
emVvZihFbGYzMl9TaGRyKSAqIHMtPnNoZHJfbnVtOw0KPj4gKyAgICAgICAgcy0+bm90ZV9v
ZmZzZXQgPSBzLT5waGRyX29mZnNldCArIHNpemVvZihFbGYzMl9QaGRyKSAqIHRtcDsNCj4+
ICAgICAgIH0NCj4+ICsgICAgcy0+bWVtb3J5X29mZnNldCA9IHMtPm5vdGVfb2Zmc2V0ICsg
cy0+bm90ZV9zaXplOw0KPj4gKyAgICBzLT5zZWN0aW9uX29mZnNldCA9IHMtPm1lbW9yeV9v
ZmZzZXQgKyBzLT50b3RhbF9zaXplOw0KPiANCj4gQWghIHNlY3Rpb25fb2Zmc2V0IHdhcyBh
Y3R1YWxseSBhZGRlZCBmcm9tIGNvbW1pdCBlNzFkMzUzMzYwICgiZHVtcDoNCj4gQWRkIG1v
cmUgb2Zmc2V0IHZhcmlhYmxlcyIpLCBidXQgdW51c2VkIHVudGlsIG5vdy4gSXQncyB3b3J0
aA0KPiBleHBsYWluaW5nIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCg0KSSB0aGluayBJJ2xs
IGp1c3QgbW92ZSBpdCB0byB0aGlzIHBhdGNoIHNvIHRoZSBwcmV2aW91cyBvbmUgcmVhbGx5
IG9ubHkgDQpkb2VzIHJlLW9yZGVyaW5nIGFuZCBkb2Vzbid0IGludHJvZHVjZSBuZXcgc3Ry
dWN0IG1lbWJlcnMuDQoNCj4gDQo+Pg0KPj4gICAgICAgcmV0dXJuOw0KPj4NCj4+IC0tDQo+
PiAyLjM0LjENCj4+DQo+IA0KPiANCg0K

