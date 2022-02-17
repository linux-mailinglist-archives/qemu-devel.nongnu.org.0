Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8917A4BA0BC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:14:14 +0100 (CET)
Received: from localhost ([::1]:40218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKgbt-0000aX-JJ
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nKgCB-0007hk-Qd; Thu, 17 Feb 2022 07:47:40 -0500
Received: from [187.72.171.209] (port=34490 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nKgC8-0001Sp-Rm; Thu, 17 Feb 2022 07:47:39 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 17 Feb 2022 09:45:49 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 9FE7A8001F1;
 Thu, 17 Feb 2022 09:45:49 -0300 (-03)
Message-ID: <c2f6d62d-66fd-ee62-b0fa-05fbec7fdaad@eldorado.org.br>
Date: Thu, 17 Feb 2022 09:45:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 10/37] target/ppc: Move Vector Compare Not Equal or
 Zero to decodetree
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-11-matheus.ferst@eldorado.org.br>
 <59ea114f-199c-518d-a570-19d091d90831@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <59ea114f-199c-518d-a570-19d091d90831@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 17 Feb 2022 12:45:49.0999 (UTC)
 FILETIME=[4ABBEBF0:01D823FC]
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

T24gMTEvMDIvMjAyMiAwMTo0MSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDIv
MTAvMjIgMjM6MzQsIG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyIHdyb3RlOg0KPj4g
K3N0YXRpYyB2b2lkIGdlbl92Y21wbmV6X3ZlYyh1bnNpZ25lZCB2ZWNlLCBUQ0d2X3ZlYyB0
LCBUQ0d2X3ZlYyBhLCANCj4+IFRDR3ZfdmVjIGIpDQo+PiArew0KPj4gK8KgwqDCoCBUQ0d2
X3ZlYyB0MCwgdDEsIHplcm87DQo+PiArDQo+PiArwqDCoMKgIHQwID0gdGNnX3RlbXBfbmV3
X3ZlY19tYXRjaGluZyh0KTsNCj4+ICvCoMKgwqAgdDEgPSB0Y2dfdGVtcF9uZXdfdmVjX21h
dGNoaW5nKHQpOw0KPj4gK8KgwqDCoCB6ZXJvID0gdGNnX2NvbnN0YW50X3ZlY19tYXRjaGlu
Zyh0LCB2ZWNlLCAwKTsNCj4+ICsNCj4+ICvCoMKgwqAgdGNnX2dlbl9jbXBfdmVjKFRDR19D
T05EX0VRLCB2ZWNlLCB0MCwgYSwgemVybyk7DQo+PiArwqDCoMKgIHRjZ19nZW5fY21wX3Zl
YyhUQ0dfQ09ORF9FUSwgdmVjZSwgdDEsIGIsIHplcm8pOw0KPj4gK8KgwqDCoCB0Y2dfZ2Vu
X2NtcF92ZWMoVENHX0NPTkRfTkUsIHZlY2UsIHQsIGEsIGIpOw0KPj4gKw0KPj4gK8KgwqDC
oCB0Y2dfZ2VuX29yX3ZlYyh2ZWNlLCB0LCB0LCB0MCk7DQo+PiArwqDCoMKgIHRjZ19nZW5f
b3JfdmVjKHZlY2UsIHQsIHQsIHQxKTsNCj4+ICsNCj4+ICvCoMKgwqAgdGNnX2dlbl9zaGxp
X3ZlYyh2ZWNlLCB0LCB0LCAoOCA8PCB2ZWNlKSAtIDEpOw0KPj4gK8KgwqDCoCB0Y2dfZ2Vu
X3NhcmlfdmVjKHZlY2UsIHQsIHQsICg4IDw8IHZlY2UpIC0gMSk7DQo+IA0KPiBObyBzaGlm
dGluZyByZXF1aXJlZCwgb25seSB0aGUgY21wLg0KPiANCj4+ICtzdGF0aWMgYm9vbCBkb192
Y21wbmV6KERpc2FzQ29udGV4dCAqY3R4LCBhcmdfVkMgKmEsIGludCB2ZWNlKQ0KPj4gK3sN
Cj4+ICvCoMKgwqAgc3RhdGljIGNvbnN0IFRDR09wY29kZSB2ZWNvcF9saXN0W10gPSB7DQo+
PiArwqDCoMKgwqDCoMKgwqAgSU5ERVhfb3BfY21wX3ZlYywgSU5ERVhfb3Bfc2hsaV92ZWMs
IElOREVYX29wX3NhcmlfdmVjLCAwDQo+PiArwqDCoMKgIH07DQo+IA0KPiBUaGVyZWZvcmUg
bm8gdmVjb3BfbGlzdCByZXF1aXJlZCAoY21wIGl0c2VsZiBpcyBtYW5kYXRvcnkpLg0KPiAN
Cg0KV2l0aG91dCB2ZWNvcF9saXN0LCB3ZSBoaXQgdGhlIGFzc2VydCBpbiB0Y2dfYXNzZXJ0
X2xpc3RlZF92ZWNvcCwgd2hpY2ggDQppcyBjYWxsZWQgZnJvbSB0Y2dfZ2VuX2NtcF92ZWMu
IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQoNClRoYW5rcywNCk1hdGhldXMgSy4gRmVyc3QN
Ckluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8gPGh0dHA6Ly93d3cuZWxkb3JhZG8u
b3JnLmJyLz4NCkFuYWxpc3RhIGRlIFNvZnR3YXJlDQpBdmlzbyBMZWdhbCAtIERpc2NsYWlt
ZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

