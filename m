Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28453A722B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:41:16 +0200 (CEST)
Received: from localhost ([::1]:57204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsvGd-0000ci-OJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsvF3-0007aG-4m
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:39:37 -0400
Resent-Date: Mon, 14 Jun 2021 18:39:37 -0400
Resent-Message-Id: <E1lsvF3-0007aG-4m@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsvF1-0007Gm-4J
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:39:36 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623710365; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=oCHoi63QOBiR9pfvp1to7FuFNsoDtBwwdKrpMjpLqyA73Vy06TWdD1Ca5VJfVMM9miGs3kKdA3PAsD57z3QHXecs2f3F+cZzMFKoofX9ExbxAf0JlWhqx1BqipLAL2hiG3pfeNlD2foSpK8VA9uqXw6rsSZXGhKFIldOBorfJQE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623710365;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=+VrjDokUBNk/CKsN/FIOeIns7MCUtcUboaYR9yanmSo=; 
 b=c+5hI7kWTxaVShanRcq9+CZAQxXCQVtSoxx0KmBtdRwsrG73OhdZuokCSZIWT3VqqI8LCZU9mZi09I8hoIS0NXN+8VDQNFZz8HZ9RHSLqrpQmGunz543QJd9AR+TwlIoT5f9TNhLaxLo3uFiXLYzDi2demmuaegaIxvQrigTcdQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623710364526566.3457280133418;
 Mon, 14 Jun 2021 15:39:24 -0700 (PDT)
In-Reply-To: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>
Subject: Re: [PATCH] hw/nvme: be more careful when deasserting IRQs
Message-ID: <162371036293.2358.8579859643092269612@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jakub.jermar@kernkonzept.com
Date: Mon, 14 Jun 2021 15:39:24 -0700 (PDT)
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
Cc: jakub.jermar@kernkonzept.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxMDExNDYyNC4zMDQ2
ODEtMS1qYWt1Yi5qZXJtYXJAa2VybmtvbnplcHQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA2MTAx
MTQ2MjQuMzA0NjgxLTEtamFrdWIuamVybWFyQGtlcm5rb256ZXB0LmNvbQpTdWJqZWN0OiBbUEFU
Q0hdIGh3L252bWU6IGJlIG1vcmUgY2FyZWZ1bCB3aGVuIGRlYXNzZXJ0aW5nIElSUXMKCj09PSBU
RVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rl
di9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sg
YmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4
MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXct
cHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA2MTAxMzI1MDUu
NTgyNy0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwNjEwMTMyNTA1
LjU4MjctMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmcKICogW25ldyB0YWddICAgICAgICAgcGF0
Y2hldy8yMDIxMDYxNDEzNTQyOS41NjQ3NS0xLWpha3ViLmplcm1hckBrZXJua29uemVwdC5jb20g
LT4gcGF0Y2hldy8yMDIxMDYxNDEzNTQyOS41NjQ3NS0xLWpha3ViLmplcm1hckBrZXJua29uemVw
dC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphYWNjMjg1IGh3L252bWU6IGJl
IG1vcmUgY2FyZWZ1bCB3aGVuIGRlYXNzZXJ0aW5nIElSUXMKCj09PSBPVVRQVVQgQkVHSU4gPT09
CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0
ZW1lbnQKIzM0OiBGSUxFOiBody9udm1lL2N0cmwuYzo0ODU6CisgICAgICAgIGlmIChxICYmIHEt
PnZlY3RvciA9PSBjcS0+dmVjdG9yICYmIHEtPmhlYWQgIT0gcS0+dGFpbCkKWy4uLl0KCnRvdGFs
OiAxIGVycm9ycywgMCB3YXJuaW5ncywgMzkgbGluZXMgY2hlY2tlZAoKQ29tbWl0IGFhY2MyODU0
MDJmMCAoaHcvbnZtZTogYmUgbW9yZSBjYXJlZnVsIHdoZW4gZGVhc3NlcnRpbmcgSVJRcykgaGFz
IHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwph
cmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hF
Q0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQg
ZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDov
L3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA2MTAxMTQ2MjQuMzA0NjgxLTEtamFrdWIuamVybWFyQGtl
cm5rb256ZXB0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWls
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcv
XS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

