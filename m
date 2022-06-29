Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48255605D0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 18:28:38 +0200 (CEST)
Received: from localhost ([::1]:58678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6aYP-0000WV-EU
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 12:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o6aWJ-00083u-3o; Wed, 29 Jun 2022 12:26:27 -0400
Received: from [200.168.210.66] (port=23713 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o6aWE-00080G-WE; Wed, 29 Jun 2022 12:26:26 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 29 Jun 2022 13:25:15 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D3C90800502;
 Wed, 29 Jun 2022 13:25:14 -0300 (-03)
Message-ID: <9c97ae8f-f733-21fc-97d1-99af971e38fd@eldorado.org.br>
Date: Wed, 29 Jun 2022 13:25:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Slowness with multi-thread TCG?
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
 <dd5f1753-ff56-f248-9863-b39739fb6093@eldorado.org.br>
 <cf38218a-6e13-8024-8e08-fcdd74faa5a8@linux.ibm.com>
 <87h744keg7.fsf@linaro.org>
 <348a8b91-6d91-7429-615b-c0e3d23e4fce@linux.ibm.com>
 <8735fojukm.fsf@linaro.org>
 <44596e63-1631-ee12-231c-15be9c914a74@linux.ibm.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <44596e63-1631-ee12-231c-15be9c914a74@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 29 Jun 2022 16:25:15.0194 (UTC)
 FILETIME=[D05441A0:01D88BD4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMjkvMDYvMjAyMiAxMjozNiwgRnJlZGVyaWMgQmFycmF0IHdyb3RlOg0KPiBbRS1NQUlM
IEVYVEVSTk9dIE7Do28gY2xpcXVlIGVtIGxpbmtzIG91IGFicmEgYW5leG9zLCBhIG1lbm9z
IHF1ZSB2b2PDqiANCj4gcG9zc2EgY29uZmlybWFyIG8gcmVtZXRlbnRlIGUgc2FiZXIgcXVl
IG8gY29udGXDumRvIMOpIHNlZ3Vyby4gRW0gY2FzbyBkZSANCj4gZS1tYWlsIHN1c3BlaXRv
IGVudHJlIGltZWRpYXRhbWVudGUgZW0gY29udGF0byBjb20gbyBEVEkuDQo+IA0KPiBPbiAy
OS8wNi8yMDIyIDAwOjE3LCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+PiBJZiB5b3UgcnVuIHRo
ZSBzeW5jLXByb2ZpbGVyICh2aWEgdGhlIEhNUCAic3luYy1wcm9maWxlIG9uIikgeW91IGNh
bg0KPj4gdGhlbiBnZXQgYSBicmVha2Rvd24gb2Ygd2hpY2ggbXV0ZXgncyBhcmUgYmVpbmcg
aGVsZCBhbmQgZm9yIGhvdyBsb25nDQo+PiAoImluZm8gc3luYy1wcm9maWxlIikuDQo+IA0K
PiANCj4gQWxleCwgYSBodWdlIHRoYW5rIHlvdSENCj4gDQo+IEZvciB0aGUgcmVjb3JkLCB0
aGUgImluZm8gc3luYy1wcm9maWxlIiBzaG93ZWQ6DQo+IFR5cGXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIE9iamVjdMKgIENhbGwgc2l0ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgV2FpdCBUaW1lIChzKQ0KPiAgwqDCoMKgwqDCoMKgIENvdW50
wqAgQXZlcmFnZSAodXMpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tIA0KPiANCj4gQlFMIG11dGV4wqAgMHg1NWViODk0MjU1NDDCoCBhY2NlbC90
Y2cvY3B1LWV4ZWMuYzo3NDTCoMKgwqDCoMKgwqDCoMKgwqDCoCA5Ni4zMTU3OA0KPiAgwqDC
oMKgIDczNTg5OTM3wqDCoMKgwqDCoMKgwqDCoMKgIDEuMzENCj4gQlFMIG11dGV4wqAgMHg1
NWViODk0MjU1NDDCoCB0YXJnZXQvcHBjL2hlbHBlcl9yZWdzLmM6MjA3wqDCoMKgwqDCoMKg
wqAgMC4wMDE1MA0KPiAgwqDCoMKgwqDCoMKgwqAgMTE3OMKgwqDCoMKgwqDCoMKgwqDCoCAx
LjI3DQo+IA0KPiANCj4gQW5kIGl0IHBvaW50cyB0byBhIGxvY2sgaW4gdGhlIGludGVycnVw
dCBkZWxpdmVyeSBwYXRoLCBpbg0KPiBjcHVfaGFuZGxlX2ludGVycnVwdCgpLg0KPiANCj4g
SSBub3cgdW5kZXJzdGFuZCB0aGUgcm9vdCBjYXVzZS4gVGhlIGludGVycnVwdCBzaWduYWwg
Zm9yIHRoZQ0KPiBkZWNyZW1lbnRlciBpbnRlcnJ1cHQgcmVtYWlucyBzZXQgYmVjYXVzZSB0
aGUgaW50ZXJydXB0IGlzIG5vdCBiZWluZw0KPiBkZWxpdmVyZWQsIHBlciB0aGUgY29uZmln
LiBJJ20gbm90IHF1aXRlIHN1cmUgd2hhdCB0aGUgcHJvcGVyIGZpeCBpcyB5ZXQNCj4gKHRo
ZXJlIHNlZW1zIHRvIGJlIHNldmVyYWwgaW1wbGVtZW50YXRpb25zIG9mIHRoZSBkZWNyZW1l
bnRlciBvbiBwcGMpLA0KPiBidXQgYXQgbGVhc3QgSSB1bmRlcnN0YW5kIHdoeSB3ZSBhcmUg
c28gc2xvdy4NCj4gDQoNClRvIHN1bW1hcml6ZSB3aGF0IHdlIHRhbGtlZCBlbHNld2hlcmU6
DQoxIC0gVGhlIHRocmVhZHMgdGhhdCBhcmUgbm90IGRlY29tcHJlc3NpbmcgdGhlIGtlcm5l
bCBoYXZlIGEgcGVuZGluZyANClBQQ19JTlRFUlJVUFRfREVDUiwgYW5kIGNzLT5pbnRlcnJ1
cHRfcmVxdWVzdCBpcyBDUFVfSU5URVJSVVBUX0hBUkQ7DQoyIC0gY3B1X2hhbmRsZV9pbnRl
cnJ1cHQgY2FsbHMgcHBjX2NwdV9leGVjX2ludGVycnVwdCwgdGhhdCBjYWxscyANCnBwY19o
d19pbnRlcnJ1cHQgdG8gaGFuZGxlIHRoZSBpbnRlcnJ1cHQ7DQozIC0gcHBjX2NwdV9leGVj
X2ludGVycnVwdCBkZWNpZGVzIHRoYXQgdGhlIGludGVycnVwdCBjYW5ub3QgYmUgDQpkZWxp
dmVyZWQgaW1tZWRpYXRlbHksIHNvIHRoZSBjb3JyZXNwb25kaW5nIGJpdCBpbiANCmVudi0+
cGVuZGluZ19pbnRlcnJ1cHRzIGlzIG5vdCByZXNldDsNCjQgLSBwcGNfY3B1X2V4ZWNfaW50
ZXJydXB0IGRvZXMgbm90IGNoYW5nZSBjcy0+aW50ZXJydXB0X3JlcXVlc3QgYmVjYXVzZSAN
CnBlbmRpbmdfaW50ZXJydXB0cyAhPSAwLCBzbyBjcHVfaGFuZGxlX2ludGVycnVwdCB3aWxs
IGJlIGNhbGxlZCBhZ2Fpbi4NCg0KVGhpcyBsb29wIHdpbGwgYWNxdWlyZSBhbmQgcmVsZWFz
ZSBxZW11X211dGV4X2xvY2tfaW90aHJlYWQsIHNsb3dpbmcgDQpkb3duIG90aGVyIHRocmVh
ZHMgdGhhdCBuZWVkIHRoaXMgbG9jay4NCg0KPiBXaXRoIGEgcXVpY2sgaGFjaywgSSBjb3Vs
ZCB2ZXJpZnkgdGhhdCBieSBtb3ZpbmcgdGhhdCBzaWduYWwgb3V0IG9mIHRoZQ0KPiB3YXks
IHRoZSBkZWNvbXByZXNzaW9uIHRpbWUgb2YgdGhlIGtlcm5lbCBpcyBub3cgcGVhbnV0cywg
bm8gbWF0dGVyIHRoZQ0KPiBudW1iZXIgb2YgY3B1cy4gRXZlbiB3aXRoIG9uZSBjcHUsIHRo
ZSAxNSBzZWNvbmRzIG1lYXN1cmVkIGJlZm9yZSB3YXMNCj4gYWxyZWFkeSBhIGh1Z2Ugd2Fz
dGUsIHNvIGl0IHdhcyBub3QgcmVhbGx5IGEgbXVsdGlwbGUtY3B1cyBwcm9ibGVtLg0KPiBN
dWx0aXBsZSBjcHVzIHdlcmUganVzdCBoaWdobGlnaHRpbmcgaXQuDQo+IA0KPiBUaGFua3Mg
YWdhaW4hDQo+IA0KPiAgwqAgRnJlZA0KLS0gDQpNYXRoZXVzIEsuIEZlcnN0DQpJbnN0aXR1
dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPIDxodHRwOi8vd3d3LmVsZG9yYWRvLm9yZy5ici8+
DQpBbmFsaXN0YSBkZSBTb2Z0d2FyZQ0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRw
czovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

