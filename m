Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912A72EE9BB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:28:16 +0100 (CET)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxehT-00076k-1D
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dhildenb@redhat.com>)
 id 1kxegT-0006dH-7V
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 18:27:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dhildenb@redhat.com>)
 id 1kxegP-0001lT-TJ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 18:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610062028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFf/sTw+WhqYSSvncC0EG/Vl47KepAu4FDPOmxpXM8A=;
 b=ghfb8pHzLdq8stuSj92fbjo5KnRldamkfpReGLUD+P9uBqukIM3MyKL1azFA7SlCFgBy7i
 eBoriV8XKBCmW09292tqued92jsxOCx9J0zkcJuULSVMkfzxHXCEnDkbxoqvb9xltBu0oS
 BXGMO74a4mRSClSzZfrtq9/rLLuy5yU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-9kDoTAi3Nk2VSp-VIureBw-1; Thu, 07 Jan 2021 18:27:04 -0500
X-MC-Unique: 9kDoTAi3Nk2VSp-VIureBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9221210054FF;
 Thu,  7 Jan 2021 23:27:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8782160BF1;
 Thu,  7 Jan 2021 23:27:02 +0000 (UTC)
Received: from zmail19.collab.prod.int.phx2.redhat.com
 (zmail19.collab.prod.int.phx2.redhat.com [10.5.83.22])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 306E518095FF;
 Thu,  7 Jan 2021 23:27:02 +0000 (UTC)
