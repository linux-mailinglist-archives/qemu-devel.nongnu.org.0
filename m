Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DC12090E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 15:57:45 +0100 (CET)
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igroe-0000pD-Cq
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 09:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=24629a80a=sveith@amazon.de>) id 1igrna-0000Jo-N0
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 09:56:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=24629a80a=sveith@amazon.de>) id 1igrnZ-0000Rl-Ob
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 09:56:38 -0500
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:27175)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=24629a80a=sveith@amazon.de>)
 id 1igrnX-0000Kt-E7; Mon, 16 Dec 2019 09:56:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576508196; x=1608044196;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=fsUpwpEZ/J/zAUOCl/OybCv/6wXahmN5L4niDYBQ4iA=;
 b=q0q3RHwHgu3keSsFVmIfXzrSl1JxqHpW/CDsffjUSXSLOC9PLUkwSi8z
 1nmdk6kGyvJ0f2vZXDp/P5XRewfhqRd8g828bz9+tYp5BgbUt+I2OyMKj
 2ZYHlAI8dIZWrCC/korQMnFvv8A9Gya++Ief4ACzVptVs2h2egle/rKCW U=;
IronPort-SDR: e7Y4Ql8Nj1IXYrRrq5Dpc5izbJ5/0bHzdXL3QH4qPArt8JMbOcILdf8odWQ6VyZ6JUJ4FTPCf2
 AOf9IeQX5G7A==
X-IronPort-AV: E=Sophos;i="5.69,321,1571702400"; d="scan'208";a="15157566"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 16 Dec 2019 14:56:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4D354A21E7; Mon, 16 Dec 2019 14:56:23 +0000 (UTC)
Received: from EX13D18EUC001.ant.amazon.com (10.43.164.108) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 14:56:22 +0000
Received: from EX13D18EUC002.ant.amazon.com (10.43.164.50) by
 EX13D18EUC001.ant.amazon.com (10.43.164.108) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 14:56:22 +0000
Received: from EX13D18EUC002.ant.amazon.com ([10.43.164.50]) by
 EX13D18EUC002.ant.amazon.com ([10.43.164.50]) with mapi id 15.00.1367.000;
 Mon, 16 Dec 2019 14:56:21 +0000
From: "Veith, Simon" <sveith@amazon.de>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>
CC: "eric.auger@redhat.com" <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v2 0/6] hw/arm/smmuv3: Correct stream ID and event address
 handling
Thread-Topic: [PATCH v2 0/6] hw/arm/smmuv3: Correct stream ID and event
 address handling
Thread-Index: AQHVsDNp2fogltgw+E+ej3y1KKrruae83nUAgAADFwA=
Date: Mon, 16 Dec 2019 14:56:21 +0000
Message-ID: <1576508180.11214.4.camel@amazon.de>
References: <1576076260-18659-1-git-send-email-sveith@amazon.de>
 <CAFEAcA-Zz+Ape9z39s8uHEGUN3nOH3-o9t=EEJsm9M+oeDuebQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-Zz+Ape9z39s8uHEGUN3nOH3-o9t=EEJsm9M+oeDuebQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.222]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7E2C316EFBA97458F7C7324B932FDF5@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 207.171.190.10
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

T24gTW9uLCAyMDE5LTEyLTE2IGF0IDE0OjQ1ICswMDAwLCBQZXRlciBNYXlkZWxsIHdyb3RlOg0K
PiBTb21ldGhpbmcgZnVubnkgc2VlbXMgdG8gaGF2ZSBoYXBwZW5lZCB3aGVuIHRoaXMgc2VyaWVz
IGdvdA0KPiBzZW50IG91dDogcGF0Y2hlcyAxLDIsMyBhcmUgY29ycmVjdGx5IGZvbGxvd3VwcyB0
byB0aGUgY292ZXINCj4gbGV0dGVyLCBidXQgNCw1LDYgYXJlIGZvbGxvd3VwcyB0byBwYXRjaCAz
Lg0KDQpZb3UgYXJlIGNvcnJlY3Q7IEkgaGFkIGZpeGVkIHVwIG9uZSBvZiB0aGUgcGF0Y2hlcyBh
cyBJIHdhcyBzZW5kaW5nDQp0aGVtIG91dCwgYW5kIHRob3VnaCBJIGhhZCB0aGVuIGFkZGVkIC0t
aW4tcmVwbHktdG8gcG9pbnRpbmcgdG8gdGhlDQpjb3ZlciBsZXR0ZXIsIGdpdC1zZW5kLWVtYWls
IHNlZW1zIHRvIGhhdmUgYWRkZWQgYW5vdGhlciBsZXZlbCBvZg0KdGhyZWFkaW5nLiBTb3JyeSBh
Ym91dCB0aGF0LiBJJ2xsIHJlc2VuZCB0aGUgc2VyaWVzIGFnYWluLg0KDQpSZWdhcmRzDQpTaW1v
bgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAz
OAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBK
b25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1
bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


