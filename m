Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C13751A8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:39:02 +0200 (CEST)
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaTE-0006ZI-IJ
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1leaLZ-0000Ld-DB
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:31:06 -0400
Resent-Date: Thu, 06 May 2021 05:31:05 -0400
Resent-Message-Id: <E1leaLZ-0000Ld-DB@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1leaLW-0007rN-23
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:31:05 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620293450; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=G+P4rooeQkz0Wbbxzdscx/e+zVyjIVa/C2NukOWfN1IR1cBEe+g5ULe8bHhlAzCyccuyXKSmyH5urhfn+FZr9pV6Wb8gi7xaB2JShD51KLL/87XXSTRValWNVgoy9mEYEX1M98uLGQ+U98yJ6OBkEBJTUGAC1Vd74ruk2HMrHK4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620293450;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=JHXSYtihjx5/BolO9eUqx6T0EepGFzVB9LB8k8hNNv0=; 
 b=cXSF6RsNlOYmGE1c4IO1zoXTfymfrNqTxeh43bKwE51odHgAlnvE3KBVAaEf1UWk3RMAD3Hwh9agkZ22laTHCttZktpz/sPxq69etahEM8zgwO6ma6qwXw+fnwjnChUxtQf9lGeCaqxZVGlbeRpbXeqPctvOyfZh+zcl0+/u38I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1620293447263788.5657766444491;
 Thu, 6 May 2021 02:30:47 -0700 (PDT)
In-Reply-To: <20210506091001.1301250-1-kraxel@redhat.com>
Subject: Re: [PATCH] virtio-gpu: handle partial maps properly
Message-ID: <162029344596.14251.13664629268926289279@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kraxel@redhat.com
Date: Thu, 6 May 2021 02:30:47 -0700 (PDT)
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
Cc: eric.auger@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUwNjA5MTAwMS4xMzAx
MjUwLTEta3JheGVsQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDUwNjA5MTAwMS4xMzAx
MjUwLTEta3JheGVsQHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIXSB2aXJ0aW8tZ3B1OiBoYW5k
bGUgcGFydGlhbCBtYXBzIHByb3Blcmx5Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jp
bi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5h
bWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Nj
cmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5E
ID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApG
cm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10g
ICAgICAgICBwYXRjaGV3LzIwMjEwNTA2MDkxMDAxLjEzMDEyNTAtMS1rcmF4ZWxAcmVkaGF0LmNv
bSAtPiBwYXRjaGV3LzIwMjEwNTA2MDkxMDAxLjEzMDEyNTAtMS1rcmF4ZWxAcmVkaGF0LmNvbQpT
d2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjQ1NWQzZjQgdmlydGlvLWdwdTogaGFuZGxl
IHBhcnRpYWwgbWFwcyBwcm9wZXJseQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KV0FSTklORzogbGlu
ZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzQyOiBGSUxFOiBody9kaXNwbGF5L3ZpcnRpby1ncHUtM2Qu
YzoyOTI6CisgICAgcmV0ID0gdmlydGlvX2dwdV9jcmVhdGVfbWFwcGluZ19pb3YoZywgJmF0dF9y
YiwgY21kLCBOVUxMLCAmcmVzX2lvdnMsICZyZXNfbmlvdik7CgpXQVJOSU5HOiBsaW5lIG92ZXIg
ODAgY2hhcmFjdGVycwojMTE0OiBGSUxFOiBody9kaXNwbGF5L3ZpcnRpby1ncHUuYzo2NTI6Cisg
ICAgICAgICAgICAgICAgcWVtdV9sb2dfbWFzayhMT0dfR1VFU1RfRVJST1IsICIlczogZmFpbGVk
IHRvIG1hcCBNTUlPIG1lbW9yeSBmb3IiCgpFUlJPUjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMK
IzE2MTogRklMRTogaHcvZGlzcGxheS92aXJ0aW8tZ3B1LmM6NzM3OgorICAgIHJldCA9IHZpcnRp
b19ncHVfY3JlYXRlX21hcHBpbmdfaW92KGcsICZhYiwgY21kLCAmcmVzLT5hZGRycywgJnJlcy0+
aW92LCAmcmVzLT5pb3ZfY250KTsKCnRvdGFsOiAxIGVycm9ycywgMiB3YXJuaW5ncywgMTQxIGxp
bmVzIGNoZWNrZWQKCkNvbW1pdCA0NTVkM2Y0YTk0ZDUgKHZpcnRpby1ncHU6IGhhbmRsZSBwYXJ0
aWFsIG1hcHMgcHJvcGVybHkpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElm
IGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0
aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cg
aXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwNTA2MDkxMDAxLjEz
MDEyNTAtMS1rcmF4ZWxAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2Fn
ZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8v
cGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVs
QHJlZGhhdC5jb20=

