Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0C230F5C4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:05:41 +0100 (CET)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gCS-0004n2-Uf
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7g9o-000356-2C
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:02:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7g9i-0002dU-8Y
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612450969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDEce3OIkshhfGWpJ6O1gNUvo+qNj3ylTwkmaF9ii04=;
 b=cTvHzeP5x7xKcFDaPDbja34W2hzekuCnP16iYvhHYkuogTiDt8ay0gF9UufC7nILl4wskS
 +71LyaWtmEiePA158lUfdDuFGYHEOv9QYX3tKF/8GkxQIHzV0gVFND/FW2LxrjQ+LQsKqm
 FxhpavdPzaLn7BOopxFfr3FJZJLtar4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-uY0QrSEKMQaDapBfBHJUag-1; Thu, 04 Feb 2021 10:02:47 -0500
X-MC-Unique: uY0QrSEKMQaDapBfBHJUag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8736107ACE6;
 Thu,  4 Feb 2021 15:02:46 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CF0160BE2;
 Thu,  4 Feb 2021 15:02:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/3] virtiofsd: optionally return inode pointer from
 lo_do_lookup()
Date: Thu,  4 Feb 2021 15:02:07 +0000
Message-Id: <20210204150208.367837-3-stefanha@redhat.com>
In-Reply-To: <20210204150208.367837-1-stefanha@redhat.com>
References: <20210204150208.367837-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

