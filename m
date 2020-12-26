Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CB62E2EA8
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 17:41:41 +0100 (CET)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktCdQ-0002rE-4w
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 11:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ktCcP-0002KB-1p; Sat, 26 Dec 2020 11:40:37 -0500
Resent-Date: Sat, 26 Dec 2020 11:40:37 -0500
Resent-Message-Id: <E1ktCcP-0002KB-1p@lists.gnu.org>
Received: from sender4-of-o52.zoho.com ([136.143.188.52]:21236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ktCcL-0001ec-Sv; Sat, 26 Dec 2020 11:40:36 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1609000791; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=R2SkE9vIFyx1BCfgGTBKvj5if5+ZF+a7/PivEvXC9ziFNTMA0Pfv5GlGOUgQiwj+LCcjuatCHHjDNMUQqfJmKuRQEoRratAqE4YRdw2H2U+IKSA7LUsaDTQXBcC+SI+POh95MFu4Gp0o6sZxbUiaWNUPDtjUNm591M5zJD5cBHg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1609000791;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=X5zhdZebXmm9bO87ETdJqNptxdKLQ9x3628yr8pD+N0=; 
 b=FkV+j5CmulZLNGdxotc/9fTMvOCQyV+9a+JC9PqmJqKlwTf/ayEWpuy/aGHn8Ksi5ZR2gqEYHfiioE5nz0fZuxmF9Y3/0/nuJh0w+rUgzOc5ejnEsdcvaSDNATQ6zOzAs/cJhViWBOD7DuCGiGIQipzfNlNIZrKPqXtN40cXtyM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1609000785900301.25432515432215;
 Sat, 26 Dec 2020 08:39:45 -0800 (PST)
In-Reply-To: <20201226103347.868-1-gaojinhao@huawei.com>
Subject: Re: [PATCH 0/8] Fix memory leak of some device state in migration
Message-ID: <160900078403.29898.5480116521404123587@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: gaojinhao@huawei.com
Date: Sat, 26 Dec 2020 08:39:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.52; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o52.zoho.com
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
Cc: stefanb@linux.vnet.ibm.com, jasowang@redhat.com, mst@redhat.com,
 groug@kaod.org, qemu-devel@nongnu.org, quintela@redhat.com,
 qemu-ppc@nongnu.org, marcandre.lureau@redhat.com, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIyNjEwMzM0Ny44Njgt
MS1nYW9qaW5oYW9AaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMjI2MTAzMzQ3Ljg2OC0x
LWdhb2ppbmhhb0BodWF3ZWkuY29tClN1YmplY3Q6IFtQQVRDSCAwLzhdIEZpeCBtZW1vcnkgbGVh
ayBvZiBzb21lIGRldmljZSBzdGF0ZSBpbiBtaWdyYXRpb24KCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAq
IFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMDEyMjYxMDMzNDcuODY4LTEtZ2FvamluaGFv
QGh1YXdlaS5jb20gLT4gcGF0Y2hldy8yMDIwMTIyNjEwMzM0Ny44NjgtMS1nYW9qaW5oYW9AaHVh
d2VpLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjBhMzRlMDUgZGJ1cy12bXN0
YXRlOiBGaXggbWVtb3J5IGxlYWsgb2YgZGJ1c192bXN0YXRlCjFlN2NlMWMgdHBtX2VtdWxhdG9y
OiBGaXggbWVtb3J5IGxlYWsgb2Ygdm1zdGF0ZV90cG1fZW11bGF0b3IKZTVlMjBmOSB2bWJ1czog
Rml4IG1lbW9yeSBsZWFrIG9mIHZtc3RhdGVfdm1idXNfY2hhbl9yZXEKMGNmYmZlNiBzYXZldm06
IEZpeCBtZW1vcnkgbGVhayBvZiB2bXN0YXRlX2NvbmZpZ3VyYXRpb24KMGQ3NjdkMiBzcGFwcl9w
Y2k6IEZpeCBtZW1vcnkgbGVhayBvZiB2bXN0YXRlX3NwYXByX3BjaQo3MjlkNzczIHNwYXByOiBG
aXggbWVtb3J5IGxlYWsgb2Ygdm1zdGF0ZV9zcGFwcl9ldmVudF9lbnRyeQpiZDlkZWNkIHZpcnRp
by1uZXQ6IEZpeCBtZW1vcnkgbGVhayBvZiB2bXN0YXRlX3ZpcnRpb19uZXRfcnNzCmE3ZGViZmEg
dm1idXM6IEZpeCBtZW1vcnkgbGVhayBvZiB2bXN0YXRlX2dwYWRsCgo9PT0gT1VUUFVUIEJFR0lO
ID09PQoxLzggQ2hlY2tpbmcgY29tbWl0IGE3ZGViZmEzM2JlNiAodm1idXM6IEZpeCBtZW1vcnkg
bGVhayBvZiB2bXN0YXRlX2dwYWRsKQpFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0
ICc9JyAoY3R4Old4VikKIzMxOiBGSUxFOiBody9oeXBlcnYvdm1idXMuYzo1Mjg6CisgICAgZ3Bh
ZGwtPm51bV9nZm5zID0wOwogICAgICAgICAgICAgICAgICAgICBeCgp0b3RhbDogMSBlcnJvcnMs
IDAgd2FybmluZ3MsIDIxIGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvOCBoYXMgc3R5bGUgcHJvYmxl
bXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3Np
dGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1B
SU5UQUlORVJTLgoKMi84IENoZWNraW5nIGNvbW1pdCBiZDlkZWNkYzhkODEgKHZpcnRpby1uZXQ6
IEZpeCBtZW1vcnkgbGVhayBvZiB2bXN0YXRlX3ZpcnRpb19uZXRfcnNzKQozLzggQ2hlY2tpbmcg
Y29tbWl0IDcyOWQ3NzM5NTIxYyAoc3BhcHI6IEZpeCBtZW1vcnkgbGVhayBvZiB2bXN0YXRlX3Nw
YXByX2V2ZW50X2VudHJ5KQo0LzggQ2hlY2tpbmcgY29tbWl0IDBkNzY3ZDJmNmY2OCAoc3BhcHJf
cGNpOiBGaXggbWVtb3J5IGxlYWsgb2Ygdm1zdGF0ZV9zcGFwcl9wY2kpCjUvOCBDaGVja2luZyBj
b21taXQgMGNmYmZlNmYzN2Q5IChzYXZldm06IEZpeCBtZW1vcnkgbGVhayBvZiB2bXN0YXRlX2Nv
bmZpZ3VyYXRpb24pCjYvOCBDaGVja2luZyBjb21taXQgZTVlMjBmOTFlN2FlICh2bWJ1czogRml4
IG1lbW9yeSBsZWFrIG9mIHZtc3RhdGVfdm1idXNfY2hhbl9yZXEpCjcvOCBDaGVja2luZyBjb21t
aXQgMWU3Y2UxYzg0NjAyICh0cG1fZW11bGF0b3I6IEZpeCBtZW1vcnkgbGVhayBvZiB2bXN0YXRl
X3RwbV9lbXVsYXRvcikKOC84IENoZWNraW5nIGNvbW1pdCAwYTM0ZTA1OThmYjkgKGRidXMtdm1z
dGF0ZTogRml4IG1lbW9yeSBsZWFrIG9mIGRidXNfdm1zdGF0ZSkKPT09IE9VVFBVVCBFTkQgPT09
CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFp
bGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDEyMjYxMDMzNDcuODY4LTEtZ2Fv
amluaGFvQGh1YXdlaS5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpF
bWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcu
b3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQu
Y29t

