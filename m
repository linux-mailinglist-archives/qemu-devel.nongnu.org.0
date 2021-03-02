Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6CC3296E3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:23:10 +0100 (CET)
Received: from localhost ([::1]:60436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH0JC-00018Y-0L
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lH0IC-0000i9-2T
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:22:08 -0500
Resent-Date: Tue, 02 Mar 2021 03:22:08 -0500
Resent-Message-Id: <E1lH0IC-0000i9-2T@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lH0I9-0005s7-DF
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:22:07 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614673309; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EJADQPBOXNCXq757gFCwjBpZwYe2bACfhcvP76Det6PnAssauKBopMzKmc+IP1btKNjxhN1PzKgqYyEgBlsioXDoBZ1u7EvHqPLOLB2byTcFSosK78n9zhqNBQXZoVhRoVij80yISgv2SQjqI3EDEniiZuUy9jOnpUMB7eO+NTs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614673309;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=9AGiCBUJvW3Eo0LRd+bCrrshuEPv+6gHI2BGzEG2nmk=; 
 b=VMzNY1WhnFs7whvc9wcs/QkSsEQNqa+hECVBZ7jGmhcgemzPdYoeH5wpfpo/2DY0FMKSOSosva4z3dTK/1kMjYT9jlrurAnHnt5AjhbfIITgWsW8VceXiEPVpDkPkeQUwN1IhuepIloZD18IZGmVY4PxQQ5eNWeQ/ppDL1u/ZFE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614673306343968.0510206373849;
 Tue, 2 Mar 2021 00:21:46 -0800 (PST)
In-Reply-To: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
Subject: Re: [RFC 0/1] Use dmabufs for display updates instead of pixman
Message-ID: <161467330351.13544.14308672043209482118@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vivek.kasireddy@intel.com
Date: Tue, 2 Mar 2021 00:21:46 -0800 (PST)
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
Cc: dongwon.kim@intel.com, daniel.vetter@ffwll.ch, vivek.kasireddy@intel.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMwMjA4MDM1OC4zMDk1
NzQ4LTEtdml2ZWsua2FzaXJlZGR5QGludGVsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVt
cyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZv
cgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzAyMDgw
MzU4LjMwOTU3NDgtMS12aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tClN1YmplY3Q6IFtSRkMgMC8x
XSBVc2UgZG1hYnVmcyBmb3IgZGlzcGxheSB1cGRhdGVzIGluc3RlYWQgb2YgcGl4bWFuCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9k
ZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNr
IGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3
ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3
LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMzAyMDgwMzU4
LjMwOTU3NDgtMS12aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tIC0+IHBhdGNoZXcvMjAyMTAzMDIw
ODAzNTguMzA5NTc0OC0xLXZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20KU3dpdGNoZWQgdG8gYSBu
ZXcgYnJhbmNoICd0ZXN0Jwo1NTA5NDQ3IHZpcnRpby1ncHU6IFVzZSBkbWFidWYgZm9yIGRpc3Bs
YXkgdXBkYXRlcyBpZiBwb3NzaWJsZSBpbnN0ZWFkIG9mIHBpeG1hbgoKPT09IE9VVFBVVCBCRUdJ
TiA9PT0KRVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBv
cGVuIHBhcmVudGhlc2lzICcoJwojNjU6IEZJTEU6IGh3L2Rpc3BsYXkvdmlydGlvLWdwdS5jOjU0
MToKKyAgICAgICAgICAgICAgICAgICAgICAgcmVzLT5pb3ZfY250ICogc2l6ZW9mIChzdHJ1Y3Qg
dWRtYWJ1Zl9jcmVhdGVfaXRlbSkpOwoKRVJST1I6IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5IGZv
ciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAojNjY6IEZJTEU6IGh3L2Rpc3BsYXkvdmlydGlv
LWdwdS5jOjU0MjoKKyAgICBpZiAoIWNyZWF0ZSkKWy4uLl0KCkVSUk9SOiBzcGFjZSByZXF1aXJl
ZCBhZnRlciB0aGF0ICcsJyAoY3R4OlZ4VikKIzkyOiBGSUxFOiBody9kaXNwbGF5L3ZpcnRpby1n
cHUuYzo1Njg6CisgICAgbW9kaWZpZXJfbG8gPSBmb3VyY2NfbW9kX2NvZGUoSU5URUwsSTkxNV9G
T1JNQVRfTU9EX1hfVElMRUQpICYgMHhGRkZGRkZGRjsKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF4KCkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxs
IGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzE4MjogRklMRTogaHcvZGlzcGxheS92aXJ0aW8tZ3B1
LmM6Njk5OgorICAgICAgICBpZiAoIXJldCkKWy4uLl0KCnRvdGFsOiA0IGVycm9ycywgMCB3YXJu
aW5ncywgMTk2IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCA1NTA5NDQ3MzdlMmEgKHZpcnRpby1ncHU6
IFVzZSBkbWFidWYgZm9yIGRpc3BsYXkgdXBkYXRlcyBpZiBwb3NzaWJsZSBpbnN0ZWFkIG9mIHBp
eG1hbikgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0
IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUg
YXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAzMDIwODAzNTguMzA5NTc0OC0xLXZpdmVr
Lmthc2lyZWRkeUBpbnRlbC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0t
LQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNo
ZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRo
YXQuY29t

