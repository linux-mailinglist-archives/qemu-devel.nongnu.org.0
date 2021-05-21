Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B9F38C5C0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:32:03 +0200 (CEST)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk3Nq-0001OQ-I9
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lk3N5-0000az-Pf; Fri, 21 May 2021 07:31:15 -0400
Resent-Date: Fri, 21 May 2021 07:31:15 -0400
Resent-Message-Id: <E1lk3N5-0000az-Pf@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lk3N3-0001lq-8V; Fri, 21 May 2021 07:31:15 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621596650; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MDiR1vjbRyQCvxvBPb79Ylg2k+IA9gvyTrdFJ4d9kZOFVNW8WkFBF5xhIkcFXcdQMGszLpup31rkM25fvkp08CeAi1tfBIqayXFeOHn1DlsYPUUer8gkD1K9TiLsLgHr3MZkR8iOo1pVSlTUs5TaifpL68pQYSo05JGTgDUVRIE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621596650;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=yS/dxVJ57Auy9JUlqlOJId5/MaMby0OJ/arCQbd2g/8=; 
 b=NZ2M5yu18ns34uZAajxamRmN+7hzweHN2IVwEawI2nOtLOH7xH6rQ3VUPPU6SrBloYvyuzHLKbgTjoOy06JH0Y7WWpM7+A1FtrJGIEPU1YAPwvxQkYgvd6HCMqVgwaaxKx8fl1uNkS80VLgnjG6Z8rIGLZdTyXhERwDClv0L624=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1621596647418477.3412831702029;
 Fri, 21 May 2021 04:30:47 -0700 (PDT)
In-Reply-To: <20210521111908.2843735-1-iii@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] target/s390x: Fix SIGILL psw.addr reporting
Message-ID: <162159664568.20339.14323427012740523410@0addf061776e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: iii@linux.ibm.com
Date: Fri, 21 May 2021 04:30:47 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
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
Cc: iii@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, qemu-devel@nongnu.org,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUyMTExMTkwOC4yODQz
NzM1LTEtaWlpQGxpbnV4LmlibS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDUyMTExMTkwOC4yODQz
NzM1LTEtaWlpQGxpbnV4LmlibS5jb20KU3ViamVjdDogW1BBVENIIHYyIDAvMl0gdGFyZ2V0L3Mz
OTB4OiBGaXggU0lHSUxMIHBzdy5hZGRyIHJlcG9ydGluZwoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0
b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1Qg
U0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4
ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICAg
MGI1YWNmOC4uZGE5MDc2ZiAgbWFzdGVyICAgICAtPiBtYXN0ZXIKICogW25ldyB0YWddICAgICAg
ICAgcGF0Y2hldy8yMDIxMDUyMTExMTkwOC4yODQzNzM1LTEtaWlpQGxpbnV4LmlibS5jb20gLT4g
cGF0Y2hldy8yMDIxMDUyMTExMTkwOC4yODQzNzM1LTEtaWlpQGxpbnV4LmlibS5jb20KU3dpdGNo
ZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwoxOTVmMzAzIHRlc3RzL3RjZy9zMzkweDogVGVzdCBT
SUdJTEwgaGFuZGxpbmcKMzdmNzM4OSB0YXJnZXQvczM5MHg6IEZpeCBTSUdJTEwgcHN3LmFkZHIg
cmVwb3J0aW5nCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzIgQ2hlY2tpbmcgY29tbWl0IDM3Zjcz
ODkxY2IyMiAodGFyZ2V0L3MzOTB4OiBGaXggU0lHSUxMIHBzdy5hZGRyIHJlcG9ydGluZykKMi8y
IENoZWNraW5nIGNvbW1pdCAxOTVmMzAzZjM2NmUgKHRlc3RzL3RjZy9zMzkweDogVGVzdCBTSUdJ
TEwgaGFuZGxpbmcpCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRv
ZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzI2OiAKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
CkVSUk9SOiBleHRlcm5zIHNob3VsZCBiZSBhdm9pZGVkIGluIC5jIGZpbGVzCiM0MzogRklMRTog
dGVzdHMvdGNnL3MzOTB4L3NpZ2lsbC5jOjEzOgordm9pZCBleHBlY3RlZF9zaV9hZGRyKHZvaWQp
OwoKRVJST1I6IGV4dGVybnMgc2hvdWxkIGJlIGF2b2lkZWQgaW4gLmMgZmlsZXMKIzQ0OiBGSUxF
OiB0ZXN0cy90Y2cvczM5MHgvc2lnaWxsLmM6MTQ6Cit2b2lkIGV4cGVjdGVkX3Bzd19hZGRyKHZv
aWQpOwoKdG90YWw6IDIgZXJyb3JzLCAxIHdhcm5pbmdzLCA1NiBsaW5lcyBjaGVja2VkCgpQYXRj
aCAyLzIgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVz
dCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxl
IGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwNTIxMTExOTA4LjI4NDM3MzUtMS1paWlA
bGludXguaWJtLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWls
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcv
XS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

