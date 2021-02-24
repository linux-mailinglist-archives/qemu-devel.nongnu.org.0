Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200DC32474E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 00:03:33 +0100 (CET)
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF3Bs-000658-5n
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 18:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=682ba522c=colmmacc@amazon.com>)
 id 1lF39W-0005dO-FA
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 18:01:06 -0500
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:60229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=682ba522c=colmmacc@amazon.com>)
 id 1lF39S-0003cO-7y
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 18:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1614207662; x=1645743662;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=hVGYeWL8BzQFMK+Thejfp/GrKUl+IMBQ9zDAz5P0VSo=;
 b=HdnqFrLrv/upnbs1jGZV5/cS34dX9x/SM/QhUoFqc28dPwF+KTgk+maA
 wBi8qxxnPfl5BbBGSmjKfY/1GVsjcUObwQRTy+EEoH+U9uSkQTaISe67J
 UgRiJjrhnj3Yo8lw6HO9mACUgBSfX08WqlugKMi28X1hzpITxrle4txuj g=;
X-IronPort-AV: E=Sophos;i="5.81,203,1610409600"; d="scan'208";a="87841545"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 24 Feb 2021 23:00:58 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id E0FA6A1F1B; Wed, 24 Feb 2021 23:00:47 +0000 (UTC)
Received: from EX13D20UWA004.ant.amazon.com (10.43.160.62) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 24 Feb 2021 23:00:47 +0000
Received: from EX13D01UWA003.ant.amazon.com (10.43.160.107) by
 EX13D20UWA004.ant.amazon.com (10.43.160.62) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 24 Feb 2021 23:00:46 +0000
Received: from EX13D01UWA003.ant.amazon.com ([10.43.160.107]) by
 EX13d01UWA003.ant.amazon.com ([10.43.160.107]) with mapi id 15.00.1497.010;
 Wed, 24 Feb 2021 23:00:46 +0000
From: "MacCarthaigh, Colm" <colmmacc@amazon.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, "Graf (AWS), Alexander"
 <graf@amazon.de>
CC: "Catangiu, Adrian Costin" <acatan@amazon.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "0x7f454c46@gmail.com"
 <0x7f454c46@gmail.com>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "Jason@zx2c4.com" <Jason@zx2c4.com>, "jannh@google.com" <jannh@google.com>,
 "w@1wt.eu" <w@1wt.eu>, "luto@kernel.org" <luto@kernel.org>, "tytso@mit.edu"
 <tytso@mit.edu>, "ebiggers@kernel.org" <ebiggers@kernel.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "bonzini@gnu.org" <bonzini@gnu.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "Weiss, Radu" <raduweis@amazon.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "mhocko@kernel.org" <mhocko@kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "areber@redhat.com"
 <areber@redhat.com>, "ovzxemul@gmail.com" <ovzxemul@gmail.com>,
 "avagin@gmail.com" <avagin@gmail.com>, "ptikhomirov@virtuozzo.com"
 <ptikhomirov@virtuozzo.com>, "gil@azul.com" <gil@azul.com>,
 "asmehra@redhat.com" <asmehra@redhat.com>, "dgunigun@redhat.com"
 <dgunigun@redhat.com>, "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "ghammer@redhat.com"
 <ghammer@redhat.com>
Subject: Re: [PATCH v7 1/2] drivers/misc: sysgenid: add system generation id
 driver
Thread-Topic: [PATCH v7 1/2] drivers/misc: sysgenid: add system generation id
 driver
Thread-Index: AQHXCwDjfClcwtiNEEGBvSi4FTnt7w==
Date: Wed, 24 Feb 2021 23:00:46 +0000
Message-ID: <7DE31E14-D6E9-41EA-9A43-6608ACC7CD87@amazon.com>
Accept-Language: en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.44.20121301
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.161.244]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1A111C137DBAA4BB71F7D8D56D5B152@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
Received-SPF: pass client-ip=72.21.198.25;
 envelope-from=prvs=682ba522c=colmmacc@amazon.com; helo=smtp-fw-4101.amazon.com