From: David Hildenbrand <dhildenb@redhat.com>
MIME-Version: 1.0
Subject: Re: [PATCH v1] s390x/tcg: Fix RISBHG
Date: Thu, 7 Jan 2021 18:27:01 -0500 (EST)
Message-Id: <B6050D16-4BD3-4355-878F-33E3E7C3A75D@redhat.com>
References: <CAKwvOdmE=Z9pV4txRw-kpcv5FOSr6eEXfmGnc++R_Vzv8MnRDQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmE=Z9pV4txRw-kpcv5FOSr6eEXfmGnc++R_Vzv8MnRDQ@mail.gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Thread-Topic: s390x/tcg: Fix RISBHG
Thread-Index: NcBNapSGPJMT1dP5vMuuN3FE2lAuOw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dhildenb@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dhildenb@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IEFtIDA4LjAxLjIwMjEgdW0gMDA6MjEgc2NocmllYiBOaWNrIERlc2F1bG5pZXJzIDxuZGVz
YXVsbmllcnNAZ29vZ2xlLmNvbT46DQo+IA0KPiDvu79PbiBUaHUsIEphbiA3LCAyMDIxIGF0IDM6
MTMgUE0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4gDQo+
PiBSSVNCSEcgaXMgYnJva2VuIGFuZCBjdXJyZW50bHkgaGluZGVycyBjbGFuZyBidWlsZHMgb2Yg
dXBzdHJlYW0ga2VybmVscw0KPj4gZnJvbSBib290aW5nOiB0aGUga2VybmVsIGNyYXNoZXMgZWFy
bHksIHdoaWxlIGRlY29tcHJlc3NpbmcgdGhlIGltYWdlLg0KPj4gDQo+PiAgWy4uLl0NCj4+ICAg
S2VybmVsIGZhdWx0OiBpbnRlcnJ1cHRpb24gY29kZSAwMDA1IGlsYzoyDQo+PiAgIEtlcm5lbCBy
YW5kb20gYmFzZTogMDAwMDAwMDAwMDAwMDAwMA0KPj4gICBQU1cgOiAwMDAwMjAwMTgwMDAwMDAw
IDAwMDAwMDAwMDAwMTdhMWUNCj4+ICAgICAgICAgUjowIFQ6MCBJTzowIEVYOjAgS2V5OjAgTTow
IFc6MCBQOjAgQVM6MCBDQzoyIFBNOjAgUkk6MCBFQTozDQo+PiAgIEdQUlM6IDAwMDAwMDAwMDAw
MDAwMDEgMDAwMDAwMGMwMDAwMDAwMCAwMDAwMDAwM2ZmZmZmZmY0IDAwMDAwMDAwZmZmZmZmZjAN
Cj4+ICAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMGZmZmZmZmY0IDAwMDAwMDAwMDAw
MDAwMGMgMDAwMDAwMDBmZmZmZmZmMA0KPj4gICAgICAgICAwMDAwMDAwMGZmZmZmZmZjIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDBmZmZmZmZmOCAwMDAwMDAwMDAwOGUyNWE4DQo+PiAgICAgICAg
IDAwMDAwMDAwMDAwMDAwMDkgMDAwMDAwMDAwMDAwMDAwMiAwMDAwMDAwMDAwMDAwMDA4IDAwMDAw
MDAwMDAwMGJjZTANCj4+IA0KPj4gT25lIGV4YW1wbGUgb2YgYSBidWdneSBpbnN0cnVjdGlvbiBp
czoNCj4+IA0KPj4gICAgMTdkZGU6ICAgICAgIGVjIDFlIDAwIDlmIDIwIDVkICAgICAgIHJpc2Jo
ZyAgJXIxLCVyMTQsMCwxNTksMzINCj4+IA0KPj4gV2l0aCAlcjE0ID0gMHg5IGFuZCAlcjEgPSAw
eDcgc2hvdWxkIHJlc3VsdCBpbiAlcjEgPSAweDkwMDAwMDAwNywgaG93ZXZlciwNCj4+IHJlc3Vs
dHMgaW4gJXIxID0gMC4NCj4+IA0KPj4gTGV0J3MgaW50ZXJwcmV0IHZhbHVlcyBvZiBpMy9pNCBh
cyBkb2N1bWVudGVkIGluIHRoZSBQb1AgYW5kIG1ha2UNCj4+IGNvbXB1dGF0aW9uIG9mICJtYXNr
IiBvbmx5IGJhc2VkIG9uIGkzIGFuZCBpNCBhbmQgdXNlICJwbWFzayIgb25seSBhdCB0aGUNCj4+
IHZlcnkgZW5kIHRvIG1ha2Ugc3VyZSB3cmFwcGluZyBpcyBvbmx5IGFwcGxpZWQgdG8gdGhlIGhp
Z2gvbG93IGRvdWJsZXdvcmQuDQo+PiANCj4+IFdpdGggdGhpcyBwYXRjaCwgSSBjYW4gc3VjY2Vz
c2Z1bGx5IGJvb3QgYSB2NS4xMCBrZXJuZWwgYnVpbHQgd2l0aA0KPj4gY2xhbmcsIGFuZCBnY2Mg
YnVpbGRzIGtlZXAgb24gd29ya2luZy4NCj4+IA0KPj4gRml4ZXM6IDJkNmE4Njk4MzNkOSAoInRh
cmdldC1zMzkwOiBJbXBsZW1lbnQgUklTQkciKQ0KPj4gUmVwb3J0ZWQtYnk6IE5pY2sgRGVzYXVs
bmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPg0KPj4gQ2M6IEd1ZW50ZXIgUm9lY2sgPGxp
bnV4QHJvZWNrLXVzLm5ldD4NCj4+IENjOiBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgPGJvcm50cmFl
Z2VyQGRlLmlibS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4NCj4+IC0tLQ0KPj4gDQo+PiBUaGlzIEJVRyB3YXMgYSBuaWdodG1hcmUg
dG8gZGVidWcgYW5kIHRoZSBjb2RlIGEgbmlnaHRtYXJlIHRvIHVuZGVyc3RhbmQuDQo+PiANCj4+
IFRvIG1ha2UgY2xhbmcvZ2NjIGJ1aWxkcyBib290LCB0aGUgZm9sbG93aW5nIGZpeCBpcyByZXF1
aXJlZCBhcyB3ZWxsIG9uDQo+PiB0b3Agb2YgY3VycmVudCBtYXN0ZXI6ICJbUEFUQ0hdIHRhcmdl
dC9zMzkweDogRml4IEFMR1NJIg0KPj4gaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDIxMDEw
NzIwMjEzNS41MjM3OS0xLWRhdmlkQHJlZGhhdC5jb20NCj4gDQo+IEluIHRoYXQgY2FzZSwgYSBo
dWdlIHRoYW5rIHlvdSEhISBmb3IgdGhpcyB3b3JrISArK2JlZXJzX293ZWQuDQo+IA0KDQo6KSBh
IGtlcm5lbCBidWlsZCBmb3IgejEzIHNob3VsZCB3b3JrIHdpdGggdGhlIChkZWZhdWx0KSDigJ4t
Y3B1IHFlbXXigJwgY3B1IHR5cGUuDQoNCj4+IA0KPj4gLS0tDQo+PiB0YXJnZXQvczM5MHgvdHJh
bnNsYXRlLmMgfCAxOCArKysrKysrKy0tLS0tLS0tLS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvdGFyZ2V0
L3MzOTB4L3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L3MzOTB4L3RyYW5zbGF0ZS5jDQo+PiBpbmRleCAz
ZDVjMGQ2MTA2Li4zOWUzM2VlYjY3IDEwMDY0NA0KPj4gLS0tIGEvdGFyZ2V0L3MzOTB4L3RyYW5z
bGF0ZS5jDQo+PiArKysgYi90YXJnZXQvczM5MHgvdHJhbnNsYXRlLmMNCj4+IEBAIC0zODE1LDIy
ICszODE1LDIzIEBAIHN0YXRpYyBEaXNhc0p1bXBUeXBlIG9wX3Jpc2JnKERpc2FzQ29udGV4dCAq
cywgRGlzYXNPcHMgKm8pDQo+PiAgICAgICAgIHBtYXNrID0gMHhmZmZmZmZmZjAwMDAwMDAwdWxs
Ow0KPj4gICAgICAgICBicmVhazsNCj4+ICAgICBjYXNlIDB4NTE6IC8qIHJpc2JsZyAqLw0KPj4g
LSAgICAgICAgaTMgJj0gMzE7DQo+PiAtICAgICAgICBpNCAmPSAzMTsNCj4+ICsgICAgICAgIGkz
ID0gKGkzICYgMzEpICsgMzI7DQo+PiArICAgICAgICBpNCA9IChpNCAmIDMxKSArIDMyOw0KPj4g
ICAgICAgICBwbWFzayA9IDB4MDAwMDAwMDBmZmZmZmZmZnVsbDsNCj4+ICAgICAgICAgYnJlYWs7
DQo+PiAgICAgZGVmYXVsdDoNCj4+ICAgICAgICAgZ19hc3NlcnRfbm90X3JlYWNoZWQoKTsNCj4+
ICAgICB9DQo+PiANCj4+IC0gICAgLyogTUFTSyBpcyB0aGUgc2V0IG9mIGJpdHMgdG8gYmUgaW5z
ZXJ0ZWQgZnJvbSBSMi4NCj4+IC0gICAgICAgVGFrZSBjYXJlIGZvciBJMy9JNCB3cmFwYXJvdW5k
LiAgKi8NCj4+IC0gICAgbWFzayA9IHBtYXNrID4+IGkzOw0KPj4gKyAgICAvKiBNQVNLIGlzIHRo
ZSBzZXQgb2YgYml0cyB0byBiZSBpbnNlcnRlZCBmcm9tIFIyLiAqLw0KPj4gICAgIGlmIChpMyA8
PSBpNCkgew0KPj4gLSAgICAgICAgbWFzayBePSBwbWFzayA+PiBpNCA+PiAxOw0KPj4gKyAgICAg
ICAgLyogWzAuLi5pMy0tLWk0Li4uNjNdICovDQo+PiArICAgICAgICBtYXNrID0gKC0xdWxsID4+
IGkzKSAmICgtMXVsbCA8PCAoNjMgLSBpNCkpOw0KPj4gICAgIH0gZWxzZSB7DQo+PiAtICAgICAg
ICBtYXNrIHw9IH4ocG1hc2sgPj4gaTQgPj4gMSk7DQo+PiArICAgICAgICAvKiBbMC0tLWk0Li4u
aTMtLS02M10gKi8NCj4+ICsgICAgICAgIG1hc2sgPSAoLTF1bGwgPj4gaTMpIHwgKC0xdWxsIDw8
ICg2MyAtIGk0KSk7DQo+PiAgICAgfQ0KPiANCj4gVGhlIGV4cHJlc3Npb24gZXZhbHVhdGVkIGxv
b2tzIHRoZSBzYW1lIHRvIG1lIGZvciBib3RoIHNpZGVzIG9mIHRoZQ0KPiBjb25kaXRpb25hbCwg
YnV0IHRoZSBjb21tZW50cyBkaWZmZXIuIEludGVudGlvbmFsPw0KDQomIHZzIHwsIHNvIHRoZSBy
ZXN1bHQgZGlmZmVycy4NCg0KQ2hlZXJzIQ==


