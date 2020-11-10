Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E8D2ACA49
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 02:20:09 +0100 (CET)
Received: from localhost ([::1]:49022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcIKO-0002gi-H5
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 20:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kcIJH-0002FF-OI
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:18:59 -0500
Resent-Date: Mon, 09 Nov 2020 20:18:59 -0500
Resent-Message-Id: <E1kcIJH-0002FF-OI@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kcIJF-0007ly-Ap
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:18:59 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1604971124; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ji/xwcrU5+GSAuxz4sr0z4StFKtRdkkMo9fyBUVM1zeJcSGMLYz4QvmX1xV3jXyqZWOVcDgs00gNCTW9abrCpMuxaPh7xWV9ogLswREKYgZooU0ShvzMmAyBRSaR4cbPpmud15Vu7bG7LCQGDS7pAjL/KUammEA/2dYuwTSk/xI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1604971124;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=iCIpqSD1awOrh4I3enO+LPmPuFBDK2p633ru7Sf8Vmo=; 
 b=PMFB8e8lxoaFR9Ui0uy3skoyEQuAvohzXNz70pwPq3EaEmoqMehJfMhzch0pgh8tiIKW20y1SpbaWM4NZOl5bFgLQx1EjWJ7SMzHeTQKSLUEppfhSA558obTFKvt/kTMfd3/MViZPbwUXREZCb5D4JRILJI5rp/rT4JEvAjTAlE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1604971123017925.7629262144698;
 Mon, 9 Nov 2020 17:18:43 -0800 (PST)
Message-ID: <160497112183.32285.8464514877214048442@b92d57cec08d>
Subject: Re: [PATCH 0/2] virtiofsd: fix some accessing NULL pointer problem
In-Reply-To: <eeb2fd1d-a53d-eae6-4727-7f1a6b20ac9e@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lihaotian9@huawei.com
Date: Mon, 9 Nov 2020 17:18:43 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 20:18:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: virtio-fs@redhat.com, linfeilong@huawei.com, qemu-devel@nongnu.org,
 liuzhiqiang26@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9lZWIyZmQxZC1hNTNkLWVhZTYt
NDcyNy03ZjFhNmIyMGFjOWVAaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogZWViMmZkMWQtYTUzZC1lYWU2LTQ3MjctN2Yx
YTZiMjBhYzllQGh1YXdlaS5jb20KU3ViamVjdDogW1BBVENIIDAvMl0gdmlydGlvZnNkOiBmaXgg
c29tZSBhY2Nlc3NpbmcgTlVMTCBwb2ludGVyIHByb2JsZW0KVHlwZTogc2VyaWVzCgo9PT0gVEVT
VCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYv
bnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
YWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJh
c2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIx
NjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXBy
b2plY3QvcWVtdQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjAxMDI4MTg1NzIyLjI3
ODM1MzItMS1rZWl0aHBAa2VpdGhwLmNvbSAtPiBwYXRjaGV3LzIwMjAxMDI4MTg1NzIyLjI3ODM1
MzItMS1rZWl0aHBAa2VpdGhwLmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3L2VlYjJm
ZDFkLWE1M2QtZWFlNi00NzI3LTdmMWE2YjIwYWM5ZUBodWF3ZWkuY29tIC0+IHBhdGNoZXcvZWVi
MmZkMWQtYTUzZC1lYWU2LTQ3MjctN2YxYTZiMjBhYzllQGh1YXdlaS5jb20KU3dpdGNoZWQgdG8g
YSBuZXcgYnJhbmNoICd0ZXN0JwpjOTFlOTcyIHZpcnRpb2ZzZDogY2hlY2sgd2hldGhlciBsb19t
YXBfcmVzZXJ2ZSByZXR1cm5zIE5VTEwgaW4gbWFpbiBmdW5jCjM4N2JkYTcgdG9vbHMvdmlydGlv
ZnNkL2J1ZmZlci5jOiBjaGVjayB3aGV0aGVyIGJ1ZiBpcyBOVUxMIGluIGZ1c2VfYnVmdmVjX2Fk
dmFuY2UgZnVuYwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8yIENoZWNraW5nIGNvbW1pdCAzODdi
ZGE3OGJlNjQgKHRvb2xzL3ZpcnRpb2ZzZC9idWZmZXIuYzogY2hlY2sgd2hldGhlciBidWYgaXMg
TlVMTCBpbiBmdXNlX2J1ZnZlY19hZHZhbmNlIGZ1bmMpCkVSUk9SOiBicmFjZXMge30gYXJlIG5l
Y2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzIzOiBGSUxFOiB0b29scy92
aXJ0aW9mc2QvYnVmZmVyLmM6MjQ5OgorICAgIGlmICghYnVmKQpbLi4uXQoKdG90YWw6IDEgZXJy
b3JzLCAwIHdhcm5pbmdzLCA5IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvMiBoYXMgc3R5bGUgcHJv
YmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBw
b3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGlu
IE1BSU5UQUlORVJTLgoKMi8yIENoZWNraW5nIGNvbW1pdCBjOTFlOTcyMmYzMjMgKHZpcnRpb2Zz
ZDogY2hlY2sgd2hldGhlciBsb19tYXBfcmVzZXJ2ZSByZXR1cm5zIE5VTEwgaW4gbWFpbiBmdW5j
KQpFUlJPUjogYnJhY2VzIHt9IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3Rh
dGVtZW50CiMzNDogRklMRTogdG9vbHMvdmlydGlvZnNkL3Bhc3N0aHJvdWdoX2xsLmM6MzQ1NzoK
KyAgICBpZiAoIXJlc2VydmVfZWxlbSkKWy4uLl0KCkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vz
c2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzM4OiBGSUxFOiB0b29scy92aXJ0
aW9mc2QvcGFzc3Rocm91Z2hfbGwuYzozNDYxOgorICAgIGlmICghcm9vdF9lbGVtKQpbLi4uXQoK
dG90YWw6IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCAyMSBsaW5lcyBjaGVja2VkCgpQYXRjaCAyLzIg
aGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9y
cwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUK
Q0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21t
YW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0
dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzL2VlYjJmZDFkLWE1M2QtZWFlNi00NzI3LTdmMWE2YjIwYWM5
ZUBodWF3ZWkuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwg
Z2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9d
LgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

