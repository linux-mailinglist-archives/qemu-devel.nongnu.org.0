Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E692B92D1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 13:52:38 +0100 (CET)
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjQT-00042N-R2
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 07:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=585e362a5=graf@amazon.de>)
 id 1kfjPc-0003cO-J7
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 07:51:44 -0500
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:56090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=585e362a5=graf@amazon.de>)
 id 1kfjPa-0005aG-MG
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 07:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1605790303; x=1637326303;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=seGsIDsNhmWuP2Cjs6gFXzfbcZ1elM5hlAecchVtBF4=;
 b=Uw7Sc1v0o2VOOlTp/x88SmbKXO4fW0fkqR+25M03g0Nn0mu/frH1nHlO
 uunyR9hacPE8BveHXfLBM+w/Cadz4wC3/3lI/r0yXLAPYea+hZV0yB2Eo
 lB/qWU7tvyDhJS/lbaMmtzA88ahiUpforzp013M32rDTHLN2i/5UKzOnW 0=;
X-IronPort-AV: E=Sophos;i="5.77,490,1596499200"; d="scan'208";a="67415804"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 19 Nov 2020 12:51:32 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9D0B6A1CCD; Thu, 19 Nov 2020 12:51:29 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Nov 2020 12:51:29 +0000
Received: from Alexanders-MacBook-Air.local (10.43.162.146) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Nov 2020 12:51:20 +0000
Subject: Re: [PATCH v2] drivers/virt: vmgenid: add vm generation id driver
To: Christian Borntraeger <borntraeger@de.ibm.com>, "Catangiu, Adrian Costin"
 <acatan@amazon.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Jann Horn
 <jannh@google.com>
CC: Willy Tarreau <w@1wt.eu>, "MacCarthaigh, Colm" <colmmacc@amazon.com>,
 "Andy Lutomirski" <luto@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Eric Biggers" <ebiggers@kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, kernel list <linux-kernel@vger.kernel.org>,
 "Woodhouse, David" <dwmw@amazon.co.uk>, "bonzini@gnu.org" <bonzini@gnu.org>,
 "Singh, Balbir" <sblbir@amazon.com>, "Weiss, Radu" <raduweis@amazon.com>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "ghammer@redhat.com"
 <ghammer@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Qemu
 Developers" <qemu-devel@nongnu.org>, KVM list <kvm@vger.kernel.org>, "Michal
 Hocko" <mhocko@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Pavel
 Machek" <pavel@ucw.cz>, Linux API <linux-api@vger.kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, linux-s390
 <linux-s390@vger.kernel.org>, "areber@redhat.com" <areber@redhat.com>, "Pavel
 Emelyanov" <ovzxemul@gmail.com>, Andrey Vagin <avagin@gmail.com>, "Mike
 Rapoport" <rppt@kernel.org>, Dmitry Safonov <0x7f454c46@gmail.com>, "Pavel
 Tikhomirov" <ptikhomirov@virtuozzo.com>, "gil@azul.com" <gil@azul.com>,
 "asmehra@redhat.com" <asmehra@redhat.com>, "dgunigun@redhat.com"
 <dgunigun@redhat.com>, "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
 <300d4404-3efe-880e-ef30-692eabbff5f7@de.ibm.com>
From: Alexander Graf <graf@amazon.de>
Message-ID: <da1a1fa7-a1de-d0e6-755b-dd587687765e@amazon.de>
Date: Thu, 19 Nov 2020 13:51:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <300d4404-3efe-880e-ef30-692eabbff5f7@de.ibm.com>
Content-Language: en-US
X-Originating-IP: [10.43.162.146]
X-ClientProxiedBy: EX13D41UWB004.ant.amazon.com (10.43.161.135) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=52.95.48.154;
 envelope-from=prvs=585e362a5=graf@amazon.de; helo=smtp-fw-6001.amazon.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 07:51:40
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

