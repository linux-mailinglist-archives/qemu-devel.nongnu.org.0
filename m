Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7586A589D07
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:49:04 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJbDj-0000cR-CT
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=2086fb099=bchalios@amazon.es>)
 id 1oJax4-0008Le-Hv
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:31:52 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:9362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=2086fb099=bchalios@amazon.es>)
 id 1oJawz-0005hm-1z
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.es; i=@amazon.es; q=dns/txt; s=amazon201209;
 t=1659619905; x=1691155905;
 h=message-id:date:mime-version:to:cc:references:from:
 in-reply-to:content-transfer-encoding:subject;
 bh=hg/5ve129D2cfzHpMCC+znM787v+1xDe9ByTy2AF410=;
 b=k0H2lHSihdC0kFrUUecwV9L5aQTbfdVcSQWnxHODbilUNIlDbCHOz1SA
 V+aqpNm7R+lghE9oseWPsBCILF4jYQz/5EBh2lrG8/goBWeYjw7Aa8hww
 YBGdR4WrGPCfOpw1sJGjiLX6o7H1/RwWVtAK/ZjTxruuodUazNTuSx42P k=;
Subject: Re: [PATCH 0/2] vmgenid: add generation counter
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-d9fba5dd.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 13:31:30 +0000
Received: from EX13D37EUA003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-d9fba5dd.us-west-2.amazon.com (Postfix) with
 ESMTPS id 2BC9344876; Thu,  4 Aug 2022 13:31:28 +0000 (UTC)
Received: from [10.85.101.228] (10.43.160.75) by EX13D37EUA003.ant.amazon.com
 (10.43.165.7) with Microsoft SMTP Server (TLS) id 15.0.1497.36;
 Thu, 4 Aug 2022 13:31:23 +0000
Message-ID: <31d08784-cdd5-c5fe-8f09-e7d27e0e3277@amazon.es>
Date: Thu, 4 Aug 2022 15:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
CC: <qemu-devel@nongnu.org>, <ani@anisinha.ca>, <mst@redhat.com>,
 <imammedo@redhat.com>, <dwmw@amazon.co.uk>, <graf@amazon.de>,
 <xmarcalx@amazon.co.uk>, <Jason@zx2c4.com>, <bchalios@amazon.es>,
 <mikelley@microsoft.com>
References: <20220803134147.31073-1-bchalios@amazon.es>
 <Yuqhm5LCdg+zf/rH@redhat.com>
 <babbf105-f7df-a759-c942-45483dfae02f@amazon.es>
 <YuuZLeYmOfzBlcNl@redhat.com>
 <68bc7d84-9ece-f115-68c9-76fc461c71d1@amazon.es>
From: "Chalios, Babis" <bchalios@amazon.es>
In-Reply-To: <68bc7d84-9ece-f115-68c9-76fc461c71d1@amazon.es>
X-Originating-IP: [10.43.160.75]
X-ClientProxiedBy: EX13D15UWB001.ant.amazon.com (10.43.161.254) To
 EX13D37EUA003.ant.amazon.com (10.43.165.7)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=52.95.48.154;
 envelope-from=prvs=2086fb099=bchalios@amazon.es; helo=smtp-fw-6001.amazon.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

