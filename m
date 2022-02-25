Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0750C4C47D1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:44:59 +0100 (CET)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbq5-0002pE-It
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:44:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=048cb90a0=graf@amazon.de>)
 id 1nNbRS-00040e-Ii
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:19:30 -0500
Received: from smtp-fw-9103.amazon.com ([207.171.188.200]:58828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=048cb90a0=graf@amazon.de>)
 id 1nNbRH-0003fN-Q0
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1645798759; x=1677334759;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JS5wUTydEragTkrDUV+gfvs0YlNNXnR6VSN786T+J8s=;
 b=P2YLDj3wjm6a4VEp1XvzUb7i/dFzB86NgxXGkwVbtxaaUbrXRJI9crjQ
 umQ6pRP/WS5qnP3+hH1wgqrqRVmc24ARiLTnGCB5SUCw2d2h2kd7fod7l
 Kgd5v8z9JZ8wIJDk8Kl4wuruNQQu7XWPHLr+LmvfISAb+RjEiMnewu2wC 0=;
X-IronPort-AV: E=Sophos;i="5.90,136,1643673600"; d="scan'208";a="994982949"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-b27d4a00.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9103.sea19.amazon.com with ESMTP; 25 Feb 2022 14:18:59 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-b27d4a00.us-east-1.amazon.com (Postfix) with
 ESMTPS id 503638152A; Fri, 25 Feb 2022 14:18:53 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Fri, 25 Feb 2022 14:18:51 +0000
Received: from [0.0.0.0] (10.43.162.43) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Fri, 25 Feb
 2022 14:18:45 +0000
Message-ID: <88ebdc32-2e94-ef28-37ed-1c927c12af43@amazon.com>
Date: Fri, 25 Feb 2022 15:18:43 +0100
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
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <YhjjuMOeV7+T7thS@zx2c4.com>
X-Originating-IP: [10.43.162.43]
X-ClientProxiedBy: EX13d09UWA001.ant.amazon.com (10.43.160.247) To
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

