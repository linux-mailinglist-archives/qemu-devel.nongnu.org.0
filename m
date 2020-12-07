Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706E02D1927
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 20:14:44 +0100 (CET)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmLy4-00057F-E6
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 14:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kmLwO-0004YJ-Qu
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 14:12:56 -0500
Resent-Date: Mon, 07 Dec 2020 14:12:56 -0500
Resent-Message-Id: <E1kmLwO-0004YJ-Qu@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kmLwM-0007Ng-3k
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 14:12:56 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607368367; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jlr13Q/ex1pnmsr2TwVlyQcBcVhxkWS2HFSIPQ1nx+9DNBzSd3KR6/iFmt3Wxk6AoQBhqV/thE4E2f148VNqgpnhiIRA7bmwLq5BbUlIkbswTpir/1R1xDpKN+jS8oZZoSru7FvNKOR3YobixlMRrC0PTpsIYBylFUF24dvdkiA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1607368367;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=A33ZpWiz81sdrF0nkW/CM79igorRRGyaG4CJ5ZQV4oM=; 
 b=KmoTYFoEPQGExIrJc2flhwb2CcVGP+pAadcCupi6HGlDeN3j3JDm7YXeDkXVJ4j0YFdsdVnt/bnDtOrYuC0tWvU1TNX477pR1a8EgqxR7efS52Wg5Tx0Ysiu9brJahZfZOuRefHqJCOfQpns94k8B3qua0I42J7FSQwv71dr5b0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1607368363719490.9908466675564;
 Mon, 7 Dec 2020 11:12:43 -0800 (PST)
In-Reply-To: <20201207183021.22752-1-vgoyal@redhat.com>
Subject: Re: [PATCH 0/3] virtiofsd: Fix lo_flush() and inode->posix_lock init
Message-ID: <160736836218.30250.12305333017578341080@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vgoyal@redhat.com
Date: Mon, 7 Dec 2020 11:12:43 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
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
Cc: mszeredi@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 virtio-fs@redhat.com, stefanha@redhat.com, lersek@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIwNzE4MzAyMS4yMjc1
Mi0xLXZnb3lhbEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMDEyMDcxODMwMjEuMjI3NTIt
MS12Z295YWxAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggMC8zXSB2aXJ0aW9mc2Q6IEZpeCBs
b19mbHVzaCgpIGFuZCBpbm9kZS0+cG9zaXhfbG9jayBpbml0Cgo9PT0gVEVTVCBTQ1JJUFQgQkVH
SU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0
IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhp
c3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVT
VCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRi
ZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQog
KiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAxMjA3MTgzMDIxLjIyNzUyLTEtdmdveWFs
QHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIwMTIwNzE4MzAyMS4yMjc1Mi0xLXZnb3lhbEByZWRo
YXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKODZmM2JiMSB2aXJ0aW9mc2Q6
IENoZWNrIGZpbGUgdHlwZSBpbiBsb19mbHVzaCgpCjkyYTVjOWQgdmlydGlvZnNkOiBEaXNhYmxl
IHBvc2l4X2xvY2sgaGFzaCB0YWJsZSBpZiByZW1vdGUgbG9ja3MgYXJlIG5vdCBlbmFibGVkCmZi
ZGNhZjEgdmlydGlvZnNkOiBTZXQgdXAgcG9zaXhfbG9jayBoYXNoIHRhYmxlIGZvciByb290IGlu
b2RlCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzMgQ2hlY2tpbmcgY29tbWl0IGZiZGNhZjE3MmFl
ZCAodmlydGlvZnNkOiBTZXQgdXAgcG9zaXhfbG9jayBoYXNoIHRhYmxlIGZvciByb290IGlub2Rl
KQpFUlJPUjogc3VzcGVjdCBjb2RlIGluZGVudCBmb3IgY29uZGl0aW9uYWwgc3RhdGVtZW50cyAo
NCwgNykKIzQwOiBGSUxFOiB0b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hfbGwuYzozNDAxOgor
ICAgIGlmIChsby0+cm9vdC5wb3NpeF9sb2NrcykKKyAgICAgICBnX2hhc2hfdGFibGVfZGVzdHJv
eShsby0+cm9vdC5wb3NpeF9sb2Nrcyk7CgpFUlJPUjogYnJhY2VzIHt9IGFyZSBuZWNlc3Nhcnkg
Zm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50CiM0MDogRklMRTogdG9vbHMvdmlydGlvZnNk
L3Bhc3N0aHJvdWdoX2xsLmM6MzQwMToKKyAgICBpZiAobG8tPnJvb3QucG9zaXhfbG9ja3MpClsu
Li5dCgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3MsIDE5IGxpbmVzIGNoZWNrZWQKClBhdGNo
IDEvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2Ug
ZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIs
IHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMi8zIENoZWNraW5nIGNvbW1pdCA5MmE1
YzlkMzVjN2QgKHZpcnRpb2ZzZDogRGlzYWJsZSBwb3NpeF9sb2NrIGhhc2ggdGFibGUgaWYgcmVt
b3RlIGxvY2tzIGFyZSBub3QgZW5hYmxlZCkKMy8zIENoZWNraW5nIGNvbW1pdCA4NmYzYmIxY2Y1
YjggKHZpcnRpb2ZzZDogQ2hlY2sgZmlsZSB0eXBlIGluIGxvX2ZsdXNoKCkpCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cg
aXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAxMjA3MTgzMDIxLjIy
NzUyLTEtdmdveWFsQHJlZGhhdC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2Uu
Ci0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3Bh
dGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBy
ZWRoYXQuY29t

