Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F932DAE5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:10:42 +0100 (CET)
Received: from localhost ([::1]:51724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuIz-0001mJ-Ve
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=690f28f2e=acatan@amazon.com>)
 id 1lHuHN-0000UM-2d
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:09:01 -0500
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:25472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=690f28f2e=acatan@amazon.com>)
 id 1lHuHJ-000247-E6
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1614888538; x=1646424538;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:mime-version:content-transfer-encoding:subject;
 bh=tzsuqrFVeOq9riXuH5OJCj7h3JjXsWqA7MxojT4JzhI=;
 b=Kl6p4ihjULxtSOd3OR7adT2vbOtIhwkxiccXE0fsc3sK33wnRBmy1Wmb
 fvg61H8ByxPBOIl7FRMth8D9TVTKe+NHt7Iwg9wnZ00LvJGpCum3Jhpzm
 17YAeKWVL6XpaDYfOrGFn50pm4pAdhey2JEqbIZXSyUKlwK7d9GTl14Q/ s=;
X-IronPort-AV: E=Sophos;i="5.81,223,1610409600"; d="scan'208";a="95803306"
Subject: Re: [PATCH v7 0/2] System Generation ID driver and VMGENID backend
Thread-Topic: [PATCH v7 0/2] System Generation ID driver and VMGENID backend
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 04 Mar 2021 20:08:46 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id B845528A14E; Thu,  4 Mar 2021 20:08:34 +0000 (UTC)
Received: from EX13D01UWB004.ant.amazon.com (10.43.161.157) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 4 Mar 2021 20:08:34 +0000
Received: from EX13D08EUB004.ant.amazon.com (10.43.166.158) by
 EX13d01UWB004.ant.amazon.com (10.43.161.157) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 4 Mar 2021 20:08:33 +0000
Received: from EX13D08EUB004.ant.amazon.com ([10.43.166.158]) by
 EX13D08EUB004.ant.amazon.com ([10.43.166.158]) with mapi id 15.00.1497.012;
 Thu, 4 Mar 2021 20:08:32 +0000
From: "Catangiu, Adrian Costin" <acatan@amazon.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Graf (AWS), Alexander" <graf@amazon.de>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "0x7f454c46@gmail.com"
 <0x7f454c46@gmail.com>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "Jason@zx2c4.com" <Jason@zx2c4.com>, "jannh@google.com" <jannh@google.com>,
 "w@1wt.eu" <w@1wt.eu>, "MacCarthaigh, Colm" <colmmacc@amazon.com>,
 "luto@kernel.org" <luto@kernel.org>, "tytso@mit.edu" <tytso@mit.edu>,
 "ebiggers@kernel.org" <ebiggers@kernel.org>, "Woodhouse, David"
 <dwmw@amazon.co.uk>, "bonzini@gnu.org" <bonzini@gnu.org>, "Singh, Balbir"
 <sblbir@amazon.com>, "Weiss, Radu" <raduweis@amazon.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "mhocko@kernel.org" <mhocko@kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "areber@redhat.com"
 <areber@redhat.com>, "ovzxemul@gmail.com" <ovzxemul@gmail.com>,
 "avagin@gmail.com" <avagin@gmail.com>, "ptikhomirov@virtuozzo.com"
 <ptikhomirov@virtuozzo.com>, "gil@azul.com" <gil@azul.com>,
 "asmehra@redhat.com" <asmehra@redhat.com>, "dgunigun@redhat.com"
 <dgunigun@redhat.com>, "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "ghammer@redhat.com"
 <ghammer@redhat.com>
Thread-Index: AQHXCom/rDdzK2LOd0S+TS78naX8yapnAzSAgA1ti4A=
Date: Thu, 4 Mar 2021 20:08:32 +0000
Message-ID: <7477D3B3-824E-48AD-9E08-4E31068CBECC@amazon.com>
References: <1614156452-17311-1-git-send-email-acatan@amazon.com>
 <20210224040034-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210224040034-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.192]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E92C03F9CF50A44BB87545310808AF5@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=52.95.48.154;
 envelope-from=prvs=690f28f2e=acatan@amazon.com; helo=smtp-fw-6001.amazon.com
