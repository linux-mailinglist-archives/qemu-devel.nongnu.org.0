Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074213C613B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:57:11 +0200 (CEST)
Received: from localhost ([::1]:40720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zF0-0004TD-30
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z97-0001k0-My
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:51:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z94-0002kD-JB
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626108662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6tXGTTyBGTz4k+ELORh+h+3xhjmsm4r8Ze4R0Xyq1c=;
 b=Nc83z9lxpPEG9CjIq4c8+M6I+ylobVgIarzBtVEltFErLw6Nc+8XhOBhJXfyUxB0diiqzD
 QPJ/XhIwrwg1ykPZBrPVOysAkufl1xLMz3jD3+LLVO3ggl8ox/Fp2URYACjPZqN5v01mq4
 i0L5oYWxkMvAj3/f9Xet7ppqgUBhO6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-dXnHicXjPY-bt837xfZKIg-1; Mon, 12 Jul 2021 12:50:55 -0400
X-MC-Unique: dXnHicXjPY-bt837xfZKIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF39B101F001;
 Mon, 12 Jul 2021 16:50:54 +0000 (UTC)
Received: from localhost (ovpn-112-230.ams2.redhat.com [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D85F62BFFD;
 Mon, 12 Jul 2021 16:50:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] trace/simple: add st_init_group
Date: Mon, 12 Jul 2021 17:50:00 +0100
Message-Id: <20210712165001.429113-6-stefanha@redhat.com>
In-Reply-To: <20210712165001.429113-1-stefanha@redhat.com>
References: <20210712165001.429113-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpBZGQgaGVscGVyIGZ1bmN0
aW9uIGFuZCBjYWxsIGl0IGZvciBlYWNoIHRyYWNlIGV2ZW50IGdyb3VwIGFkZGVkLgpNYWtlcyBz
dXJlIHRoYXQgZXZlbnRzIGFkZGVkIGF0IG1vZHVsZSBsb2FkIHRpbWUgYXJlIGluaXRpYWxpemVk
CnByb3Blcmx5LgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+ClJldmlld2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ck1l
c3NhZ2UtaWQ6IDIwMjEwNjAxMTMyNDE0LjQzMjQzMC02LWtyYXhlbEByZWRoYXQuY29tClNpZ25l
ZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiB0cmFj
ZS9zaW1wbGUuaCAgfCAgMSArCiB0cmFjZS9jb250cm9sLmMgfCAgNCArKysrCiB0cmFjZS9zaW1w
bGUuYyAgfCAxMiArKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3RyYWNlL3NpbXBsZS5oIGIvdHJhY2Uvc2ltcGxlLmgKaW5kZXggMjZj
Y2JjOGI4YS4uZWUxOTgzY2U1NiAxMDA2NDQKLS0tIGEvdHJhY2Uvc2ltcGxlLmgKKysrIGIvdHJh
Y2Uvc2ltcGxlLmgKQEAgLTE1LDYgKzE1LDcgQEAgdm9pZCBzdF9wcmludF90cmFjZV9maWxlX3N0
YXR1cyh2b2lkKTsKIGJvb2wgc3Rfc2V0X3RyYWNlX2ZpbGVfZW5hYmxlZChib29sIGVuYWJsZSk7
CiB2b2lkIHN0X3NldF90cmFjZV9maWxlKGNvbnN0IGNoYXIgKmZpbGUpOwogYm9vbCBzdF9pbml0
KHZvaWQpOwordm9pZCBzdF9pbml0X2dyb3VwKHNpemVfdCBncm91cCk7CiB2b2lkIHN0X2ZsdXNo
X3RyYWNlX2J1ZmZlcih2b2lkKTsKIAogdHlwZWRlZiBzdHJ1Y3QgewpkaWZmIC0tZ2l0IGEvdHJh
Y2UvY29udHJvbC5jIGIvdHJhY2UvY29udHJvbC5jCmluZGV4IDJjOTA0YjdlZTQuLmQ1YjY4ZTg0
NmUgMTAwNjQ0Ci0tLSBhL3RyYWNlL2NvbnRyb2wuYworKysgYi90cmFjZS9jb250cm9sLmMKQEAg
LTgyLDYgKzgyLDEwIEBAIHZvaWQgdHJhY2VfZXZlbnRfcmVnaXN0ZXJfZ3JvdXAoVHJhY2VFdmVu
dCAqKmV2ZW50cykKICAgICBldmVudF9ncm91cHMgPSBnX3JlbmV3KFRyYWNlRXZlbnRHcm91cCwg
ZXZlbnRfZ3JvdXBzLCBuZXZlbnRfZ3JvdXBzICsgMSk7CiAgICAgZXZlbnRfZ3JvdXBzW25ldmVu
dF9ncm91cHNdLmV2ZW50cyA9IGV2ZW50czsKICAgICBuZXZlbnRfZ3JvdXBzKys7CisKKyNpZmRl
ZiBDT05GSUdfVFJBQ0VfU0lNUExFCisgICAgc3RfaW5pdF9ncm91cChuZXZlbnRfZ3JvdXBzIC0g
MSk7CisjZW5kaWYKIH0KIAogCmRpZmYgLS1naXQgYS90cmFjZS9zaW1wbGUuYyBiL3RyYWNlL3Np
bXBsZS5jCmluZGV4IGVjMjE1NmQxMzUuLmFjNDk5ZWRlZTAgMTAwNjQ0Ci0tLSBhL3RyYWNlL3Np
bXBsZS5jCisrKyBiL3RyYWNlL3NpbXBsZS5jCkBAIC00MjIsMyArNDIyLDE1IEBAIGJvb2wgc3Rf
aW5pdCh2b2lkKQogICAgIGF0ZXhpdChzdF9mbHVzaF90cmFjZV9idWZmZXIpOwogICAgIHJldHVy
biB0cnVlOwogfQorCit2b2lkIHN0X2luaXRfZ3JvdXAoc2l6ZV90IGdyb3VwKQoreworICAgIFRy
YWNlRXZlbnRJdGVyIGl0ZXI7CisKKyAgICBpZiAoIXRyYWNlX3dyaXRlb3V0X2VuYWJsZWQpIHsK
KyAgICAgICAgcmV0dXJuOworICAgIH0KKworICAgIHRyYWNlX2V2ZW50X2l0ZXJfaW5pdF9ncm91
cCgmaXRlciwgZ3JvdXApOworICAgIHN0X3dyaXRlX2V2ZW50X21hcHBpbmcoJml0ZXIpOworfQot
LSAKMi4zMS4xCgo=


