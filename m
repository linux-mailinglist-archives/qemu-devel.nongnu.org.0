Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897A2589A33
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 11:57:57 +0200 (CEST)
Received: from localhost ([::1]:57424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJXc4-0006Di-71
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 05:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=2086fb099=bchalios@amazon.es>)
 id 1oJXYy-00040I-1c
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 05:54:44 -0400
Received: from smtp-fw-80006.amazon.com ([99.78.197.217]:47719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=2086fb099=bchalios@amazon.es>)
 id 1oJXYv-00011A-GK
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 05:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.es; i=@amazon.es; q=dns/txt; s=amazon201209;
 t=1659606881; x=1691142881;
 h=message-id:date:mime-version:to:cc:references:from:
 in-reply-to:content-transfer-encoding:subject;
 bh=k6FZ2eW9yYxxIafwFt8K9Su+3E3kwByLC5XeA93R00s=;
 b=Gt+FkldqdS31Leq7MMIJQqurTVy17NF2SQo31ZSHaBut39/lZhgr7JZS
 2MpuN4WM65KrEknVtidPigrdX3+pDB9/Ha7WNJlTHZdhCyignqrK7jMVQ
 kAyA5Or3oKvu8gN09a8kDEmwziM/GbKktZBcwByYiDnMMfhD9EDr9lxsr M=;
X-IronPort-AV: E=Sophos;i="5.93,215,1654560000"; d="scan'208";a="115613574"
Subject: Re: [PATCH 0/2] vmgenid: add generation counter
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-31df91b1.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 09:54:15 +0000
Received: from EX13D37EUA003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-31df91b1.us-west-2.amazon.com (Postfix) with
 ESMTPS id 529F944CC0; Thu,  4 Aug 2022 09:54:15 +0000 (UTC)
Received: from [10.85.101.228] (10.43.161.31) by EX13D37EUA003.ant.amazon.com
 (10.43.165.7) with Microsoft SMTP Server (TLS) id 15.0.1497.36;
 Thu, 4 Aug 2022 09:54:10 +0000
Message-ID: <babbf105-f7df-a759-c942-45483dfae02f@amazon.es>
Date: Thu, 4 Aug 2022 11:54:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
CC: <qemu-devel@nongnu.org>, <ani@anisinha.ca>, <mst@redhat.com>,
 <imammedo@redhat.com>, <dwmw@amazon.co.uk>, <graf@amazon.de>,
 <xmarcalx@amazon.co.uk>, <Jason@zx2c4.com>
References: <20220803134147.31073-1-bchalios@amazon.es>
 <Yuqhm5LCdg+zf/rH@redhat.com>
From: "Chalios, Babis" <bchalios@amazon.es>
In-Reply-To: <Yuqhm5LCdg+zf/rH@redhat.com>
X-Originating-IP: [10.43.161.31]
X-ClientProxiedBy: EX13D48UWA003.ant.amazon.com (10.43.163.4) To
 EX13D37EUA003.ant.amazon.com (10.43.165.7)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=99.78.197.217;
 envelope-from=prvs=2086fb099=bchalios@amazon.es; helo=smtp-fw-80006.amazon.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
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

