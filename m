Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97C35E800
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:05:28 +0200 (CEST)
Received: from localhost ([::1]:48866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQDv-0002ko-9S
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lWQCU-0002Af-J3
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 17:03:58 -0400
Resent-Date: Tue, 13 Apr 2021 17:03:58 -0400
Resent-Message-Id: <E1lWQCU-0002Af-J3@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lWQCS-0001dt-78
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 17:03:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618347826; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QLbUatAsUYava1KMCJY+bxT8SyAzrRtXs5buxxZ9ZlgqVoSvLkOO5H721jOmcOvyLa/cUKFqWc72ml0+JbUgX15KfPTQmGdp43DK/su6aBXSte1DTb6v+3vNa7agVoEZmmNaF6/A4kWZ0BPA3bk9mvmhnfAGMB7hKWdpIv3w7r8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618347826;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=T8Q3cvDte7SIPPcGbl8dnV9GQNqv1lXWuI0nVafGywE=; 
 b=MfytpYbsIoZFecyzuPhFGdvBN2/0OqK41QuAfp+hR4/lfN2RZWrwNiQY86iuaSaZ5plJG4zjiRYntc1+mVtHsRddGb+ojvaDYawQ5p0LhZ1uAOTSeiAAFKGNZQYubvqz6CJu499HnfXbbDslCvwESx3J2mcxlB/TCb9tIVhdR2A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618347824071712.0605085061163;
 Tue, 13 Apr 2021 14:03:44 -0700 (PDT)
In-Reply-To: <20210413205814.22821-1-iii@linux.ibm.com>
Subject: Re: [PATCH] linux-user/elfload: fix filling psinfo->pr_psargs
Message-ID: <161834782308.14712.5847960601396362593@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: iii@linux.ibm.com
Date: Tue, 13 Apr 2021 14:03:44 -0700 (PDT)
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
Cc: borntraeger@de.ibm.com, laurent@vivier.eu, iii@linux.ibm.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQxMzIwNTgxNC4yMjgy
MS0xLWlpaUBsaW51eC5pYm0uY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA0MTMyMDU4MTQuMjI4MjEt
MS1paWlAbGludXguaWJtLmNvbQpTdWJqZWN0OiBbUEFUQ0hdIGxpbnV4LXVzZXIvZWxmbG9hZDog
Zml4IGZpbGxpbmcgcHNpbmZvLT5wcl9wc2FyZ3MKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFt
Ci4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEz
Mzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcg
dGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA0MTMyMDU4MTQuMjI4MjEtMS1paWlAbGludXguaWJt
LmNvbSAtPiBwYXRjaGV3LzIwMjEwNDEzMjA1ODE0LjIyODIxLTEtaWlpQGxpbnV4LmlibS5jb20K
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwowMTUzNmZhIGxpbnV4LXVzZXIvZWxmbG9h
ZDogZml4IGZpbGxpbmcgcHNpbmZvLT5wcl9wc2FyZ3MKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVS
Uk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1l
bnQKIzM1OiBGSUxFOiBsaW51eC11c2VyL2VsZmxvYWQuYzozNjM1OgorICAgIGlmIChjb3B5X2Zy
b21fdXNlcigmcHNpbmZvLT5wcl9wc2FyZ3MsIHRzLT5pbmZvLT5hcmdfc3RyaW5ncywgbGVuKSkK
Wy4uLl0KCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTIgbGluZXMgY2hlY2tlZAoKQ29t
bWl0IDAxNTM2ZmEwYzgwYiAobGludXgtdXNlci9lbGZsb2FkOiBmaXggZmlsbGluZyBwc2luZm8t
PnByX3BzYXJncykgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9m
IHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWlu
dGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09
CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFp
bGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA0MTMyMDU4MTQuMjI4MjEtMS1p
aWlAbGludXguaWJtLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVt
YWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5v
cmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5j
b20=

