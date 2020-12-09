Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6BF2D43F5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:09:14 +0100 (CET)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn09Z-0002Lo-Sy
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kn04x-0006xk-78; Wed, 09 Dec 2020 09:04:27 -0500
Resent-Date: Wed, 09 Dec 2020 09:04:27 -0500
Resent-Message-Id: <E1kn04x-0006xk-78@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kn04r-0003qG-3h; Wed, 09 Dec 2020 09:04:26 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607522626; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RPm+DMSbEEd2jr3T+SAQZlG38SaGkYVrWbaWkxrbG7QESZu0FtvOCRqX3gerCuFlqRfQ2CHbfPTMIduJUGWj9jUXdwYKeR2sqpkiA2/X5VSNwPe7/iVgrDMGdeaP9V+WlQM47gWhlfqz+zhVewpfvzlzTZ/XmVX1eDP9f7KVO0M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1607522626;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=uIRNabLJYmLGnjBN58vW2zH7o82+w4qAHA3gqjPHPQ8=; 
 b=gZxFmL1jGnz4bwJX0s8mAH3+U38S3Lch8UIrUTmChcaoTP/7hQSdZNkFF0lhDjs6Fbrkr2bszs25flhtpXpW3+lstl9tn58GaNQWfJ+gWLEY9T5cGqUFdKCTNZbiCZ21ygDLox+ImNeXqdQATcfbW30tPhCHPBv7l5V5cEOf5Js=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1607522622258357.1170122769913;
 Wed, 9 Dec 2020 06:03:42 -0800 (PST)
In-Reply-To: <20201209135355.561745-1-mlevitsk@redhat.com>
Subject: Re: [PATCH v2 0/5] SCSI: fix transfer limits for SCSI passthrough
Message-ID: <160752262015.25926.10971176014472074579@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: mlevitsk@redhat.com
Date: Wed, 9 Dec 2020 06:03:42 -0800 (PST)
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
Cc: fam@euphon.net, kwolf@redhat.com, stefanha@redhat.com,
 qemu-block@nongnu.org, pl@kamp.de, qemu-devel@nongnu.org, tom.ty89@gmail.com,
 mreitz@redhat.com, ronniesahlberg@gmail.com, pbonzini@redhat.com,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIwOTEzNTM1NS41NjE3
NDUtMS1tbGV2aXRza0ByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMDEyMDkxMzUzNTUuNTYx
NzQ1LTEtbWxldml0c2tAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjIgMC81XSBTQ1NJOiBm
aXggdHJhbnNmZXIgbGltaXRzIGZvciBTQ1NJIHBhc3N0aHJvdWdoCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBl
eGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGht
IGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0g
VEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdm
NDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVt
dQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAxMjA5MTM1MzU1LjU2MTc0NS0xLW1s
ZXZpdHNrQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIwMTIwOTEzNTM1NS41NjE3NDUtMS1tbGV2
aXRza0ByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKNzdjOTAwMCBi
bG9jay9zY3NpOiBjb3JyZWN0bHkgZW11bGF0ZSB0aGUgVlBEIGJsb2NrIGxpbWl0cyBwYWdlCjYx
ZjQ5ZTEgYmxvY2s6IHVzZSBibGtfZ2V0X21heF9pb2N0bF90cmFuc2ZlciBmb3IgU0NTSSBwYXNz
dGhyb3VnaAozNWM2NmQ2IGJsb2NrOiBhZGQgbWF4X2lvY3RsX3RyYW5zZmVyIHRvIEJsb2NrTGlt
aXRzCjA4YmEyNjMgZmlsZS1wb3NpeDogYWRkIHNnX2dldF9tYXhfc2VnbWVudHMgdGhhdCBhY3R1
YWxseSB3b3JrcyB3aXRoIHNnCmU5ZmQ3NDkgZmlsZS1wb3NpeDogc3BsaXQgaGRldl9yZWZyZXNo
X2xpbWl0cyBmcm9tIHJhd19yZWZyZXNoX2xpbWl0cwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS81
IENoZWNraW5nIGNvbW1pdCBlOWZkNzQ5ODA2MGMgKGZpbGUtcG9zaXg6IHNwbGl0IGhkZXZfcmVm
cmVzaF9saW1pdHMgZnJvbSByYXdfcmVmcmVzaF9saW1pdHMpCjIvNSBDaGVja2luZyBjb21taXQg
MDhiYTI2M2Y1NjVkIChmaWxlLXBvc2l4OiBhZGQgc2dfZ2V0X21heF9zZWdtZW50cyB0aGF0IGFj
dHVhbGx5IHdvcmtzIHdpdGggc2cpCjMvNSBDaGVja2luZyBjb21taXQgMzVjNjZkNjM2ZDgzIChi
bG9jazogYWRkIG1heF9pb2N0bF90cmFuc2ZlciB0byBCbG9ja0xpbWl0cykKNC81IENoZWNraW5n
IGNvbW1pdCA2MWY0OWUxYzk1M2IgKGJsb2NrOiB1c2UgYmxrX2dldF9tYXhfaW9jdGxfdHJhbnNm
ZXIgZm9yIFNDU0kgcGFzc3Rocm91Z2gpCjUvNSBDaGVja2luZyBjb21taXQgNzdjOTAwMGI3YzMw
IChibG9jay9zY3NpOiBjb3JyZWN0bHkgZW11bGF0ZSB0aGUgVlBEIGJsb2NrIGxpbWl0cyBwYWdl
KQpFUlJPUjogYnJhY2VzIHt9IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3Rh
dGVtZW50CiMzOTogRklMRTogaHcvc2NzaS9zY3NpLWdlbmVyaWMuYzoyMDQ6CisgICAgICAgICAg
ICBpZiAobGVuIDwgci0+YnVmbGVuKQpbLi4uXQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdz
LCAyOCBsaW5lcyBjaGVja2VkCgpQYXRjaCA1LzUgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2Ug
cmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9y
dCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4K
Cj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpU
aGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAx
MjA5MTM1MzU1LjU2MTc0NS0xLW1sZXZpdHNrQHJlZGhhdC5jb20vdGVzdGluZy5jaGVja3BhdGNo
Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRj
aGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8g
cGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

