Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341A446181A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:25:28 +0100 (CET)
Received: from localhost ([::1]:42840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhax-0006BI-AE
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:25:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=960286616=dwmw@amazon.co.uk>)
 id 1mrf1G-0004yv-P9
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 06:40:26 -0500
Received: from smtp-fw-80007.amazon.com ([99.78.197.218]:19060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=960286616=dwmw@amazon.co.uk>)
 id 1mrf1E-0005KR-LJ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 06:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1638186025; x=1669722025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=/4yJ31W3adfSv2cvVa7Z8ElXShDQ/bIpRciTbAjSXF4=;
 b=BWbZrFmR0+S78YHNCgEYmTYD1Gh8X8Xnp98kex9/NdfIzbkMP3An7s5m
 uI/hIMUqS1XCLjrWENCiedN9pW2W7MDCkUXbKobpefGA/UkkOiAGraCEs
 lMVbrnhfH89jKNfhXVzJ7bzCl6HiGWhUgC/lbHATB+luj/x6aRNVtYS8Y s=;
X-IronPort-AV: E=Sophos;i="5.87,273,1631577600"; d="scan'208";a="44775324"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-5a09360d.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 29 Nov 2021 11:39:58 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-5a09360d.us-west-2.amazon.com (Postfix) with
 ESMTPS id 97D4741B24; Mon, 29 Nov 2021 11:39:57 +0000 (UTC)
Received: from EX13D08UEE003.ant.amazon.com (10.43.62.118) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.26; Mon, 29 Nov 2021 11:39:57 +0000
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13D08UEE003.ant.amazon.com (10.43.62.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.26; Mon, 29 Nov 2021 11:39:57 +0000
Received: from EX13D08UEE001.ant.amazon.com ([10.43.62.126]) by
 EX13D08UEE001.ant.amazon.com ([10.43.62.126]) with mapi id 15.00.1497.026;
 Mon, 29 Nov 2021 11:39:57 +0000
From: "Woodhouse, David" <dwmw@amazon.co.uk>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "cfontana@suse.de"
 <cfontana@suse.de>
CC: "ehabkost@redhat.com" <ehabkost@redhat.com>, "philmd@redhat.com"
 <philmd@redhat.com>, "lovemrd@gmail.com" <lovemrd@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "alxndr@bu.edu"
 <alxndr@bu.edu>
Subject: Re: [PATCH for-6.1 v2] i386: do not call cpudef-only models functions
 for max, host, base
Thread-Topic: [PATCH for-6.1 v2] i386: do not call cpudef-only models
 functions for max, host, base
Thread-Index: AQHX5RXVX9dvsEIxYEWjOesqaqmDHg==
Date: Mon, 29 Nov 2021 11:39:57 +0000
Message-ID: <1102c315addf2f2fffc49222ab5be118e7ae9b0f.camel@amazon.co.uk>
References: <20210723112921.12637-1-cfontana@suse.de>
In-Reply-To: <20210723112921.12637-1-cfontana@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.60.124]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBF7C44602CF0B4A8EA181E93DD015CC@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=99.78.197.218;
 envelope-from=prvs=960286616=dwmw@amazon.co.uk; helo=smtp-fw-80007.amazon.com
