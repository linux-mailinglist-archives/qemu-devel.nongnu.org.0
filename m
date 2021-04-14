Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D39F35FC49
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:06:08 +0200 (CEST)
Received: from localhost ([::1]:39986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWlm3-0006kk-LC
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWljI-00054J-EA
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:03:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWljF-0004En-FK
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618430592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5c7W/niRMPgoB9EdCgSEVSLkS+BrW9QxtyAsawKKQs=;
 b=DIR02D1MAJcDbWQ/Xbdf9CHKB9l0eDN1wsVvlJMyhu4hod3veGBWzFImGdFOERVUNps8Ty
 PzNz2HjFUus9l6TSl3jLLbJ2t0l2WtaeikqMAerjAetqtZZgaoN0CPZtxLDRBjlwktojRo
 XJWHKQ42GP/JFMa530sCrtUkIaMB1oM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-DzKLUTn1PS6OlDzdWZzggw-1; Wed, 14 Apr 2021 16:03:10 -0400
X-MC-Unique: DzKLUTn1PS6OlDzdWZzggw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B32FD10CE791;
 Wed, 14 Apr 2021 20:03:04 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7125C694CC;
 Wed, 14 Apr 2021 20:03:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] util/async: print leaked BH name when AioContext finalizes
Date: Wed, 14 Apr 2021 21:02:47 +0100
Message-Id: <20210414200247.917496-3-stefanha@redhat.com>
In-Reply-To: <20210414200247.917496-1-stefanha@redhat.com>
References: <20210414200247.917496-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, eric.g.ernst@gmail.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QkhzIG11c3QgYmUgZGVsZXRlZCBiZWZvcmUgdGhlIEFpb0NvbnRleHQgaXMgZmluYWxpemVkLiBJ
ZiBub3QsIGl0J3MgYQpidWcgYW5kIHByb2JhYmx5IGluZGljYXRlcyB0aGF0IHNvbWUgcGFydCBv
ZiB0aGUgcHJvZ3JhbSBzdGlsbCBleHBlY3RzCnRoZSBCSCB0byBydW4gaW4gdGhlIGZ1dHVyZS4g
VGhhdCBjYW4gbGVhZCB0byBtZW1vcnkgbGVha3MsIGluY29uc2lzdGVudApzdGF0ZSwgb3IganVz
dCBoYW5ncy4KClVuZm9ydHVuYXRlbHkgdGhlIGFzc2VydChmbGFncyAmIEJIX0RFTEVURUQpIGNh
bGwgaW4gYWlvX2N0eF9maW5hbGl6ZSgpCmlzIGRpZmZpY3VsdCB0byBkZWJ1ZyBiZWNhdXNlIHRo
ZSBhc3NlcnRpb24gZmFpbHVyZSBjb250YWlucyBubwppbmZvcm1hdGlvbiBhYm91dCB0aGUgQkgh
CgpVc2UgdGhlIFFFTVVCSCBuYW1lIGZpZWxkIGFkZGVkIGluIHRoZSBwcmV2aW91cyBwYXRjaCB0
byBzaG93IGEgdXNlZnVsCmVycm9yIHdoZW4gYSBsZWFrZWQgQkggaXMgZGV0ZWN0ZWQuCgpTdWdn
ZXN0ZWQtYnk6IEVyaWMgRXJuc3QgPGVyaWMuZy5lcm5zdEBnbWFpbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiB1dGlsL2FzeW5j
LmMgfCAxNiArKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS91dGlsL2FzeW5jLmMgYi91dGlsL2FzeW5j
LmMKaW5kZXggYjZhY2I4NjUyMC4uMjU4NGZjYTI0OSAxMDA2NDQKLS0tIGEvdXRpbC9hc3luYy5j
CisrKyBiL3V0aWwvYXN5bmMuYwpAQCAtMzQ0LDggKzM0NCwyMCBAQCBhaW9fY3R4X2ZpbmFsaXpl
KEdTb3VyY2UgICAgICpzb3VyY2UpCiAgICAgYXNzZXJ0KFFTSU1QTEVRX0VNUFRZKCZjdHgtPmJo
X3NsaWNlX2xpc3QpKTsKIAogICAgIHdoaWxlICgoYmggPSBhaW9fYmhfZGVxdWV1ZSgmY3R4LT5i
aF9saXN0LCAmZmxhZ3MpKSkgewotICAgICAgICAvKiBxZW11X2JoX2RlbGV0ZSgpIG11c3QgaGF2
ZSBiZWVuIGNhbGxlZCBvbiBCSHMgaW4gdGhpcyBBaW9Db250ZXh0ICovCi0gICAgICAgIGFzc2Vy
dChmbGFncyAmIEJIX0RFTEVURUQpOworICAgICAgICAvKgorICAgICAgICAgKiBxZW11X2JoX2Rl
bGV0ZSgpIG11c3QgaGF2ZSBiZWVuIGNhbGxlZCBvbiBCSHMgaW4gdGhpcyBBaW9Db250ZXh0LiBJ
bgorICAgICAgICAgKiBtYW55IGNhc2VzIG1lbW9yeSBsZWFrcywgaGFuZ3MsIG9yIGluY29uc2lz
dGVudCBzdGF0ZSBvY2N1ciB3aGVuIGEKKyAgICAgICAgICogQkggaXMgbGVha2VkIGJlY2F1c2Ug
c29tZXRoaW5nIHN0aWxsIGV4cGVjdHMgaXQgdG8gcnVuLgorICAgICAgICAgKgorICAgICAgICAg
KiBJZiB5b3UgaGl0IHRoaXMsIGZpeCB0aGUgbGlmZWN5Y2xlIG9mIHRoZSBCSCBzbyB0aGF0Cisg
ICAgICAgICAqIHFlbXVfYmhfZGVsZXRlKCkgYW5kIGFueSBhc3NvY2lhdGVkIGNsZWFudXAgaXMg
Y2FsbGVkIGJlZm9yZSB0aGUKKyAgICAgICAgICogQWlvQ29udGV4dCBpcyBmaW5hbGl6ZWQuCisg
ICAgICAgICAqLworICAgICAgICBpZiAodW5saWtlbHkoIShmbGFncyAmIEJIX0RFTEVURUQpKSkg
eworICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICIlczogQkggJyVzJyBsZWFrZWQsIGFib3J0
aW5nLi4uXG4iLAorICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgYmgtPm5hbWUpOworICAg
ICAgICAgICAgYWJvcnQoKTsKKyAgICAgICAgfQogCiAgICAgICAgIGdfZnJlZShiaCk7CiAgICAg
fQotLSAKMi4zMC4yCgo=


