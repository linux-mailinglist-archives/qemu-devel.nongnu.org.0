Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083352B9ACA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:41:05 +0100 (CET)
Received: from localhost ([::1]:56802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kford-00076J-UJ
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=585e362a5=graf@amazon.de>)
 id 1kfopS-0006MH-M1
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:38:48 -0500
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:51671)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=585e362a5=graf@amazon.de>) id 1kfopO-00086q-F5
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1605811122; x=1637347122;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=82Rk73IpbZeskBh4MpmRnlAzQdRj3TbKP1cGbKkpEmg=;
 b=u2Ijlrrk7YFs7V7azeeLTZ6uJDzOSvh/SxZeMlWgyqt7ct/zo+7OR7G9
 mOTq/RDhJ5kQPXD+HVjS6hNCpH/XycNNXKfIUiAlHssoYOLFR3IFABG5o
 WI+xhAanJDDwRod6wpVMQ87ukwhJnnriExdfkFOqo9uVtTyDy0xA8gnMp c=;
X-IronPort-AV: E=Sophos;i="5.78,354,1599523200"; d="scan'208";a="95837366"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 19 Nov 2020 18:37:10 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id CDC9AA1794; Thu, 19 Nov 2020 18:36:59 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Nov 2020 18:36:58 +0000
Received: from freeip.amazon.com (10.43.161.237) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Nov 2020 18:36:51 +0000
Subject: Re: [PATCH v2] drivers/virt: vmgenid: add vm generation id driver
To: Mike Rapoport <rppt@kernel.org>
CC: Christian Borntraeger <borntraeger@de.ibm.com>, "Catangiu, Adrian Costin"
 <acatan@amazon.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Jann Horn
 <jannh@google.com>, Willy Tarreau <w@1wt.eu>, "MacCarthaigh, Colm"
 <colmmacc@amazon.com>, Andy Lutomirski <luto@kernel.org>, "Theodore Y. Ts'o"
 <tytso@mit.edu>, Eric Biggers <ebiggers@kernel.org>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, kernel list
 <linux-kernel@vger.kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>,
 "bonzini@gnu.org" <bonzini@gnu.org>, "Singh, Balbir" <sblbir@amazon.com>,
 "Weiss, Radu" <raduweis@amazon.com>, "oridgar@gmail.com" <oridgar@gmail.com>, 
 "ghammer@redhat.com" <ghammer@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>, KVM list
 <kvm@vger.kernel.org>, Michal Hocko <mhocko@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Linux API
 <linux-api@vger.kernel.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 linux-s390 <linux-s390@vger.kernel.org>, "areber@redhat.com"
 <areber@redhat.com>, Pavel Emelyanov <ovzxemul@gmail.com>, Andrey Vagin
 <avagin@gmail.com>, Dmitry Safonov <0x7f454c46@gmail.com>, Pavel Tikhomirov
 <ptikhomirov@virtuozzo.com>, "gil@azul.com" <gil@azul.com>,
 "asmehra@redhat.com" <asmehra@redhat.com>, "dgunigun@redhat.com"
 <dgunigun@redhat.com>, "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
 <300d4404-3efe-880e-ef30-692eabbff5f7@de.ibm.com>
 <da1a1fa7-a1de-d0e6-755b-dd587687765e@amazon.de>
 <20201119173800.GD8537@kernel.org>
From: Alexander Graf <graf@amazon.de>
Message-ID: <1cdb6fac-0d50-3399-74a6-24c119ebbaa5@amazon.de>
Date: Thu, 19 Nov 2020 19:36:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201119173800.GD8537@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.43.161.237]
X-ClientProxiedBy: EX13D46UWC004.ant.amazon.com (10.43.162.173) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.171.190.10;
 envelope-from=prvs=585e362a5=graf@amazon.de; helo=smtp-fw-33001.amazon.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

