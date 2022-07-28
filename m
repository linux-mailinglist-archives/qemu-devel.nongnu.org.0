Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2693E5839CF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 09:48:55 +0200 (CEST)
Received: from localhost ([::1]:46362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGyGM-0007E2-6i
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 03:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGy2q-0000tU-9w; Thu, 28 Jul 2022 03:34:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGy2j-0005gm-1l; Thu, 28 Jul 2022 03:34:55 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26S7MnJc027000;
 Thu, 28 Jul 2022 07:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Y4/Shh0ZXSH2VP0Pjc1YiZhorYTtmP6x84wdMKwhqbo=;
 b=OwQO+otrXNIcCmWQo8KMJvqkCatEyvQxAZeof1gHJDGackH1Q7eNlvBzF+pCvTOFlRyr
 26dn3+FiwniZnlBT/x9NsVWG9fZ3JEGbBt92AdCvU7YF4OXM7tRNmkpzvScrPyMEWBvQ
 okfwrsp84FXdYv83x4M9b4lmQT/R1J5iLJuV62ns8aQVy0xgB1rZ4GjHsTeH93Tb0GWT
 egXnChMlGSvzSd6UNjobut503Nt8U+NDgY9KlhsYBUB1dtMCpXdK1HnA9gSXDUTPNzY3
 U6loigNFgPbm+1H6GmjzWDwdPTj0OPy+t3X4ndYA9WVx9jlDR7xLzKG6ToIqJKPBWLEh CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hkp100acj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jul 2022 07:34:45 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26S7Nikq028246;
 Thu, 28 Jul 2022 07:34:44 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hkp100a9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jul 2022 07:34:44 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26S7Vpcb001439;
 Thu, 28 Jul 2022 07:34:38 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3hg98fj4um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jul 2022 07:34:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26S7Yngf27132412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jul 2022 07:34:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E1624C04A;
 Thu, 28 Jul 2022 07:34:35 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D87874C044;
 Thu, 28 Jul 2022 07:34:34 +0000 (GMT)
Received: from [9.145.67.28] (unknown [9.145.67.28])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jul 2022 07:34:34 +0000 (GMT)
Message-ID: <67258c43-3321-515f-671c-fe34cb23a232@linux.ibm.com>
Date: Thu, 28 Jul 2022 09:34:34 +0200
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
 <20220726092248.128336-13-frankja@linux.ibm.com>
 <CAMxuvazpXtOjWH_OoBDAj0VB4gjGAcy4ozv_oouRYtcZ_+MZvQ@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v4 12/17] dump/dump: Add arch section support
In-Reply-To: <CAMxuvazpXtOjWH_OoBDAj0VB4gjGAcy4ozv_oouRYtcZ_+MZvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Gx925YwfNeG1TjkNATTjBSax7uewb_x4
X-Proofpoint-GUID: QFRG04ZfTD-1napaS6Jsk0wKcDmdgk2T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_01,2022-07-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207280030
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

