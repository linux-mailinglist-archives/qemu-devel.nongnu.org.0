Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3D34C8F9D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 17:02:42 +0100 (CET)
Received: from localhost ([::1]:57140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP4xV-0000j9-Hu
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 11:02:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP4vg-0007Zi-Ke
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:00:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12568
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP4ve-0006c2-Oe
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:00:48 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221FgVXp020126
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 16:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Y3BCVDEtUVhc909sltg1jQ3Ryqs7uHXtY+dRzg5rfg0=;
 b=IoBwggiFMEx9Yxu2U43LWfrd39/DobXQwj3G7uvKItm+MZL2dbtfjUDJALEViUk8OyMf
 4UULBKFEpu9uF6XfWVb4WI30oLq3Mo7oHMpbJYHr/VigZA720Y6OTgevxTqzQ4j7BeSO
 Z4lzxJWuVF4gUrxKpRx9g9X0MvpyUV5WerFknDZmrv6dXmrUiqmxhc/ZL3GrpQGdXo7O
 IRd4ZWcHMctqA29+wr3SVxThjnUqgP8ZEMfEu1ieFV5wy/DrC6W45q7DxK8k/IQraKTZ
 Sy7K3xix0JEflVCkiRY6Sw7fRG0aMy8kuTAYIXHWWyR9gCs50qJrX4871PUMHyZKyCtE iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehpc98er0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 16:00:44 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221FgVUp020170
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 16:00:44 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehpc98epx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 16:00:44 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221FveYh007220;
 Tue, 1 Mar 2022 16:00:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9b236-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 16:00:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221G0eXh57082308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 16:00:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CDF6AE04D;
 Tue,  1 Mar 2022 16:00:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFB75AE055;
 Tue,  1 Mar 2022 16:00:39 +0000 (GMT)
Received: from [9.145.4.65] (unknown [9.145.4.65])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 16:00:39 +0000 (GMT)
Message-ID: <0fece214-179c-bbea-c383-cf6a34aee825@linux.ibm.com>
Date: Tue, 1 Mar 2022 17:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220301142213.28568-1-frankja@linux.ibm.com>
 <20220301142213.28568-6-frankja@linux.ibm.com>
 <CAJ+F1CLsQ5vwOdwURSuLAp_afSk-hffJC1wEYH7zVFiiLEXmfw@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH 5/7] dump: Consolidate phdr note writes