T24gNC84LzIyIDEyOjE3LCBDaGFsaW9zLCBCYWJpcyB3cm90ZToKPgo+Cj4gT24gNC84LzIyIDEy
OjAyLCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdyb3RlOgo+PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9y
aWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIAo+PiBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBz
ZW5kZXIgCj4+IGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCj4+Cj4+Cj4+Cj4+IE9uIFRo
dSwgQXVnIDA0LCAyMDIyIGF0IDExOjU0OjA1QU0gKzAyMDAsIENoYWxpb3MsIEJhYmlzIHdyb3Rl
Ogo+Pj4gSGkgRGFuaWVsLAo+Pj4KPj4+IE9uIDMvOC8yMiAxODoyNiwgRGFuaWVsIFAuIEJlcnJh
bmfDqSB3cm90ZToKPj4+PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRz
aWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIAo+Pj4+IG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIAo+Pj4+IHNlbmRlciBhbmQg
a25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IE9uIFdlZCwgQXVn
IDAzLCAyMDIyIGF0IDAzOjQxOjQ1UE0gKzAyMDAsIGJjaGFsaW9zQGFtYXpvbi5lcyB3cm90ZToK
Pj4+Pj4gRnJvbTogQmFiaXMgQ2hhbGlvcyA8YmNoYWxpb3NAYW1hem9uLmVzPgo+Pj4+Pgo+Pj4+
PiBWTSBnZW5lcmF0aW9uIElEIGV4cG9zZXMgYSBHVUlEIGluc2lkZSB0aGUgVk0gd2hpY2ggY2hh
bmdlcyBldmVyeSAKPj4+Pj4gdGltZSBhCj4+Pj4+IFZNIHJlc3RvcmUgaXMgaGFwcGVuaW5nLiBU
eXBpY2FsbHksIHRoaXMgR1VJRCBpcyB1c2VkIGJ5IHRoZSBndWVzdAo+Pj4+PiBrZXJuZWwgdG8g
cmUtc2VlZCBpdHMgaW50ZXJuYWwgUFJORy4gQXMgYSByZXN1bHQsIHRoaXMgdmFsdWUgCj4+Pj4+
IGNhbm5vdCBiZQo+Pj4+PiBleHBvc2VkIGluIGd1ZXN0IHVzZXItc3BhY2UgYXMgYSBub3RpZmlj
YXRpb24gbWVjaGFuaXNtIGZvciBWTSAKPj4+Pj4gcmVzdG9yZQo+Pj4+PiBldmVudHMuCj4+Pj4+
Cj4+Pj4+IFRoaXMgcGF0Y2ggc2V0IGV4dGVuZHMgdm1nZW5pZCB0byBpbnRyb2R1Y2UgYSAzMiBi
aXRzIGdlbmVyYXRpb24gCj4+Pj4+IGNvdW50ZXIKPj4+Pj4gd2hvc2UgcHVycG9zZSBpcyB0byBi
ZSB1c2VkIGFzIGEgVk0gcmVzdG9yZSBub3RpZmljYXRpb24gbWVjaGFuaXNtIAo+Pj4+PiBmb3IK
Pj4+Pj4gdGhlIGd1ZXN0IHVzZXItc3BhY2UuCj4+Pj4+Cj4+Pj4+IEl0IGlzIHRydWUgdGhhdCBz
dWNoIGEgY291bnRlciBjb3VsZCBiZSBpbXBsZW1lbnRlZCBlbnRpcmVseSBieSB0aGUKPj4+Pj4g
Z3Vlc3Qga2VybmVsLCBidXQgdGhpcyB3b3VsZCByZWx5IG9uIHRoZSB2bWdlbmlkIEFDUEkgbm90
aWZpY2F0aW9uIHRvCj4+Pj4+IHRyaWdnZXIgdGhlIGNvdW50ZXIgdXBkYXRlLCB3aGljaCBpcyBp
bmhlcmVudGx5IHJhY3kuIEV4cG9zaW5nIHRoaXMKPj4+Pj4gdGhyb3VnaCB0aGUgbW9uaXRvciBh
bGxvd3MgdGhlIHVwZGF0ZWQgdmFsdWUgdG8gYmUgaW4tcGxhY2UgYmVmb3JlCj4+Pj4+IHJlc3Vt
aW5nIHRoZSB2Y3B1cywgc28gaW50ZXJlc3RlZCB1c2VyLXNwYWNlIGNvZGUgY2FuIChhdG9taWNh
bGx5KQo+Pj4+PiBvYnNlcnZlIHRoZSB1cGRhdGUgd2l0aG91dCByZWx5aW5nIG9uIHRoZSBBQ1BJ
IG5vdGlmaWNhdGlvbi4KPj4+PiBUaGUgVk0gZ2VuZXJhdGlvbiBJRCBmZWF0dXJlIGluIFFFTVUg
aXMgaW1wbGVtZW50aW5nIGEgc3BlYyBkZWZpbmVkCj4+Pj4gYnkgTWljcm9zb2Z0LiBJdCBpcyBp
bXBsZW1lbnRlZCBpbiBIeXBlclYsIFZNV2FyZSwgUUVNVSBhbmQgcG9zc2libHkKPj4+PiBtb3Jl
LiBUaGlzIHNlcmllcyBpcyBwcm9wb3NpbmcgYSBRRU1VIHNwZWNpZmljIHZhcmlhbnQsIHdoaWNo
IG1lYW5zCj4+Pj4gTGludXggcnVubmluZyBvbiBhbGwgdGhlc2Ugb3RoZXIgaHlwZXJ2aXNvciBw
bGF0Zm9ybXMgd29uJ3QgYmVuZWZpdAo+Pj4+IGZyb20gdGhlIGNoYW5nZS4gSWYgdGhlIGNvdW50
ZXIgd2VyZSBwcm92aWRlZCBlbnRpcmVseSBpbiB0aGUgZ3Vlc3QKPj4+PiBrZXJuZWwsIHRoZW4g
aXQgd29ya3MgYWNyb3NzIGFsbCBoeXBlcnZpc29ycy4KPj4+Pgo+Pj4+IEl0IGZlZWxzIGxpa2Ug
dGhlIGtlcm5lbCBvdWdodCB0byBwcm92aWRlIGFuIGltcGxlbWVudGF0aW9uIGl0c2VsZgo+Pj4+
IGFzIGEgc3RhcnRpbmcgcG9pbnQsIHdpdGggdGhpcyBRRU1VIGNoYW5nZSBtZXJlbHkgYmVpbmcg
YW4gb3B0aW9uYWwKPj4+PiBlbmhhbmNlbWVudCB0byBjbG9zZSB0aGUgcmFjZSB3aW5kb3cuCj4+
Pj4KPj4+PiBJZGVhbGx5IHRoZXJlIHdvdWxkIGJlIHNvbWVvbmUgYXQgTWljcm9zb2Z0IHdlIGNv
dWxkIGNvbm5lY3Qgd2l0aCB0bwo+Pj4+IHByb3Bvc2UgdGhleSBpbmNsdWRlIHRoaXMgZmVhdHVy
ZSBpbiBhIFZNIEdlbiBJRCBzcGVjIHVwZGF0ZSwgYnV0IEkKPj4+PiBkb24ndCBwZXJzb25hbGx5
IGtub3cgd2hvIHRvIGNvbnRhY3QgYWJvdXQgdGhhdCBraW5kIG9mIHRoaW5nLiBBCj4+Pj4gc3Bl
YyB1cGRhdGUgd291bGQgaW5jcmVhc2UgY2hhbmNlcyB0aGF0IHRoaXMgY2hhbmdlIGdldHMgcHJv
dmllZGVkCj4+Pj4gYWNyb3NzIGFsbCBoeXBlcnZpc29ycy4KPj4+IFlvdSBhcmUgcmlnaHQsIHRo
aXMgKmlzKiBvdXQtb2Ytc3BlYy4gVGhlIGFwcHJvYWNoIGhlcmUgaXMgYmFzZWQgb24gCj4+PiB2
YXJpb3VzCj4+PiBkaXNjdXNzaW9ucyBoYXBwZW5lZCBsYXN0IHllYXIgd2hlbiB3ZSBmaXJzdCB0
cmllZCB0byB1cHN0cmVhbSBhbmQgbW9yZQo+Pj4gcmVjZW50bHkgd2hlbiB2bWdlbmlkIGxhbmRl
ZCBpbiBMaW51eC4gSSBmaW5kIHRoYXQgdGhpcyBzdW1tYXJ5Ogo+Pj4gaHR0cHM6Ly9sa21sLm9y
Zy9sa21sLzIwMjIvMy8xLzY5MyBxdWl0ZSB0byB0aGUgcG9pbnQuIChDQ2luZyBKYXNvbiB0bwo+
Pj4gaGF2ZSBoaXMgdGFrZSBvbiB0aGUgbWF0dGVyKS4KPj4+Cj4+PiBUaGlzIHNlcmllcyBjb21l
cyB0b2dldGhlciB3aXRoIGEgTGludXggY291bnRlcnBhcnQ6Cj4+PiBodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAyMi84LzMvNTYzLCB3aGVyZSB0aGUgZ2VuZXJhdGlvbiBjb3VudGVyIGlzCj4+PiBl
eHBvc2VkIHRvIHVzZXItc3BhY2UgYXMgYSBtaXNjIGRldmljZS4gVGhlcmUsIEkgdHJpZWQgdG8g
bWFrZSB0aGUKPj4+IGdlbmVyYXRpb24gY291bnRlciAib3B0aW9uYWwiLCBpbiB0aGUgc2Vuc2Ug
dGhhdCBpZiBpdCBpcyBub3QgdGhlcmUsIAo+Pj4gdGhlCj4+PiBBQ1BJIGRldmljZSBzaG91bGQg
bm90IGZhaWwsIGV4YWN0bHkgYmVjYXVzZSwgZm9yIHRoZSBtb21lbnQsIHRoaXMgaXMKPj4+IG5v
dCBpbiB0aGUgc3BlYyBhbmQgaHlwZXJ2aXNvcnMgbWlnaHQgbm90IHdhbnQgdG8gaW1wbGVtZW50
IGl0Lgo+Pj4KPj4+IEhvd2V2ZXIsIEkgdGhpbmsgdGhhdCBjaGFuZ2luZyB0aGUgc3BlYyB3aWxs
IHRha2UgdGltZSBhbmQgdGhpcyBpcyBhCj4+PiByZWFsIGlzc3VlIGFmZmVjdGluZyByZWFsIHVz
ZS1jYXNlcywgc28gd2Ugc2hvdWxkIHN0YXJ0IGZyb20gc29tZXdoZXJlLgo+PiBJIGtub3cgYSBz
cGVjIGNoYW5nZSBjYW4gdGFrZSB0aW1lLCBidXQgaGFzIHRoZXJlIGV2ZW4gYmVlbiBhbnkgZWZm
b3J0Cj4+IGF0IGFsbCB0byB0cnkgdG8gc3RhcnQgdGhhdCBhY3Rpb24gc2luY2UgZmlyc3QgZGlz
Y3Vzc2VkIGEgeWVhciBhZ28gPwo+Cj4gVGhlc2UgcGF0Y2gtc2V0cyBhcmUgb3V0IGV4YWN0bHkg
Zm9yIHN0YXJ0aW5nIHRoZSBjb252ZXJzYXRpb24gb24gYWRkaW5nCj4gdGhpcyB0byB0aGUgc3Bl
Yy4gQXMgeW91IG1lbnRpb25lZCwgaXQgd291bGQgYmUgZ3JlYXQgaWYgd2UgY291bGQgZ2V0IHRo
ZQo+IG9waW5pb24gb2Ygc29tZW9uZSBhdCBNaWNyb3NvZnQgb24gdGhpcy4KPgo+Pgo+PiBJZiB0
aGVzZSByYWNlIGNvbmRpdGlvbiBpc3N1ZXMgYXJlIHN1cHBvc2VkbHkgc28gc2VyaW91cyB0aGF0
IHdlIG5lZWQKPj4gdG8gZG8gdGhpcyB3aXRob3V0IHdhaXRpbmcgZm9yIGEgc3BlYywgdGhlbiB3
aGF0IGlzIHRoZSBhbnN3ZXIgZm9yIHRoZQo+PiBtYXNzZXMgb2YgdXNlcnMgcnVubmluZyBMaW51
eCBvbiBWTXdhcmUgb3IgSHlwZXJWL0F6dXJlID8KPgo+IFRoZSBwcm9ibGVtIGFyaXNlcyB3aGVu
IHlvdSBzdGFydCBzbmFwc2hvdHRpbmcgYW5kIHJlc3RvcmluZyBvbiBWTXMsCj4gc28gbm90IGV2
ZXJ5b25lIGlzIGFmZmVjdGVkIGZyb20gdGhlIGlzc3VlLiBVc2UtY2FzZXMgaW50ZXJlc3RlZCBp
biB0aGlzCj4gYXJlIG9uZXMgdGhhdCBtYW5hZ2UgZmxlZXRzIG9mIFZNcyB0aGF0IHJ1biBjb2Rl
IHRoYXQgcmVsaWVzIG9uCj4gdXNlci9rZXJuZWwtc3BhY2UgUFJOR3Mgb3IgbmV0d29yay1mYWNp
bmcgc2VydmljZXMgdXNpbmcgVVVJRHMsIGZvcgo+IGV4YW1wbGUuCj4KPj4KPj4gV2l0aCByZWdh
cmRzLAo+PiBEYW5pZWwKPj4gLS0gCj4+IHw6IGh0dHBzOi8vYmVycmFuZ2UuY29twqDCoMKgwqDC
oCAtby0gCj4+IGh0dHBzOi8vd3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fAo+PiB8
OiBodHRwczovL2xpYnZpcnQub3JnwqDCoMKgwqDCoMKgwqDCoCAtby0gaHR0cHM6Ly9mc3RvcDEz
OC5iZXJyYW5nZS5jb20gOnwKPj4gfDogaHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmfCoMKgwqAg
LW8tIAo+PiBodHRwczovL3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fAo+Pgo+Cj4gQ2hl
ZXJzLAo+IEJhYmlzCgpJIGFtIENDaW5nIE1pY2hhZWwgZnJvbSBNaWNyb3NvZnQuIE1heWJlIGhl
IGhhcyBzb21lIGlucHV0IG9uIHRoaXMuCkFtYXpvbiBTcGFpbiBTZXJ2aWNlcyBzb2NpZWRhZCBs
aW1pdGFkYSB1bmlwZXJzb25hbCwgQ2FsbGUgUmFtaXJleiBkZSBQcmFkbyA1LCAyODA0NSBNYWRy
aWQuIFJlZ2lzdHJvIE1lcmNhbnRpbCBkZSBNYWRyaWQgLiBUb21vIDIyNDU4IC4gRm9saW8gMTAy
IC4gSG9qYSBNLTQwMTIzNCAuIENJRiBCODQ1NzA5MzYK