T24gNy8yNi8yMiAxMzozMCwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBIaQ0KPiAN
Cj4gT24gVHVlLCBKdWwgMjYsIDIwMjIgYXQgMToyMyBQTSBKYW5vc2NoIEZyYW5rIDxmcmFu
a2phQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPj4NCj4+IEFkZCBob29rcyB3aGljaCBhcmNo
aXRlY3R1cmVzIGNhbiB1c2UgdG8gYWRkIGFyYml0cmFyeSBkYXRhIHRvIGN1c3RvbQ0KPj4g
c2VjdGlvbnMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFub3NjaCBGcmFuayA8ZnJhbmtq
YUBsaW51eC5pYm0uY29tPg0KPj4gLS0tDQo+PiAgIGR1bXAvZHVtcC5jICAgICAgICAgICAg
ICAgIHwgIDUgKysrKysNCj4+ICAgaW5jbHVkZS9zeXNlbXUvZHVtcC1hcmNoLmggfCAyNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBp
bnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2R1bXAvZHVtcC5jIGIvZHVtcC9k
dW1wLmMNCj4+IGluZGV4IDI5OGExZTkyM2YuLjFlYzRjM2I2YzMgMTAwNjQ0DQo+PiAtLS0g
YS9kdW1wL2R1bXAuYw0KPj4gKysrIGIvZHVtcC9kdW1wLmMNCj4+IEBAIC0zOTgsNiArMzk4
LDcgQEAgc3RhdGljIHZvaWQgcHJlcGFyZV9lbGZfc2VjdGlvbl9oZHJzKER1bXBTdGF0ZSAq
cykNCj4+ICAgICAgIC8qDQo+PiAgICAgICAgKiBTZWN0aW9uIG9yZGVyaW5nOg0KPj4gICAg
ICAgICogLSBIRFIgemVybyAoaWYgbmVlZGVkKQ0KPj4gKyAgICAgKiAtIEFyY2ggc2VjdGlv
biBoZHJzDQo+PiAgICAgICAgKiAtIFN0cmluZyB0YWJsZSBoZHINCj4+ICAgICAgICAqLw0K
Pj4gICAgICAgc2l6ZW9mX3NoZHIgPSBkdW1wX2lzXzY0Yml0KHMpID8gc2l6ZW9mKEVsZjY0
X1NoZHIpIDogc2l6ZW9mKEVsZjMyX1NoZHIpOw0KPj4gQEAgLTQxNSw2ICs0MTYsOCBAQCBz
dGF0aWMgdm9pZCBwcmVwYXJlX2VsZl9zZWN0aW9uX2hkcnMoRHVtcFN0YXRlICpzKQ0KPj4g
ICAgICAgICAgIHJldHVybjsNCj4+ICAgICAgIH0NCj4+DQo+PiArICAgIGJ1ZmZfaGRyICs9
IGR1bXBfYXJjaF9zZWN0aW9uc193cml0ZV9oZHIoJnMtPmR1bXBfaW5mbywgcywgYnVmZl9o
ZHIpOw0KPj4gKw0KPj4gICAgICAgLyoNCj4+ICAgICAgICAqIFN0cmluZyB0YWJsZSBuZWVk
cyB0byBiZSBsYXN0IHNlY3Rpb24gc2luY2Ugc3RyaW5ncyBhcmUgYWRkZWQNCj4+ICAgICAg
ICAqIHZpYSBhcmNoX3NlY3Rpb25zX3dyaXRlX2hkcigpLg0KPj4gQEAgLTc1OCw2ICs3NjEs
NyBAQCBzdGF0aWMgdm9pZCBkdW1wX2VuZChEdW1wU3RhdGUgKnMsIEVycm9yICoqZXJycCkN
Cj4+ICAgICAgICAgICByZXR1cm47DQo+PiAgICAgICB9DQo+PiAgICAgICBzLT5lbGZfc2Vj
dGlvbl9kYXRhID0gZ19tYWxsb2MwKHMtPmVsZl9zZWN0aW9uX2RhdGFfc2l6ZSk7DQo+PiAr
ICAgIGR1bXBfYXJjaF9zZWN0aW9uc193cml0ZSgmcy0+ZHVtcF9pbmZvLCBzLCBzLT5lbGZf
c2VjdGlvbl9kYXRhKTsNCj4+DQo+PiAgICAgICAvKiB3cml0ZSBzZWN0aW9ucyB0byB2bWNv
cmUgKi8NCj4+ICAgICAgIHdyaXRlX2VsZl9zZWN0aW9ucyhzLCBlcnJwKTsNCj4+IEBAIC0x
OTI5LDYgKzE5MzMsNyBAQCBzdGF0aWMgdm9pZCBkdW1wX2luaXQoRHVtcFN0YXRlICpzLCBp
bnQgZmQsIGJvb2wgaGFzX2Zvcm1hdCwNCj4+ICAgICAgICAqIElmIHBoZHJfbnVtIG92ZXJm
bG93ZWQgd2UgaGF2ZSBhdCBsZWFzdCBvbmUgc2VjdGlvbiBoZWFkZXINCj4+ICAgICAgICAq
IE1vcmUgc2VjdGlvbnMvaGRycyBjYW4gYmUgYWRkZWQgYnkgdGhlIGFyY2hpdGVjdHVyZXMN
Cj4+ICAgICAgICAqLw0KPj4gKyAgICBkdW1wX2FyY2hfc2VjdGlvbnNfYWRkKCZzLT5kdW1w
X2luZm8sICh2b2lkICopcyk7DQo+PiAgICAgICBpZiAocy0+c2hkcl9udW0gPiAxKSB7DQo+
PiAgICAgICAgICAgLyogUmVzZXJ2ZSB0aGUgc3RyaW5nIHRhYmxlICovDQo+PiAgICAgICAg
ICAgcy0+c2hkcl9udW0gKz0gMTsNCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3N5c2VtdS9k
dW1wLWFyY2guaCBiL2luY2x1ZGUvc3lzZW11L2R1bXAtYXJjaC5oDQo+PiBpbmRleCBlMjVi
MDJlOTkwLi5kZTc3OTA4NDI0IDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9zeXNlbXUvZHVt
cC1hcmNoLmgNCj4+ICsrKyBiL2luY2x1ZGUvc3lzZW11L2R1bXAtYXJjaC5oDQo+PiBAQCAt
MjEsNiArMjEsOSBAQCB0eXBlZGVmIHN0cnVjdCBBcmNoRHVtcEluZm8gew0KPj4gICAgICAg
dWludDMyX3QgcGFnZV9zaXplOyAgICAgIC8qIFRoZSB0YXJnZXQncyBwYWdlIHNpemUuIElm
IGl0J3MgdmFyaWFibGUgYW5kDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICogdW5rbm93biwgdGhlbiB0aGlzIHNob3VsZCBiZSB0aGUgbWF4aW11bS4gKi8NCj4+ICAg
ICAgIHVpbnQ2NF90IHBoeXNfYmFzZTsgICAgICAvKiBUaGUgdGFyZ2V0J3MgcGh5c21lbSBi
YXNlLiAqLw0KPj4gKyAgICB2b2lkICgqYXJjaF9zZWN0aW9uc19hZGRfZm4pKHZvaWQgKm9w
YXF1ZSk7DQo+PiArICAgIHVpbnQ2NF90ICgqYXJjaF9zZWN0aW9uc193cml0ZV9oZHJfZm4p
KHZvaWQgKm9wYXF1ZSwgdWludDhfdCAqYnVmZik7DQo+PiArICAgIHZvaWQgKCphcmNoX3Nl
Y3Rpb25zX3dyaXRlX2ZuKSh2b2lkICpvcGFxdWUsIHVpbnQ4X3QgKmJ1ZmYpOw0KPiANCj4g
V2h5IG5vdCBwYXNzIER1bXBTdGF0ZT8gSWYgdGhlcmUgaXMgYW4gaXNzdWUgd2l0aCBoZWFk
ZXIgZGVjbGFyYXRpb24NCj4gb3JkZXIsIHlvdSBjYW4gYWx3YXlzIG1vdmUgdGhlIGRlY2xh
cmF0aW9uIGluIGluY2x1ZGUvcWVtdS90eXBlZGVmcy5oLA0KPiBJIGd1ZXNzLg0KDQpUaGUg
Q1BVIG5vdGUgZnVuY3Rpb24gcGFzc2VzIHRoZSBvcGFxdWUgcG9pbnRlciBzbyBJIGRpZCBh
cyB0aGUgc2FtZS4NCklmIHlvdSB3YW50IEkgY2FuIGhhdmUgYSBsb29rIGlmIGl0IG1ha2Vz
IHNlbnNlIHRvIG1vdmUgb3ZlciB0byBEdW1wU3RhdGUuDQoNCj4gDQo+PiAgIH0gQXJjaER1
bXBJbmZvOw0KPj4NCj4+ICAgc3RydWN0IEd1ZXN0UGh5c0Jsb2NrTGlzdDsgLyogbWVtb3J5
X21hcHBpbmcuaCAqLw0KPj4gQEAgLTI4LDQgKzMxLDI4IEBAIGludCBjcHVfZ2V0X2R1bXBf
aW5mbyhBcmNoRHVtcEluZm8gKmluZm8sDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgR3Vlc3RQaHlzQmxvY2tMaXN0ICpndWVzdF9waHlzX2Jsb2Nrcyk7DQo+
PiAgIHNzaXplX3QgY3B1X2dldF9ub3RlX3NpemUoaW50IGNsYXNzLCBpbnQgbWFjaGluZSwg
aW50IG5yX2NwdXMpOw0KPj4NCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgZHVtcF9hcmNoX3Nl
Y3Rpb25zX2FkZChBcmNoRHVtcEluZm8gKmluZm8sIHZvaWQgKm9wYXF1ZSkNCj4+ICt7DQo+
PiArICAgIGlmIChpbmZvLT5hcmNoX3NlY3Rpb25zX2FkZF9mbikgew0KPj4gKyAgICAgICAg
aW5mby0+YXJjaF9zZWN0aW9uc19hZGRfZm4ob3BhcXVlKTsNCj4+ICsgICAgfQ0KPj4gK30N
Cj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGR1bXBfYXJjaF9zZWN0aW9uc193
cml0ZV9oZHIoQXJjaER1bXBJbmZvICppbmZvLA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKm9wYXF1ZSwgdWludDhfdCAqYnVm
ZikNCj4+ICt7DQo+PiArICAgIGlmIChpbmZvLT5hcmNoX3NlY3Rpb25zX3dyaXRlX2hkcl9m
bikgew0KPj4gKyAgICAgICAgcmV0dXJuIGluZm8tPmFyY2hfc2VjdGlvbnNfd3JpdGVfaGRy
X2ZuKG9wYXF1ZSwgYnVmZik7DQo+PiArICAgIH0NCj4+ICsgICAgcmV0dXJuIDA7DQo+PiAr
fQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBkdW1wX2FyY2hfc2VjdGlvbnNfd3Jp
dGUoQXJjaER1bXBJbmZvICppbmZvLCB2b2lkICpvcGFxdWUsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90ICpidWZmKQ0KPj4gK3sN
Cj4+ICsgICAgaWYgKGluZm8tPmFyY2hfc2VjdGlvbnNfd3JpdGVfZm4pIHsNCj4+ICsgICAg
ICAgIGluZm8tPmFyY2hfc2VjdGlvbnNfd3JpdGVfZm4ob3BhcXVlLCBidWZmKTsNCj4+ICsg
ICAgfQ0KPj4gK30NCj4gDQo+IFdlIHByb2JhYmx5IGRvbid0IG5lZWQgdGhvc2Ugc3RhdGlj
IGlubGluZSBoZWxwZXJzIGluIHRoZSBoZWFkZXIuDQo+IA0KDQo=