X-Spam_score_int: -118
X-Spam_score: -11.9
X-Spam_bar: -----------
X-Spam_report: (-11.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

SGkgTWljaGFlbCwNCg0K77u/T24gMjQvMDIvMjAyMSwgMTE6MDYsICJNaWNoYWVsIFMuIFRzaXJr
aW4iIDxtc3RAcmVkaGF0LmNvbT4gd3JvdGU6DQoNCiAgICBDQVVUSU9OOiBUaGlzIGVtYWlsIG9y
aWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRl
ciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KDQoNCg0KICAgIE9uIFdlZCwgRmViIDI0
LCAyMDIxIGF0IDEwOjQ3OjMwQU0gKzAyMDAsIEFkcmlhbiBDYXRhbmdpdSB3cm90ZToNCiAgICA+
IFRoaXMgZmVhdHVyZSBpcyBhaW1lZCBhdCB2aXJ0dWFsaXplZCBvciBjb250YWluZXJpemVkIGVu
dmlyb25tZW50cw0KICAgID4gd2hlcmUgVk0gb3IgY29udGFpbmVyIHNuYXBzaG90dGluZyBkdXBs
aWNhdGVzIG1lbW9yeSBzdGF0ZSwgd2hpY2ggaXMgYQ0KICAgID4gY2hhbGxlbmdlIGZvciBhcHBs
aWNhdGlvbnMgdGhhdCB3YW50IHRvIGdlbmVyYXRlIHVuaXF1ZSBkYXRhIHN1Y2ggYXMNCiAgICA+
IHJlcXVlc3QgSURzLCBVVUlEcywgYW5kIGNyeXB0b2dyYXBoaWMgbm9uY2VzLg0KICAgID4NCiAg
ICA+IFRoZSBwYXRjaCBzZXQgaW50cm9kdWNlcyBhIG1lY2hhbmlzbSB0aGF0IHByb3ZpZGVzIGEg
dXNlcnNwYWNlDQogICAgPiBpbnRlcmZhY2UgZm9yIGFwcGxpY2F0aW9ucyBhbmQgbGlicmFyaWVz
IHRvIGJlIG1hZGUgYXdhcmUgb2YgdW5pcXVlbmVzcw0KICAgID4gYnJlYWtpbmcgZXZlbnRzIHN1
Y2ggYXMgVk0gb3IgY29udGFpbmVyIHNuYXBzaG90dGluZywgYW5kIGFsbG93IHRoZW0gdG8NCiAg
ICA+IHJlYWN0IGFuZCBhZGFwdCB0byBzdWNoIGV2ZW50cy4NCiAgICA+DQogICAgPiBTb2x2aW5n
IHRoZSB1bmlxdWVuZXNzIHByb2JsZW0gc3Ryb25nbHkgZW5vdWdoIGZvciBjcnlwdG9ncmFwaGlj
DQogICAgPiBwdXJwb3NlcyByZXF1aXJlcyBhIG1lY2hhbmlzbSB3aGljaCBjYW4gZGV0ZXJtaW5p
c3RpY2FsbHkgcmVzZWVkDQogICAgPiB1c2Vyc3BhY2UgUFJOR3Mgd2l0aCBuZXcgZW50cm9weSBh
dCByZXN0b3JlIHRpbWUuIFRoaXMgbWVjaGFuaXNtIG11c3QNCiAgICA+IGFsc28gc3VwcG9ydCB0
aGUgaGlnaC10aHJvdWdocHV0IGFuZCBsb3ctbGF0ZW5jeSB1c2UtY2FzZXMgdGhhdCBsZWQNCiAg
ICA+IHByb2dyYW1tZXJzIHRvIHBpY2sgYSB1c2Vyc3BhY2UgUFJORyBpbiB0aGUgZmlyc3QgcGxh
Y2U7IGJlIHVzYWJsZSBieQ0KICAgID4gYm90aCBhcHBsaWNhdGlvbiBjb2RlIGFuZCBsaWJyYXJp
ZXM7IGFsbG93IHRyYW5zcGFyZW50IHJldHJvZml0dGluZw0KICAgID4gYmVoaW5kIGV4aXN0aW5n
IHBvcHVsYXIgUFJORyBpbnRlcmZhY2VzIHdpdGhvdXQgY2hhbmdpbmcgYXBwbGljYXRpb24NCiAg
ICA+IGNvZGU7IGl0IG11c3QgYmUgZWZmaWNpZW50LCBlc3BlY2lhbGx5IG9uIHNuYXBzaG90IHJl
c3RvcmU7IGFuZCBiZQ0KICAgID4gc2ltcGxlIGVub3VnaCBmb3Igd2lkZSBhZG9wdGlvbi4NCiAg
ICA+DQogICAgPiBUaGUgZmlyc3QgcGF0Y2ggaW4gdGhlIHNldCBpbXBsZW1lbnRzIGEgZGV2aWNl
IGRyaXZlciB3aGljaCBleHBvc2VzIGENCiAgICA+IHRoZSAvZGV2L3N5c2dlbmlkIGNoYXIgZGV2
aWNlIHRvIHVzZXJzcGFjZS4gSXRzIGFzc29jaWF0ZWQgZmlsZXN5c3RlbQ0KICAgID4gb3BlcmF0
aW9ucyBvcGVyYXRpb25zIGNhbiBiZSB1c2VkIHRvIGJ1aWxkIGEgc3lzdGVtIGxldmVsIHNhZmUg
d29ya2Zsb3cNCiAgICA+IHRoYXQgZ3Vlc3Qgc29mdHdhcmUgY2FuIGZvbGxvdyB0byBwcm90ZWN0
IGl0c2VsZiBmcm9tIG5lZ2F0aXZlIHN5c3RlbQ0KICAgID4gc25hcHNob3QgZWZmZWN0cy4NCiAg
ICA+DQogICAgPiBUaGUgc2Vjb25kIHBhdGNoIGluIHRoZSBzZXQgYWRkcyBhIFZtR2VuSWQgZHJp
dmVyIHdoaWNoIG1ha2VzIHVzZSBvZg0KICAgID4gdGhlIEFDUEkgdm1nZW5pZCBkZXZpY2UgdG8g
ZHJpdmUgU3lzR2VuSWQgYW5kIHRvIHJlc2VlZCBrZXJuZWwgZW50cm9weQ0KICAgID4gZm9sbG93
aW5nIFZNIHNuYXBzaG90cy4NCiAgICA+DQogICAgPiAqKlBsZWFzZSBub3RlKiosIFN5c0dlbklE
IGFsb25lIGRvZXMgbm90IGd1YXJhbnRlZSBjb21wbGV0ZSBzbmFwc2hvdA0KICAgID4gc2FmZXR5
IHRvIGFwcGxpY2F0aW9ucyB1c2luZyBpdC4gQSBjZXJ0YWluIHdvcmtmbG93IG5lZWRzIHRvIGJl
DQogICAgPiBmb2xsb3dlZCBhdCB0aGUgc3lzdGVtIGxldmVsLCBpbiBvcmRlciB0byBtYWtlIHRo
ZSBzeXN0ZW0NCiAgICA+IHNuYXBzaG90LXJlc2lsaWVudC4gUGxlYXNlIHNlZSB0aGUgIlNuYXBz
aG90IFNhZmV0eSBQcmVyZXF1aXNpdGVzIg0KICAgID4gc2VjdGlvbiBpbiB0aGUgaW5jbHVkZWQg
U3lzR2VuSUQgZG9jdW1lbnRhdGlvbi4NCiAgICA+DQogICAgPiAtLS0NCiAgICA+DQogICAgPiB2
NiAtPiB2NzoNCiAgICA+ICAgLSByZW1vdmUgc3lzZ2VuaWQgdWV2ZW50DQoNCiAgICBIb3cgYWJv
dXQgd2UgZHJvcCBtbWFwIHRvbz8NCg0KICAgIFRoZXJlJ3Mgc2ltcGx5IG5vIHdheSBJIGNhbiBz
ZWUgdG8gbWFrZSBpdCBzYWZlLCBhbmQNCiAgICBubyBpbXBsZW1lbnRhdGlvbiBpcyB3b3JzZSB0
aGFuIGEgcmFjeSBvbmUgaW1oby4NCg0KICAgIFllYSB0aGVyZSdzIHNvbWUgZGVjdW1lbnRhdGlv
biBleHBsYWluaW5nIGhvdyBpdCBpcyBub3QNCiAgICBzdXBwb3NlZCB0byBiZSB1c2VkIGJ1dCBp
dCB3aWxsICpzZWVtKiB0byB3b3JrIGZvciBwZW9wbGUNCiAgICBhbmQgd2Ugd2lsbCBiZSBzdHVj
ayB0cnlpbmcgdG8gbWFpbnRhaW4gaXQuDQoNCiAgICBMZXQncyBzZWUgaWYgdXNlcnNwYWNlIHVz
aW5nIHRoaXMgb2Z0ZW4gZW5vdWdoIHRvIG1ha2UgdGhlDQogICAgc3lzdGVtIGNhbGwNCg0KQXMg
Q29sbSBleHBsYWluZWQgaW4gaGlzIHJlcGx5LCB0aGUgbW1hcCBpcyB0aGUgb25seSBvcHRpb24g
dG8gY29uc3VtZQ0KdGhpcyB3aXRoaW4gdGhlIHN0cmljdCBsYXRlbmN5IGNvbnN0cmFpbnRzIG9m
IFBSTkdzIGFuZCBTU0wgbGlicywgc28gd2hhdCBpZg0KaW5zdGVhZCwgd2UgcmVtb3ZlIHRoZSBJ
UlEgcmFjZSBieSByZW1vdmluZyB2bWdlbmlkIGFzIGFuIGluLWtlcm5lbA0Kc3lzZ2VuaWQgYmFj
a2VuZC9kcml2ZXI/DQoNCldlIGNvdWxkIGp1c3QgZHJvcCB0aGUgdm1nZW5pZCBkcml2ZXIgZm9y
IG5vdyBhbmQgb25seSBkcml2ZSBzeXNnZW5pZA0KZnJvbSB1c2Vyc3BhY2UgdXNpbmcgdGhlIGZz
IGludGVyZmFjZS4gRG9pbmcgc28gd2lsbCByZW1vdmUgdGhlIElSUSByYWNlDQp3aGljaCBjb21l
cyBmcm9tIHZtZ2VuaWQgYmFja2VuZCwgYW5kIHdpbGwga2VlcCB0aGUgU3lzR2VuSUQga2VybmVs
DQppbnRlcmZhY2Ugc2FmZSBhbmQgY29uc2lzdGVudCwgd2l0aCBhIHJhY2UtZnJlZSBtbWFwKCku
DQoNCldoYXQgZG8geW91IHRoaW5rPw0KDQogICAgPiB2NSAtPiB2NjoNCiAgICA+DQogICAgPiAg
IC0gc3lzZ2VuaWQ6IHdhdGNoZXIgdHJhY2tpbmcgZGlzYWJsZWQgYnkgZGVmYXVsdA0KICAgID4g
ICAtIHN5c2dlbmlkOiBhZGQgU1lTR0VOSURfU0VUX1dBVENIRVJfVFJBQ0tJTkcgaW9jdGwgdG8g
YWxsb3cgZWFjaA0KICAgID4gICAgIGZpbGUgZGVzY3JpcHRvciB0byBzZXQgd2hldGhlciB0aGV5
IHNob3VsZCBiZSB0cmFja2VkIGFzIHdhdGNoZXJzDQogICAgPiAgIC0gcmVuYW1lIFNZU0dFTklE
X0ZPUkNFX0dFTl9VUERBVEUgLT4gU1lTR0VOSURfVFJJR0dFUl9HRU5fVVBEQVRFDQogICAgPiAg
IC0gcmV3b3JrIGFsbCBkb2N1bWVudGF0aW9uIHRvIGNsZWFybHkgY2FwdHVyZSBhbGwgcHJlcmVx
dWlzaXRlcyBmb3INCiAgICA+ICAgICBhY2hpZXZpbmcgc25hcHNob3Qgc2FmZXR5IHdoZW4gdXNp
bmcgdGhlIHByb3ZpZGVkIG1lY2hhbmlzbQ0KICAgID4gICAtIHN5c2dlbmlkIGRvY3VtZW50YXRp
b246IHJlcGxhY2UgaW5kaXZpZHVhbCBmaWxlc3lzdGVtIG9wZXJhdGlvbnMNCiAgICA+ICAgICBl
eGFtcGxlcyB3aXRoIGEgaGlnaGVyIGxldmVsIGV4YW1wbGUgc2hvd2Nhc2luZyBzeXN0ZW0tbGV2
ZWwNCiAgICA+ICAgICBzbmFwc2hvdC1zYWZlIHdvcmtmbG93DQogICAgPg0KICAgID4gdjQgLT4g
djU6DQogICAgPg0KICAgID4gICAtIHN5c2dlbmlkOiBnZW5lcmF0aW9uIGNoYW5nZXMgYXJlIGFs
c28gZXhwb3J0ZWQgdGhyb3VnaCB1ZXZlbnRzDQogICAgPiAgIC0gcmVtb3ZlIFNZU0dFTklEX0dF
VF9PVVREQVRFRF9XQVRDSEVSUyBpb2N0bA0KICAgID4gICAtIGRvY3VtZW50IHN5c2dlbmlkIGlv
Y3RsIG1ham9yL21pbm9yIG51bWJlcnMNCiAgICA+DQogICAgPiB2MyAtPiB2NDoNCiAgICA+DQog
ICAgPiAgIC0gc3BsaXQgZnVuY3Rpb25hbGl0eSBpbiB0d28gc2VwYXJhdGUga2VybmVsIG1vZHVs
ZXM6DQogICAgPiAgICAgMS4gZHJpdmVycy9taXNjL3N5c2dlbmlkLmMgd2hpY2ggcHJvdmlkZXMg
dGhlIGdlbmVyaWMgdXNlcnNwYWNlDQogICAgPiAgICAgICAgaW50ZXJmYWNlIGFuZCBtZWNoYW5p
c21zDQogICAgPiAgICAgMi4gZHJpdmVycy92aXJ0L3ZtZ2VuaWQuYyBhcyBWTUdFTklEIGFjcGkg
ZGV2aWNlIGRyaXZlciB0aGF0IHNlZWRzDQogICAgPiAgICAgICAga2VybmVsIGVudHJvcHkgYW5k
IGFjdHMgYXMgYSBkcml2aW5nIGJhY2tlbmQgZm9yIHRoZSBnZW5lcmljDQogICAgPiAgICAgICAg
c3lzZ2VuaWQNCiAgICA+ICAgLSByZW5hbWUgL2Rldi92bWdlbmlkIC0+IC9kZXYvc3lzZ2VuaWQN
CiAgICA+ICAgLSByZW5hbWUgdWFwaSBoZWFkZXIgZmlsZSB2bWdlbmlkLmggLT4gc3lzZ2VuaWQu
aA0KICAgID4gICAtIHJlbmFtZSBpb2N0bHMgVk1HRU5JRF8qIC0+IFNZU0dFTklEXyoNCiAgICA+
ICAgLSBhZGQg4oCYbWluX2dlbuKAmSBwYXJhbWV0ZXIgdG8gU1lTR0VOSURfRk9SQ0VfR0VOX1VQ
REFURSBpb2N0bA0KICAgID4gICAtIGZpeCByYWNlcyBpbiBkb2N1bWVudGF0aW9uIGV4YW1wbGVz
DQogICAgPg0KICAgID4gdjIgLT4gdjM6DQogICAgPg0KICAgID4gICAtIHNlcGFyYXRlIHRoZSBj
b3JlIGRyaXZlciBsb2dpYyBhbmQgaW50ZXJmYWNlLCBmcm9tIHRoZSBBQ1BJIGRldmljZS4NCiAg
ICA+ICAgICBUaGUgQUNQSSB2bWdlbmlkIGRldmljZSBpcyBub3cgb25lIHBvc3NpYmxlIGJhY2tl
bmQNCiAgICA+ICAgLSBmaXggaXNzdWUgd2hlbiB0aW1lb3V0PTAgaW4gVk1HRU5JRF9XQUlUX1dB
VENIRVJTDQogICAgPiAgIC0gYWRkIGxvY2tpbmcgdG8gYXZvaWQgcmFjZXMgYmV0d2VlbiBmcyBv
cHMgaGFuZGxlcnMgYW5kIGh3IGlycQ0KICAgID4gICAgIGRyaXZlbiBnZW5lcmF0aW9uIHVwZGF0
ZXMNCiAgICA+ICAgLSBjaGFuZ2UgVk1HRU5JRF9XQUlUX1dBVENIRVJTIGlvY3RsIHNvIGlmIHRo
ZSBjdXJyZW50IGNhbGxlciBpcw0KICAgID4gICAgIG91dGRhdGVkIG9yIGEgZ2VuZXJhdGlvbiBj
aGFuZ2UgaGFwcGVucyB3aGlsZSB3YWl0aW5nICh0aHVzIG1ha2luZw0KICAgID4gICAgIGN1cnJl
bnQgY2FsbGVyIG91dGRhdGVkKSwgdGhlIGlvY3RsIHJldHVybnMgLUVJTlRSIHRvIHNpZ25hbCB0
aGUNCiAgICA+ICAgICB1c2VyIHRvIGhhbmRsZSBldmVudCBhbmQgcmV0cnkuIEZpeGVzIGJsb2Nr
aW5nIG9uIG9uZXNlbGYNCiAgICA+ICAgLSBhZGQgVk1HRU5JRF9GT1JDRV9HRU5fVVBEQVRFIGlv
Y3RsIGNvbmRpdGlvbmVkIGJ5DQogICAgPiAgICAgQ0FQX0NIRUNLUE9JTlRfUkVTVE9SRSBjYXBh
YmlsaXR5LCB0aHJvdWdoIHdoaWNoIHNvZnR3YXJlIGNhbiBmb3JjZQ0KICAgID4gICAgIGdlbmVy
YXRpb24gYnVtcA0KICAgID4NCiAgICA+IHYxIC0+IHYyOg0KICAgID4NCiAgICA+ICAgLSBleHBv
c2UgdG8gdXNlcnNwYWNlIGEgbW9ub3RvbmljYWxseSBpbmNyZWFzaW5nIHUzMiBWbSBHZW4gQ291
bnRlcg0KICAgID4gICAgIGluc3RlYWQgb2YgdGhlIGh3IFZtR2VuIFVVSUQNCiAgICA+ICAgLSBz
aW5jZSB0aGUgaHcvaHlwZXJ2aXNvci1wcm92aWRlZCAxMjgtYml0IFVVSUQgaXMgbm90IHB1Ymxp
Yw0KICAgID4gICAgIGFueW1vcmUsIGFkZCBpdCB0byB0aGUga2VybmVsIFJORyBhcyBkZXZpY2Ug
cmFuZG9tbmVzcw0KICAgID4gICAtIGluc2VydCBkcml2ZXIgcGFnZSBjb250YWluaW5nIFZtIEdl
biBDb3VudGVyIGluIHRoZSB1c2VyIHZtYSBpbg0KICAgID4gICAgIHRoZSBkcml2ZXIncyBtbWFw
IGhhbmRsZXIgaW5zdGVhZCBvZiB1c2luZyBhIGZhdWx0IGhhbmRsZXINCiAgICA+ICAgLSB0dXJu
IGRyaXZlciBpbnRvIGEgbWlzYyBkZXZpY2UgZHJpdmVyIHRvIGF1dG8tY3JlYXRlIC9kZXYvdm1n
ZW5pZA0KICAgID4gICAtIGNoYW5nZSBpb2N0bCBhcmcgdG8gYXZvaWQgbGVha2luZyBrZXJuZWwg
c3RydWN0cyB0byB1c2Vyc3BhY2UNCiAgICA+ICAgLSB1cGRhdGUgZG9jdW1lbnRhdGlvbg0KICAg
ID4NCiAgICA+IEFkcmlhbiBDYXRhbmdpdSAoMik6DQogICAgPiAgIGRyaXZlcnMvbWlzYzogc3lz
Z2VuaWQ6IGFkZCBzeXN0ZW0gZ2VuZXJhdGlvbiBpZCBkcml2ZXINCiAgICA+ICAgZHJpdmVycy92
aXJ0OiB2bWdlbmlkOiBhZGQgdm0gZ2VuZXJhdGlvbiBpZCBkcml2ZXINCiAgICA+DQogICAgPiAg
RG9jdW1lbnRhdGlvbi9taXNjLWRldmljZXMvc3lzZ2VuaWQucnN0ICAgICAgICAgICAgfCAyMjkg
KysrKysrKysrKysrKysrDQogICAgPiAgRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3Rs
L2lvY3RsLW51bWJlci5yc3QgfCAgIDEgKw0KICAgID4gIERvY3VtZW50YXRpb24vdmlydC92bWdl
bmlkLnJzdCAgICAgICAgICAgICAgICAgICAgIHwgIDM2ICsrKw0KICAgID4gIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE1ICsNCiAgICA+ICBk
cml2ZXJzL21pc2MvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNSAr
DQogICAgPiAgZHJpdmVycy9taXNjL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKw0KICAgID4gIGRyaXZlcnMvbWlzYy9zeXNnZW5pZC5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMzIyICsrKysrKysrKysrKysrKysrKysrKw0KICAgID4gIGRyaXZlcnMv
dmlydC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEzICsNCiAgICA+
ICBkcml2ZXJzL3ZpcnQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSArDQogICAgPiAgZHJpdmVycy92aXJ0L3ZtZ2VuaWQuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAxNTMgKysrKysrKysrKw0KICAgID4gIGluY2x1ZGUvdWFwaS9saW51eC9zeXNnZW5p
ZC5oICAgICAgICAgICAgICAgICAgICAgIHwgIDE4ICsrDQogICAgPiAgMTEgZmlsZXMgY2hhbmdl
ZCwgODA0IGluc2VydGlvbnMoKykNCiAgICA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9taXNjLWRldmljZXMvc3lzZ2VuaWQucnN0DQogICAgPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vdmlydC92bWdlbmlkLnJzdA0KICAgID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL21pc2Mvc3lzZ2VuaWQuYw0KICAgID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL3ZpcnQvdm1nZW5pZC5jDQogICAgPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvdWFw
aS9saW51eC9zeXNnZW5pZC5oDQogICAgPg0KICAgID4gLS0NCiAgICA+IDIuNy40DQogICAgPg0K
ICAgID4NCiAgICA+DQogICAgPg0KICAgID4gQW1hem9uIERldmVsb3BtZW50IENlbnRlciAoUm9t
YW5pYSkgUy5SLkwuIHJlZ2lzdGVyZWQgb2ZmaWNlOiAyN0EgU2YuIExhemFyIFN0cmVldCwgVUJD
NSwgZmxvb3IgMiwgSWFzaSwgSWFzaSBDb3VudHksIDcwMDA0NSwgUm9tYW5pYS4gUmVnaXN0ZXJl
ZCBpbiBSb21hbmlhLiBSZWdpc3RyYXRpb24gbnVtYmVyIEoyMi8yNjIxLzIwMDUuDQoNCg0KCgoK
QW1hem9uIERldmVsb3BtZW50IENlbnRlciAoUm9tYW5pYSkgUy5SLkwuIHJlZ2lzdGVyZWQgb2Zm
aWNlOiAyN0EgU2YuIExhemFyIFN0cmVldCwgVUJDNSwgZmxvb3IgMiwgSWFzaSwgSWFzaSBDb3Vu
dHksIDcwMDA0NSwgUm9tYW5pYS4gUmVnaXN0ZXJlZCBpbiBSb21hbmlhLiBSZWdpc3RyYXRpb24g
bnVtYmVyIEoyMi8yNjIxLzIwMDUuCg==


