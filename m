Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28904C26A4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 09:58:05 +0100 (CET)
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN9wq-00021e-AL
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 03:58:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=047258099=graf@amazon.de>)
 id 1nN9tH-0001Dk-6b
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 03:54:23 -0500
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:65135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=047258099=graf@amazon.de>)
 id 1nN9tD-0001Ap-Ta
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 03:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1645692860; x=1677228860;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=12QSyjliW/2N5g2pN9oNa13hL2d3UZLmxKY0dS2g+TU=;
 b=o/RqXvNJXmrOXT9zEXuAaYeizv0LshFagengqWvTZL85b+ppW3JvL6AY
 ha2slNJc1vHy7rT1WVQsjeSkyFZa1/XogPzaLthWDeeJBkbeXeLL+Zofk
 5CkX7xl0bgIPLTFwh/vvTN1UtKU1AZDkrq8VnXez1j1LjaxWGKUJagZpb k=;
X-IronPort-AV: E=Sophos;i="5.88,393,1635206400"; d="scan'208";a="176212703"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-5c4a15b1.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 24 Feb 2022 08:54:06 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-5c4a15b1.us-west-2.amazon.com (Postfix) with
 ESMTPS id AF91E41634; Thu, 24 Feb 2022 08:54:05 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Thu, 24 Feb 2022 08:54:05 +0000
Received: from [0.0.0.0] (10.43.161.89) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Thu, 24 Feb
 2022 08:54:01 +0000
Message-ID: <234d7952-0379-e3d9-5e02-5eba171024a0@amazon.com>
Date: Thu, 24 Feb 2022 09:53:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH RFC v1 0/2] VM fork detection for RNG
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, <linux-kernel@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <qemu-devel@nongnu.org>,
 <kvm@vger.kernel.org>, <linux-s390@vger.kernel.org>, <adrian@parity.io>
CC: <dwmw@amazon.co.uk>, <acatan@amazon.com>, <colmmacc@amazon.com>,
 <sblbir@amazon.com>, <raduweis@amazon.com>, <jannh@google.com>,
 <gregkh@linuxfoundation.org>, <tytso@mit.edu>
References: <20220223131231.403386-1-Jason@zx2c4.com>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <20220223131231.403386-1-Jason@zx2c4.com>
X-Originating-IP: [10.43.161.89]
X-ClientProxiedBy: EX13D47UWA001.ant.amazon.com (10.43.163.6) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=72.21.196.25;
 envelope-from=prvs=047258099=graf@amazon.de; helo=smtp-fw-2101.amazon.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

