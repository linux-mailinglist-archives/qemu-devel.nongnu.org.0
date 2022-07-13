Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756E2573A30
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 17:33:02 +0200 (CEST)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBeMH-0001Rj-5t
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 11:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBeJf-0008Dd-6D; Wed, 13 Jul 2022 11:30:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBeJc-0007kn-L7; Wed, 13 Jul 2022 11:30:18 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DFAMOJ023354;
 Wed, 13 Jul 2022 15:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kO0hII4VpQpWst6hYEg2jw+Y8fYqYVre0V3go0QPpX0=;
 b=aNMADWhk/MCdcI87oylnCeoQHXPZG/Nty3KSskMknswb47juVcHQ7tDk/p0Wovi+JO/E
 nFSTgSoFteGuHB/R0vgj1BhLMtwyGd0Z4MXAE09FsuGBXWhIRuordikaqIRpCX9BGChe
 gdorB/G9KPW1XHkx6UfqYIhs9+5siMeQ6lYxgqqp2ZGPhJ1ir6JM8IYTg8Gpr9NH4vEI
 4IcDJutB1mIKsDfpIOEuzHd6FyZx52yaGiR/wi9ury1mE4ONGNt909svklyBMZz+g4h0
 7CG7z7mtjol7qwx185Q1UiWbRzDQaDDLVbRu6nBczppO/lGlMUmrJXJI+lDQnabDTYsf lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha0b58vs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 15:30:12 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DFOaSS001003;
 Wed, 13 Jul 2022 15:30:12 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha0b58vqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 15:30:12 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DFOrMB003998;
 Wed, 13 Jul 2022 15:30:09 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3h70xhwvfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 15:30:09 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26DFU6TZ17629442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 15:30:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9280042045;
 Wed, 13 Jul 2022 15:30:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 134644203F;
 Wed, 13 Jul 2022 15:30:06 +0000 (GMT)
Received: from [9.145.184.105] (unknown [9.145.184.105])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 15:30:05 +0000 (GMT)
Message-ID: <fd62d8e8-a9f0-1e19-c8da-c8f31248983e@linux.ibm.com>
Date: Wed, 13 Jul 2022 17:30:05 +0200
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
 <20220713130322.25517-2-frankja@linux.ibm.com>
 <CAMxuvaz=erLFMasq1CK_Y1Ku+dU0ZMR3EPF8ehDnPjQ94R9Rfw@mail.gmail.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v2 01/11] dump: Cleanup memblock usage
In-Reply-To: <CAMxuvaz=erLFMasq1CK_Y1Ku+dU0ZMR3EPF8ehDnPjQ94R9Rfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tStpWyUK2f107hwFUsGhuXNZKFYFYF_B
X-Proofpoint-GUID: sez_3LwiyS8XMwnxQ9Wa-7rIx3ZcryoO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_04,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130059
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

