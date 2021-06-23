Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724773B11E0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 04:44:32 +0200 (CEST)
Received: from localhost ([::1]:56686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvssR-00036P-Go
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 22:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvsrB-0001iD-AJ; Tue, 22 Jun 2021 22:43:13 -0400
Resent-Date: Tue, 22 Jun 2021 22:43:13 -0400
Resent-Message-Id: <E1lvsrB-0001iD-AJ@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvsr8-0005cr-O4; Tue, 22 Jun 2021 22:43:12 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624416173; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=K8PDu8002KmGHkDi+uhy3vn4UhJssfFyVAMDvbtU4slIR4X7GF0HYEuTm7W07ycbTJrGJSlq6Ck3kCXM382xzkJvLcdhYCs+zfH8u+PZoziFKkrJpmt1IRWqfnpiXrqyTK/lMZzDYHNhUYEdQmSWLYWlwJzb1R5ndSuYd/2g5xY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624416173;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=knqXD5Ou3fJVlK+bByKjXozBag95+k59w4sIbux65U4=; 
 b=PNMEayDw6/9IpFpy4/PMAqF8zNlHjw5jf8y7G6MyUFwdVzyMDnQPQC74ldVSCsdpTDfAF9RmN+AcwgAIO1hvRo9vB5S0VxQs/u+OB7KQDpFEt6MpTEDAQp0pGekYm0sMXYapSv3HCqB44WT0IuY4BxBi+wLb+XyNRl8+rkkCEWk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1624416169726647.3164825295956;
 Tue, 22 Jun 2021 19:42:49 -0700 (PDT)
In-Reply-To: <20210623023250.3667563-1-iii@linux.ibm.com>
Subject: Re: [PATCH v5 0/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
Message-ID: <162441616846.28910.6846220658809436841@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: iii@linux.ibm.com
Date: Tue, 22 Jun 2021 19:42:49 -0700 (PDT)
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
 qemu-devel@nongnu.org, ulrich.weigand@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYyMzAyMzI1MC4zNjY3
NTYzLTEtaWlpQGxpbnV4LmlibS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYyMzAyMzI1MC4zNjY3
NTYzLTEtaWlpQGxpbnV4LmlibS5jb20KU3ViamVjdDogW1BBVENIIHY1IDAvMl0gdGFyZ2V0L3Mz
OTB4OiBGaXggU0lHSUxML1NJR0ZQRS9TSUdUUkFQIHBzdy5hZGRyIHJlcG9ydGluZwoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2
L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBi
YXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4Nzgy
MTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1w
cm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDYyMTE0MTQ1Mi4y
MDQ1LTEtam9uYXRoYW4uYWxicmVjaHRAbGludXgudm5ldC5pYm0uY29tIC0+IHBhdGNoZXcvMjAy
MTA2MjExNDE0NTIuMjA0NS0xLWpvbmF0aGFuLmFsYnJlY2h0QGxpbnV4LnZuZXQuaWJtLmNvbQog
KiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwNjIzMDIzMjUwLjM2Njc1NjMtMS1paWlA
bGludXguaWJtLmNvbSAtPiBwYXRjaGV3LzIwMjEwNjIzMDIzMjUwLjM2Njc1NjMtMS1paWlAbGlu
dXguaWJtLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjU2YmM0ZjMgdGVzdHMv
dGNnL3MzOTB4OiBUZXN0IFNJR0lMTCBhbmQgU0lHU0VHViBoYW5kbGluZwpiNmI2ZDM5IHRhcmdl
dC9zMzkweDogRml4IFNJR0lMTC9TSUdGUEUvU0lHVFJBUCBwc3cuYWRkciByZXBvcnRpbmcKCj09
PSBPVVRQVVQgQkVHSU4gPT09CjEvMiBDaGVja2luZyBjb21taXQgYjZiNmQzOTc4NDU2ICh0YXJn
ZXQvczM5MHg6IEZpeCBTSUdJTEwvU0lHRlBFL1NJR1RSQVAgcHN3LmFkZHIgcmVwb3J0aW5nKQoy
LzIgQ2hlY2tpbmcgY29tbWl0IDU2YmM0ZjNiYjg5MyAodGVzdHMvdGNnL3MzOTB4OiBUZXN0IFNJ
R0lMTCBhbmQgU0lHU0VHViBoYW5kbGluZykKV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0
ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojMjY6IApuZXcgZmls
ZSBtb2RlIDEwMDY0NAoKRVJST1I6IGV4dGVybnMgc2hvdWxkIGJlIGF2b2lkZWQgaW4gLmMgZmls
ZXMKIzQ0OiBGSUxFOiB0ZXN0cy90Y2cvczM5MHgvc2lnbmFsLmM6MTQ6Cit2b2lkIGlsbGVnYWxf
b3Aodm9pZCk7CgpFUlJPUjogZXh0ZXJucyBzaG91bGQgYmUgYXZvaWRlZCBpbiAuYyBmaWxlcwoj
NDU6IEZJTEU6IHRlc3RzL3RjZy9zMzkweC9zaWduYWwuYzoxNToKK3ZvaWQgYWZ0ZXJfaWxsZWdh
bF9vcCh2b2lkKTsKCkVSUk9SOiBleHRlcm5zIHNob3VsZCBiZSBhdm9pZGVkIGluIC5jIGZpbGVz
CiM1MTogRklMRTogdGVzdHMvdGNnL3MzOTB4L3NpZ25hbC5jOjIxOgordm9pZCBzdGcodm9pZCAq
ZHN0LCB1bnNpZ25lZCBsb25nIHNyYyk7CgpFUlJPUjogZXh0ZXJucyBzaG91bGQgYmUgYXZvaWRl
ZCBpbiAuYyBmaWxlcwojNTY6IEZJTEU6IHRlc3RzL3RjZy9zMzkweC9zaWduYWwuYzoyNjoKK3Zv
aWQgbXZjXzgodm9pZCAqZHN0LCB2b2lkICpzcmMpOwoKdG90YWw6IDQgZXJyb3JzLCAxIHdhcm5p
bmdzLCAxNjkgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMi8yIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxl
YXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyBy
ZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5F
UlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAx
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8y
MDIxMDYyMzAyMzI1MC4zNjY3NTYzLTEtaWlpQGxpbnV4LmlibS5jb20vdGVzdGluZy5jaGVja3Bh
dGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQ
YXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sg
dG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

