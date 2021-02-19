Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B1731F74F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:31:27 +0100 (CET)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD34I-0004Er-Jd
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:31:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Sandstrom@axis.com>)
 id 1lD324-0002xd-Mm
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:29:08 -0500
Received: from smtp1.axis.com ([195.60.68.17]:11625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Sandstrom@axis.com>)
 id 1lD322-0001p2-3y
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:29:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1613730546;
 x=1645266546; h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4HnrX9rotgj1JDbcrY06lCrX1rgTp7xh8juSZMjOMks=;
 b=OcZjhjA/wbAy8E6RhymSbnDm8rk/rTawu6m7sc+GsQvA7fY6+zEJsn5/
 1ar+2KhctafUncQ4UUqDgw9Dq/7YSeGzlWsFyWjYaz81hmCg9ncj2ZGFv
 m+8+J6Rz74UtoOSoxV/wvUkcUxeYpnx5xSfk4g4H7uDYJ5eoXLey2lZAu
 qgSkWSs3a+9iqwPIqqElP+UVfUQTyPBuDr/a3AXq6bx4iKSaLmzdtbLQX
 k8FuuadycDRscUUVO/S/l1Uby6NhboQZCzlmNTkHs+MFY1jBULgxKNyAl
 mcORt3KEO8VeUFHWe7McL75YAXRNvTKNggGCmRXPiXC0hohd8qYxdT//J Q==;
From: =?utf-8?B?U3RlZmFuIFNhbmRzdHLDtm0=?= <Stefan.Sandstrom@axis.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] Correct CRIS TCG register lifetime management
Thread-Topic: [PATCH v2] Correct CRIS TCG register lifetime management
Thread-Index: AQHXBiXsaEPzzLR6yUiER3hr5a8RBqpeQ/GAgAAUDkf///OPAIAA63UA
Date: Fri, 19 Feb 2021 10:29:01 +0000
Message-ID: <B798800B-873D-4FA3-908E-2A5F30C0FD05@axis.com>
References: <20210218184302.34984-1-stefans@axis.com>
 <2fe233c0-dfa8-763d-b122-fdef8145ea06@amsat.org>
 <1BD4E981-C339-495D-ABC1-74B0112CBC3E@axis.com>
 <e8099123-2640-69b6-45ab-070f6c04b960@amsat.org>
In-Reply-To: <e8099123-2640-69b6-45ab-070f6c04b960@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA5759425DDFD442B1C5439750D350B4@exhub.se.axis.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=195.60.68.17;
 envelope-from=Stefan.Sandstrom@axis.com; helo=smtp1.axis.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?utf-8?B?U3RlZmFuIFNhbmRzdHLDtm0=?= <Stefan.Sandstrom@axis.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gMTggRmViIDIwMjEsIGF0IDIxOjI2LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
ZjRidWdAYW1zYXQub3JnPiB3cm90ZToNCj4gDQo+IE9uIDIvMTgvMjEgOToxMCBQTSwgU3RlZmFu
IFNhbmRzdHLDtm0gd3JvdGU6DQo+Pj4gT24gMTggRmViIDIwMjEsIGF0IDIwOjU5LCBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPiB3cm90ZToNCj4+PiANCj4+PiDvu79I
aSBTdGVmYW4sDQo+Pj4gDQo+Pj4+IE9uIDIvMTgvMjEgNzo0MyBQTSwgU3RlZmFuIFNhbmRzdHLD
tm0gd3JvdGU6DQo+Pj4+IEZyb206IFN0ZWZhbiBTYW5kc3Ryb20gPHN0ZWZhbnNAYXhpcy5jb20+
DQo+Pj4+IA0KPj4+PiBBZGQgYW5kIGZpeCBkZWFsbG9jYXRpb24gb2YgdGVtcG9yYXJ5IFRDRyBy
ZWdpc3RlcnMgaW4gQ1JJUyBjb2RlDQo+Pj4+IGdlbmVyYXRpb24uDQo+Pj4gDQo+Pj4gV2hhdCBk
aWQgeW91IHJ1biB0byBmaWd1cmUgdGhpcyBvdXQ/DQo+PiANCj4+IEhpIFBoaWxpcHBlLA0KPj4g
DQo+PiBXZSB3ZXJlIGxvb2tpbmcgYXQgdGhlIGNvZGUgaW4gc2VhcmNoIGZvciBhbiBpc3N1ZSB0
aGF0IHNob3dlZCB1cCB3aGVuIHN3aXRjaGluZyB0byBhIG5ldyB2ZXJzaW9uIG9mIEdDQy4gDQo+
PiBJdCBsb29rZWQgbGlrZSBRRU1VIGV4ZWN1dGVkIHRoZSBDUklTIGNvZGUgd3JvbmcsIHNvIHdl
IHRvb2sgYSBsb29rIGF0IHRoZSBjb2RlLiBUaGUgcHJvYmxlbSB0dXJuZWQgb3V0IHRvIGJlIG91
dHNpZGUgUUVNVS4gVGhlc2UgcG90ZW50aWFsIGlzc3VlcyB3ZXJlIHNwb3R0ZWQgaW4gdGhlIHBy
b2Nlc3MuDQo+IA0KPiBHb29kIHRvIGtub3cuIERvIHlvdSBtaW5kIHNoYXJpbmcgeW91ciBHQ0Mg
dGVzdHMsIHNvIHdlIGNhbiBoYXZlIG1vcmUNCj4gQ1JJUyB0ZXN0aW5nPw0KDQpVbmZvcnR1bmF0
ZWx5LCB3ZSBkbyBub3QgaGF2ZSBzdWNoIHRlc3RzLg0KQnV0IGlmIHdlIGVuZCB1cCB3cml0aW5n
IHN1Y2ggdGVzdHMsIHdlJ2xsIGJlIGhhcHB5IHRvIHNoYXJlIHRoZW0uDQoNCkluIHRoaXMgY2Fz
ZSwgdHQgd2FzIHRoZSBHQ0MgdXNlZCBmb3IgYnVpbGRpbmcgUUVNVSB0aGF0IHdhcyB1cGdyYWRl
ZCwNCmFuZCBzb21lIHByb2R1Y3Rpb24gZmlybXdhcmUgdGhhdCB3YXMgdGVzdGVkIGluIFFFTVUg
dGhhdCBzdG9wcGVkIHdvcmtpbmcuDQoNCkJlc3QgcmVnYXJkcywNCi1zdGVmYW4NCg0KPiANCj4g
UmVnYXJkcywNCj4gDQo+IFBoaWwuDQoNCg==