CgpPbiAxOS4xMS4yMCAxMzowMiwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIHdyb3RlOgo+IAo+IE9u
IDE2LjExLjIwIDE2OjM0LCBDYXRhbmdpdSwgQWRyaWFuIENvc3RpbiB3cm90ZToKPj4gLSBCYWNr
Z3JvdW5kCj4+Cj4+IFRoZSBWTSBHZW5lcmF0aW9uIElEIGlzIGEgZmVhdHVyZSBkZWZpbmVkIGJ5
IE1pY3Jvc29mdCAocGFwZXI6Cj4+IGh0dHA6Ly9nby5taWNyb3NvZnQuY29tL2Z3bGluay8/TGlu
a0lkPTI2MDcwOSkgYW5kIHN1cHBvcnRlZCBieQo+PiBtdWx0aXBsZSBoeXBlcnZpc29yIHZlbmRv
cnMuCj4+Cj4+IFRoZSBmZWF0dXJlIGlzIHJlcXVpcmVkIGluIHZpcnR1YWxpemVkIGVudmlyb25t
ZW50cyBieSBhcHBzIHRoYXQgd29yawo+PiB3aXRoIGxvY2FsIGNvcGllcy9jYWNoZXMgb2Ygd29y
bGQtdW5pcXVlIGRhdGEgc3VjaCBhcyByYW5kb20gdmFsdWVzLAo+PiB1dWlkcywgbW9ub3Rvbmlj
YWxseSBpbmNyZWFzaW5nIGNvdW50ZXJzLCBldGMuCj4+IFN1Y2ggYXBwcyBjYW4gYmUgbmVnYXRp
dmVseSBhZmZlY3RlZCBieSBWTSBzbmFwc2hvdHRpbmcgd2hlbiB0aGUgVk0KPj4gaXMgZWl0aGVy
IGNsb25lZCBvciByZXR1cm5lZCB0byBhbiBlYXJsaWVyIHBvaW50IGluIHRpbWUuCj4+Cj4+IFRo
ZSBWTSBHZW5lcmF0aW9uIElEIGlzIGEgc2ltcGxlIGNvbmNlcHQgbWVhbnQgdG8gYWxsZXZpYXRl
IHRoZSBpc3N1ZQo+PiBieSBwcm92aWRpbmcgYSB1bmlxdWUgSUQgdGhhdCBjaGFuZ2VzIGVhY2gg
dGltZSB0aGUgVk0gaXMgcmVzdG9yZWQKPj4gZnJvbSBhIHNuYXBzaG90LiBUaGUgaHcgcHJvdmlk
ZWQgVVVJRCB2YWx1ZSBjYW4gYmUgdXNlZCB0bwo+PiBkaWZmZXJlbnRpYXRlIGJldHdlZW4gVk1z
IG9yIGRpZmZlcmVudCBnZW5lcmF0aW9ucyBvZiB0aGUgc2FtZSBWTS4KPj4KPj4gLSBQcm9ibGVt
Cj4+Cj4+IFRoZSBWTSBHZW5lcmF0aW9uIElEIGlzIGV4cG9zZWQgdGhyb3VnaCBhbiBBQ1BJIGRl
dmljZSBieSBtdWx0aXBsZQo+PiBoeXBlcnZpc29yIHZlbmRvcnMgYnV0IG5laXRoZXIgdGhlIHZl
bmRvcnMgb3IgdXBzdHJlYW0gTGludXggaGF2ZSBubwo+PiBkZWZhdWx0IGRyaXZlciBmb3IgaXQg
bGVhdmluZyB1c2VycyB0byBmZW5kIGZvciB0aGVtc2VsdmVzLgo+IAo+IEkgc2VlIHRoYXQgdGhl
IHFlbXUgaW1wbGVtZW50YXRpb24gaXMgc3RpbGwgdW5kZXIgZGlzY3Vzc2lvbi4gV2hhdCBpcwoK
VWgsIHRoZSBBQ1BJIFZtZ2VuaWQgZGV2aWNlIGVtdWxhdGlvbiBpcyBpbiBRRU1VIHNpbmNlIDIu
OS4wIDopLgoKPiB0aGUgc3RhdHVzIG9mIHRoZSBvdGhlciBleGlzdGluZyBpbXBsZW1lbnRhdGlv
bnMuIERvIHRoZXkgYWxyZWFkeSBleGlzdD8KPiBJbiBvdGhlciB3b3JkcyBpcyBBQ1BJIGEgZ2l2
ZW4/Cj4gSSB0aGluayB0aGUgbWFqb3JpdHkgb2YgdGhpcyBkcml2ZXIgY291bGQgYmUgdXNlZCB3
aXRoIGp1c3QgYSBkaWZmZXJlbnQKPiBiYWNrZW5kIGZvciBwbGF0Zm9ybXMgd2l0aG91dCBBQ1BJ
IHNvIGluIGFueSBjYXNlIHdlIGNvdWxkIGZhY3RvciBvdXQKPiB0aGUgYmFja2VuZCAoYWNwaSwg
dmlydGlvLCB3aGF0ZXZlcikgYnV0IGlmIHdlIGFyZSBvcGVuIHdlIGNvdWxkIG1heWJlCj4gc3Rh
cnQgd2l0aCBzb21ldGhpbmcgZWxzZS4KCkkgYWdyZWUgMTAwJS4gSSBkb24ndCB0aGluayB3ZSBy
ZWFsbHkgbmVlZCBhIG5ldyBmcmFtZXdvcmsgaW4gdGhlIGtlcm5lbCAKZm9yIHRoYXQuIFdlIGNh
biBqdXN0IGhhdmUgZm9yIGV4YW1wbGUgYW4gczM5MHggc3BlY2lmaWMgZHJpdmVyIHRoYXQgCmFs
c28gcHJvdmlkZXMgdGhlIHNhbWUgbm90aWZpY2F0aW9uIG1lY2hhbmlzbSB0aHJvdWdoIGEgZGV2
aWNlIG5vZGUgdGhhdCAKaXMgYWxzbyBuYW1lZCAiL2Rldi92bWdlbmlkIiwgbm8/CgpPciBhbHRl
cm5hdGl2ZWx5IHdlIGNhbiBzcGxpdCB0aGUgZ2VuZXJpYyBwYXJ0IG9mIHRoaXMgZHJpdmVyIGFz
IHNvb24gYXMgCmEgc2Vjb25kIG9uZSBjb21lcyBhbG9uZyBhbmQgdGhlbiBoYXZlIGJvdGggZHJp
dmVyIGluY2x1ZGUgdGhhdCBnZW5lcmljIApsb2dpYy4KClRoZSBvbmx5IHBpZWNlIHdoZXJlIEkn
bSB1bnN1cmUgaXMgaG93IHRoaXMgd2lsbCBpbnRlcmFjdCB3aXRoIENSSVUuIENhbiAKY29udGFp
bmVycyBlbXVsYXRlIGlvY3RscyBhbmQgZGV2aWNlIG5vZGVzPwoKCkFsZXgKCgoKQW1hem9uIERl
dmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGlu
Ckdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MK
RWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3
MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


