Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075C93B0EB5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 22:29:32 +0200 (CEST)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvn1W-0004RC-JT
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 16:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvn0K-00031k-AR
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:28:16 -0400
Resent-Date: Tue, 22 Jun 2021 16:28:16 -0400
Resent-Message-Id: <E1lvn0K-00031k-AR@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvn0D-0000ZW-Vn
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:28:15 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624393668; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MDI6yFYuxzmt7CIe4o5UwoYotBW8FPe3VrfA72znKpYXdpveyltmtADd+XeOiQYzSHjmYMoBdRvzV7dUkbr3t5k4Crfj+DOKXqERe4PCykgZaDwcASxAcqKYRGEKJXD0i0Nq8T6fGPJYwAiYsKE2JZXkOsOwnG+LZMucArtlfG0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624393668;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=QUXU42QsXH17sXwRh9gQIqjSLEzaf7hVChvtbgZX4Qc=; 
 b=mhUdPUkpwtqBEDkW20w5DTQlq21qnxnmsq1GEb/x9DXrww2W1nltAaZVoF8zNFD0v7Mf5EfF15+olUh/zb4ym8j+qcJs+br2ROP4xhEo8rC4au1bJJ5aL0LzOyhMe3QQJtPKy81+xL3N8eH2nzX6d+uSVdxDEzwr4e7mH+mFEGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1624393664794481.22934195357755;
 Tue, 22 Jun 2021 13:27:44 -0700 (PDT)
