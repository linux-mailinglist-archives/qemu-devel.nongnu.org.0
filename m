Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902F312208
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 07:42:35 +0100 (CET)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8dmE-0005O3-4a
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 01:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l8djg-0004jJ-PP; Sun, 07 Feb 2021 01:39:56 -0500
Resent-Date: Sun, 07 Feb 2021 01:39:56 -0500
Resent-Message-Id: <E1l8djg-0004jJ-PP@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l8djd-0000zX-Ed; Sun, 07 Feb 2021 01:39:55 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612679987; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lFNySMvHGhETWi14XuRcyLfIkPw6XG/ISO3q6N/4su9tga0Wgc9miKedZ97GjlsoOTA/0F5CbwtXyDWPe1iYB4ezJtfPL8nPyDo3QeL9eRXC6dJjpvGsyUTcco1BwINXx9bNLPwiDov5LRg3DsrnTUr4Gb4oloWB87RvXu9KAnU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612679987;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=xdDCURI6Tup4kBeFtixx7URTB9ESg/oQRMbfDbr+Cpk=; 
 b=QItEE8VjuP2mHB3ZXpY0z+0Nzyxmpc+lDDOO4J2/JpeWFIkQ5qD9S/lr2yplal6LhGtjefBBdmWvTFl6kXwOY3T1uSkAB2Q8HrqGXHZyJyefv2gy8B1Ta87IOtBSeRdW1zr2MJrDR1okwIpxdXtDd4f2qSD1HBST+pa9O34XTdY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 16126799847791004.2847488084357;
 Sat, 6 Feb 2021 22:39:44 -0800 (PST)
In-Reply-To: <20210207063304.15227-1-niteesh.gs@gmail.com>
Subject: Re: [PATCH] block/iscsi: Use lock guards
Message-ID: <161267998367.2182.10367100038583833395@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: niteesh.gs@gmail.com
Date: Sat, 6 Feb 2021 22:39:44 -0800 (PST)
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, niteesh.gs@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIwNzA2MzMwNC4xNTIy
Ny0xLW5pdGVlc2guZ3NAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAyMDcwNjMzMDQuMTUy
MjctMS1uaXRlZXNoLmdzQGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFUQ0hdIGJsb2NrL2lzY3NpOiBV
c2UgbG9jayBndWFyZHMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0
IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRh
dGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6
Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBh
dGNoZXcvMjAyMTAyMDcwNjMzMDQuMTUyMjctMS1uaXRlZXNoLmdzQGdtYWlsLmNvbSAtPiBwYXRj
aGV3LzIwMjEwMjA3MDYzMzA0LjE1MjI3LTEtbml0ZWVzaC5nc0BnbWFpbC5jb20KU3dpdGNoZWQg
dG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo3ZWE5NTdlIGJsb2NrL2lzY3NpOiBVc2UgbG9jayBndWFy
ZHMKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBNaXNzaW5nIFNpZ25lZC1vZmYtYnk6IGxp
bmUocykKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTgyIGxpbmVzIGNoZWNrZWQKCkNv
bW1pdCA3ZWE5NTdlZGFmN2UgKGJsb2NrL2lzY3NpOiBVc2UgbG9jayBndWFyZHMpIGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZh
bHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFU
Q0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRl
ZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRj
aGV3Lm9yZy9sb2dzLzIwMjEwMjA3MDYzMzA0LjE1MjI3LTEtbml0ZWVzaC5nc0BnbWFpbC5jb20v
dGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0
b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5k
IHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