Ck9uIDI1LjAyLjIyIDE1OjEyLCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4gSGkgQWxleCwK
Pgo+IE9uIEZyaSwgRmViIDI1LCAyMDIyIGF0IDAyOjU3OjM4UE0gKzAxMDAsIEFsZXhhbmRlciBH
cmFmIHdyb3RlOgo+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQgdm1nZW5p
ZF9pZHNbXSA9IHsKPj4+ICsgICAgICAgeyAiVk1HRU5JRCIsIDAgfSwKPj4+ICsgICAgICAgeyAi
UUVNVVZHSUQiLCAwIH0sCj4+Cj4+IEFjY29yZGluZyB0byB0aGUgVk1HZW5JRCBzcGVjWzFdLCB5
b3UgY2FuIG9ubHkgcmVseSBvbiBfQ0lEIGFuZCBfREROIGZvcgo+PiBtYXRjaGluZy4gVGhleSBi
b3RoIGNvbnRhaW4gIlZNX0dlbl9Db3VudGVyIi4gVGhlIGxpc3QgYWJvdmUgY29udGFpbnMKPj4g
X0hJRCB2YWx1ZXMgd2hpY2ggYXJlIG5vdCBhbiBvZmZpY2lhbCBpZGVudGlmaWVyIGZvciB0aGUg
Vk1HZW5JRCBkZXZpY2UuCj4+Cj4+IElJUkMgdGhlIEFDUEkgZGV2aWNlIG1hdGNoIGxvZ2ljIGRv
ZXMgbWF0Y2ggX0NJRCBpbiBhZGRpdGlvbiB0byBfSElELgo+PiBIb3dldmVyLCBpdCBpcyBsaW1p
dGVkIHRvIDggY2hhcmFjdGVycy4gTGV0IG1lIHBhc3RlIGFuIGV4cGVyaW1lbnRhbAo+PiBoYWNr
IEkgZGlkIGJhY2sgdGhlbiB0byBkbyB0aGUgX0NJRCBtYXRjaGluZyBpbnN0ZWFkLgo+Pgo+PiBb
MV0KPj4gaHR0cHM6Ly9kb3dubG9hZC5taWNyb3NvZnQuY29tL2Rvd25sb2FkLzMvMS9DLzMxQ0ZD
MzA3LTk4Q0EtNENBNS05MTRDLUQ5NzcyNjkxRTIxNC9WaXJ0dWFsTWFjaGluZUdlbmVyYXRpb25J
RC5kb2N4Cj4+Cj4+Cj4+IEFsZXgKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9idXMu
YyBiL2RyaXZlcnMvYWNwaS9idXMuYwo+PiBpbmRleCAxNjgyZjhiNDU0YTIuLjQ1MjQ0M2Q3OWQ4
NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9hY3BpL2J1cy5jCj4+ICsrKyBiL2RyaXZlcnMvYWNw
aS9idXMuYwo+PiBAQCAtNzQ4LDcgKzc0OCw3IEBAIHN0YXRpYyBib29sIF9fYWNwaV9tYXRjaF9k
ZXZpY2Uoc3RydWN0IGFjcGlfZGV2aWNlCj4+ICpkZXZpY2UsCj4+ICAgICAgICAgICAgLyogRmly
c3QsIGNoZWNrIHRoZSBBQ1BJL1BOUCBJRHMgcHJvdmlkZWQgYnkgdGhlIGNhbGxlci4gKi8KPj4g
ICAgICAgICAgICBpZiAoYWNwaV9pZHMpIHsKPj4gICAgICAgICAgICAgICAgZm9yIChpZCA9IGFj
cGlfaWRzOyBpZC0+aWRbMF0gfHwgaWQtPmNsczsgaWQrKykgewo+PiAtICAgICAgICAgICAgICAg
IGlmIChpZC0+aWRbMF0gJiYgIXN0cmNtcCgoY2hhciAqKWlkLT5pZCwgaHdpZC0+aWQpKQo+PiAr
ICAgICAgICAgICAgICAgIGlmIChpZC0+aWRbMF0gJiYgIXN0cm5jbXAoKGNoYXIgKilpZC0+aWQs
IGh3aWQtPmlkLAo+PiBBQ1BJX0lEX0xFTiAtIDEpKQo+PiAgICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gb3V0X2FjcGlfbWF0Y2g7Cj4+ICAgICAgICAgICAgICAgICAgICBpZiAoaWQtPmNscyAm
JiBfX2FjcGlfbWF0Y2hfZGV2aWNlX2NscyhpZCwgaHdpZCkpCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBvdXRfYWNwaV9tYXRjaDsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydC92
bWdlbmlkLmMgYi9kcml2ZXJzL3ZpcnQvdm1nZW5pZC5jCj4+IGluZGV4IDc1YTc4N2RhOGFhZC4u
MGJmYTQyMmNmMDk0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3ZpcnQvdm1nZW5pZC5jCj4+ICsr
KyBiL2RyaXZlcnMvdmlydC92bWdlbmlkLmMKPj4gQEAgLTM1Niw3ICszNTYsOCBAQCBzdGF0aWMg
dm9pZCB2bWdlbmlkX2FjcGlfbm90aWZ5KHN0cnVjdCBhY3BpX2RldmljZQo+PiAqZGV2aWNlLCB1
MzIgZXZlbnQpCj4+ICAgIH0KPj4KPj4gICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2Rldmlj
ZV9pZCB2bWdlbmlkX2lkc1tdID0gewo+PiAtICAgIHsiUUVNVVZHSUQiLCAwfSwKPj4gKyAgICAv
KiBUaGlzIHJlYWxseSBpcyBWTV9HZW5fQ291bnRlciwgYnV0IHdlIGNhbiBvbmx5IG1hdGNoIDgg
Y2hhcmFjdGVycyAqLwo+PiArICAgIHsiVk1fR0VOX0MiLCAwfSwKPj4gICAgICAgIHsiIiwgMH0s
Cj4+ICAgIH07Cj4gSSByZWNhbGwgdGhpcyBwYXJ0IG9mIHRoZSBvbGQgdGhyZWFkLiBGcm9tIHdo
YXQgSSB1bmRlcnN0b29kLCB1c2luZwo+ICJWTUdFTklEIiArICJRRU1VVkdJRCIgd29ya2VkIC93
ZWxsIGVub3VnaC8sIGV2ZW4gaWYgdGhhdCB3YXNuJ3QKPiB0ZWNobmljYWxseSBpbi1zcGVjLiBB
cmQgbm90ZWQgdGhhdCByZWx5aW5nIG9uIF9DSUQgbGlrZSB0aGF0IGlzCj4gdGVjaG5pY2FsbHkg
YW4gQUNQSSBzcGVjIG5vdGlmaWNhdGlvbi4gU28gd2UncmUgYmV0d2VlbiBvbmUgc3BlYyBhbmQK
PiBhbm90aGVyLCBiYXNpY2FsbHksIGFuZCBkb2luZyAiVk1HRU5JRCIgKyAiUUVNVVZHSUQiIHJl
cXVpcmVzIGZld2VyCj4gY2hhbmdlcywgYXMgbWVudGlvbmVkLCBhcHBlYXJzIHRvIHdvcmsgZmlu
ZSBpbiBteSB0ZXN0aW5nLgo+Cj4gSG93ZXZlciwgd2l0aCB0aGF0IHNhaWQsIEkgdGhpbmsgc3Vw
cG9ydGluZyB0aGlzIHZpYSAiVk1fR2VuX0NvdW50ZXIiCj4gd291bGQgYmUgYSBiZXR0ZXIgZXZl
bnR1YWwgdGhpbmcgdG8gZG8sIGJ1dCB3aWxsIHJlcXVpcmUgYWNrcyBhbmQKPiBjaGFuZ2VzIGZy
b20gdGhlIEFDUEkgbWFpbnRhaW5lcnMuIERvIHlvdSB0aGluayB5b3UgY291bGQgcHJlcGFyZSB5
b3VyCj4gcGF0Y2ggcHJvcG9zYWwgYWJvdmUgYXMgc29tZXRoaW5nIG9uLXRvcCBvZiBteSB0cmVl
IFsxXT8gQW5kIGlmIHlvdSBjYW4KPiBjb252aW5jZSB0aGUgQUNQSSBtYWludGFpbmVycyB0aGF0
IHRoYXQncyBva2F5LCB0aGVuIEknbGwgaGFwcGlseSB0YWtlCj4gdGhlIHBhdGNoLgoKClN1cmUs
IGxldCBtZSBzZW5kIHRoZSBBQ1BJIHBhdGNoIHN0YW5kIGFsb25lLiBObyBuZWVkIHRvIGluY2x1
ZGUgdGhlIApWTUdlbklEIGNoYW5nZSBpbiB0aGVyZS4KCgpBbGV4CgoKCgoKQW1hem9uIERldmVs
b3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdl
c2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWlu
Z2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBC
ClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


