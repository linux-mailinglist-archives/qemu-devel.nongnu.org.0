Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343563B2FFE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 15:32:38 +0200 (CEST)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwPTB-0005JQ-9k
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 09:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lwPRo-0004Nu-Gk; Thu, 24 Jun 2021 09:31:12 -0400
Resent-Date: Thu, 24 Jun 2021 09:31:12 -0400
Resent-Message-Id: <E1lwPRo-0004Nu-Gk@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lwPRl-00021a-T3; Thu, 24 Jun 2021 09:31:12 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624541447; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KIb14ShFb8IKjwMPEZKdP2YN0lmy9egKvxeLz8pFRdookdjbTv2GjIAD4iXvV16O3yRaLnmPU1q8LuqukWk0/9mFqiF8zLq7mgKESkMOAi/M2BcRjetdTPHgJqRXKO2Eote9ejr4ILpzwptJHMAANJZ1IajmJmYc5Ur08cSu6WA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624541447;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=/kHKcvEo/MkEE3lGva12QcFwP6wwZEadEIeHv/PMdT4=; 
 b=cUj4Qo7AtyCzDbFNFaPMrQXxo3j1bhH3nG8ToLNrcgHlWB+3f//0RwcM/cy8tMNMP6tTQWsECxvsrBy3whdrGqh1ArpZZjyR58Fb59XUyYYaHEyF0KQx1LP9pRa7jZMFCp1ilQljivZ121TF3pkcX80nmEWCkaXvhrfgCsF0N6c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1624541446734278.22751326469506;
 Thu, 24 Jun 2021 06:30:46 -0700 (PDT)
In-Reply-To: <20210624120635.54573-1-caojinhua1@huawei.com>
Subject: Re: [RFC] block/mirror: fix file-system went to read-only after
 block-mirror
Message-ID: <162454144563.24366.801461474012857238@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: caojinhua1@huawei.com
Date: Thu, 24 Jun 2021 06:30:46 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 eric.fangyi@huawei.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYyNDEyMDYzNS41NDU3
My0xLWNhb2ppbmh1YTFAaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNjI0MTIwNjM1LjU0
NTczLTEtY2FvamluaHVhMUBodWF3ZWkuY29tClN1YmplY3Q6IFtSRkNdIGJsb2NrL21pcnJvcjog
Zml4IGZpbGUtc3lzdGVtIHdlbnQgdG8gcmVhZC1vbmx5IGFmdGVyIGJsb2NrLW1pcnJvcgoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAv
ZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFj
ayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4
NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hl
dy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDYyNDEyMDYz
NS41NDU3My0xLWNhb2ppbmh1YTFAaHVhd2VpLmNvbSAtPiBwYXRjaGV3LzIwMjEwNjI0MTIwNjM1
LjU0NTczLTEtY2FvamluaHVhMUBodWF3ZWkuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAn
dGVzdCcKNmUyYmE1NCBibG9jay9taXJyb3I6IGZpeCBmaWxlLXN5c3RlbSB3ZW50IHRvIHJlYWQt
b25seSBhZnRlciBibG9jay1taXJyb3IKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBNaXNz
aW5nIFNpZ25lZC1vZmYtYnk6IGxpbmUocykKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywg
MTkgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDZlMmJhNTQ3ZjA0MiAoYmxvY2svbWlycm9yOiBmaXgg
ZmlsZS1zeXN0ZW0gd2VudCB0byByZWFkLW9ubHkgYWZ0ZXIgYmxvY2stbWlycm9yKSBoYXMgc3R5
bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBm
YWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BB
VENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0
ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0
Y2hldy5vcmcvbG9ncy8yMDIxMDYyNDEyMDYzNS41NDU3My0xLWNhb2ppbmh1YTFAaHVhd2VpLmNv
bS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBh
dXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNl
bmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

