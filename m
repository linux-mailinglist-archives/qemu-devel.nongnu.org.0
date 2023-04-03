Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FDC6D5492
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 00:14:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjSQS-0005vu-4v; Mon, 03 Apr 2023 18:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450ae5ae2=graf@amazon.de>)
 id 1pjSQQ-0005vm-CD
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 18:13:18 -0400
Received: from smtp-fw-9103.amazon.com ([207.171.188.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450ae5ae2=graf@amazon.de>)
 id 1pjSPB-0002Ei-NN
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 18:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1680559921; x=1712095921;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+7j0MxGMj107XkQyBno/y7A/OjjH01J5F87qR81C3+k=;
 b=OS9/jbr06s2mhNlqz6fGSzpTZHSd0EJtkW4unT4+r/s8SLJuGl2tGdHR
 PjJ+5pQh9wl2RmQ6yZ2divvcWVmIcK0tGRXgRG8+lGquEFAQnBsXAkC4S
 fKQivAUqa97jQ5ZHBq3sdLpdAdDOorrWIDjv+oBWB9gY+oqsaTtpfAKwQ w=;
X-IronPort-AV: E=Sophos;i="5.98,315,1673913600"; d="scan'208";a="1119129876"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-fad5e78e.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9103.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 22:11:57 +0000
Received: from EX19MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2c-m6i4x-fad5e78e.us-west-2.amazon.com (Postfix)
 with ESMTPS id 7AEF0A0796; Mon,  3 Apr 2023 22:11:56 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 3 Apr 2023 22:11:56 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 3 Apr
 2023 22:11:52 +0000
Message-ID: <b3e4a295-f233-9a49-2220-9ad4638e6c65@amazon.com>
Date: Tue, 4 Apr 2023 00:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v4] hostmem-file: add offset option
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
CC: <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, "Eduardo
 Habkost" <eduardo@habkost.net>, "Daniel P . Berrange" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Philippe Mathieu-Daude <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>, "Tom
 Lendacky" <thomas.lendacky@amd.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <20230401124257.24537-1-graf@amazon.com>
 <20230401174716.GB154566@fedora>
 <f2e232df-51d4-9cac-557d-329523a69530@redhat.com>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <f2e232df-51d4-9cac-557d-329523a69530@redhat.com>
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D036UWB001.ant.amazon.com (10.13.139.133) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.171.188.200;
 envelope-from=prvs=450ae5ae2=graf@amazon.de; helo=smtp-fw-9103.amazon.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.349,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ck9uIDAzLjA0LjIzIDA5OjEzLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKCj4KPiBPbiAwMS4w
