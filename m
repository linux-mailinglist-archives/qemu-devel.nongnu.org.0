Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF0230D8ED
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:42:12 +0100 (CET)
Received: from localhost ([::1]:59592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7GXz-00042V-W3
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7GTj-0006Z9-UJ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:37:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7GTi-0006x5-4w
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612352265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRztS4MHO1oPKQP3FxzUgP0KvTeM7NL8o6+RlUPuA8Q=;
 b=ZC0JlgD5X5NPDsFY5qaE7ismjK2uPTHwPt/fNvSoaiSKzz46vMzk1nMzqte5WELwECB5Ny
 UYFxrUzNKjool3onQdBSahhHK/M6skjBX4bLZ17iyemibnQwr95kIHmF4ibhdsSHMgAIM/
 PhzzM8hQgY6Of7+enJ1NVaAaMwBCLi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-kq615wShPeuXG9j-ii_IIA-1; Wed, 03 Feb 2021 06:37:43 -0500
X-MC-Unique: kq615wShPeuXG9j-ii_IIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A11A1966320;
 Wed,  3 Feb 2021 11:37:42 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55E7E19C59;
 Wed,  3 Feb 2021 11:37:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] virtiofsd: optionally return inode pointer from
 lo_do_lookup()
Date: Wed,  3 Feb 2021 11:37:18 +0000
Message-Id: <20210203113719.83633-3-stefanha@redhat.com>
In-Reply-To: <20210203113719.83633-1-stefanha@redhat.com>
References: <20210203113719.83633-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 P J P <ppandit@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bG9fZG9fbG9va3VwKCkgZmluZHMgYW4gZXhpc3RpbmcgaW5vZGUgb3IgYWxsb2NhdGVzIGEgbmV3
IG9uZS4gSXQKaW5jcmVtZW50cyBubG9va3VwIHNvIHRoYXQgdGhlIGlub2RlIHN0YXlzIGFsaXZl
IHVudGlsIHRoZSBjbGllbnQKcmVsZWFzZXMgaXQuCgpFeGlzdGluZyBjYWxsZXJzIGRvbid0IG5l
ZWQgdGhlIHN0cnVjdCBsb19pbm9kZSBzbyB0aGUgZnVuY3Rpb24gZG9lc24ndApyZXR1cm4gaXQu
IEV4dGVuZCB0aGUgZnVuY3Rpb24gdG8gb3B0aW9uYWxseSByZXR1cm4gdGhlIGlub2RlLiBUaGUg
bmV4dApjb21taXQgd2lsbCBuZWVkIGl0LgoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3pp
IDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHRvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9s
bC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
MSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3ZpcnRp
b2ZzZC9wYXNzdGhyb3VnaF9sbC5jIGIvdG9vbHMvdmlydGlvZnNkL3Bhc3N0aHJvdWdoX2xsLmMK
aW5kZXggZTYzY2JkM2ZiNy4uYzg3YTFmM2Q3MiAxMDA2NDQKLS0tIGEvdG9vbHMvdmlydGlvZnNk
L3Bhc3N0aHJvdWdoX2xsLmMKKysrIGIvdG9vbHMvdmlydGlvZnNkL3Bhc3N0aHJvdWdoX2xsLmMK
QEAgLTgzMSwxMSArODMxLDEzIEBAIHN0YXRpYyBpbnQgZG9fc3RhdHgoc3RydWN0IGxvX2RhdGEg
KmxvLCBpbnQgZGlyZmQsIGNvbnN0IGNoYXIgKnBhdGhuYW1lLAogfQogCiAvKgotICogSW5jcmVt
ZW50cyBubG9va3VwIGFuZCBjYWxsZXIgbXVzdCByZWxlYXNlIHJlZmNvdW50IHVzaW5nCi0gKiBs
b19pbm9kZV9wdXQoJnBhcmVudCkuCisgKiBJbmNyZW1lbnRzIG5sb29rdXAgb24gdGhlIGlub2Rl
IG9uIHN1Y2Nlc3MuIHVucmVmX2lub2RlX2xvbG9ja2VkKCkgbXVzdCBiZQorICogY2FsbGVkIGV2
ZW50dWFsbHkgdG8gZGVjcmVtZW50IG5sb29rdXAgYWdhaW4uIElmIGlub2RlcCBpcyBub24tTlVM
TCwgdGhlCisgKiBpbm9kZSBwb2ludGVyIGlzIHN0b3JlZCBhbmQgdGhlIGNhbGxlciBtdXN0IGNh
bGwgbG9faW5vZGVfcHV0KCkuCiAgKi8KIHN0YXRpYyBpbnQgbG9fZG9fbG9va3VwKGZ1c2VfcmVx
X3QgcmVxLCBmdXNlX2lub190IHBhcmVudCwgY29uc3QgY2hhciAqbmFtZSwKLSAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBmdXNlX2VudHJ5X3BhcmFtICplKQorICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGZ1c2VfZW50cnlfcGFyYW0gKmUsCisgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgbG9faW5vZGUgKippbm9kZXApCiB7CiAgICAgaW50IG5ld2ZkOwogICAgIGlu
dCByZXM7CkBAIC04NDUsNiArODQ3LDEwIEBAIHN0YXRpYyBpbnQgbG9fZG9fbG9va3VwKGZ1c2Vf
cmVxX3QgcmVxLCBmdXNlX2lub190IHBhcmVudCwgY29uc3QgY2hhciAqbmFtZSwKICAgICBzdHJ1
Y3QgbG9faW5vZGUgKmlub2RlID0gTlVMTDsKICAgICBzdHJ1Y3QgbG9faW5vZGUgKmRpciA9IGxv
X2lub2RlKHJlcSwgcGFyZW50KTsKIAorICAgIGlmIChpbm9kZXApIHsKKyAgICAgICAgKmlub2Rl
cCA9IE5VTEw7CisgICAgfQorCiAgICAgLyoKICAgICAgKiBuYW1lX3RvX2hhbmRsZV9hdCgpIGFu
ZCBvcGVuX2J5X2hhbmRsZV9hdCgpIGNhbiByZWFjaCBoZXJlIHdpdGggZnVzZQogICAgICAqIG1v
dW50IHBvaW50IGluIGd1ZXN0LCBidXQgd2UgZG9uJ3QgaGF2ZSBpdHMgaW5vZGUgaW5mbyBpbiB0
aGUKQEAgLTkxMyw3ICs5MTksMTQgQEAgc3RhdGljIGludCBsb19kb19sb29rdXAoZnVzZV9yZXFf
dCByZXEsIGZ1c2VfaW5vX3QgcGFyZW50LCBjb25zdCBjaGFyICpuYW1lLAogICAgICAgICBwdGhy
ZWFkX211dGV4X3VubG9jaygmbG8tPm11dGV4KTsKICAgICB9CiAgICAgZS0+aW5vID0gaW5vZGUt
PmZ1c2VfaW5vOwotICAgIGxvX2lub2RlX3B1dChsbywgJmlub2RlKTsKKworICAgIC8qIFRyYW5z
ZmVyIG93bmVyc2hpcCBvZiBpbm9kZSBwb2ludGVyIHRvIGNhbGxlciBvciBkcm9wIGl0ICovCisg
ICAgaWYgKGlub2RlcCkgeworICAgICAgICAqaW5vZGVwID0gaW5vZGU7CisgICAgfSBlbHNlIHsK
KyAgICAgICAgbG9faW5vZGVfcHV0KGxvLCAmaW5vZGUpOworICAgIH0KKwogICAgIGxvX2lub2Rl
X3B1dChsbywgJmRpcik7CiAKICAgICBmdXNlX2xvZyhGVVNFX0xPR19ERUJVRywgIiAgJWxsaS8l
cyAtPiAlbGxpXG4iLCAodW5zaWduZWQgbG9uZyBsb25nKXBhcmVudCwKQEAgLTk0OCw3ICs5NjEs
NyBAQCBzdGF0aWMgdm9pZCBsb19sb29rdXAoZnVzZV9yZXFfdCByZXEsIGZ1c2VfaW5vX3QgcGFy
ZW50LCBjb25zdCBjaGFyICpuYW1lKQogICAgICAgICByZXR1cm47CiAgICAgfQogCi0gICAgZXJy
ID0gbG9fZG9fbG9va3VwKHJlcSwgcGFyZW50LCBuYW1lLCAmZSk7CisgICAgZXJyID0gbG9fZG9f
bG9va3VwKHJlcSwgcGFyZW50LCBuYW1lLCAmZSwgTlVMTCk7CiAgICAgaWYgKGVycikgewogICAg
ICAgICBmdXNlX3JlcGx5X2VycihyZXEsIGVycik7CiAgICAgfSBlbHNlIHsKQEAgLTEwNTYsNyAr
MTA2OSw3IEBAIHN0YXRpYyB2b2lkIGxvX21rbm9kX3N5bWxpbmsoZnVzZV9yZXFfdCByZXEsIGZ1
c2VfaW5vX3QgcGFyZW50LAogICAgICAgICBnb3RvIG91dDsKICAgICB9CiAKLSAgICBzYXZlcnIg
PSBsb19kb19sb29rdXAocmVxLCBwYXJlbnQsIG5hbWUsICZlKTsKKyAgICBzYXZlcnIgPSBsb19k
b19sb29rdXAocmVxLCBwYXJlbnQsIG5hbWUsICZlLCBOVUxMKTsKICAgICBpZiAoc2F2ZXJyKSB7
CiAgICAgICAgIGdvdG8gb3V0OwogICAgIH0KQEAgLTE1MzQsNyArMTU0Nyw3IEBAIHN0YXRpYyB2
b2lkIGxvX2RvX3JlYWRkaXIoZnVzZV9yZXFfdCByZXEsIGZ1c2VfaW5vX3QgaW5vLCBzaXplX3Qg
c2l6ZSwKIAogICAgICAgICBpZiAocGx1cykgewogICAgICAgICAgICAgaWYgKCFpc19kb3Rfb3Jf
ZG90ZG90KG5hbWUpKSB7Ci0gICAgICAgICAgICAgICAgZXJyID0gbG9fZG9fbG9va3VwKHJlcSwg
aW5vLCBuYW1lLCAmZSk7CisgICAgICAgICAgICAgICAgZXJyID0gbG9fZG9fbG9va3VwKHJlcSwg
aW5vLCBuYW1lLCAmZSwgTlVMTCk7CiAgICAgICAgICAgICAgICAgaWYgKGVycikgewogICAgICAg
ICAgICAgICAgICAgICBnb3RvIGVycm9yOwogICAgICAgICAgICAgICAgIH0KQEAgLTE3MzIsNyAr
MTc0NSw3IEBAIHN0YXRpYyB2b2lkIGxvX2NyZWF0ZShmdXNlX3JlcV90IHJlcSwgZnVzZV9pbm9f
dCBwYXJlbnQsIGNvbnN0IGNoYXIgKm5hbWUsCiAgICAgICAgIH0KIAogICAgICAgICBmaS0+Zmgg
PSBmaDsKLSAgICAgICAgZXJyID0gbG9fZG9fbG9va3VwKHJlcSwgcGFyZW50LCBuYW1lLCAmZSk7
CisgICAgICAgIGVyciA9IGxvX2RvX2xvb2t1cChyZXEsIHBhcmVudCwgbmFtZSwgJmUsIE5VTEwp
OwogICAgIH0KICAgICBpZiAobG8tPmNhY2hlID09IENBQ0hFX05PTkUpIHsKICAgICAgICAgZmkt
PmRpcmVjdF9pbyA9IDE7Ci0tIAoyLjI5LjIKCg==


