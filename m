Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C07589FBA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:11:41 +0200 (CEST)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJeNn-00023s-HM
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJeH8-0001KX-07
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 13:04:48 -0400
Received: from [200.168.210.66] (port=25858 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>) id 1oJeGz-00062m-IM
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 13:04:45 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 4 Aug 2022 14:04:33 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id B58CB8002BE;
 Thu,  4 Aug 2022 14:04:32 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------D8aA8QtwOgC5mtNFLeGMzmKE"
Message-ID: <b65488cb-2bb0-7598-4380-4a2e9cc886db@eldorado.org.br>
Date: Thu, 4 Aug 2022 14:04:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 09/15] util: move 256-by-128 division helpers to int128
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-10-marcandre.lureau@redhat.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <20220712093528.4144184-10-marcandre.lureau@redhat.com>
X-OriginalArrivalTime: 04 Aug 2022 17:04:33.0027 (UTC)
 FILETIME=[44940530:01D8A824]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

This is a multi-part message in MIME format.
--------------D8aA8QtwOgC5mtNFLeGMzmKE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAxMi8wNy8yMDIyIDA2OjM1LCBtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20gd3Jv
dGU6DQo+IEZyb206IE1hcmMtQW5kcsOpIEx1cmVhdTxtYXJjYW5kcmUubHVyZWF1QHJlZGhh
dC5jb20+DQo+DQo+IEJyZWFrIGEgY3ljbGljIGRlcGVuZGVuY3kgYmV0d2VlbiBpbnQxMjgg
YW5kIGhvc3QtdXRpbHMuDQpSZXZpZXdlZC1ieTogTHVjYXMgTWF0ZXVzIENhc3RybyA8bHVj
YXMuYXJhdWpvQGVsZG9yYWRvLm9yZy5icj4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTWFyYy1B
bmRyw6kgTHVyZWF1PG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICAg
aW5jbHVkZS9xZW11L2hvc3QtdXRpbHMuaCB8ICAgMyAtDQo+ICAgaW5jbHVkZS9xZW11L2lu
dDEyOC5oICAgICB8ICAgMyArDQo+ICAgdXRpbC9ob3N0LXV0aWxzLmMgICAgICAgICB8IDE4
MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIHV0aWwvaW50
MTI4LmMgICAgICAgICAgICAgfCAxODAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4gICA0IGZpbGVzIGNoYW5nZWQsIDE4MyBpbnNlcnRpb25zKCspLCAxODMg
ZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3FlbXUvaG9zdC11dGls
cy5oIGIvaW5jbHVkZS9xZW11L2hvc3QtdXRpbHMuaA0KPiBpbmRleCAyOWYzYTk5ODc4ODAu
LmZhMjI4YTRhODZlMiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9xZW11L2hvc3QtdXRpbHMu
aA0KPiArKysgYi9pbmNsdWRlL3FlbXUvaG9zdC11dGlscy5oDQo+IEBAIC0zMiw3ICszMiw2
IEBADQo+DQo+ICAgI2luY2x1ZGUgInFlbXUvY29tcGlsZXIuaCINCj4gICAjaW5jbHVkZSAi
cWVtdS9ic3dhcC5oIg0KPiAtI2luY2x1ZGUgInFlbXUvaW50MTI4LmgiDQo+DQo+ICAgI2lm
ZGVmIENPTkZJR19JTlQxMjgNCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgbXVsdTY0KHVpbnQ2
NF90ICpwbG93LCB1aW50NjRfdCAqcGhpZ2gsDQo+IEBAIC03ODUsNiArNzg0LDQgQEAgc3Rh
dGljIGlubGluZSB1aW50NjRfdCB1ZGl2X3Fybm5kKHVpbnQ2NF90ICpyLCB1aW50NjRfdCBu
MSwNCj4gICAjZW5kaWYNCj4gICB9DQo+DQo+IC1JbnQxMjggZGl2dTI1NihJbnQxMjggKnBs
b3csIEludDEyOCAqcGhpZ2gsIEludDEyOCBkaXZpc29yKTsNCj4gLUludDEyOCBkaXZzMjU2
KEludDEyOCAqcGxvdywgSW50MTI4ICpwaGlnaCwgSW50MTI4IGRpdmlzb3IpOw0KPiAgICNl
bmRpZg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9xZW11L2ludDEyOC5oIGIvaW5jbHVkZS9x
ZW11L2ludDEyOC5oDQo+IGluZGV4IGQyYjc2Y2E2YWNkYy4uODIzYzYxZWRiMGZkIDEwMDY0
NA0KPiAtLS0gYS9pbmNsdWRlL3FlbXUvaW50MTI4LmgNCj4gKysrIGIvaW5jbHVkZS9xZW11
L2ludDEyOC5oDQo+IEBAIC00NzIsNCArNDcyLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGJz
d2FwMTI4cyhJbnQxMjggKnMpDQo+ICAgI2RlZmluZSBJTlQxMjhfTUFYIGludDEyOF9tYWtl
MTI4KFVJTlQ2NF9NQVgsIElOVDY0X01BWCkNCj4gICAjZGVmaW5lIElOVDEyOF9NSU4gaW50
MTI4X21ha2UxMjgoMCwgSU5UNjRfTUlOKQ0KPg0KPiArSW50MTI4IGRpdnUyNTYoSW50MTI4
ICpwbG93LCBJbnQxMjggKnBoaWdoLCBJbnQxMjggZGl2aXNvcik7DQo+ICtJbnQxMjggZGl2
czI1NihJbnQxMjggKnBsb3csIEludDEyOCAqcGhpZ2gsIEludDEyOCBkaXZpc29yKTsNCj4g
Kw0KPiAgICNlbmRpZiAvKiBJTlQxMjhfSCAqLw0KPiBkaWZmIC0tZ2l0IGEvdXRpbC9ob3N0
LXV0aWxzLmMgYi91dGlsL2hvc3QtdXRpbHMuYw0KPiBpbmRleCBmYjkxYmNiYTgyM2QuLjk2
ZDVkYzBiZWQyNSAxMDA2NDQNCj4gLS0tIGEvdXRpbC9ob3N0LXV0aWxzLmMNCj4gKysrIGIv
dXRpbC9ob3N0LXV0aWxzLmMNCj4gQEAgLTI2NiwxODMgKzI2NiwzIEBAIHZvaWQgdWxzaGlm
dCh1aW50NjRfdCAqcGxvdywgdWludDY0X3QgKnBoaWdoLCBpbnQzMl90IHNoaWZ0LCBib29s
ICpvdmVyZmxvdykNCj4gICAgICAgICAgICpwbG93ID0gKnBsb3cgPDwgc2hpZnQ7DQo+ICAg
ICAgIH0NCj4gICB9DQo+IC0NCj4gLS8qDQo+IC0gKiBVbnNpZ25lZCAyNTYtYnktMTI4IGRp
dmlzaW9uLg0KPiAtICogUmV0dXJucyB0aGUgcmVtYWluZGVyIHZpYSByLg0KPiAtICogUmV0
dXJucyBsb3dlciAxMjggYml0IG9mIHF1b3RpZW50Lg0KPiAtICogTmVlZHMgYSBub3JtYWxp
emVkIGRpdmlzb3IgKG1vc3Qgc2lnbmlmaWNhbnQgYml0IHNldCB0byAxKS4NCj4gLSAqDQo+
IC0gKiBBZGFwdGVkIGZyb20gaW5jbHVkZS9xZW11L2hvc3QtdXRpbHMuaCB1ZGl2X3Fybm5k
LA0KPiAtICogZnJvbSB0aGUgR05VIE11bHRpIFByZWNpc2lvbiBMaWJyYXJ5IC0gbG9uZ2xv
bmcuaCBfX3VkaXZfcXJubmQNCj4gLSAqIChodHRwczovL2dtcGxpYi5vcmcvcmVwby9nbXAv
ZmlsZS90aXAvbG9uZ2xvbmcuaCkNCj4gLSAqDQo+IC0gKiBMaWNlbnNlZCB1bmRlciB0aGUg
R1BMdjIvTEdQTHYzDQo+IC0gKi8NCj4gLXN0YXRpYyBJbnQxMjggdWRpdjI1Nl9xcm5uZChJ
bnQxMjggKnIsIEludDEyOCBuMSwgSW50MTI4IG4wLCBJbnQxMjggZCkNCj4gLXsNCj4gLSAg
ICBJbnQxMjggZDAsIGQxLCBxMCwgcTEsIHIxLCByMCwgbTsNCj4gLSAgICB1aW50NjRfdCBt
cDAsIG1wMTsNCj4gLQ0KPiAtICAgIGQwID0gaW50MTI4X21ha2U2NChpbnQxMjhfZ2V0bG8o
ZCkpOw0KPiAtICAgIGQxID0gaW50MTI4X21ha2U2NChpbnQxMjhfZ2V0aGkoZCkpOw0KPiAt
DQo+IC0gICAgcjEgPSBpbnQxMjhfcmVtdShuMSwgZDEpOw0KPiAtICAgIHExID0gaW50MTI4
X2RpdnUobjEsIGQxKTsNCj4gLSAgICBtcDAgPSBpbnQxMjhfZ2V0bG8ocTEpOw0KPiAtICAg
IG1wMSA9IGludDEyOF9nZXRoaShxMSk7DQo+IC0gICAgbXVsdTEyOCgmbXAwLCAmbXAxLCBp
bnQxMjhfZ2V0bG8oZDApKTsNCj4gLSAgICBtID0gaW50MTI4X21ha2UxMjgobXAwLCBtcDEp
Ow0KPiAtICAgIHIxID0gaW50MTI4X21ha2UxMjgoaW50MTI4X2dldGhpKG4wKSwgaW50MTI4
X2dldGxvKHIxKSk7DQo+IC0gICAgaWYgKGludDEyOF91bHQocjEsIG0pKSB7DQo+IC0gICAg
ICAgIHExID0gaW50MTI4X3N1YihxMSwgaW50MTI4X29uZSgpKTsNCj4gLSAgICAgICAgcjEg
PSBpbnQxMjhfYWRkKHIxLCBkKTsNCj4gLSAgICAgICAgaWYgKGludDEyOF91Z2UocjEsIGQp
KSB7DQo+IC0gICAgICAgICAgICBpZiAoaW50MTI4X3VsdChyMSwgbSkpIHsNCj4gLSAgICAg
ICAgICAgICAgICBxMSA9IGludDEyOF9zdWIocTEsIGludDEyOF9vbmUoKSk7DQo+IC0gICAg
ICAgICAgICAgICAgcjEgPSBpbnQxMjhfYWRkKHIxLCBkKTsNCj4gLSAgICAgICAgICAgIH0N
Cj4gLSAgICAgICAgfQ0KPiAtICAgIH0NCj4gLSAgICByMSA9IGludDEyOF9zdWIocjEsIG0p
Ow0KPiAtDQo+IC0gICAgcjAgPSBpbnQxMjhfcmVtdShyMSwgZDEpOw0KPiAtICAgIHEwID0g
aW50MTI4X2RpdnUocjEsIGQxKTsNCj4gLSAgICBtcDAgPSBpbnQxMjhfZ2V0bG8ocTApOw0K
PiAtICAgIG1wMSA9IGludDEyOF9nZXRoaShxMCk7DQo+IC0gICAgbXVsdTEyOCgmbXAwLCAm
bXAxLCBpbnQxMjhfZ2V0bG8oZDApKTsNCj4gLSAgICBtID0gaW50MTI4X21ha2UxMjgobXAw
LCBtcDEpOw0KPiAtICAgIHIwID0gaW50MTI4X21ha2UxMjgoaW50MTI4X2dldGxvKG4wKSwg
aW50MTI4X2dldGxvKHIwKSk7DQo+IC0gICAgaWYgKGludDEyOF91bHQocjAsIG0pKSB7DQo+
IC0gICAgICAgIHEwID0gaW50MTI4X3N1YihxMCwgaW50MTI4X29uZSgpKTsNCj4gLSAgICAg
ICAgcjAgPSBpbnQxMjhfYWRkKHIwLCBkKTsNCj4gLSAgICAgICAgaWYgKGludDEyOF91Z2Uo
cjAsIGQpKSB7DQo+IC0gICAgICAgICAgICBpZiAoaW50MTI4X3VsdChyMCwgbSkpIHsNCj4g
LSAgICAgICAgICAgICAgICBxMCA9IGludDEyOF9zdWIocTAsIGludDEyOF9vbmUoKSk7DQo+
IC0gICAgICAgICAgICAgICAgcjAgPSBpbnQxMjhfYWRkKHIwLCBkKTsNCj4gLSAgICAgICAg
ICAgIH0NCj4gLSAgICAgICAgfQ0KPiAtICAgIH0NCj4gLSAgICByMCA9IGludDEyOF9zdWIo
cjAsIG0pOw0KPiAtDQo+IC0gICAgKnIgPSByMDsNCj4gLSAgICByZXR1cm4gaW50MTI4X29y
KGludDEyOF9sc2hpZnQocTEsIDY0KSwgcTApOw0KPiAtfQ0KPiAtDQo+IC0vKg0KPiAtICog
VW5zaWduZWQgMjU2LWJ5LTEyOCBkaXZpc2lvbi4NCj4gLSAqIFJldHVybnMgdGhlIHJlbWFp
bmRlci4NCj4gLSAqIFJldHVybnMgcXVvdGllbnQgdmlhIHBsb3cgYW5kIHBoaWdoLg0KPiAt
ICogQWxzbyByZXR1cm5zIHRoZSByZW1haW5kZXIgdmlhIHRoZSBmdW5jdGlvbiByZXR1cm4g
dmFsdWUuDQo+IC0gKi8NCj4gLUludDEyOCBkaXZ1MjU2KEludDEyOCAqcGxvdywgSW50MTI4
ICpwaGlnaCwgSW50MTI4IGRpdmlzb3IpDQo+IC17DQo+IC0gICAgSW50MTI4IGRoaSA9ICpw
aGlnaDsNCj4gLSAgICBJbnQxMjggZGxvID0gKnBsb3c7DQo+IC0gICAgSW50MTI4IHJlbSwg
ZGhpZ2hlc3Q7DQo+IC0gICAgaW50IHNoOw0KPiAtDQo+IC0gICAgaWYgKCFpbnQxMjhfbnoo
ZGl2aXNvcikgfHwgIWludDEyOF9ueihkaGkpKSB7DQo+IC0gICAgICAgICpwbG93ICA9IGlu
dDEyOF9kaXZ1KGRsbywgZGl2aXNvcik7DQo+IC0gICAgICAgICpwaGlnaCA9IGludDEyOF96
ZXJvKCk7DQo+IC0gICAgICAgIHJldHVybiBpbnQxMjhfcmVtdShkbG8sIGRpdmlzb3IpOw0K
PiAtICAgIH0gZWxzZSB7DQo+IC0gICAgICAgIHNoID0gY2x6MTI4KGRpdmlzb3IpOw0KPiAt
DQo+IC0gICAgICAgIGlmIChpbnQxMjhfdWx0KGRoaSwgZGl2aXNvcikpIHsNCj4gLSAgICAg
ICAgICAgIGlmIChzaCAhPSAwKSB7DQo+IC0gICAgICAgICAgICAgICAgLyogbm9ybWFsaXpl
IHRoZSBkaXZpc29yLCBzaGlmdGluZyB0aGUgZGl2aWRlbmQgYWNjb3JkaW5nbHkgKi8NCj4g
LSAgICAgICAgICAgICAgICBkaXZpc29yID0gaW50MTI4X2xzaGlmdChkaXZpc29yLCBzaCk7
DQo+IC0gICAgICAgICAgICAgICAgZGhpID0gaW50MTI4X29yKGludDEyOF9sc2hpZnQoZGhp
LCBzaCksDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludDEyOF91cnNo
aWZ0KGRsbywgKDEyOCAtIHNoKSkpOw0KPiAtICAgICAgICAgICAgICAgIGRsbyA9IGludDEy
OF9sc2hpZnQoZGxvLCBzaCk7DQo+IC0gICAgICAgICAgICB9DQo+IC0NCj4gLSAgICAgICAg
ICAgICpwaGlnaCA9IGludDEyOF96ZXJvKCk7DQo+IC0gICAgICAgICAgICAqcGxvdyA9IHVk
aXYyNTZfcXJubmQoJnJlbSwgZGhpLCBkbG8sIGRpdmlzb3IpOw0KPiAtICAgICAgICB9IGVs
c2Ugew0KPiAtICAgICAgICAgICAgaWYgKHNoICE9IDApIHsNCj4gLSAgICAgICAgICAgICAg
ICAvKiBub3JtYWxpemUgdGhlIGRpdmlzb3IsIHNoaWZ0aW5nIHRoZSBkaXZpZGVuZCBhY2Nv
cmRpbmdseSAqLw0KPiAtICAgICAgICAgICAgICAgIGRpdmlzb3IgPSBpbnQxMjhfbHNoaWZ0
KGRpdmlzb3IsIHNoKTsNCj4gLSAgICAgICAgICAgICAgICBkaGlnaGVzdCA9IGludDEyOF9y
c2hpZnQoZGhpLCAoMTI4IC0gc2gpKTsNCj4gLSAgICAgICAgICAgICAgICBkaGkgPSBpbnQx
Mjhfb3IoaW50MTI4X2xzaGlmdChkaGksIHNoKSwNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50MTI4X3Vyc2hpZnQoZGxvLCAoMTI4IC0gc2gpKSk7DQo+IC0gICAg
ICAgICAgICAgICAgZGxvID0gaW50MTI4X2xzaGlmdChkbG8sIHNoKTsNCj4gLQ0KPiAtICAg
ICAgICAgICAgICAgICpwaGlnaCA9IHVkaXYyNTZfcXJubmQoJmRoaSwgZGhpZ2hlc3QsIGRo
aSwgZGl2aXNvcik7DQo+IC0gICAgICAgICAgICB9IGVsc2Ugew0KPiAtICAgICAgICAgICAg
ICAgIC8qDQo+IC0gICAgICAgICAgICAgICAgICogZGhpID49IGRpdmlzb3INCj4gLSAgICAg
ICAgICAgICAgICAgKiBTaW5jZSB0aGUgTVNCIG9mIGRpdmlzb3IgaXMgc2V0IChzaCA9PSAw
KSwNCj4gLSAgICAgICAgICAgICAgICAgKiAoZGhpIC0gZGl2aXNvcikgPCBkaXZpc29yDQo+
IC0gICAgICAgICAgICAgICAgICoNCj4gLSAgICAgICAgICAgICAgICAgKiBUaHVzLCB0aGUg
aGlnaCBwYXJ0IG9mIHRoZSBxdW90aWVudCBpcyAxLCBhbmQgd2UgY2FuDQo+IC0gICAgICAg
ICAgICAgICAgICogY2FsY3VsYXRlIHRoZSBsb3cgcGFydCB3aXRoIGEgc2luZ2xlIGNhbGwg
dG8gdWRpdl9xcm5uZA0KPiAtICAgICAgICAgICAgICAgICAqIGFmdGVyIHN1YnRyYWN0aW5n
IGRpdmlzb3IgZnJvbSBkaGkNCj4gLSAgICAgICAgICAgICAgICAgKi8NCj4gLSAgICAgICAg
ICAgICAgICBkaGkgPSBpbnQxMjhfc3ViKGRoaSwgZGl2aXNvcik7DQo+IC0gICAgICAgICAg
ICAgICAgKnBoaWdoID0gaW50MTI4X29uZSgpOw0KPiAtICAgICAgICAgICAgfQ0KPiAtDQo+
IC0gICAgICAgICAgICAqcGxvdyA9IHVkaXYyNTZfcXJubmQoJnJlbSwgZGhpLCBkbG8sIGRp
dmlzb3IpOw0KPiAtICAgICAgICB9DQo+IC0NCj4gLSAgICAgICAgLyoNCj4gLSAgICAgICAg
ICogc2luY2UgdGhlIGRpdmlkZW5kL2Rpdmlzb3IgbWlnaHQgaGF2ZSBiZWVuIG5vcm1hbGl6
ZWQsDQo+IC0gICAgICAgICAqIHRoZSByZW1haW5kZXIgbWlnaHQgYWxzbyBoYXZlIHRvIGJl
IHNoaWZ0ZWQgYmFjaw0KPiAtICAgICAgICAgKi8NCj4gLSAgICAgICAgcmVtID0gaW50MTI4
X3Vyc2hpZnQocmVtLCBzaCk7DQo+IC0gICAgICAgIHJldHVybiByZW07DQo+IC0gICAgfQ0K
PiAtfQ0KPiAtDQo+IC0vKg0KPiAtICogU2lnbmVkIDI1Ni1ieS0xMjggZGl2aXNpb24uDQo+
IC0gKiBSZXR1cm5zIHF1b3RpZW50IHZpYSBwbG93IGFuZCBwaGlnaC4NCj4gLSAqIEFsc28g
cmV0dXJucyB0aGUgcmVtYWluZGVyIHZpYSB0aGUgZnVuY3Rpb24gcmV0dXJuIHZhbHVlLg0K
PiAtICovDQo+IC1JbnQxMjggZGl2czI1NihJbnQxMjggKnBsb3csIEludDEyOCAqcGhpZ2gs
IEludDEyOCBkaXZpc29yKQ0KPiAtew0KPiAtICAgIGJvb2wgbmVnX3F1b3RpZW50ID0gZmFs
c2UsIG5lZ19yZW1haW5kZXIgPSBmYWxzZTsNCj4gLSAgICBJbnQxMjggdW5zaWdfaGkgPSAq
cGhpZ2gsIHVuc2lnX2xvID0gKnBsb3c7DQo+IC0gICAgSW50MTI4IHJlbTsNCj4gLQ0KPiAt
ICAgIGlmICghaW50MTI4X25vbm5lZygqcGhpZ2gpKSB7DQo+IC0gICAgICAgIG5lZ19xdW90
aWVudCA9ICFuZWdfcXVvdGllbnQ7DQo+IC0gICAgICAgIG5lZ19yZW1haW5kZXIgPSAhbmVn
X3JlbWFpbmRlcjsNCj4gLQ0KPiAtICAgICAgICBpZiAoIWludDEyOF9ueih1bnNpZ19sbykp
IHsNCj4gLSAgICAgICAgICAgIHVuc2lnX2hpID0gaW50MTI4X25lZyh1bnNpZ19oaSk7DQo+
IC0gICAgICAgIH0gZWxzZSB7DQo+IC0gICAgICAgICAgICB1bnNpZ19oaSA9IGludDEyOF9u
b3QodW5zaWdfaGkpOw0KPiAtICAgICAgICAgICAgdW5zaWdfbG8gPSBpbnQxMjhfbmVnKHVu
c2lnX2xvKTsNCj4gLSAgICAgICAgfQ0KPiAtICAgIH0NCj4gLQ0KPiAtICAgIGlmICghaW50
MTI4X25vbm5lZyhkaXZpc29yKSkgew0KPiAtICAgICAgICBuZWdfcXVvdGllbnQgPSAhbmVn
X3F1b3RpZW50Ow0KPiAtDQo+IC0gICAgICAgIGRpdmlzb3IgPSBpbnQxMjhfbmVnKGRpdmlz
b3IpOw0KPiAtICAgIH0NCj4gLQ0KPiAtICAgIHJlbSA9IGRpdnUyNTYoJnVuc2lnX2xvLCAm
dW5zaWdfaGksIGRpdmlzb3IpOw0KPiAtDQo+IC0gICAgaWYgKG5lZ19xdW90aWVudCkgew0K
PiAtICAgICAgICBpZiAoIWludDEyOF9ueih1bnNpZ19sbykpIHsNCj4gLSAgICAgICAgICAg
ICpwaGlnaCA9IGludDEyOF9uZWcodW5zaWdfaGkpOw0KPiAtICAgICAgICAgICAgKnBsb3cg
PSBpbnQxMjhfemVybygpOw0KPiAtICAgICAgICB9IGVsc2Ugew0KPiAtICAgICAgICAgICAg
KnBoaWdoID0gaW50MTI4X25vdCh1bnNpZ19oaSk7DQo+IC0gICAgICAgICAgICAqcGxvdyA9
IGludDEyOF9uZWcodW5zaWdfbG8pOw0KPiAtICAgICAgICB9DQo+IC0gICAgfSBlbHNlIHsN
Cj4gLSAgICAgICAgKnBoaWdoID0gdW5zaWdfaGk7DQo+IC0gICAgICAgICpwbG93ID0gdW5z
aWdfbG87DQo+IC0gICAgfQ0KPiAtDQo+IC0gICAgaWYgKG5lZ19yZW1haW5kZXIpIHsNCj4g
LSAgICAgICAgcmV0dXJuIGludDEyOF9uZWcocmVtKTsNCj4gLSAgICB9IGVsc2Ugew0KPiAt
ICAgICAgICByZXR1cm4gcmVtOw0KPiAtICAgIH0NCj4gLX0NCj4gZGlmZiAtLWdpdCBhL3V0
aWwvaW50MTI4LmMgYi91dGlsL2ludDEyOC5jDQo+IGluZGV4IGVkOGYyNWZlZjE2MS4uNDgy
YzYzYjY1NTFlIDEwMDY0NA0KPiAtLS0gYS91dGlsL2ludDEyOC5jDQo+ICsrKyBiL3V0aWwv
aW50MTI4LmMNCj4gQEAgLTE0NSwzICsxNDUsMTgzIEBAIEludDEyOCBpbnQxMjhfcmVtcyhJ
bnQxMjggYSwgSW50MTI4IGIpDQo+ICAgfQ0KPg0KPiAgICNlbmRpZg0KPiArDQo+ICsvKg0K
PiArICogVW5zaWduZWQgMjU2LWJ5LTEyOCBkaXZpc2lvbi4NCj4gKyAqIFJldHVybnMgdGhl
IHJlbWFpbmRlciB2aWEgci4NCj4gKyAqIFJldHVybnMgbG93ZXIgMTI4IGJpdCBvZiBxdW90
aWVudC4NCj4gKyAqIE5lZWRzIGEgbm9ybWFsaXplZCBkaXZpc29yIChtb3N0IHNpZ25pZmlj
YW50IGJpdCBzZXQgdG8gMSkuDQo+ICsgKg0KPiArICogQWRhcHRlZCBmcm9tIGluY2x1ZGUv
cWVtdS9ob3N0LXV0aWxzLmggdWRpdl9xcm5uZCwNCj4gKyAqIGZyb20gdGhlIEdOVSBNdWx0
aSBQcmVjaXNpb24gTGlicmFyeSAtIGxvbmdsb25nLmggX191ZGl2X3Fybm5kDQo+ICsgKiAo
aHR0cHM6Ly9nbXBsaWIub3JnL3JlcG8vZ21wL2ZpbGUvdGlwL2xvbmdsb25nLmgpDQo+ICsg
Kg0KPiArICogTGljZW5zZWQgdW5kZXIgdGhlIEdQTHYyL0xHUEx2Mw0KPiArICovDQo+ICtz
dGF0aWMgSW50MTI4IHVkaXYyNTZfcXJubmQoSW50MTI4ICpyLCBJbnQxMjggbjEsIEludDEy
OCBuMCwgSW50MTI4IGQpDQo+ICt7DQo+ICsgICAgSW50MTI4IGQwLCBkMSwgcTAsIHExLCBy
MSwgcjAsIG07DQo+ICsgICAgdWludDY0X3QgbXAwLCBtcDE7DQo+ICsNCj4gKyAgICBkMCA9
IGludDEyOF9tYWtlNjQoaW50MTI4X2dldGxvKGQpKTsNCj4gKyAgICBkMSA9IGludDEyOF9t
YWtlNjQoaW50MTI4X2dldGhpKGQpKTsNCj4gKw0KPiArICAgIHIxID0gaW50MTI4X3JlbXUo
bjEsIGQxKTsNCj4gKyAgICBxMSA9IGludDEyOF9kaXZ1KG4xLCBkMSk7DQo+ICsgICAgbXAw
ID0gaW50MTI4X2dldGxvKHExKTsNCj4gKyAgICBtcDEgPSBpbnQxMjhfZ2V0aGkocTEpOw0K
PiArICAgIG11bHUxMjgoJm1wMCwgJm1wMSwgaW50MTI4X2dldGxvKGQwKSk7DQo+ICsgICAg
bSA9IGludDEyOF9tYWtlMTI4KG1wMCwgbXAxKTsNCj4gKyAgICByMSA9IGludDEyOF9tYWtl
MTI4KGludDEyOF9nZXRoaShuMCksIGludDEyOF9nZXRsbyhyMSkpOw0KPiArICAgIGlmIChp
bnQxMjhfdWx0KHIxLCBtKSkgew0KPiArICAgICAgICBxMSA9IGludDEyOF9zdWIocTEsIGlu
dDEyOF9vbmUoKSk7DQo+ICsgICAgICAgIHIxID0gaW50MTI4X2FkZChyMSwgZCk7DQo+ICsg
ICAgICAgIGlmIChpbnQxMjhfdWdlKHIxLCBkKSkgew0KPiArICAgICAgICAgICAgaWYgKGlu
dDEyOF91bHQocjEsIG0pKSB7DQo+ICsgICAgICAgICAgICAgICAgcTEgPSBpbnQxMjhfc3Vi
KHExLCBpbnQxMjhfb25lKCkpOw0KPiArICAgICAgICAgICAgICAgIHIxID0gaW50MTI4X2Fk
ZChyMSwgZCk7DQo+ICsgICAgICAgICAgICB9DQo+ICsgICAgICAgIH0NCj4gKyAgICB9DQo+
ICsgICAgcjEgPSBpbnQxMjhfc3ViKHIxLCBtKTsNCj4gKw0KPiArICAgIHIwID0gaW50MTI4
X3JlbXUocjEsIGQxKTsNCj4gKyAgICBxMCA9IGludDEyOF9kaXZ1KHIxLCBkMSk7DQo+ICsg
ICAgbXAwID0gaW50MTI4X2dldGxvKHEwKTsNCj4gKyAgICBtcDEgPSBpbnQxMjhfZ2V0aGko
cTApOw0KPiArICAgIG11bHUxMjgoJm1wMCwgJm1wMSwgaW50MTI4X2dldGxvKGQwKSk7DQo+
ICsgICAgbSA9IGludDEyOF9tYWtlMTI4KG1wMCwgbXAxKTsNCj4gKyAgICByMCA9IGludDEy
OF9tYWtlMTI4KGludDEyOF9nZXRsbyhuMCksIGludDEyOF9nZXRsbyhyMCkpOw0KPiArICAg
IGlmIChpbnQxMjhfdWx0KHIwLCBtKSkgew0KPiArICAgICAgICBxMCA9IGludDEyOF9zdWIo
cTAsIGludDEyOF9vbmUoKSk7DQo+ICsgICAgICAgIHIwID0gaW50MTI4X2FkZChyMCwgZCk7
DQo+ICsgICAgICAgIGlmIChpbnQxMjhfdWdlKHIwLCBkKSkgew0KPiArICAgICAgICAgICAg
aWYgKGludDEyOF91bHQocjAsIG0pKSB7DQo+ICsgICAgICAgICAgICAgICAgcTAgPSBpbnQx
Mjhfc3ViKHEwLCBpbnQxMjhfb25lKCkpOw0KPiArICAgICAgICAgICAgICAgIHIwID0gaW50
MTI4X2FkZChyMCwgZCk7DQo+ICsgICAgICAgICAgICB9DQo+ICsgICAgICAgIH0NCj4gKyAg
ICB9DQo+ICsgICAgcjAgPSBpbnQxMjhfc3ViKHIwLCBtKTsNCj4gKw0KPiArICAgICpyID0g
cjA7DQo+ICsgICAgcmV0dXJuIGludDEyOF9vcihpbnQxMjhfbHNoaWZ0KHExLCA2NCksIHEw
KTsNCj4gK30NCj4gKw0KPiArLyoNCj4gKyAqIFVuc2lnbmVkIDI1Ni1ieS0xMjggZGl2aXNp
b24uDQo+ICsgKiBSZXR1cm5zIHRoZSByZW1haW5kZXIuDQo+ICsgKiBSZXR1cm5zIHF1b3Rp
ZW50IHZpYSBwbG93IGFuZCBwaGlnaC4NCj4gKyAqIEFsc28gcmV0dXJucyB0aGUgcmVtYWlu
ZGVyIHZpYSB0aGUgZnVuY3Rpb24gcmV0dXJuIHZhbHVlLg0KPiArICovDQo+ICtJbnQxMjgg
ZGl2dTI1NihJbnQxMjggKnBsb3csIEludDEyOCAqcGhpZ2gsIEludDEyOCBkaXZpc29yKQ0K
PiArew0KPiArICAgIEludDEyOCBkaGkgPSAqcGhpZ2g7DQo+ICsgICAgSW50MTI4IGRsbyA9
ICpwbG93Ow0KPiArICAgIEludDEyOCByZW0sIGRoaWdoZXN0Ow0KPiArICAgIGludCBzaDsN
Cj4gKw0KPiArICAgIGlmICghaW50MTI4X256KGRpdmlzb3IpIHx8ICFpbnQxMjhfbnooZGhp
KSkgew0KPiArICAgICAgICAqcGxvdyAgPSBpbnQxMjhfZGl2dShkbG8sIGRpdmlzb3IpOw0K
PiArICAgICAgICAqcGhpZ2ggPSBpbnQxMjhfemVybygpOw0KPiArICAgICAgICByZXR1cm4g
aW50MTI4X3JlbXUoZGxvLCBkaXZpc29yKTsNCj4gKyAgICB9IGVsc2Ugew0KPiArICAgICAg
ICBzaCA9IGNsejEyOChkaXZpc29yKTsNCj4gKw0KPiArICAgICAgICBpZiAoaW50MTI4X3Vs
dChkaGksIGRpdmlzb3IpKSB7DQo+ICsgICAgICAgICAgICBpZiAoc2ggIT0gMCkgew0KPiAr
ICAgICAgICAgICAgICAgIC8qIG5vcm1hbGl6ZSB0aGUgZGl2aXNvciwgc2hpZnRpbmcgdGhl
IGRpdmlkZW5kIGFjY29yZGluZ2x5ICovDQo+ICsgICAgICAgICAgICAgICAgZGl2aXNvciA9
IGludDEyOF9sc2hpZnQoZGl2aXNvciwgc2gpOw0KPiArICAgICAgICAgICAgICAgIGRoaSA9
IGludDEyOF9vcihpbnQxMjhfbHNoaWZ0KGRoaSwgc2gpLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbnQxMjhfdXJzaGlmdChkbG8sICgxMjggLSBzaCkpKTsNCj4g
KyAgICAgICAgICAgICAgICBkbG8gPSBpbnQxMjhfbHNoaWZ0KGRsbywgc2gpOw0KPiArICAg
ICAgICAgICAgfQ0KPiArDQo+ICsgICAgICAgICAgICAqcGhpZ2ggPSBpbnQxMjhfemVybygp
Ow0KPiArICAgICAgICAgICAgKnBsb3cgPSB1ZGl2MjU2X3Fybm5kKCZyZW0sIGRoaSwgZGxv
LCBkaXZpc29yKTsNCj4gKyAgICAgICAgfSBlbHNlIHsNCj4gKyAgICAgICAgICAgIGlmIChz
aCAhPSAwKSB7DQo+ICsgICAgICAgICAgICAgICAgLyogbm9ybWFsaXplIHRoZSBkaXZpc29y
LCBzaGlmdGluZyB0aGUgZGl2aWRlbmQgYWNjb3JkaW5nbHkgKi8NCj4gKyAgICAgICAgICAg
ICAgICBkaXZpc29yID0gaW50MTI4X2xzaGlmdChkaXZpc29yLCBzaCk7DQo+ICsgICAgICAg
ICAgICAgICAgZGhpZ2hlc3QgPSBpbnQxMjhfcnNoaWZ0KGRoaSwgKDEyOCAtIHNoKSk7DQo+
ICsgICAgICAgICAgICAgICAgZGhpID0gaW50MTI4X29yKGludDEyOF9sc2hpZnQoZGhpLCBz
aCksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludDEyOF91cnNoaWZ0
KGRsbywgKDEyOCAtIHNoKSkpOw0KPiArICAgICAgICAgICAgICAgIGRsbyA9IGludDEyOF9s
c2hpZnQoZGxvLCBzaCk7DQo+ICsNCj4gKyAgICAgICAgICAgICAgICAqcGhpZ2ggPSB1ZGl2
MjU2X3Fybm5kKCZkaGksIGRoaWdoZXN0LCBkaGksIGRpdmlzb3IpOw0KPiArICAgICAgICAg
ICAgfSBlbHNlIHsNCj4gKyAgICAgICAgICAgICAgICAvKg0KPiArICAgICAgICAgICAgICAg
ICAqIGRoaSA+PSBkaXZpc29yDQo+ICsgICAgICAgICAgICAgICAgICogU2luY2UgdGhlIE1T
QiBvZiBkaXZpc29yIGlzIHNldCAoc2ggPT0gMCksDQo+ICsgICAgICAgICAgICAgICAgICog
KGRoaSAtIGRpdmlzb3IpIDwgZGl2aXNvcg0KPiArICAgICAgICAgICAgICAgICAqDQo+ICsg
ICAgICAgICAgICAgICAgICogVGh1cywgdGhlIGhpZ2ggcGFydCBvZiB0aGUgcXVvdGllbnQg
aXMgMSwgYW5kIHdlIGNhbg0KPiArICAgICAgICAgICAgICAgICAqIGNhbGN1bGF0ZSB0aGUg
bG93IHBhcnQgd2l0aCBhIHNpbmdsZSBjYWxsIHRvIHVkaXZfcXJubmQNCj4gKyAgICAgICAg
ICAgICAgICAgKiBhZnRlciBzdWJ0cmFjdGluZyBkaXZpc29yIGZyb20gZGhpDQo+ICsgICAg
ICAgICAgICAgICAgICovDQo+ICsgICAgICAgICAgICAgICAgZGhpID0gaW50MTI4X3N1Yihk
aGksIGRpdmlzb3IpOw0KPiArICAgICAgICAgICAgICAgICpwaGlnaCA9IGludDEyOF9vbmUo
KTsNCj4gKyAgICAgICAgICAgIH0NCj4gKw0KPiArICAgICAgICAgICAgKnBsb3cgPSB1ZGl2
MjU2X3Fybm5kKCZyZW0sIGRoaSwgZGxvLCBkaXZpc29yKTsNCj4gKyAgICAgICAgfQ0KPiAr
DQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIHNpbmNlIHRoZSBkaXZpZGVuZC9kaXZp
c29yIG1pZ2h0IGhhdmUgYmVlbiBub3JtYWxpemVkLA0KPiArICAgICAgICAgKiB0aGUgcmVt
YWluZGVyIG1pZ2h0IGFsc28gaGF2ZSB0byBiZSBzaGlmdGVkIGJhY2sNCj4gKyAgICAgICAg
ICovDQo+ICsgICAgICAgIHJlbSA9IGludDEyOF91cnNoaWZ0KHJlbSwgc2gpOw0KPiArICAg
ICAgICByZXR1cm4gcmVtOw0KPiArICAgIH0NCj4gK30NCj4gKw0KPiArLyoNCj4gKyAqIFNp
Z25lZCAyNTYtYnktMTI4IGRpdmlzaW9uLg0KPiArICogUmV0dXJucyBxdW90aWVudCB2aWEg
cGxvdyBhbmQgcGhpZ2guDQo+ICsgKiBBbHNvIHJldHVybnMgdGhlIHJlbWFpbmRlciB2aWEg
dGhlIGZ1bmN0aW9uIHJldHVybiB2YWx1ZS4NCj4gKyAqLw0KPiArSW50MTI4IGRpdnMyNTYo
SW50MTI4ICpwbG93LCBJbnQxMjggKnBoaWdoLCBJbnQxMjggZGl2aXNvcikNCj4gK3sNCj4g
KyAgICBib29sIG5lZ19xdW90aWVudCA9IGZhbHNlLCBuZWdfcmVtYWluZGVyID0gZmFsc2U7
DQo+ICsgICAgSW50MTI4IHVuc2lnX2hpID0gKnBoaWdoLCB1bnNpZ19sbyA9ICpwbG93Ow0K
PiArICAgIEludDEyOCByZW07DQo+ICsNCj4gKyAgICBpZiAoIWludDEyOF9ub25uZWcoKnBo
aWdoKSkgew0KPiArICAgICAgICBuZWdfcXVvdGllbnQgPSAhbmVnX3F1b3RpZW50Ow0KPiAr
ICAgICAgICBuZWdfcmVtYWluZGVyID0gIW5lZ19yZW1haW5kZXI7DQo+ICsNCj4gKyAgICAg
ICAgaWYgKCFpbnQxMjhfbnoodW5zaWdfbG8pKSB7DQo+ICsgICAgICAgICAgICB1bnNpZ19o
aSA9IGludDEyOF9uZWcodW5zaWdfaGkpOw0KPiArICAgICAgICB9IGVsc2Ugew0KPiArICAg
ICAgICAgICAgdW5zaWdfaGkgPSBpbnQxMjhfbm90KHVuc2lnX2hpKTsNCj4gKyAgICAgICAg
ICAgIHVuc2lnX2xvID0gaW50MTI4X25lZyh1bnNpZ19sbyk7DQo+ICsgICAgICAgIH0NCj4g
KyAgICB9DQo+ICsNCj4gKyAgICBpZiAoIWludDEyOF9ub25uZWcoZGl2aXNvcikpIHsNCj4g
KyAgICAgICAgbmVnX3F1b3RpZW50ID0gIW5lZ19xdW90aWVudDsNCj4gKw0KPiArICAgICAg
ICBkaXZpc29yID0gaW50MTI4X25lZyhkaXZpc29yKTsNCj4gKyAgICB9DQo+ICsNCj4gKyAg
ICByZW0gPSBkaXZ1MjU2KCZ1bnNpZ19sbywgJnVuc2lnX2hpLCBkaXZpc29yKTsNCj4gKw0K
PiArICAgIGlmIChuZWdfcXVvdGllbnQpIHsNCj4gKyAgICAgICAgaWYgKCFpbnQxMjhfbnoo
dW5zaWdfbG8pKSB7DQo+ICsgICAgICAgICAgICAqcGhpZ2ggPSBpbnQxMjhfbmVnKHVuc2ln
X2hpKTsNCj4gKyAgICAgICAgICAgICpwbG93ID0gaW50MTI4X3plcm8oKTsNCj4gKyAgICAg
ICAgfSBlbHNlIHsNCj4gKyAgICAgICAgICAgICpwaGlnaCA9IGludDEyOF9ub3QodW5zaWdf
aGkpOw0KPiArICAgICAgICAgICAgKnBsb3cgPSBpbnQxMjhfbmVnKHVuc2lnX2xvKTsNCj4g
KyAgICAgICAgfQ0KPiArICAgIH0gZWxzZSB7DQo+ICsgICAgICAgICpwaGlnaCA9IHVuc2ln
X2hpOw0KPiArICAgICAgICAqcGxvdyA9IHVuc2lnX2xvOw0KPiArICAgIH0NCj4gKw0KPiAr
ICAgIGlmIChuZWdfcmVtYWluZGVyKSB7DQo+ICsgICAgICAgIHJldHVybiBpbnQxMjhfbmVn
KHJlbSk7DQo+ICsgICAgfSBlbHNlIHsNCj4gKyAgICAgICAgcmV0dXJuIHJlbTsNCj4gKyAg
ICB9DQo+ICt9DQo+IC0tDQo+IDIuMzcuMC5yYzANCj4NCj4NCi0tIA0KTHVjYXMgTWF0ZXVz
IE0uIEFyYXVqbyBlIENhc3Rybw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETyAN
CjxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvP3V0bV9jYW1wYWlnbj1hc3NpbmF0dXJh
X2RlX2UtbWFpbCZ1dG1fbWVkaXVtPWVtYWlsJnV0bV9zb3VyY2U9UkQrU3RhdGlvbj4NCkRl
cGFydGFtZW50byBDb21wdXRhw6fDo28gRW1iYXJjYWRhDQpBbmFsaXN0YSBkZSBTb2Z0d2Fy
ZSBUcmFpbmVlDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9y
YWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=
--------------D8aA8QtwOgC5mtNFLeGMzmKE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/07/2022 06:35,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:marcandre.lure=
au@redhat.com">marcandre.lureau@redhat.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20220712093528.4144184-10-marcandre.lureau@redhat.com">=

      <pre class=3D"moz-quote-pre" wrap=3D"">
