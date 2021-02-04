Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19030F5CD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:07:13 +0100 (CET)
Received: from localhost ([::1]:60610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gDw-0007OW-V1
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7g9V-000308-Q9
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:02:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7g9T-0002XV-Ug
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612450955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUguKk7pEcNYDonCk/K2qnrIwMEERiH0yxbvA57CzCA=;
 b=IUKCiqUTpoiEGzmhxTd4ZxTbrb/qE2euCbDUbjeMaBobkZ1aCWmk/Fq6p23U2ToA9ZTnHu
 ym2kNXaXb9qjDtPeKjJOBAbUZwFgqb2B/0vwQR8gE4ajmYgyfnOJ5ZsDJfzsAPDvUceb4E
 aSczUb9XllpcqskNo8wlyyIjMF+0bto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-lo0YQtksOKmX4yrWH2z8Aw-1; Thu, 04 Feb 2021 10:02:33 -0500
X-MC-Unique: lo0YQtksOKmX4yrWH2z8Aw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D1FA1936B61;
 Thu,  4 Feb 2021 15:02:32 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D3B55DA2D;
 Thu,  4 Feb 2021 15:02:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/3] virtiofsd: extract lo_do_open() from lo_open()
Date: Thu,  4 Feb 2021 15:02:06 +0000
Message-Id: <20210204150208.367837-2-stefanha@redhat.com>
In-Reply-To: <20210204150208.367837-1-stefanha@redhat.com>
References: <20210204150208.367837-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 Greg Kurz <groug@kaod.org>, P J P <ppandit@redhat.com>, virtio-fs@redhat.com,
 vgoyal@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qm90aCBsb19vcGVuKCkgYW5kIGxvX2NyZWF0ZSgpIGhhdmUgc2ltaWxhciBjb2RlIHRvIG9wZW4g
