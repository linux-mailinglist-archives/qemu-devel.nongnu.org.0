Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36852C0A7A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 14:40:29 +0100 (CET)
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khC4y-0002fT-Sb
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 08:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1khBn8-0001J1-3H
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:22:02 -0500
Resent-Date: Mon, 23 Nov 2020 08:22:02 -0500
Resent-Message-Id: <E1khBn8-0001J1-3H@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1khBn3-0005JO-IM
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:22:01 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1606137703; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jggf1/EqbS+Q96AZ+GIH22fYZ6rz049V+CMvwj4EHPzkm2b63spL1LJeQlH1smX8SVnsyjpaL2g4NIp3BcPm+lIrnxJsQjUXLkROiTB+820AtUdRA5UvA5j+QzE7qhcWtk4dWD6PI/fIoITfNM75Rp2d6QHWyI7hNxEdIp3OHWQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1606137703;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=MfBim47ern8gH2cseaKXg9AUTrWz/1Jym8ZErZK4sGA=; 
 b=hge9Eiqyv5j5EWsRILfGM7WWNY/cbPcW5RIOEGB+s3YUs3WMX1aEOgIMJ2EBii7dVXTFlqlm9mJ134Bz47AgfisFgHIzUFxZBv9KirPEs1fnZuJLEMf7pTXqAd/Uecsw4kiIF+XUUwmYDyECjcubF/aQ11RbGk2BMTUJ3ynN/e8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1606137702194848.8540977513295;
 Mon, 23 Nov 2020 05:21:42 -0800 (PST)
