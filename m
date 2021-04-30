Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A0D36F91B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:18:19 +0200 (CEST)
Received: from localhost ([::1]:55392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRA2-00066N-JA
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lcQWC-0002mp-66
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:37:08 -0400
Resent-Date: Fri, 30 Apr 2021 06:37:08 -0400
Resent-Message-Id: <E1lcQWC-0002mp-66@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lcQW8-0002Yk-3O
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:37:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619779011; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NmDTZBKAyojkbCUUSqwctBV4deZNRMyaas79icJjiXqVc8Wvekosau6j40g740U0y0HmuAXCcSvLfyKOZJvPEPQqDHoo1VssTH5v8XQVq1GX+bGbQY4FtyglvJbn/WL3cH4TrltQVzquHHu14NArvnw9cZRMNbEF+mNrDzHEOIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619779011;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=qOJg9Hdh3yVjLUXbhqVwiBpHlpxi4DvK9Ert1MO5EFE=; 
 b=Kyr8wFHo4xIx6iaDsIB+uxx3zZ+gCKe+gEeE5Kfis6HXEJfZsMvrPhZzIjrwVFdruG6BogLdyb0pkL2VrtI/zsbpnRIqfA7AWss777adsTsnzoG70u6kvERpPHEKw8qZUzvGwcW5QB5Vm1MgFl1rBClskdcavtuzfya80Oh6vW0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619779009513253.73518278514314;
 Fri, 30 Apr 2021 03:36:49 -0700 (PDT)
In-Reply-To: <20210430103305.28849-1-chenyi.qiang@intel.com>
Subject: Re: [PATCH v3] i386: Add ratelimit for bus locks acquired in guest
Message-ID: <161977900784.85.10789896867924189168@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: chenyi.qiang@intel.com
Date: Fri, 30 Apr 2021 03:36:49 -0700 (PDT)
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
Cc: ehabkost@redhat.com, xiaoyao.li@intel.com, mtosatti@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQzMDEwMzMwNS4yODg0
OS0xLWNoZW55aS5xaWFuZ0BpbnRlbC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDQzMDEwMzMwNS4y
ODg0OS0xLWNoZW55aS5xaWFuZ0BpbnRlbC5jb20KU3ViamVjdDogW1BBVENIIHYzXSBpMzg2OiBB
ZGQgcmF0ZWxpbWl0IGZvciBidXMgbG9ja3MgYWNxdWlyZWQgaW4gZ3Vlc3QKCj09PSBURVNUIFND
UklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxs
IHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdv
cml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4u
Cj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQx
ZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVj
dC9xZW11CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA0MTUxNjMzMDQuNDEyMDA1
Mi0xLXBoaWxtZEByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTA0MTUxNjMzMDQuNDEyMDA1Mi0x
LXBoaWxtZEByZWRoYXQuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA0MzAx
MDMzMDUuMjg4NDktMS1jaGVueWkucWlhbmdAaW50ZWwuY29tIC0+IHBhdGNoZXcvMjAyMTA0MzAx
MDMzMDUuMjg4NDktMS1jaGVueWkucWlhbmdAaW50ZWwuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJy
YW5jaCAndGVzdCcKYzFhMTgxMiBpMzg2OiBBZGQgcmF0ZWxpbWl0IGZvciBidXMgbG9ja3MgYWNx
dWlyZWQgaW4gZ3Vlc3QKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBsaW5lIG92ZXIgOTAg
Y2hhcmFjdGVycwojMTYyOiBGSUxFOiB0YXJnZXQvaTM4Ni9rdm0va3ZtLmM6MjI5MDoKKyAgICAg
ICAgICAgIHJhdGVsaW1pdF9zZXRfc3BlZWQoJng4Nm1zLT5idXNfbG9ja19yYXRlbGltaXRfY3Ry
bCwgeDg2bXMtPmJ1c19sb2NrX3JhdGVsaW1pdCwKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFy
YWN0ZXJzCiMxODA6IEZJTEU6IHRhcmdldC9pMzg2L2t2bS9rdm0uYzo0MjU1OgorICAgIHVpbnQ2
NF90IGRlbGF5X25zID0gcmF0ZWxpbWl0X2NhbGN1bGF0ZV9kZWxheSgmeDg2bXMtPmJ1c19sb2Nr
X3JhdGVsaW1pdF9jdHJsLCAxKTsKCnRvdGFsOiAxIGVycm9ycywgMSB3YXJuaW5ncywgMTM5IGxp
bmVzIGNoZWNrZWQKCkNvbW1pdCBjMWExODEyMmExYmUgKGkzODY6IEFkZCByYXRlbGltaXQgZm9y
IGJ1cyBsb2NrcyBhY3F1aXJlZCBpbiBndWVzdCkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2Ug
cmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9y
dCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4K
PT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA0
MzAxMDMzMDUuMjg4NDktMS1jaGVueWkucWlhbmdAaW50ZWwuY29tL3Rlc3RpbmcuY2hlY2twYXRj
aC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