YSBmaWxlLiBFeHRyYWN0CmEgY29tbW9uIGxvX2RvX29wZW4oKSBmdW5jdGlvbiBmcm9tIGxvX29w
ZW4oKSB0aGF0IHdpbGwgYmUgdXNlZCBieQpsb19jcmVhdGUoKSBpbiBhIGxhdGVyIGNvbW1pdC4K
ClNpbmNlIGxvX2RvX29wZW4oKSBkb2VzIG5vdCBvdGhlcndpc2UgbmVlZCBmdXNlX3JlcV90IHJl
cSwgY29udmVydApsb19hZGRfZmRfbWFwcGluZygpIHRvIHVzZSBzdHJ1Y3QgbG9fZGF0YSAqbG8g
aW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0
LmNvbT4KLS0tCnY0OgogKiBSZXR1cm4gcG9zaXRpdmUgZXJybm8gaWYgb3BlbmF0KDIpIGZhaWxz
IGluIGxvX2RvX29wZW4oKSBbR3JlZ10KLS0tCiB0b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hf
bGwuYyB8IDczICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNDYgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMv
dmlydGlvZnNkL3Bhc3N0aHJvdWdoX2xsLmMgYi90b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hf
bGwuYwppbmRleCA1ZmIzNmQ5NDA3Li5mMTRmYTUxMjRkIDEwMDY0NAotLS0gYS90b29scy92aXJ0
aW9mc2QvcGFzc3Rocm91Z2hfbGwuYworKysgYi90b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hf
bGwuYwpAQCAtNDU5LDE3ICs0NTksMTcgQEAgc3RhdGljIHZvaWQgbG9fbWFwX3JlbW92ZShzdHJ1
Y3QgbG9fbWFwICptYXAsIHNpemVfdCBrZXkpCiB9CiAKIC8qIEFzc3VtZXMgbG8tPm11dGV4IGlz
IGhlbGQgKi8KLXN0YXRpYyBzc2l6ZV90IGxvX2FkZF9mZF9tYXBwaW5nKGZ1c2VfcmVxX3QgcmVx
LCBpbnQgZmQpCitzdGF0aWMgc3NpemVfdCBsb19hZGRfZmRfbWFwcGluZyhzdHJ1Y3QgbG9fZGF0
YSAqbG8sIGludCBmZCkKIHsKICAgICBzdHJ1Y3QgbG9fbWFwX2VsZW0gKmVsZW07CiAKLSAgICBl
bGVtID0gbG9fbWFwX2FsbG9jX2VsZW0oJmxvX2RhdGEocmVxKS0+ZmRfbWFwKTsKKyAgICBlbGVt
ID0gbG9fbWFwX2FsbG9jX2VsZW0oJmxvLT5mZF9tYXApOwogICAgIGlmICghZWxlbSkgewogICAg
ICAgICByZXR1cm4gLTE7CiAgICAgfQogCiAgICAgZWxlbS0+ZmQgPSBmZDsKLSAgICByZXR1cm4g
ZWxlbSAtIGxvX2RhdGEocmVxKS0+ZmRfbWFwLmVsZW1zOworICAgIHJldHVybiBlbGVtIC0gbG8t
PmZkX21hcC5lbGVtczsKIH0KIAogLyogQXNzdW1lcyBsby0+bXV0ZXggaXMgaGVsZCAqLwpAQCAt
MTY1MSw2ICsxNjUxLDM4IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9vcGVuX2ZsYWdzKGludCB3cml0
ZWJhY2ssIGludCBhbGxvd19kaXJlY3RfaW8sCiAgICAgfQogfQogCitzdGF0aWMgaW50IGxvX2Rv
X29wZW4oc3RydWN0IGxvX2RhdGEgKmxvLCBzdHJ1Y3QgbG9faW5vZGUgKmlub2RlLAorICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBmdXNlX2ZpbGVfaW5mbyAqZmkpCit7CisgICAgY2hhciBi
dWZbNjRdOworICAgIHNzaXplX3QgZmg7CisgICAgaW50IGZkOworCisgICAgdXBkYXRlX29wZW5f
ZmxhZ3MobG8tPndyaXRlYmFjaywgbG8tPmFsbG93X2RpcmVjdF9pbywgZmkpOworCisgICAgc3By
aW50ZihidWYsICIlaSIsIGlub2RlLT5mZCk7CisgICAgZmQgPSBvcGVuYXQobG8tPnByb2Nfc2Vs
Zl9mZCwgYnVmLCBmaS0+ZmxhZ3MgJiB+T19OT0ZPTExPVyk7CisgICAgaWYgKGZkID09IC0xKSB7
CisgICAgICAgIHJldHVybiBlcnJubzsKKyAgICB9CisKKyAgICBwdGhyZWFkX211dGV4X2xvY2so
JmxvLT5tdXRleCk7CisgICAgZmggPSBsb19hZGRfZmRfbWFwcGluZyhsbywgZmQpOworICAgIHB0
aHJlYWRfbXV0ZXhfdW5sb2NrKCZsby0+bXV0ZXgpOworICAgIGlmIChmaCA9PSAtMSkgeworICAg
ICAgICBjbG9zZShmZCk7CisgICAgICAgIHJldHVybiBFTk9NRU07CisgICAgfQorCisgICAgZmkt
PmZoID0gZmg7CisgICAgaWYgKGxvLT5jYWNoZSA9PSBDQUNIRV9OT05FKSB7CisgICAgICAgIGZp
LT5kaXJlY3RfaW8gPSAxOworICAgIH0gZWxzZSBpZiAobG8tPmNhY2hlID09IENBQ0hFX0FMV0FZ
UykgeworICAgICAgICBmaS0+a2VlcF9jYWNoZSA9IDE7CisgICAgfQorICAgIHJldHVybiAwOwor
fQorCiBzdGF0aWMgdm9pZCBsb19jcmVhdGUoZnVzZV9yZXFfdCByZXEsIGZ1c2VfaW5vX3QgcGFy
ZW50LCBjb25zdCBjaGFyICpuYW1lLAogICAgICAgICAgICAgICAgICAgICAgIG1vZGVfdCBtb2Rl
LCBzdHJ1Y3QgZnVzZV9maWxlX2luZm8gKmZpKQogewpAQCAtMTY5MSw3ICsxNzIzLDcgQEAgc3Rh
dGljIHZvaWQgbG9fY3JlYXRlKGZ1c2VfcmVxX3QgcmVxLCBmdXNlX2lub190IHBhcmVudCwgY29u
c3QgY2hhciAqbmFtZSwKICAgICAgICAgc3NpemVfdCBmaDsKIAogICAgICAgICBwdGhyZWFkX211
dGV4X2xvY2soJmxvLT5tdXRleCk7Ci0gICAgICAgIGZoID0gbG9fYWRkX2ZkX21hcHBpbmcocmVx
LCBmZCk7CisgICAgICAgIGZoID0gbG9fYWRkX2ZkX21hcHBpbmcobG8sIGZkKTsKICAgICAgICAg
cHRocmVhZF9tdXRleF91bmxvY2soJmxvLT5tdXRleCk7CiAgICAgICAgIGlmIChmaCA9PSAtMSkg
ewogICAgICAgICAgICAgY2xvc2UoZmQpOwpAQCAtMTg5MiwzOCArMTkyNCwyNSBAQCBzdGF0aWMg
dm9pZCBsb19mc3luY2RpcihmdXNlX3JlcV90IHJlcSwgZnVzZV9pbm9fdCBpbm8sIGludCBkYXRh
c3luYywKIAogc3RhdGljIHZvaWQgbG9fb3BlbihmdXNlX3JlcV90IHJlcSwgZnVzZV9pbm9fdCBp
bm8sIHN0cnVjdCBmdXNlX2ZpbGVfaW5mbyAqZmkpCiB7Ci0gICAgaW50IGZkOwotICAgIHNzaXpl
X3QgZmg7Ci0gICAgY2hhciBidWZbNjRdOwogICAgIHN0cnVjdCBsb19kYXRhICpsbyA9IGxvX2Rh
dGEocmVxKTsKKyAgICBzdHJ1Y3QgbG9faW5vZGUgKmlub2RlID0gbG9faW5vZGUocmVxLCBpbm8p
OworICAgIGludCBlcnI7CiAKICAgICBmdXNlX2xvZyhGVVNFX0xPR19ERUJVRywgImxvX29wZW4o
aW5vPSUiIFBSSXU2NCAiLCBmbGFncz0lZClcbiIsIGlubywKICAgICAgICAgICAgICBmaS0+Zmxh
Z3MpOwogCi0gICAgdXBkYXRlX29wZW5fZmxhZ3MobG8tPndyaXRlYmFjaywgbG8tPmFsbG93X2Rp
cmVjdF9pbywgZmkpOwotCi0gICAgc3ByaW50ZihidWYsICIlaSIsIGxvX2ZkKHJlcSwgaW5vKSk7
Ci0gICAgZmQgPSBvcGVuYXQobG8tPnByb2Nfc2VsZl9mZCwgYnVmLCBmaS0+ZmxhZ3MgJiB+T19O
T0ZPTExPVyk7Ci0gICAgaWYgKGZkID09IC0xKSB7Ci0gICAgICAgIHJldHVybiAodm9pZClmdXNl
X3JlcGx5X2VycihyZXEsIGVycm5vKTsKLSAgICB9Ci0KLSAgICBwdGhyZWFkX211dGV4X2xvY2so
JmxvLT5tdXRleCk7Ci0gICAgZmggPSBsb19hZGRfZmRfbWFwcGluZyhyZXEsIGZkKTsKLSAgICBw
dGhyZWFkX211dGV4X3VubG9jaygmbG8tPm11dGV4KTsKLSAgICBpZiAoZmggPT0gLTEpIHsKLSAg
ICAgICAgY2xvc2UoZmQpOwotICAgICAgICBmdXNlX3JlcGx5X2VycihyZXEsIEVOT01FTSk7Cisg
ICAgaWYgKCFpbm9kZSkgeworICAgICAgICBmdXNlX3JlcGx5X2VycihyZXEsIEVCQURGKTsKICAg
ICAgICAgcmV0dXJuOwogICAgIH0KIAotICAgIGZpLT5maCA9IGZoOwotICAgIGlmIChsby0+Y2Fj
aGUgPT0gQ0FDSEVfTk9ORSkgewotICAgICAgICBmaS0+ZGlyZWN0X2lvID0gMTsKLSAgICB9IGVs
c2UgaWYgKGxvLT5jYWNoZSA9PSBDQUNIRV9BTFdBWVMpIHsKLSAgICAgICAgZmktPmtlZXBfY2Fj
aGUgPSAxOworICAgIGVyciA9IGxvX2RvX29wZW4obG8sIGlub2RlLCBmaSk7CisgICAgbG9faW5v
ZGVfcHV0KGxvLCAmaW5vZGUpOworICAgIGlmIChlcnIpIHsKKyAgICAgICAgZnVzZV9yZXBseV9l
cnIocmVxLCBlcnIpOworICAgIH0gZWxzZSB7CisgICAgICAgIGZ1c2VfcmVwbHlfb3BlbihyZXEs
IGZpKTsKICAgICB9Ci0gICAgZnVzZV9yZXBseV9vcGVuKHJlcSwgZmkpOwogfQogCiBzdGF0aWMg
dm9pZCBsb19yZWxlYXNlKGZ1c2VfcmVxX3QgcmVxLCBmdXNlX2lub190IGlubywKLS0gCjIuMjku
MgoK


