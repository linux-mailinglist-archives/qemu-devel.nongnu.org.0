Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A98F2F9A24
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 07:53:06 +0100 (CET)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1OPR-0001mV-Im
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 01:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l1OD7-0003QV-At
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 01:40:21 -0500
Resent-Date: Mon, 18 Jan 2021 01:40:21 -0500
Resent-Message-Id: <E1l1OD7-0003QV-At@lists.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l1OCx-0007pe-Ab
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 01:40:20 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1610951985; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fhxGdGQx/sCr7GOrD1GHmB9Ir77kwlVJIrgdwB8GGEKQoYzXRBec8cFJHMTdTLeaAm6TyByMd4Nd33f/GQ0ExJ6v20PysLYeD6M7xSOXModI3o8WdWA5MV2OHMcc6J4sD/MeSdxM2+kEBoe3BKloN4JNKFjBq5E+rqJZNjFK7C0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1610951985;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=lC1t/JOfVc1cYxG6QuuR9x1oCnVGCVnBprYw7bLOo74=; 
 b=Q53gOM2OgGpQpQA6MK1L/9qjQd1OH5z3LI/5xkzUP9/FS36ZtIVnJU4QrteQPWEVMaYlXqlY3g8JHkvEMPuB7G34X2Yi+65fjsfOk3Y6Rl2A0ZAti0jVo8ezqe7pGqkFuS+/GHPXAowAQ+jp/2DbEAAp2xwtlERYQnokJbPX6kM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1610951984807668.8223867574773;
 Sun, 17 Jan 2021 22:39:44 -0800 (PST)
In-Reply-To: <20210118063229.442350-1-ppandit@redhat.com>
Subject: Re: [PATCH v2] ide: atapi: check logical block address and read size
 (CVE-2020-29443)
Message-ID: <161095198330.12958.15407181311584410519@73fb1a5943b8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ppandit@redhat.com
Date: Sun, 17 Jan 2021 22:39:44 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.54; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o54.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, pjp@fedoraproject.org, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, leonwxqian@gmail.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDExODA2MzIyOS40NDIz
NTAtMS1wcGFuZGl0QHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDExODA2MzIyOS40NDIz
NTAtMS1wcGFuZGl0QHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIHYyXSBpZGU6IGF0YXBpOiBj
aGVjayBsb2dpY2FsIGJsb2NrIGFkZHJlc3MgYW5kIHJlYWQgc2l6ZSAoQ1ZFLTIwMjAtMjk0NDMp
Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFz
ZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGlt
aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1h
aWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTlj
MjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9w
YXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMTE4
MDYzMjI5LjQ0MjM1MC0xLXBwYW5kaXRAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMTE4MDYz
MjI5LjQ0MjM1MC0xLXBwYW5kaXRAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2gg
J3Rlc3QnCjhmNTYwNDkgaWRlOiBhdGFwaTogY2hlY2sgbG9naWNhbCBibG9jayBhZGRyZXNzIGFu
ZCByZWFkIHNpemUgKENWRS0yMDIwLTI5NDQzKQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6
IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBvcGVuIHBhcmVudGhl
c2lzICcoJwojMjU6IEZJTEU6IGh3L2lkZS9hdGFwaS5jOjMyNToKKyAgICBhc3NlcnQgKDAgPD0g
bGJhICYmIGxiYSA8IChzLT5uYl9zZWN0b3JzID4+IDIpKTsKCkVSUk9SOiBzcGFjZSBwcm9oaWJp
dGVkIGJldHdlZW4gZnVuY3Rpb24gbmFtZSBhbmQgb3BlbiBwYXJlbnRoZXNpcyAnKCcKIzM0OiBG
SUxFOiBody9pZGUvYXRhcGkuYzo0MjU6CisgICAgYXNzZXJ0ICgwIDw9IGxiYSAmJiBsYmEgPCAo
cy0+bmJfc2VjdG9ycyA+PiAyKSk7Cgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3MsIDcxIGxp
bmVzIGNoZWNrZWQKCkNvbW1pdCA4ZjU2MDQ5MmMyMDQgKGlkZTogYXRhcGk6IGNoZWNrIGxvZ2lj
YWwgYmxvY2sgYWRkcmVzcyBhbmQgcmVhZCBzaXplIChDVkUtMjAyMC0yOTQ0MykpIGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZh
bHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFU
Q0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRl
ZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRj
aGV3Lm9yZy9sb2dzLzIwMjEwMTE4MDYzMjI5LjQ0MjM1MC0xLXBwYW5kaXRAcmVkaGF0LmNvbS90
ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRv
bWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQg
eW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

