Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B1631FFC6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 21:26:17 +0100 (CET)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDCLw-0002yg-B9
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 15:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lDCKn-0002X3-Rg
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 15:25:05 -0500
Resent-Date: Fri, 19 Feb 2021 15:25:05 -0500
Resent-Message-Id: <E1lDCKn-0002X3-Rg@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lDCKl-0004fT-A9
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 15:25:05 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613766288; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KDzSBYqRmKUecZYYPQuYCEKCqCTOuGuuZii+dKr9t1mOn4xk4rxj3J5/twsSSZPF3P3u8aWpNmKdSz3XiwekG8VBnzX26Rj5/ZrcKu84tJZmb/DWlagB/fp7iNI58R1isbACrIPlptwyFlmP43dBBw3MXkrIAYDw28ud1vcBnNg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613766288;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=+XoIXNrNVRwnvZc/zzS9RJqfZ9920ZK6Aci0bUZdN+Q=; 
 b=EhTDzrqkmVVPlvbPgx/H0tirz+jFk//3nsAbcW+UQM69TCkqmrpTZytCbTy6NRMxXl2JiPbLAW4bGsTw1HG3vtZXQ9PfldZdwnlvYGxc1bEYSI/CoPKAUHE1VofhOZTrJvudr/pntAXRPr4An28h7J2mJJhDl2JVW+iMdUbgvgo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613766285029820.1323165488304;
 Fri, 19 Feb 2021 12:24:45 -0800 (PST)
In-Reply-To: <20210219201820.2672077-1-pcc@google.com>
Subject: Re: [PATCH] target/arm: Use TCF0 and TFSRE0 for unprivileged tag
 checks
Message-ID: <161376628332.6409.6467539725050962698@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2021 12:24:45 -0800 (PST)
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
Cc: peter.maydell@linaro.org, mitchp@google.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, serbanc@google.com, vincenzo.frascino@arm.com,
 pcc@google.com, eugenis@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxOTIwMTgyMC4yNjcy
MDc3LTEtcGNjQGdvb2dsZS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIxOTIwMTgyMC4yNjcyMDc3
LTEtcGNjQGdvb2dsZS5jb20KU3ViamVjdDogW1BBVENIXSB0YXJnZXQvYXJtOiBVc2UgVENGMCBh
bmQgVEZTUkUwIGZvciB1bnByaXZpbGVnZWQgdGFnIGNoZWNrcwoKPT09IFRFU1QgU0NSSVBUIEJF
R0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhp
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBo
aXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRF
U1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0
YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUK
ICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDIxOTIwMTgyMC4yNjcyMDc3LTEtcGNj
QGdvb2dsZS5jb20gLT4gcGF0Y2hldy8yMDIxMDIxOTIwMTgyMC4yNjcyMDc3LTEtcGNjQGdvb2ds
ZS5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo4YjMzNWMyIHRhcmdldC9hcm06
IFVzZSBUQ0YwIGFuZCBURlNSRTAgZm9yIHVucHJpdmlsZWdlZCB0YWcgY2hlY2tzCgo9PT0gT1VU
UFVUIEJFR0lOID09PQpFUlJPUjogQXV0aG9yIGVtYWlsIGFkZHJlc3MgaXMgbWFuZ2xlZCBieSB0
aGUgbWFpbGluZyBsaXN0CiMyOiAKQXV0aG9yOiBQZXRlciBDb2xsaW5nYm91cm5lIHZpYSA8cWVt
dS1kZXZlbEBub25nbnUub3JnPgoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAzNCBsaW5l
cyBjaGVja2VkCgpDb21taXQgOGIzMzVjMjUxYzAwICh0YXJnZXQvYXJtOiBVc2UgVENGMCBhbmQg
VEZTUkUwIGZvciB1bnByaXZpbGVnZWQgdGFnIGNoZWNrcykgaGFzIHN0eWxlIHByb2JsZW1zLCBw
bGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVz
IHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJ
TkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTog
MQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
MjAyMTAyMTkyMDE4MjAuMjY3MjA3Ny0xLXBjY0Bnb29nbGUuY29tL3Rlc3RpbmcuY2hlY2twYXRj
aC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

