Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194E969A517
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 06:28:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pStHp-0004Gj-IK; Fri, 17 Feb 2023 00:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pStHi-0004GC-QX
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:27:51 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pStHg-0004bm-U5
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:27:50 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id 36C083417C5;
 Fri, 17 Feb 2023 08:27:45 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-id:content-transfer-encoding:content-type
 :content-type:date:from:from:message-id:mime-version:reply-to
 :subject:subject:to:to; s=mta-01; bh=emN6cq0Xji3iMNEKWPUOlKKCg/m
 Kl0TrRgy571/XsJI=; b=QoUwQCUsfKbvewIMGfkftndfhEjsV39VjPFjqV6hmHz
 ipMIQM/bthTbWbbX/sEDjshhJsTcdimDU4YEkEhm9cGTaAK2a5SHB9Ll12TZScYI
 MwUUHHmr1XMG+m5//ehobqhd/dkEwSmHIcXCNVEOVC5zKJrY/RUEzWrmno5XAorU
 =
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id 2C945341660;
 Fri, 17 Feb 2023 08:27:45 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Fri, 17 Feb 2023 08:27:44 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Fri,
 17 Feb 2023 08:27:44 +0300
From: Mikhail Tyutin <m.tyutin@yadro.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: TCG asserts on some of translation blocks with plugin memory callback
Thread-Topic: TCG asserts on some of translation blocks with plugin memory
 callback
Thread-Index: AQHZQpCQZUyYKKfKzUKg+ugTeuoVKA==
Date: Fri, 17 Feb 2023 05:27:44 +0000
Message-ID: <13fc40e4-2637-02bc-5f83-4fb9f04cd730@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.10.14]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B00C3741DBB614587B1E8D6E3CEAE0A@yadro.com>
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

SGVsbG8sDQoNCkkgaGF2ZSBiZWVuIHRlc3RpbmcgVENHIHBsdWdpbiBwYXRjaCBvbiBsYXRlc3Qg
UWVtdSBidWlsZCBidXQgbm90aWNlZCB0aGF0IGl0DQpmYWlscyB3aXRoIGFzc2VydCBvbiBzb21l
IG9mIHRoZSBhcHBsaWNhdGlvbnMuDQoNCiAgIEVSUk9SOi4uL2FjY2VsL3RjZy9jcHUtZXhlYy5j
Ojk4MzpjcHVfZXhlY19sb29wOg0KICAgICAgIGFzc2VydGlvbiBmYWlsZWQ6IChjcHUtPnBsdWdp
bl9tZW1fY2JzID09ICgodm9pZCAqKTApKQ0KDQpJdCBoYXBwZW5zIHdoZW4gVENHIHBsdWdpbiBz
ZXRzIG1lbW9yeSBjYWxsYmFjayBpbiBzb21lIG9mIHRyYW5zbGF0aW9uIGJsb2Nrcy4NClRoZSBj
YWxsYmFjayBjYW4gYmUgZW1wdHksIGl0IGp1c3QgbmVlZHMgdG8gYmUgdGhlcmUuIERlYnVnZ2lu
ZyBpdCBmdXJ0aGVyIEkNCnNlZSBpbmplY3RfbWVtX2VuYWJsZV9oZWxwZXIoKSBhbmQgaW5qZWN0
X21lbV9kaXNhYmxlX2hlbHBlcigpIGZ1bmN0aW9ucyB0aGF0DQphcmUgaW50ZW5kZWQgdG8gc2V0
IGFuZCByZXNldCBjcHUtPnBsdWdpbl9tZW1fY2JzIHRvIGFwcHJvcHJpYXRlIHZhbHVlLg0KDQpU
aGUgcHJvYmxlbSBpcyB0aGF0IGluamVjdF9tZW1fZGlzYWJsZV9oZWxwZXIoKSBwYXJ0IGdldHMg
cmVtb3ZlZCBpbnNpZGUgb2YNCnJlYWNoYWJsZV9jb2RlX3Bhc3MoKSBmdW5jdGlvbi4gQXMgdGhl
IHJlc3VsdCB3ZSBzZWUgdGhpcyBhc3NlcnQgKHRoZSBwb2ludGVyDQppcyBub3Qgc2V0IHRvIE5V
TEwgYXQgdGhlIGVuZCBvZiB0cmFuc2xhdGlvbiBibG9jayBhcyBpdCBleHBlY3RzKS4gSGVyZSBp
cyBPUA0KbGlzdGluZyBqdXN0IGJlZm9yZSByZWFjaGFibGVfY29kZV9wYXNzKCkgY2FsbDoNCg0K
ICBleHQzMnVfaTY0IHJjeCx0bXAzDQogIGFkZF9pNjQgcmlwLHJpcCwkMHhhDQogIGdvdG9fdGIg
JDB4MA0KICBleGl0X3RiICQweDdmZmY2NDAxMzMwMA0KICBtb3ZfaTY0IHRtcDExLCQweDAgICAg
ICAgICAgICAgICAgICAgIDsgdGhpcyBpcyBhIHBhcnQNCiAgc3RfaTY0ICQweDAsZW52LCQweGZm
ZmZmZmZmZmZmZmY1NDAgICA7IG9mIGluamVjdF9tZW1fZGlzYWJsZV9oZWxwZXIoKQ0KICBzZXRf
bGFiZWwgJEwwDQogIGV4aXRfdGIgJDB4N2ZmZjY0MDEzMzAzDQoNCg0KcmVhY2hhYmxlX2NvZGVf
cGFzcygpIHJlbW92ZXMgZXZlcnl0aGluZyBhZnRlciBleGl0X3RiIHVudGlsIGl0IHJlYWNoZXMN
CnNldF9sYWJlbCBvcCBhcyDigJhkZWFk4oCZIGNvZGUsIHdoaWNoIHNlZW1zIHRvIGJlIGNvcnJl
Y3QuDQoNClRoZSBxdWVzdGlvbiBpcyBob3cgaXQgaXMgZXhwZWN0ZWQgdG8gd29yaz8gU2hvdWxk
IGluamVjdF9tZW1fZGlzYWJsZV9oZWxwZXIoKQ0KaW5zZXJ0IGl0cyB6ZXJvaW5nIE9QcyBhZnRl
ciDigJxzZXRfbGFiZWwgJEww4oCdIG9yIGJlZm9yZSDigJxnb3RvX3RiICQweDDigJ0gb3BlcmF0
aW9uDQp0byBhdm9pZCBkZWFkIGNvZGUgYmxvY2s/DQo=


