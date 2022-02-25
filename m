Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414954C49EB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:00:29 +0100 (CET)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNd1A-0005Sk-4j
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:00:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=048cb90a0=graf@amazon.de>)
 id 1nNcyw-0004lO-Sg
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:58:11 -0500
Received: from smtp-fw-9103.amazon.com ([207.171.188.200]:49242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=048cb90a0=graf@amazon.de>)
 id 1nNcyu-0000A9-5I
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1645804688; x=1677340688;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/4HhS3bKDhHBG81XwvT+lvk6Ix/QvcITcjjX0JZqCZA=;
 b=Hsgv1QL+X/1AXr4wb9OLUbW/N5SX3+g536loUpNKBD7Fb8trKtU+h9mP
 sLyR8kbX1ttzZRkwHkrByIMB3ztM4qdfH2z6ELucXVyTXl2qQ5Ug2URIo
 yNNCbPrF78fxSu1jF28z17ErXstDKFzcKSE4yz3nlv5Yw7FoRKrbUHFIV U=;
X-IronPort-AV: E=Sophos;i="5.90,136,1643673600"; d="scan'208";a="995010317"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9103.sea19.amazon.com with ESMTP; 25 Feb 2022 15:57:50 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com (Postfix) with
 ESMTPS id 06FB2A29C8; Fri, 25 Feb 2022 15:57:50 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Fri, 25 Feb 2022 15:57:49 +0000
Received: from [0.0.0.0] (10.43.160.203) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Fri, 25 Feb
 2022 15:57:43 +0000
Message-ID: <5a196de5-d7cb-d462-2292-af05907d3544@amazon.com>
Date: Fri, 25 Feb 2022 16:57:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing RNG
 on VM fork
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: Ard Biesheuvel <ardb@kernel.org>, KVM list <kvm@vger.kernel.org>, "Linux
 Crypto Mailing List" <linux-crypto@vger.kernel.org>,
 <linux-hyperv@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, <adrian@parity.io>, <ben@skyportsystems.com>, 
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, "Colm
 MacCarthaigh" <colmmacc@amazon.com>, Dexuan Cui <decui@microsoft.com>,
 "Woodhouse, David" <dwmw@amazon.co.uk>, Eric Biggers <ebiggers@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Haiyang Zhang <haiyangz@microsoft.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Jann Horn <jannh@google.com>, KY Srinivasan
 <kys@microsoft.com>, Laszlo Ersek <lersek@redhat.com>, Dominik Brodowski
 <linux@dominikbrodowski.net>, "Michael S. Tsirkin" <mst@redhat.com>, "QEMU
 Developers" <qemu-devel@nongnu.org>, "Weiss, Radu" <raduweis@amazon.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, "Theodore Y. Ts'o"
 <tytso@mit.edu>, Wei Liu <wei.liu@kernel.org>
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
 <YhjjuMOeV7+T7thS@zx2c4.com>
 <88ebdc32-2e94-ef28-37ed-1c927c12af43@amazon.com>
 <YhjoyIUv2+18BwiR@zx2c4.com>
 <9ac68552-c1fc-22c8-13e6-4f344f85a4fb@amazon.com>
 <CAMj1kXEue6cDCSG0N7WGTVF=JYZx3jwE7EK4tCdhO-HzMtWwVw@mail.gmail.com>
 <c8066caf-8bbb-b148-57e6-98d8449a64c3@amazon.com>
 <Yhj5Dyd6+oC/R1H5@zx2c4.com>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <Yhj5Dyd6+oC/R1H5@zx2c4.com>
X-Originating-IP: [10.43.160.203]
X-ClientProxiedBy: EX13D43UWC004.ant.amazon.com (10.43.162.42) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.171.188.200;
 envelope-from=prvs=048cb90a0=graf@amazon.de; helo=smtp-fw-9103.amazon.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Ck9uIDI1LjAyLjIyIDE2OjQzLCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4KPiBIaSBBbGV4