SGkgRGFuaWVsLAoKT24gMy84LzIyIDE4OjI2LCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdyb3RlOgo+
IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2Fu
aXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCj4K
Pgo+Cj4gT24gV2VkLCBBdWcgMDMsIDIwMjIgYXQgMDM6NDE6NDVQTSArMDIwMCwgYmNoYWxpb3NA
YW1hem9uLmVzIHdyb3RlOgo+PiBGcm9tOiBCYWJpcyBDaGFsaW9zIDxiY2hhbGlvc0BhbWF6b24u
ZXM+Cj4+Cj4+IFZNIGdlbmVyYXRpb24gSUQgZXhwb3NlcyBhIEdVSUQgaW5zaWRlIHRoZSBWTSB3
aGljaCBjaGFuZ2VzIGV2ZXJ5IHRpbWUgYQo+PiBWTSByZXN0b3JlIGlzIGhhcHBlbmluZy4gVHlw
aWNhbGx5LCB0aGlzIEdVSUQgaXMgdXNlZCBieSB0aGUgZ3Vlc3QKPj4ga2VybmVsIHRvIHJlLXNl
ZWQgaXRzIGludGVybmFsIFBSTkcuIEFzIGEgcmVzdWx0LCB0aGlzIHZhbHVlIGNhbm5vdCBiZQo+
PiBleHBvc2VkIGluIGd1ZXN0IHVzZXItc3BhY2UgYXMgYSBub3RpZmljYXRpb24gbWVjaGFuaXNt
IGZvciBWTSByZXN0b3JlCj4+IGV2ZW50cy4KPj4KPj4gVGhpcyBwYXRjaCBzZXQgZXh0ZW5kcyB2
bWdlbmlkIHRvIGludHJvZHVjZSBhIDMyIGJpdHMgZ2VuZXJhdGlvbiBjb3VudGVyCj4+IHdob3Nl
IHB1cnBvc2UgaXMgdG8gYmUgdXNlZCBhcyBhIFZNIHJlc3RvcmUgbm90aWZpY2F0aW9uIG1lY2hh
bmlzbSBmb3IKPj4gdGhlIGd1ZXN0IHVzZXItc3BhY2UuCj4+Cj4+IEl0IGlzIHRydWUgdGhhdCBz
dWNoIGEgY291bnRlciBjb3VsZCBiZSBpbXBsZW1lbnRlZCBlbnRpcmVseSBieSB0aGUKPj4gZ3Vl
c3Qga2VybmVsLCBidXQgdGhpcyB3b3VsZCByZWx5IG9uIHRoZSB2bWdlbmlkIEFDUEkgbm90aWZp
Y2F0aW9uIHRvCj4+IHRyaWdnZXIgdGhlIGNvdW50ZXIgdXBkYXRlLCB3aGljaCBpcyBpbmhlcmVu
dGx5IHJhY3kuIEV4cG9zaW5nIHRoaXMKPj4gdGhyb3VnaCB0aGUgbW9uaXRvciBhbGxvd3MgdGhl
IHVwZGF0ZWQgdmFsdWUgdG8gYmUgaW4tcGxhY2UgYmVmb3JlCj4+IHJlc3VtaW5nIHRoZSB2Y3B1
cywgc28gaW50ZXJlc3RlZCB1c2VyLXNwYWNlIGNvZGUgY2FuIChhdG9taWNhbGx5KQo+PiBvYnNl
cnZlIHRoZSB1cGRhdGUgd2l0aG91dCByZWx5aW5nIG9uIHRoZSBBQ1BJIG5vdGlmaWNhdGlvbi4K
PiBUaGUgVk0gZ2VuZXJhdGlvbiBJRCBmZWF0dXJlIGluIFFFTVUgaXMgaW1wbGVtZW50aW5nIGEg
c3BlYyBkZWZpbmVkCj4gYnkgTWljcm9zb2Z0LiBJdCBpcyBpbXBsZW1lbnRlZCBpbiBIeXBlclYs
IFZNV2FyZSwgUUVNVSBhbmQgcG9zc2libHkKPiBtb3JlLiBUaGlzIHNlcmllcyBpcyBwcm9wb3Np
bmcgYSBRRU1VIHNwZWNpZmljIHZhcmlhbnQsIHdoaWNoIG1lYW5zCj4gTGludXggcnVubmluZyBv
biBhbGwgdGhlc2Ugb3RoZXIgaHlwZXJ2aXNvciBwbGF0Zm9ybXMgd29uJ3QgYmVuZWZpdAo+IGZy
b20gdGhlIGNoYW5nZS4gSWYgdGhlIGNvdW50ZXIgd2VyZSBwcm92aWRlZCBlbnRpcmVseSBpbiB0
aGUgZ3Vlc3QKPiBrZXJuZWwsIHRoZW4gaXQgd29ya3MgYWNyb3NzIGFsbCBoeXBlcnZpc29ycy4K
Pgo+IEl0IGZlZWxzIGxpa2UgdGhlIGtlcm5lbCBvdWdodCB0byBwcm92aWRlIGFuIGltcGxlbWVu
dGF0aW9uIGl0c2VsZgo+IGFzIGEgc3RhcnRpbmcgcG9pbnQsIHdpdGggdGhpcyBRRU1VIGNoYW5n
ZSBtZXJlbHkgYmVpbmcgYW4gb3B0aW9uYWwKPiBlbmhhbmNlbWVudCB0byBjbG9zZSB0aGUgcmFj
ZSB3aW5kb3cuCj4KPiBJZGVhbGx5IHRoZXJlIHdvdWxkIGJlIHNvbWVvbmUgYXQgTWljcm9zb2Z0
IHdlIGNvdWxkIGNvbm5lY3Qgd2l0aCB0bwo+IHByb3Bvc2UgdGhleSBpbmNsdWRlIHRoaXMgZmVh
dHVyZSBpbiBhIFZNIEdlbiBJRCBzcGVjIHVwZGF0ZSwgYnV0IEkKPiBkb24ndCBwZXJzb25hbGx5
IGtub3cgd2hvIHRvIGNvbnRhY3QgYWJvdXQgdGhhdCBraW5kIG9mIHRoaW5nLiBBCj4gc3BlYyB1
cGRhdGUgd291bGQgaW5jcmVhc2UgY2hhbmNlcyB0aGF0IHRoaXMgY2hhbmdlIGdldHMgcHJvdmll
ZGVkCj4gYWNyb3NzIGFsbCBoeXBlcnZpc29ycy4KCllvdSBhcmUgcmlnaHQsIHRoaXMgKmlzKiBv
dXQtb2Ytc3BlYy4gVGhlIGFwcHJvYWNoIGhlcmUgaXMgYmFzZWQgb24gdmFyaW91cwpkaXNjdXNz
aW9ucyBoYXBwZW5lZCBsYXN0IHllYXIgd2hlbiB3ZSBmaXJzdCB0cmllZCB0byB1cHN0cmVhbSBh
bmQgbW9yZQpyZWNlbnRseSB3aGVuIHZtZ2VuaWQgbGFuZGVkIGluIExpbnV4LiBJIGZpbmQgdGhh
dCB0aGlzIHN1bW1hcnk6Cmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIyLzMvMS82OTMgcXVpdGUg
dG8gdGhlIHBvaW50LiAoQ0NpbmcgSmFzb24gdG8KaGF2ZSBoaXMgdGFrZSBvbiB0aGUgbWF0dGVy
KS4KClRoaXMgc2VyaWVzIGNvbWVzIHRvZ2V0aGVyIHdpdGggYSBMaW51eCBjb3VudGVycGFydDoK
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjIvOC8zLzU2Mywgd2hlcmUgdGhlIGdlbmVyYXRpb24g
Y291bnRlciBpcwpleHBvc2VkIHRvIHVzZXItc3BhY2UgYXMgYSBtaXNjIGRldmljZS4gVGhlcmUs
IEkgdHJpZWQgdG8gbWFrZSB0aGUKZ2VuZXJhdGlvbiBjb3VudGVyICJvcHRpb25hbCIsIGluIHRo
ZSBzZW5zZSB0aGF0IGlmIGl0IGlzIG5vdCB0aGVyZSwgdGhlCkFDUEkgZGV2aWNlIHNob3VsZCBu
b3QgZmFpbCwgZXhhY3RseSBiZWNhdXNlLCBmb3IgdGhlIG1vbWVudCwgdGhpcyBpcwpub3QgaW4g
dGhlIHNwZWMgYW5kIGh5cGVydmlzb3JzIG1pZ2h0IG5vdCB3YW50IHRvIGltcGxlbWVudCBpdC4K
Ckhvd2V2ZXIsIEkgdGhpbmsgdGhhdCBjaGFuZ2luZyB0aGUgc3BlYyB3aWxsIHRha2UgdGltZSBh
bmQgdGhpcyBpcyBhCnJlYWwgaXNzdWUgYWZmZWN0aW5nIHJlYWwgdXNlLWNhc2VzLCBzbyB3ZSBz
aG91bGQgc3RhcnQgZnJvbSBzb21ld2hlcmUuCgpDaGVlcnMsCkJhYmlzCgoKPgo+IFdpdGggcmVn
YXJkcywKPiBEYW5pZWwKPiAtLQo+IHw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAg
IGh0dHBzOi8vd3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fAo+IHw6IGh0dHBzOi8v
bGlidmlydC5vcmcgICAgICAgICAtby0gICAgICAgICAgICBodHRwczovL2ZzdG9wMTM4LmJlcnJh
bmdlLmNvbSA6fAo+IHw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3JnICAgIC1vLSAgICBodHRw
czovL3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fAo+CgpBbWF6b24gU3BhaW4gU2Vydmlj
ZXMgc29jaWVkYWQgbGltaXRhZGEgdW5pcGVyc29uYWwsIENhbGxlIFJhbWlyZXogZGUgUHJhZG8g
NSwgMjgwNDUgTWFkcmlkLiBSZWdpc3RybyBNZXJjYW50aWwgZGUgTWFkcmlkIC4gVG9tbyAyMjQ1
OCAuIEZvbGlvIDEwMiAuIEhvamEgTS00MDEyMzQgLiBDSUYgQjg0NTcwOTM2Cg==