From: Marc-Andr=C3=A9 Lureau <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:marcandre.lureau@redhat.com">&lt;marcandre.lureau@redhat.com&gt;</a=
>

Break a cyclic dependency between int128 and host-utils.</pre>
    </blockquote>
    Reviewed-by: Lucas Mateus Castro
    <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lucas.araujo@eldora=
do.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a><br>
    <blockquote type=3D"cite"
      cite=3D"mid:20220712093528.4144184-10-marcandre.lureau@redhat.com">=

      <pre class=3D"moz-quote-pre" wrap=3D"">

Signed-off-by: Marc-Andr=C3=A9 Lureau <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:marcandre.lureau@redhat.com">&lt;marcandre.lureau@redhat.c=
om&gt;</a>
---
 include/qemu/host-utils.h |   3 -
 include/qemu/int128.h     |   3 +
 util/host-utils.c         | 180 --------------------------------------
 util/int128.c             | 180 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 183 insertions(+), 183 deletions(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 29f3a9987880..fa228a4a86e2 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -32,7 +32,6 @@

 #include "qemu/compiler.h"
 #include "qemu/bswap.h"
-#include "qemu/int128.h"

 #ifdef CONFIG_INT128
 static inline void mulu64(uint64_t *plow, uint64_t *phigh,
@@ -785,6 +784,4 @@ static inline uint64_t udiv_qrnnd(uint64_t *r, uint64=
_t n1,
 #endif
 }

-Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);
-Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor);
 #endif
diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index d2b76ca6acdc..823c61edb0fd 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -472,4 +472,7 @@ static inline void bswap128s(Int128 *s)
 #define INT128_MAX int128_make128(UINT64_MAX, INT64_MAX)
 #define INT128_MIN int128_make128(0, INT64_MIN)

+Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);
+Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor);
+
 #endif /* INT128_H */
diff --git a/util/host-utils.c b/util/host-utils.c
index fb91bcba823d..96d5dc0bed25 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -266,183 +266,3 @@ void ulshift(uint64_t *plow, uint64_t *phigh, int32=
_t shift, bool *overflow)
         *plow =3D *plow &lt;&lt; shift;
     }
 }
-
-/*
- * Unsigned 256-by-128 division.
- * Returns the remainder via r.
- * Returns lower 128 bit of quotient.
- * Needs a normalized divisor (most significant bit set to 1).
- *
- * Adapted from include/qemu/host-utils.h udiv_qrnnd,
- * from the GNU Multi Precision Library - longlong.h __udiv_qrnnd
- * (<a class=3D"moz-txt-link-freetext" href=3D"https://gmplib.org/repo/g=
mp/file/tip/longlong.h">https://gmplib.org/repo/gmp/file/tip/longlong.h</=
a>)
- *
- * Licensed under the GPLv2/LGPLv3
- */
-static Int128 udiv256_qrnnd(Int128 *r, Int128 n1, Int128 n0, Int128 d)
-{
-    Int128 d0, d1, q0, q1, r1, r0, m;
-    uint64_t mp0, mp1;
-
-    d0 =3D int128_make64(int128_getlo(d));
-    d1 =3D int128_make64(int128_gethi(d));
-
-    r1 =3D int128_remu(n1, d1);
-    q1 =3D int128_divu(n1, d1);
-    mp0 =3D int128_getlo(q1);
-    mp1 =3D int128_gethi(q1);
-    mulu128(&amp;mp0, &amp;mp1, int128_getlo(d0));
-    m =3D int128_make128(mp0, mp1);
-    r1 =3D int128_make128(int128_gethi(n0), int128_getlo(r1));
-    if (int128_ult(r1, m)) {
-        q1 =3D int128_sub(q1, int128_one());
-        r1 =3D int128_add(r1, d);
-        if (int128_uge(r1, d)) {
-            if (int128_ult(r1, m)) {
-                q1 =3D int128_sub(q1, int128_one());
-                r1 =3D int128_add(r1, d);
-            }
-        }
-    }
-    r1 =3D int128_sub(r1, m);
-
-    r0 =3D int128_remu(r1, d1);
-    q0 =3D int128_divu(r1, d1);
-    mp0 =3D int128_getlo(q0);
-    mp1 =3D int128_gethi(q0);
-    mulu128(&amp;mp0, &amp;mp1, int128_getlo(d0));
-    m =3D int128_make128(mp0, mp1);
-    r0 =3D int128_make128(int128_getlo(n0), int128_getlo(r0));
-    if (int128_ult(r0, m)) {
-        q0 =3D int128_sub(q0, int128_one());
-        r0 =3D int128_add(r0, d);
-        if (int128_uge(r0, d)) {
-            if (int128_ult(r0, m)) {
-                q0 =3D int128_sub(q0, int128_one());
-                r0 =3D int128_add(r0, d);
-            }
-        }
-    }
-    r0 =3D int128_sub(r0, m);
-
-    *r =3D r0;
-    return int128_or(int128_lshift(q1, 64), q0);
-}
-
-/*
- * Unsigned 256-by-128 division.
- * Returns the remainder.
- * Returns quotient via plow and phigh.
- * Also returns the remainder via the function return value.
- */
-Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)
-{
-    Int128 dhi =3D *phigh;
-    Int128 dlo =3D *plow;
-    Int128 rem, dhighest;
-    int sh;
-
-    if (!int128_nz(divisor) || !int128_nz(dhi)) {
-        *plow  =3D int128_divu(dlo, divisor);
-        *phigh =3D int128_zero();
-        return int128_remu(dlo, divisor);
-    } else {
-        sh =3D clz128(divisor);
-
-        if (int128_ult(dhi, divisor)) {
-            if (sh !=3D 0) {
-                /* normalize the divisor, shifting the dividend accordin=
gly */
-                divisor =3D int128_lshift(divisor, sh);
-                dhi =3D int128_or(int128_lshift(dhi, sh),
-                                int128_urshift(dlo, (128 - sh)));
-                dlo =3D int128_lshift(dlo, sh);
-            }
-
-            *phigh =3D int128_zero();
-            *plow =3D udiv256_qrnnd(&amp;rem, dhi, dlo, divisor);
-        } else {
-            if (sh !=3D 0) {
-                /* normalize the divisor, shifting the dividend accordin=
gly */
-                divisor =3D int128_lshift(divisor, sh);
-                dhighest =3D int128_rshift(dhi, (128 - sh));
-                dhi =3D int128_or(int128_lshift(dhi, sh),
-                                int128_urshift(dlo, (128 - sh)));
-                dlo =3D int128_lshift(dlo, sh);
-
-                *phigh =3D udiv256_qrnnd(&amp;dhi, dhighest, dhi, diviso=
r);
-            } else {
-                /*
-                 * dhi &gt;=3D divisor
-                 * Since the MSB of divisor is set (sh =3D=3D 0),
-                 * (dhi - divisor) &lt; divisor
-                 *
-                 * Thus, the high part of the quotient is 1, and we can
-                 * calculate the low part with a single call to udiv_qrn=
nd
-                 * after subtracting divisor from dhi
-                 */
-                dhi =3D int128_sub(dhi, divisor);
-                *phigh =3D int128_one();
-            }
-
-            *plow =3D udiv256_qrnnd(&amp;rem, dhi, dlo, divisor);
-        }
-
-        /*
-         * since the dividend/divisor might have been normalized,
-         * the remainder might also have to be shifted back
-         */
-        rem =3D int128_urshift(rem, sh);
-        return rem;
-    }
-}
-
-/*
- * Signed 256-by-128 division.
- * Returns quotient via plow and phigh.
- * Also returns the remainder via the function return value.
- */
-Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor)
-{
-    bool neg_quotient =3D false, neg_remainder =3D false;
-    Int128 unsig_hi =3D *phigh, unsig_lo =3D *plow;
-    Int128 rem;
-
-    if (!int128_nonneg(*phigh)) {
-        neg_quotient =3D !neg_quotient;
-        neg_remainder =3D !neg_remainder;
-
-        if (!int128_nz(unsig_lo)) {
-            unsig_hi =3D int128_neg(unsig_hi);
-        } else {
-            unsig_hi =3D int128_not(unsig_hi);
-            unsig_lo =3D int128_neg(unsig_lo);
-        }
-    }
-
-    if (!int128_nonneg(divisor)) {
-        neg_quotient =3D !neg_quotient;
-
-        divisor =3D int128_neg(divisor);
-    }
-
-    rem =3D divu256(&amp;unsig_lo, &amp;unsig_hi, divisor);
-
-    if (neg_quotient) {
-        if (!int128_nz(unsig_lo)) {
-            *phigh =3D int128_neg(unsig_hi);
-            *plow =3D int128_zero();
-        } else {
-            *phigh =3D int128_not(unsig_hi);
-            *plow =3D int128_neg(unsig_lo);
-        }
-    } else {
-        *phigh =3D unsig_hi;
-        *plow =3D unsig_lo;
-    }
-
-    if (neg_remainder) {
-        return int128_neg(rem);
-    } else {
-        return rem;
-    }
-}
diff --git a/util/int128.c b/util/int128.c
index ed8f25fef161..482c63b6551e 100644
--- a/util/int128.c
+++ b/util/int128.c
@@ -145,3 +145,183 @@ Int128 int128_rems(Int128 a, Int128 b)
 }

 #endif
