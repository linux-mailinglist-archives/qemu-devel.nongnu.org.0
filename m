Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC3E589A5C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 12:22:37 +0200 (CEST)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJXzw-0008VU-7W
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 06:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=2086fb099=bchalios@amazon.es>)
 id 1oJXv9-0003UV-LN
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:17:39 -0400
Received: from smtp-fw-80006.amazon.com ([99.78.197.217]:17396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=2086fb099=bchalios@amazon.es>)
 id 1oJXv6-0004lh-6U
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.es; i=@amazon.es; q=dns/txt; s=amazon201209;
 t=1659608256; x=1691144256;
 h=message-id:date:mime-version:to:cc:references:from:
 in-reply-to:content-transfer-encoding:subject;
 bh=a6hFR+abeRFIht+7F8Jvbdkg3Eqsgog0X5b5cx+AciY=;
 b=KpzOhYnj2mpCRardvv/SfLCYCnIHwxykKTGj9YHxETcJFscUEsjEILhM
 E9VmXFqPiXdAxknTJAroQDs5lx/rfstZDD+mE5uMne8b1kZz/pi82OtOt
 UdYJqfxyWj+xOwn94SjSkpQUb3G9ww8qebYxKo9Ln72Q4HDShZ6y95gtI 4=;
X-IronPort-AV: E=Sophos;i="5.93,215,1654560000"; d="scan'208";a="115621557"
Subject: Re: [PATCH 0/2] vmgenid: add generation counter
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-90419278.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 10:17:18 +0000
Received: from EX13D37EUA003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-90419278.us-west-2.amazon.com (Postfix) with
 ESMTPS id CCE2F44BDC; Thu,  4 Aug 2022 10:17:16 +0000 (UTC)
Received: from [10.85.101.228] (10.43.161.31) by EX13D37EUA003.ant.amazon.com
 (10.43.165.7) with Microsoft SMTP Server (TLS) id 15.0.1497.36;
 Thu, 4 Aug 2022 10:17:11 +0000
Message-ID: <68bc7d84-9ece-f115-68c9-76fc461c71d1@amazon.es>
Date: Thu, 4 Aug 2022 12:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
CC: <qemu-devel@nongnu.org>, <ani@anisinha.ca>, <mst@redhat.com>,
 <imammedo@redhat.com>, <dwmw@amazon.co.uk>, <graf@amazon.de>,
 <xmarcalx@amazon.co.uk>, <Jason@zx2c4.com>, <bchalios@amazon.es>
References: <20220803134147.31073-1-bchalios@amazon.es>
 <Yuqhm5LCdg+zf/rH@redhat.com>
 <babbf105-f7df-a759-c942-45483dfae02f@amazon.es>
 <YuuZLeYmOfzBlcNl@redhat.com>
From: "Chalios, Babis" <bchalios@amazon.es>
In-Reply-To: <YuuZLeYmOfzBlcNl@redhat.com>
X-Originating-IP: [10.43.161.31]
X-ClientProxiedBy: EX13D16UWC004.ant.amazon.com (10.43.162.72) To
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