bG9fZG9fbG9va3VwKCkgZmluZHMgYW4gZXhpc3RpbmcgaW5vZGUgb3IgYWxsb2NhdGVzIGEgbmV3
IG9uZS4gSXQKaW5jcmVtZW50cyBubG9va3VwIHNvIHRoYXQgdGhlIGlub2RlIHN0YXlzIGFsaXZl
IHVudGlsIHRoZSBjbGllbnQKcmVsZWFzZXMgaXQuCgpFeGlzdGluZyBjYWxsZXJzIGRvbid0IG5l
ZWQgdGhlIHN0cnVjdCBsb19pbm9kZSBzbyB0aGUgZnVuY3Rpb24gZG9lc24ndApyZXR1cm4gaXQu
IEV4dGVuZCB0aGUgZnVuY3Rpb24gdG8gb3B0aW9uYWxseSByZXR1cm4gdGhlIGlub2RlLiBUaGUg
bmV4dApjb21taXQgd2lsbCBuZWVkIGl0LgoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3pp
IDxzdGVmYW5oYUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogR3JlZyBLdXJ6IDxncm91Z0BrYW9k
Lm9yZz4KLS0tCiB0b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hfbGwuYyB8IDI5ICsrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hf
bGwuYyBiL3Rvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jCmluZGV4IGYxNGZhNTEyNGQu
LmFhMzVmYzZiYTUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5j
CisrKyBiL3Rvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jCkBAIC04MzEsMTEgKzgzMSwx
MyBAQCBzdGF0aWMgaW50IGRvX3N0YXR4KHN0cnVjdCBsb19kYXRhICpsbywgaW50IGRpcmZkLCBj
b25zdCBjaGFyICpwYXRobmFtZSwKIH0KIAogLyoKLSAqIEluY3JlbWVudHMgbmxvb2t1cCBhbmQg
Y2FsbGVyIG11c3QgcmVsZWFzZSByZWZjb3VudCB1c2luZwotICogbG9faW5vZGVfcHV0KCZwYXJl
bnQpLgorICogSW5jcmVtZW50cyBubG9va3VwIG9uIHRoZSBpbm9kZSBvbiBzdWNjZXNzLiB1bnJl
Zl9pbm9kZV9sb2xvY2tlZCgpIG11c3QgYmUKKyAqIGNhbGxlZCBldmVudHVhbGx5IHRvIGRlY3Jl
bWVudCBubG9va3VwIGFnYWluLiBJZiBpbm9kZXAgaXMgbm9uLU5VTEwsIHRoZQorICogaW5vZGUg
cG9pbnRlciBpcyBzdG9yZWQgYW5kIHRoZSBjYWxsZXIgbXVzdCBjYWxsIGxvX2lub2RlX3B1dCgp
LgogICovCiBzdGF0aWMgaW50IGxvX2RvX2xvb2t1cChmdXNlX3JlcV90IHJlcSwgZnVzZV9pbm9f
dCBwYXJlbnQsIGNvbnN0IGNoYXIgKm5hbWUsCi0gICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgZnVzZV9lbnRyeV9wYXJhbSAqZSkKKyAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBm
dXNlX2VudHJ5X3BhcmFtICplLAorICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGxvX2lu
b2RlICoqaW5vZGVwKQogewogICAgIGludCBuZXdmZDsKICAgICBpbnQgcmVzOwpAQCAtODQ1LDYg
Kzg0NywxMCBAQCBzdGF0aWMgaW50IGxvX2RvX2xvb2t1cChmdXNlX3JlcV90IHJlcSwgZnVzZV9p
bm9fdCBwYXJlbnQsIGNvbnN0IGNoYXIgKm5hbWUsCiAgICAgc3RydWN0IGxvX2lub2RlICppbm9k
ZSA9IE5VTEw7CiAgICAgc3RydWN0IGxvX2lub2RlICpkaXIgPSBsb19pbm9kZShyZXEsIHBhcmVu
dCk7CiAKKyAgICBpZiAoaW5vZGVwKSB7CisgICAgICAgICppbm9kZXAgPSBOVUxMOworICAgIH0K
KwogICAgIC8qCiAgICAgICogbmFtZV90b19oYW5kbGVfYXQoKSBhbmQgb3Blbl9ieV9oYW5kbGVf
YXQoKSBjYW4gcmVhY2ggaGVyZSB3aXRoIGZ1c2UKICAgICAgKiBtb3VudCBwb2ludCBpbiBndWVz
dCwgYnV0IHdlIGRvbid0IGhhdmUgaXRzIGlub2RlIGluZm8gaW4gdGhlCkBAIC05MTMsNyArOTE5
LDE0IEBAIHN0YXRpYyBpbnQgbG9fZG9fbG9va3VwKGZ1c2VfcmVxX3QgcmVxLCBmdXNlX2lub190
IHBhcmVudCwgY29uc3QgY2hhciAqbmFtZSwKICAgICAgICAgcHRocmVhZF9tdXRleF91bmxvY2so
JmxvLT5tdXRleCk7CiAgICAgfQogICAgIGUtPmlubyA9IGlub2RlLT5mdXNlX2lubzsKLSAgICBs
b19pbm9kZV9wdXQobG8sICZpbm9kZSk7CisKKyAgICAvKiBUcmFuc2ZlciBvd25lcnNoaXAgb2Yg
aW5vZGUgcG9pbnRlciB0byBjYWxsZXIgb3IgZHJvcCBpdCAqLworICAgIGlmIChpbm9kZXApIHsK
KyAgICAgICAgKmlub2RlcCA9IGlub2RlOworICAgIH0gZWxzZSB7CisgICAgICAgIGxvX2lub2Rl
X3B1dChsbywgJmlub2RlKTsKKyAgICB9CisKICAgICBsb19pbm9kZV9wdXQobG8sICZkaXIpOwog
CiAgICAgZnVzZV9sb2coRlVTRV9MT0dfREVCVUcsICIgICVsbGkvJXMgLT4gJWxsaVxuIiwgKHVu
c2lnbmVkIGxvbmcgbG9uZylwYXJlbnQsCkBAIC05NDgsNyArOTYxLDcgQEAgc3RhdGljIHZvaWQg
bG9fbG9va3VwKGZ1c2VfcmVxX3QgcmVxLCBmdXNlX2lub190IHBhcmVudCwgY29uc3QgY2hhciAq
bmFtZSkKICAgICAgICAgcmV0dXJuOwogICAgIH0KIAotICAgIGVyciA9IGxvX2RvX2xvb2t1cChy
ZXEsIHBhcmVudCwgbmFtZSwgJmUpOworICAgIGVyciA9IGxvX2RvX2xvb2t1cChyZXEsIHBhcmVu
dCwgbmFtZSwgJmUsIE5VTEwpOwogICAgIGlmIChlcnIpIHsKICAgICAgICAgZnVzZV9yZXBseV9l
cnIocmVxLCBlcnIpOwogICAgIH0gZWxzZSB7CkBAIC0xMDU2LDcgKzEwNjksNyBAQCBzdGF0aWMg
dm9pZCBsb19ta25vZF9zeW1saW5rKGZ1c2VfcmVxX3QgcmVxLCBmdXNlX2lub190IHBhcmVudCwK
ICAgICAgICAgZ290byBvdXQ7CiAgICAgfQogCi0gICAgc2F2ZXJyID0gbG9fZG9fbG9va3VwKHJl
cSwgcGFyZW50LCBuYW1lLCAmZSk7CisgICAgc2F2ZXJyID0gbG9fZG9fbG9va3VwKHJlcSwgcGFy
ZW50LCBuYW1lLCAmZSwgTlVMTCk7CiAgICAgaWYgKHNhdmVycikgewogICAgICAgICBnb3RvIG91
dDsKICAgICB9CkBAIC0xNTM0LDcgKzE1NDcsNyBAQCBzdGF0aWMgdm9pZCBsb19kb19yZWFkZGly
KGZ1c2VfcmVxX3QgcmVxLCBmdXNlX2lub190IGlubywgc2l6ZV90IHNpemUsCiAKICAgICAgICAg
aWYgKHBsdXMpIHsKICAgICAgICAgICAgIGlmICghaXNfZG90X29yX2RvdGRvdChuYW1lKSkgewot
ICAgICAgICAgICAgICAgIGVyciA9IGxvX2RvX2xvb2t1cChyZXEsIGlubywgbmFtZSwgJmUpOwor
ICAgICAgICAgICAgICAgIGVyciA9IGxvX2RvX2xvb2t1cChyZXEsIGlubywgbmFtZSwgJmUsIE5V
TEwpOwogICAgICAgICAgICAgICAgIGlmIChlcnIpIHsKICAgICAgICAgICAgICAgICAgICAgZ290
byBlcnJvcjsKICAgICAgICAgICAgICAgICB9CkBAIC0xNzMyLDcgKzE3NDUsNyBAQCBzdGF0aWMg
dm9pZCBsb19jcmVhdGUoZnVzZV9yZXFfdCByZXEsIGZ1c2VfaW5vX3QgcGFyZW50LCBjb25zdCBj
aGFyICpuYW1lLAogICAgICAgICB9CiAKICAgICAgICAgZmktPmZoID0gZmg7Ci0gICAgICAgIGVy
ciA9IGxvX2RvX2xvb2t1cChyZXEsIHBhcmVudCwgbmFtZSwgJmUpOworICAgICAgICBlcnIgPSBs
b19kb19sb29rdXAocmVxLCBwYXJlbnQsIG5hbWUsICZlLCBOVUxMKTsKICAgICB9CiAgICAgaWYg
KGxvLT5jYWNoZSA9PSBDQUNIRV9OT05FKSB7CiAgICAgICAgIGZpLT5kaXJlY3RfaW8gPSAxOwot
LSAKMi4yOS4yCgo=