SGV5IEphc29uLAoKT24gMjMuMDIuMjIgMTQ6MTIsIEphc29uIEEuIERvbmVuZmVsZCB3cm90ZToK
PiBUaGlzIHNtYWxsIHNlcmllcyBwaWNrcyB1cCB3b3JrIGZyb20gQW1hem9uIHRoYXQgc2VlbXMg
dG8gaGF2ZSBzdGFsbGVkCj4gb3V0IGxhdGVyIHllYXIgYXJvdW5kIHRoaXMgdGltZTogbGlzdGVu
aW5nIGZvciB0aGUgdm1nZW5pZCBBQ1BJCj4gbm90aWZpY2F0aW9uLCBhbmQgdXNpbmcgaXQgdG8g
ImRvIHNvbWV0aGluZy4iIExhc3QgeWVhciwgdGhhdCBzb21ldGhpbmcKPiBpbnZvbHZlZCBhIGNv
bXBsaWNhdGVkIHVzZXJzcGFjZSBtbWFwIGNoYXJkZXYsIHdoaWNoIHNlZW1zIGZyb3VnaHQgd2l0
aAo+IGRpZmZpY3VsdHkuIFRoaXMgeWVhciwgSSBoYXZlIHNvbWV0aGluZyBtdWNoIHNpbXBsZXIg
aW4gbWluZDogc2ltcGx5Cj4gdXNpbmcgdGhvc2UgQUNQSSBub3RpZmljYXRpb25zIHRvIHRlbGwg
dGhlIFJORyB0byByZWluaXRpYWxpemUgc2FmZWx5LAo+IHNvIHdlIGRvbid0IHJlcGVhdCByYW5k
b20gbnVtYmVycyBpbiBjbG9uZWQsIGZvcmtlZCwgb3Igcm9sbGVkLWJhY2sgVk0KPiBpbnN0YW5j
ZXMuCj4KPiBUaGlzIHNlcmllcyBjb25zaXN0cyBvZiB0d28gcGF0Y2hlcy4gVGhlIGZpcnN0IGlz
IGEgcmF0aGVyCj4gc3RyYWlnaHRmb3J3YXJkIGFkZGl0aW9uIHRvIHJhbmRvbS5jLCB3aGljaCBJ
IGZlZWwgZmluZSBhYm91dC4gVGhlCj4gc2Vjb25kIHBhdGNoIGlzIHRoZSByZWFzb24gdGhpcyBp
cyBqdXN0IGFuIFJGQzogaXQncyBhIGNsZWFudXAgb2YgdGhlCj4gQUNQSSBkcml2ZXIgZnJvbSBs
YXN0IHllYXIsIGFuZCBJIGRvbid0IHJlYWxseSBoYXZlIG11Y2ggZXhwZXJpZW5jZQo+IHdyaXRp
bmcsIHRlc3RpbmcsIGRlYnVnZ2luZywgb3IgbWFpbnRhaW5pbmcgdGhlc2UgdHlwZXMgb2YgZHJp
dmVycy4KPiBJZGVhbGx5IHRoaXMgdGhyZWFkIHdvdWxkIHlpZWxkIHNvbWVib2R5IHNheWluZywg
Ikkgc2VlIHRoZSBpbnRlbnQgb2YKPiB0aGlzOyBJJ20gaGFwcHkgdG8gdGFrZSBvdmVyIG93bmVy
c2hpcCBvZiB0aGlzIHBhcnQuIiBUaGF0IHdheSwgSSBjYW4KPiBmb2N1cyBvbiB0aGUgUk5HIHBh
cnQsIGFuZCB3aG9ldmVyIHN0ZXBzIHVwIGZvciB0aGUgcGFyYXZpcnQgQUNQSSBwYXJ0Cj4gY2Fu
IGZvY3VzIG9uIHRoYXQuCj4KPiBBcyBhIGZpbmFsIG5vdGUsIHRoaXMgc2VyaWVzIGludGVudGlv
bmFsbHkgZG9lcyBfbm90XyBmb2N1cyBvbgo+IG5vdGlmaWNhdGlvbiBvZiB0aGVzZSBldmVudHMg
dG8gdXNlcnNwYWNlIG9yIHRvIG90aGVyIGtlcm5lbCBjb25zdW1lcnMuCj4gU2luY2UgdGhlc2Ug
Vk0gZm9yayBkZXRlY3Rpb24gZXZlbnRzIGZpcnN0IG5lZWQgdG8gaGl0IHRoZSBSTkcsIHdlIGNh
bgo+IGxhdGVyIHRhbGsgYWJvdXQgd2hhdCBzb3J0cyBvZiBub3RpZmljYXRpb25zIG9yIG1tYXAn
ZCBjb3VudGVycyB0aGUgUk5HCj4gc2hvdWxkIGJlIG1ha2luZyBhY2Nlc3NpYmxlIHRvIGVsc2V3
aGVyZS4gQnV0IHRoYXQncyBhIGRpZmZlcmVudCBzb3J0IG9mCj4gcHJvamVjdCBhbmQgdGllcyBp
bnRvIGEgbG90IG9mIG1vcmUgY29tcGxpY2F0ZWQgY29uY2VybnMgYmV5b25kIHRoaXMKPiBtb3Jl
IGJhc2ljIHBhdGNoc2V0LiBTbyBob3BlZnVsbHkgd2UgY2FuIGtlZXAgdGhlIGRpc2N1c3Npb24g
cmF0aGVyCj4gZm9jdXNlZCBoZXJlIHRvIHRoaXMgQUNQSSBidXNpbmVzcy4KCgpUaGUgbWFpbiBw
cm9ibGVtIHdpdGggVk1HZW5JRCBpcyB0aGF0IGl0IGlzIGluaGVyZW50bHkgcmFjeS4gVGhlcmUg
d2lsbCAKYWx3YXlzIGJlIGEgKHNob3J0KSBhbW91bnQgb2YgdGltZSB3aGVyZSB0aGUgQUNQSSBu
b3RpZmljYXRpb24gaXMgbm90IApwcm9jZXNzZWQsIGJ1dCB0aGUgVk0gY291bGQgdXNlIGl0cyBS
TkcgdG8gZm9yIGV4YW1wbGUgZXN0YWJsaXNoIFRMUyAKY29ubmVjdGlvbnMuCgpIZW5jZSB3ZSBh
cyB0aGUgbmV4dCBzdGVwIHByb3Bvc2VkIGEgbXVsdGktc3RhZ2UgcXVpZXNjZS9yZXN1bWUgCm1l
Y2hhbmlzbSB3aGVyZSB0aGUgc3lzdGVtIGlzIGF3YXJlIHRoYXQgaXQgaXMgZ29pbmcgaW50byBz
dXNwZW5kIC0gY2FuIApibG9jayBuZXR3b3JrIGNvbm5lY3Rpb25zIGZvciBleGFtcGxlIC0gYW5k
IG9ubHkgcmV0dXJucyB0byBhIGZ1bGx5IApmdW5jdGlvbmFsIHN0YXRlIGFmdGVyIGFuIHVucXVp
ZXNjZSBwaGFzZToKCiDCoCBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2lzc3Vl
cy8yMDIyMgoKTG9va2luZyBhdCB0aGUgaXNzdWUgYWdhaW4sIGl0IHNlZW1zIGxpa2Ugd2UgY29t
cGxldGVseSBtaXNzZWQgdG8gZm9sbG93IAp1cCB3aXRoIGEgUFIgdG8gaW1wbGVtZW50IHRoYXQg
ZnVuY3Rpb25hbGl0eSA6KC4KCldoYXQgZXhhY3QgdXNlIGNhc2UgZG8geW91IGhhdmUgaW4gbWlu
ZCBmb3IgdGhlIFJORy9WTUdlbklEIHVwZGF0ZT8gQ2FuIAp5b3UgdGhpbmsgb2Ygc2l0dWF0aW9u
cyB3aGVyZSB0aGUgcmFjZSBpcyBub3QgYW4gYWN0dWFsIGNvbmNlcm4/CgoKQWxleAoKCj4KPiBD
YzogZHdtd0BhbWF6b24uY28udWsKPiBDYzogYWNhdGFuQGFtYXpvbi5jb20KPiBDYzogZ3JhZkBh
bWF6b24uY29tCj4gQ2M6IGNvbG1tYWNjQGFtYXpvbi5jb20KPiBDYzogc2JsYmlyQGFtYXpvbi5j
b20KPiBDYzogcmFkdXdlaXNAYW1hem9uLmNvbQo+IENjOiBqYW5uaEBnb29nbGUuY29tCj4gQ2M6
IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnCj4gQ2M6IHR5dHNvQG1pdC5lZHUKPgo+IEphc29u
IEEuIERvbmVuZmVsZCAoMik6Cj4gICAgcmFuZG9tOiBhZGQgbWVjaGFuaXNtIGZvciBWTSBmb3Jr
cyB0byByZWluaXRpYWxpemUgY3JuZwo+ICAgIGRyaXZlcnMvdmlydDogYWRkIHZtZ2VuaWQgZHJp
dmVyIGZvciByZWluaXRpYWxpemluZyBSTkcKPgo+ICAgZHJpdmVycy9jaGFyL3JhbmRvbS5jICB8
ICA1OCArKysrKysrKysrKysrKysrKysKPiAgIGRyaXZlcnMvdmlydC9LY29uZmlnICAgfCAgIDgg
KysrCj4gICBkcml2ZXJzL3ZpcnQvTWFrZWZpbGUgIHwgICAxICsKPiAgIGRyaXZlcnMvdmlydC92
bWdlbmlkLmMgfCAxMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgIGluY2x1ZGUvbGludXgvcmFuZG9tLmggfCAgIDEgKwo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAy
MDEgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlydC92bWdl
bmlkLmMKPgo+IC0tCj4gMi4zNS4xCj4KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJt
YW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzog
Q2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dl
cmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3Qt
SUQ6IERFIDI4OSAyMzcgODc5CgoK


