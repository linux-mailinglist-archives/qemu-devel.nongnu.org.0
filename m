Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47E574C9C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 13:56:42 +0200 (CEST)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBxST-0002AH-Tt
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 07:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBxPm-0000gu-3J; Thu, 14 Jul 2022 07:53:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8268
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBxPj-00081v-W3; Thu, 14 Jul 2022 07:53:53 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EBXNYW008641;
 Thu, 14 Jul 2022 11:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=W0BPW3pijptaiycxInL+4lKisJlEN6QWYvx11Cjk6aA=;
 b=lZjxr/jyOGztrjvSUUC3DRsgQsKyzf+5xZMD8LJ9tMVPgKgAJcZZc/e+1c0lHIyw9YqD
 wUhsEE2U9qJLSsRn4wiCwU33V+8PKkJRzgpwXtgegoIfj4Hg2oPMC2Z1wciGR5AD4xB1
 987/xExLC8UBkq6F2nWa9lSYYudeKg764mRGewInIdPvETv7taDaGnpT4vNITlfmWGHM
 rnMQF6NFJ2/6Rvn+1LptD0lNbj5cyZT7U0dj63hHITKGbKGSAFRYcJRfrVEoaa5pq97I
 emLvhddEUhfEg6NEw/M61KymO8+RqQXjsI0he920vnSTqYL/S2CnYalmCeSOlKCsbdra ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hahsd99nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 11:53:49 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26EBoOLn030377;
 Thu, 14 Jul 2022 11:53:49 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hahsd99my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 11:53:49 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26EBoF9X028624;
 Thu, 14 Jul 2022 11:53:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3h70xhy20t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 11:53:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26EBqA2W12714466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 11:52:10 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0609A405F;
 Thu, 14 Jul 2022 11:53:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 629B8A4054;
 Thu, 14 Jul 2022 11:53:43 +0000 (GMT)
Received: from [9.145.62.186] (unknown [9.145.62.186])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jul 2022 11:53:43 +0000 (GMT)
Message-ID: <39c9c903-a2dc-6799-b77c-825f9bde069e@linux.ibm.com>
Date: Thu, 14 Jul 2022 13:53:42 +0200
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
 "Henderson, Richard" <richard.henderson@linaro.org>
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-6-frankja@linux.ibm.com>
 <CAMxuvawZehnqK=UN03nKEdtwL7yySKgb6GG5GV1S3CT_d0_iyg@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v2 05/11] dump/dump: Add section string table support
In-Reply-To: <CAMxuvawZehnqK=UN03nKEdtwL7yySKgb6GG5GV1S3CT_d0_iyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eVt-ffJH_ebOqYMfSjhrkoOw9_Iy1BFr
X-Proofpoint-ORIG-GUID: OwkUdGmxwU-Yt6mOTLObfK-S_aw6P5Ar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_08,2022-07-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207140048
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
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

