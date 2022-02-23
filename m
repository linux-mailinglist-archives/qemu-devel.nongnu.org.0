Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DC34C1E11
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 22:56:23 +0100 (CET)
Received: from localhost ([::1]:41306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMzcU-000090-M8
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 16:56:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMzaF-0007hf-Er; Wed, 23 Feb 2022 16:54:03 -0500
Received: from [187.72.171.209] (port=28053 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMzaC-0003Yy-Gr; Wed, 23 Feb 2022 16:54:02 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 23 Feb 2022 18:53:58 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B60188000CB;
 Wed, 23 Feb 2022 18:53:57 -0300 (-03)
Message-ID: <da1eab47-8c32-ef20-a7e9-e9c7d5bcc094@eldorado.org.br>
Date: Wed, 23 Feb 2022 18:53:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 20/47] target/ppc: implement vslq
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-21-matheus.ferst@eldorado.org.br>
 <42d348af-e15c-00e4-8670-a2a17902b9e8@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <42d348af-e15c-00e4-8670-a2a17902b9e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 23 Feb 2022 21:53:58.0239 (UTC)
 FILETIME=[DC2196F0:01D828FF]
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

T24gMjIvMDIvMjAyMiAxOToxNCwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDIv
MjIvMjIgMDQ6MzYsIG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyIHdyb3RlOg0KPj4g
RnJvbTogTWF0aGV1cyBGZXJzdCA8bWF0aGV1cy5mZXJzdEBlbGRvcmFkby5vcmcuYnI+DQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWF0aGV1cyBGZXJzdCA8bWF0aGV1cy5mZXJzdEBlbGRv
cmFkby5vcmcuYnI+DQo+PiAtLS0NCj4+IHY0Og0KPj4gwqAgLcKgIE5ldyBpbiB2NC4NCj4+
IC0tLQ0KPj4gwqAgdGFyZ2V0L3BwYy9pbnNuMzIuZGVjb2RlwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMSArDQo+PiDCoCB0YXJnZXQvcHBjL3RyYW5zbGF0ZS92bXgtaW1wbC5jLmlu
YyB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiDCoCAyIGZpbGVzIGNo
YW5nZWQsIDQxIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Bw
Yy9pbnNuMzIuZGVjb2RlIGIvdGFyZ2V0L3BwYy9pbnNuMzIuZGVjb2RlDQo+PiBpbmRleCA4
OGJhZWJlMzVlLi4zNzk5MDY1NTA4IDEwMDY0NA0KPj4gLS0tIGEvdGFyZ2V0L3BwYy9pbnNu
MzIuZGVjb2RlDQo+PiArKysgYi90YXJnZXQvcHBjL2luc24zMi5kZWNvZGUNCj4+IEBAIC00
NzMsNiArNDczLDcgQEAgVlNMQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDAwMTAwIC4uLi4u
IC4uLi4uIC4uLi4uIA0KPj4gMDAxMDAwMDAxMDDCoMKgwqAgQFZYDQo+PiDCoCBWU0xIwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAwMDAxMDAgLi4uLi4gLi4uLi4gLi4uLi4gMDAxMDEwMDAx
MDDCoMKgwqAgQFZYDQo+PiDCoCBWU0xXwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwMDAxMDAg
Li4uLi4gLi4uLi4gLi4uLi4gMDAxMTAwMDAxMDDCoMKgwqAgQFZYDQo+PiDCoCBWU0xEwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAwMDAxMDAgLi4uLi4gLi4uLi4gLi4uLi4gMTAxMTEwMDAx
MDDCoMKgwqAgQFZYDQo+PiArVlNMUcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDAwMTAwIC4u
Li4uIC4uLi4uIC4uLi4uIDAwMTAwMDAwMTAxwqDCoMKgIEBWWA0KPj4NCj4+IMKgIFZTUkLC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAwMDEwMCAuLi4uLiAuLi4uLiAuLi4uLiAwMTAwMDAw
MDEwMMKgwqDCoCBAVlgNCj4+IMKgIFZTUkjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAwMDEw
MCAuLi4uLiAuLi4uLiAuLi4uLiAwMTAwMTAwMDEwMMKgwqDCoCBAVlgNCj4+IGRpZmYgLS1n
aXQgYS90YXJnZXQvcHBjL3RyYW5zbGF0ZS92bXgtaW1wbC5jLmluYyANCj4+IGIvdGFyZ2V0
L3BwYy90cmFuc2xhdGUvdm14LWltcGwuYy5pbmMNCj4+IGluZGV4IGVjNGYwZTc2NTQuLmNh
OThhNTQ1ZWYgMTAwNjQ0DQo+PiAtLS0gYS90YXJnZXQvcHBjL3RyYW5zbGF0ZS92bXgtaW1w
bC5jLmluYw0KPj4gKysrIGIvdGFyZ2V0L3BwYy90cmFuc2xhdGUvdm14LWltcGwuYy5pbmMN
Cj4+IEBAIC04MzQsNiArODM0LDQ2IEBAIFRSQU5TX0ZMQUdTKEFMVElWRUMsIFZTUkFILCBk
b192ZWN0b3JfZ3ZlYzNfVlgsIA0KPj4gTU9fMTYsIHRjZ19nZW5fZ3ZlY19zYXJ2KTsNCj4+
IMKgIFRSQU5TX0ZMQUdTKEFMVElWRUMsIFZTUkFXLCBkb192ZWN0b3JfZ3ZlYzNfVlgsIE1P
XzMyLCANCj4+IHRjZ19nZW5fZ3ZlY19zYXJ2KTsNCj4+IMKgIFRSQU5TX0ZMQUdTMihBTFRJ
VkVDXzIwNywgVlNSQUQsIGRvX3ZlY3Rvcl9ndmVjM19WWCwgTU9fNjQsIA0KPj4gdGNnX2dl
bl9ndmVjX3NhcnYpOw0KPj4NCj4+ICtzdGF0aWMgYm9vbCB0cmFuc19WU0xRKERpc2FzQ29u
dGV4dCAqY3R4LCBhcmdfVlggKmEpDQo+PiArew0KPj4gK8KgwqDCoCBUQ0d2X2k2NCBoaSwg
bG8sIHRtcCwgbiwgc2YgPSB0Y2dfY29uc3RhbnRfaTY0KDY0KTsNCj4+ICsNCj4+ICvCoMKg
wqAgUkVRVUlSRV9JTlNOU19GTEFHUzIoY3R4LCBJU0EzMTApOw0KPj4gK8KgwqDCoCBSRVFV
SVJFX1ZFQ1RPUihjdHgpOw0KPj4gKw0KPj4gK8KgwqDCoCBuID0gdGNnX3RlbXBfbmV3X2k2
NCgpOw0KPj4gK8KgwqDCoCBoaSA9IHRjZ190ZW1wX25ld19pNjQoKTsNCj4+ICvCoMKgwqAg
bG8gPSB0Y2dfdGVtcF9uZXdfaTY0KCk7DQo+PiArwqDCoMKgIHRtcCA9IHRjZ19jb25zdF9p
NjQoMCk7DQo+PiArDQo+PiArwqDCoMKgIGdldF9hdnI2NChsbywgYS0+dnJhLCBmYWxzZSk7
DQo+PiArwqDCoMKgIGdldF9hdnI2NChoaSwgYS0+dnJhLCB0cnVlKTsNCj4+ICsNCj4+ICvC
oMKgwqAgZ2V0X2F2cjY0KG4sIGEtPnZyYiwgdHJ1ZSk7DQo+PiArwqDCoMKgIHRjZ19nZW5f
YW5kaV9pNjQobiwgbiwgMHg3Rik7DQo+PiArDQo+PiArwqDCoMKgIHRjZ19nZW5fbW92Y29u
ZF9pNjQoVENHX0NPTkRfR0UsIGhpLCBuLCBzZiwgbG8sIGhpKTsNCj4+ICvCoMKgwqAgdGNn
X2dlbl9tb3Zjb25kX2k2NChUQ0dfQ09ORF9HRSwgbG8sIG4sIHNmLCB0bXAsIGxvKTsNCj4g
DQo+IFNpbmNlIHlvdSBoYXZlIHRvIG1hc2sgdHdpY2UgYW55d2F5LCBiZXR0ZXIgdXNlIChu
ICYgNjQpICE9IDAuDQo+IA0KDQpIbW0sIEknbSBub3Qgc3VyZSBpZiBJIHVuZGVyc3Rvb2Qu
IFRvIGNoZWNrICE9IDAgd2UnbGwgbmVlZCBhIHRlbXAgdG8gDQpob2xkIG4mNjQuIFdlIGNv
dWxkIHVzZSB0bXAgaGVyZSwgYnV0IHdlJ2xsIG5lZWQgYW5vdGhlciBvbmUgaW4gcGF0Y2gg
DQoyMi4gSXMgdGhhdCByaWdodD8NCg0KVGhhbmtzLA0KTWF0aGV1cyBLLiBGZXJzdA0KSW5z
dGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETyA8aHR0cDovL3d3dy5lbGRvcmFkby5vcmcu
YnIvPg0KQW5hbGlzdGEgZGUgU29mdHdhcmUNCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8
aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

