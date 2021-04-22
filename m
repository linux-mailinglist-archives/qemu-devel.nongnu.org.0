Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FBC368676
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 20:20:54 +0200 (CEST)
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZdwa-0005Tf-Vo
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 14:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lZduq-0004gr-5i
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:19:04 -0400
Resent-Date: Thu, 22 Apr 2021 14:19:04 -0400
Resent-Message-Id: <E1lZduq-0004gr-5i@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lZdun-0001Bv-O5
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:19:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619115533; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hefHr6TRuk9fhAwttN8zwqmXLfUmiKYvK351/aSkxcWwybuHC/GnkMEe8LbJe11iVbLya10xVAKoptq0IBCEHX5Gn9P2I/TiN1Lwk3ul4Rrh9E3OtorFQL1I02q6YwI8DMQZ9cEN9BKSOFaZ+pRZbEu3iTfsKET59Qz5JgQ2tOU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619115533;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=msQffDrJ+k6YebLH36ewAiWNO47iX1cFLCAdtHUPvKE=; 
 b=QrSjNk6sc+WJ0CedJ1tvzmUE5nqdIwbSMMet2/hs4KQFQdhUVwaHU+T24ZCDaYuQ2cE8YuAWfjJuRK9ZpVZsq8sinsIOvyEN+4q6jVcBU5s5nmSMFYRPvTnUpwXnZAUL3+7TxS6ZBL+43SsUZma3/mOke00v2dK2LW1WrR65M3E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619115527771767.9190506357218;
 Thu, 22 Apr 2021 11:18:47 -0700 (PDT)
In-Reply-To: <20210422180819.252121-1-richard.henderson@linaro.org>
Subject: Re: [PATCH 0/2] linux-user: sigaction fixes/cleanups
Message-ID: <161911552639.19742.2326361986232098811@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Thu, 22 Apr 2021 11:18:47 -0700 (PDT)
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQyMjE4MDgxOS4yNTIx
MjEtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA0MjIx
ODA4MTkuMjUyMTIxLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwpTdWJqZWN0OiBbUEFU
Q0ggMC8yXSBsaW51eC11c2VyOiBzaWdhY3Rpb24gZml4ZXMvY2xlYW51cHMKCj09PSBURVNUIFND
UklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxs
IHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdv
cml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4u
Cj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQx
ZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVj
dC9xZW11CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA0MjIxNTQ0MjcuMTMwMzgt
MS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTA0MjIxNTQ0MjcuMTMwMzgt
MS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAy
MTA0MjIxODA4MTkuMjUyMTIxLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZyAtPiBwYXRj
aGV3LzIwMjEwNDIyMTgwODE5LjI1MjEyMS0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcK
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwowYmVhMGViIGxpbnV4LXVzZXI6IENsZWFu
IHVwIHNpZ2FjdGlvbiBrYV9yZXN0b3JlcgplZGRlNzE2IGxpbnV4LXVzZXIvYWxwaGE6IEZpeCBy
dCBzaWdmcmFtZSByZXR1cm4KCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMiBDaGVja2luZyBjb21t
aXQgZWRkZTcxNmY1NDhkIChsaW51eC11c2VyL2FscGhhOiBGaXggcnQgc2lnZnJhbWUgcmV0dXJu
KQoyLzIgQ2hlY2tpbmcgY29tbWl0IDBiZWEwZWIxNjMwMCAobGludXgtdXNlcjogQ2xlYW4gdXAg
c2lnYWN0aW9uIGthX3Jlc3RvcmVyKQpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIG5ldmVyIHVz
ZSB0YWJzCiMxMDc6IEZJTEU6IGxpbnV4LXVzZXIvc3lzY2FsbC5jOjkwMjE6CiteSSAgICByZXQg
PSBnZXRfZXJybm8oZG9fc2lnYWN0aW9uKGFyZzEsIHBhY3QsICZvYWN0LCAwKSk7JAoKRVJST1I6
IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBvcGVuIHBhcmVudGhl
c2lzICcoJwojMTczOiBGSUxFOiBsaW51eC11c2VyL3N5c2NhbGwuYzo5MDc1OgorI2VsaWYgZGVm
aW5lZCAoVEFSR0VUX1NQQVJDKQoKdG90YWw6IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCAyMTQgbGlu
ZXMgY2hlY2tlZAoKUGF0Y2ggMi8yIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4g
IElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0
byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VU
UFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwg
bG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDQyMjE4MDgx
OS4yNTIxMjEtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnL3Rlc3RpbmcuY2hlY2twYXRj
aC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

