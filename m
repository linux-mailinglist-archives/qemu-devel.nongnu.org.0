Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0CE4C4878
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:52 +0100 (CET)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcJ1-0005pf-Pu
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:14:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=048cb90a0=graf@amazon.de>)
 id 1nNcGV-0004Rc-R6
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:12:16 -0500
Received: from smtp-fw-80007.amazon.com ([99.78.197.218]:41960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=048cb90a0=graf@amazon.de>)
 id 1nNcGS-0006LV-Fj
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1645801933; x=1677337933;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WYYeEdy3fDIESQeCBUqRGoMnf0dz653qSX0d2zXrlBE=;
 b=KFHRcTx7JWV+ZJn90FOHuhU4DVTHnJwlds5YeY+omO1UxcEVQTsfI87M
 XB1TEQ/uVsTeVDkM28Olmn5vXDUQGcymDqAoGCpv5/HHYKO1Lw1J2B//r
 mld+NQJteW8dFzUwPbdQpbptybG5Ngv9K0m5b76kiwIGuyqqdJBLnphlP g=;
X-IronPort-AV: E=Sophos;i="5.90,136,1643673600"; d="scan'208";a="66223167"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1e-fc41acad.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 25 Feb 2022 15:11:53 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1e-fc41acad.us-east-1.amazon.com (Postfix) with
 ESMTPS id 06BB4C0911; Fri, 25 Feb 2022 15:11:45 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Fri, 25 Feb 2022 15:11:43 +0000
Received: from [0.0.0.0] (10.43.161.126) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Fri, 25 Feb
 2022 15:11:36 +0000
Message-ID: <9ac68552-c1fc-22c8-13e6-4f344f85a4fb@amazon.com>
Date: Fri, 25 Feb 2022 16:11:34 +0100
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
 <YhjjuMOeV7+T7thS@zx2c4.com>
 <88ebdc32-2e94-ef28-37ed-1c927c12af43@amazon.com>
 <YhjoyIUv2+18BwiR@zx2c4.com>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <YhjoyIUv2+18BwiR@zx2c4.com>
X-Originating-IP: [10.43.161.126]
X-ClientProxiedBy: EX13D15UWA002.ant.amazon.com (10.43.160.218) To
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

Ck9uIDI1LjAyLjIyIDE1OjMzLCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4gT24gRnJpLCBG
ZWIgMjUsIDIwMjIgYXQgMDM6MTg6NDNQTSArMDEwMCwgQWxleGFuZGVyIEdyYWYgd3JvdGU6Cj4+
PiBJIHJlY2FsbCB0aGlzIHBhcnQgb2YgdGhlIG9sZCB0aHJlYWQuIEZyb20gd2hhdCBJIHVuZGVy
c3Rvb2QsIHVzaW5nCj4+PiAiVk1HRU5JRCIgKyAiUUVNVVZHSUQiIHdvcmtlZCAvd2VsbCBlbm91
Z2gvLCBldmVuIGlmIHRoYXQgd2Fzbid0Cj4+PiB0ZWNobmljYWxseSBpbi1zcGVjLiBBcmQgbm90
ZWQgdGhhdCByZWx5aW5nIG9uIF9DSUQgbGlrZSB0aGF0IGlzCj4+PiB0ZWNobmljYWxseSBhbiBB
Q1BJIHNwZWMgbm90aWZpY2F0aW9uLiBTbyB3ZSdyZSBiZXR3ZWVuIG9uZSBzcGVjIGFuZAo+Pj4g
YW5vdGhlciwgYmFzaWNhbGx5LCBhbmQgZG9pbmcgIlZNR0VOSUQiICsgIlFFTVVWR0lEIiByZXF1
aXJlcyBmZXdlcgo+Pj4gY2hhbmdlcywgYXMgbWVudGlvbmVkLCBhcHBlYXJzIHRvIHdvcmsgZmlu
ZSBpbiBteSB0ZXN0aW5nLgo+Pj4KPj4+IEhvd2V2ZXIsIHdpdGggdGhhdCBzYWlkLCBJIHRoaW5r
IHN1cHBvcnRpbmcgdGhpcyB2aWEgIlZNX0dlbl9Db3VudGVyIgo+Pj4gd291bGQgYmUgYSBiZXR0
ZXIgZXZlbnR1YWwgdGhpbmcgdG8gZG8sIGJ1dCB3aWxsIHJlcXVpcmUgYWNrcyBhbmQKPj4+IGNo
YW5nZXMgZnJvbSB0aGUgQUNQSSBtYWludGFpbmVycy4gRG8geW91IHRoaW5rIHlvdSBjb3VsZCBw
cmVwYXJlIHlvdXIKPj4+IHBhdGNoIHByb3Bvc2FsIGFib3ZlIGFzIHNvbWV0aGluZyBvbi10b3Ag
b2YgbXkgdHJlZSBbMV0/IEFuZCBpZiB5b3UgY2FuCj4+PiBjb252aW5jZSB0aGUgQUNQSSBtYWlu
dGFpbmVycyB0aGF0IHRoYXQncyBva2F5LCB0aGVuIEknbGwgaGFwcGlseSB0YWtlCj4+PiB0aGUg
cGF0Y2guCj4+Cj4+IFN1cmUsIGxldCBtZSBzZW5kIHRoZSBBQ1BJIHBhdGNoIHN0YW5kIGFsb25l
LiBObyBuZWVkIHRvIGluY2x1ZGUgdGhlCj4+IFZNR2VuSUQgY2hhbmdlIGluIHRoZXJlLgo+IFRo
YXQncyBmaW5lLiBJZiB0aGUgQUNQSSBwZW9wbGUgdGFrZSBpdCBmb3IgNS4xOCwgdGhlbiB3ZSBj
YW4gY291bnQgb24KPiBpdCBiZWluZyB0aGVyZSBhbmQgYWRqdXN0IHRoZSB2bWdlbmlkIGRyaXZl
ciBhY2NvcmRpbmdseSBhbHNvIGZvciA1LjE4Lgo+Cj4gSSBqdXN0IGJvb3RlZCB1cCBhIFdpbmRv
d3MgVk0sIGFuZCBpdCBsb29rcyBsaWtlIEh5cGVyLVYgdXNlcwo+ICJIeXBlcl9WX0dlbl9Db3Vu
dGVyX1YxIiwgd2hpY2ggaXMgYWxzbyBxdWl0ZSBsb25nLCBzbyB3ZSBjYW4ndCByZWFsbHkKPiBI
SUQgbWF0Y2ggb24gdGhhdCBlaXRoZXIuCgoKWWVzLCBkdWUgdG8gdGhlIHNhbWUgcHJvYmxlbS4g
SSdkIHJlYWxseSBwcmVmZXIgd2Ugc29ydCBvdXQgdGhlIEFDUEkgCm1hdGNoaW5nIGJlZm9yZSB0
aGlzIGdvZXMgbWFpbmxpbmUuIE1hdGNoaW5nIG9uIF9ISUQgaXMgZXhwbGljaXRseSAKZGlzY291
cmFnZWQgaW4gdGhlIFZNR2VuSUQgc3BlYy4KCgpBbGV4CgoKCgoKQW1hem9uIERldmVsb3BtZW50
IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVm
dHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFn
ZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6
IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


