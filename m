Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA31622D9F8
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jul 2020 23:06:17 +0200 (CEST)
Received: from localhost ([::1]:42092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzRN2-0000n5-Qt
	for lists+qemu-devel@lfdr.de; Sat, 25 Jul 2020 17:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jzRLk-00086V-RG; Sat, 25 Jul 2020 17:04:56 -0400
Resent-Date: Sat, 25 Jul 2020 17:04:56 -0400
Resent-Message-Id: <E1jzRLk-00086V-RG@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jzRLj-0005fD-02; Sat, 25 Jul 2020 17:04:56 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1595711071; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PCaGP/DyS65NIGHnEVDCGF5K7ai418CATZ21t++BN603t76c+ZcSCOdFaStM/tkpvWg0eMLFgbcff/ZctmRObU6V0Msy2E/dplJ9+ZHJunGYPSLEfGjfrx5YrXaxTW2hPP3rQNuD/cY8OrRJkgb3qjRtI1Ysmtbv8aaimy6yLnE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1595711071;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=e0+SunTe3NANm9UBftOWCanvamQ+1MrV2QUC7a0Xj0g=; 
 b=FmyXRri3ohYareqNBaNNT2O425tBSH/Xgk3GvW0WStYaH6YQS+ydd55z+3jRXt+fJJ+8yvvuozptskF6XbR1YZF7QArEA17VWKWjNcbplJG2f9zk5XrZwVkc7FW6xf6vPb7iGxVd4SFQ47fu/HmG1PDzALDItK7t4EeXrWq0tR4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1595711069336844.9047259498186;
 Sat, 25 Jul 2020 14:04:29 -0700 (PDT)
Subject: Re: [PATCH] target/ppc: Fix SPE unavailable exception triggering
Message-ID: <159571106877.5803.9650819864553051317@66eaa9a8a123>
In-Reply-To: <20200725191436.31828-1-matthieu.bucchianeri@leostella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: matthieu.bucchianeri@leostella.com
Date: Sat, 25 Jul 2020 14:04:29 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/25 17:04:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 matthieu.bucchianeri@leostella.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDcyNTE5MTQzNi4zMTgy
OC0xLW1hdHRoaWV1LmJ1Y2NoaWFuZXJpQGxlb3N0ZWxsYS5jb20vCgoKCkhpLAoKVGhpcyBzZXJp
ZXMgc2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBi
ZWxvdyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIw
MDcyNTE5MTQzNi4zMTgyOC0xLW1hdHRoaWV1LmJ1Y2NoaWFuZXJpQGxlb3N0ZWxsYS5jb20KU3Vi
amVjdDogW1BBVENIXSB0YXJnZXQvcHBjOiBGaXggU1BFIHVuYXZhaWxhYmxlIGV4Y2VwdGlvbiB0
cmlnZ2VyaW5nCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYt
cGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKRnJvbSBodHRw
czovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICAgN2FkZmJlYS4uYjBjZTNmMCAg
bWFzdGVyICAgICAtPiBtYXN0ZXIKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9q
ZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMDcyNTE5MTQzNi4zMTgy
OC0xLW1hdHRoaWV1LmJ1Y2NoaWFuZXJpQGxlb3N0ZWxsYS5jb20gLT4gcGF0Y2hldy8yMDIwMDcy
NTE5MTQzNi4zMTgyOC0xLW1hdHRoaWV1LmJ1Y2NoaWFuZXJpQGxlb3N0ZWxsYS5jb20KZmF0YWw6
IGZhaWxlZCB0byB3cml0ZSByZWYtcGFjayBmaWxlCmZhdGFsOiBUaGUgcmVtb3RlIGVuZCBodW5n
IHVwIHVuZXhwZWN0ZWRseQpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgRmls
ZSAicGF0Y2hldy10ZXN0ZXIyL3NyYy9wYXRjaGV3LWNsaSIsIGxpbmUgNTMxLCBpbiB0ZXN0X29u
ZQogICAgZ2l0X2Nsb25lX3JlcG8oY2xvbmUsIHJbInJlcG8iXSwgclsiaGVhZCJdLCBsb2dmLCBU
cnVlKQogIEZpbGUgInBhdGNoZXctdGVzdGVyMi9zcmMvcGF0Y2hldy1jbGkiLCBsaW5lIDYyLCBp
biBnaXRfY2xvbmVfcmVwbwogICAgc3VicHJvY2Vzcy5jaGVja19jYWxsKGNsb25lX2NtZCwgc3Rk
ZXJyPWxvZ2YsIHN0ZG91dD1sb2dmKQogIEZpbGUgIi9vcHQvcmgvcmgtcHl0aG9uMzYvcm9vdC91
c3IvbGliNjQvcHl0aG9uMy42L3N1YnByb2Nlc3MucHkiLCBsaW5lIDI5MSwgaW4gY2hlY2tfY2Fs
bAogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKc3VicHJvY2Vzcy5D
YWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snZ2l0JywgJ2Nsb25lJywgJy1xJywgJy9ob21l
L3BhdGNoZXcyLy5jYWNoZS9wYXRjaGV3LWdpdC1jYWNoZS9odHRwc2dpdGh1YmNvbXBhdGNoZXdw
cm9qZWN0cWVtdS0zYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0JywgJy92
YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC14bXQ3cTBzOS9zcmMnXScgcmV0dXJuZWQgbm9uLXpl
cm8gZXhpdCBzdGF0dXMgMTI4LgoKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6
Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwNzI1MTkxNDM2LjMxODI4LTEtbWF0dGhpZXUuYnVjY2hp
YW5lcmlAbGVvc3RlbGxhLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=

