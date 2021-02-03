Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9234530D8D7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:39:22 +0100 (CET)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7GVF-0008D8-HE
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7GTZ-0006Vs-IK
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:37:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7GTX-0006sc-OU
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612352254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZUlR/rtXernnr/J5nN/Ds0KVfxEVUT71LWzjM057fM=;
 b=efuS06GnuM9bTKqEjG5VYbx8dic2/9iR0w1MVol4nOlhr/hfdKhs5TJy7wFWQvjKjFNu+c
 W4q3gfomisWdVIepa1D9r2D1WhfM98OesA5dWhOWbCvfxAU10HSWlP3jcTzijh01Qun9Ay
 bzX+VpPZ0EasUjEsTJHQQCZ1mFMz+Is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-VNtVm9xyOIq-HEhyx2nbHA-1; Wed, 03 Feb 2021 06:37:33 -0500
X-MC-Unique: VNtVm9xyOIq-HEhyx2nbHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 371A11966328;
 Wed,  3 Feb 2021 11:37:32 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDF165D9E8;
 Wed,  3 Feb 2021 11:37:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] virtiofsd: extract lo_do_open() from lo_open()
Date: Wed,  3 Feb 2021 11:37:17 +0000
Message-Id: <20210203113719.83633-2-stefanha@redhat.com>
In-Reply-To: <20210203113719.83633-1-stefanha@redhat.com>
References: <20210203113719.83633-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 P J P <ppandit@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qm90aCBsb19vcGVuKCkgYW5kIGxvX2NyZWF0ZSgpIGhhdmUgc2ltaWxhciBjb2RlIHRvIG9wZW4g
YSBmaWxlLiBFeHRyYWN0CmEgY29tbW9uIGxvX2RvX29wZW4oKSBmdW5jdGlvbiBmcm9tIGxvX29w
ZW4oKSB0aGF0IHdpbGwgYmUgdXNlZCBieQpsb19jcmVhdGUoKSBpbiBhIGxhdGVyIGNvbW1pdC4K
ClNpbmNlIGxvX2RvX29wZW4oKSBkb2VzIG5vdCBvdGhlcndpc2UgbmVlZCBmdXNlX3JlcV90IHJl
cSwgY29udmVydApsb19hZGRfZmRfbWFwcGluZygpIHRvIHVzZSBzdHJ1Y3QgbG9fZGF0YSAqbG8g
aW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0
LmNvbT4KLS0tCiB0b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hfbGwuYyB8IDczICsrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygr
KSwgMjcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdmlydGlvZnNkL3Bhc3N0aHJv
dWdoX2xsLmMgYi90b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hfbGwuYwppbmRleCA1ZmIzNmQ5
NDA3Li5lNjNjYmQzZmI3IDEwMDY0NAotLS0gYS90b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hf
bGwuYworKysgYi90b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hfbGwuYwpAQCAtNDU5LDE3ICs0
NTksMTcgQEAgc3RhdGljIHZvaWQgbG9fbWFwX3JlbW92ZShzdHJ1Y3QgbG9fbWFwICptYXAsIHNp
emVfdCBrZXkpCiB9CiAKIC8qIEFzc3VtZXMgbG8tPm11dGV4IGlzIGhlbGQgKi8KLXN0YXRpYyBz
c2l6ZV90IGxvX2FkZF9mZF9tYXBwaW5nKGZ1c2VfcmVxX3QgcmVxLCBpbnQgZmQpCitzdGF0aWMg
c3NpemVfdCBsb19hZGRfZmRfbWFwcGluZyhzdHJ1Y3QgbG9fZGF0YSAqbG8sIGludCBmZCkKIHsK
ICAgICBzdHJ1Y3QgbG9fbWFwX2VsZW0gKmVsZW07CiAKLSAgICBlbGVtID0gbG9fbWFwX2FsbG9j
X2VsZW0oJmxvX2RhdGEocmVxKS0+ZmRfbWFwKTsKKyAgICBlbGVtID0gbG9fbWFwX2FsbG9jX2Vs
ZW0oJmxvLT5mZF9tYXApOwogICAgIGlmICghZWxlbSkgewogICAgICAgICByZXR1cm4gLTE7CiAg
ICAgfQogCiAgICAgZWxlbS0+ZmQgPSBmZDsKLSAgICByZXR1cm4gZWxlbSAtIGxvX2RhdGEocmVx
KS0+ZmRfbWFwLmVsZW1zOworICAgIHJldHVybiBlbGVtIC0gbG8tPmZkX21hcC5lbGVtczsKIH0K
IAogLyogQXNzdW1lcyBsby0+bXV0ZXggaXMgaGVsZCAqLwpAQCAtMTY1MSw2ICsxNjUxLDM4IEBA
IHN0YXRpYyB2b2lkIHVwZGF0ZV9vcGVuX2ZsYWdzKGludCB3cml0ZWJhY2ssIGludCBhbGxvd19k
aXJlY3RfaW8sCiAgICAgfQogfQogCitzdGF0aWMgaW50IGxvX2RvX29wZW4oc3RydWN0IGxvX2Rh
dGEgKmxvLCBzdHJ1Y3QgbG9faW5vZGUgKmlub2RlLAorICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBmdXNlX2ZpbGVfaW5mbyAqZmkpCit7CisgICAgY2hhciBidWZbNjRdOworICAgIHNzaXpl
X3QgZmg7CisgICAgaW50IGZkOworCisgICAgdXBkYXRlX29wZW5fZmxhZ3MobG8tPndyaXRlYmFj
aywgbG8tPmFsbG93X2RpcmVjdF9pbywgZmkpOworCisgICAgc3ByaW50ZihidWYsICIlaSIsIGlu
b2RlLT5mZCk7CisgICAgZmQgPSBvcGVuYXQobG8tPnByb2Nfc2VsZl9mZCwgYnVmLCBmaS0+Zmxh
Z3MgJiB+T19OT0ZPTExPVyk7CisgICAgaWYgKGZkID09IC0xKSB7CisgICAgICAgIHJldHVybiAt
ZXJybm87CisgICAgfQorCisgICAgcHRocmVhZF9tdXRleF9sb2NrKCZsby0+bXV0ZXgpOworICAg
IGZoID0gbG9fYWRkX2ZkX21hcHBpbmcobG8sIGZkKTsKKyAgICBwdGhyZWFkX211dGV4X3VubG9j
aygmbG8tPm11dGV4KTsKKyAgICBpZiAoZmggPT0gLTEpIHsKKyAgICAgICAgY2xvc2UoZmQpOwor
ICAgICAgICByZXR1cm4gRU5PTUVNOworICAgIH0KKworICAgIGZpLT5maCA9IGZoOworICAgIGlm
IChsby0+Y2FjaGUgPT0gQ0FDSEVfTk9ORSkgeworICAgICAgICBmaS0+ZGlyZWN0X2lvID0gMTsK
KyAgICB9IGVsc2UgaWYgKGxvLT5jYWNoZSA9PSBDQUNIRV9BTFdBWVMpIHsKKyAgICAgICAgZmkt
PmtlZXBfY2FjaGUgPSAxOworICAgIH0KKyAgICByZXR1cm4gMDsKK30KKwogc3RhdGljIHZvaWQg
bG9fY3JlYXRlKGZ1c2VfcmVxX3QgcmVxLCBmdXNlX2lub190IHBhcmVudCwgY29uc3QgY2hhciAq
bmFtZSwKICAgICAgICAgICAgICAgICAgICAgICBtb2RlX3QgbW9kZSwgc3RydWN0IGZ1c2VfZmls
ZV9pbmZvICpmaSkKIHsKQEAgLTE2OTEsNyArMTcyMyw3IEBAIHN0YXRpYyB2b2lkIGxvX2NyZWF0
ZShmdXNlX3JlcV90IHJlcSwgZnVzZV9pbm9fdCBwYXJlbnQsIGNvbnN0IGNoYXIgKm5hbWUsCiAg
ICAgICAgIHNzaXplX3QgZmg7CiAKICAgICAgICAgcHRocmVhZF9tdXRleF9sb2NrKCZsby0+bXV0
ZXgpOwotICAgICAgICBmaCA9IGxvX2FkZF9mZF9tYXBwaW5nKHJlcSwgZmQpOworICAgICAgICBm
aCA9IGxvX2FkZF9mZF9tYXBwaW5nKGxvLCBmZCk7CiAgICAgICAgIHB0aHJlYWRfbXV0ZXhfdW5s
b2NrKCZsby0+bXV0ZXgpOwogICAgICAgICBpZiAoZmggPT0gLTEpIHsKICAgICAgICAgICAgIGNs
b3NlKGZkKTsKQEAgLTE4OTIsMzggKzE5MjQsMjUgQEAgc3RhdGljIHZvaWQgbG9fZnN5bmNkaXIo
ZnVzZV9yZXFfdCByZXEsIGZ1c2VfaW5vX3QgaW5vLCBpbnQgZGF0YXN5bmMsCiAKIHN0YXRpYyB2
b2lkIGxvX29wZW4oZnVzZV9yZXFfdCByZXEsIGZ1c2VfaW5vX3QgaW5vLCBzdHJ1Y3QgZnVzZV9m
aWxlX2luZm8gKmZpKQogewotICAgIGludCBmZDsKLSAgICBzc2l6ZV90IGZoOwotICAgIGNoYXIg
YnVmWzY0XTsKICAgICBzdHJ1Y3QgbG9fZGF0YSAqbG8gPSBsb19kYXRhKHJlcSk7CisgICAgc3Ry
dWN0IGxvX2lub2RlICppbm9kZSA9IGxvX2lub2RlKHJlcSwgaW5vKTsKKyAgICBpbnQgZXJyOwog
CiAgICAgZnVzZV9sb2coRlVTRV9MT0dfREVCVUcsICJsb19vcGVuKGlubz0lIiBQUkl1NjQgIiwg
ZmxhZ3M9JWQpXG4iLCBpbm8sCiAgICAgICAgICAgICAgZmktPmZsYWdzKTsKIAotICAgIHVwZGF0
ZV9vcGVuX2ZsYWdzKGxvLT53cml0ZWJhY2ssIGxvLT5hbGxvd19kaXJlY3RfaW8sIGZpKTsKLQot
ICAgIHNwcmludGYoYnVmLCAiJWkiLCBsb19mZChyZXEsIGlubykpOwotICAgIGZkID0gb3BlbmF0
KGxvLT5wcm9jX3NlbGZfZmQsIGJ1ZiwgZmktPmZsYWdzICYgfk9fTk9GT0xMT1cpOwotICAgIGlm
IChmZCA9PSAtMSkgewotICAgICAgICByZXR1cm4gKHZvaWQpZnVzZV9yZXBseV9lcnIocmVxLCBl
cnJubyk7Ci0gICAgfQotCi0gICAgcHRocmVhZF9tdXRleF9sb2NrKCZsby0+bXV0ZXgpOwotICAg
IGZoID0gbG9fYWRkX2ZkX21hcHBpbmcocmVxLCBmZCk7Ci0gICAgcHRocmVhZF9tdXRleF91bmxv
Y2soJmxvLT5tdXRleCk7Ci0gICAgaWYgKGZoID09IC0xKSB7Ci0gICAgICAgIGNsb3NlKGZkKTsK
LSAgICAgICAgZnVzZV9yZXBseV9lcnIocmVxLCBFTk9NRU0pOworICAgIGlmICghaW5vZGUpIHsK
KyAgICAgICAgZnVzZV9yZXBseV9lcnIocmVxLCBFQkFERik7CiAgICAgICAgIHJldHVybjsKICAg
ICB9CiAKLSAgICBmaS0+ZmggPSBmaDsKLSAgICBpZiAobG8tPmNhY2hlID09IENBQ0hFX05PTkUp
IHsKLSAgICAgICAgZmktPmRpcmVjdF9pbyA9IDE7Ci0gICAgfSBlbHNlIGlmIChsby0+Y2FjaGUg
PT0gQ0FDSEVfQUxXQVlTKSB7Ci0gICAgICAgIGZpLT5rZWVwX2NhY2hlID0gMTsKKyAgICBlcnIg
PSBsb19kb19vcGVuKGxvLCBpbm9kZSwgZmkpOworICAgIGxvX2lub2RlX3B1dChsbywgJmlub2Rl
KTsKKyAgICBpZiAoZXJyKSB7CisgICAgICAgIGZ1c2VfcmVwbHlfZXJyKHJlcSwgZXJyKTsKKyAg
ICB9IGVsc2UgeworICAgICAgICBmdXNlX3JlcGx5X29wZW4ocmVxLCBmaSk7CiAgICAgfQotICAg
IGZ1c2VfcmVwbHlfb3BlbihyZXEsIGZpKTsKIH0KIAogc3RhdGljIHZvaWQgbG9fcmVsZWFzZShm
dXNlX3JlcV90IHJlcSwgZnVzZV9pbm9fdCBpbm8sCi0tIAoyLjI5LjIKCg==


