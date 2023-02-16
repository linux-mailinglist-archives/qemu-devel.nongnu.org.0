Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F70698C76
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:58:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXGy-0007cG-Br; Thu, 16 Feb 2023 00:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pSXGw-0007c6-7D
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:57:34 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pSXGt-0000nn-R9
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:57:33 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id BEBAB341B4C;
 Thu, 16 Feb 2023 08:57:27 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=mta-01; bh=9EC6BTnSivIe5NGjEi
 948MI/8ATs7cCVOo8HU8VWpOc=; b=MX1c0d1wOWwQCDQtXs+EeW1JbT+5kec0hE
 XNTlUF+fOUjbvlp1EXrnCh7jjc0Ql2MQVaX9fXEpd/eCwDE3/Y2OAI9opogtDN9R
 xzFe/CzuM1jDjeK4p9BAKlaIYZ5ncNzJ0BGn2xDL8Pcr6t7CHCCWJlA2+TK/2EAz
 0uH44kzuY=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id B564A341B31;
 Thu, 16 Feb 2023 08:57:27 +0300 (MSK)
Received: from T-EXCH-06.corp.yadro.com (172.17.10.110) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Thu, 16 Feb 2023 08:57:27 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-06.corp.yadro.com (172.17.10.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Thu, 16 Feb 2023 08:57:27 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Thu,
 16 Feb 2023 08:57:27 +0300
From: Mikhail Tyutin <m.tyutin@yadro.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>
CC: "erdnaxe@crans.org" <erdnaxe@crans.org>, "ma.mandourr@gmail.com"
 <ma.mandourr@gmail.com>
Subject: RE: [PATCH] Adding ability to change disassembler syntax in TCG
 plugins
Thread-Topic: [PATCH] Adding ability to change disassembler syntax in TCG
 plugins
Thread-Index: Adk9Ytj+mzbZHC9XRGOgcDMHokyEkwEQYdKAAABEsgAAB3tVMP//20iA///NJBA=
Date: Thu, 16 Feb 2023 05:57:27 +0000
Message-ID: <5a4041bc7f7b4aadba8b31c14398dc05@yadro.com>
References: <7d17f0cbb5ed4c90bbadd3992429006f@yadro.com>
 <be45264f-03d5-e6d1-f12e-c92b0ef7b557@yadro.com>
 <4d474968-dce8-0d69-3e52-2c42a6398e4c@linaro.org>
 <1a19cfd11fd94e658224144d94663330@yadro.com>
 <1a7bd72b-d369-38d1-cdf0-de6253945a5c@linaro.org>
In-Reply-To: <1a7bd72b-d369-38d1-cdf0-de6253945a5c@linaro.org>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.199.22.165]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=89.207.88.252; envelope-from=m.tyutin@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PiBPbiAyLzE1LzIzIDE5OjA0LCBNaWtoYWlsIFR5dXRpbiB3cm90ZToNCj4gPj4gT24gMi8xNS8y
MyAxODoxNywgTWlraGFpbCBUeXV0aW4gd3JvdGU6DQo+ID4+PiBwaW5nDQo+ID4+Pg0KPiA+Pj4g
cGF0Y2hldyBsaW5rOg0KPiA+Pj4gaHR0cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VLzdkMTdmMGNiYjVl
ZDRjOTBiYmFkZDM5OTI0MjkwMDZmQHlhZHJvLmNvbS8NCj4gPj4+DQo+ID4+PiAxMC4wMi4yMDIz
IDE4OjI0LCBNaWtoYWlsIFR5dXRpbiB3cm90ZToNCj4gPj4+PiBUaGlzIHBhdGNoIGFkZHMgbmV3
IGZ1bmN0aW9uIHFlbXVfcGx1Z2luX2luc25fZGlzYXNfd2l0aF9zeW50YXgoKSB0aGF0IGFsbG93
cyBUQ0cNCj4gPj4+PiBwbHVnaW5zIHRvIGdldCBkaXNhc3NlbWJsZXIgc3RyaW5nIHdpdGggbm9u
LWRlZmF1bHQgc3ludGF4IGlmIGl0IHdhbnRzIHRvLg0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVkLW9m
Zi1ieTogTWlraGFpbCBUeXV0aW4gPG0udHl1dGluQHlhZHJvLmNvbT4NCj4gPj4NCj4gPj4gV2h5
Pw0KPiA+Pg0KPiA+PiBJdCdzIGNlcnRhaW5seSBub3QgdmVyeSBnZW5lcmljLCBleHBvc2luZyBh
IGRpc2Fzc2VtYmx5IHF1aXJrIGZvciBleGFjdGx5IG9uZSBndWVzdA0KPiA+PiBhcmNoaXRlY3R1
cmUuICBJIG1lYW4sIHlvdSBjb3VsZCBqdXN0IGFzIGVhc2lseSBsaW5rIHlvdXIgcGx1Z2luIGRp
cmVjdGx5IHRvIGxpYmNhcHN0b25lDQo+ID4+IHZpYSBxZW11X3BsdWdpbl9pbnNuX2RhdGEoKS4N
Cj4gPj4NCj4gPj4NCj4gPj4gcn4NCj4gPg0KPiA+IEkgYWdyZWUgaXQgY2FuIGJlIGRvbmUgb3V0
c2lkZSBvZiBRZW11IHVzaW5nIGFub3RoZXIgZGlzYXNzZW1ibGVyIGxpYnJhcnkuIEhvd2V2ZXIs
DQo+ID4gdGhlcmUgYXJlIGZldyByZWFzb25zIHRvIGRvIGl0IGluIFFlbXUgZnJvbSBhcmNoaXRl
Y3R1cmUgc3RhbmRwb2ludDoNCj4gPg0KPiA+IDEuIFRvIGhhdmUgYSBzaW5nbGUgcGxhY2Ugb2Yg
aW5zdHJ1Y3Rpb24gZGVjb2RpbmcgbG9naWMuIFRDRyBoYXMgdG8gZGVjb2RlIGd1ZXN0IGluc3Ry
dWN0aW9ucw0KPiA+IGFueXdheS4gSWYgcGx1Z2lucyBhZGQgYW5vdGhlciBkZWNvZGVyLCBpdCBj
YXVzZXMgZG91YmxlIHdvcmsgYW5kIHByb25lIHRvIGVycm9ycyAoaG93ZXZlcg0KPiA+IGN1cnJl
bnQgaW1wbGVtZW50YXRpb24gZG9lcyBkb3VibGUgZGVjb2RlIHdvcmsgYW55d2F5KS4gRm9yIGV4
YW1wbGUsIFRDRyBtaWdodCBzdXBwb3J0DQo+ID4gbmV3IGluc3RydWN0aW9uIHdoaWNoIGlzIG5v
dCBhdmFpbGFibGUgaW4gZXh0ZXJuYWwgZGVjb2RlciB5ZXQuDQo+ID4NCj4gPiAyLiBVbmRlciB0
aGUgaG9vZCBRZW11IHVzZXMgZGlmZmVyZW50IGltcGxlbWVudGF0aW9ucyBvZiBkZWNvZGVyIChp
biBhZGRpdGlvbiB0byBjYXBzdG9uZSkNCj4gPiB3aGljaCBpcyBub3QgZXhwb3NlZCBpbiBwdWJs
aWMgaW50ZXJmYWNlLiBJZiB0aGVyZSBpcyBhIG5lZWQgdG8gY29uZmlndXJlIGl0cyBvdXRwdXQs
IHByb3Bvc2VkDQo+ID4gQVBJIGFsbG93cyB0aGF0IGFzIHdlbGwuDQo+ID4NCj4gPiAzLiBJZiBt
dWx0aXBsZSBwbHVnaW5zIHdhbnQgdG8gdXNlIGFub3RoZXIgZGlzYXNzZW1ibGVyIHN5bnRheCwg
dGhleSBoYXZlIHRvIHNoYXJlDQo+ID4gaW1wbGVtZW50YXRpb24gYXMgdXRpbGl0eSBmdW5jdGlv
bi4NCj4gDQo+IFdoYXQncyBhbGwgdGhpcyBnb3QgdG8gZG8gd2l0aCBwcmVmZXJyaW5nIGludGVs
IG92ZXIgYXQmdCBzeW50YXg/DQo+IEkgc3RpbGwgdGhpbmsgaXQncyBhIGdlbmVyYWxseSB1c2Vs
ZXNzIHN3aXRjaC4NCj4gDQo+IA0KPiByfg0KDQpMaW51eC13b3JsZCBwcmVmZXJzIEFUJlQgc3R5
bGUsIFdpbmRvd3Mtd29ybGQgcHJlZmVycyBJbnRlbCBzdHlsZSBmb3IgeDg2XzY0IElTQS4gVGhh
dCBjYXVzZXMNCmEgbG90IG9mIHBhaW4gZm9yIGRldmVsb3BlcnMgYW5kIHRvb2xzIHRoYXQgaGF2
ZSB0byBjb21wYXJlIGFuZCBwYXJzZSBhc3NlbWJsZXIgdGV4dHMuIElmIHlvdSBoYXZlDQp0byB3
b3JrIG9uIGRpZmZlcmVudCBob3N0cywgeW91IHdvdWxkIGJldHRlciB1c2Ugb25lIHN0eWxlIGZv
ciBib3RoLg0K