In-Reply-To: <CAJ+F1CLsQ5vwOdwURSuLAp_afSk-hffJC1wEYH7zVFiiLEXmfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MECIkerqI6N0nMjGE1pNS-juyMuYNteT
X-Proofpoint-GUID: LgylRM5scI2pQWvv9Cetdr9AP8nNqC3X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=872 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010082
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMy8xLzIyIDE1OjMwLCBNYXJjLUFuZHLDqSBMdXJlYXUgd3JvdGU6DQo+IEhpDQo+IA0K
PiBPbiBUdWUsIE1hciAxLCAyMDIyIGF0IDY6MjYgUE0gSmFub3NjaCBGcmFuayA8ZnJhbmtq
YUBsaW51eC5pYm0uY29tPiB3cm90ZToNCj4gDQo+PiBUaGVyZSdzIG5vIG5lZWQgdG8gaGF2
ZSB0d28gd3JpdGUgZnVuY3Rpb25zLiBMZXQncyByYXRoZXIgaGF2ZSB0d28NCj4+IGZ1bmN0
aW9ucyB0aGF0IHNldCB0aGUgZGF0YSBmb3IgZWxmIDMyLzY0IGFuZCB0aGVuIHdyaXRlIGl0
IGluIGENCj4+IGNvbW1vbiBmdW5jdGlvbi4NCj4+DQo+IFNpZ25lZC1vZmYtYnk6IEphbm9z
Y2ggRnJhbmsgPGZyYW5ramFAbGludXguaWJtLmNvbT4NCj4+IC0tLQ0KPj4gICBkdW1wL2R1
bXAuYyB8IDk2ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+IA0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCA0
OCBkZWxldGlvbnMoLSkNCj4+DQo+IA0KPiBJIHN1cHBvc2UgdGhlcmUgYXJlIG90aGVyIHBh
cnRzIG9mIHRoZSBzZXJpZXMgdGhhdCBtYWtlIHVzZSBvZiB0aGF0LA0KPiBiZWNhdXNlIGFz
IHN1Y2gsIGl0J3Mgbm90IGEgY2xlYXIgaW1wcm92ZW1lbnQgdG8gbWUuDQoNCkl0J3Mgb25l
IHBpZWNlIG9mIHRoZSBlZmZvcnQgdG8gZ2V0IHJpZCBvZiB0aGF0IGJpZyBpZi9lbHNlIGlu
IA0KZHVtcF9iZWdpbigpIGFuZCB0aGF0IGZyZWVzIHRoZSB3YXkgdG8gbWFrZSByZS1vcmRl
cmluZyB0aGUgd3JpdGUgDQpmdW5jdGlvbnMgcG9zc2libGUuDQoNCkknbGwgc2VuZCBvdXQg
dGhlIG90aGVyIHR3byBzZXJpZXMgdG9tb3Jyb3cuDQoNCj4gDQo+Pg0KPiANCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvZHVtcC9kdW1wLmMgYi9kdW1wL2R1bXAuYw0KPj4gaW5kZXggYmIxNTJi
ZGRmZi4uODhjMmRiYjQ2NiAxMDA2NDQNCj4+IC0tLSBhL2R1bXAvZHVtcC5jDQo+PiArKysg
Yi9kdW1wL2R1bXAuYw0KPj4gQEAgLTIzMSwyNCArMjMxLDE1IEBAIHN0YXRpYyB2b2lkIHdy
aXRlX2VsZjMyX2xvYWQoRHVtcFN0YXRlICpzLA0KPj4gTWVtb3J5TWFwcGluZyAqbWVtb3J5
X21hcHBpbmcsDQo+PiAgICAgICB9DQo+PiAgIH0NCj4+DQo+PiAtc3RhdGljIHZvaWQgd3Jp
dGVfZWxmNjRfbm90ZShEdW1wU3RhdGUgKnMsIEVycm9yICoqZXJycCkNCj4+ICtzdGF0aWMg
dm9pZCB3cml0ZV9lbGY2NF9waGRyX25vdGUoRHVtcFN0YXRlICpzLCBFbGY2NF9QaGRyICpw
aGRyKQ0KPj4gICB7DQo+PiAtICAgIEVsZjY0X1BoZHIgcGhkcjsNCj4+IC0gICAgaW50IHJl
dDsNCj4+IC0NCj4+IC0gICAgbWVtc2V0KCZwaGRyLCAwLCBzaXplb2YoRWxmNjRfUGhkcikp
Ow0KPj4gLSAgICBwaGRyLnBfdHlwZSA9IGNwdV90b19kdW1wMzIocywgUFRfTk9URSk7DQo+
PiAtICAgIHBoZHIucF9vZmZzZXQgPSBjcHVfdG9fZHVtcDY0KHMsIHMtPm5vdGVfb2Zmc2V0
KTsNCj4+IC0gICAgcGhkci5wX3BhZGRyID0gMDsNCj4+IC0gICAgcGhkci5wX2ZpbGVzeiA9
IGNwdV90b19kdW1wNjQocywgcy0+bm90ZV9zaXplKTsNCj4+IC0gICAgcGhkci5wX21lbXN6
ID0gY3B1X3RvX2R1bXA2NChzLCBzLT5ub3RlX3NpemUpOw0KPj4gLSAgICBwaGRyLnBfdmFk
ZHIgPSAwOw0KPj4gLQ0KPj4gLSAgICByZXQgPSBmZF93cml0ZV92bWNvcmUoJnBoZHIsIHNp
emVvZihFbGY2NF9QaGRyKSwgcyk7DQo+PiAtICAgIGlmIChyZXQgPCAwKSB7DQo+PiAtICAg
ICAgICBlcnJvcl9zZXRnX2Vycm5vKGVycnAsIC1yZXQsDQo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICJkdW1wOiBmYWlsZWQgdG8gd3JpdGUgcHJvZ3JhbSBoZWFkZXIgdGFibGUi
KTsNCj4+IC0gICAgfQ0KPj4gKyAgICBtZW1zZXQocGhkciwgMCwgc2l6ZW9mKCpwaGRyKSk7
DQo+PiArICAgIHBoZHItPnBfdHlwZSA9IGNwdV90b19kdW1wMzIocywgUFRfTk9URSk7DQo+
PiArICAgIHBoZHItPnBfb2Zmc2V0ID0gY3B1X3RvX2R1bXA2NChzLCBzLT5ub3RlX29mZnNl
dCk7DQo+PiArICAgIHBoZHItPnBfcGFkZHIgPSAwOw0KPj4gKyAgICBwaGRyLT5wX2ZpbGVz
eiA9IGNwdV90b19kdW1wNjQocywgcy0+bm90ZV9zaXplKTsNCj4+ICsgICAgcGhkci0+cF9t
ZW1zeiA9IGNwdV90b19kdW1wNjQocywgcy0+bm90ZV9zaXplKTsNCj4+ICsgICAgcGhkci0+
cF92YWRkciA9IDA7DQo+PiAgIH0NCj4+DQo+PiAgIHN0YXRpYyBpbmxpbmUgaW50IGNwdV9p
bmRleChDUFVTdGF0ZSAqY3B1KQ0KPj4gQEAgLTI5NiwyNCArMjg3LDE1IEBAIHN0YXRpYyB2
b2lkIHdyaXRlX2VsZjY0X25vdGVzKFdyaXRlQ29yZUR1bXBGdW5jdGlvbg0KPj4gZiwgRHVt
cFN0YXRlICpzLA0KPj4gICAgICAgd3JpdGVfZ3Vlc3Rfbm90ZShmLCBzLCBlcnJwKTsNCj4+
ICAgfQ0KPj4NCj4+IC1zdGF0aWMgdm9pZCB3cml0ZV9lbGYzMl9ub3RlKER1bXBTdGF0ZSAq
cywgRXJyb3IgKiplcnJwKQ0KPj4gK3N0YXRpYyB2b2lkIHdyaXRlX2VsZjMyX3BoZHJfbm90
ZShEdW1wU3RhdGUgKnMsIEVsZjMyX1BoZHIgKnBoZHIpDQo+PiAgIHsNCj4+IC0gICAgRWxm
MzJfUGhkciBwaGRyOw0KPj4gLSAgICBpbnQgcmV0Ow0KPj4gLQ0KPj4gLSAgICBtZW1zZXQo
JnBoZHIsIDAsIHNpemVvZihFbGYzMl9QaGRyKSk7DQo+PiAtICAgIHBoZHIucF90eXBlID0g
Y3B1X3RvX2R1bXAzMihzLCBQVF9OT1RFKTsNCj4+IC0gICAgcGhkci5wX29mZnNldCA9IGNw
dV90b19kdW1wMzIocywgcy0+bm90ZV9vZmZzZXQpOw0KPj4gLSAgICBwaGRyLnBfcGFkZHIg
PSAwOw0KPj4gLSAgICBwaGRyLnBfZmlsZXN6ID0gY3B1X3RvX2R1bXAzMihzLCBzLT5ub3Rl
X3NpemUpOw0KPj4gLSAgICBwaGRyLnBfbWVtc3ogPSBjcHVfdG9fZHVtcDMyKHMsIHMtPm5v
dGVfc2l6ZSk7DQo+PiAtICAgIHBoZHIucF92YWRkciA9IDA7DQo+PiAtDQo+PiAtICAgIHJl
dCA9IGZkX3dyaXRlX3ZtY29yZSgmcGhkciwgc2l6ZW9mKEVsZjMyX1BoZHIpLCBzKTsNCj4+
IC0gICAgaWYgKHJldCA8IDApIHsNCj4+IC0gICAgICAgIGVycm9yX3NldGdfZXJybm8oZXJy
cCwgLXJldCwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgImR1bXA6IGZhaWxlZCB0
byB3cml0ZSBwcm9ncmFtIGhlYWRlciB0YWJsZSIpOw0KPj4gLSAgICB9DQo+PiArICAgIG1l
bXNldChwaGRyLCAwLCBzaXplb2YoKnBoZHIpKTsNCj4+ICsgICAgcGhkci0+cF90eXBlID0g
Y3B1X3RvX2R1bXAzMihzLCBQVF9OT1RFKTsNCj4+ICsgICAgcGhkci0+cF9vZmZzZXQgPSBj
cHVfdG9fZHVtcDMyKHMsIHMtPm5vdGVfb2Zmc2V0KTsNCj4+ICsgICAgcGhkci0+cF9wYWRk
ciA9IDA7DQo+PiArICAgIHBoZHItPnBfZmlsZXN6ID0gY3B1X3RvX2R1bXAzMihzLCBzLT5u
b3RlX3NpemUpOw0KPj4gKyAgICBwaGRyLT5wX21lbXN6ID0gY3B1X3RvX2R1bXAzMihzLCBz
LT5ub3RlX3NpemUpOw0KPj4gKyAgICBwaGRyLT5wX3ZhZGRyID0gMDsNCj4+ICAgfQ0KPj4N
Cj4+ICAgc3RhdGljIHZvaWQgd3JpdGVfZWxmMzJfbm90ZXMoV3JpdGVDb3JlRHVtcEZ1bmN0
aW9uIGYsIER1bXBTdGF0ZSAqcywNCj4+IEBAIC0zNDMsNiArMzI1LDMxIEBAIHN0YXRpYyB2
b2lkIHdyaXRlX2VsZjMyX25vdGVzKFdyaXRlQ29yZUR1bXBGdW5jdGlvbg0KPj4gZiwgRHVt
cFN0YXRlICpzLA0KPj4gICAgICAgd3JpdGVfZ3Vlc3Rfbm90ZShmLCBzLCBlcnJwKTsNCj4+
ICAgfQ0KPj4NCj4+ICtzdGF0aWMgdm9pZCB3cml0ZV9lbGZfcGhkcl9ub3RlKER1bXBTdGF0
ZSAqcywgRXJyb3IgKiplcnJwKQ0KPj4gK3sNCj4+ICsgICAgRWxmMzJfUGhkciBwaGRyMzI7
DQo+PiArICAgIEVsZjY0X1BoZHIgcGhkcjY0Ow0KPj4gKyAgICB2b2lkICpwaGRyOw0KPj4g
KyAgICBzaXplX3Qgc2l6ZTsNCj4+ICsgICAgaW50IHJldDsNCj4+ICsNCj4+ICsgICAgaWYg
KGR1bXBfaXNfNjRiaXQocykpIHsNCj4+ICsgICAgICAgIHdyaXRlX2VsZjY0X3BoZHJfbm90
ZShzLCAmcGhkcjY0KTsNCj4+ICsgICAgICAgIHNpemUgPSBzaXplb2YocGhkcjY0KTsNCj4+
ICsgICAgICAgIHBoZHIgPSAmcGhkcjY0Ow0KPj4gKyAgICB9IGVsc2Ugew0KPj4gKyAgICAg
ICAgd3JpdGVfZWxmMzJfcGhkcl9ub3RlKHMsICZwaGRyMzIpOw0KPj4gKyAgICAgICAgc2l6
ZSA9IHNpemVvZihwaGRyMzIpOw0KPj4gKyAgICAgICAgcGhkciA9ICZwaGRyMzI7DQo+PiAr
ICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0ID0gZmRfd3JpdGVfdm1jb3JlKHBoZHIsIHNpemUs
IHMpOw0KPj4gKyAgICBpZiAocmV0IDwgMCkgew0KPj4gKyAgICAgICAgZXJyb3Jfc2V0Z19l
cnJubyhlcnJwLCAtcmV0LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAiZHVtcDog
ZmFpbGVkIHRvIHdyaXRlIHByb2dyYW0gaGVhZGVyIHRhYmxlIik7DQo+PiArICAgIH0NCj4+
ICt9DQo+PiArDQo+PiAgIHN0YXRpYyB2b2lkIHdyaXRlX2VsZl9zZWN0aW9uKER1bXBTdGF0
ZSAqcywgaW50IHR5cGUsIEVycm9yICoqZXJycCkNCj4+ICAgew0KPj4gICAgICAgRWxmMzJf
U2hkciBzaGRyMzI7DQo+PiBAQCAtNTQwLDE0ICs1NDcsMTQgQEAgc3RhdGljIHZvaWQgZHVt
cF9iZWdpbihEdW1wU3RhdGUgKnMsIEVycm9yICoqZXJycCkNCj4+ICAgICAgICAgICByZXR1
cm47DQo+PiAgICAgICB9DQo+Pg0KPj4gLSAgICBpZiAoZHVtcF9pc182NGJpdChzKSkgew0K
Pj4gLSAgICAgICAgLyogd3JpdGUgUFRfTk9URSB0byB2bWNvcmUgKi8NCj4+IC0gICAgICAg
IHdyaXRlX2VsZjY0X25vdGUocywgJmxvY2FsX2Vycik7DQo+PiAtICAgICAgICBpZiAobG9j
YWxfZXJyKSB7DQo+PiAtICAgICAgICAgICAgZXJyb3JfcHJvcGFnYXRlKGVycnAsIGxvY2Fs
X2Vycik7DQo+PiAtICAgICAgICAgICAgcmV0dXJuOw0KPj4gLSAgICAgICAgfQ0KPj4gKyAg
ICAvKiB3cml0ZSBQVF9OT1RFIHRvIHZtY29yZSAqLw0KPj4gKyAgICB3cml0ZV9lbGZfcGhk
cl9ub3RlKHMsICZsb2NhbF9lcnIpOw0KPj4gKyAgICBpZiAobG9jYWxfZXJyKSB7DQo+PiAr
ICAgICAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKTsNCj4+ICsgICAgICAg
IHJldHVybjsNCj4+ICsgICAgfQ0KPj4NCj4+ICsgICAgaWYgKGR1bXBfaXNfNjRiaXQocykp
IHsNCj4+ICAgICAgICAgICAvKiB3cml0ZSBhbGwgUFRfTE9BRCB0byB2bWNvcmUgKi8NCj4+
ICAgICAgICAgICB3cml0ZV9lbGZfbG9hZHMocywgJmxvY2FsX2Vycik7DQo+PiAgICAgICAg
ICAgaWYgKGxvY2FsX2Vycikgew0KPj4gQEAgLTU3MSwxMyArNTc4LDYgQEAgc3RhdGljIHZv
aWQgZHVtcF9iZWdpbihEdW1wU3RhdGUgKnMsIEVycm9yICoqZXJycCkNCj4+ICAgICAgICAg
ICAgICAgcmV0dXJuOw0KPj4gICAgICAgICAgIH0NCj4+ICAgICAgIH0gZWxzZSB7DQo+PiAt
ICAgICAgICAvKiB3cml0ZSBQVF9OT1RFIHRvIHZtY29yZSAqLw0KPj4gLSAgICAgICAgd3Jp
dGVfZWxmMzJfbm90ZShzLCAmbG9jYWxfZXJyKTsNCj4+IC0gICAgICAgIGlmIChsb2NhbF9l
cnIpIHsNCj4+IC0gICAgICAgICAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJy
KTsNCj4+IC0gICAgICAgICAgICByZXR1cm47DQo+PiAtICAgICAgICB9DQo+PiAtDQo+PiAg
ICAgICAgICAgLyogd3JpdGUgYWxsIFBUX0xPQUQgdG8gdm1jb3JlICovDQo+PiAgICAgICAg
ICAgd3JpdGVfZWxmX2xvYWRzKHMsICZsb2NhbF9lcnIpOw0KPj4gICAgICAgICAgIGlmIChs
b2NhbF9lcnIpIHsNCj4+IC0tDQo+PiAyLjMyLjANCj4+DQo+Pg0KPj4NCj4gDQoNCg==