T24gNy8xMy8yMiAxNzo1OCwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBIaQ0KPiAN
Cj4gT24gV2VkLCBKdWwgMTMsIDIwMjIgYXQgNTowNyBQTSBKYW5vc2NoIEZyYW5rIDxmcmFu
a2phQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPj4NCj4+IFRpbWUgdG8gYWRkIGEgYml0IG1v
cmUgZGVzY3JpcHRpdmVuZXNzIHRvIHRoZSBkdW1wcy4NCj4gDQo+IFBsZWFzZSBhZGQgc29t
ZSBtb3JlIGRlc2NyaXB0aW9uICYgbW90aXZhdGlvbiB0byB0aGUgcGF0Y2ggKHN1cHBvc2Vk
bHkNCj4gbmVjZXNzYXJ5IGZvciBuZXh0IHBhdGNoZXMpLCBhbmQgZXhwbGFpbiB0aGF0IGl0
IGN1cnJlbnRseSBkb2Vzbid0DQo+IGNoYW5nZSB0aGUgZHVtcCAoYWZhaWN0KS4NCg0KSG93
IGFib3V0Og0KDQpBcyBzZWN0aW9ucyBkb24ndCBoYXZlIGEgdHlwZSBsaWtlIHRoZSBub3Rl
cyBkbyB3ZSBuZWVkIGFub3RoZXIgd2F5IHRvIA0KZGV0ZXJtaW5lIHRoZWlyIGNvbnRlbnRz
LiBUaGUgc3RyaW5nIHRhYmxlIGFsbG93cyB1cyB0byBhc3NpZ24gZWFjaCANCnNlY3Rpb24g
YW4gaWRlbnRpZmljYXRpb24gc3RyaW5nIHdoaWNoIGFyY2hpdGVjdHVyZXMgY2FuIHRoZW4g
dXNlIHRvIHRhZyANCnRoZWlyIHNlY3Rpb25zIHdpdGguDQoNClRoZXJlIHdpbGwgYmUgbm8g
c3RyaW5nIHRhYmxlIGlmIHRoZSBhcmNoaXRlY3R1cmUgZG9lc24ndCBhZGQgY3VzdG9tIA0K
c2VjdGlvbnMgd2hpY2ggYXJlIGludHJvZHVjZWQgaW4gYSBmb2xsb3dpbmcgcGF0Y2guDQoN
Cg0KPj4NCj4+IC0gICAgaWYgKGR1bXBfaXNfNjRiaXQocykpIHsNCj4+IC0gICAgICAgIHMt
PnBoZHJfb2Zmc2V0ID0gc2l6ZW9mKEVsZjY0X0VoZHIpOw0KPj4gLSAgICAgICAgcy0+c2hk
cl9vZmZzZXQgPSBzLT5waGRyX29mZnNldCArIHNpemVvZihFbGY2NF9QaGRyKSAqIHMtPnBo
ZHJfbnVtOw0KPj4gLSAgICAgICAgcy0+bm90ZV9vZmZzZXQgPSBzLT5zaGRyX29mZnNldCAr
IHNpemVvZihFbGY2NF9TaGRyKSAqIHMtPnNoZHJfbnVtOw0KPj4gLSAgICAgICAgcy0+bWVt
b3J5X29mZnNldCA9IHMtPm5vdGVfb2Zmc2V0ICsgcy0+bm90ZV9zaXplOw0KPj4gLSAgICB9
IGVsc2Ugew0KPj4gLQ0KPj4gLSAgICAgICAgcy0+cGhkcl9vZmZzZXQgPSBzaXplb2YoRWxm
MzJfRWhkcik7DQo+PiAtICAgICAgICBzLT5zaGRyX29mZnNldCA9IHMtPnBoZHJfb2Zmc2V0
ICsgc2l6ZW9mKEVsZjMyX1BoZHIpICogcy0+cGhkcl9udW07DQo+PiAtICAgICAgICBzLT5u
b3RlX29mZnNldCA9IHMtPnNoZHJfb2Zmc2V0ICsgc2l6ZW9mKEVsZjMyX1NoZHIpICogcy0+
c2hkcl9udW07DQo+PiAtICAgICAgICBzLT5tZW1vcnlfb2Zmc2V0ID0gcy0+bm90ZV9vZmZz
ZXQgKyBzLT5ub3RlX3NpemU7DQo+PiArICAgIC8qDQo+PiArICAgICAqIGNhbGN1bGF0ZSBz
aGRyX251bSBhbmQgZWxmX3NlY3Rpb25fZGF0YV9zaXplIHNvIHdlIGtub3cgdGhlIG9mZnNl
dHMgYW5kDQo+PiArICAgICAqIHNpemVzIG9mIGFsbCBwYXJ0cy4NCj4+ICsgICAgICoNCj4+
ICsgICAgICogSWYgcGhkcl9udW0gb3ZlcmZsb3dlZCB3ZSBoYXZlIGF0IGxlYXN0IG9uZSBz
ZWN0aW9uIGhlYWRlcg0KPj4gKyAgICAgKiBNb3JlIHNlY3Rpb25zL2hkcnMgY2FuIGJlIGFk
ZGVkIGJ5IHRoZSBhcmNoaXRlY3R1cmVzDQo+PiArICAgICAqLw0KPj4gKyAgICBpZiAocy0+
c2hkcl9udW0gPiAxKSB7DQo+PiArICAgICAgICAvKiBSZXNlcnZlIHRoZSBzdHJpbmcgdGFi
bGUgKi8NCj4+ICsgICAgICAgIHMtPnNoZHJfbnVtICs9IDE7DQo+PiAgICAgICB9DQo+Pg0K
Pj4gKyAgICB0bXAgPSAocy0+cGhkcl9udW0gPT0gUE5fWE5VTSkgPyBzLT5zaF9pbmZvIDog
cy0+cGhkcl9udW07DQo+PiArICAgIGlmIChkdW1wX2lzXzY0Yml0KHMpKSB7DQo+PiArICAg
ICAgICBzLT5zaGRyX29mZnNldCA9IHNpemVvZihFbGY2NF9FaGRyKTsNCj4+ICsgICAgICAg
IHMtPnBoZHJfb2Zmc2V0ID0gcy0+c2hkcl9vZmZzZXQgKyBzaXplb2YoRWxmNjRfU2hkcikg
KiBzLT5zaGRyX251bTsNCj4+ICsgICAgICAgIHMtPm5vdGVfb2Zmc2V0ID0gcy0+cGhkcl9v
ZmZzZXQgKyBzaXplb2YoRWxmNjRfUGhkcikgKiB0bXA7DQo+PiArICAgIH0gZWxzZSB7DQo+
PiArICAgICAgICBzLT5zaGRyX29mZnNldCA9IHNpemVvZihFbGYzMl9FaGRyKTsNCj4+ICsg
ICAgICAgIHMtPnBoZHJfb2Zmc2V0ID0gcy0+c2hkcl9vZmZzZXQgKyBzaXplb2YoRWxmMzJf
U2hkcikgKiBzLT5zaGRyX251bTsNCj4+ICsgICAgICAgIHMtPm5vdGVfb2Zmc2V0ID0gcy0+
cGhkcl9vZmZzZXQgKyBzaXplb2YoRWxmMzJfUGhkcikgKiB0bXA7DQo+PiArICAgIH0NCj4+
ICsgICAgcy0+bWVtb3J5X29mZnNldCA9IHMtPm5vdGVfb2Zmc2V0ICsgcy0+bm90ZV9zaXpl
Ow0KPiANCj4gSSBzdWdnZXN0IHRvIHNwbGl0IHRoaXMgaW4gYSBkaWZmZXJlbnQgcGF0Y2gu
IEl0J3Mgbm90IG9idmlvdXMgdGhhdA0KPiB5b3UgY2FuIGNoYW5nZSBwaGRyX29mZnNldCAv
IHNoZHJfb2Zmc2V0LCBpdCBkZXNlcnZlcyBhIGNvbW1lbnQuDQoNClJpZ2h0LCB3aWxsIGRv
DQoNCj4gDQo+PiArICAgIHMtPnNlY3Rpb25fb2Zmc2V0ID0gcy0+bWVtb3J5X29mZnNldCAr
IHMtPnRvdGFsX3NpemU7DQo+PiArDQo+PiAgICAgICByZXR1cm47DQo+Pg0KPj4gICBjbGVh
bnVwOg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc3lzZW11L2R1bXAuaCBiL2luY2x1ZGUv
c3lzZW11L2R1bXAuaA0KPj4gaW5kZXggODM3OWUyOWVmNi4uMmMyNWM3ZDMwOSAxMDA2NDQN
Cj4+IC0tLSBhL2luY2x1ZGUvc3lzZW11L2R1bXAuaA0KPj4gKysrIGIvaW5jbHVkZS9zeXNl
bXUvZHVtcC5oDQo+PiBAQCAtMTc4LDYgKzE3OCw3IEBAIHR5cGVkZWYgc3RydWN0IER1bXBT
dGF0ZSB7DQo+PiAgICAgICB2b2lkICplbGZfc2VjdGlvbl9oZHJzOw0KPj4gICAgICAgdWlu
dDY0X3QgZWxmX3NlY3Rpb25fZGF0YV9zaXplOw0KPj4gICAgICAgdm9pZCAqZWxmX3NlY3Rp
b25fZGF0YTsNCj4+ICsgICAgR0FycmF5ICpzdHJpbmdfdGFibGVfYnVmOyAgLyogU3RyaW5n
IHRhYmxlIHNlY3Rpb24gKi8NCj4+DQo+PiAgICAgICB1aW50OF90ICpub3RlX2J1ZjsgICAg
ICAgICAgLyogYnVmZmVyIGZvciBub3RlcyAqLw0KPj4gICAgICAgc2l6ZV90IG5vdGVfYnVm
X29mZnNldDsgICAgIC8qIHRoZSB3cml0aW5nIHBsYWNlIGluIG5vdGVfYnVmICovDQo+PiAt
LQ0KPj4gMi4zNC4xDQo+Pg0KPiANCg0K

