Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44932E7D6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 13:23:22 +0100 (CET)
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI9UH-0003C1-S1
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 07:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lI9TD-0002ZV-D6; Fri, 05 Mar 2021 07:22:15 -0500
Resent-Date: Fri, 05 Mar 2021 07:22:15 -0500
Resent-Message-Id: <E1lI9TD-0002ZV-D6@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lI9TB-00062B-14; Fri, 05 Mar 2021 07:22:15 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614946908; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HKsh0JKhBYUFSxaSMlDCX/d7BzDDh+v+X2Ai/9uMKBN8/Q+gmKdXZ4v0hBcI3drcvuuyZpwSKN8ZwmvJizFA75MbmSi5YerRwhckuvyltcszUhA7uvbqBV6xUj93OPHsduYk0bMoFyE64gSyrHzB9F0pUwv2B0Hc/w4/RA1J4Sg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614946908;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=gbxlyZp56lWETH6yEIuP7i0WvmWDM8yoOdNnTh/AT8k=; 
 b=HARwdSsrcYLlC3G6m+RPV5gbdDMJ2Ze1HC8WZRBA102n8el++LVdRXzsI9rJFyIP8OUesg/PFdBe0kgzWmGvfyq7DnUxFB/YFAjyUR3C0DT55d43hMvdsl/Tu95eK/GVAG7nyj6/vD7tsd5FLjkjNJPOeP/a8h5XFuyt83Cuea8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614946905285613.9165312123315;
 Fri, 5 Mar 2021 04:21:45 -0800 (PST)
In-Reply-To: <20210305121748.65173-1-akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] block/file-posix: Optimize for macOS
Message-ID: <161494690342.7069.17808818329866585438@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: akihiko.odaki@gmail.com
Date: Fri, 5 Mar 2021 04:21:45 -0800 (PST)
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
Cc: kwolf@redhat.com, fam@euphon.net, pkrempa@redhat.com, stefanha@redhat.com,
 qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mail@knazarov.com, akihiko.odaki@gmail.com, mreitz@redhat.com,
 jsnow@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMwNTEyMTc0OC42NTE3
My0xLWFraWhpa28ub2Rha2lAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMDUxMjE3NDgu
NjUxNzMtMS1ha2loaWtvLm9kYWtpQGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjJdIGJsb2Nr
L2ZpbGUtcG9zaXg6IE9wdGltaXplIGZvciBtYWNPUwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09
PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dy
YW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NS
SVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3
MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25l
dyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMwNTEyMTc0OC42NTE3My0xLWFraWhpa28ub2Rh
a2lAZ21haWwuY29tIC0+IHBhdGNoZXcvMjAyMTAzMDUxMjE3NDguNjUxNzMtMS1ha2loaWtvLm9k
YWtpQGdtYWlsLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjE2YjYzOWEgYmxv
Y2svZmlsZS1wb3NpeDogT3B0aW1pemUgZm9yIG1hY09TCgo9PT0gT1VUUFVUIEJFR0lOID09PQpX
QVJOSU5HOiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgZGVmaW5lcyBzaG91bGQgYmUgYXZvaWRlZAoj
OTU6IEZJTEU6IGJsb2NrL2ZpbGUtcG9zaXguYzoyMTMzOgorI2lmIGRlZmluZWQoX19BUFBMRV9f
KSAmJiAoX19NQUNIX18pCgpFUlJPUjogc3VzcGVjdCBjb2RlIGluZGVudCBmb3IgY29uZGl0aW9u
YWwgc3RhdGVtZW50cyAoOCwgMTEpCiMxNjg6IEZJTEU6IGh3L2Jsb2NrL2Jsb2NrLmM6NzM6Cisg
ICAgICAgIGlmICghYmFja2VuZF9yZXQgJiYgYmxvY2tzaXplcy5waHlzKSB7CiAgICAgICAgICAg
IGNvbmYtPnBoeXNpY2FsX2Jsb2NrX3NpemUgPSBibG9ja3NpemVzLnBoeXM7Cgp0b3RhbDogMSBl
cnJvcnMsIDEgd2FybmluZ3MsIDE0NSBsaW5lcyBjaGVja2VkCgpDb21taXQgMTZiNjM5YTgxYzQ1
IChibG9jay9maWxlLXBvc2l4OiBPcHRpbWl6ZSBmb3IgbWFjT1MpIGhhcyBzdHlsZSBwcm9ibGVt
cywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0
aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJ
TlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNv
ZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9s
b2dzLzIwMjEwMzA1MTIxNzQ4LjY1MTczLTEtYWtpaGlrby5vZGFraUBnbWFpbC5jb20vdGVzdGlu
Zy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