LAo+Cj4gT24gRnJpLCBGZWIgMjUsIDIwMjIgYXQgMDQ6MjI6NTRQTSArMDEwMCwgQWxleGFuZGVy
IEdyYWYgd3JvdGU6Cj4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgcnVzaCBoZXJlLiBUaGlzIGhh
ZCBiZWVuIHNpdHRpbmcgb24gdGhlIE1MIGZvciAxCj4+IHllYXIgLSBhbmQgbm93IHN1ZGRlbmx5
IHRhbGtpbmcgdGhlIG1hdGNoIHRocm91Z2ggcHJvcGVybHkgYW5kIGdldHRpbmcKPj4gVk1HZW5J
RCBzcGVjIGNvbXBhdGlibGUgbWF0Y2hpbmcgc3VwcG9ydCBpbnRvIHRoZSBBQ1BJIGNvcmUgaXMg
YQo+PiBwcm9ibGVtPyBXaGF0IGRpZCBJIG1pc3M/IDopCj4gSSBkb24ndCB0aGluayB0aGlzIGlz
IGEgcXVlc3Rpb24gYWJvdXQgc3BlZWQuIEFyZCBkb2Vzbid0IGxpa2UgdGhlIHNwZWMuCj4gWW91
IGxpa2UgdGhlIGZlYXR1cmUgbW9yZSB0aGFuIHlvdSBkaXNsaWtlIHRoZSBzcGVjLiBBcHBhcmVu
dGx5IHRoYXQKPiBtZWFucyB0aGVyZSdzIGEgZGlzYWdyZWVtZW50Lgo+Cj4gQXMgSSBtZW50aW9u
ZWQgZWFybGllciwgSSdkIGVuY291cmFnZSB5b3UgdG8gc2VuZCBhIHBhdGNoIHRvIHRoZSBBQ1BJ
Cj4gcGVvcGxlIGFuZCBsZXQgdGhlbSBkZWNpZGUuIElmIHRoYXQgZ2V0cyBpbiwgdGhlbiBJJ20g
ZmluZSB3aXRoCj4gbW9kaWZ5aW5nIHZtZ2VuaWQgdG8gbWVldCB0aGUgc3BlYyBhbmQgdGFrZSBh
ZHZhbnRhZ2Ugb2YgdGhlIGNoYW5nZQo+IHlvdSdsbCBiZSBtYWtpbmcgdG8gdGhlIEFDUEkgY29k
ZS4gSWYgaXQgaXMgcmVqZWN0ZWQgYnkgdGhlIEFDUEkgcGVvcGxlLAo+IGFuZCBjb25zZXF1ZW50
bHkgTGludXggaXNuJ3QgYWJsZSB0byBtYXRjaCBvbiBfQ0lELCB0aGVuIEkgZ3Vlc3Mgd2UnbGwK
PiBoYXZlIHRoZSBuZXh0IGJlc3QgdGhpbmcsIHdoaWNoIGlzICJ3ZWxsLCBpdCBzdGlsbCB3b3Jr
cyBvbiBRRU1VLiIKPiBIb3BlZnVsbHkgeW91J2xsIGNvbnZpbmNlIHRoZW0uIEZlZWwgZnJlZSB0
byBDQyBtZSBvbiB0aGF0IHBhdGNoLgoKCkkgYWdyZWUgd2l0aCB0aGF0IGFwcHJvYWNoIGFuZCBD
QydlZCB5b3Ugb24gdGhlIEFDUEkgcGF0Y2ggOikuIExldCdzIApleHBsb3JlIGFsbCBvcHRpb25z
IHRvIG1hdGNoIGFnYWluc3QgX0NJRCBiZWZvcmUgd2UgZ2l2ZSB1cC4KCgpBbGV4CgoKCgoKQW1h
em9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcg
QmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4g
V2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJC
IDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


