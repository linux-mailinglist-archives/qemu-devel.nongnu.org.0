Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6B31665D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 13:15:37 +0100 (CET)
Received: from localhost ([::1]:49774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9oP7-0006GK-D3
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 07:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6685ad1c3=graf@amazon.de>)
 id 1l9oMz-0004sV-ML
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:13:21 -0500
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:15339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6685ad1c3=graf@amazon.de>)
 id 1l9oMx-00045z-KJ
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 07:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1612959199; x=1644495199;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Ybp5OsjE3P6jgWeWdiyj50qY3kpO+R8bQxr1osRRiV4=;
 b=Q7txen4eaQ1iyy/DTOIWwbGlZFHZk0/BgSCjYmuff952486X8s2gv5D9
 YhSK68brdcc0Bcla51jviP2uGe1kYXnEzZYpcUZ+1cGoMB5b6YZpCmxHU
 q8+eWqGTLkev87zPNzG2F4GJuS2RzZp4hbJfsT5OLYxEOds7Bu5OLqJDY w=;
X-IronPort-AV: E=Sophos;i="5.81,168,1610409600"; d="scan'208";a="84096106"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 10 Feb 2021 12:13:09 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id 513CBA18FE; Wed, 10 Feb 2021 12:13:08 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 10 Feb 2021 12:13:08 +0000
Received: from freeip.amazon.com (10.43.160.207) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 10 Feb 2021 12:13:04 +0000
Subject: Re: About creating machines on the command line
To: Luc Michel <luc.michel@greensocs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>, Nikos Dragazis <ndragazis@arrikto.com>, "Maxime
 Coquelin" <maxime.coquelin@redhat.com>, Thanos Makatos
 <thanos.makatos@nutanix.com>, Andra-Irina Paraschiv <andraprs@amazon.com>,
 "John G. Johnson" <john.g.johnson@oracle.com>, Jan Kiszka
 <jan.kiszka@siemens.com>
CC: Damien Hedde <damien.hedde@greensocs.com>, <peter.maydell@linaro.org>,
 <richard.fuhler@sifive.com>, <berrange@redhat.com>, <sam.grove@sifive.com>,
 Mark Burton <mark.burton@greensocs.com>, <armbru@redhat.com>,
 <edgar.iglesias@gmail.com>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
 <93e41283-ec7c-4c2b-dcfd-9e0e7a2e435c@amsat.org>
 <497eb0f5-a308-7a10-37ef-5fcc3ec21b8a@amazon.com>
 <01ebe874-badf-0454-388c-00d49b2b3763@greensocs.com>
From: Alexander Graf <graf@amazon.com>
Message-ID: <25208118-d432-c86f-1711-12e8491dd817@amazon.com>
Date: Wed, 10 Feb 2021 13:13:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <01ebe874-badf-0454-388c-00d49b2b3763@greensocs.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.207]
X-ClientProxiedBy: EX13D20UWC001.ant.amazon.com (10.43.162.244) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=6685ad1c3=graf@amazon.de; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

