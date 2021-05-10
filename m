Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EAF3780EE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:12:28 +0200 (CEST)
Received: from localhost ([::1]:33794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2tm-0002tY-0F
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lg2sa-0001ao-Iq
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:11:12 -0400
Resent-Date: Mon, 10 May 2021 06:11:12 -0400
Resent-Message-Id: <E1lg2sa-0001ao-Iq@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lg2sW-0005x9-7N
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:11:12 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620641454; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YjhMk/rXJP3HJwaU/DBgk+XOLfA/38shjxBrGBgcxMKVeHwq8Ft+7JHNKZJ6ADQLsLs/XHxKvjEqJGHJVPcKVqxTC54swajR47hxsGmvQYl5nqxeW5ZxPnmzMJ9J0GA8momT6XJRuzkGqtdth5ArBetvFbqrsxKIcZhOAirRXGI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620641454;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Yf2Zvm+9OXh+fbQ86JlzD8+ghmdxCKQzzgL0kzCcGts=; 
 b=eAl1ZIqfImLUKOF6lh3tY3oj1RvBugR4QLXe4Ku/zo5v9mLtp6Kj+ZQyHvPYX8fhgkS4Bpq5u5muBdGLxiawIwoLMjtfTX2AN1EeUQdxWzRjYzoZ55FCKgqgLnXbfVTtrAVTjmz2kSxTxG0vLhKlzlv4Nti9vmdknKpxZ40Te3I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 16206414522221012.1960907550559;
 Mon, 10 May 2021 03:10:52 -0700 (PDT)
In-Reply-To: <20210510095708.950474-1-wangjie88@huawei.com>
Subject: Re: [PATCH] util: fix fd leak in qemu_write_pidfile()
Message-ID: <162064145112.20601.9103581419741535925@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: wangjie88@huawei.com
Date: Mon, 10 May 2021 03:10:52 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: wangxinxin.wang@huawei.com, qemu-devel@nongnu.org, wangjie88@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUxMDA5NTcwOC45NTA0
NzQtMS13YW5namllODhAaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTEwMDk1NzA4Ljk1
MDQ3NC0xLXdhbmdqaWU4OEBodWF3ZWkuY29tClN1YmplY3Q6IFtQQVRDSF0gdXRpbDogZml4IGZk
IGxlYWsgaW4gcWVtdV93cml0ZV9waWRmaWxlKCkKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFt
Ci4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEz
Mzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcg
dXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA0MTMxMjU1MzMuMjE3NDQwLTEtcGJvbnppbmlAcmVk
aGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwNDEzMTI1NTMzLjIxNzQ0MC0xLXBib256aW5pQHJlZGhh
dC5jb20KIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDUwODAxNDgwMi44OTI1NjEt
MS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTA1MDgwMTQ4MDIu
ODkyNTYxLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwogKiBbbmV3IHRhZ10gICAgICAg
ICBwYXRjaGV3LzIwMjEwNTEwMDk1NzA4Ljk1MDQ3NC0xLXdhbmdqaWU4OEBodWF3ZWkuY29tIC0+
IHBhdGNoZXcvMjAyMTA1MTAwOTU3MDguOTUwNDc0LTEtd2FuZ2ppZTg4QGh1YXdlaS5jb20KQXV0
byBwYWNraW5nIHRoZSByZXBvc2l0b3J5IGZvciBvcHRpbXVtIHBlcmZvcm1hbmNlLiBZb3UgbWF5
IGFsc28KcnVuICJnaXQgZ2MiIG1hbnVhbGx5LiBTZWUgImdpdCBoZWxwIGdjIiBmb3IgbW9yZSBp
bmZvcm1hdGlvbi4KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwplNWQ4MjFlIHV0aWw6
IGZpeCBmZCBsZWFrIGluIHFlbXVfd3JpdGVfcGlkZmlsZSgpCgo9PT0gT1VUUFVUIEJFR0lOID09
PQpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiMyNDogRklMRTogdXRp
bC9vc2xpYi1wb3NpeC5jOjEzNDoKK15JdW5saW5rKHBhdGgpOyQKCnRvdGFsOiAxIGVycm9ycywg
MCB3YXJuaW5ncywgNyBsaW5lcyBjaGVja2VkCgpDb21taXQgZTVkODIxZTZlY2EyICh1dGlsOiBm
aXggZmQgbGVhayBpbiBxZW11X3dyaXRlX3BpZGZpbGUoKSkgaGFzIHN0eWxlIHByb2JsZW1zLCBw
bGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVz
IHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJ
TkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTog
MQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
MjAyMTA1MTAwOTU3MDguOTUwNDc0LTEtd2FuZ2ppZTg4QGh1YXdlaS5jb20vdGVzdGluZy5jaGVj
a3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBi
eSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJh
Y2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

