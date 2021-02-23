Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE632322CE0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:53:33 +0100 (CET)
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZ48-0002sp-RY
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYzt-0006Dm-EI
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:49:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYzq-0002sz-47
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614091745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y8qdWHIUfw8ve2BOQIwqLEjAVRoTu34W9BFuTk9Oh6Q=;
 b=jP+siH8C9fJwsOPe02GPiFSq1y3Ek8FkdXQvz52T1Cxq/oD4dcuT7WpRqgB/sirCDQEz+W
 kmW/CvBiUK4VZuJ+phAfx0H0Ix9jtlZAQY16OZUq+pAiIx3Tw82bqtlGiyeF5BaTrthBrS
 fDQW4OGhAK6mK6Ooq+V7qqks0n2EnTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-lJJVwG91Nayb2JvMqzrfRg-1; Tue, 23 Feb 2021 09:49:03 -0500
X-MC-Unique: lJJVwG91Nayb2JvMqzrfRg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75A85C747F;
 Tue, 23 Feb 2021 14:47:23 +0000 (UTC)
Received: from localhost (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C75B60C04;
 Tue, 23 Feb 2021 14:47:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/12] libqtest: add qtest_socket_server()
Date: Tue, 23 Feb 2021 14:46:43 +0000
Message-Id: <20210223144653.811468-3-stefanha@redhat.com>
In-Reply-To: <20210223144653.811468-1-stefanha@redhat.com>
References: <20210223144653.811468-1-stefanha@redhat.com>
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
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIGFuIEFQSSB0aGF0IHJldHVybnMgYSBuZXcgVU5JWCBkb21haW4gc29ja2V0IGluIHRoZSBs
aXN0ZW4gc3RhdGUuClRoZSBjb2RlIGZvciB0aGlzIHdhcyBhbHJlYWR5IHRoZXJlIGJ1dCBvbmx5
IHVzZWQgaW50ZXJuYWxseSBpbgppbml0X3NvY2tldCgpLgoKVGhpcyBuZXcgQVBJIHdpbGwgYmUg
dXNlZCBieSB2aG9zdC11c2VyLWJsay10ZXN0LgoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5v
Y3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEh1dGggPHRodXRo
QHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBXYWluZXIgZG9zIFNhbnRvcyBNb3NjaGV0dGEgPHdh
aW5lcnNtQHJlZGhhdC5jb20+Ci0tLQogdGVzdHMvcXRlc3QvbGlicW9zL2xpYnF0ZXN0LmggfCAg
OCArKysrKysrCiB0ZXN0cy9xdGVzdC9saWJxdGVzdC5jICAgICAgICB8IDQwICsrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMo
KyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0L2xpYnFvcy9saWJx
dGVzdC5oIGIvdGVzdHMvcXRlc3QvbGlicW9zL2xpYnF0ZXN0LmgKaW5kZXggNzI0ZjY1YWE5NC4u
ZTVmMWVjNTkwYyAxMDA2NDQKLS0tIGEvdGVzdHMvcXRlc3QvbGlicW9zL2xpYnF0ZXN0LmgKKysr
IGIvdGVzdHMvcXRlc3QvbGlicW9zL2xpYnF0ZXN0LmgKQEAgLTEzMiw2ICsxMzIsMTQgQEAgdm9p
ZCBxdGVzdF9xbXBfc2VuZChRVGVzdFN0YXRlICpzLCBjb25zdCBjaGFyICpmbXQsIC4uLikKIHZv
aWQgcXRlc3RfcW1wX3NlbmRfcmF3KFFUZXN0U3RhdGUgKnMsIGNvbnN0IGNoYXIgKmZtdCwgLi4u
KQogICAgIEdDQ19GTVRfQVRUUigyLCAzKTsKIAorLyoqCisgKiBxdGVzdF9zb2NrZXRfc2VydmVy
OgorICogQHNvY2tldF9wYXRoOiB0aGUgVU5JWCBkb21haW4gc29ja2V0IHBhdGgKKyAqCisgKiBD
cmVhdGUgYW5kIHJldHVybiBhIGxpc3RlbiBzb2NrZXQgZmlsZSBkZXNjcmlwdG9yLCBvciBhYm9y
dCBvbiBmYWlsdXJlLgorICovCitpbnQgcXRlc3Rfc29ja2V0X3NlcnZlcihjb25zdCBjaGFyICpz
b2NrZXRfcGF0aCk7CisKIC8qKgogICogcXRlc3RfdnFtcF9mZHM6CiAgKiBAczogI1FUZXN0U3Rh
dGUgaW5zdGFuY2UgdG8gb3BlcmF0ZSBvbi4KZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0L2xpYnF0
ZXN0LmMgYi90ZXN0cy9xdGVzdC9saWJxdGVzdC5jCmluZGV4IGZkMDQzYjA1NzAuLmIxOWQyZWJk
YTAgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMKKysrIGIvdGVzdHMvcXRlc3Qv
bGlicXRlc3QuYwpAQCAtODEsMjQgKzgxLDggQEAgc3RhdGljIHZvaWQgcXRlc3RfY2xpZW50X3Nl
dF9yeF9oYW5kbGVyKFFUZXN0U3RhdGUgKnMsIFFUZXN0UmVjdkZuIHJlY3YpOwogCiBzdGF0aWMg
aW50IGluaXRfc29ja2V0KGNvbnN0IGNoYXIgKnNvY2tldF9wYXRoKQogewotICAgIHN0cnVjdCBz
b2NrYWRkcl91biBhZGRyOwotICAgIGludCBzb2NrOwotICAgIGludCByZXQ7Ci0KLSAgICBzb2Nr
ID0gc29ja2V0KFBGX1VOSVgsIFNPQ0tfU1RSRUFNLCAwKTsKLSAgICBnX2Fzc2VydF9jbXBpbnQo
c29jaywgIT0sIC0xKTsKLQotICAgIGFkZHIuc3VuX2ZhbWlseSA9IEFGX1VOSVg7Ci0gICAgc25w
cmludGYoYWRkci5zdW5fcGF0aCwgc2l6ZW9mKGFkZHIuc3VuX3BhdGgpLCAiJXMiLCBzb2NrZXRf
cGF0aCk7CisgICAgaW50IHNvY2sgPSBxdGVzdF9zb2NrZXRfc2VydmVyKHNvY2tldF9wYXRoKTsK
ICAgICBxZW11X3NldF9jbG9leGVjKHNvY2spOwotCi0gICAgZG8gewotICAgICAgICByZXQgPSBi
aW5kKHNvY2ssIChzdHJ1Y3Qgc29ja2FkZHIgKikmYWRkciwgc2l6ZW9mKGFkZHIpKTsKLSAgICB9
IHdoaWxlIChyZXQgPT0gLTEgJiYgZXJybm8gPT0gRUlOVFIpOwotICAgIGdfYXNzZXJ0X2NtcGlu
dChyZXQsICE9LCAtMSk7Ci0gICAgcmV0ID0gbGlzdGVuKHNvY2ssIDEpOwotICAgIGdfYXNzZXJ0
X2NtcGludChyZXQsICE9LCAtMSk7Ci0KICAgICByZXR1cm4gc29jazsKIH0KIApAQCAtNjM4LDYg
KzYyMiwyOCBAQCBRRGljdCAqcXRlc3RfcW1wX3JlY2VpdmVfZGljdChRVGVzdFN0YXRlICpzKQog
ICAgIHJldHVybiBxbXBfZmRfcmVjZWl2ZShzLT5xbXBfZmQpOwogfQogCitpbnQgcXRlc3Rfc29j
a2V0X3NlcnZlcihjb25zdCBjaGFyICpzb2NrZXRfcGF0aCkKK3sKKyAgICBzdHJ1Y3Qgc29ja2Fk
ZHJfdW4gYWRkcjsKKyAgICBpbnQgc29jazsKKyAgICBpbnQgcmV0OworCisgICAgc29jayA9IHNv
Y2tldChQRl9VTklYLCBTT0NLX1NUUkVBTSwgMCk7CisgICAgZ19hc3NlcnRfY21waW50KHNvY2ss
ICE9LCAtMSk7CisKKyAgICBhZGRyLnN1bl9mYW1pbHkgPSBBRl9VTklYOworICAgIHNucHJpbnRm
KGFkZHIuc3VuX3BhdGgsIHNpemVvZihhZGRyLnN1bl9wYXRoKSwgIiVzIiwgc29ja2V0X3BhdGgp
OworCisgICAgZG8geworICAgICAgICByZXQgPSBiaW5kKHNvY2ssIChzdHJ1Y3Qgc29ja2FkZHIg
KikmYWRkciwgc2l6ZW9mKGFkZHIpKTsKKyAgICB9IHdoaWxlIChyZXQgPT0gLTEgJiYgZXJybm8g
PT0gRUlOVFIpOworICAgIGdfYXNzZXJ0X2NtcGludChyZXQsICE9LCAtMSk7CisgICAgcmV0ID0g
bGlzdGVuKHNvY2ssIDEpOworICAgIGdfYXNzZXJ0X2NtcGludChyZXQsICE9LCAtMSk7CisKKyAg
ICByZXR1cm4gc29jazsKK30KKwogLyoqCiAgKiBBbGxvdyB1c2VycyB0byBzZW5kIGEgbWVzc2Fn
ZSB3aXRob3V0IHdhaXRpbmcgZm9yIHRoZSByZXBseSwKICAqIGluIHRoZSBjYXNlIHRoYXQgdGhl
eSBjaG9vc2UgdG8gZGlzY2FyZCBhbGwgcmVwbGllcyB1cCB1bnRpbAotLSAKMi4yOS4yCgo=


