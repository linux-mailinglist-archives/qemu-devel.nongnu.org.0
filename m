Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA234C1DE6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 22:46:58 +0100 (CET)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMzTM-0005Yp-SA
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 16:46:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMzRH-0004jL-Du; Wed, 23 Feb 2022 16:44:47 -0500
Received: from [187.72.171.209] (port=40438 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMzRD-0001y4-7E; Wed, 23 Feb 2022 16:44:47 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 23 Feb 2022 18:43:35 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 84E638000CB;
 Wed, 23 Feb 2022 18:43:35 -0300 (-03)
Message-ID: <a77fcbaa-6810-ada8-3aef-2beb140c00d3@eldorado.org.br>
Date: Wed, 23 Feb 2022 18:43:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 24/47] target/ppc: move vrl[bhwd]nm/vrl[bhwd]mi to
 decodetree
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-25-matheus.ferst@eldorado.org.br>
 <9111db3b-f238-7780-a5dd-4350721146b3@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <9111db3b-f238-7780-a5dd-4350721146b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 23 Feb 2022 21:43:35.0948 (UTC)
 FILETIME=[693784C0:01D828FE]
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMjIvMDIvMjAyMiAxOTozMCwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDIv
MjIvMjIgMDQ6MzYsIG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyIHdyb3RlOg0KPj4g
K3N0YXRpYyB2b2lkIGdlbl92cmxubV92ZWModW5zaWduZWQgdmVjZSwgVENHdl92ZWMgdnJ0
LCBUQ0d2X3ZlYyB2cmEsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgVENHdl92ZWMgdnJiKQ0KPj4gK3sNCj4+ICvCoMKgwqAgVENH
dl92ZWMgbWFzaywgbiA9IHRjZ190ZW1wX25ld192ZWNfbWF0Y2hpbmcodnJ0KTsNCj4+ICsN
Cj4+ICvCoMKgwqAgLyogQ3JlYXRlIHRoZSBtYXNrICovDQo+PiArwqDCoMKgIG1hc2sgPSBk
b192cmxfbWFza192ZWModmVjZSwgdnJiKTsNCj4+ICsNCj4+ICvCoMKgwqAgLyogRXh0cmFj
dCBuICovDQo+PiArwqDCoMKgIHRjZ19nZW5fZHVwaV92ZWModmVjZSwgbiwgKDggPDwgdmVj
ZSkgLSAxKTsNCj4+ICvCoMKgwqAgdGNnX2dlbl9hbmRfdmVjKHZlY2UsIG4sIHZyYiwgbik7
DQo+PiArDQo+PiArwqDCoMKgIC8qIFJvdGF0ZSBhbmQgbWFzayAqLw0KPj4gK8KgwqDCoCB0
Y2dfZ2VuX3JvdGx2X3ZlYyh2ZWNlLCB2cnQsIHZyYSwgbik7DQo+IA0KPiBOb3RlIHRoYXQg
cm90bHYgZG9lcyB0aGUgbWFza2luZyBpdHNlbGY6DQo+IA0KPiAvKg0KPiAgwqAqIEV4cGFu
ZCBEID0gQSA8PCAoQiAlIGVsZW1lbnQgYml0cykNCj4gIMKgKg0KPiAgwqAqIFVubGlrZSBz
Y2FsYXIgc2hpZnRzLCB3aGVyZSBpdCBpcyBlYXN5IGZvciB0aGUgdGFyZ2V0IGZyb250IGVu
ZA0KPiAgwqAqIHRvIGluY2x1ZGUgdGhlIG1vZHVsbyBhcyBwYXJ0IG9mIHRoZSBleHBhbnNp
b24uwqAgSWYgdGhlIHRhcmdldA0KPiAgwqAqIG5hdHVyYWxseSBpbmNsdWRlcyB0aGUgbW9k
dWxvIGFzIHBhcnQgb2YgdGhlIG9wZXJhdGlvbiwgZ3JlYXQhDQo+ICDCoCogSWYgdGhlIHRh
cmdldCBoYXMgc29tZSBvdGhlciBiZWhhdmlvdXIgZnJvbSBvdXQtb2YtcmFuZ2Ugc2hpZnRz
LA0KPiAgwqAqIHRoZW4gaXQgY291bGQgbm90IHVzZSB0aGlzIGZ1bmN0aW9uIGFueXdheSwg
YW5kIHdvdWxkIG5lZWQgdG8NCj4gIMKgKiBkbyBpdCdzIG93biBleHBhbnNpb24gd2l0aCBj
dXN0b20gZnVuY3Rpb25zLg0KPiAgwqAqLw0KPiANCg0KVXNpbmcgdGNnX2dlbl9yb3Rsdl92
ZWModmVjZSwgdnJ0LCB2cmEsIHZyYikgd29ya3Mgb24gUFBDIGJ1dCBmYWlscyBvbiANCng4
Ni4gSXQgbG9va3MgbGlrZSBhIHByb2JsZW0gb24gdGhlIGkzODYgYmFja2VuZC4gSXQncyB1
c2luZyANClZQU1tSTF1MVltEUV0sIGJ1dCBpbnN0ZWFkIG9mIHRoaXMgbW9kdWxvIGJlaGF2
aW9yLCB0aGVzZSBpbnN0cnVjdGlvbnMgDQp3cml0ZSB6ZXJvIHRvIHRoZSBlbGVtZW50WzFd
LiBJJ20gbm90IHN1cmUgaG93IHRvIGZpeCB0aGF0LiBEbyB3ZSBuZWVkIA0KYW4gSU5ERVhf
b3Bfc2hsdl92ZWMgY2FzZSBpbiBpMzg2IHRjZ19leHBhbmRfdmVjX29wPw0KDQo+PiArc3Rh
dGljIGJvb2wgZG9fdnJsbm0oRGlzYXNDb250ZXh0ICpjdHgsIGFyZ19WWCAqYSwgaW50IHZl
Y2UpDQo+PiArew0KPj4gK8KgwqDCoCBzdGF0aWMgY29uc3QgVENHT3Bjb2RlIHZlY29wX2xp
c3RbXSA9IHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBJTkRFWF9vcF9jbXBfdmVjLCBJTkRFWF9v
cF9yb3Rsdl92ZWMsIElOREVYX29wX3NhcmlfdmVjLA0KPj4gK8KgwqDCoMKgwqDCoMKgIElO
REVYX29wX3NobGlfdmVjLCBJTkRFWF9vcF9zaHJpX3ZlYywgSU5ERVhfb3Bfc2hydl92ZWMs
IDANCj4+ICvCoMKgwqAgfTsNCj4gDQo+IFdoZXJlIGlzIHNhcmkgdXNlZD8NCj4gDQoNCkkn
bGwgcmVtb3ZlIGluIHY1Lg0KDQpbMV0gU2VjdGlvbiA1LjMgb2YgDQpodHRwczovL3d3dy5p
bnRlbC5jb20vY29udGVudC9kYW0vZGV2ZWxvcC9leHRlcm5hbC91cy9lbi9kb2N1bWVudHMv
MzY5NDUNCg0KVGhhbmtzLA0KTWF0aGV1cyBLLiBGZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1
aXNhcyBFTERPUkFETyA8aHR0cDovL3d3dy5lbGRvcmFkby5vcmcuYnIvPg0KQW5hbGlzdGEg
ZGUgU29mdHdhcmUNCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxk
b3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

