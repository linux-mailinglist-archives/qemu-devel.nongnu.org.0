Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA1033C7FC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:48:20 +0100 (CET)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLu8R-0000PV-6E
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLu6D-0007Bf-Cu
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:46:01 -0400
Resent-Date: Mon, 15 Mar 2021 16:46:01 -0400
Resent-Message-Id: <E1lLu6D-0007Bf-Cu@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLu69-0004GO-3B
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:46:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615841149; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jiAsso+jIckDee2ZdH1r7AgJ4AbMX9n/DiJ3hFUSVtaPEgRWjdtc7iBwjIVGPjMeqNMX64ER/cmcC3l++/rb5hi746M6BXtAtER+eyAv1/VMnsQFpIShUSl1vgfta48s+/jo7AGdiJWnR9zR5DHNq4mw3294IHJcT8ZWbUuLKb0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615841149;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=qpLhbRUj8yGBcVUjhwVGHKAfJ8TmrpSNrXfljZ2yHmo=; 
 b=QxfDiioRtSbdEF2aeKr8VlUYzZ5gjwoIDJquUpXBwg/2h2b6b2thsF/J/3ZwbhEO0snbSClGbjC/sBpIrgAC8tgtZrORYVz9P0ieuoL2841hjQYb7tEJsnzb4AxfkH9Wl72sAziBy67ajiWZYQlucsb3cnIvPyq8Rxfm5Hnc/mE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615841146797189.33692971851383;
 Mon, 15 Mar 2021 13:45:46 -0700 (PDT)
In-Reply-To: <20210315204004.2025219-1-richard.henderson@linaro.org>
Subject: Re: [PATCH] linux-user: Use signed lengths in uaccess.c
Message-ID: <161584114556.1754.10548561650837084421@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Mon, 15 Mar 2021 13:45:46 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNTIwNDAwNC4yMDI1
MjE5LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBz
ZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93
IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzE1
MjA0MDA0LjIwMjUyMTktMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN1YmplY3Q6IFtQ
QVRDSF0gbGludXgtdXNlcjogVXNlIHNpZ25lZCBsZW5ndGhzIGluIHVhY2Nlc3MuYwoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2
L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBi
YXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4Nzgy
MTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1w
cm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMxNTIwNDAwNC4y
MDI1MjE5LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwMzE1
MjA0MDA0LjIwMjUyMTktMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN3aXRjaGVkIHRv
IGEgbmV3IGJyYW5jaCAndGVzdCcKY2FiZDVjNCBsaW51eC11c2VyOiBVc2Ugc2lnbmVkIGxlbmd0
aHMgaW4gdWFjY2Vzcy5jCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogZXh0ZXJucyBzaG91
bGQgYmUgYXZvaWRlZCBpbiAuYyBmaWxlcwojNzc6IEZJTEU6IGxpbnV4LXVzZXIvdWFjY2Vzcy5j
OjI3Ogordm9pZCB1bmxvY2tfdXNlcih2b2lkICpob3N0X3B0ciwgYWJpX3Vsb25nIGd1ZXN0X2Fk
ZHIsIHNzaXplX3QgbGVuKTsKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgODEgbGluZXMg
Y2hlY2tlZAoKQ29tbWl0IGNhYmQ1YzQ5MzI4ZiAobGludXgtdXNlcjogVXNlIHNpZ25lZCBsZW5n
dGhzIGluIHVhY2Nlc3MuYykgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBF
TkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBp
cyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAzMTUyMDQwMDQuMjAy
NTIxOS0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcvdGVzdGluZy5jaGVja3BhdGNoLz90
eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3
IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0
Y2hldy1kZXZlbEByZWRoYXQuY29t

