Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B052391377
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:14:52 +0200 (CEST)
Received: from localhost ([::1]:39782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llpcp-0003Na-7M
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llpbF-0001pW-1L
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:13:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llpbB-0001AH-T5
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622020389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjzrBE27jlzhMuAkjUiyZ08J6x+y8wyOEtbfqNd9XZ4=;
 b=ZwOnPL24s48teRPVYhiGnlcceu1lAP31sOZJXXdO9nYklEXDCleLK7YWmVG5gW9lsxcno5
 jbfA7QKGtsiSa5Ys3DksynQyd5AMrBuvPn+uohRTlnnNBo2R2ABmOGUM6Vw42dKwGQ3dFn
 P2A0YY9Ovn5gyAJQ2JQlNZI5vqde+VA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-Cxo4bY3VMzOUuwqnrHiLJw-1; Wed, 26 May 2021 05:13:07 -0400
X-MC-Unique: Cxo4bY3VMzOUuwqnrHiLJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 604A7801B13;
 Wed, 26 May 2021 09:13:06 +0000 (UTC)
Received: from localhost (ovpn-115-80.ams2.redhat.com [10.36.115.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 046E35D9D3;
 Wed, 26 May 2021 09:13:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] vhost-user-blk-test: fix Coverity mkstemp(2) umask warning
Date: Wed, 26 May 2021 10:12:47 +0100
Message-Id: <20210526091248.434459-3-stefanha@redhat.com>
In-Reply-To: <20210526091248.434459-1-stefanha@redhat.com>
References: <20210526091248.434459-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIExpbnV4IG1hbiBwYWdlIGZvciBta3N0ZW1wKDMpIHN0YXRlczoKCiAgSW4gZ2xpYmMgdmVy
c2lvbnMgMi4wNiBhbmQgZWFybGllciwgdGhlIGZpbGUgaXMgY3JlYXRlZCB3aXRoCiAgcGVybWlz
c2lvbnMgMDY2NiwgdGhhdCBpcywgcmVhZCBhbmQgd3JpdGUgZm9yIGFsbCB1c2Vycy4gIFRoaXMg
b2xkCiAgYmVoYXZpb3IgbWF5IGJlIGEgc2VjdXJpdHkgcmlzaywgZXNwZWNpYWxseSAgc2luY2Ug
b3RoZXIgVU5JWCBmbGF2b3JzCiAgdXNlIDA2MDAsIGFuZCBzb21lYm9keSBtaWdodCBvdmVybG9v
ayB0aGlzIGRldGFpbCB3aGVuIHBvcnRpbmcKICBwcm9ncmFtcy4gUE9TSVguMS0yMDA4IGFkZHMg
YSByZXF1aXJlbWVudCB0aGF0IHRoZSBmaWxlIGJlIGNyZWF0ZWQKICB3aXRoIG1vZGUgMDYwMC4K
CiAgTW9yZSBnZW5lcmFsbHksIHRoZSBQT1NJWCBzcGVjaWZpY2F0aW9uIG9mIG1rc3RlbXAoKSBk
b2VzIG5vdCBzYXkKICBhbnl0aGluZyBhYm91dCBmaWxlIG1vZGVzLCBzbyB0aGUgYXBwbGljYXRp
b24gc2hvdWxkIG1ha2Ugc3VyZSBpdHMKICBmaWxlIG1vZGUgY3JlYXRpb24gbWFzayAoc2VlIHVt
YXNrKDIpKSBpcyBzZXQgYXBwcm9wcmlhdGVseSBiZWZvcmUKICBjYWxsaW5nIG1rc3RlbXAoKSAo
YW5kIG1rb3N0ZW1wKCkpLgoKZ2xpYmMgMi4wLjYgd2FzIHJlbGVhc2VkIGluIDE5OTcgYW5kIFBP
U0lYIGNhdWdodCB1cCBpbiAyMDA4LiBtYWNPUyBhbmQKRnJlZUJTRCBhbHNvIHVzZSBQT1NJWC1j
b21wbGlhbnQgMDYwMCBwZXJtaXNzaW9ucy4KCkF0IHRoaXMgcG9pbnQgdGhlIENvdmVyaXR5IHdh
cm5pbmcgc2VlbXMgYXJjaGFpYyBhbmQgbm8gbG9uZ2VyIHVzZWZ1bCwKYnV0IGdvIGFoZWFkIGFu
ZCBzaWxlbmNlIGl0LgoKKioqIENJRCAxNDUzMjY3OiAgU2VjdXJpdHkgYmVzdCBwcmFjdGljZXMg
dmlvbGF0aW9ucyAgKFNFQ1VSRV9URU1QKQovcWVtdS90ZXN0cy9xdGVzdC92aG9zdC11c2VyLWJs
ay10ZXN0LmM6IDgyNyBpbiBjcmVhdGVfbGlzdGVuX3NvY2tldCgpCjgyMSAgICAgewo4MjIgICAg
ICAgICBpbnQgdG1wX2ZkOwo4MjMgICAgICAgICBjaGFyICpwYXRoOwo4MjQKODI1ICAgICAgICAg
LyogTm8gcmFjZSBiZWNhdXNlIG91ciBwaWQgbWFrZXMgdGhlIHBhdGggdW5pcXVlICovCjgyNiAg
ICAgICAgIHBhdGggPSBnX3N0cmR1cF9wcmludGYoIi90bXAvcXRlc3QtJWQtc29jay5YWFhYWFgi
LCBnZXRwaWQoKSk7Cj4+PiAgICAgQ0lEIDE0NTMyNjc6ICBTZWN1cml0eSBiZXN0IHByYWN0aWNl
cyB2aW9sYXRpb25zICAoU0VDVVJFX1RFTVApCj4+PiAgICAgQ2FsbGluZyAibWtzdGVtcCIgd2l0
aG91dCBzZWN1cmVseSBzZXR0aW5nIHVtYXNrIGZpcnN0Lgo4MjcgICAgICAgICB0bXBfZmQgPSBt
a3N0ZW1wKHBhdGgpOwo4MjggICAgICAgICBnX2Fzc2VydF9jbXBpbnQodG1wX2ZkLCA+PSwgMCk7
CjgyOSAgICAgICAgIGNsb3NlKHRtcF9mZCk7CjgzMCAgICAgICAgIHVubGluayhwYXRoKTsKODMx
CjgzMiAgICAgICAgICpmZCA9IHF0ZXN0X3NvY2tldF9zZXJ2ZXIocGF0aCk7CgpTaWduZWQtb2Zm
LWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogdGVzdHMvcXRl
c3Qvdmhvc3QtdXNlci1ibGstdGVzdC5jIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9xdGVzdC92aG9zdC11c2VyLWJs
ay10ZXN0LmMgYi90ZXN0cy9xdGVzdC92aG9zdC11c2VyLWJsay10ZXN0LmMKaW5kZXggNTgxZTI4
M2EwMy4uNDEyZTAxMGRiOCAxMDA2NDQKLS0tIGEvdGVzdHMvcXRlc3Qvdmhvc3QtdXNlci1ibGst
dGVzdC5jCisrKyBiL3Rlc3RzL3F0ZXN0L3Zob3N0LXVzZXItYmxrLXRlc3QuYwpAQCAtODAzLDEx
ICs4MDMsMTYgQEAgc3RhdGljIHZvaWQgZGVzdHJveV9maWxlKHZvaWQgKnBhdGgpCiBzdGF0aWMg
Y2hhciAqZHJpdmVfY3JlYXRlKHZvaWQpCiB7CiAgICAgaW50IGZkLCByZXQ7CisgICAgbW9kZV90
IG9sZF91bWFzazsKICAgICAvKiogdmhvc3QtdXNlci1ibGsgd29uJ3QgcmVjb2duaXplIGRyaXZl
IGxvY2F0ZWQgaW4gL3RtcCAqLwogICAgIGNoYXIgKnRfcGF0aCA9IGdfc3RyZHVwKCJxdGVzdC5Y
WFhYWFgiKTsKIAogICAgIC8qKiBDcmVhdGUgYSB0ZW1wb3JhcnkgcmF3IGltYWdlICovCisgICAg
b2xkX3VtYXNrID0gdW1hc2soU19JWFVTUiB8CisgICAgICAgICAgICAgICAgICAgICAgU19JUkdS
UCB8IFNfSVdHUlAgfCBTX0lYR1JQIHwKKyAgICAgICAgICAgICAgICAgICAgICBTX0lST1RIIHwg
U19JV09USCB8IFNfSVhPVEgpOwogICAgIGZkID0gbWtzdGVtcCh0X3BhdGgpOworICAgIHVtYXNr
KG9sZF91bWFzayk7CiAgICAgZ19hc3NlcnRfY21waW50KGZkLCA+PSwgMCk7CiAgICAgcmV0ID0g
ZnRydW5jYXRlKGZkLCBURVNUX0lNQUdFX1NJWkUpOwogICAgIGdfYXNzZXJ0X2NtcGludChyZXQs
ID09LCAwKTsKQEAgLTgyMSwxMCArODI2LDE1IEBAIHN0YXRpYyBjaGFyICpjcmVhdGVfbGlzdGVu
X3NvY2tldChpbnQgKmZkKQogewogICAgIGludCB0bXBfZmQ7CiAgICAgY2hhciAqcGF0aDsKKyAg
ICBtb2RlX3Qgb2xkX3VtYXNrOwogCiAgICAgLyogTm8gcmFjZSBiZWNhdXNlIG91ciBwaWQgbWFr
ZXMgdGhlIHBhdGggdW5pcXVlICovCiAgICAgcGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiL3RtcC9x
dGVzdC0lZC1zb2NrLlhYWFhYWCIsIGdldHBpZCgpKTsKKyAgICBvbGRfdW1hc2sgPSB1bWFzayhT
X0lYVVNSIHwKKyAgICAgICAgICAgICAgICAgICAgICBTX0lSR1JQIHwgU19JV0dSUCB8IFNfSVhH
UlAgfAorICAgICAgICAgICAgICAgICAgICAgIFNfSVJPVEggfCBTX0lXT1RIIHwgU19JWE9USCk7
CiAgICAgdG1wX2ZkID0gbWtzdGVtcChwYXRoKTsKKyAgICB1bWFzayhvbGRfdW1hc2spOwogICAg
IGdfYXNzZXJ0X2NtcGludCh0bXBfZmQsID49LCAwKTsKICAgICBjbG9zZSh0bXBfZmQpOwogICAg
IHVubGluayhwYXRoKTsKLS0gCjIuMzEuMQoK