+
+/*
+ * Unsigned 256-by-128 division.
+ * Returns the remainder via r.
+ * Returns lower 128 bit of quotient.
+ * Needs a normalized divisor (most significant bit set to 1).
+ *
+ * Adapted from include/qemu/host-utils.h udiv_qrnnd,
+ * from the GNU Multi Precision Library - longlong.h __udiv_qrnnd
+ * (<a class=3D"moz-txt-link-freetext" href=3D"https://gmplib.org/repo/g=
mp/file/tip/longlong.h">https://gmplib.org/repo/gmp/file/tip/longlong.h</=
a>)
+ *
+ * Licensed under the GPLv2/LGPLv3
+ */
+static Int128 udiv256_qrnnd(Int128 *r, Int128 n1, Int128 n0, Int128 d)
+{
+    Int128 d0, d1, q0, q1, r1, r0, m;
+    uint64_t mp0, mp1;
+
+    d0 =3D int128_make64(int128_getlo(d));
+    d1 =3D int128_make64(int128_gethi(d));
+
+    r1 =3D int128_remu(n1, d1);
+    q1 =3D int128_divu(n1, d1);
+    mp0 =3D int128_getlo(q1);
+    mp1 =3D int128_gethi(q1);
+    mulu128(&amp;mp0, &amp;mp1, int128_getlo(d0));
+    m =3D int128_make128(mp0, mp1);
+    r1 =3D int128_make128(int128_gethi(n0), int128_getlo(r1));
+    if (int128_ult(r1, m)) {
+        q1 =3D int128_sub(q1, int128_one());
+        r1 =3D int128_add(r1, d);
+        if (int128_uge(r1, d)) {
+            if (int128_ult(r1, m)) {
+                q1 =3D int128_sub(q1, int128_one());
+                r1 =3D int128_add(r1, d);
+            }
+        }
+    }
+    r1 =3D int128_sub(r1, m);
+
+    r0 =3D int128_remu(r1, d1);
+    q0 =3D int128_divu(r1, d1);
+    mp0 =3D int128_getlo(q0);
+    mp1 =3D int128_gethi(q0);
+    mulu128(&amp;mp0, &amp;mp1, int128_getlo(d0));
+    m =3D int128_make128(mp0, mp1);
+    r0 =3D int128_make128(int128_getlo(n0), int128_getlo(r0));
+    if (int128_ult(r0, m)) {
+        q0 =3D int128_sub(q0, int128_one());
+        r0 =3D int128_add(r0, d);
+        if (int128_uge(r0, d)) {
+            if (int128_ult(r0, m)) {
+                q0 =3D int128_sub(q0, int128_one());
+                r0 =3D int128_add(r0, d);
+            }
+        }
+    }
+    r0 =3D int128_sub(r0, m);
+
+    *r =3D r0;
+    return int128_or(int128_lshift(q1, 64), q0);
+}
+
+/*
+ * Unsigned 256-by-128 division.
+ * Returns the remainder.
+ * Returns quotient via plow and phigh.
+ * Also returns the remainder via the function return value.
+ */
+Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)
+{
+    Int128 dhi =3D *phigh;
+    Int128 dlo =3D *plow;
+    Int128 rem, dhighest;
+    int sh;
+
+    if (!int128_nz(divisor) || !int128_nz(dhi)) {
+        *plow  =3D int128_divu(dlo, divisor);
+        *phigh =3D int128_zero();
+        return int128_remu(dlo, divisor);
+    } else {
+        sh =3D clz128(divisor);
+
+        if (int128_ult(dhi, divisor)) {
+            if (sh !=3D 0) {
+                /* normalize the divisor, shifting the dividend accordin=
gly */
+                divisor =3D int128_lshift(divisor, sh);
+                dhi =3D int128_or(int128_lshift(dhi, sh),
+                                int128_urshift(dlo, (128 - sh)));
+                dlo =3D int128_lshift(dlo, sh);
+            }
+
+            *phigh =3D int128_zero();
+            *plow =3D udiv256_qrnnd(&amp;rem, dhi, dlo, divisor);
+        } else {
+            if (sh !=3D 0) {
+                /* normalize the divisor, shifting the dividend accordin=
gly */
+                divisor =3D int128_lshift(divisor, sh);
+                dhighest =3D int128_rshift(dhi, (128 - sh));
+                dhi =3D int128_or(int128_lshift(dhi, sh),
+                                int128_urshift(dlo, (128 - sh)));
+                dlo =3D int128_lshift(dlo, sh);
+
+                *phigh =3D udiv256_qrnnd(&amp;dhi, dhighest, dhi, diviso=
r);
+            } else {
+                /*
+                 * dhi &gt;=3D divisor
+                 * Since the MSB of divisor is set (sh =3D=3D 0),
+                 * (dhi - divisor) &lt; divisor
+                 *
+                 * Thus, the high part of the quotient is 1, and we can
+                 * calculate the low part with a single call to udiv_qrn=
nd
+                 * after subtracting divisor from dhi
+                 */
+                dhi =3D int128_sub(dhi, divisor);
+                *phigh =3D int128_one();
+            }
+
+            *plow =3D udiv256_qrnnd(&amp;rem, dhi, dlo, divisor);
+        }
+
+        /*
+         * since the dividend/divisor might have been normalized,
+         * the remainder might also have to be shifted back
+         */
+        rem =3D int128_urshift(rem, sh);
+        return rem;
+    }
+}
+
+/*
+ * Signed 256-by-128 division.
+ * Returns quotient via plow and phigh.
+ * Also returns the remainder via the function return value.
+ */
+Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor)
+{
+    bool neg_quotient =3D false, neg_remainder =3D false;
+    Int128 unsig_hi =3D *phigh, unsig_lo =3D *plow;
+    Int128 rem;
+
+    if (!int128_nonneg(*phigh)) {
+        neg_quotient =3D !neg_quotient;
+        neg_remainder =3D !neg_remainder;
+
+        if (!int128_nz(unsig_lo)) {
+            unsig_hi =3D int128_neg(unsig_hi);
+        } else {
+            unsig_hi =3D int128_not(unsig_hi);
+            unsig_lo =3D int128_neg(unsig_lo);
+        }
+    }
+
+    if (!int128_nonneg(divisor)) {
+        neg_quotient =3D !neg_quotient;
+
+        divisor =3D int128_neg(divisor);
+    }
+
+    rem =3D divu256(&amp;unsig_lo, &amp;unsig_hi, divisor);
+
+    if (neg_quotient) {
+        if (!int128_nz(unsig_lo)) {
+            *phigh =3D int128_neg(unsig_hi);
+            *plow =3D int128_zero();
+        } else {
+            *phigh =3D int128_not(unsig_hi);
+            *plow =3D int128_neg(unsig_lo);
+        }
+    } else {
+        *phigh =3D unsig_hi;
+        *plow =3D unsig_lo;
+    }
+
+    if (neg_remainder) {
+        return int128_neg(rem);
+    } else {
+        return rem;
+    }
+}
--
2.37.0.rc0


</pre>
    </blockquote>
    <div class=3D"moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href=3D"https://www.eldorado.org.br/?utm_campaign=3Dassinatura_de_e-mail&=
amp;utm_medium=3Demail&amp;utm_source=3DRD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computa=C3=A7=C3=A3o Embarcada<br>
      Analista de Software Trainee<br>
      <a href=3D"https://www.eldorado.org.br/disclaimer.html">Aviso Legal=

        - Disclaimer</a></div>
  </body>
</html>

--------------D8aA8QtwOgC5mtNFLeGMzmKE--