T24gNy8xMy8yMiAxNzowOSwgTWFyYy1BbmRyw6kgTHVyZWF1IHdyb3RlOg0KPiBIaQ0KPiAN
Cj4gT24gV2VkLCBKdWwgMTMsIDIwMjIgYXQgNTowNyBQTSBKYW5vc2NoIEZyYW5rIDxmcmFu
a2phQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPj4NCj4+IFRoZSBpdGVyYXRpb24gb3ZlciB0
aGUgbWVtYmxvY2tzIGlzIGhhcmQgdG8gdW5kZXJzdGFuZCBzbyBpdCdzIGFib3V0DQo+PiB0
aW1lIHRvIGNsZWFuIGl0IHVwLg0KPj4NCj4+IHN0cnVjdCBEdW1wU3RhdGUncyBuZXh0X2Js
b2NrIGFuZCBzdGFydCBtZW1iZXJzIGNhbiBhbmQgc2hvdWxkIGJlDQo+PiBsb2NhbCB2YXJp
YWJsZXMgd2l0aGluIHRoZSBpdGVyYXRvci4NCj4+DQo+PiBJbnN0ZWFkIG9mIG1hbnVhbGx5
IGdyYWJiaW5nIHRoZSBuZXh0IG1lbWJsb2NrIHdlIGNhbiB1c2UNCj4+IFFUQUlMUV9GT1JF
QUNIIHRvIGl0ZXJhdGUgb3ZlciBhbGwgbWVtYmxvY2tzLg0KPj4NCj4+IFRoZSBiZWdpbiBh
bmQgbGVuZ3RoIGZpZWxkcyBpbiB0aGUgRHVtcFN0YXRlIGhhdmUgYmVlbiBsZWZ0IHVudG91
Y2hlZA0KPj4gc2luY2UgdGhlIHFtcCBhcmd1bWVudHMgc2hhcmUgdGhlaXIgbmFtZXMuDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFub3NjaCBGcmFuayA8ZnJhbmtqYUBsaW51eC5pYm0u
Y29tPg0KPiANCj4gQWZ0ZXIgdGhpcyBwYXRjaDoNCj4gLi9xZW11LXN5c3RlbS14ODZfNjQg
LW1vbml0b3Igc3RkaW8gLVMNCj4gKHFlbXUpIGR1bXAtZ3Vlc3QtbWVtb3J5IGZvbw0KPiBF
cnJvcjogZHVtcDogZmFpbGVkIHRvIHNhdmUgbWVtb3J5OiBCYWQgYWRkcmVzcw0KDQpJZiB5
b3UgaGF2ZSBtb3JlIHdheXMgdG8gY2hlY2sgZm9yIGR1bXAgZXJyb3JzIHRoZW4gcGxlYXNl
IHNlbmQgdGhlbSB0byANCm1lLiBJJ20gYXdhcmUgdGhhdCB0aGlzIG1pZ2h0IG5vdCBoYXZl
IGJlZW4gYSAxMDAlIGNvbnZlcnNpb24gYW5kIEknbSBhIA0KYml0IHRlcnJpZmllZCBhYm91
dCB0aGUgZmFjdCB0aGF0IHRoaXMgd2lsbCBhZmZlY3QgYWxsIGFyY2hpdGVjdHVyZXMuDQoN
Cg0KQW55d2F5LCBJJ2xsIGhhdmUgYSBsb29rLg0KDQpbLi4uXQ0KDQo+PiArc3RhdGljIGlu
bGluZSBpbnQ2NF90IGR1bXBfZ2V0X21lbWJsb2NrX3N0YXJ0KEd1ZXN0UGh5c0Jsb2NrICpi
bG9jaywgaW50NjRfdCBmaWx0ZXJfYXJlYV9zdGFydCwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW50NjRfdCBmaWx0ZXJfYXJlYV9sZW5ndGgpDQo+PiArew0K
Pj4gKyAgICBpZiAoZmlsdGVyX2FyZWFfbGVuZ3RoKSB7DQo+PiArICAgICAgICAvKg0KPj4g
KyAgICAgICAgICogQ2hlY2sgaWYgYmxvY2sgaXMgd2l0aGluIGd1ZXN0IG1lbW9yeSBkdW1w
IGFyZWEuIElmIG5vdA0KPj4gKyAgICAgICAgICogZ28gdG8gbmV4dCBvbmUuDQo+PiArICAg
ICAgICAgKi8NCj4gDQo+IE9yIHJhdGhlciAicmV0dXJuIC0xIGlmIHRoZSBibG9jayBpcyBu
b3Qgd2l0aGluIGZpbHRlciBhcmVhIg0KDQpTdXJlDQoNCj4gDQo+PiArICAgICAgICBpZiAo
YmxvY2stPnRhcmdldF9zdGFydCA+PSBmaWx0ZXJfYXJlYV9zdGFydCArIGZpbHRlcl9hcmVh
X2xlbmd0aCB8fA0KPj4gKyAgICAgICAgICAgIGJsb2NrLT50YXJnZXRfZW5kIDw9IGZpbHRl
cl9hcmVhX3N0YXJ0KSB7DQo+PiArICAgICAgICAgICAgcmV0dXJuIC0xOw0KPj4gKyAgICAg
ICAgfQ0KPj4gKyAgICAgICAgaWYgKGZpbHRlcl9hcmVhX3N0YXJ0ID4gYmxvY2stPnRhcmdl
dF9zdGFydCkgew0KPj4gKyAgICAgICAgICAgIHJldHVybiBmaWx0ZXJfYXJlYV9zdGFydCAt
IGJsb2NrLT50YXJnZXRfc3RhcnQ7DQo+PiArICAgICAgICB9DQo+PiArICAgIH0NCj4+ICsg
ICAgcmV0dXJuIGJsb2NrLT50YXJnZXRfc3RhcnQ7DQo+IA0KPiBUaGlzIHVzZWQgdG8gYmUg
MC4gQ2hhbmdpbmcgdGhhdCwgSSB0aGluayB0aGUgcGF0Y2ggbG9va3MgZ29vZC4NCj4gQWx0
aG91Z2ggaXQgY291bGQgcGVyaGFwcyBiZSBzcGxpdHRlZCB0byBpbnRyb2R1Y2UgdGhlIHR3
byBmdW5jdGlvbnMuDQoNClllcyBidXQgdGhlIDAgd2FzIHVzZWQgdG8gaW5kaWNhdGUgdGhh
dCB3ZSB3b3VsZCBoYXZlIG5lZWRlZCBjb250aW51ZSANCml0ZXJhdGluZyBhbmQgdGhlIGl0
ZXJhdGlvbiBpcyBkb25lIHZpYSBvdGhlciBtZWFucyBpbiB0aGlzIHBhdGNoLg0KDQpPciBh
bSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KDQo+IA0KPj4gK30NCj4+ICAgI2VuZGlmDQo+PiAt
LQ0KPj4gMi4zNC4xDQo+Pg0KPiANCj4gDQoNCg==

