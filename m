Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCC64CC760
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:55:53 +0100 (CET)
Received: from localhost ([::1]:45034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsUK-00078q-AL
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:55:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPsRp-0005rs-7N; Thu, 03 Mar 2022 15:53:17 -0500
Received: from [187.72.171.209] (port=29779 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPsRm-00053k-Cq; Thu, 03 Mar 2022 15:53:16 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 3 Mar 2022 17:53:08 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 536788001CD;
 Thu,  3 Mar 2022 17:53:08 -0300 (-03)
Message-ID: <864f1e7c-7f0c-c415-e111-d6943c12b032@eldorado.org.br>
Date: Thu, 3 Mar 2022 17:53:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/5] target/ppc: change xs[n]madd[am]sp to use
 float64r32_muladd
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
 <20220303172041.1915037-3-matheus.ferst@eldorado.org.br>
 <e65ce858-b6aa-e52e-c5e7-f6020b0b0b30@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <e65ce858-b6aa-e52e-c5e7-f6020b0b0b30@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 03 Mar 2022 20:53:08.0741 (UTC)
 FILETIME=[B02A6350:01D82F40]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: thuth@redhat.com, danielhb413@gmail.com, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMDMvMDMvMjAyMiAxNTo0OSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDMv
My8yMiAwNzoyMCwgbWF0aGV1cy5mZXJzdEBlbGRvcmFkby5vcmcuYnIgd3JvdGU6DQo+PiBG
cm9tOiBNYXRoZXVzIEZlcnN0IDxtYXRoZXVzLmZlcnN0QGVsZG9yYWRvLm9yZy5icj4NCj4+
DQo+PiBDaGFuZ2UgVlNYIFNjYWxhciBNdWx0aXBseS1BZGQvU3VidHJhY3QgVHlwZS1BL00g
U2luZ2xlIFByZWNpc2lvbg0KPj4gaGVscGVycyB0byB1c2UgZmxvYXQ2NHIzMl9tdWxhZGQu
IFRoaXMgbWV0aG9kIHNob3VsZCBjb3JyZWN0bHkgaGFuZGxlDQo+PiBhbGwgcm91bmRpbmcg
bW9kZXMsIHNvIHRoZSB3b3JrYXJvdW5kIGZvciBmbG9hdF9yb3VuZF9uZWFyZXN0X2V2ZW4g
Y2FuDQo+PiBiZSBkcm9wcGVkLg0KPj4NCj4+IFJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRl
cnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4+IFNpZ25lZC1vZmYtYnk6
IE1hdGhldXMgRmVyc3QgPG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyPg0KPj4gLS0t
DQo+PiDCoCB0YXJnZXQvcHBjL2ZwdV9oZWxwZXIuYyB8IDkzICsrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMzUgaW5z
ZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rhcmdl
dC9wcGMvZnB1X2hlbHBlci5jIGIvdGFyZ2V0L3BwYy9mcHVfaGVscGVyLmMNCj4+IGluZGV4
IDhmOTcwMjg4ZjUuLmM5NzM5NjhlZDYgMTAwNjQ0DQo+PiAtLS0gYS90YXJnZXQvcHBjL2Zw
dV9oZWxwZXIuYw0KPj4gKysrIGIvdGFyZ2V0L3BwYy9mcHVfaGVscGVyLmMNCj4+IEBAIC0x
OTE2LDIyICsxOTE2LDE5IEBAIHZvaWQgaGVscGVyX3hzZGl2cXAoQ1BVUFBDU3RhdGUgKmVu
diwgdWludDMyX3QgDQo+PiBvcGNvZGUsDQo+PiDCoMKgICrCoMKgIGZsZMKgwqAgLSB2c3Jf
dCBmaWVsZCAoVnNyRCgqKSBvciBWc3JXKCopKQ0KPj4gwqDCoCAqwqDCoCBzZnByZiAtIHNl
dCBGUFJGDQo+PiDCoMKgICovDQo+PiAtI2RlZmluZSBWU1hfUkUob3AsIG5lbHMsIHRwLCBm
bGQsIHNmcHJmLCANCj4+IHIyc3ApwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gKyNkZWZpbmUgVlNYX1JFKG9w
LCBuZWxzLCB0cCwgb3BfdHAsIGZsZCwgDQo+PiBzZnByZinCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gwqAgdm9p
ZCBoZWxwZXJfIyNvcChDUFVQUENTdGF0ZSAqZW52LCBwcGNfdnNyX3QgKnh0LCBwcGNfdnNy
X3QgDQo+PiAqeGIpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gICANCj4+IHsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIA0KPj4gXA0KPj4gwqDCoMKgwqDCoCBwcGNfdnNyX3Qg
dCA9IHsgDQo+PiB9O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwNCj4+IC3CoMKgwqAgaW50IA0KPj4gaTvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcDQo+PiArwqDCoMKgIGludCBpLCANCj4+IGZsYWdzO8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPj4gXA0KPj4gICAgICAg
DQo+PiBoZWxwZXJfcmVzZXRfZnBzdGF0dXMoZW52KTsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIA0KPj4gXA0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICANCj4+IFwNCj4+IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IG5lbHM7IGkr
KykgDQo+PiB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+IC3C
oMKgwqDCoMKgwqDCoCBpZiAodW5saWtlbHkodHAjI19pc19zaWduYWxpbmdfbmFuKHhiLT5m
bGQsIA0KPj4gJmVudi0+ZnBfc3RhdHVzKSkpIHvCoMKgwqDCoMKgIFwNCj4+ICvCoMKgwqDC
oMKgwqDCoCB0LmZsZCA9IG9wX3RwIyNfZGl2KHRwIyNfb25lLCB4Yi0+ZmxkLCANCj4+ICZl
bnYtPmZwX3N0YXR1cyk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gK8KgwqDC
oMKgwqDCoMKgIGZsYWdzID0gDQo+PiBnZXRfZmxvYXRfZXhjZXB0aW9uX2ZsYWdzKCZlbnYt
PmZwX3N0YXR1cyk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAodW5saWtlbHkoZmxhZ3MgJiBmbG9hdF9mbGFnX2ludmFs
aWRfc25hbikpIHsNCj4gDQo+IFlvdSBzZWVtIHRvIGhhdmUgc3F1YXNoZWQgdGhlIGNoYW5n
ZSB0byByZWNpcC1lc3RpbWF0ZSBpbnRvIHRoZSBzYW1lIA0KPiBwYXRjaCBhcyBtdWxhZGQu
DQo+IA0KPiANCj4+IC0jZGVmaW5lIFZTWF9SU1FSVEUob3AsIG5lbHMsIHRwLCBmbGQsIHNm
cHJmLCANCj4+IHIyc3ApwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcDQo+PiArI2RlZmluZSBWU1hfUlNRUlRFKG9wLCBuZWxzLCB0cCwg
b3BfdHAsIGZsZCwgDQo+PiBzZnByZinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+IA0KPiBBbmQgcmVjaXAtc3FydC1lc3RpbWF0ZS4N
Cj4gDQo+IEkgZ3Vlc3MgaXQncyBvayB0byBzcXVhc2gsIHNpbmNlIGl0J3MgYWxsIHJlbGF0
ZWQsIGJ1dCB5b3Ugc2hvdWxkIHVwZGF0ZSANCj4gdGhlIHBhdGNoDQo+IGRlc2NyaXB0aW9u
IGlmIHlvdSBsZWF2ZSBpdCB0aGlzIHdheS4NCj4gDQoNClNvcnJ5LCBJIGNoZXJyeS1waWNr
ZWQgdGhlIHdyb25nIGJyYW5jaC4gVGhpcyBwYXRjaCBzaG91bGQganVzdCBiZSBhIA0KcmVi
YXNlIG9mIHYxLiBJJ2xsIHNlbmQgdGhlIGNoYW5nZXMgdG8gDQpWU1hfe0FERF9TVUIsTVVM
LERJVixSRSxTUVJULFJTUVJURX0gaW4gYSBzZXBhcmF0ZSBwYXRjaCBzZXJpZXMgc2luY2Ug
DQppdCdzIG5vdCB0ZXN0LXJlbGF0ZWQuDQoNClRoYW5rcywNCk1hdGhldXMgSy4gRmVyc3QN
Ckluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8gPGh0dHA6Ly93d3cuZWxkb3JhZG8u
b3JnLmJyLz4NCkFuYWxpc3RhIGRlIFNvZnR3YXJlDQpBdmlzbyBMZWdhbCAtIERpc2NsYWlt
ZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

