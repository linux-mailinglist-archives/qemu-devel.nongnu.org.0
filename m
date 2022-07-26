Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B75813A3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 14:57:13 +0200 (CEST)
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGK7b-0006ZM-Dq
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 08:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGK46-0002sT-Vw; Tue, 26 Jul 2022 08:53:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGK44-0005xm-HZ; Tue, 26 Jul 2022 08:53:34 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QCdZ7O027598;
 Tue, 26 Jul 2022 12:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iPf2cdEvT+NYEVrO+NKpa+Yo486/CD59QHkU395H748=;
 b=dof061Z7jCQLd2L6/W4dcQnhPukI0FHwpMsyzHJTLOalNdVYoqsd5HOVVd21q/RQOB74
 41/81oCDf1KbJdx3iAKUKfl7tHIuYYM1DkV7y51Cmq6Y8Bbja+/+TN92oeQSDC0P91vT
 ANtmyuQy50jHi9Sjs1LNrk6XsEr9leYBKKqZ3Va0phFnHYZVNTzj76KUUK3a5ARLgT4v
 76psWZM0XfBiVrPOy8acxJ6fE1MEZPUr8tWJTpISwK2dKY9yEnYxyv0lZzrnvak42ia0
 V+q2RkNMflk/GX8/B78TkW5NeRm8VqbCow2edXdbLN6q+2VjZwmn+jixGvvEL5TQ4gcZ kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjcq2ysg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 12:53:29 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QBQBpO029222;
 Tue, 26 Jul 2022 12:53:28 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjcq2ysf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 12:53:28 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26QCp8ju023395;
 Tue, 26 Jul 2022 12:53:26 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3hh6eujfkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 12:53:26 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26QCrMO921692822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 12:53:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C00A7A405C;
 Tue, 26 Jul 2022 12:53:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 382D9A4054;
 Tue, 26 Jul 2022 12:53:22 +0000 (GMT)
Received: from [9.145.6.94] (unknown [9.145.6.94])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 12:53:21 +0000 (GMT)
Message-ID: <e24cff5c-3171-69dc-3e17-d4f773be6f2b@linux.ibm.com>
Date: Tue, 26 Jul 2022 14:53:21 +0200
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
 <20220726092248.128336-12-frankja@linux.ibm.com>
 <CAMxuvawu-q-Fe4ZXU2Bc1gwLfpQCCw3HxWhbBK6+8exkM1b+nw@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v4 11/17] dump/dump: Add section string table support
In-Reply-To: <CAMxuvawu-q-Fe4ZXU2Bc1gwLfpQCCw3HxWhbBK6+8exkM1b+nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: a3MWq9C8aGaOqsTk_eVHD4OnI9TylNu9
X-Proofpoint-GUID: GJQtVVM1AM7KQTAQYUIKWV-ldrxhYz4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260047
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