CgpPbiAwNS4wMi4yMSAxMTo0MywgTHVjIE1pY2hlbCB3cm90ZToKPiAKPiBPbiAyLzMvMjEgNjow
OSBQTSwgQWxleGFuZGVyIEdyYWYgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDAzLjAyLjIxIDE3OjU1LCBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPj4+Cj4+PiBPbiAxLzExLzIxIDM6NTAgUE0s
IEx1YyBNaWNoZWwgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBXZSB3b3VsZCBsaWtlIHRvIHdv
cmsgb24gaW1wcm92aW5nIFFFTVUgdG8gYmUgYWJsZSB0byBjcmVhdGUgY3VzdG9tCj4+Pj4gbWFj
aGluZXMgZnJvbSB0aGUgY29tbWFuZCBsaW5lLiBUaGUgZ29hbCBoZXJlIGlzIHRvIGdldCBmZWVk
YmFjayBmcm9tCj4+Pj4gdGhlIGNvbW11bml0eSBhbmQgc2hhcGUgdGhlIGZ1dHVyZSBkZXZlbG9w
bWVudHMuCj4+Pgo+Pj4gQ2MnaW5nIEpvaG4gd2hvIGlzIHdvcmtpbmcgb24gY29tbWFuZCBsaW5l
LCBhbmQgc29tZSBkZXZlbG9wZXJzIGZyb20KPj4+IHRoZSAiaW50ZXItVk0gZGV2aWNlIGVtdWxh
dGlvbiBpbnRlcmZhY2UiIGNhbGwuCj4+PiBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3Fl
bXUtZGV2ZWxAbm9uZ251Lm9yZy9tc2c3MjMyNTIuaHRtbAo+Pj4KPj4+Pgo+Pj4+IFRoZSB1c2Ug
Y2FzZSBtYWlubHkgY29tZXMgZnJvbSBwZW9wbGUgd29ya2luZyB3aXRoIHRvb2xzIHRvIGN1c3Rv
bWl6ZQo+Pj4+IHRoZWlyIGRlc2lnbnMsIHN1Y2ggYXMgU2lGaXZlIENvcmUgRGVzaWduZXIKPj4+
PiAoaHR0cHM6Ly9zY3Muc2lmaXZlLmNvbS9jb3JlLWRlc2lnbmVyKS4gVGhpcyBraW5kIG9mIHRv
b2xzIG1heSBhbGxvdwo+Pj4+IGNyZWF0aW9uIG9yIGN1c3RvbWl6YXRpb24gb2YgYSB3aG9sZSBT
b0MsIGZyb20gdGhlIG51bWJlciBvZiBjb3JlcywgdG8KPj4+PiB0aGUgbWVtb3J5IGFuZCBJUlEg
bWFwcGluZyBvZiBwZXJpcGhlcmFscyBldGMuCj4+Pj4KPj4+PiBUaGUgdWx0aW1hdGUgZ29hbCB3
b3VsZCBiZSB0byBiZSBhYmxlIHRvIGNyZWF0ZSBhbnkga2luZCBvZiBtYWNoaW5lIG9uCj4+Pj4g
dGhlIGNvbW1hbmQgbGluZS4gSG93ZXZlciB3ZSBhcmUgYXdhcmUgdGhhdCB0aGlzIGlzIGEgc3Vi
c3RhbnRpYWwgCj4+Pj4gYW1vdW50Cj4+Pj4gb2YgY2hhbmdlcyBpbiBRRU1VLgo+Pgo+PiBJcyB0
aGUgY29tbWFuZCBsaW5lIHJlYWxseSB0aGUgcmlnaHQgYWJzdHJhY3Rpb24gbGV2ZWwgaGVyZT8g
V291bGRuJ3QgaXQKPj4gbWFrZSBtb3JlIHNlbnNlIHRvIGhhdmUgYSBRT00gLyA8c2NyaXB0aW5n
IGxhbmd1YWdlPiBicmlkZ2UgdGhhdCBhbGxvd3MKPj4geW91IHRvIGNyZWF0ZSBhbmQgY29ubmVj
dCBRT00gb2JqZWN0cyB1c2luZyBmb3IgZXhhbXBsZSBQeXRob24/Cj4gWWVzLCBhZnRlciBzb21l
IGRpc2N1c3Npb25zIHdpdGggdGhlIGNvbW11bml0eSwgd2UgYXJlIG5vdyB3b3JraW5nIG9uCj4g
aW1wcm92aW5nIFFNUCB0byBhY2hpZXZlIHRoaXMuIFdlIGZpcnN0IHN0YXJ0ZWQgd2l0aCB0aGUg
aWRlYSBvZiB0aGUKPiBjb21tYW5kIGxpbmUgYmVjYXVzZSBpdCBzZWVtcyB0byBiZSB0aGUgcGxh
Y2Ugd2hlcmUgd2UgaGFkICJhbG1vc3QiCj4gZXZlcnl0aGluZyB3ZSBuZWVkZWQgYWxyZWFkeS4g
SW4gZWl0aGVyIGNhc2VzIHdlIGFyZSBwbGFubmluZyB0byB1c2UgYQo+IGZyb250LWVuZCBzY3Jp
cHQgdG8gZ28gZnJvbSBlLmcuIGEgRFRCIHRvIHdoYXRldmVyIFFFTVUgaW50ZXJmYWNlIHdlCj4g
d2lsbCBlbmQgdXAgdXNpbmcuCj4gCj4+Cj4+IFlvdSBjb3VsZCB0aGVuIGhhdmUgbWFjaGluZSBk
ZXNjcmlwdGlvbnMgaW4gYSBzY3JpcHQsIHdoaWNoIGNvdWxkIGJlCj4+IGdlbmVyYXRlZCBieSB0
aGUgU29DIGN1c3RvbWl6YXRpb24gdG9vbHMuCj4gWWVzLCBtb3N0IGxpa2VseSBhIERUQiBpbiBv
dXIgY2FzZS4KClNvLCBzb21ldGhpbmcgbGlrZSB0aGlzPwoKICAgICBodHRwczovL2dpdGh1Yi5j
b20vWGlsaW54L3FlbXUvYmxvYi9tYXN0ZXIvaHcvYXJtL2FybV9nZW5lcmljX2ZkdC5jCgpJJ20g
bm90IHN1cmUgaG93IERUQiB3b3VsZCB0cmFuc2xhdGUgMToxIGludG8gcW9tIHByb3BlcnRpZXMg
Zm9yIGEgcmVlYWwgCmdlbmVyaWMgbWVjaGFuaXNtPyBBbmQgaG93IGVhc3kgaXQgd291bGQgYmUg
dG8gZXh0cmFjdCB0YXJnZXQgZGV2aWNlIApzcGVjaWZpY3MsIHN1Y2ggYXMgaW50ZXJydXB0IGRl
c2NyaXB0b3JzIG9yIFBDSSByYW5nZXMgcHJvcGVydGllcy4KCklmIHlvdSB3YW50IHRvIG1ha2Ug
dGhpcyBmdWxseSBnZW5lcmljLCB0cnkgdG8gZW5zdXJlIHRoYXQgeW91IGNhbiBtb2RlbCAKd2Vp
cmQgYmVhc3RzIHN1Y2ggYXMgdGhlIHEzNSBtYWNoaW5lIG1vZGVsLgoKRWl0aGVyIHdheSwgdGhl
IGlkZWEgaGFzIGNvbWUgdXAgbXVsdGlwbGUgdGltZXMgYmVmb3JlLiBJIGRvbid0IGtub3cgb2Yg
CmFueW9uZSB3aG8gc3VjY2Vzc2Z1bGx5IG1hbmFnZWQgdG8gcHVzaCBpdCB1cHN0cmVhbSB5ZXQs
IGJ1dCBJIApkZWZpbml0ZWx5IGhvcGUgd2Ugd2lsbCBiZSBhdCBhIHBvaW50IHdoZXJlIHlvdSBj
YW4gZGVzY3JpYmUgbWFjaGluZSAKbW9kZWxzIGluIHNvbWV0aGluZyBkaWZmZXJlbnQgdGhhbiBD
LgoKCkFsZXgKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNl
bnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxh
ZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRl
bmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcg
ODc5CgoK


