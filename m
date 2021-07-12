Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3401E3C60D9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:52:23 +0200 (CEST)
Received: from localhost ([::1]:54484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zAM-0003A7-7U
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z8c-0000M6-JG
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:50:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z8a-0002Q4-O8
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626108632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xJcxWwSjmJylz7AT/BUftWVhBLWaqj8nNir0VLXnYyQ=;
 b=MYK4CTFAMcnaYntk+ClU18EjGxNC9qxpG7a3ky8fkvkHhIDvLYQEnkjNa59ow6xSpv+2OT
 clGg/jaystVKqvEYwCe9xmCn+RcT+8ceG7FGOq96OpbLbvcZzbmiKYxvkPpku01te1QQ5J
 g0wcZShiPzI7rn1v3XhfYoMjKvWMX7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-t-kOTsU8O-qRRLnLZyv0xg-1; Mon, 12 Jul 2021 12:50:30 -0400
X-MC-Unique: t-kOTsU8O-qRRLnLZyv0xg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 765051084F56;
 Mon, 12 Jul 2021 16:50:29 +0000 (UTC)
Received: from localhost (ovpn-112-230.ams2.redhat.com [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17ADE5D9CA;
 Mon, 12 Jul 2021 16:50:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] trace: add trace_event_iter_init_group
Date: Mon, 12 Jul 2021 17:49:58 +0100
Message-Id: <20210712165001.429113-4-stefanha@redhat.com>
In-Reply-To: <20210712165001.429113-1-stefanha@redhat.com>
References: <20210712165001.429113-1-stefanha@redhat.com>
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
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpUaGlzIGFsbG93cyB0byBp
bnRlcmF0ZSBvdmVyIGFuIGV2ZW50IGdyb3VwLgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFu
biA8a3JheGVsQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjEwNjAxMTMyNDE0LjQzMjQzMC00LWtyYXhl
bEByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVk
aGF0LmNvbT4KLS0tCiB0cmFjZS9jb250cm9sLmggfCAxMyArKysrKysrKysrKysrCiB0cmFjZS9j
b250cm9sLmMgfCAxOSArKysrKysrKysrKysrKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdHJhY2UvY29udHJvbC5o
IGIvdHJhY2UvY29udHJvbC5oCmluZGV4IGNlNDBiZDA0MDUuLjIzYjgzOTNiMjkgMTAwNjQ0Ci0t
LSBhL3RyYWNlL2NvbnRyb2wuaAorKysgYi90cmFjZS9jb250cm9sLmgKQEAgLTEzLDggKzEzLDEx
IEBACiAjaW5jbHVkZSAiZXZlbnQtaW50ZXJuYWwuaCIKIAogdHlwZWRlZiBzdHJ1Y3QgVHJhY2VF
dmVudEl0ZXIgeworICAgIC8qIGl0ZXIgc3RhdGUgKi8KICAgICBzaXplX3QgZXZlbnQ7CiAgICAg
c2l6ZV90IGdyb3VwOworICAgIC8qIGZpbHRlciBjb25kaXRpb25zICovCisgICAgc2l6ZV90IGdy
b3VwX2lkOwogICAgIGNvbnN0IGNoYXIgKnBhdHRlcm47CiB9IFRyYWNlRXZlbnRJdGVyOwogCkBA
IC0zOSw2ICs0MiwxNiBAQCB2b2lkIHRyYWNlX2V2ZW50X2l0ZXJfaW5pdF9hbGwoVHJhY2VFdmVu
dEl0ZXIgKml0ZXIpOwogICovCiB2b2lkIHRyYWNlX2V2ZW50X2l0ZXJfaW5pdF9wYXR0ZXJuKFRy
YWNlRXZlbnRJdGVyICppdGVyLCBjb25zdCBjaGFyICpwYXR0ZXJuKTsKIAorLyoqCisgKiB0cmFj
ZV9ldmVudF9pdGVyX2luaXRfZ3JvdXA6CisgKiBAaXRlcjogdGhlIGV2ZW50IGl0ZXJhdG9yIHN0
cnVjdAorICogQGdyb3VwX2lkOiBncm91cF9pZCB0byBmaWx0ZXIgZXZlbnRzIGJ5IGdyb3VwLgor
ICoKKyAqIEluaXRpYWxpemUgdGhlIGV2ZW50IGl0ZXJhdG9yIHN0cnVjdCBAaXRlciwKKyAqIHVz
aW5nIEBncm91cF9pZCB0byBmaWx0ZXIgZm9yIGV2ZW50cyBpbiB0aGUgZ3JvdXAuCisgKi8KK3Zv
aWQgdHJhY2VfZXZlbnRfaXRlcl9pbml0X2dyb3VwKFRyYWNlRXZlbnRJdGVyICppdGVyLCBzaXpl
X3QgZ3JvdXBfaWQpOworCiAvKioKICAqIHRyYWNlX2V2ZW50X2l0ZXJfbmV4dDoKICAqIEBpdGVy
OiB0aGUgZXZlbnQgaXRlcmF0b3Igc3RydWN0CmRpZmYgLS1naXQgYS90cmFjZS9jb250cm9sLmMg
Yi90cmFjZS9jb250cm9sLmMKaW5kZXggZWQzOGU4MTNiMi4uMmM5MDRiN2VlNCAxMDA2NDQKLS0t
IGEvdHJhY2UvY29udHJvbC5jCisrKyBiL3RyYWNlL2NvbnRyb2wuYwpAQCAtMTA0LDYgKzEwNCw3
IEBAIHZvaWQgdHJhY2VfZXZlbnRfaXRlcl9pbml0X2FsbChUcmFjZUV2ZW50SXRlciAqaXRlcikK
IHsKICAgICBpdGVyLT5ldmVudCA9IDA7CiAgICAgaXRlci0+Z3JvdXAgPSAwOworICAgIGl0ZXIt
Pmdyb3VwX2lkID0gLTE7CiAgICAgaXRlci0+cGF0dGVybiA9IE5VTEw7CiB9CiAKQEAgLTExMywy
MCArMTE0LDMyIEBAIHZvaWQgdHJhY2VfZXZlbnRfaXRlcl9pbml0X3BhdHRlcm4oVHJhY2VFdmVu
dEl0ZXIgKml0ZXIsIGNvbnN0IGNoYXIgKnBhdHRlcm4pCiAgICAgaXRlci0+cGF0dGVybiA9IHBh
dHRlcm47CiB9CiAKK3ZvaWQgdHJhY2VfZXZlbnRfaXRlcl9pbml0X2dyb3VwKFRyYWNlRXZlbnRJ
dGVyICppdGVyLCBzaXplX3QgZ3JvdXBfaWQpCit7CisgICAgdHJhY2VfZXZlbnRfaXRlcl9pbml0
X2FsbChpdGVyKTsKKyAgICBpdGVyLT5ncm91cF9pZCA9IGdyb3VwX2lkOworfQorCiBUcmFjZUV2
ZW50ICp0cmFjZV9ldmVudF9pdGVyX25leHQoVHJhY2VFdmVudEl0ZXIgKml0ZXIpCiB7CiAgICAg
d2hpbGUgKGl0ZXItPmdyb3VwIDwgbmV2ZW50X2dyb3VwcyAmJgogICAgICAgICAgICBldmVudF9n
cm91cHNbaXRlci0+Z3JvdXBdLmV2ZW50c1tpdGVyLT5ldmVudF0gIT0gTlVMTCkgewogICAgICAg
ICBUcmFjZUV2ZW50ICpldiA9IGV2ZW50X2dyb3Vwc1tpdGVyLT5ncm91cF0uZXZlbnRzW2l0ZXIt
PmV2ZW50XTsKKyAgICAgICAgc2l6ZV90IGdyb3VwID0gaXRlci0+Z3JvdXA7CiAgICAgICAgIGl0
ZXItPmV2ZW50Kys7CiAgICAgICAgIGlmIChldmVudF9ncm91cHNbaXRlci0+Z3JvdXBdLmV2ZW50
c1tpdGVyLT5ldmVudF0gPT0gTlVMTCkgewogICAgICAgICAgICAgaXRlci0+ZXZlbnQgPSAwOwog
ICAgICAgICAgICAgaXRlci0+Z3JvdXArKzsKICAgICAgICAgfQotICAgICAgICBpZiAoIWl0ZXIt
PnBhdHRlcm4gfHwKLSAgICAgICAgICAgIGdfcGF0dGVybl9tYXRjaF9zaW1wbGUoaXRlci0+cGF0
dGVybiwgdHJhY2VfZXZlbnRfZ2V0X25hbWUoZXYpKSkgewotICAgICAgICAgICAgcmV0dXJuIGV2
OworICAgICAgICBpZiAoaXRlci0+cGF0dGVybiAmJgorICAgICAgICAgICAgIWdfcGF0dGVybl9t
YXRjaF9zaW1wbGUoaXRlci0+cGF0dGVybiwgdHJhY2VfZXZlbnRfZ2V0X25hbWUoZXYpKSkgewor
ICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgIH0KKyAgICAgICAgaWYgKGl0ZXItPmdyb3Vw
X2lkICE9IC0xICYmCisgICAgICAgICAgICBpdGVyLT5ncm91cF9pZCAhPSBncm91cCkgeworICAg
ICAgICAgICAgY29udGludWU7CisgICAgICAgIH0KKyAgICAgICAgcmV0dXJuIGV2OwogICAgIH0K
IAogICAgIHJldHVybiBOVUxMOwotLSAKMi4zMS4xCgo=


