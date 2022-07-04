Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA85658D8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:41:24 +0200 (CEST)
Received: from localhost ([::1]:44558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NGN-0001SB-Fm
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o8Msu-00028D-OJ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:17:09 -0400
Received: from [200.168.210.66] (port=22664 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>) id 1o8Msr-0004N7-Si
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:17:08 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 4 Jul 2022 11:16:57 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 74E338001F4;
 Mon,  4 Jul 2022 11:16:57 -0300 (-03)
Message-ID: <ac264c3d-3345-38bf-35e5-ddc1b809c3b4@eldorado.org.br>
Date: Mon, 4 Jul 2022 11:16:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC 5/8] static-analyzer: Enforce coroutine_fn restrictions on
 function pointers
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Xu <peterx@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
References: <20220702113331.2003820-1-afaria@redhat.com>
 <20220702113331.2003820-6-afaria@redhat.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <20220702113331.2003820-6-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 04 Jul 2022 14:16:57.0763 (UTC)
 FILETIME=[B85E3F30:01D88FB0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

T24gMDIvMDcvMjAyMiAwODozMywgQWxiZXJ0byBGYXJpYSB3cm90ZToNCg0KQWxiZXJ0bywg
aGVsbG8uIEkgd2FzIHRlc3RpbmcgdGhpcyBwYXRjaCBhcyBmb2xsb3dzOg0KDQouL3N0YXRp
Yy1hbmFseXplci5weSBidWlsZCB0YXJnZXQvcHBjL21tdS1oYXNoNjQuYw0KDQo8c25pcD4N
Cg0KPiBAQCAtNjI3LDkgKzc0NCwzMSBAQCBkZWYgaXNfY29yb3V0aW5lX2ZuKG5vZGU6IEN1
cnNvcikgLT4gYm9vbDoNCj4gICAgICAgICAgIGVsc2U6DQo+ICAgICAgICAgICAgICAgYnJl
YWsNCj4gDQo+IC0gICAgcmV0dXJuIG5vZGUua2luZCA9PSBDdXJzb3JLaW5kLkZVTkNUSU9O
X0RFQ0wgYW5kIGlzX2Fubm90YXRlZF93aXRoKA0KPiAtICAgICAgICBub2RlLCAiY29yb3V0
aW5lX2ZuIg0KPiAtICAgICkNCj4gKyAgICBpZiBub2RlLmtpbmQgaW4gW0N1cnNvcktpbmQu
REVDTF9SRUZfRVhQUiwgQ3Vyc29yS2luZC5NRU1CRVJfUkVGX0VYUFJdOg0KPiArICAgICAg
ICBub2RlID0gbm9kZS5yZWZlcmVuY2VkDQo+ICsNCj4gKyAgICAjIC0tLQ0KPiArDQo+ICsg
ICAgaWYgbm9kZS5raW5kID09IEN1cnNvcktpbmQuRlVOQ1RJT05fREVDTDoNCg0KDQpBbmQg
SSByZWNlaXZlIGFuIGV4Y2VwdGlvbiBvbiB0aGUgbGluZSBhYm92ZSBzYXlpbmcgdGhhdCBu
b2RlIGlzIG9mIHR5cGUNCk5vbmVUeXBlLiBTZWVtcyB0aGF0IGBub2RlID0gbm9kZS5yZWZl
cmVuY2VkYCBpcyBzZXR0aW5nIGBub2RlYCB0byBOb25lDQppbiB0aGlzIGNhc2UuDQoNCkkg
d2FzIHVuYWJsZSB0byB1bmRlcnN0YW5kIHRoZSByb290IGNhdXNlIG9mIGl0LiBJcyB0aGlz
IGFuIGluY29ycmVjdA0KdXNhZ2Ugb2YgdGhlIHRvb2wgZnJvbSBteSBwYXJ0PyBGdWxsIGVy
cm9yIG1lc3NhZ2UgYmVsb3cNCg0KVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3Qp
Og0KICAgRmlsZSAiLi9zdGF0aWMtYW5hbHl6ZXIucHkiLCBsaW5lIDMyNywgaW4gYW5hbHl6
ZV90cmFuc2xhdGlvbl91bml0DQogICAgIGNoZWNrZXIodHUsIGNvbnRleHQuYWJzb2x1dGVf
cGF0aCwgbG9nKQ0KICAgRmlsZSAiLi9zdGF0aWMtYW5hbHl6ZXIucHkiLCBsaW5lIDYxMywg
aW4gY2hlY2tfY29yb3V0aW5lX3BvaW50ZXJzDQogICAgIGFuZCBpc19jb3JvdXRpbmVfZm4o
cmlnaHQpDQogICBGaWxlICIuL3N0YXRpYy1hbmFseXplci5weSIsIGxpbmUgNzgxLCBpbiBp
c19jb3JvdXRpbmVfZm4NCiAgICAgaWYgbm9kZS5raW5kID09IEN1cnNvcktpbmQuRlVOQ1RJ
T05fREVDTDoNCkF0dHJpYnV0ZUVycm9yOiAnTm9uZVR5cGUnIG9iamVjdCBoYXMgbm8gYXR0
cmlidXRlICdraW5kJw0KDQpUaGUgYWJvdmUgZXhjZXB0aW9uIHdhcyB0aGUgZGlyZWN0IGNh
dXNlIG9mIHRoZSBmb2xsb3dpbmcgZXhjZXB0aW9uOg0KDQpUcmFjZWJhY2sgKG1vc3QgcmVj
ZW50IGNhbGwgbGFzdCk6DQogICBGaWxlICIvdXNyL2xpYi9weXRob24zLjgvbXVsdGlwcm9j
ZXNzaW5nL3Bvb2wucHkiLCBsaW5lIDEyNSwgaW4gd29ya2VyDQogICAgIHJlc3VsdCA9IChU
cnVlLCBmdW5jKCphcmdzLCAqKmt3ZHMpKQ0KICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy44
L211bHRpcHJvY2Vzc2luZy9wb29sLnB5IiwgbGluZSA0OCwgaW4gbWFwc3Rhcg0KICAgICBy
ZXR1cm4gbGlzdChtYXAoKmFyZ3MpKQ0KICAgRmlsZSAiLi9zdGF0aWMtYW5hbHl6ZXIucHki
LCBsaW5lIDMyOSwgaW4gYW5hbHl6ZV90cmFuc2xhdGlvbl91bml0DQogICAgIHJhaXNlIFJ1
bnRpbWVFcnJvcihmIkVycm9yIGFuYWx5emluZyB7cmVsYXRpdmVfcGF0aH0iKSBmcm9tIGUN
ClJ1bnRpbWVFcnJvcjogRXJyb3IgYW5hbHl6aW5nIHRhcmdldC9wcGMvbW11LWhhc2g2NC5j
DQoiIiINCg0KVGhlIGFib3ZlIGV4Y2VwdGlvbiB3YXMgdGhlIGRpcmVjdCBjYXVzZSBvZiB0
aGUgZm9sbG93aW5nIGV4Y2VwdGlvbjoNCg0KVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxs
IGxhc3QpOg0KICAgRmlsZSAiLi9zdGF0aWMtYW5hbHl6ZXIucHkiLCBsaW5lIDg5MywgaW4g
PG1vZHVsZT4NCiAgICAgbWFpbigpDQogICBGaWxlICIuL3N0YXRpYy1hbmFseXplci5weSIs
IGxpbmUgMTIzLCBpbiBtYWluDQogICAgIGFuYWx5emVfdHJhbnNsYXRpb25fdW5pdHMoYXJn
cywgY29udGV4dHMpDQogICBGaWxlICIuL3N0YXRpYy1hbmFseXplci5weSIsIGxpbmUgMjQw
LCBpbiBhbmFseXplX3RyYW5zbGF0aW9uX3VuaXRzDQogICAgIHJlc3VsdHMgPSBwb29sLm1h
cChhbmFseXplX3RyYW5zbGF0aW9uX3VuaXQsIGNvbnRleHRzKQ0KICAgRmlsZSAiL3Vzci9s
aWIvcHl0aG9uMy44L211bHRpcHJvY2Vzc2luZy9wb29sLnB5IiwgbGluZSAzNjQsIGluIG1h
cA0KICAgICByZXR1cm4gc2VsZi5fbWFwX2FzeW5jKGZ1bmMsIGl0ZXJhYmxlLCBtYXBzdGFy
LCBjaHVua3NpemUpLmdldCgpDQogICBGaWxlICIvdXNyL2xpYi9weXRob24zLjgvbXVsdGlw
cm9jZXNzaW5nL3Bvb2wucHkiLCBsaW5lIDc3MSwgaW4gZ2V0DQogICAgIHJhaXNlIHNlbGYu
X3ZhbHVlDQpSdW50aW1lRXJyb3I6IEVycm9yIGFuYWx5emluZyB0YXJnZXQvcHBjL21tdS1o
YXNoNjQuYw0KDQogPiArICAgICAgICByZXR1cm4gaXNfYW5ub3RhdGVkX3dpdGgobm9kZSwg
ImNvcm91dGluZV9mbiIpDQo+ICsNCj4gKyAgICBpZiBub2RlLmtpbmQgaW4gWw0KPiArICAg
ICAgICBDdXJzb3JLaW5kLkZJRUxEX0RFQ0wsDQo+ICsgICAgICAgIEN1cnNvcktpbmQuVkFS
X0RFQ0wsDQo+ICsgICAgICAgIEN1cnNvcktpbmQuUEFSTV9ERUNMLA0KPiArICAgIF06DQo+
ICsNCj4gKyAgICAgICAgaWYgaXNfYW5ub3RhdGVkX3dpdGgobm9kZSwgImNvcm91dGluZV9m
biIpOg0KPiArICAgICAgICAgICAgcmV0dXJuIFRydWUNCj4gKw0KPiArICAgICAgICAjIFRP
RE86IElmIHR5cGUgaXMgdHlwZWRlZiBvciBwb2ludGVyIHRvIHR5cGVkZWYsIGZvbGxvdyB0
eXBlZGVmLg0KPiArDQo+ICsgICAgICAgIHJldHVybiBGYWxzZQ0KPiArDQo+ICsgICAgaWYg
bm9kZS5raW5kID09IEN1cnNvcktpbmQuVFlQRURFRl9ERUNMOg0KPiArICAgICAgICByZXR1
cm4gaXNfYW5ub3RhdGVkX3dpdGgobm9kZSwgImNvcm91dGluZV9mbiIpDQo+ICsNCj4gKyAg
ICByZXR1cm4gRmFsc2UNCkJlc3QgcmVnYXJkcywNCg0KLS0gDQpWw61jdG9yIENvcmEgQ29s
b21ibw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBE
aXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1s
Pg0K

