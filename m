Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C0F4C495B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:42:55 +0100 (CET)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNckA-0006Fe-Er
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:42:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=048cb90a0=graf@amazon.de>)
 id 1nNcfb-0003JU-JK
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:38:11 -0500
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:23882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=048cb90a0=graf@amazon.de>)
 id 1nNcfY-0008RO-GF
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1645803488; x=1677339488;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zufo2VqoW12ZsZWjP7rvFxXLnq5dHqI9qda+WDGbeVc=;
 b=ZhR4WqTGI1s6ATBL0Gay05vSRfm+v6RQe5fXOwnl0+2BstbtCkVFT6fH
 K0qN8uWQ74qcv5bRl1WtDHLiiUtw4+0Fh5W/pdDf2syfIlUeMsRPoD7uL
 jtgzz9Mm7RxeDXLg2c6jieEvqtLSg5Q/nLrkseeNYtP9KZ+w0lJXv+sUB 0=;
X-IronPort-AV: E=Sophos;i="5.90,136,1643673600"; d="scan'208";a="197753896"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-6435a935.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 25 Feb 2022 15:37:52 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-6435a935.us-west-2.amazon.com (Postfix) with
 ESMTPS id DD055418D1; Fri, 25 Feb 2022 15:37:51 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Fri, 25 Feb 2022 15:37:51 +0000
Received: from [0.0.0.0] (10.43.161.217) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Fri, 25 Feb
 2022 15:37:45 +0000
Message-ID: <b6c5c4d4-88a5-1ac5-a4d4-2f6895065834@amazon.com>
Date: Fri, 25 Feb 2022 16:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing RNG
 on VM fork
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, 
 <adrian@parity.io>
CC: KVM list <kvm@vger.kernel.org>, Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>, <linux-hyperv@vger.kernel.org>, "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>, <ben@skyportsystems.com>,
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
 <Yhj288aE5rW15Qpj@zx2c4.com>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <Yhj288aE5rW15Qpj@zx2c4.com>
X-Originating-IP: [10.43.161.217]
X-ClientProxiedBy: EX13D15UWA003.ant.amazon.com (10.43.160.182) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.171.184.29;
 envelope-from=prvs=048cb90a0=graf@amazon.de; helo=smtp-fw-9102.amazon.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ck9uIDI1LjAyLjIyIDE2OjM0LCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4gT24gRnJpLCBG