T24gNy8yNi8yMiAxMzoyNSwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBIaQ0KPiAN
Cj4gT24gVHVlLCBKdWwgMjYsIDIwMjIgYXQgMToyMyBQTSBKYW5vc2NoIEZyYW5rIDxmcmFu
a2phQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPj4NCj4+IEFzIHNlY3Rpb25zIGRvbid0IGhh
dmUgYSB0eXBlIGxpa2UgdGhlIG5vdGVzIGRvIHdlIG5lZWQgYW5vdGhlciB3YXkgdG8NCj4+
IGRldGVybWluZSB0aGVpciBjb250ZW50cy4gVGhlIHN0cmluZyB0YWJsZSBhbGxvd3MgdXMg
dG8gYXNzaWduIGVhY2gNCj4+IHNlY3Rpb24gYW4gaWRlbnRpZmljYXRpb24gc3RyaW5nIHdo
aWNoIGFyY2hpdGVjdHVyZXMgY2FuIHRoZW4gdXNlIHRvDQo+PiB0YWcgdGhlaXIgc2VjdGlv
bnMgd2l0aC4NCj4+DQo+PiBUaGVyZSB3aWxsIGJlIG5vIHN0cmluZyB0YWJsZSBpZiB0aGUg
YXJjaGl0ZWN0dXJlIGRvZXNuJ3QgYWRkIGN1c3RvbQ0KPj4gc2VjdGlvbnMgd2hpY2ggYXJl
IGludHJvZHVjZWQgaW4gYSBmb2xsb3dpbmcgcGF0Y2guDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogSmFub3NjaCBGcmFuayA8ZnJhbmtqYUBsaW51eC5pYm0uY29tPg0KPj4gLS0tDQo+PiAg
IGR1bXAvZHVtcC5jICAgICAgICAgICB8IDgxICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0NCj4+ICAgaW5jbHVkZS9zeXNlbXUvZHVtcC5oIHwgIDEgKw0K
Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHVtcC9kdW1wLmMgYi9kdW1wL2R1bXAuYw0KPj4gaW5k
ZXggM2NmODQ2ZDBhMC4uMjk4YTFlOTIzZiAxMDA2NDQNCj4+IC0tLSBhL2R1bXAvZHVtcC5j
DQo+PiArKysgYi9kdW1wL2R1bXAuYw0KPj4gQEAgLTk5LDYgKzk5LDcgQEAgc3RhdGljIGlu
dCBkdW1wX2NsZWFudXAoRHVtcFN0YXRlICpzKQ0KPj4gICAgICAgY2xvc2Uocy0+ZmQpOw0K
Pj4gICAgICAgZ19mcmVlKHMtPmd1ZXN0X25vdGUpOw0KPj4gICAgICAgZ19mcmVlKHMtPmVs
Zl9oZWFkZXIpOw0KPj4gKyAgICBnX2FycmF5X3VucmVmKHMtPnN0cmluZ190YWJsZV9idWYp
Ow0KPj4gICAgICAgcy0+Z3Vlc3Rfbm90ZSA9IE5VTEw7DQo+PiAgICAgICBpZiAocy0+cmVz
dW1lKSB7DQo+PiAgICAgICAgICAgaWYgKHMtPmRldGFjaGVkKSB7DQo+PiBAQCAtMzU3LDIx
ICszNTgsNzIgQEAgc3RhdGljIHNpemVfdCBwcmVwYXJlX2VsZl9zZWN0aW9uX2hkcl96ZXJv
KER1bXBTdGF0ZSAqcykNCj4+ICAgICAgIHJldHVybiBkdW1wX2lzXzY0Yml0KHMpID8gc2l6
ZW9mKEVsZjY0X1NoZHIpIDogc2l6ZW9mKEVsZjMyX1NoZHIpOw0KPj4gICB9DQo+Pg0KPj4g
K3N0YXRpYyB2b2lkIHdyaXRlX2VsZl9zZWN0aW9uX2hkcl9zdHJpbmcoRHVtcFN0YXRlICpz
LCB2b2lkICpidWZmKQ0KPj4gK3sNCj4gDQo+IE1pbGRseSBhbm5veWVkIHRoYXQgd2UgdXNl
ICJ3cml0ZV8iIHByZWZpeCBmb3IgYWN0dWFsbHkgd3JpdGluZyB0byB0aGUNCj4gZmQsIGFu
ZCBzb21ldGltZXMgdG8gcHJlLWZpbGwgKG9yICJwcmVwYXJlXyIgc3RydWN0dXJlcykuIFdv
dWxkIHlvdQ0KPiBtaW5kIGNsZWFuaW5nIHRoYXQgdXA/DQo+IA0KDQpZZXMsIGFic29sdXRl
bHkNCg0KPj4gKyAgICBFbGYzMl9TaGRyIHNoZHIzMjsNCj4+ICsgICAgRWxmNjRfU2hkciBz
aGRyNjQ7DQo+PiArICAgIGludCBzaGRyX3NpemU7DQo+PiArICAgIHZvaWQgKnNoZHIgPSBi
dWZmOw0KPiANCj4gV2h5IGFzc2lnbiBoZXJlPw0KDQpHcmVhdCBxdWVzdGlvbg0KDQo+IA0K
Pj4gKw0KPj4gKyAgICBpZiAoZHVtcF9pc182NGJpdChzKSkgew0KPj4gKyAgICAgICAgc2hk
cl9zaXplID0gc2l6ZW9mKEVsZjY0X1NoZHIpOw0KPj4gKyAgICAgICAgbWVtc2V0KCZzaGRy
NjQsIDAsIHNoZHJfc2l6ZSk7DQo+PiArICAgICAgICBzaGRyNjQuc2hfdHlwZSA9IFNIVF9T
VFJUQUI7DQo+PiArICAgICAgICBzaGRyNjQuc2hfb2Zmc2V0ID0gcy0+c2VjdGlvbl9vZmZz
ZXQgKyBzLT5lbGZfc2VjdGlvbl9kYXRhX3NpemU7DQo+PiArICAgICAgICBzaGRyNjQuc2hf
bmFtZSA9IHMtPnN0cmluZ190YWJsZV9idWYtPmxlbjsNCj4+ICsgICAgICAgIGdfYXJyYXlf
YXBwZW5kX3ZhbHMocy0+c3RyaW5nX3RhYmxlX2J1ZiwgIi5zdHJ0YWIiLCBzaXplb2YoIi5z
dHJ0YWIiKSk7DQo+PiArICAgICAgICBzaGRyNjQuc2hfc2l6ZSA9IHMtPnN0cmluZ190YWJs
ZV9idWYtPmxlbjsNCj4+ICsgICAgICAgIHNoZHIgPSAmc2hkcjY0Ow0KPj4gKyAgICB9IGVs
c2Ugew0KPj4gKyAgICAgICAgc2hkcl9zaXplID0gc2l6ZW9mKEVsZjMyX1NoZHIpOw0KPj4g
KyAgICAgICAgbWVtc2V0KCZzaGRyMzIsIDAsIHNoZHJfc2l6ZSk7DQo+PiArICAgICAgICBz
aGRyMzIuc2hfdHlwZSA9IFNIVF9TVFJUQUI7DQo+PiArICAgICAgICBzaGRyMzIuc2hfb2Zm
c2V0ID0gcy0+c2VjdGlvbl9vZmZzZXQgKyBzLT5lbGZfc2VjdGlvbl9kYXRhX3NpemU7DQo+
PiArICAgICAgICBzaGRyMzIuc2hfbmFtZSA9IHMtPnN0cmluZ190YWJsZV9idWYtPmxlbjsN
Cj4+ICsgICAgICAgIGdfYXJyYXlfYXBwZW5kX3ZhbHMocy0+c3RyaW5nX3RhYmxlX2J1Ziwg
Ii5zdHJ0YWIiLCBzaXplb2YoIi5zdHJ0YWIiKSk7DQo+PiArICAgICAgICBzaGRyMzIuc2hf
c2l6ZSA9IHMtPnN0cmluZ190YWJsZV9idWYtPmxlbjsNCj4+ICsgICAgICAgIHNoZHIgPSAm
c2hkcjMyOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIG1lbWNweShidWZmLCBzaGRyLCBz
aGRyX3NpemUpOw0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGljIHZvaWQgcHJlcGFyZV9lbGZf
c2VjdGlvbl9oZHJzKER1bXBTdGF0ZSAqcykNCj4+ICAgew0KPj4gICAgICAgc2l6ZV90IGxl
biwgc2l6ZW9mX3NoZHI7DQo+PiArICAgIEVsZjY0X0VoZHIgKmhkcjY0ID0gcy0+ZWxmX2hl
YWRlcjsNCj4+ICsgICAgRWxmMzJfRWhkciAqaGRyMzIgPSBzLT5lbGZfaGVhZGVyOw0KPj4g
KyAgICB2b2lkICpidWZmX2hkcjsNCj4+DQo+PiAgICAgICAvKg0KPj4gICAgICAgICogU2Vj
dGlvbiBvcmRlcmluZzoNCj4+ICAgICAgICAqIC0gSERSIHplcm8gKGlmIG5lZWRlZCkNCj4+
ICsgICAgICogLSBTdHJpbmcgdGFibGUgaGRyDQo+PiAgICAgICAgKi8NCj4+ICAgICAgIHNp
emVvZl9zaGRyID0gZHVtcF9pc182NGJpdChzKSA/IHNpemVvZihFbGY2NF9TaGRyKSA6IHNp
emVvZihFbGYzMl9TaGRyKTsNCj4+ICAgICAgIGxlbiA9IHNpemVvZl9zaGRyICogcy0+c2hk
cl9udW07DQo+PiAgICAgICBzLT5lbGZfc2VjdGlvbl9oZHJzID0gZ19tYWxsb2MwKGxlbik7
DQo+PiArICAgIGJ1ZmZfaGRyID0gcy0+ZWxmX3NlY3Rpb25faGRyczsNCj4+DQo+PiAgICAg
ICAvKiBXcml0ZSBzcGVjaWFsIHNlY3Rpb24gZmlyc3QgKi8NCj4+ICAgICAgIGlmIChzLT5w
aGRyX251bSA9PSBQTl9YTlVNKSB7DQo+PiAgICAgICAgICAgcHJlcGFyZV9lbGZfc2VjdGlv
bl9oZHJfemVybyhzKTsNCj4+ICsgICAgICAgIGJ1ZmZfaGRyICs9IHNpemVvZl9zaGRyOw0K
Pj4gKyAgICB9DQo+PiArDQo+PiArICAgIGlmIChzLT5zaGRyX251bSA8IDIpIHsNCj4+ICsg
ICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAg
KiBTdHJpbmcgdGFibGUgbmVlZHMgdG8gYmUgbGFzdCBzZWN0aW9uIHNpbmNlIHN0cmluZ3Mg
YXJlIGFkZGVkDQo+PiArICAgICAqIHZpYSBhcmNoX3NlY3Rpb25zX3dyaXRlX2hkcigpLg0K
Pj4gKyAgICAgKi8NCj4gDQo+IFRoaXMgY29tbWVudCBpc24ndCBleGFjdGx5IHJlbGV2YW50
IHlldCwgc2luY2UgdGhhdCBjb2RlIGlzbid0IHRoZXJlLCBidXQgb2suDQoNCldoYXQgYWJv
dXQgc29tZXRoaW5nIGxpa2UgdGhpcywgaXQncyBhIGJpdCBtb3JlIHByZWNpc2UgYW5kIEkn
bGwgYWRkIHRoZSANCmFyY2hfc2VjdGlvbnNfd3JpdGVfaGRyKCkgcmVmZXJlbmNlIGluIHRo
ZSBuZXh0IHBhdGNoPw0KDQovKg0KKiBTdHJpbmcgdGFibGUgbmVlZHMgdG8gYmUgdGhlIGxh
c3Qgc2VjdGlvbiBzaW5jZSBpdCB3aWxsIGJlIHBvcHVsYXRlZCANCndoZW4gYWRkaW5nIG90
aGVyIGVsZiBzdHJ1Y3R1cmVzLg0KKi8NCg0KWy4uXQ0KPj4gICAgICAgcy0+bGVuZ3RoID0g
bGVuZ3RoOw0KPj4gKyAgICAvKiBGaXJzdCBpbmRleCBpcyAwLCBpdCdzIHRoZSBzcGVjaWFs
IG51bGwgbmFtZSAqLw0KPj4gKyAgICBzLT5zdHJpbmdfdGFibGVfYnVmID0gZ19hcnJheV9u
ZXcoRkFMU0UsIFRSVUUsIDEpOw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBBbGxvY2F0ZSB0
aGUgbnVsbCBuYW1lLCBkdWUgdG8gdGhlIGNsZWFyaW5nIG9wdGlvbiBzZXQgdG8gdHJ1ZQ0K
Pj4gKyAgICAgKiBpdCB3aWxsIGJlIDAuDQo+PiArICAgICAqLw0KPj4gKyAgICBnX2FycmF5
X3NldF9zaXplKHMtPnN0cmluZ190YWJsZV9idWYsIDEpOw0KPiANCj4gSSB3b25kZXIgaWYg
R0J5dGVBcnJheSB3b3VsZG4ndCBiZSBtb3JlIGFwcHJvcHJpYXRlLCBldmVuIGlmIGl0DQo+
IGRvZXNuJ3QgaGF2ZSB0aGUgY2xlYXJpbmcgb3B0aW9uLiBJZiBpdCdzIGp1c3QgZm9yIG9u
ZSBieXRlLCAuLi4NCg0KSSBkb24ndCByZWFsbHkgY2FyZSBidXQgSSBuZWVkIGEgZGVjaXNp
b24gb24gaXQgdG8gY2hhbmdlIGl0IDopDQo=