In-Reply-To: <20201123131426.2725276-1-pbonzini@redhat.com>
Subject: Re: [PATCH] target/i386: fix operand order for PDEP and PEXT
Message-ID: <160613770083.15094.588414762773884511@9aeb27d8af94>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Mon, 23 Nov 2020 05:21:42 -0800 (PST)
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
Cc: blog@lenardszolnoki.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTEyMzEzMTQyNi4yNzI1
Mjc2LTEtcGJvbnppbmlAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMTIzMTMxNDI2LjI3
MjUyNzYtMS1wYm9uemluaUByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSF0gdGFyZ2V0L2kzODY6
IGZpeCBvcGVyYW5kIG9yZGVyIGZvciBQREVQIGFuZCBQRVhUCgo9PT0gVEVTVCBTQ1JJUFQgQkVH
SU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0
IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhp
c3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVT
VCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRi
ZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQog
ICA4Y2MzMGViLi42YWI2NGNjICBtYXN0ZXIgICAgIC0+IG1hc3RlcgogKiBbbmV3IHRhZ10gICAg
ICAgICBwYXRjaGV3LzIwMjAxMTIzMTMxNDI2LjI3MjUyNzYtMS1wYm9uemluaUByZWRoYXQuY29t
IC0+IHBhdGNoZXcvMjAyMDExMjMxMzE0MjYuMjcyNTI3Ni0xLXBib256aW5pQHJlZGhhdC5jb20K
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwplZTk0Njg5IHRhcmdldC9pMzg2OiBmaXgg
b3BlcmFuZCBvcmRlciBmb3IgUERFUCBhbmQgUEVYVAoKPT09IE9VVFBVVCBCRUdJTiA9PT0KV0FS
TklORzogQmxvY2sgY29tbWVudHMgdXNlIGEgbGVhZGluZyAvKiBvbiBhIHNlcGFyYXRlIGxpbmUK
IzI4OiBGSUxFOiB0YXJnZXQvaTM4Ni90cmFuc2xhdGUuYzozOTM5OgorICAgICAgICAgICAgICAg
IC8qIE5vdGUgdGhhdCBieSB6ZXJvLWV4dGVuZGluZyB0aGUgc291cmNlIG9wZXJhbmQsIHdlCgpX
QVJOSU5HOiBCbG9jayBjb21tZW50cyB1c2UgYSBsZWFkaW5nIC8qIG9uIGEgc2VwYXJhdGUgbGlu
ZQojNDU6IEZJTEU6IHRhcmdldC9pMzg2L3RyYW5zbGF0ZS5jOjM5NTc6CisgICAgICAgICAgICAg
ICAgLyogTm90ZSB0aGF0IGJ5IHplcm8tZXh0ZW5kaW5nIHRoZSBzb3VyY2Ugb3BlcmFuZCwgd2UK
CldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5F
UlMgbmVlZCB1cGRhdGluZz8KIzczOiAKbmV3IGZpbGUgbW9kZSAxMDA2NDQKCkVSUk9SOiBvcGVu
IGJyYWNlICd7JyBmb2xsb3dpbmcgZnVuY3Rpb24gZGVjbGFyYXRpb25zIGdvIG9uIHRoZSBuZXh0
IGxpbmUKIzgyOiBGSUxFOiB0ZXN0cy90Y2cvaTM4Ni90ZXN0LWkzODYtYm1pMi5jOjU6CitpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKSB7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hh
cmFjdGVycwojOTM6IEZJTEU6IHRlc3RzL3RjZy9pMzg2L3Rlc3QtaTM4Ni1ibWkyLmM6MTY6Cisg
ICAgYXNtIHZvbGF0aWxlICgicGRlcHEgICAlMiwgJTEsICUwIiA6ICI9ciIocmVzdWx0NjQpIDog
InIiKHJlc3VsdDY0KSwgIm0iKG1hc2spKTsKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0
ZXJzCiM5NjogRklMRTogdGVzdHMvdGNnL2kzODYvdGVzdC1pMzg2LWJtaTIuYzoxOToKKyAgICBh
c20gdm9sYXRpbGUgKCJwZXh0cSAgICUyLCAlMSwgJTAiIDogIj1yIihyZXN1bHQ2NCkgOiAiciIo
LTF1bGwpLCAibSIobWFzaykpOwoKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzk5
OiBGSUxFOiB0ZXN0cy90Y2cvaTM4Ni90ZXN0LWkzODYtYm1pMi5jOjIyOgorICAgIGFzbSB2b2xh
dGlsZSAoInBkZXBxICAgJTIsICUxLCAlMCIgOiAiPXIiKHJlc3VsdDY0KSA6ICJyIigtMXVsbCks
ICJtIihtYXNrKSk7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMTAzOiBGSUxF
OiB0ZXN0cy90Y2cvaTM4Ni90ZXN0LWkzODYtYm1pMi5jOjI2OgorICAgIGFzbSB2b2xhdGlsZSAo
InBleHRsICAgJTIsICVrMSwgJWswIiA6ICI9ciIocmVzdWx0MzIpIDogInIiKGVobG8pLCAibSIo
bWFzaykpOwoKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzEwNjogRklMRTogdGVz
dHMvdGNnL2kzODYvdGVzdC1pMzg2LWJtaTIuYzoyOToKKyAgICBhc20gdm9sYXRpbGUgKCJwZGVw
bCAgICUyLCAlazEsICVrMCIgOiAiPXIiKHJlc3VsdDMyKSA6ICJyIihyZXN1bHQzMiksICJtIiht
YXNrKSk7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMTA5OiBGSUxFOiB0ZXN0
cy90Y2cvaTM4Ni90ZXN0LWkzODYtYm1pMi5jOjMyOgorICAgIGFzbSB2b2xhdGlsZSAoInBleHRs
ICAgJTIsICVrMSwgJWswIiA6ICI9ciIocmVzdWx0MzIpIDogInIiKC0xdWxsKSwgIm0iKG1hc2sp
KTsKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMxMTI6IEZJTEU6IHRlc3RzL3Rj
Zy9pMzg2L3Rlc3QtaTM4Ni1ibWkyLmM6MzU6CisgICAgYXNtIHZvbGF0aWxlICgicGRlcGwgICAl
MiwgJWsxLCAlazAiIDogIj1yIihyZXN1bHQzMikgOiAiciIoLTF1bGwpLCAibSIobWFzaykpOwoK
dG90YWw6IDEgZXJyb3JzLCAxMCB3YXJuaW5ncywgODIgbGluZXMgY2hlY2tlZAoKQ29tbWl0IGVl
OTQ2ODliMjE2YiAodGFyZ2V0L2kzODY6IGZpeCBvcGVyYW5kIG9yZGVyIGZvciBQREVQIGFuZCBQ
RVhUKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2Ug
ZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIs
IHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3Qg
Y29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBh
dApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMTEyMzEzMTQyNi4yNzI1Mjc2LTEtcGJvbnpp
bmlAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWls
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcv
XS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