CgpPbiA0LzgvMjIgMTI6MDIsIERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6Cj4gQ0FVVElPTjog
VGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25m
aXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4KPgo+Cj4KPiBPbiBU
aHUsIEF1ZyAwNCwgMjAyMiBhdCAxMTo1NDowNUFNICswMjAwLCBDaGFsaW9zLCBCYWJpcyB3cm90
ZToKPj4gSGkgRGFuaWVsLAo+Pgo+PiBPbiAzLzgvMjIgMTg6MjYsIERhbmllbCBQLiBCZXJyYW5n
w6kgd3JvdGU6Cj4+PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRl
IG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlLgo+Pj4KPj4+Cj4+Pgo+Pj4gT24gV2VkLCBBdWcgMDMsIDIwMjIgYXQgMDM6NDE6
NDVQTSArMDIwMCwgYmNoYWxpb3NAYW1hem9uLmVzIHdyb3RlOgo+Pj4+IEZyb206IEJhYmlzIENo
YWxpb3MgPGJjaGFsaW9zQGFtYXpvbi5lcz4KPj4+Pgo+Pj4+IFZNIGdlbmVyYXRpb24gSUQgZXhw
b3NlcyBhIEdVSUQgaW5zaWRlIHRoZSBWTSB3aGljaCBjaGFuZ2VzIGV2ZXJ5IHRpbWUgYQo+Pj4+
IFZNIHJlc3RvcmUgaXMgaGFwcGVuaW5nLiBUeXBpY2FsbHksIHRoaXMgR1VJRCBpcyB1c2VkIGJ5
IHRoZSBndWVzdAo+Pj4+IGtlcm5lbCB0byByZS1zZWVkIGl0cyBpbnRlcm5hbCBQUk5HLiBBcyBh
IHJlc3VsdCwgdGhpcyB2YWx1ZSBjYW5ub3QgYmUKPj4+PiBleHBvc2VkIGluIGd1ZXN0IHVzZXIt
c3BhY2UgYXMgYSBub3RpZmljYXRpb24gbWVjaGFuaXNtIGZvciBWTSByZXN0b3JlCj4+Pj4gZXZl
bnRzLgo+Pj4+Cj4+Pj4gVGhpcyBwYXRjaCBzZXQgZXh0ZW5kcyB2bWdlbmlkIHRvIGludHJvZHVj
ZSBhIDMyIGJpdHMgZ2VuZXJhdGlvbiBjb3VudGVyCj4+Pj4gd2hvc2UgcHVycG9zZSBpcyB0byBi
ZSB1c2VkIGFzIGEgVk0gcmVzdG9yZSBub3RpZmljYXRpb24gbWVjaGFuaXNtIGZvcgo+Pj4+IHRo
ZSBndWVzdCB1c2VyLXNwYWNlLgo+Pj4+Cj4+Pj4gSXQgaXMgdHJ1ZSB0aGF0IHN1Y2ggYSBjb3Vu
dGVyIGNvdWxkIGJlIGltcGxlbWVudGVkIGVudGlyZWx5IGJ5IHRoZQo+Pj4+IGd1ZXN0IGtlcm5l
bCwgYnV0IHRoaXMgd291bGQgcmVseSBvbiB0aGUgdm1nZW5pZCBBQ1BJIG5vdGlmaWNhdGlvbiB0
bwo+Pj4+IHRyaWdnZXIgdGhlIGNvdW50ZXIgdXBkYXRlLCB3aGljaCBpcyBpbmhlcmVudGx5IHJh
Y3kuIEV4cG9zaW5nIHRoaXMKPj4+PiB0aHJvdWdoIHRoZSBtb25pdG9yIGFsbG93cyB0aGUgdXBk
YXRlZCB2YWx1ZSB0byBiZSBpbi1wbGFjZSBiZWZvcmUKPj4+PiByZXN1bWluZyB0aGUgdmNwdXMs
IHNvIGludGVyZXN0ZWQgdXNlci1zcGFjZSBjb2RlIGNhbiAoYXRvbWljYWxseSkKPj4+PiBvYnNl
cnZlIHRoZSB1cGRhdGUgd2l0aG91dCByZWx5aW5nIG9uIHRoZSBBQ1BJIG5vdGlmaWNhdGlvbi4K
Pj4+IFRoZSBWTSBnZW5lcmF0aW9uIElEIGZlYXR1cmUgaW4gUUVNVSBpcyBpbXBsZW1lbnRpbmcg
YSBzcGVjIGRlZmluZWQKPj4+IGJ5IE1pY3Jvc29mdC4gSXQgaXMgaW1wbGVtZW50ZWQgaW4gSHlw
ZXJWLCBWTVdhcmUsIFFFTVUgYW5kIHBvc3NpYmx5Cj4+PiBtb3JlLiBUaGlzIHNlcmllcyBpcyBw
cm9wb3NpbmcgYSBRRU1VIHNwZWNpZmljIHZhcmlhbnQsIHdoaWNoIG1lYW5zCj4+PiBMaW51eCBy
dW5uaW5nIG9uIGFsbCB0aGVzZSBvdGhlciBoeXBlcnZpc29yIHBsYXRmb3JtcyB3b24ndCBiZW5l
Zml0Cj4+PiBmcm9tIHRoZSBjaGFuZ2UuIElmIHRoZSBjb3VudGVyIHdlcmUgcHJvdmlkZWQgZW50
aXJlbHkgaW4gdGhlIGd1ZXN0Cj4+PiBrZXJuZWwsIHRoZW4gaXQgd29ya3MgYWNyb3NzIGFsbCBo
eXBlcnZpc29ycy4KPj4+Cj4+PiBJdCBmZWVscyBsaWtlIHRoZSBrZXJuZWwgb3VnaHQgdG8gcHJv
dmlkZSBhbiBpbXBsZW1lbnRhdGlvbiBpdHNlbGYKPj4+IGFzIGEgc3RhcnRpbmcgcG9pbnQsIHdp
dGggdGhpcyBRRU1VIGNoYW5nZSBtZXJlbHkgYmVpbmcgYW4gb3B0aW9uYWwKPj4+IGVuaGFuY2Vt
ZW50IHRvIGNsb3NlIHRoZSByYWNlIHdpbmRvdy4KPj4+Cj4+PiBJZGVhbGx5IHRoZXJlIHdvdWxk
IGJlIHNvbWVvbmUgYXQgTWljcm9zb2Z0IHdlIGNvdWxkIGNvbm5lY3Qgd2l0aCB0bwo+Pj4gcHJv
cG9zZSB0aGV5IGluY2x1ZGUgdGhpcyBmZWF0dXJlIGluIGEgVk0gR2VuIElEIHNwZWMgdXBkYXRl
LCBidXQgSQo+Pj4gZG9uJ3QgcGVyc29uYWxseSBrbm93IHdobyB0byBjb250YWN0IGFib3V0IHRo
YXQga2luZCBvZiB0aGluZy4gQQo+Pj4gc3BlYyB1cGRhdGUgd291bGQgaW5jcmVhc2UgY2hhbmNl
cyB0aGF0IHRoaXMgY2hhbmdlIGdldHMgcHJvdmllZGVkCj4+PiBhY3Jvc3MgYWxsIGh5cGVydmlz
b3JzLgo+PiBZb3UgYXJlIHJpZ2h0LCB0aGlzICppcyogb3V0LW9mLXNwZWMuIFRoZSBhcHByb2Fj
aCBoZXJlIGlzIGJhc2VkIG9uIHZhcmlvdXMKPj4gZGlzY3Vzc2lvbnMgaGFwcGVuZWQgbGFzdCB5
ZWFyIHdoZW4gd2UgZmlyc3QgdHJpZWQgdG8gdXBzdHJlYW0gYW5kIG1vcmUKPj4gcmVjZW50bHkg
d2hlbiB2bWdlbmlkIGxhbmRlZCBpbiBMaW51eC4gSSBmaW5kIHRoYXQgdGhpcyBzdW1tYXJ5Ogo+
PiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMi8zLzEvNjkzIHF1aXRlIHRvIHRoZSBwb2ludC4g
KENDaW5nIEphc29uIHRvCj4+IGhhdmUgaGlzIHRha2Ugb24gdGhlIG1hdHRlcikuCj4+Cj4+IFRo
aXMgc2VyaWVzIGNvbWVzIHRvZ2V0aGVyIHdpdGggYSBMaW51eCBjb3VudGVycGFydDoKPj4gaHR0
cHM6Ly9sa21sLm9yZy9sa21sLzIwMjIvOC8zLzU2Mywgd2hlcmUgdGhlIGdlbmVyYXRpb24gY291
bnRlciBpcwo+PiBleHBvc2VkIHRvIHVzZXItc3BhY2UgYXMgYSBtaXNjIGRldmljZS4gVGhlcmUs
IEkgdHJpZWQgdG8gbWFrZSB0aGUKPj4gZ2VuZXJhdGlvbiBjb3VudGVyICJvcHRpb25hbCIsIGlu
IHRoZSBzZW5zZSB0aGF0IGlmIGl0IGlzIG5vdCB0aGVyZSwgdGhlCj4+IEFDUEkgZGV2aWNlIHNo
b3VsZCBub3QgZmFpbCwgZXhhY3RseSBiZWNhdXNlLCBmb3IgdGhlIG1vbWVudCwgdGhpcyBpcwo+
PiBub3QgaW4gdGhlIHNwZWMgYW5kIGh5cGVydmlzb3JzIG1pZ2h0IG5vdCB3YW50IHRvIGltcGxl
bWVudCBpdC4KPj4KPj4gSG93ZXZlciwgSSB0aGluayB0aGF0IGNoYW5naW5nIHRoZSBzcGVjIHdp
bGwgdGFrZSB0aW1lIGFuZCB0aGlzIGlzIGEKPj4gcmVhbCBpc3N1ZSBhZmZlY3RpbmcgcmVhbCB1
c2UtY2FzZXMsIHNvIHdlIHNob3VsZCBzdGFydCBmcm9tIHNvbWV3aGVyZS4KPiBJIGtub3cgYSBz
cGVjIGNoYW5nZSBjYW4gdGFrZSB0aW1lLCBidXQgaGFzIHRoZXJlIGV2ZW4gYmVlbiBhbnkgZWZm
b3J0Cj4gYXQgYWxsIHRvIHRyeSB0byBzdGFydCB0aGF0IGFjdGlvbiBzaW5jZSBmaXJzdCBkaXNj
dXNzZWQgYSB5ZWFyIGFnbyA/CgpUaGVzZSBwYXRjaC1zZXRzIGFyZSBvdXQgZXhhY3RseSBmb3Ig
c3RhcnRpbmcgdGhlIGNvbnZlcnNhdGlvbiBvbiBhZGRpbmcKdGhpcyB0byB0aGUgc3BlYy4gQXMg
eW91IG1lbnRpb25lZCwgaXQgd291bGQgYmUgZ3JlYXQgaWYgd2UgY291bGQgZ2V0IHRoZQpvcGlu
aW9uIG9mIHNvbWVvbmUgYXQgTWljcm9zb2Z0IG9uIHRoaXMuCgo+Cj4gSWYgdGhlc2UgcmFjZSBj
b25kaXRpb24gaXNzdWVzIGFyZSBzdXBwb3NlZGx5IHNvIHNlcmlvdXMgdGhhdCB3ZSBuZWVkCj4g
dG8gZG8gdGhpcyB3aXRob3V0IHdhaXRpbmcgZm9yIGEgc3BlYywgdGhlbiB3aGF0IGlzIHRoZSBh
bnN3ZXIgZm9yIHRoZQo+IG1hc3NlcyBvZiB1c2VycyBydW5uaW5nIExpbnV4IG9uIFZNd2FyZSBv
ciBIeXBlclYvQXp1cmUgPwoKVGhlIHByb2JsZW0gYXJpc2VzIHdoZW4geW91IHN0YXJ0IHNuYXBz
aG90dGluZyBhbmQgcmVzdG9yaW5nIG9uIFZNcywKc28gbm90IGV2ZXJ5b25lIGlzIGFmZmVjdGVk
IGZyb20gdGhlIGlzc3VlLiBVc2UtY2FzZXMgaW50ZXJlc3RlZCBpbiB0aGlzCmFyZSBvbmVzIHRo
YXQgbWFuYWdlIGZsZWV0cyBvZiBWTXMgdGhhdCBydW4gY29kZSB0aGF0IHJlbGllcyBvbgp1c2Vy
L2tlcm5lbC1zcGFjZSBQUk5HcyBvciBuZXR3b3JrLWZhY2luZyBzZXJ2aWNlcyB1c2luZyBVVUlE
cywgZm9yCmV4YW1wbGUuCgo+Cj4gV2l0aCByZWdhcmRzLAo+IERhbmllbAo+IC0tCj4gfDogaHR0
cHM6Ly9iZXJyYW5nZS5jb20gICAgICAtby0gICAgaHR0cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90
b3MvZGJlcnJhbmdlIDp8Cj4gfDogaHR0cHM6Ly9saWJ2aXJ0Lm9yZyAgICAgICAgIC1vLSAgICAg
ICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8Cj4gfDogaHR0cHM6Ly9lbnRh
bmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3Lmluc3RhZ3JhbS5jb20vZGJlcnJh
bmdlIDp8Cj4KCkNoZWVycywKQmFiaXMKQW1hem9uIFNwYWluIFNlcnZpY2VzIHNvY2llZGFkIGxp
bWl0YWRhIHVuaXBlcnNvbmFsLCBDYWxsZSBSYW1pcmV6IGRlIFByYWRvIDUsIDI4MDQ1IE1hZHJp
ZC4gUmVnaXN0cm8gTWVyY2FudGlsIGRlIE1hZHJpZCAuIFRvbW8gMjI0NTggLiBGb2xpbyAxMDIg
LiBIb2phIE0tNDAxMjM0IC4gQ0lGIEI4NDU3MDkzNgo=


