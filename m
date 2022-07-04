Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A29565DCF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 21:08:45 +0200 (CEST)
Received: from localhost ([::1]:57300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8RR6-0006LN-Cs
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 15:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o8RPS-0005UT-Gc; Mon, 04 Jul 2022 15:07:02 -0400
Received: from [200.168.210.66] (port=42230 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o8RPQ-0002Fl-SV; Mon, 04 Jul 2022 15:07:02 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 4 Jul 2022 16:06:56 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id C5EA88001F4;
 Mon,  4 Jul 2022 16:06:55 -0300 (-03)
Message-ID: <ed0f5617-f439-9689-ad93-23fcba6e5079@eldorado.org.br>
Date: Mon, 4 Jul 2022 16:06:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC 5/8] static-analyzer: Enforce coroutine_fn restrictions on
 function pointers
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
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
 <ac264c3d-3345-38bf-35e5-ddc1b809c3b4@eldorado.org.br>
 <CAELaAXyAAfXGrO-NUSrqkU-Kd1hSzanUsz_Mk1fVSCfK9vhN8Q@mail.gmail.com>
 <679bb1ff-5bc4-7fc0-75e5-58628f577a27@eldorado.org.br>
 <CAELaAXyFdQ=B7rpWR4mvLGnwXLAGn_GOk-EWYDfNO3mzdmnTog@mail.gmail.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <CAELaAXyFdQ=B7rpWR4mvLGnwXLAGn_GOk-EWYDfNO3mzdmnTog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 04 Jul 2022 19:06:56.0194 (UTC)
 FILETIME=[3AA42220:01D88FD9]
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

T24gMDQvMDcvMjAyMiAxNTowNCwgQWxiZXJ0byBGYXJpYSB3cm90ZToNCj4gT24gTW9uLCBK
dWwgNCwgMjAyMiBhdCA2OjQ2IFBNIFbDrWN0b3IgQ29sb21ibw0KPiA8dmljdG9yLmNvbG9t
Ym9AZWxkb3JhZG8ub3JnLmJyPiB3cm90ZToNCj4+IFllcywgdGhpcyBsaW5lIGlzIHByZXNl
bnQgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgb3V0cHV0DQo+PiBJcyB0aGlzIGNhdXNlZCBi
eSBwcm9ibGVtcyB3aXRoIHRoZSBjb2RlIGJlaW5nIGFuYWx5emVkIG9yIGlzIGl0IGJlY2F1
c2UNCj4+IGxpYmNsYW5nIGlzIGdldHRpbmcgY29uZnVzZWQgd2l0aCBzb21ldGhpbmcgdGhh
dCBpcyBvdXRzaWRlIG9mIG91cg0KPj4gY29udHJvbD8NCj4gDQo+IEkgdGhpbmsgSSBmb3Vu
ZCB0aGUgcHJvYmxlbTogdGhlIGNvbW1hbmRzIGluIHRoZSBjb21waWxhdGlvbiBkYXRhYmFz
ZQ0KPiB3ZXJlbid0IGJlaW5nIHBhcnNlZCBwcm9wZXJseS4gSSBzd2l0Y2hlZCB0byBzaGxl
eC5zcGxpdCgpIGFuZCBpdA0KPiBzZWVtcyB0byBiZSB3b3JraW5nIG5vdy4gVGhlIFdJUCB2
MiBpcyBhdmFpbGFibGUgYXQgWzFdLCBpZiB5b3Ugd2FudA0KPiB0byBnaXZlIGl0IGEgdHJ5
Lg0KPiANCj4gVGhhbmtzIGZvciByZXBvcnRpbmcgdGhpcyENCj4gDQo+IEFsYmVydG8NCj4g
DQo+IFsxXSBodHRwczovL2dpdGxhYi5jb20vYWxiZXJ0b2ZhcmlhL3FlbXUvLS90cmVlL3N0
YXRpYy1hbmFseXNpcw0KPiANCg0KSSB0ZXN0ZWQgdGhlIHZlcnNpb24gZnJvbSB0aGUgV0lQ
IHYyIGFuZCBzZWVtcyB0byBiZSB3b3JraW5nIG5vdy4NClRoYW5rcyENCg0KLS0gDQpWw61j
dG9yIENvcmEgQ29sb21ibw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZp
c28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlz
Y2xhaW1lci5odG1sPg0K

