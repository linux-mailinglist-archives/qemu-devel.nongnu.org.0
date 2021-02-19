Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA38431F61F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:59:30 +0100 (CET)
Received: from localhost ([::1]:55438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD1dJ-0001Xc-VC
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lD1c0-0000hg-QB; Fri, 19 Feb 2021 03:58:08 -0500
Resent-Date: Fri, 19 Feb 2021 03:58:08 -0500
Resent-Message-Id: <E1lD1c0-0000hg-QB@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lD1bw-0003Su-8x; Fri, 19 Feb 2021 03:58:08 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613725068; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HrEy/Yi0XUisPuQ4atN6uOXJ5X2ZLwQ6TFv+2UqEb9nCAyq8AVJv0ioTWic61F6DhCyDbQcaqIQkyxSzsKffkn2MBw/ctvUEhzsOwJ+AtU07Kx9zYt4YqgugcuqLweaSM1cz2a5b7gpJx7A29HrFOCfnsu4qQA//a9fpPAevk3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613725068;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=EGv8loOoJUCgbraPyX+CMzVF8DK9zdx3i/DNGSzrnes=; 
 b=hOhSPLU/u1zJG15VDBpEZ1kB1plB3x6YHBq1ZnFT0//kqUsbGVf7BLMWy0TeSUHo11ycn9sBffhsKvrv5UMwEAQ7fX98FX7PXnl6DLN1WJFXL16sI6/Rs1077MeQYCMmiFR9iM8WC+vGRj1fgPSqsLCVonDVvSTf1cIGMIGtYjA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 16137250646311011.6981719691521;
 Fri, 19 Feb 2021 00:57:44 -0800 (PST)
In-Reply-To: <20210219085148.90545-1-akihiko.odaki@gmail.com>
Subject: Re: [PATCH] block/file-posix: Optimize for macOS
Message-ID: <161372506311.28087.13124339498578973939@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: akihiko.odaki@gmail.com
Date: Fri, 19 Feb 2021 00:57:44 -0800 (PST)
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
Cc: kwolf@redhat.com, fam@euphon.net, stefanha@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 akihiko.odaki@gmail.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxOTA4NTE0OC45MDU0
NS0xLWFraWhpa28ub2Rha2lAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAyMTkwODUxNDgu
OTA1NDUtMS1ha2loaWtvLm9kYWtpQGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFUQ0hdIGJsb2NrL2Zp
bGUtcG9zaXg6IE9wdGltaXplIGZvciBtYWNPUwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0K
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBU
IEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMz
ODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0
YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDIxOTA4NTE0OC45MDU0NS0xLWFraWhpa28ub2Rha2lA
Z21haWwuY29tIC0+IHBhdGNoZXcvMjAyMTAyMTkwODUxNDguOTA1NDUtMS1ha2loaWtvLm9kYWtp
QGdtYWlsLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjQ1NWI0YTMgYmxvY2sv
ZmlsZS1wb3NpeDogT3B0aW1pemUgZm9yIG1hY09TCgo9PT0gT1VUUFVUIEJFR0lOID09PQpXQVJO
SU5HOiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgZGVmaW5lcyBzaG91bGQgYmUgYXZvaWRlZAojOTA6
IEZJTEU6IGJsb2NrL2ZpbGUtcG9zaXguYzoyMTMzOgorI2lmIGRlZmluZWQoX19BUFBMRV9fKSAm
JiAoX19NQUNIX18pCgpFUlJPUjogc3VzcGVjdCBjb2RlIGluZGVudCBmb3IgY29uZGl0aW9uYWwg
c3RhdGVtZW50cyAoOCwgMTEpCiMxNDE6IEZJTEU6IGh3L2Jsb2NrL2Jsb2NrLmM6NzM6CisgICAg
ICAgIGlmICghYmFja2VuZF9yZXQgJiYgYmxvY2tzaXplcy5waHlzKSB7CiAgICAgICAgICAgIGNv
bmYtPnBoeXNpY2FsX2Jsb2NrX3NpemUgPSBibG9ja3NpemVzLnBoeXM7Cgp0b3RhbDogMSBlcnJv
cnMsIDEgd2FybmluZ3MsIDEyOSBsaW5lcyBjaGVja2VkCgpDb21taXQgNDU1YjRhMzI4ODIxIChi
bG9jay9maWxlLXBvc2l4OiBPcHRpbWl6ZSBmb3IgbWFjT1MpIGhhcyBzdHlsZSBwcm9ibGVtcywg
cGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZl
cyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRB
SU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6
IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dz
LzIwMjEwMjE5MDg1MTQ4LjkwNTQ1LTEtYWtpaGlrby5vZGFraUBnbWFpbC5jb20vdGVzdGluZy5j
aGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxs
eSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVl
ZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

