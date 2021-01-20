Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A52FD2FD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:50:13 +0100 (CET)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EoG-0003Q0-2e
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l2EhL-0004TT-PI
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:43:03 -0500
Resent-Date: Wed, 20 Jan 2021 09:43:03 -0500
Resent-Message-Id: <E1l2EhL-0004TT-PI@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l2EhH-0004Db-3W
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:43:03 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1611153768; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=f43tvcjZxbWpLQ2xDdUDk2oZ01JgCmeEz7NVVgZThigYAXLXPlyjAd/ULuzsB2GQCiGuXQIl6Ydbksh6ATpkWJs+K7sWae3IUNerXBscy0vDg4p92gYAJkx6jKjPfZiDRNdWkfQj983ke6L1x+4Bu/vMGzVYg5JP1lSQJoYogAs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1611153768;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=VTK4zi/wcHyDUbiHucOR7j9VV+yE/TSmg97q6NhsJqs=; 
 b=ANBxCawFvV1wvxMMgM1/AE96+SMlaG0RZt2dnegLyryPPMxW01ivPpyGzdxdqUodxcxMBQI0YUe5pvlxO197ICzRq2IpFPpx+3AFUcT9hvO6Wz4NXvV1IgKxb50MQdxFH2uDvbAQcvVyoWooKD9bv3GQtwu1hBT7kdJaNcWqsi8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1611153764726871.5915317641994;
 Wed, 20 Jan 2021 06:42:44 -0800 (PST)
In-Reply-To: <20210120143706.345821-1-pbonzini@redhat.com>
Subject: Re: [PATCH] runstate: cleanup reboot and panic actions
Message-ID: <161115376340.2905.6563091440601131692@73fb1a5943b8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Wed, 20 Jan 2021 06:42:44 -0800 (PST)
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
Cc: alejandro.j.jimenez@oracle.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDEyMDE0MzcwNi4zNDU4
MjEtMS1wYm9uemluaUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAxMjAxNDM3MDYuMzQ1
ODIxLTEtcGJvbnppbmlAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0hdIHJ1bnN0YXRlOiBjbGVh
bnVwIHJlYm9vdCBhbmQgcGFuaWMgYWN0aW9ucwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0K
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBU
IEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMz
ODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1
cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDExODE3MDMwOC4yODI0NDItMS1waGlsbWRAcmVkaGF0
LmNvbSAtPiBwYXRjaGV3LzIwMjEwMTE4MTcwMzA4LjI4MjQ0Mi0xLXBoaWxtZEByZWRoYXQuY29t
CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAxMTkxNzU0MjcuMjA1MDczNy0xLWxh
dXJlbnRAdml2aWVyLmV1IC0+IHBhdGNoZXcvMjAyMTAxMTkxNzU0MjcuMjA1MDczNy0xLWxhdXJl
bnRAdml2aWVyLmV1CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAxMjAxMDI1NTYu
MTI1MDEyLTEtbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAxMjAx
MDI1NTYuMTI1MDEyLTEtbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tCiAtIFt0YWcgdXBkYXRl
XSAgICAgIHBhdGNoZXcvMjAyMTAxMjAxMDU0MDYuMTYzMDc0LTEtZGFuaWVsaGI0MTNAZ21haWwu
Y29tIC0+IHBhdGNoZXcvMjAyMTAxMjAxMDU0MDYuMTYzMDc0LTEtZGFuaWVsaGI0MTNAZ21haWwu
Y29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAxMjAxNDM3MDYuMzQ1ODIxLTEt
cGJvbnppbmlAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMTIwMTQzNzA2LjM0NTgyMS0xLXBi
b256aW5pQHJlZGhhdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwoyMDJlOTAy
IHJ1bnN0YXRlOiBjbGVhbnVwIHJlYm9vdCBhbmQgcGFuaWMgYWN0aW9ucwoKPT09IE9VVFBVVCBC
RUdJTiA9PT0KRVJST1I6IGxpbmUgb3ZlciA5MCBjaGFyYWN0ZXJzCiMxMTc6IEZJTEU6IHNvZnRt
bXUvcnVuc3RhdGUuYzo0Nzg6CisgICAgICAgIHx8IChwYW5pY19hY3Rpb24gPT0gUEFOSUNfQUNU
SU9OX1NIVVRET1dOICYmIHNodXRkb3duX2FjdGlvbiA9PSBTSFVURE9XTl9BQ1RJT05fUEFVU0Up
KSB7Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDgzIGxpbmVzIGNoZWNrZWQKCkNvbW1p
dCAyMDJlOTAyY2NjNDQgKHJ1bnN0YXRlOiBjbGVhbnVwIHJlYm9vdCBhbmQgcGFuaWMgYWN0aW9u
cykgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVy
cm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBz
ZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNv
bW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQK
aHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAxMjAxNDM3MDYuMzQ1ODIxLTEtcGJvbnppbmlA
cmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdl
bmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4K
UGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

