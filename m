Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA6A57BB19
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 18:08:39 +0200 (CEST)
Received: from localhost ([::1]:55042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oECFa-0007Ra-1K
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 12:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oEC7v-0007pC-8r; Wed, 20 Jul 2022 12:00:43 -0400
Received: from [200.168.210.66] (port=53431 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oEC7t-0003Mm-92; Wed, 20 Jul 2022 12:00:43 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Jul 2022 12:59:30 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 2977780012C;
 Wed, 20 Jul 2022 12:59:30 -0300 (-03)
Message-ID: <97df331d-7209-4c39-d554-ab332e1cc460@eldorado.org.br>
Date: Wed, 20 Jul 2022 12:59:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/ppc: fix unreachable code in do_ldst_quad()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
References: <20220720135723.1391598-1-danielhb413@gmail.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <20220720135723.1391598-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 20 Jul 2022 15:59:30.0737 (UTC)
 FILETIME=[B26F9210:01D89C51]
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

T24gMjAvMDcvMjAyMiAxMDo1NywgRGFuaWVsIEhlbnJpcXVlIEJhcmJvemEgd3JvdGU6DQo+
IENvdmVyaXR5IHJlcG9ydHMgdGhhdCBjb21taXQgZmMzNGU4MWFjZDUxICgidGFyZ2V0L3Bw
YzogYWRkIG1hY3JvcyB0bw0KPiBjaGVjayBwcml2aWxlZ2UgbGV2ZWwiKSB0dXJuZWQgdGhl
IGZvbGxvd2luZyBjb2RlIHVucmVhY2hhYmxlOg0KPiANCj4gaWYgKCFwcmVmaXhlZCAmJiAh
KGN0eC0+aW5zbnNfZmxhZ3MyICYgUFBDMl9MU1FfSVNBMjA3KSkgew0KPiAgICAgIC8qIGxx
IGFuZCBzdHEgd2VyZSBwcml2aWxlZ2VkIHByaW9yIHRvIFYuIDIuMDcgKi8NCj4gICAgICBS
RVFVSVJFX1NWKGN0eCk7DQo+IA0KPj4+PiAgICAgIENJRCAxNDkwNzU3OiAgQ29udHJvbCBm
bG93IGlzc3VlcyAgKFVOUkVBQ0hBQkxFKQ0KPj4+PiAgICAgIFRoaXMgY29kZSBjYW5ub3Qg
YmUgcmVhY2hlZDogImlmIChjdHgtPmxlX21vZGUpIHsNCj4gICAgICBpZiAoY3R4LT5sZV9t
b2RlKSB7DQo+ICAgICAgICAgIGdlbl9hbGlnbl9ub19sZShjdHgpOw0KPiAgICAgICAgICBy
ZXR1cm4gdHJ1ZTsNCj4gICAgICB9DQo+IH0NCj4gDQo+IFRoaXMgaGFwcGVucyBiZWNhdXNl
IHRoZSBtYWNybyBSRVFVSVJFX1NWKCksIGluIENPTkZJR19VU0VSX01PREUsIHdpbGwNCj4g
YWx3YXlzIHJlc3VsdCBpbiBhICdyZXR1cm4gdHJ1ZScgc3RhdGVtZW50Lg0KPiANCj4gRml4
IGl0IGJ5IHVzaW5nICIjaWYgIWRlZmluZWQoQ09ORklHX1VTRVJfT05MWSkiIHRvIGZvbGQg
dGhlIGNvZGUgdGhhdA0KPiBzaG91bGRuJ3QgYmUgdGhlcmUgaWYgd2UncmUgcnVubmluZyBp
biBhIG5vbi1wcml2aWxlZ2VkIHN0YXRlLiBUaGlzIGlzDQo+IGFsc28gaG93IHRoZSBSRVFV
SVJFX1NWKCkgbWFjcm8gaXMgYmVpbmcgdXNlZCBpbg0KPiBzdG9yYWdlLWN0cmwtaW1wbC5j
LmluYy4NCj4gDQo+IEZpeGVzOiBDb3Zlcml0eSBDSUQgMTQ5MDc1Nw0KPiBGaXhlczogZmMz
NGU4MWFjZDUxICgidGFyZ2V0L3BwYzogYWRkIG1hY3JvcyB0byBjaGVjayBwcml2aWxlZ2Ug
bGV2ZWwiKQ0KPiBDYzogTWF0aGV1cyBGZXJzdCA8bWF0aGV1cy5mZXJzdEBlbGRvcmFkby5v
cmcuYnI+DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBIZW5yaXF1ZSBCYXJib3phIDxkYW5p
ZWxoYjQxM0BnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIHRhcmdldC9wcGMvdHJhbnNsYXRlL2Zp
eGVkcG9pbnQtaW1wbC5jLmluYyB8IDQgKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvcHBjL3RyYW5zbGF0ZS9m
aXhlZHBvaW50LWltcGwuYy5pbmMgYi90YXJnZXQvcHBjL3RyYW5zbGF0ZS9maXhlZHBvaW50
LWltcGwuYy5pbmMNCj4gaW5kZXggZGIxNGQzYmViYy4uNGEzMmZhYzRmMyAxMDA2NDQNCj4g
LS0tIGEvdGFyZ2V0L3BwYy90cmFuc2xhdGUvZml4ZWRwb2ludC1pbXBsLmMuaW5jDQo+ICsr
KyBiL3RhcmdldC9wcGMvdHJhbnNsYXRlL2ZpeGVkcG9pbnQtaW1wbC5jLmluYw0KPiBAQCAt
ODIsMTAgKzgyLDE0IEBAIHN0YXRpYyBib29sIGRvX2xkc3RfcXVhZChEaXNhc0NvbnRleHQg
KmN0eCwgYXJnX0QgKmEsIGJvb2wgc3RvcmUsIGJvb2wgcHJlZml4ZWQpDQo+ICAgICAgICAg
ICAvKiBscSBhbmQgc3RxIHdlcmUgcHJpdmlsZWdlZCBwcmlvciB0byBWLiAyLjA3ICovDQo+
ICAgICAgICAgICBSRVFVSVJFX1NWKGN0eCk7DQo+IA0KPiArI2lmICFkZWZpbmVkKENPTkZJ
R19VU0VSX09OTFkpDQo+ICAgICAgICAgICBpZiAoY3R4LT5sZV9tb2RlKSB7DQo+ICAgICAg
ICAgICAgICAgZ2VuX2FsaWduX25vX2xlKGN0eCk7DQo+ICAgICAgICAgICAgICAgcmV0dXJu
IHRydWU7DQo+ICAgICAgICAgICB9DQo+ICsjZWxzZQ0KPiArICAgIHFlbXVfYnVpbGRfbm90
X3JlYWNoZWQoKTsNCg0Kbml0OiBJIHRoaW5rIHRoZSBpbmRlbnRhdGlvbiBoZXJlIGlzIG9m
ZiBieSAxIGxldmVsIChtaXNzaW5nIDQgc3BhY2VzKT8NCg0KPiArI2VuZGlmDQo+ICAgICAg
IH0NCj4gDQo+ICAgICAgIGlmICghc3RvcmUgJiYgdW5saWtlbHkoYS0+cmEgPT0gYS0+cnQp
KSB7DQo+IC0tDQo+IDIuMzYuMQ0KPiANCj4gDQpSZXZpZXdlZC1ieTogVsOtY3RvciBDb2xv
bWJvIDx2aWN0b3IuY29sb21ib0BlbGRvcmFkby5vcmcuYnI+DQoNCi0tIA0KVsOtY3RvciBD
b3JhIENvbG9tYm8NCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8NCkF2aXNvIExl
Z2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWlt
ZXIuaHRtbD4NCg==