CgpPbiAxOS4xMS4yMCAxODozOCwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiAKPiBPbiBUaHUsIE5v
diAxOSwgMjAyMCBhdCAwMTo1MToxOFBNICswMTAwLCBBbGV4YW5kZXIgR3JhZiB3cm90ZToKPj4K
Pj4KPj4gT24gMTkuMTEuMjAgMTM6MDIsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToKPj4+
Cj4+PiBPbiAxNi4xMS4yMCAxNjozNCwgQ2F0YW5naXUsIEFkcmlhbiBDb3N0aW4gd3JvdGU6Cj4+
Pj4gLSBCYWNrZ3JvdW5kCj4+Pj4KPj4+PiBUaGUgVk0gR2VuZXJhdGlvbiBJRCBpcyBhIGZlYXR1
cmUgZGVmaW5lZCBieSBNaWNyb3NvZnQgKHBhcGVyOgo+Pj4+IGh0dHA6Ly9nby5taWNyb3NvZnQu
Y29tL2Z3bGluay8/TGlua0lkPTI2MDcwOSkgYW5kIHN1cHBvcnRlZCBieQo+Pj4+IG11bHRpcGxl
IGh5cGVydmlzb3IgdmVuZG9ycy4KPj4+Pgo+Pj4+IFRoZSBmZWF0dXJlIGlzIHJlcXVpcmVkIGlu
IHZpcnR1YWxpemVkIGVudmlyb25tZW50cyBieSBhcHBzIHRoYXQgd29yawo+Pj4+IHdpdGggbG9j
YWwgY29waWVzL2NhY2hlcyBvZiB3b3JsZC11bmlxdWUgZGF0YSBzdWNoIGFzIHJhbmRvbSB2YWx1
ZXMsCj4+Pj4gdXVpZHMsIG1vbm90b25pY2FsbHkgaW5jcmVhc2luZyBjb3VudGVycywgZXRjLgo+
Pj4+IFN1Y2ggYXBwcyBjYW4gYmUgbmVnYXRpdmVseSBhZmZlY3RlZCBieSBWTSBzbmFwc2hvdHRp
bmcgd2hlbiB0aGUgVk0KPj4+PiBpcyBlaXRoZXIgY2xvbmVkIG9yIHJldHVybmVkIHRvIGFuIGVh
cmxpZXIgcG9pbnQgaW4gdGltZS4KPj4+Pgo+Pj4+IFRoZSBWTSBHZW5lcmF0aW9uIElEIGlzIGEg
c2ltcGxlIGNvbmNlcHQgbWVhbnQgdG8gYWxsZXZpYXRlIHRoZSBpc3N1ZQo+Pj4+IGJ5IHByb3Zp
ZGluZyBhIHVuaXF1ZSBJRCB0aGF0IGNoYW5nZXMgZWFjaCB0aW1lIHRoZSBWTSBpcyByZXN0b3Jl
ZAo+Pj4+IGZyb20gYSBzbmFwc2hvdC4gVGhlIGh3IHByb3ZpZGVkIFVVSUQgdmFsdWUgY2FuIGJl
IHVzZWQgdG8KPj4+PiBkaWZmZXJlbnRpYXRlIGJldHdlZW4gVk1zIG9yIGRpZmZlcmVudCBnZW5l
cmF0aW9ucyBvZiB0aGUgc2FtZSBWTS4KPj4+Pgo+Pj4+IC0gUHJvYmxlbQo+Pj4+Cj4+Pj4gVGhl
IFZNIEdlbmVyYXRpb24gSUQgaXMgZXhwb3NlZCB0aHJvdWdoIGFuIEFDUEkgZGV2aWNlIGJ5IG11
bHRpcGxlCj4+Pj4gaHlwZXJ2aXNvciB2ZW5kb3JzIGJ1dCBuZWl0aGVyIHRoZSB2ZW5kb3JzIG9y
IHVwc3RyZWFtIExpbnV4IGhhdmUgbm8KPj4+PiBkZWZhdWx0IGRyaXZlciBmb3IgaXQgbGVhdmlu
ZyB1c2VycyB0byBmZW5kIGZvciB0aGVtc2VsdmVzLgo+Pj4KPj4+IEkgc2VlIHRoYXQgdGhlIHFl
bXUgaW1wbGVtZW50YXRpb24gaXMgc3RpbGwgdW5kZXIgZGlzY3Vzc2lvbi4gV2hhdCBpcwo+Pgo+
PiBVaCwgdGhlIEFDUEkgVm1nZW5pZCBkZXZpY2UgZW11bGF0aW9uIGlzIGluIFFFTVUgc2luY2Ug
Mi45LjAgOikuCj4+Cj4+PiB0aGUgc3RhdHVzIG9mIHRoZSBvdGhlciBleGlzdGluZyBpbXBsZW1l
bnRhdGlvbnMuIERvIHRoZXkgYWxyZWFkeSBleGlzdD8KPj4+IEluIG90aGVyIHdvcmRzIGlzIEFD
UEkgYSBnaXZlbj8KPj4+IEkgdGhpbmsgdGhlIG1ham9yaXR5IG9mIHRoaXMgZHJpdmVyIGNvdWxk
IGJlIHVzZWQgd2l0aCBqdXN0IGEgZGlmZmVyZW50Cj4+PiBiYWNrZW5kIGZvciBwbGF0Zm9ybXMg
d2l0aG91dCBBQ1BJIHNvIGluIGFueSBjYXNlIHdlIGNvdWxkIGZhY3RvciBvdXQKPj4+IHRoZSBi
YWNrZW5kIChhY3BpLCB2aXJ0aW8sIHdoYXRldmVyKSBidXQgaWYgd2UgYXJlIG9wZW4gd2UgY291
bGQgbWF5YmUKPj4+IHN0YXJ0IHdpdGggc29tZXRoaW5nIGVsc2UuCj4+Cj4+IEkgYWdyZWUgMTAw
JS4gSSBkb24ndCB0aGluayB3ZSByZWFsbHkgbmVlZCBhIG5ldyBmcmFtZXdvcmsgaW4gdGhlIGtl
cm5lbCBmb3IKPj4gdGhhdC4gV2UgY2FuIGp1c3QgaGF2ZSBmb3IgZXhhbXBsZSBhbiBzMzkweCBz
cGVjaWZpYyBkcml2ZXIgdGhhdCBhbHNvCj4+IHByb3ZpZGVzIHRoZSBzYW1lIG5vdGlmaWNhdGlv
biBtZWNoYW5pc20gdGhyb3VnaCBhIGRldmljZSBub2RlIHRoYXQgaXMgYWxzbwo+PiBuYW1lZCAi
L2Rldi92bWdlbmlkIiwgbm8/Cj4+Cj4+IE9yIGFsdGVybmF0aXZlbHkgd2UgY2FuIHNwbGl0IHRo
ZSBnZW5lcmljIHBhcnQgb2YgdGhpcyBkcml2ZXIgYXMgc29vbiBhcyBhCj4+IHNlY29uZCBvbmUg
Y29tZXMgYWxvbmcgYW5kIHRoZW4gaGF2ZSBib3RoIGRyaXZlciBpbmNsdWRlIHRoYXQgZ2VuZXJp
YyBsb2dpYy4KPj4KPj4gVGhlIG9ubHkgcGllY2Ugd2hlcmUgSSdtIHVuc3VyZSBpcyBob3cgdGhp
cyB3aWxsIGludGVyYWN0IHdpdGggQ1JJVS4KPiAKPiBUbyBDL1IgYXBwbGljYXRpb25zIHRoYXQg
dXNlIC9kZXYvdm1nZW5pZCBDUklVIG5lZWQgdG8gYmUgYXdhcmUgb2YgaXQuCj4gQ2hlY2twb2lu
dGluZyBhbmQgcmVzdG9yaW5nIHdpdGhpbmcgdGhlIHNhbWUgIlZNIGdlbmVyYXRpb24iIHNob3Vs
ZG4ndCBiZQo+IGEgcHJvYmxlbSwgYnV0IElNSE8sIG1ha2luZyByZXN0b3JlIHdvcmsgYWZ0ZXIg
Z2VuaWQgYnVtcCBjb3VsZCBiZQo+IGNoYWxsZW5naW5nLgo+IAo+IEFsZXgsIHdoYXQgc2NlbmFy
aW8gaW52b2x2aW5nIENSSVUgZGlkIHlvdSBoYXZlIGluIG1pbmQ/CgpZb3UgY2FuIGluIHRoZW9y
eSBydW4gaW50byB0aGUgc2FtZSBzaXR1YXRpb24gd2l0aCBjb250YWluZXJzIHRoYXQgdGhpcyAK
cGF0Y2ggaXMgc29sdmluZyBmb3IgdmlydHVhbCBtYWNoaW5lcy4gWW91IGNvdWxkIGZvciBleGFt
cGxlIGRvIGEgCnNuYXBzaG90IG9mIGEgcHJld2FybWVkIEphdmEgcnVudGltZSB3aXRoIENSSVUg
dG8gZ2V0IGZ1bGwgSklUIHNwZWVkcyAKc3RhcnRpbmcgZnJvbSB0aGUgZmlyc3QgcmVxdWVzdC4K
ClRoYXQgaG93ZXZlciBtZWFucyB5b3UgcnVuIGludG8gdGhlIHByb2JsZW0gb2YgcHJlZGljdGFi
bGUgcmFuZG9tbmVzcyBhZ2Fpbi4KCj4gCj4+IENhbiBjb250YWluZXJzIGVtdWxhdGUgaW9jdGxz
IGFuZCBkZXZpY2Ugbm9kZXM/Cj4gCj4gQ29udGFpbmVycyBkbyBub3QgZW11bGF0ZSBpb2N0bHMg
YnV0IHRoZXkgY2FuIGhhdmUgL2Rldi92bWdlbmlkIGluc2lkZQo+IHRoZSBjb250YWluZXIsIHNv
IGFwcGxpY2F0aW9ucyBjYW4gdXNlIGl0IHRoZSBzYW1lIHdheSBhcyBvdXRzaWRlIHRoZQo+IGNv
bnRhaW5lci4KCkhtLiBJIHN1cHBvc2Ugd2UgY291bGQgYWRkIGEgQ0FQX0FETUlOIGlvY3RsIGlu
dGVyZmFjZSB0byAvZGV2L3ZtZ2VuaWQgCih3aGVuIGNvbnRhaW5lciBwZW9wbGUgZ2V0IHRvIHRo
ZSBwb2ludCBvZiBuZWVkaW5nIGl0KSB0aGF0IHNldHMgdGhlIApnZW5lcmF0aW9uIHRvICJhdCBs
ZWFzdCBYIi4gVGhhdCB3YXkgb24gcmVzdG9yZSwgeW91IGNvdWxkIGp1c3QgY2FsbCAKdGhhdCB3
aXRoICJnZW5lcmF0aW9uIGF0IHNuYXBzaG90IisxLgoKVGhhdCBhbHNvIG1lYW5zIHdlIG5lZWQg
dG8gaGF2ZSB0aGlzIGludGVyZmFjZSBhdmFpbGFibGUgd2l0aG91dCB2aXJ0dWFsIAptYWNoaW5l
cyB0aGVuIHRob3VnaCwgcmlnaHQ/CgoKQWxleAoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVy
IEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhy
dW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBB
bXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGlu
ClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


