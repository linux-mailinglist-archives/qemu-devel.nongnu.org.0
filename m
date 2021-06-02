Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3730F397DAF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 02:30:08 +0200 (CEST)
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loElr-0003TC-B0
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 20:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1loEk2-0001Y7-3s; Tue, 01 Jun 2021 20:28:14 -0400
Resent-Date: Tue, 01 Jun 2021 20:28:14 -0400
Resent-Message-Id: <E1loEk2-0001Y7-3s@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1loEjx-0006HN-22; Tue, 01 Jun 2021 20:28:13 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622593670; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iEX5D2RNUHMl2jMacHTLTrNkGWuKy6fY9vr9RdjIPYjDFF8OMFvxsY96HI7Mi5CYl8wiijhk27RNCheRIgizR9MnJ0QOo23mevfqxBdUtHuBDeQ/AXCamO00QX4/C+BjtZgQOO1pA0u1ZmedQu8RNc2U5XXQbMxajvI95V6ObEM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1622593670;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=6WXzqNH3hZ1kkPMtwTxJvqV7lWwzIoI6/3wh1CSYLTo=; 
 b=DEhBuG3VOKUoxwOtmLu022HEev2M5Y43dH8V5yxJvdyEvI4YteTVj+6Sc/uGE3wDjTPEsHvTCR+96MPhOpg9FcIF/lSURk1VzxOpiDgnrwMGgjjYjvzIeLN2v96x/8VwCXaLsXMhdcud5o3tbedOi6Ld5N+pb3FYyAJ1WiTo8Pc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1622593668024454.7487690075195;
 Tue, 1 Jun 2021 17:27:48 -0700 (PDT)
In-Reply-To: <20210602002210.3144559-1-iii@linux.ibm.com>
Subject: Re: [PATCH v3 0/2] target/s390x: Fix SIGILL psw.addr reporting
Message-ID: <162259366635.3197.5328551553714570790@0addf061776e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: iii@linux.ibm.com
Date: Tue, 1 Jun 2021 17:27:48 -0700 (PDT)
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
Cc: iii@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, qemu-devel@nongnu.org,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYwMjAwMjIxMC4zMTQ0
NTU5LTEtaWlpQGxpbnV4LmlibS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYwMjAwMjIxMC4zMTQ0
NTU5LTEtaWlpQGxpbnV4LmlibS5jb20KU3ViamVjdDogW1BBVENIIHYzIDAvMl0gdGFyZ2V0L3Mz
OTB4OiBGaXggU0lHSUxMIHBzdy5hZGRyIHJlcG9ydGluZwoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0
b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1Qg
U0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4
ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0g
W3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8xNjIyNTg5NTg0LTIyNTcxLTEtZ2l0LXNlbmQtZW1h
aWwtdHNpbXBzb25AcXVpY2luYy5jb20gLT4gcGF0Y2hldy8xNjIyNTg5NTg0LTIyNTcxLTEtZ2l0
LXNlbmQtZW1haWwtdHNpbXBzb25AcXVpY2luYy5jb20KICogW25ldyB0YWddICAgICAgICAgcGF0
Y2hldy8yMDIxMDYwMjAwMjIxMC4zMTQ0NTU5LTEtaWlpQGxpbnV4LmlibS5jb20gLT4gcGF0Y2hl
dy8yMDIxMDYwMjAwMjIxMC4zMTQ0NTU5LTEtaWlpQGxpbnV4LmlibS5jb20KU3dpdGNoZWQgdG8g
YSBuZXcgYnJhbmNoICd0ZXN0Jwo0OTViYzVjIHRlc3RzL3RjZy9zMzkweDogVGVzdCBTSUdJTEwg
YW5kIFNJR1NFR1YgaGFuZGxpbmcKMmUyOGViOSB0YXJnZXQvczM5MHg6IEZpeCBTSUdJTEwgcHN3
LmFkZHIgcmVwb3J0aW5nCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzIgQ2hlY2tpbmcgY29tbWl0
IDJlMjhlYjk1MjZkMiAodGFyZ2V0L3MzOTB4OiBGaXggU0lHSUxMIHBzdy5hZGRyIHJlcG9ydGlu
ZykKMi8yIENoZWNraW5nIGNvbW1pdCA0OTViYzVjZmQ1OWEgKHRlc3RzL3RjZy9zMzkweDogVGVz
dCBTSUdJTEwgYW5kIFNJR1NFR1YgaGFuZGxpbmcpCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBk
ZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzI2OiAKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKCkVSUk9SOiBleHRlcm5zIHNob3VsZCBiZSBhdm9pZGVkIGluIC5j
IGZpbGVzCiM0NDogRklMRTogdGVzdHMvdGNnL3MzOTB4L3NpZ25hbC5jOjE0Ogordm9pZCBpbGxl
Z2FsX29wKHZvaWQpOwoKRVJST1I6IGV4dGVybnMgc2hvdWxkIGJlIGF2b2lkZWQgaW4gLmMgZmls
ZXMKIzQ1OiBGSUxFOiB0ZXN0cy90Y2cvczM5MHgvc2lnbmFsLmM6MTU6Cit2b2lkIGFmdGVyX2ls
bGVnYWxfb3Aodm9pZCk7CgpFUlJPUjogZXh0ZXJucyBzaG91bGQgYmUgYXZvaWRlZCBpbiAuYyBm
aWxlcwojNTE6IEZJTEU6IHRlc3RzL3RjZy9zMzkweC9zaWduYWwuYzoyMToKK3ZvaWQgc3RnKHZv
aWQgKmRzdCwgdW5zaWduZWQgbG9uZyBzcmMpOwoKRVJST1I6IGV4dGVybnMgc2hvdWxkIGJlIGF2
b2lkZWQgaW4gLmMgZmlsZXMKIzU2OiBGSUxFOiB0ZXN0cy90Y2cvczM5MHgvc2lnbmFsLmM6MjY6
Cit2b2lkIG12Y184KHZvaWQgKmRzdCwgdm9pZCAqc3JjKTsKCnRvdGFsOiA0IGVycm9ycywgMSB3
YXJuaW5ncywgMTY3IGxpbmVzIGNoZWNrZWQKClBhdGNoIDIvMiBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2
ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29k
ZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xv
Z3MvMjAyMTA2MDIwMDIyMTAuMzE0NDU1OS0xLWlpaUBsaW51eC5pYm0uY29tL3Rlc3RpbmcuY2hl
Y2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkg
YnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRi
YWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

