Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A900352674
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 07:46:46 +0200 (CEST)
Received: from localhost ([::1]:55788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSCdp-0001cj-O0
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 01:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lSCd4-000138-Hd; Fri, 02 Apr 2021 01:45:59 -0400
Resent-Date: Fri, 02 Apr 2021 01:45:58 -0400
Resent-Message-Id: <E1lSCd4-000138-Hd@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lSCcz-0001LR-Ku; Fri, 02 Apr 2021 01:45:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617342347; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jXFSX8Lg6tUm362hZOPy2QoIONaXcmz+t7uOmg4SMDPO8TLub3weQ6R/eoGFp/5cW6zyfnQLrrbGscFpqOxspMdbEpXVnjA5yztqdAC0nFqMJ0Bz5ZlrDvm2pykPvhpOQEMf/uhI/YqzxmmnF4bI57LdFprxRswd1d7PCtDV0KQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1617342347;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=CJ7SyOqqusaG7bpsRIKqMGzFiIRz7GLPzXb3jbqgwxM=; 
 b=jPHkCl1pZ8HIUWSGXHCkJkKji9l/T4juKl1goytdVgJnHxx1x4p+zhPiIQaJCBWVrAkVlVZzfwkpH8Yv+T1wy3mgp8L0zolnX6XlWgXV1yaax1m/8WwooHlG7J/C/qY5vARj6DZ8GFyBwHhswThW7FfIlKz2oAj0d136IJw7VL0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1617342345128806.1525745752201;
 Thu, 1 Apr 2021 22:45:45 -0700 (PDT)
In-Reply-To: <20210402053728.265173-1-richard.henderson@linaro.org>
Subject: Re: [PATCH 0/2] target/arm: Fix unaligned mte checks
Message-ID: <161734234410.1406.5525591858338700008@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Thu, 1 Apr 2021 22:45:45 -0700 (PDT)
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQwMjA1MzcyOC4yNjUx
NzMtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA0MDIw
NTM3MjguMjY1MTczLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwpTdWJqZWN0OiBbUEFU
Q0ggMC8yXSB0YXJnZXQvYXJtOiBGaXggdW5hbGlnbmVkIG10ZSBjaGVja3MKCj09PSBURVNUIFND
UklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxs
IHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdv
cml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4u
Cj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQx
ZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVj
dC9xZW11CiAgIDAwMDg0YmEuLjQxNWZhMmYgIG1hc3RlciAgICAgLT4gbWFzdGVyCiAtIFt0YWcg
dXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA0MDExMjU4MDguODkyNDEtMS1mYW53ZW50YW8uMDEz
MEBieXRlZGFuY2UuY29tIC0+IHBhdGNoZXcvMjAyMTA0MDExMjU4MDguODkyNDEtMS1mYW53ZW50
YW8uMDEzMEBieXRlZGFuY2UuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA0
MDIwNTM3MjguMjY1MTczLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZyAtPiBwYXRjaGV3
LzIwMjEwNDAyMDUzNzI4LjI2NTE3My0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcKU3dp
dGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo3NzMwMDMwIHRhcmdldC9hcm06IEZpeCB1bmFs
aWduZWQgbXRlIGNoZWNrcwplZjFhYzk3IHRhcmdldC9hcm06IENoZWNrIFBBR0VfV1JJVEVfT1JH
IGZvciBNVEUgd3JpdGVhYmlsaXR5Cgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzIgQ2hlY2tpbmcg
Y29tbWl0IGVmMWFjOTc4YTAwMyAodGFyZ2V0L2FybTogQ2hlY2sgUEFHRV9XUklURV9PUkcgZm9y
IE1URSB3cml0ZWFiaWxpdHkpCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMyODog
RklMRTogdGFyZ2V0L2FybS9tdGVfaGVscGVyLmM6ODY6CisgICAgaWYgKCEoZmxhZ3MgJiAocHRy
X2FjY2VzcyA9PSBNTVVfREFUQV9TVE9SRSA/IFBBR0VfV1JJVEVfT1JHIDogUEFHRV9SRUFEKSkp
IHsKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgOCBsaW5lcyBjaGVja2VkCgpQYXRjaCAx
LzIgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVy
cm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBz
ZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KMi8yIENoZWNraW5nIGNvbW1pdCA3NzMwMDMw
MGZhOTEgKHRhcmdldC9hcm06IEZpeCB1bmFsaWduZWQgbXRlIGNoZWNrcykKVXNlIG9mIHVuaW5p
dGlhbGl6ZWQgdmFsdWUgJGFjcGlfdGVzdGV4cGVjdGVkIGluIHN0cmluZyBlcSBhdCAuL3Njcmlw
dHMvY2hlY2twYXRjaC5wbCBsaW5lIDE1MjkuCkVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5k
IHRoYXQgJyonIChjdHg6V3hWKQojNDA3OiBGSUxFOiB0YXJnZXQvYXJtL3N2ZV9oZWxwZXIuYzo0
NDM4OgorICAgICAgICAgICAgICAgc3ZlX2xkc3QxX3RsYl9mbiAqdGxiX2ZuKQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeCgpFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0
aGF0ICcqJyAoY3R4Old4VikKIzUxNzogRklMRTogdGFyZ2V0L2FybS9zdmVfaGVscGVyLmM6NTA2
MzoKKyAgICAgICAgICAgICAgIHN2ZV9sZHN0MV90bGJfZm4gKnRsYl9mbikKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXgoKV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQg
ZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojNzg3OiAKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKCnRvdGFsOiAyIGVycm9ycywgMSB3YXJuaW5ncywgNzE5IGxpbmVzIGNoZWNr
ZWQKClBhdGNoIDIvMiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkg
b2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1h
aW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQg
PT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBh
dmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA0MDIwNTM3MjguMjY1MTcz
LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9
bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3
LWRldmVsQHJlZGhhdC5jb20=

