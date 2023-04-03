Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8AD6D519A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 21:52:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjQCY-0008PW-Pw; Mon, 03 Apr 2023 15:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450ae5ae2=graf@amazon.de>)
 id 1pjQCV-0008PG-Ni
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:50:47 -0400
Received: from smtp-fw-9103.amazon.com ([207.171.188.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450ae5ae2=graf@amazon.de>)
 id 1pjQCT-0001QY-Nz
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1680551445; x=1712087445;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nSZ7T3vtjme82+/Yd9MpJgA0NBpFJa0n5gzeQseUcE0=;
 b=jf14rkEZW0pJDPD1jKE7BDXET1Au5HLYTuOZiQKHC4Jlt/Lj93sbw9BR
 TrRVMbsSjPsXpBcQCPV+Wh1Re8iH++ltpPhzpFdrlv5jBLlQO00NJLhcc
 bHA5tKk7yxN7EDRtc0oFla1CDMXYImGol8nQ7Nyi1Q5cSjsf9/th5r9Zq 8=;
X-IronPort-AV: E=Sophos;i="5.98,315,1673913600"; d="scan'208";a="1119087801"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-f323d91c.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9103.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 19:50:33 +0000
Received: from EX19MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-m6i4x-f323d91c.us-west-2.amazon.com (Postfix)
 with ESMTPS id 4E35840E0F; Mon,  3 Apr 2023 19:50:32 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 3 Apr 2023 19:50:31 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 3 Apr
 2023 19:50:28 +0000
Message-ID: <28323b1b-1d54-f0ef-81e2-3f391ef815a7@amazon.com>
Date: Mon, 3 Apr 2023 21:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v2] hostmem-file: add offset option
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, David Hildenbrand <david@redhat.com>, "Eduardo
 Habkost" <eduardo@habkost.net>, "Daniel P . Berrange" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Philippe Mathieu-Daude <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Ashish Kalra" <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
References: <20230401121316.2025-1-graf@amazon.com>
 <87wn2tjx8a.fsf@pond.sub.org>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <87wn2tjx8a.fsf@pond.sub.org>
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D037UWC004.ant.amazon.com (10.13.139.254) To
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

Ck9uIDAzLjA0LjIzIDA4OjI4LCBNYXJrdXMgQXJtYnJ1c3RlciB3cm90ZToKCj4gQWxleGFuZGVy
IEdyYWYgPGdyYWZAYW1hem9uLmNvbT4gd3JpdGVzOgo+Cj4+IEFkZCBhbiBvcHRpb24gZm9yIGhv
c3RtZW0tZmlsZSB0byBzdGFydCB0aGUgbWVtb3J5IG9iamVjdCBhdCBhbiBvZmZzZXQKPj4gaW50
byB0aGUgdGFyZ2V0IGZpbGUuIFRoaXMgaXMgdXNlZnVsIGlmIG11bHRpcGxlIG1lbW9yeSBvYmpl
Y3RzIHJlc2lkZQo+PiBpbnNpZGUgdGhlIHNhbWUgdGFyZ2V0IGZpbGUsIHN1Y2ggYXMgYSBkZXZp
Y2Ugbm9kZS4KPj4KPj4gSW4gcGFydGljdWxhciwgaXQncyB1c2VmdWwgdG8gbWFwIGd1ZXN0IG1l
bW9yeSBkaXJlY3RseSBpbnRvIC9kZXYvbWVtCj4+IGZvciBleHBlcmltZW50YXRpb24uCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBHcmFmIDxncmFmQGFtYXpvbi5jb20+Cj4gWy4uLl0K
Pgo+PiBkaWZmIC0tZ2l0IGEvcWFwaS9xb20uanNvbiBiL3FhcGkvcW9tLmpzb24KPj4gaW5kZXgg
YTg3N2I4NzliOS4uOGY1ZWFhODQxNSAxMDA2NDQKPj4gLS0tIGEvcWFwaS9xb20uanNvbgo+PiAr
KysgYi9xYXBpL3FvbS5qc29uCj4+IEBAIC02MzUsNiArNjM1LDEwIEBACj4+ICAgIyAgICAgICAg
IHNwZWNpZnkgdGhlIHJlcXVpcmVkIGFsaWdubWVudCB2aWEgdGhpcyBvcHRpb24uCj4+ICAgIyAg
ICAgICAgIDAgc2VsZWN0cyBhIGRlZmF1bHQgYWxpZ25tZW50IChjdXJyZW50bHkgdGhlIHBhZ2Ug
c2l6ZSkuIChkZWZhdWx0OiAwKQo+PiAgICMKPj4gKyMgQG9mZnNldDogdGhlIG9mZnNldCBpbnRv
IHRoZSB0YXJnZXQgZmlsZSB0aGF0IHRoZSByZWdpb24gc3RhcnRzIGF0LiBZb3UgY2FuCj4+ICsj
ICAgICAgICAgIHVzZSB0aGlzIG9wdGlvbiB0byBvdmVybG9hZCBtdWx0aXBsZSByZWdpb25zIGlu
dG8gYSBzaW5nbGUgZmlscy4KPiBzaW5nbGUgZmlsZQo+Cj4gSSdtIG5vdCBzdXJlIGFib3V0ICJ0
byBvdmVybG9hZCBtdWx0aXBsZSByZWdpb25zIGludG8gYSBzaW5nbGUgZmlsZSIuCj4gTWF5YmUg
InRvIGJhY2sgbXVsdGlwbGUgcmVnaW9ucyB3aXRoIGEgc2luZ2xlIGZpbGUiLgoKCkkgbGlrZSBp
dCwgSSdsbCB1c2UgdGhhdCB2ZXJzaW9uIGhlcmUgYW5kIGluIHRoZSBxZW11LW9wdGlvbnMuaHgg
ZmlsZS4KCgo+IEFueSBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzPwoKClBhZ2Ugc2l6ZSwgSSdsbCBh
ZGQgaXQuCgoKPgo+IFdoYXQgaGFwcGVucyB3aGVuIHRoZSByZWdpb25zIG92ZXJsYXA/CgoKSXQg
Imp1c3Qgd29ya3MiIC0gc2FtZSBhcyBtYXBwaW5nIHRoZSBzYW1lIGZpbGUgdHdpY2UuIEl0J3Mg
dXAgdG8gdGhlIAp1c2VyIHRvIGVuc3VyZSB0aGF0IG5vdGhpbmcgYmFkIGhhcHBlbnMgYmVjYXVz
ZSBvZiB0aGF0LgoKCkFsZXgKCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkg
R21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJp
c3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNo
dCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDog
REUgMjg5IDIzNyA4NzkKCgo=