ZWIgMjUsIDIwMjIgYXQgMDQ6MTY6MjdQTSArMDEwMCwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4+
Pj4gSSBqdXN0IGJvb3RlZCB1cCBhIFdpbmRvd3MgVk0sIGFuZCBpdCBsb29rcyBsaWtlIEh5cGVy
LVYgdXNlcwo+Pj4+ICJIeXBlcl9WX0dlbl9Db3VudGVyX1YxIiwgd2hpY2ggaXMgYWxzbyBxdWl0
ZSBsb25nLCBzbyB3ZSBjYW4ndCByZWFsbHkKPj4+PiBISUQgbWF0Y2ggb24gdGhhdCBlaXRoZXIu
Cj4+Pgo+Pj4gWWVzLCBkdWUgdG8gdGhlIHNhbWUgcHJvYmxlbS4gSSdkIHJlYWxseSBwcmVmZXIg
d2Ugc29ydCBvdXQgdGhlIEFDUEkKPj4+IG1hdGNoaW5nIGJlZm9yZSB0aGlzIGdvZXMgbWFpbmxp
bmUuIE1hdGNoaW5nIG9uIF9ISUQgaXMgZXhwbGljaXRseQo+Pj4gZGlzY291cmFnZWQgaW4gdGhl
IFZNR2VuSUQgc3BlYy4KPj4+Cj4+IE9LLCB0aGlzIHJlYWxseSBzdWNrcy4gUXVvdGluZyB0aGUg
QUNQSSBzcGVjOgo+Pgo+PiAiIiIKPj4gQSBfSElEIG9iamVjdCBldmFsdWF0ZXMgdG8gZWl0aGVy
IGEgbnVtZXJpYyAzMi1iaXQgY29tcHJlc3NlZCBFSVNBCj4+IHR5cGUgSUQgb3IgYSBzdHJpbmcu
IElmIGEgc3RyaW5nLCB0aGUgZm9ybWF0IG11c3QgYmUgYW4gYWxwaGFudW1lcmljCj4+IFBOUCBv
ciBBQ1BJIElEIHdpdGggbm8gYXN0ZXJpc2sgb3Igb3RoZXIgbGVhZGluZyBjaGFyYWN0ZXJzLgo+
PiBBIHZhbGlkIFBOUCBJRCBtdXN0IGJlIG9mIHRoZSBmb3JtICJBQUEjIyMjIiB3aGVyZSBBIGlz
IGFuIHVwcGVyY2FzZQo+PiBsZXR0ZXIgYW5kICMgaXMgYSBoZXggZGlnaXQuCj4+IEEgdmFsaWQg
QUNQSSBJRCBtdXN0IGJlIG9mIHRoZSBmb3JtICJOTk5OIyMjIyIgd2hlcmUgTiBpcyBhbiB1cHBl
cmNhc2UKPj4gbGV0dGVyIG9yIGEgZGlnaXQgKCcwJy0nOScpIGFuZCAjIGlzIGEgaGV4IGRpZ2l0
LiBUaGlzIHNwZWNpZmljYXRpb24KPj4gcmVzZXJ2ZXMgdGhlIHN0cmluZyAiQUNQSSIgZm9yIHVz
ZSBvbmx5IHdpdGggZGV2aWNlcyBkZWZpbmVkIGhlcmVpbi4KPj4gSXQgZnVydGhlciByZXNlcnZl
cyBhbGwgc3RyaW5ncyByZXByZXNlbnRpbmcgNCBIRVggZGlnaXRzIGZvcgo+PiBleGNsdXNpdmUg
dXNlIHdpdGggUENJLWFzc2lnbmVkIFZlbmRvciBJRHMuCj4+ICIiIgo+Pgo+PiBTbyBub3cgd2Ug
aGF2ZSB0byBpbXBsZW1lbnQgTWljcm9zb2Z0J3MgZm9yayBvZiBBQ1BJIHRvIGJlIGFibGUgdG8g
dXNlCj4+IHRoaXMgZGV2aWNlLCBldmVuIGlmIHdlIGV4cG9zZSBpdCBmcm9tIFFFTVUgaW5zdGVh
ZCBvZiBIeXBlci1WPyBJCj4+IHN0cm9uZ2x5IG9iamVjdCB0byB0aGF0Lgo+Pgo+PiBJbnN0ZWFk
LCB3ZSBjYW4gbWF0Y2ggb24gX0hJRCBleHBvc2VkIGJ5IFFFTVUsIGFuZCBjb3JkaWFsbHkgaW52
aXRlCj4+IE1pY3Jvc29mdCB0byBhbGlnbiB0aGVpciBzcGVjIHdpdGggdGhlIEFDUEkgc3BlYy4K
PiBJIGRvbid0IGtub3cgYWJvdXQgdGhhdC4uLiBTZWVtcyBhIGJpdCBleHRyZW1lLiBIb3BlZnVs
bHkgQWxleCB3aWxsIGJlCj4gYWJsZSB0byBzb3J0IHNvbWV0aGluZyBvdXQgd2l0aCB0aGUgQUNQ
SSBwZW9wbGUsIGFuZCB0aGlzIGRyaXZlciB3aWxsCj4gd29yayBpbnNpZGUgb2YgSHlwZXItVi4K
Pgo+IEhlcmUncyB3aGF0IHdlIGN1cnJlbnRseSBoYXZlOgo+Cj4gICAgc3RhdGljIGNvbnN0IHN0
cnVjdCBhY3BpX2RldmljZV9pZCB2bWdlbmlkX2lkc1tdID0gewo+ICAgICAgeyAiVk1HRU5JRCIs
IDAgfSwgIDwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gPz8/Cj4gICAgICB7
ICJRRU1VVkdJRCIsIDAgfSwgPC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSBR
RU1VCj4gICAgICB7IH0sCj4gICAgfTsKPgo+IEFkcmlhbiBhZGRlZCAiVk1HRU5JRCIgaW4gbGFz
dCB5ZWFyJ3MgdjQsIHNvIEkgY29waWVkIHRoYXQgZm9yIHRoaXMgbmV3Cj4gZHJpdmVyIGhlcmUu
IEJ1dCBkb2VzIGFueWJvZHkga25vdyB3aGljaCBoeXBlcnZpc29yIGl0IGlzIGZvcj8gU29tZQo+
IGludGVybmFsIEFtYXpvbiB0aGluZz8gRmlyZWNyYWNrZXI/IFZNd2FyZT8gSW4gY2FzZSBBbGV4
IGRvZXMgbm90Cj4gc3VjY2VlZCB3aXRoIHRoZSBBQ1BJIGNoYW5nZXMsIGl0J2QgYmUgbmljZSB0
byBrbm93IHdoaWNoIEhJRHMgZm9yCj4gd2hpY2ggaHlwZXJ2aXNvcnMgd2UgZG8gYW5kIGRvIG5v
dCBzdXBwb3J0LgoKCkkgYmVsaWV2ZSAiVk1HRU5JRCIgd2FzIGZvciB0aGUgZmlyZWNyYWNrZXIg
cHJvdG90eXBlIHRoYXQgQWRyaWFuIGJ1aWx0IApiYWNrIHRoZW4sIHllYWguIE1hdGNoaW5nIG9u
IF9ISUQgZm9yIHRoaXMgaXMgYSByYXQgaG9sZSB1bmZvcnR1bmF0ZWx5LCAKc28gbGV0J3Mgc2Vl
IHdoYXQgdGhlIEFDUEkgcGF0Y2ggZ2V0cyB1cyA6KS4KCgpBbGV4CgoKCgoKQW1hem9uIERldmVs
b3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdl
c2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWlu
Z2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBC
ClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