NC4yMyAxOTo0NywgU3RlZmFuIEhham5vY3ppIHdyb3RlOgo+PiBPbiBTYXQsIEFwciAwMSwgMjAy
MyBhdCAxMjo0Mjo1N1BNICswMDAwLCBBbGV4YW5kZXIgR3JhZiB3cm90ZToKPj4+IEFkZCBhbiBv
cHRpb24gZm9yIGhvc3RtZW0tZmlsZSB0byBzdGFydCB0aGUgbWVtb3J5IG9iamVjdCBhdCBhbiBv
ZmZzZXQKPj4+IGludG8gdGhlIHRhcmdldCBmaWxlLiBUaGlzIGlzIHVzZWZ1bCBpZiBtdWx0aXBs
ZSBtZW1vcnkgb2JqZWN0cyByZXNpZGUKPj4+IGluc2lkZSB0aGUgc2FtZSB0YXJnZXQgZmlsZSwg
c3VjaCBhcyBhIGRldmljZSBub2RlLgo+Pj4KPj4+IEluIHBhcnRpY3VsYXIsIGl0J3MgdXNlZnVs
IHRvIG1hcCBndWVzdCBtZW1vcnkgZGlyZWN0bHkgaW50byAvZGV2L21lbQo+Pj4gZm9yIGV4cGVy
aW1lbnRhdGlvbi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgR3JhZiA8Z3JhZkBh
bWF6b24uY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAZ21h
aWwuY29tPgo+Pj4KPj4+IC0tLQo+Pj4KPj4+IHYxIC0+IHYyOgo+Pj4KPj4+IMKgwqAgLSBhZGQg
cW9tIGRvY3VtZW50YXRpb24KPj4+IMKgwqAgLSBwcm9wYWdhdGUgb2Zmc2V0IGludG8gdHJ1bmNh
dGUsIHNpemUgYW5kIGFsaWdubWVudCBjaGVja3MKPj4+Cj4+PiB2MiAtPiB2MzoKPj4+Cj4+PiDC
oMKgIC0gZmFpbGVkIGF0dGVtcHQgYXQgZml4aW5nIHR5cG8KPj4+Cj4+PiB2MiAtPiB2NDoKPj4+
Cj4+PiDCoMKgIC0gZml4IHR5cG8KPj4+IC0tLQo+Pj4gwqAgYmFja2VuZHMvaG9zdG1lbS1maWxl
LmMgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+PiDCoCBp
bmNsdWRlL2V4ZWMvbWVtb3J5LmjCoMKgIHzCoCAyICsrCj4+PiDCoCBpbmNsdWRlL2V4ZWMvcmFt
X2FkZHIuaCB8wqAgMyArKy0KPj4+IMKgIHFhcGkvcW9tLmpzb27CoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgNSArKysrKwo+Pj4gwqAgcWVtdS1vcHRpb25zLmh4wqDCoMKgwqDCoMKgwqDCoCB8wqAg
NiArKysrKy0KPj4+IMKgIHNvZnRtbXUvbWVtb3J5LmPCoMKgwqDCoMKgwqDCoCB8wqAgMyArKy0K
Pj4+IMKgIHNvZnRtbXUvcGh5c21lbS5jwqDCoMKgwqDCoMKgIHwgMTQgKysrKysrKysrKy0tLS0K
Pj4+IMKgIDcgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkK
Pj4KPj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4K
Pgo+IFRoZSBjaGFuZ2UgaXRzZWxmIGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCBJIGRvIHRoaW5rIHNv
bWUgb3RoZXIgUUVNVSBjb2RlCj4gdGhhdCBlbmRzIHVwIHdvcmtpbmcgb24gdGhlIFJBTUJsb2Nr
IGlzIG5vdCBwcmVwYXJlZCB5ZXQuIE1vc3QgcHJvYmFibHksCj4gYmVjYXVzZSB3ZSBuZXZlciBl
bmRlZCB1cCB1c2luZyBmZCB3aXRoIGFuIG9mZnNldCBhcyBndWVzdCBSQU0uCj4KPiBXZSBkb24n
dCBzZWVtIHRvIGJlIHJlbWVtYmVyaW5nIHRoYXQgb2Zmc2V0IGluIHRoZSBSQU1CbG9jay4gRmly
c3QsIEkKPiB0aG91Z2h0IGJsb2NrLT5vZmZzZXQgd291bGQgYmUgdXNlZCBmb3IgdGhhdCwgYnV0
IHRoYXQncyBqdXN0IHRoZSBvZmZzZXQKPiBpbiB0aGUgcmFtX2FkZHJfdCBzcGFjZS4gTWF5YmUg
d2UgbmVlZCBhIG5ldyAiYmxvY2stPmZkX29mZnNldCIgdG8KPiByZW1lbWJlciB0aGUgb2Zmc2V0
ICh1bmxlc3MgSSBhbSBtaXNzaW5nIHNvbWV0aGluZykuCj4KPiBUaGUgcmVhbCBvZmZzZXQgaW4g
dGhlIGZpbGUgd291bGQgYmUgcmVxdWlyZWQgYXQgbGVhc3QgaW4gdHdvIGNhc2VzIEkKPiBjYW4g
c2VlICh3aGVuZXZlciB3ZSBlc3NlbnRpYWxseSBlbmQgdXAgY2FsbGluZyBtbWFwKCkgb24gdGhl
IGZkIGFnYWluKToKPgo+IDEpIHFlbXVfcmFtX3JlbWFwKCk6IFdlJ2QgaGF2ZSB0byBhZGQgdGhl
IGZpbGUgb2Zmc2V0IG9uIHRvcCBvZiB0aGUKPiBjYWxjdWxhdGVkIG9mZnNldC4KCgpUaGlzIG9u
ZSBpcyBhIGJpdCB0cmlja3kgdG8gdGVzdCwgYXMgd2UncmUgb25seSBydW5uaW5nIGludG8gdGhh
dCBjb2RlIApwYXRoIHdpdGggS1ZNIHdoZW4gd2Ugc2VlIGFuICNNQ0UuIEJ1dCBpdCdzIHRyaXZp
YWwsIHNvIEknbSBjb25maWRlbnQgaXQgCndpbGwgd29yayBhcyBleHBlY3RlZC4KCgo+Cj4gMikg
dmhvc3QtdXNlcjogbW9zdCBwcm9iYWJseSB3aGVuZXZlciB3ZSBzZXQgdGhlIG1tYXBfb2Zmc2V0
LiBGb3IKPiBleGFtcGxlLCBpbiB2aG9zdF91c2VyX2ZpbGxfc2V0X21lbV90YWJsZV9tc2coKSB3
ZSdkIHNpbWlsYXJseSBoYXZlIHRvCj4gYWRkIHRoZSBmaWxlX29mZnNldCBvbiB0b3Agb2YgdGhl
IGNhbGN1bGF0ZWQgb2Zmc2V0Lgo+IHZob3N0X3VzZXJfZ2V0X21yX2RhdGEoKSBzaG91bGQgbW9z
dCBwcm9iYWJseSBkbyB0aGF0LgoKCkkgYWdyZWUgLSBhZGRpbmcgdGhlIG9mZnNldCBhcyBwYXJ0
IG9mIGdldF9tcl9kYXRhKCkgaXMgc3VmZmljaWVudC4gSSAKaGF2ZSB2YWxpZGF0ZWQgaXQgd29y
a3MgY29ycmVjdGx5IHdpdGggUUVNVSdzIHZob3N0LXVzZXItYmxrIHRhcmdldC4KCkkgdGhpbmsg
dGhlIGNoYW5nZXMgYXJlIHN0aWxsIG9idmlvdXMgZW5vdWdoIHRoYXQgSSdsbCBmb2xkIHRoZW0g
YWxsIAppbnRvIGEgc2luZ2xlIHBhdGNoLgoKCkFsZXgKCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQg
Q2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0
c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdl
biBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejog
QmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