In-Reply-To: <20210622201740.38005-1-akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] coreaudio: Lock only the buffer
Message-ID: <162439366364.23370.15756774372413992214@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: akihiko.odaki@gmail.com
Date: Tue, 22 Jun 2021 13:27:44 -0700 (PDT)
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
Cc: f4bug@amsat.org, kraxel@redhat.com, akihiko.odaki@gmail.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYyMjIwMTc0MC4zODAw
NS0xLWFraWhpa28ub2Rha2lAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA2MjIyMDE3NDAu
MzgwMDUtMS1ha2loaWtvLm9kYWtpQGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjJdIGNvcmVh
dWRpbzogTG9jayBvbmx5IHRoZSBidWZmZXIKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEv
YmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJl
bmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4v
c2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBF
TkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0
CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcgdXBk
YXRlXSAgICAgIHBhdGNoZXcvMjAyMTA2MDgwNDA1MzIuNTY0NDktMS1tYS5tYW5kb3VyckBnbWFp
bC5jb20gLT4gcGF0Y2hldy8yMDIxMDYwODA0MDUzMi41NjQ0OS0xLW1hLm1hbmRvdXJyQGdtYWls
LmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwNjIxMTAzMzM3LjM2NjM3LTEt
ZWVzcG9zaXRAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwNjIxMTAzMzM3LjM2NjM3LTEtZWVz
cG9zaXRAcmVkaGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwNjIyMjAx
NzQwLjM4MDA1LTEtYWtpaGlrby5vZGFraUBnbWFpbC5jb20gLT4gcGF0Y2hldy8yMDIxMDYyMjIw
MTc0MC4zODAwNS0xLWFraWhpa28ub2Rha2lAZ21haWwuY29tCiAqIFtuZXcgdGFnXSAgICAgICAg
IHBhdGNoZXcvMjAyMTA2MjIyMDE5MjMuMTUwMjA1LTEtYm9ybnRyYWVnZXJAZGUuaWJtLmNvbSAt
PiBwYXRjaGV3LzIwMjEwNjIyMjAxOTIzLjE1MDIwNS0xLWJvcm50cmFlZ2VyQGRlLmlibS5jb20K
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo2Yzc1MzdkIGNvcmVhdWRpbzogTG9jayBv
bmx5IHRoZSBidWZmZXIKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBzcGFjZSBwcm9oaWJp
dGVkIGJldHdlZW4gZnVuY3Rpb24gbmFtZSBhbmQgb3BlbiBwYXJlbnRoZXNpcyAnKCcKIzU4OiBG
SUxFOiBhdWRpby9jb3JlYXVkaW8uYzoyNDU6CitzdGF0aWMgaW50IGNvcmVhdWRpb19idWZfbG9j
ayAoY29yZWF1ZGlvVm9pY2VPdXQgKmNvcmUsIGNvbnN0IGNoYXIgKmZuX25hbWUpCgpFUlJPUjog
c3BhY2UgcHJvaGliaXRlZCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG9wZW4gcGFyZW50aGVz
aXMgJygnCiM2MzogRklMRTogYXVkaW8vY29yZWF1ZGlvLmM6MjQ5OgorICAgIGVyciA9IHB0aHJl
YWRfbXV0ZXhfbG9jayAoJmNvcmUtPmJ1Zl9tdXRleCk7CgpFUlJPUjogc3BhY2UgcHJvaGliaXRl
ZCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG9wZW4gcGFyZW50aGVzaXMgJygnCiM3MjogRklM
RTogYXVkaW8vY29yZWF1ZGlvLmM6MjU4Ogorc3RhdGljIGludCBjb3JlYXVkaW9fYnVmX3VubG9j
ayAoY29yZWF1ZGlvVm9pY2VPdXQgKmNvcmUsIGNvbnN0IGNoYXIgKmZuX25hbWUpCgpFUlJPUjog
c3BhY2UgcHJvaGliaXRlZCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG9wZW4gcGFyZW50aGVz
aXMgJygnCiM3NzogRklMRTogYXVkaW8vY29yZWF1ZGlvLmM6MjYyOgorICAgIGVyciA9IHB0aHJl
YWRfbXV0ZXhfdW5sb2NrICgmY29yZS0+YnVmX211dGV4KTsKCkVSUk9SOiBzcGFjZSBwcm9oaWJp
dGVkIGJldHdlZW4gZnVuY3Rpb24gbmFtZSBhbmQgb3BlbiBwYXJlbnRoZXNpcyAnKCcKIzExNDog
RklMRTogYXVkaW8vY29yZWF1ZGlvLmM6MzE0OgorICAgIGlmIChjb3JlYXVkaW9fYnVmX2xvY2sg
KGNvcmUsICJhdWRpb0RldmljZUlPUHJvYyIpKSB7CgpFUlJPUjogc3BhY2UgcHJvaGliaXRlZCBi
ZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG9wZW4gcGFyZW50aGVzaXMgJygnCiMxMjE6IEZJTEU6
IGF1ZGlvL2NvcmVhdWRpby5jOjMyMDoKKyAgICAgICAgY29yZWF1ZGlvX2J1Zl91bmxvY2sgKGNv
cmUsICJhdWRpb0RldmljZUlPUHJvYyhvbGQgZGV2aWNlKSIpOwoKRVJST1I6IHNwYWNlIHByb2hp
Yml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBvcGVuIHBhcmVudGhlc2lzICcoJwojMTMw
OiBGSUxFOiBhdWRpby9jb3JlYXVkaW8uYzozMzA6CisgICAgICAgIGNvcmVhdWRpb19idWZfdW5s
b2NrIChjb3JlLCAiYXVkaW9EZXZpY2VJT1Byb2MoZW1wdHkpIik7CgpFUlJPUjogc3BhY2UgcHJv
aGliaXRlZCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG9wZW4gcGFyZW50aGVzaXMgJygnCiMx
Mzk6IEZJTEU6IGF1ZGlvL2NvcmVhdWRpby5jOjM1MjoKKyAgICBjb3JlYXVkaW9fYnVmX3VubG9j
ayAoY29yZSwgImF1ZGlvRGV2aWNlSU9Qcm9jIik7Cgp0b3RhbDogOCBlcnJvcnMsIDAgd2Fybmlu
Z3MsIDIzNyBsaW5lcyBjaGVja2VkCgpDb21taXQgNmM3NTM3ZDcwNGRkIChjb3JlYXVkaW86IExv
Y2sgb25seSB0aGUgYnVmZmVyKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJ
ZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8g
dGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVU
IEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9n
IGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDYyMjIwMTc0MC4z
ODAwNS0xLWFraWhpa28ub2Rha2lAZ21haWwuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1t
ZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0
cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXct
ZGV2ZWxAcmVkaGF0LmNvbQ==

