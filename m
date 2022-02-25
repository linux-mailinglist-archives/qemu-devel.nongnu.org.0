Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED44C48C0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:25:21 +0100 (CET)
Received: from localhost ([::1]:54980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcTA-0006oO-9W
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:25:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=048cb90a0=graf@amazon.de>)
 id 1nNcKh-00084g-Ra
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:16:37 -0500
Received: from smtp-fw-80007.amazon.com ([99.78.197.218]:47075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=048cb90a0=graf@amazon.de>)
 id 1nNcKd-0007ci-Hy
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1645802192; x=1677338192;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0PWWQRRW37Y5DwUGjnUw/eZVXUeKiUeIEpdoKzm1SBw=;
 b=VFPPrli5Mz1Pj2XOpbBchQlanbRF4UxDaFBe7kbOu1Pf+js0vB6TDeao
 AbOuW+Q96dtMR2CNIQ1ggIk9h/2mZFePoAvPTl9Oc/5ngn5wI3T937kiR
 C/k9T07wJrB12VsHK8c1/qZfB0YHX+doK/eylHoRjhecymKpKT763yMjf 8=;
X-IronPort-AV: E=Sophos;i="5.90,136,1643673600"; d="scan'208";a="66224508"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-c92fe759.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 25 Feb 2022 15:16:10 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-c92fe759.us-east-1.amazon.com (Postfix) with
 ESMTPS id 6D47CC0326; Fri, 25 Feb 2022 15:16:08 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Fri, 25 Feb 2022 15:16:08 +0000
Received: from [0.0.0.0] (10.43.160.150) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Fri, 25 Feb
 2022 15:16:02 +0000
Message-ID: <b3b9dd9b-c42c-f057-f546-3e390b50479f@amazon.com>
Date: Fri, 25 Feb 2022 16:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing RNG
 on VM fork
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: <kvm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-hyperv@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <adrian@parity.io>, <ardb@kernel.org>, <ben@skyportsystems.com>,
 <berrange@redhat.com>, <colmmacc@amazon.com>, <decui@microsoft.com>,
 <dwmw@amazon.co.uk>, <ebiggers@kernel.org>, <ehabkost@redhat.com>,
 <gregkh@linuxfoundation.org>, <haiyangz@microsoft.com>,
 <imammedo@redhat.com>, <jannh@google.com>, <kys@microsoft.com>,
 <lersek@redhat.com>, <linux@dominikbrodowski.net>, <mst@redhat.com>,
 <qemu-devel@nongnu.org>, <raduweis@amazon.com>, <sthemmin@microsoft.com>,
 <tytso@mit.edu>, <wei.liu@kernel.org>
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
 <YhjttNadaaJzVa5X@zx2c4.com>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <YhjttNadaaJzVa5X@zx2c4.com>
X-Originating-IP: [10.43.160.150]
X-ClientProxiedBy: EX13D10UWA002.ant.amazon.com (10.43.160.228) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=99.78.197.218;
 envelope-from=prvs=048cb90a0=graf@amazon.de; helo=smtp-fw-80007.amazon.com
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

