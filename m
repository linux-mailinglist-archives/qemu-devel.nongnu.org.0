Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627322AF11B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:46:18 +0100 (CET)
Received: from localhost ([::1]:41524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpVx-0000NE-Ez
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpTq-0006jm-15
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:44:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpTo-00015a-4f
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMlxsT1A2PwrWQP6FgxhdbOLcNXcVbfWMZOK1BxuJuY=;
 b=AALgwDTgsxIFmjKRtFjWNjjExMlz9oqy50i20li2FmtTCyiFcyMl7Inv1Fblmtf3Vs0y0U
 6Qsp/SRF+r43rawiFl+DxaAGa0dQbo7zWgo69Eumpp5is7OaWg7yCB21TP9BK2rh9rdsH4
 P7/uFh09LtDYK9bEjosypPD/EoX0hbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-kpa6MiM-NBOxdPZXvtLDmA-1; Wed, 11 Nov 2020 07:44:01 -0500
X-MC-Unique: kpa6MiM-NBOxdPZXvtLDmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 758141007466;
 Wed, 11 Nov 2020 12:44:00 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CC765DA6A;
 Wed, 11 Nov 2020 12:43:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 03/10] libqtest: add qtest_socket_server()
Date: Wed, 11 Nov 2020 12:43:24 +0000
Message-Id: <20201111124331.1393747-4-stefanha@redhat.com>
In-Reply-To: <20201111124331.1393747-1-stefanha@redhat.com>
References: <20201111124331.1393747-1-stefanha@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlcmUgaXMgYSBxdGVzdF9zb2NrZXRfY2xpZW50KCkgQVBJLiBBZGQgYW4gZXF1aXZhbGVudApx
dGVzdF9zb2NrZXRfc2VydmVyKCkgQVBJIHRoYXQgcmV0dXJucyBhIG5ldyBVTklYIGRvbWFpbiBz
b2NrZXQgaW4gdGhlCmxpc3RlbiBzdGF0ZS4gVGhlIGNvZGUgZm9yIHRoaXMgd2FzIGFscmVhZHkg
dGhlcmUgYnV0IG9ubHkgdXNlZAppbnRlcm5hbGx5IGluIGluaXRfc29ja2V0KCkuCgpTaWduZWQt
b2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogdGVzdHMv
cXRlc3QvbGlicW9zL2xpYnF0ZXN0LmggfCAgOCArKysrKysrCiB0ZXN0cy9xdGVzdC9saWJxdGVz
dC5jICAgICAgICB8IDQwICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rlc3RzL3F0ZXN0L2xpYnFvcy9saWJxdGVzdC5oIGIvdGVzdHMvcXRlc3QvbGlicW9zL2xp
YnF0ZXN0LmgKaW5kZXggZDYyMzZlYTdhMC4uODc5MmMwOTM5OCAxMDA2NDQKLS0tIGEvdGVzdHMv
cXRlc3QvbGlicW9zL2xpYnF0ZXN0LmgKKysrIGIvdGVzdHMvcXRlc3QvbGlicW9zL2xpYnF0ZXN0
LmgKQEAgLTEzMiw2ICsxMzIsMTQgQEAgdm9pZCBxdGVzdF9xbXBfc2VuZChRVGVzdFN0YXRlICpz
LCBjb25zdCBjaGFyICpmbXQsIC4uLikKIHZvaWQgcXRlc3RfcW1wX3NlbmRfcmF3KFFUZXN0U3Rh
dGUgKnMsIGNvbnN0IGNoYXIgKmZtdCwgLi4uKQogICAgIEdDQ19GTVRfQVRUUigyLCAzKTsKIAor
LyoqCisgKiBxdGVzdF9zb2NrZXRfc2VydmVyOgorICogQHNvY2tldF9wYXRoOiB0aGUgVU5JWCBk
b21haW4gc29ja2V0IHBhdGgKKyAqCisgKiBDcmVhdGUgYW5kIHJldHVybiBhIGxpc3RlbiBzb2Nr
ZXQgZmlsZSBkZXNjcmlwdG9yLCBvciBhYm9ydCBvbiBmYWlsdXJlLgorICovCitpbnQgcXRlc3Rf
c29ja2V0X3NlcnZlcihjb25zdCBjaGFyICpzb2NrZXRfcGF0aCk7CisKIC8qKgogICogcXRlc3Rf
c29ja2V0X2NsaWVudDoKICAqIEBzZXJ2ZXJfc29ja2V0X3BhdGg6IHRoZSBzb2NrZXQgc2VydmVy
J3MgcGF0aApkaWZmIC0tZ2l0IGEvdGVzdHMvcXRlc3QvbGlicXRlc3QuYyBiL3Rlc3RzL3F0ZXN0
L2xpYnF0ZXN0LmMKaW5kZXggZmY1NjNjYmFiYS4uNTBhMzBmOGUxZiAxMDA2NDQKLS0tIGEvdGVz
dHMvcXRlc3QvbGlicXRlc3QuYworKysgYi90ZXN0cy9xdGVzdC9saWJxdGVzdC5jCkBAIC04Miwy
NCArODIsOCBAQCBzdGF0aWMgdm9pZCBxdGVzdF9jbGllbnRfc2V0X3J4X2hhbmRsZXIoUVRlc3RT
dGF0ZSAqcywgUVRlc3RSZWN2Rm4gcmVjdik7CiAKIHN0YXRpYyBpbnQgaW5pdF9zb2NrZXQoY29u
c3QgY2hhciAqc29ja2V0X3BhdGgpCiB7Ci0gICAgc3RydWN0IHNvY2thZGRyX3VuIGFkZHI7Ci0g
ICAgaW50IHNvY2s7Ci0gICAgaW50IHJldDsKLQotICAgIHNvY2sgPSBzb2NrZXQoUEZfVU5JWCwg
U09DS19TVFJFQU0sIDApOwotICAgIGdfYXNzZXJ0X2NtcGludChzb2NrLCAhPSwgLTEpOwotCi0g
ICAgYWRkci5zdW5fZmFtaWx5ID0gQUZfVU5JWDsKLSAgICBzbnByaW50ZihhZGRyLnN1bl9wYXRo
LCBzaXplb2YoYWRkci5zdW5fcGF0aCksICIlcyIsIHNvY2tldF9wYXRoKTsKKyAgICBpbnQgc29j
ayA9IHF0ZXN0X3NvY2tldF9zZXJ2ZXIoc29ja2V0X3BhdGgpOwogICAgIHFlbXVfc2V0X2Nsb2V4
ZWMoc29jayk7Ci0KLSAgICBkbyB7Ci0gICAgICAgIHJldCA9IGJpbmQoc29jaywgKHN0cnVjdCBz
b2NrYWRkciAqKSZhZGRyLCBzaXplb2YoYWRkcikpOwotICAgIH0gd2hpbGUgKHJldCA9PSAtMSAm
JiBlcnJubyA9PSBFSU5UUik7Ci0gICAgZ19hc3NlcnRfY21waW50KHJldCwgIT0sIC0xKTsKLSAg
ICByZXQgPSBsaXN0ZW4oc29jaywgMSk7Ci0gICAgZ19hc3NlcnRfY21waW50KHJldCwgIT0sIC0x
KTsKLQogICAgIHJldHVybiBzb2NrOwogfQogCkBAIC02NDMsNiArNjI3LDI4IEBAIFFUZXN0U3Rh
dGUgKnF0ZXN0X2NyZWF0ZV9zdGF0ZV93aXRoX3FtcF9mZChpbnQgZmQpCiAgICAgcmV0dXJuIHFt
cF90ZXN0X3N0YXRlOwogfQogCitpbnQgcXRlc3Rfc29ja2V0X3NlcnZlcihjb25zdCBjaGFyICpz
b2NrZXRfcGF0aCkKK3sKKyAgICBzdHJ1Y3Qgc29ja2FkZHJfdW4gYWRkcjsKKyAgICBpbnQgc29j
azsKKyAgICBpbnQgcmV0OworCisgICAgc29jayA9IHNvY2tldChQRl9VTklYLCBTT0NLX1NUUkVB
TSwgMCk7CisgICAgZ19hc3NlcnRfY21waW50KHNvY2ssICE9LCAtMSk7CisKKyAgICBhZGRyLnN1
bl9mYW1pbHkgPSBBRl9VTklYOworICAgIHNucHJpbnRmKGFkZHIuc3VuX3BhdGgsIHNpemVvZihh
ZGRyLnN1bl9wYXRoKSwgIiVzIiwgc29ja2V0X3BhdGgpOworCisgICAgZG8geworICAgICAgICBy
ZXQgPSBiaW5kKHNvY2ssIChzdHJ1Y3Qgc29ja2FkZHIgKikmYWRkciwgc2l6ZW9mKGFkZHIpKTsK
KyAgICB9IHdoaWxlIChyZXQgPT0gLTEgJiYgZXJybm8gPT0gRUlOVFIpOworICAgIGdfYXNzZXJ0
X2NtcGludChyZXQsICE9LCAtMSk7CisgICAgcmV0ID0gbGlzdGVuKHNvY2ssIDEpOworICAgIGdf
YXNzZXJ0X2NtcGludChyZXQsICE9LCAtMSk7CisKKyAgICByZXR1cm4gc29jazsKK30KKwogaW50
IHF0ZXN0X3NvY2tldF9jbGllbnQoY2hhciAqc2VydmVyX3NvY2tldF9wYXRoKQogewogICAgIHN0
cnVjdCBzb2NrYWRkcl91biBzZXJ2X2FkZHI7Ci0tIAoyLjI4LjAKCg==


