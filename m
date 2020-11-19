Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ACE2B8E62
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 10:07:58 +0100 (CET)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kffv3-0005FB-M8
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 04:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kfftz-0004oR-TI
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:06:51 -0500
Resent-Date: Thu, 19 Nov 2020 04:06:51 -0500
Resent-Message-Id: <E1kfftz-0004oR-TI@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kfftx-0001Qw-FF
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:06:51 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1605776805; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KLtjY935aChGSwp4EA+6RNmEfs1cUa3Ax6PfC/3SuSwK4OydXaKbPWmv9puWpvNd/JIS+fv6FjTiY/Oj1XLvSK9zzFAv6ZmguPxlyVDiGQotAeBfB+wlwJCk5CttAQgKN/J97Lg5cUeO9Jzn0q16LXQ1oGPvFrGxdUfkR1tzjDs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605776805;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=dm4a1i4XzEPc6sszaM6XPCEDao4d35U4Pl1BDqmNvKE=; 
 b=Hh3TC/x1779VRfb0/wW/VKkpDi5bvWUevv02XlXMvrmpNlfeyWU5otIgYN7DnH9EwED4rDwmt5tkVseItD7KehxclBvcpEQ//MEaOQHjrsojryWjD9blbI6jHwCrva7q1U06t5cNapADheA0j2XKQwNNa+URAWhyjrhJyLHbAF0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 160577680413144.54670073171599;
 Thu, 19 Nov 2020 01:06:44 -0800 (PST)
In-Reply-To: <20201119085437.5333-1-RockCui-oc@zhaoxin.com>
Subject: Re: [PATCH] virtio-blk: seg_max do not subtract 2 if host has
 VIRTIO_RING_F_INDIRECT_DESC feature
Message-ID: <160577680263.135.7562013443625538814@ba092462a7f3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: RockCui-oc@zhaoxin.com
Date: Thu, 19 Nov 2020 01:06:44 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 04:06:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: RockCui@zhaoxin.com, CobeChen@zhaoxin.com, qemu-devel@nongnu.org,
 flyfan@zhaoxin.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTExOTA4NTQzNy41MzMz
LTEtUm9ja0N1aS1vY0B6aGFveGluLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMTE5MDg1NDM3LjUz
MzMtMS1Sb2NrQ3VpLW9jQHpoYW94aW4uY29tClN1YmplY3Q6IFtQQVRDSF0gdmlydGlvLWJsazog
c2VnX21heCBkbyBub3Qgc3VidHJhY3QgMiBpZiBob3N0IGhhcyBWSVJUSU9fUklOR19GX0lORElS
RUNUX0RFU0MgZmVhdHVyZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApn
aXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVl
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2No
ZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVw
ZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRw
czovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAg
cGF0Y2hldy8yMDIwMTExOTA4NTQzNy41MzMzLTEtUm9ja0N1aS1vY0B6aGFveGluLmNvbSAtPiBw
YXRjaGV3LzIwMjAxMTE5MDg1NDM3LjUzMzMtMS1Sb2NrQ3VpLW9jQHpoYW94aW4uY29tClN3aXRj
aGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMTY2OTQ4ZSB2aXJ0aW8tYmxrOiBzZWdfbWF4IGRv
IG5vdCBzdWJ0cmFjdCAyIGlmIGhvc3QgaGFzIFZJUlRJT19SSU5HX0ZfSU5ESVJFQ1RfREVTQyBm
ZWF0dXJlCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3Vu
ZCB0aGF0ICc6JyAoY3R4OlZ4VykKIzI2OiBGSUxFOiBody9ibG9jay92aXJ0aW8tYmxrLmM6OTM3
OgorICAgICAgICAgICAgICAgICBzLT5jb25mLnNlZ19tYXhfYWRqdXN0ID8gcy0+Y29uZi5xdWV1
ZV9zaXplOiAxMjgpOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXgoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxMiBsaW5l
cyBjaGVja2VkCgpDb21taXQgMTY2OTQ4ZWYzYWU5ICh2aXJ0aW8tYmxrOiBzZWdfbWF4IGRvIG5v
dCBzdWJ0cmFjdCAyIGlmIGhvc3QgaGFzIFZJUlRJT19SSU5HX0ZfSU5ESVJFQ1RfREVTQyBmZWF0
dXJlKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2Ug
ZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIs
IHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3Qg
Y29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBh
dApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMTExOTA4NTQzNy41MzMzLTEtUm9ja0N1aS1v
Y0B6aGFveGluLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWls
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcv
XS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