X-Spam_score_int: -118
X-Spam_score: -11.9
X-Spam_bar: -----------
X-Spam_report: (-11.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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

DQoNCk9uIDIvMjQvMjEsIDI6NDQgUE0sICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0
LmNvbT4gd3JvdGU6DQogICAgPiBUaGUgbW1hcCBtZWNoYW5pc20gYWxsb3dzIHRoZSBQUk5HIHRv
IHJlc2VlZCBhZnRlciBhIGdlbmlkIGNoYW5nZS4gQmVjYXVzZQ0KICAgID4gd2UgZG9uJ3QgaGF2
ZSBhbiBldmVudCBtZWNoYW5pc20gZm9yIHRoaXMgY29kZSBwYXRoLCB0aGF0IGNhbiBoYXBwZW4g
bWludXRlcw0KICAgID4gYWZ0ZXIgdGhlIHJlc3VtZS4gQnV0IHRoYXQncyBvaywgd2UgImp1c3Qi
IGhhdmUgdG8gZW5zdXJlIHRoYXQgbm9ib2R5IGlzDQogICAgPiBjb25zdW1pbmcgc2VjcmV0IGRh
dGEgYXQgdGhlIHBvaW50IG9mIHRoZSBzbmFwc2hvdC4NCg0KDQogICAgU29tZXRoaW5nIEkgYW0g
c3RpbGwgbm90IGNsZWFyIG9uIGlzIHdoZXRoZXIgaXQncyByZWFsbHkgaW1wb3J0YW50IHRvDQog
ICAgc2tpcCB0aGUgc3lzdGVtIGNhbGwgaGVyZS4gSWYgbm90IEkgdGhpbmsgaXQncyBwcnVkZW50
IHRvIGp1c3Qgc3RpY2sNCiAgICB0byByZWFkIGZvciBub3csIEkgdGhpbmsgdGhlcmUncyBhIHNs
aWdodGx5IGxvd2VyIGNoYW5jZSB0aGF0DQogICAgaXQgd2lsbCBnZXQgbWlzdXNlZC4gbW1hcCB3
aGljaCBnaXZlcyB5b3UgYSBsYWdneSBnZW4gaWQgdmFsdWUNCiAgICByZWFsbHkgc2VlbXMgbGlr
ZSBpdCB3b3VsZCBiZSBoYXJkIHRvIHVzZSBjb3JyZWN0bHkuDQoNCkl0J3Mgbm90IHVuY29tbW9u
IGZvciB0aGVzZSB1c2VyLXNwYWNlIFBSTkdzIHRvIHVzZWQgcXVpdGUgYSBsb3QgaW4gdmVyeSBw
ZXJmb3JtYW5jZSBjcml0aWNhbCBwYXRocy4gSWYgeW91IG5lZ290aWF0ZSBhIFRMUyBzZXNzaW9u
IHRoYXQgdXNlcyBhbiBleHBsaWNpdCBJViwgdGhlIFJORyBpcyBiZWluZyBjYWxsZWQgZm9yIGV2
ZXJ5IFRMUyByZWNvcmQgc2VudC4gU2FtZSBmb3IgSVBTZWMgZGVwZW5kaW5nIG9uIHRoZSBjaXBo
ZXItc3VpdGUuIEV2ZXJ5IFRMUyBoZWxsbyBtZXNzYWdlIGhhcyAyOC0zMiBieXRlcyBvZiBkYXRh
IGZyb20gdGhlIFJORywgb3IgaWYgeW91J3ZlIGdvdCBFQ0RTQSBhcyB5b3VyIHNpZ25hdHVyZSBh
bGdvcml0aG0sIGl0J3MgaW5saW5lIGFnYWluLiBVc2luZyBSU0FfUFNTPyBTYW1lIGFnYWluLiBN
YW55IFBvc3QtUXVhbnR1bSBhbGdvcml0aG1zIGFyZSBldmVuIG1vcmUgdmVyYWNpb3VzbHkgZW50
cm9weSBodW5ncnkuICBXZSBleGFtaW5lIHRoZSBjb21waWxlZCBpbnN0cnVjdGlvbnMgZm9yIG91
cnMgYnkgaGFuZCB0byBjaGVjayBpdCdzIGFsbCBhcyB0aWdodCBhcyBpdCBjYW4gYmUuIA0KDQpU
byBnaXZlIG1vcmUgb2YgYW4gaWRlYSwgc2V2ZXJhbCBjcnlwdG8gbGlicmFyaWVzIHRvb2sgb3V0
IHRoZSBnZXRwaWQoKSBndWFyZHMgdGhleSBoYWQgZm9yIGZvcmsgZGV0ZWN0aW9uIGluIHRoZSBS
TkdzLCB0aG91Z2ggVkRTTyBjb3VsZCBoYXZlIGhlbHBlZCB0aGVyZSBhbmQgSSdtIG5vdCBzdXJl
IHRoZXkgd291bGQgaGF2ZSBuZWVkZWQgdG8gaWYgVkRTTyB3ZXJlIG1vcmUgd2lkZWx5IHVzZWQg
YXQgdGhlIHRpbWUuICBJIGRvbid0IHRoaW5rIHdlJ2QgZ2V0IGEgcGF0Y2ggaW50byBPcGVuU1NM
L2xpYmNyeXB0byB0aGF0IGludm9sdmVzIGEgZnVsbCBzeXNjYWxsLiBWRFNPIG1pZ2h0IGJlIG9r
LCBidXQgZXZlbiB0aGF0J3Mgbm90IGdvaW5nIHRvIGhhdmUgdGhlIHNwZWVkIHRoYXQgYSBzaW5n
bGUgbWVtb3J5IGxvb2t1cCBjYW4gZG8gd2l0aCB0aGUgbW1hcC9tYWR2aXNlIGFwcHJvYWNoIC4u
LiBzaW5jZSB3ZSBhbHJlYWR5IGhhdmUgdG8gdXNlIFdJUEVPTkZPUksuDQoNCkluIHByYWN0aWNl
IEkgZG9uJ3QgdGhpbmsgaXQgd2lsbCBiZSB0aGF0IGhhcmQgdG8gdXNlIGNvcnJlY3RseTsgc25h
cHNob3RzIGFuZCByZXN0b3JlcyBvZiB0aGlzIG5hdHVyZSByZWFsbHkgaGF2ZSB0byBoYXBwZW4g
b25seSB3aGVuIHRoZSBhY3Rpdml0eSBpcyBxdWllc2NlbnQuIElmIG9wZXJhdGlvbnMgYXJlIGlu
LWZsaWdodCwgaXQncyBub3QgZWFzeSB0byByZWFzb24gYWJvdXQgdGhlIHBvdGVudGlhbCBtdWx0
aS1yZXN0b3JlIHByb2JsZW1zIGF0IGFsbCBhbmQgaXQgb25seSBtYWtlcyBzZW5zZSB0byB0aGlu
ayBhYm91dCB0cmFuc2FjdGlvbmFsIGNvcnJlY3RuZXNzIGF0IHRoZSBsZXZlbCBvZiBhbGwgdHJh
bnNhY3Rpb25zIHRoYXQgbWF5IGhhdmUgYmVlbiBpbi1mbGlnaHQuIFRoZSBtbWFwIHNvbHV0aW9u
IGlzIG1vcmUgYWJvdXQgaW50ZWdyYXRpbmcgd2l0aCBleGlzdGluZyBsaWJyYXJ5IEFQSXMgYW5k
IHNlbWFudGljcyB0aGFuIGl0IGlzIGFib3V0IHNvbWVob3cgc29sdmluZyB0aGF0IGF0IHRoZSBr
ZXJuZWwgbGV2ZWwuIFRoYXQgcGFydCBoYXMgdG8gYmUgc29sdmVkIGF0IHRoZSBzeXN0ZW0gbGV2
ZWwuDQoNCi0gDQpDb2xtDQoNCg==

