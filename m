Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C502F66D7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:09:18 +0100 (CET)
Received: from localhost ([::1]:50234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l067Z-0003kQ-AO
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l05pL-0004u8-89; Thu, 14 Jan 2021 11:50:28 -0500
Resent-Date: Thu, 14 Jan 2021 11:50:27 -0500
Resent-Message-Id: <E1l05pL-0004u8-89@lists.gnu.org>
Received: from sender4-of-o52.zoho.com ([136.143.188.52]:21279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l05pD-0001tl-OA; Thu, 14 Jan 2021 11:50:26 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1610642973; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CI4lYBUlf/qFv6ixi7mSjfhEnevt6+UgHYXGCUqL3yZIAclaIilCG2i+tlhd6IdtfPpmzjPZnp9JpeJXcxz1jHbNkiIVjfUPaLhP4OeQt5QAx+q8Faas5tgr72oqkoKJNlXd+aRkbxq5RQJv21cH5yMVVgs49VY3U8bsw1uEpgI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1610642973;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=11/cvvLOmCFSXKqz+E3bTnPvrdgdvJm99BZ2aFIK2yY=; 
 b=Z/BJEBtk59xSMyc9mrMnCZ4NJJBwf+x4wfZaq7HsN6NUrIYaY8PPUZjItHxZwJCQVtvlZo9Y/c46hJMEsdwdWHuDykicQmde7vO3KHEn39kg/hMcwdCEV8yz0RNEwtajkalXVTGFSQTW2C3Qk+NW4Q7ZgRzuaMzSVUM3h0MmsRM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1610640767103383.4190455637688;
 Thu, 14 Jan 2021 08:12:47 -0800 (PST)
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
Message-ID: <161064076471.14770.17331806238218537829@73fb1a5943b8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: bmeng.cn@gmail.com
Date: Thu, 14 Jan 2021 08:12:47 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.52; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o52.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
 marcin.krzeminski@nokia.com, andrew@aj.id.au, frasse.iglesias@gmail.com,
 bin.meng@windriver.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 clg@kaod.org, komlodi@xilinx.com, hskinnemoen@google.com, mreitz@redhat.com,
 joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDExNDE1MDkwMi4xMTUx
NS0xLWJtZW5nLmNuQGdtYWlsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMTE0MTUwOTAyLjExNTE1
LTEtYm1lbmcuY25AZ21haWwuY29tClN1YmplY3Q6IFtQQVRDSCAwLzldIGh3L2Jsb2NrOiBtMjVw
ODA6IEZpeCB0aGUgbWVzcyBvZiBkdW1teSBieXRlcyBuZWVkZWQgZm9yIGZhc3QgcmVhZCBjb21t
YW5kcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNl
IGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFt
ZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwg
LS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNm
NWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5j
b20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIx
MDExNDAxMzE0Ny45Mjk2Mi0xLWppYXh1bi55YW5nQGZseWdvYXQuY29tIC0+IHBhdGNoZXcvMjAy
MTAxMTQwMTMxNDcuOTI5NjItMS1qaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbQogKiBbbmV3IHRhZ10g
ICAgICAgICBwYXRjaGV3LzIwMjEwMTE0MTUwOTAyLjExNTE1LTEtYm1lbmcuY25AZ21haWwuY29t
IC0+IHBhdGNoZXcvMjAyMTAxMTQxNTA5MDIuMTE1MTUtMS1ibWVuZy5jbkBnbWFpbC5jb20KU3dp
dGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpiODdhZGVkIGh3L3NzaTogbnBjbTd4eF9maXU6
IENvcnJlY3QgdGhlIGR1bW15IGN5Y2xlIGVtdWxhdGlvbiBsb2dpYwo0NTE4YmUyIFJldmVydCAi
YXNwZWVkL3NtYzogc25vb3AgU1BJIHRyYW5zZmVycyB0byBmYWtlIGR1bW15IGN5Y2xlcyIKNmE0
MDY3YSBSZXZlcnQgImFzcGVlZC9zbWM6IEZpeCBudW1iZXIgb2YgZHVtbXkgY3ljbGVzIGZvciBG
QVNUX1JFQURfNCBjb21tYW5kIgplNWVhNzQ0IGh3L3NzaTogeGlsaW54X3NwaXBzOiBGaXggZ2Vu
ZXJpYyBmaWZvIGR1bW15IGN5Y2xlIGhhbmRsaW5nCjMyOTQ5NDIgaHcvYmxvY2s6IG0yNXA4MDog
U3VwcG9ydCBmYXN0IHJlYWQgZm9yIFNTVCBmbGFzaGVzCjUwYTdmOWYgaHcvYmxvY2s6IG0yNXA4
MDogRml4IHRoZSBudW1iZXIgb2YgZHVtbXkgYnl0ZXMgbmVlZGVkIGZvciBTcGFuc2lvbiBmbGFz
aGVzCmNmNmY4ZTEgaHcvYmxvY2s6IG0yNXA4MDogRml4IHRoZSBudW1iZXIgb2YgZHVtbXkgYnl0
ZXMgbmVlZGVkIGZvciBNYWNyb25peCBmbGFzaGVzCjM5MjVmY2YgaHcvYmxvY2s6IG0yNXA4MDog
Rml4IHRoZSBudW1iZXIgb2YgZHVtbXkgYnl0ZXMgbmVlZGVkIGZvciBOdW1vbnl4L01pY3JvbiBm
bGFzaGVzCjUzNDQxNjggaHcvYmxvY2s6IG0yNXA4MDogRml4IHRoZSBudW1iZXIgb2YgZHVtbXkg
Ynl0ZXMgbmVlZGVkIGZvciBXaW5kYm9uZCBmbGFzaGVzCgo9PT0gT1VUUFVUIEJFR0lOID09PQox
LzkgQ2hlY2tpbmcgY29tbWl0IDUzNDQxNjhkZTQzMyAoaHcvYmxvY2s6IG0yNXA4MDogRml4IHRo
ZSBudW1iZXIgb2YgZHVtbXkgYnl0ZXMgbmVlZGVkIGZvciBXaW5kYm9uZCBmbGFzaGVzKQoyLzkg
Q2hlY2tpbmcgY29tbWl0IDM5MjVmY2Y3OWRiYyAoaHcvYmxvY2s6IG0yNXA4MDogRml4IHRoZSBu
dW1iZXIgb2YgZHVtbXkgYnl0ZXMgbmVlZGVkIGZvciBOdW1vbnl4L01pY3JvbiBmbGFzaGVzKQoz
LzkgQ2hlY2tpbmcgY29tbWl0IGNmNmY4ZTE0NWZhYSAoaHcvYmxvY2s6IG0yNXA4MDogRml4IHRo
ZSBudW1iZXIgb2YgZHVtbXkgYnl0ZXMgbmVlZGVkIGZvciBNYWNyb25peCBmbGFzaGVzKQo0Lzkg
Q2hlY2tpbmcgY29tbWl0IDUwYTdmOWZiOTA5YiAoaHcvYmxvY2s6IG0yNXA4MDogRml4IHRoZSBu
dW1iZXIgb2YgZHVtbXkgYnl0ZXMgbmVlZGVkIGZvciBTcGFuc2lvbiBmbGFzaGVzKQo1LzkgQ2hl
Y2tpbmcgY29tbWl0IDMyOTQ5NDJjYTNhMSAoaHcvYmxvY2s6IG0yNXA4MDogU3VwcG9ydCBmYXN0
IHJlYWQgZm9yIFNTVCBmbGFzaGVzKQo2LzkgQ2hlY2tpbmcgY29tbWl0IGU1ZWE3NDQ3M2Q4NyAo
aHcvc3NpOiB4aWxpbnhfc3BpcHM6IEZpeCBnZW5lcmljIGZpZm8gZHVtbXkgY3ljbGUgaGFuZGxp
bmcpCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojNjM6IEZJTEU6IGh3L3NzaS94aWxp
bnhfc3BpcHMuYzo1MTA6CisgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3Qgc3BpX21vZGUgPSBB
UlJBWV9GSUVMRF9FWDMyKHMtPnJlZ3MsIEdRU1BJX0dGX1NOQVBTSE9ULCBTUElfTU9ERSk7CgpF
UlJPUjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzcxOiBGSUxFOiBody9zc2kveGlsaW54X3Nw
aXBzLmM6NTE4OgorICAgICAgICAgICAgICAgICAgICAgICAgcWVtdV9sb2dfbWFzayhMT0dfR1VF
U1RfRVJST1IsICJVbmtub3duIFNQSSBNT0RFOiAweCV4ICIsIHNwaV9tb2RlKTsKCnRvdGFsOiAy
IGVycm9ycywgMCB3YXJuaW5ncywgNDEgbGluZXMgY2hlY2tlZAoKUGF0Y2ggNi85IGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZh
bHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFU
Q0ggaW4gTUFJTlRBSU5FUlMuCgo3LzkgQ2hlY2tpbmcgY29tbWl0IDZhNDA2N2E2YTlmYyAoUmV2
ZXJ0ICJhc3BlZWQvc21jOiBGaXggbnVtYmVyIG9mIGR1bW15IGN5Y2xlcyBmb3IgRkFTVF9SRUFE
XzQgY29tbWFuZCIpCjgvOSBDaGVja2luZyBjb21taXQgNDUxOGJlMjJlMWM5IChSZXZlcnQgImFz
cGVlZC9zbWM6IHNub29wIFNQSSB0cmFuc2ZlcnMgdG8gZmFrZSBkdW1teSBjeWNsZXMiKQo5Lzkg
Q2hlY2tpbmcgY29tbWl0IGI4N2FkZWQ2ZGMyYSAoaHcvc3NpOiBucGNtN3h4X2ZpdTogQ29ycmVj
dCB0aGUgZHVtbXkgY3ljbGUgZW11bGF0aW9uIGxvZ2ljKQo9PT0gT1VUUFVUIEVORCA9PT0KClRl
c3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJs
ZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDExNDE1MDkwMi4xMTUxNS0xLWJtZW5n
LmNuQGdtYWlsLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWls
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcv
XS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