Ck9uIDI1LjAyLjIyIDE1OjU0LCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4gSGkgQWxleCwK
Pgo+IE1pc3NlZCB0aGlzIHJlbWFyayBiZWZvcmU6Cj4KPiBPbiBGcmksIEZlYiAyNSwgMjAyMiBh
dCAwMjo1NzozOFBNICswMTAwLCBBbGV4YW5kZXIgR3JhZiB3cm90ZToKPj4gUGxlYXNlIGV4cG9z
ZSB0aGUgdm1nZW5pZCB2aWEgL3N5c2ZzIHNvIHRoYXQgdXNlciBzcGFjZSBldmVuIHJlbW90ZWx5
Cj4+IGhhcyBhIGNoYW5jZSB0byBjaGVjayBpZiBpdCdzIGJlZW4gY2xvbmVkLgo+IE5vLiBEaWQg
eW91IHJlYWQgdGhlIDAvMiBjb3ZlciBsZXR0ZXI/IEknbGwgcXVvdGUgaXQgZm9yIHlvdSBoZXJl
Ogo+Cj4+IEFzIGEgc2lkZSBub3RlLCB0aGlzIHNlcmllcyBpbnRlbnRpb25hbGx5IGRvZXMgX25v
dF8gZm9jdXMgb24KPj4gbm90aWZpY2F0aW9uIG9mIHRoZXNlIGV2ZW50cyB0byB1c2Vyc3BhY2Ug
b3IgdG8gb3RoZXIga2VybmVsIGNvbnN1bWVycy4KPj4gU2luY2UgdGhlc2UgVk0gZm9yayBkZXRl
Y3Rpb24gZXZlbnRzIGZpcnN0IG5lZWQgdG8gaGl0IHRoZSBSTkcsIHdlIGNhbgo+PiBsYXRlciB0
YWxrIGFib3V0IHdoYXQgc29ydHMgb2Ygbm90aWZpY2F0aW9ucyBvciBtbWFwJ2QgY291bnRlcnMg
dGhlIFJORwo+PiBzaG91bGQgYmUgbWFraW5nIGFjY2Vzc2libGUgdG8gZWxzZXdoZXJlLiBCdXQg
dGhhdCdzIGEgZGlmZmVyZW50IHNvcnQgb2YKPj4gcHJvamVjdCBhbmQgdGllcyBpbnRvIGEgbG90
IG9mIG1vcmUgY29tcGxpY2F0ZWQgY29uY2VybnMgYmV5b25kIHRoaXMKPj4gbW9yZSBiYXNpYyBw
YXRjaHNldC4gU28gaG9wZWZ1bGx5IHdlIGNhbiBrZWVwIHRoZSBkaXNjdXNzaW9uIHJhdGhlcgo+
PiBmb2N1c2VkIGhlcmUgdG8gdGhpcyBBQ1BJIGJ1c2luZXNzLgo+IFdoYXQgYWJvdXQgdGhhdCB3
YXMgdW5jbGVhciB0byB5b3U/Cj4KPiBBbnl3YXksIGl0J3MgYSBkaWZmZXJlbnQgdGhpbmcgdGhh
dCB3aWxsIGhhdmUgdG8gYmUgZGVzaWduZWQgYW5kCj4gY29uc2lkZXJlZCBjYXJlZnVsbHksIGFu
ZCB0aGF0IGRlc2lnbiBkb2Vzbid0IGhhdmUgYSB3aG9sZSBsb3QgdG8gZG8KPiB3aXRoIHRoaXMg
bGl0dGxlIGRyaXZlciBoZXJlLCBleGNlcHQgaW5zb2ZhciBhcyBpdCBjb3VsZCBidWlsZCBvbiB0
b3Agb2YKPiBpdCBpbiBvbmUgd2F5IG9yIGFub3RoZXIuIFllcywgaXQncyBhbiBpbXBvcnRhbnQg
dGhpbmcgdG8gZG8uIE5vLCBJJ20KPiBub3QgZ29pbmcgdG8gZG8gaXQgaW4gdGhpcyBwYXRjaCBo
ZXJlLiBJZiB5b3Ugd2FudCB0byBoYXZlIGEgZGlzY3Vzc2lvbgo+IGFib3V0IHRoYXQsIHN0YXJ0
IGEgZGlmZmVyZW50IHRocmVhZC4KCgpJJ20gbm90IHRhbGtpbmcgYWJvdXQgYSBub3RpZmljYXRp
b24gaW50ZXJmYWNlIC0gd2UndmUgZ29uZSB0aHJvdWdoIApncmVhdCBsZW5ndGggb24gdGhhdCBv
bmUgaW4gdGhlIHByZXZpb3VzIHN1Ym1pc3Npb24uIFdoYXQgSSdtIG1vcmUgCmludGVyZXN0ZWQg
aW4gaXMgKmFueSogd2F5IGZvciB1c2VyIHNwYWNlIHRvIHJlYWQgdGhlIGN1cnJlbnQgVk0gR2Vu
IElELiAKVGhlIHNhbWUgd2F5IEknbSBpbnRlcmVzdGVkIHRvIHNlZSBvdGhlciBkZXZpY2UgYXR0
cmlidXRlcyBvZiBteSBzeXN0ZW0gCnRocm91Z2ggc3lzZnMuCgoKQWxleAoKCgoKCkFtYXpvbiBE
ZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxp
bgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNz
CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkx
NzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


