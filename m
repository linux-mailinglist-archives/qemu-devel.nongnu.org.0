Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F23AF8A2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 00:38:44 +0200 (CEST)
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvSZ1-00055F-I1
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 18:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvSXQ-0004OL-Ii; Mon, 21 Jun 2021 18:37:04 -0400
Resent-Date: Mon, 21 Jun 2021 18:37:04 -0400
Resent-Message-Id: <E1lvSXQ-0004OL-Ii@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvSXO-0005Be-2Q; Mon, 21 Jun 2021 18:37:04 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624315007; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IDKNJuTVZZoG/FurBQ2YSkGyS+FEMkRw+IF3JfywxRdWwOFVyfM7ncqJCrDDSon6hPgMV8bq8qm4CvA87+UbL58PRkLRya7mEKYIHDzvDNgxOA4Eai2Xa71TVktnzvOBaCQS9gUJy6ijQT9jW/fT72+cu7mGApxlt55Ym9XG5EI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624315007;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=cecKq96moAwAy1TxVwB0gl/S9pRSOVwCmPATXAPZWXs=; 
 b=h5VG68z54R/PhZQhnWlBR9+5sGbiVX4WyOlCf5Wv0hn6rNA/58ZTxqdperxGSC87TpquYWkpIapHGLR0yB2DOpC8NnddUBi6Mq171vvfYxd8WS9ZrXgu3Vfnqn4boF9Sv2BhAzyeMEupLq3YO4u/ghyp0VIZ8ApoASBaopARYss=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1624315006933903.8888366297884;
 Mon, 21 Jun 2021 15:36:46 -0700 (PDT)
In-Reply-To: <20210621223217.3642303-1-iii@linux.ibm.com>
Subject: Re: [PATCH v4 0/2] target/s390x: Fix SIGILL psw.addr reporting
Message-ID: <162431500557.11343.6999709876160541303@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: iii@linux.ibm.com
Date: Mon, 21 Jun 2021 15:36:46 -0700 (PDT)
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
Cc: jonathan.albrecht@linux.vnet.ibm.com, iii@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYyMTIyMzIxNy4zNjQy
MzAzLTEtaWlpQGxpbnV4LmlibS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYyMTIyMzIxNy4zNjQy
MzAzLTEtaWlpQGxpbnV4LmlibS5jb20KU3ViamVjdDogW1BBVENIIHY0IDAvMl0gdGFyZ2V0L3Mz
OTB4OiBGaXggU0lHSUxMIHBzdy5hZGRyIHJlcG9ydGluZwoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0
b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1Qg
U0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4
ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0g
W3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDYxNDA4MzgwMC4xMTY2MTY2LTEtcmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwNjE0MDgzODAwLjExNjYxNjYt
MS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNo
ZXcvMjAyMTA2MjAyMTMyNDkuMTQ5NDI3NC0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcg
LT4gcGF0Y2hldy8yMDIxMDYyMDIxMzI0OS4xNDk0Mjc0LTEtcmljaGFyZC5oZW5kZXJzb25AbGlu
YXJvLm9yZwogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwNjIxMTUyMTIwLjQ0NjUt
MS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTA2MjExNTIxMjAuNDQ2NS0x
LWFsZXguYmVubmVlQGxpbmFyby5vcmcKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIx
MDYyMTIyMzIxNy4zNjQyMzAzLTEtaWlpQGxpbnV4LmlibS5jb20gLT4gcGF0Y2hldy8yMDIxMDYy
MTIyMzIxNy4zNjQyMzAzLTEtaWlpQGxpbnV4LmlibS5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJh
bmNoICd0ZXN0JwphNTFiZDI4IHRlc3RzL3RjZy9zMzkweDogVGVzdCBTSUdJTEwgYW5kIFNJR1NF
R1YgaGFuZGxpbmcKNzhlYTlmNyB0YXJnZXQvczM5MHg6IEZpeCBTSUdJTEwgcHN3LmFkZHIgcmVw
b3J0aW5nCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzIgQ2hlY2tpbmcgY29tbWl0IDc4ZWE5Zjc0
NGE2NCAodGFyZ2V0L3MzOTB4OiBGaXggU0lHSUxMIHBzdy5hZGRyIHJlcG9ydGluZykKMi8yIENo
ZWNraW5nIGNvbW1pdCBhNTFiZDI4MWE5YjkgKHRlc3RzL3RjZy9zMzkweDogVGVzdCBTSUdJTEwg
YW5kIFNJR1NFR1YgaGFuZGxpbmcpCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZp
bGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzI2OiAKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKCkVSUk9SOiBleHRlcm5zIHNob3VsZCBiZSBhdm9pZGVkIGluIC5jIGZpbGVzCiM0
NDogRklMRTogdGVzdHMvdGNnL3MzOTB4L3NpZ25hbC5jOjE0Ogordm9pZCBpbGxlZ2FsX29wKHZv
aWQpOwoKRVJST1I6IGV4dGVybnMgc2hvdWxkIGJlIGF2b2lkZWQgaW4gLmMgZmlsZXMKIzQ1OiBG
SUxFOiB0ZXN0cy90Y2cvczM5MHgvc2lnbmFsLmM6MTU6Cit2b2lkIGFmdGVyX2lsbGVnYWxfb3Ao
dm9pZCk7CgpFUlJPUjogZXh0ZXJucyBzaG91bGQgYmUgYXZvaWRlZCBpbiAuYyBmaWxlcwojNTE6
IEZJTEU6IHRlc3RzL3RjZy9zMzkweC9zaWduYWwuYzoyMToKK3ZvaWQgc3RnKHZvaWQgKmRzdCwg
dW5zaWduZWQgbG9uZyBzcmMpOwoKRVJST1I6IGV4dGVybnMgc2hvdWxkIGJlIGF2b2lkZWQgaW4g
LmMgZmlsZXMKIzU2OiBGSUxFOiB0ZXN0cy90Y2cvczM5MHgvc2lnbmFsLmM6MjY6Cit2b2lkIG12
Y184KHZvaWQgKmRzdCwgdm9pZCAqc3JjKTsKCnRvdGFsOiA0IGVycm9ycywgMSB3YXJuaW5ncywg
MTY5IGxpbmVzIGNoZWNrZWQKClBhdGNoIDIvMiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSBy
ZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0
IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoK
PT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA2
MjEyMjMyMTcuMzY0MjMwMy0xLWlpaUBsaW51eC5pYm0uY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/
dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hl
dyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBh
dGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

