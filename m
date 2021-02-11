Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8556318983
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:34:52 +0100 (CET)
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAFH-0003PF-Tt
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAADb-0002Zh-Io
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:33:07 -0500
Resent-Date: Thu, 11 Feb 2021 06:33:07 -0500
Resent-Message-Id: <E1lAADb-0002Zh-Io@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAADZ-0005h3-Be
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:33:07 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613043158; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HWAd5kDB+WAiyXVXlzChyBsd7Ppscnrq4Ms1UmD8VO2CyTC3Hn5AxTdsOEAOtPmxhtXYox3ylTJTveZ3O8v8XSy90BVBBhSnMGy19X0eQAU6oqdTeXLRlNG2yx9L9g7Yz8zHm2u668GwVbo9krbhOCM+he7dMi0rcw/2DBdioxo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613043158;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=mcBs35vN2bE5Gsl+qmsv6DNQ/fax7fBcDtqOVtpvipI=; 
 b=ZWjvbLvYiz5VvSKyq7yhntYobBvNJV3Rymc6Q0hm+f+cWkEjBjHYWw02R6NjH6z7pRM+L49UqLekH4xWkm3s6DmPY7S+R3H3F5jFAvIOS5N7UMtkQ0h3OD91q8A0il4IZiQFkljhoGkrs7sRjmHv6HSEdlUYoZrxtZkwZlNXwLM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613043155492232.14679360068214;
 Thu, 11 Feb 2021 03:32:35 -0800 (PST)
In-Reply-To: <20210210082650.5516-1-david.brenken@efs-auto.org>
Subject: Re: [PATCH 0/1] tricore: fixed faulty conditions for extr and imask
Message-ID: <161304315444.26113.16352778809807776331@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: david.brenken@efs-auto.org
Date: Thu, 11 Feb 2021 03:32:35 -0800 (PST)
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
Cc: kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 andreas.konopik@efs-auto.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxMDA4MjY1MC41NTE2
LTEtZGF2aWQuYnJlbmtlbkBlZnMtYXV0by5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMg
dG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IK
bW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIxMDA4MjY1
MC41NTE2LTEtZGF2aWQuYnJlbmtlbkBlZnMtYXV0by5vcmcKU3ViamVjdDogW1BBVENIIDAvMV0g
dHJpY29yZTogZml4ZWQgZmF1bHR5IGNvbmRpdGlvbnMgZm9yIGV4dHIgYW5kIGltYXNrCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9k
ZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNr
IGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3
ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3Qn
CjA1ZWFkNTggdHJpY29yZTogZml4ZWQgZmF1bHR5IGNvbmRpdGlvbnMgZm9yIGV4dHIgYW5kIGlt
YXNrCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0
aGF0ICctJyAoY3R4OlZ4VikKIzc4OiBGSUxFOiB0YXJnZXQvdHJpY29yZS90cmFuc2xhdGUuYzo4
MzEyOgorICAgICAgICB0Y2dfZ2VuX2FuZGlfdGwoY3B1X2dwcl9kW3I0XSwgY3B1X2dwcl9kW3I0
XSwgfjB1ID4+ICgzMi13aWR0aCkpOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCnRvdGFsOiAxIGVycm9ycywgMCB3YXJu
aW5ncywgNjAgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDA1ZWFkNTg2NjBkYiAodHJpY29yZTogZml4
ZWQgZmF1bHR5IGNvbmRpdGlvbnMgZm9yIGV4dHIgYW5kIGltYXNrKSBoYXMgc3R5bGUgcHJvYmxl
bXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3Np
dGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1B
SU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBj
b2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcv
bG9ncy8yMDIxMDIxMDA4MjY1MC41NTE2LTEtZGF2aWQuYnJlbmtlbkBlZnMtYXV0by5vcmcvdGVz
dGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21h
dGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlv
dXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