X-Spam_score_int: -125
X-Spam_score: -12.6
X-Spam_bar: ------------
X-Spam_report: (-12.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Nov 2021 09:08:37 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

T24gRnJpLCAyMDIxLTA3LTIzIGF0IDEzOjI5ICswMjAwLCBDbGF1ZGlvIEZvbnRhbmEgd3JvdGU6
DQo+ICBzdGF0aWMgdm9pZCBrdm1fY3B1X2luc3RhbmNlX2luaXQoQ1BVU3RhdGUgKmNzKQ0KPiAg
ew0KPiAgICAgIFg4NkNQVSAqY3B1ID0gWDg2X0NQVShjcyk7DQo+ICsgICAgWDg2Q1BVQ2xhc3Mg
KnhjYyA9IFg4Nl9DUFVfR0VUX0NMQVNTKGNwdSk7DQo+ICANCj4gICAgICBob3N0X2NwdV9pbnN0
YW5jZV9pbml0KGNwdSk7DQo+ICANCj4gLSAgICBpZiAoIWt2bV9pcnFjaGlwX2luX2tlcm5lbCgp
KSB7DQo+IC0gICAgICAgIHg4Nl9jcHVfY2hhbmdlX2t2bV9kZWZhdWx0KCJ4MmFwaWMiLCAib2Zm
Iik7DQo+IC0gICAgfSBlbHNlIGlmIChrdm1faXJxY2hpcF9pc19zcGxpdCgpICYmIGt2bV9lbmFi
bGVfeDJhcGljKCkpIHsNCj4gLSAgICAgICAgeDg2X2NwdV9jaGFuZ2Vfa3ZtX2RlZmF1bHQoImt2
bS1tc2ktZXh0LWRlc3QtaWQiLCAib24iKTsNCj4gLSAgICB9DQo+IC0NCj4gLSAgICAvKiBTcGVj
aWFsIGNhc2VzIG5vdCBzZXQgaW4gdGhlIFg4NkNQVURlZmluaXRpb24gc3RydWN0czogKi8NCj4g
KyAgICBpZiAoeGNjLT5tb2RlbCkgew0KPiArICAgICAgICAvKiBvbmx5IGFwcGxpZXMgdG8gYnVp
bHRpbl94ODZfZGVmcyBjcHVzICovDQo+ICsgICAgICAgIGlmICgha3ZtX2lycWNoaXBfaW5fa2Vy
bmVsKCkpIHsNCj4gKyAgICAgICAgICAgIHg4Nl9jcHVfY2hhbmdlX2t2bV9kZWZhdWx0KCJ4MmFw
aWMiLCAib2ZmIik7DQo+ICsgICAgICAgIH0gZWxzZSBpZiAoa3ZtX2lycWNoaXBfaXNfc3BsaXQo
KSAmJiBrdm1fZW5hYmxlX3gyYXBpYygpKSB7DQo+ICsgICAgICAgICAgICB4ODZfY3B1X2NoYW5n
ZV9rdm1fZGVmYXVsdCgia3ZtLW1zaS1leHQtZGVzdC1pZCIsICJvbiIpOw0KPiArICAgICAgICB9
DQo+ICANCj4gLSAgICB4ODZfY3B1X2FwcGx5X3Byb3BzKGNwdSwga3ZtX2RlZmF1bHRfcHJvcHMp
Ow0KPiArICAgICAgICAvKiBTcGVjaWFsIGNhc2VzIG5vdCBzZXQgaW4gdGhlIFg4NkNQVURlZmlu
aXRpb24gc3RydWN0czogKi8NCj4gKyAgICAgICAgeDg2X2NwdV9hcHBseV9wcm9wcyhjcHUsIGt2
bV9kZWZhdWx0X3Byb3BzKTsNCj4gKyAgICB9DQo+ICANCg0KSSB0aGluayB0aGlzIGNhdXNlcyBh
IHJlZ3Jlc3Npb24gaW4geDJhcGljIGFuZCBrdm0tbXNpLWV4dC1kZXN0LWlkDQpzdXBwb3J0LiBJ
ZiB5b3Ugc3RhcnQgcWVtdSB0aHVzOg0KDQpxZW11LXN5c3RlbS14ODZfNjQgLW1hY2hpbmUgcTM1
LGFjY2VsPWt2bSx1c2I9b2ZmLGtlcm5lbF9pcnFjaGlwPXNwbGl0IC1jcHUgaG9zdCAtc21wIDI4
OCxzb2NrZXRzPTksY29yZXM9MTYsdGhyZWFkcz0yDQoNClRoZSBndWVzdCBub3cgc2VlcyB0aG9z
ZSBmZWF0dXJlcywgYnV0IHdlIGRvbid0IGFjdHVhbGx5IGNhbGwNCmt2bV9lbmFibGVfeDJhcGlj
KCkgc28gdGhlIEFQSUMgYnJvYWRjYXN0IHF1aXJrIGRvZXNuJ3QgZ2V0IGRpc2FibGVkLA0KYW5k
IGludGVycnVwdHMgdGFyZ2V0ZWQgYXQgQVBJQyBJRCAyNTUgYXJlIGludGVycHJldGVkIGFzIGJy
b2FkY2FzdHM6DQoNClsgNzMuMTk4NTA0XSBfX2NvbW1vbl9pbnRlcnJ1cHQ6IDAuMzQgTm8gaXJx
IGhhbmRsZXIgZm9yIHZlY3Rvcg0KWyA3My4xOTg1MTVdIF9fY29tbW9uX2ludGVycnVwdDogMTEu
MzQgTm8gaXJxIGhhbmRsZXIgZm9yIHZlY3Rvcg0KWyA3My4xOTg1MTddIF9fY29tbW9uX2ludGVy
cnVwdDogMTIuMzQgTm8gaXJxIGhhbmRsZXIgZm9yIHZlY3Rvcg0KWyA3My4xOTg1MjFdIF9fY29t
bW9uX2ludGVycnVwdDogMTUuMzQgTm8gaXJxIGhhbmRsZXIgZm9yIHZlY3Rvcg0KWyA3My4xOTg1
MjRdIF9fY29tbW9uX2ludGVycnVwdDogMTcuMzQgTm8gaXJxIGhhbmRsZXIgZm9yIHZlY3Rvcg0K
WyA3My4xOTg1MjhdIF9fY29tbW9uX2ludGVycnVwdDogMzQuMzQgTm8gaXJxIGhhbmRsZXIgZm9y
IHZlY3Rvcg0KWyA3My4xOTg1MjldIF9fY29tbW9uX2ludGVycnVwdDogMjAuMzQgTm8gaXJxIGhh
bmRsZXIgZm9yIHZlY3Rvcg0KWyA3My4xOTg1MzNdIF9fY29tbW9uX2ludGVycnVwdDogNDEuMzQg
Tm8gaXJxIGhhbmRsZXIgZm9yIHZlY3Rvcg0KWyA3My4xOTg1MzldIF9fY29tbW9uX2ludGVycnVw
dDogMjcuMzQgTm8gaXJxIGhhbmRsZXIgZm9yIHZlY3Rvcg0KWyA3My4xOTg1NDJdIF9fY29tbW9u
X2ludGVycnVwdDogMjguMzQgTm8gaXJxIGhhbmRsZXIgZm9yIHZlY3Rvcg0KCgoKQW1hem9uIERl
dmVsb3BtZW50IENlbnRyZSAoTG9uZG9uKSBMdGQuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCBhbmQg
V2FsZXMgd2l0aCByZWdpc3RyYXRpb24gbnVtYmVyIDA0NTQzMjMyIHdpdGggaXRzIHJlZ2lzdGVy
ZWQgb2ZmaWNlIGF0IDEgUHJpbmNpcGFsIFBsYWNlLCBXb3JzaGlwIFN0cmVldCwgTG9uZG9uIEVD
MkEgMkZBLCBVbml0ZWQgS2luZ2RvbS4KCgo=


