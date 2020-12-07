Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668732D17B0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:41:02 +0100 (CET)
Received: from localhost ([::1]:55602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKVR-0004G0-Am
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKGH-00015G-N2
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:25:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKGA-0006yt-Dw
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607361911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0b0nIb4z3fwwAs2dMbfWngMbJiYIlkSjfLZDloyZ91M=;
 b=RYYUj9uRt6ynPe3qy3CkwOwK2V4lAAxWi6K9LX/lCLNSfrXJ6Nn7Ncbz1aOCnnf1W4gZKf
 qs/PgNkIDpE5TX0aJD5avabNpJMVv7+yROgIgTE0qL68uv2aDpWpgNQ0O+2fkwUjyvQZnE
 Wsaxu9e7dxM8krdvDmibvkdLu1mIFqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-SFTDohlANt-CGxrGmvIJfw-1; Mon, 07 Dec 2020 12:25:10 -0500
X-MC-Unique: SFTDohlANt-CGxrGmvIJfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0986B858181;
 Mon,  7 Dec 2020 17:25:09 +0000 (UTC)
Received: from localhost (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A6145D6AB;
 Mon,  7 Dec 2020 17:25:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] libqtest: add qtest_socket_server()
Date: Mon,  7 Dec 2020 17:20:20 +0000
Message-Id: <20201207172030.251905-3-stefanha@redhat.com>
In-Reply-To: <20201207172030.251905-1-stefanha@redhat.com>
References: <20201207172030.251905-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIGFuIEFQSSB0aGF0IHJldHVybnMgYSBuZXcgVU5JWCBkb21haW4gc29ja2V0IGluIHRoZSBs
aXN0ZW4gc3RhdGUuClRoZSBjb2RlIGZvciB0aGlzIHdhcyBhbHJlYWR5IHRoZXJlIGJ1dCBvbmx5
IHVzZWQgaW50ZXJuYWxseSBpbgppbml0X3NvY2tldCgpLgoKVGhpcyBuZXcgQVBJIHdpbGwgYmUg
dXNlZCBieSB2aG9zdC11c2VyLWJsay10ZXN0LgoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5v
Y3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHRlc3RzL3F0ZXN0L2xpYnFvcy9saWJxdGVz
dC5oIHwgIDggKysrKysrKwogdGVzdHMvcXRlc3QvbGlicXRlc3QuYyAgICAgICAgfCA0MCArKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNl
cnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9xdGVzdC9saWJx
b3MvbGlicXRlc3QuaCBiL3Rlc3RzL3F0ZXN0L2xpYnFvcy9saWJxdGVzdC5oCmluZGV4IDcyNGY2
NWFhOTQuLmU1ZjFlYzU5MGMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3F0ZXN0L2xpYnFvcy9saWJxdGVz
dC5oCisrKyBiL3Rlc3RzL3F0ZXN0L2xpYnFvcy9saWJxdGVzdC5oCkBAIC0xMzIsNiArMTMyLDE0
IEBAIHZvaWQgcXRlc3RfcW1wX3NlbmQoUVRlc3RTdGF0ZSAqcywgY29uc3QgY2hhciAqZm10LCAu
Li4pCiB2b2lkIHF0ZXN0X3FtcF9zZW5kX3JhdyhRVGVzdFN0YXRlICpzLCBjb25zdCBjaGFyICpm
bXQsIC4uLikKICAgICBHQ0NfRk1UX0FUVFIoMiwgMyk7CiAKKy8qKgorICogcXRlc3Rfc29ja2V0
X3NlcnZlcjoKKyAqIEBzb2NrZXRfcGF0aDogdGhlIFVOSVggZG9tYWluIHNvY2tldCBwYXRoCisg
KgorICogQ3JlYXRlIGFuZCByZXR1cm4gYSBsaXN0ZW4gc29ja2V0IGZpbGUgZGVzY3JpcHRvciwg
b3IgYWJvcnQgb24gZmFpbHVyZS4KKyAqLworaW50IHF0ZXN0X3NvY2tldF9zZXJ2ZXIoY29uc3Qg
Y2hhciAqc29ja2V0X3BhdGgpOworCiAvKioKICAqIHF0ZXN0X3ZxbXBfZmRzOgogICogQHM6ICNR
VGVzdFN0YXRlIGluc3RhbmNlIHRvIG9wZXJhdGUgb24uCmRpZmYgLS1naXQgYS90ZXN0cy9xdGVz
dC9saWJxdGVzdC5jIGIvdGVzdHMvcXRlc3QvbGlicXRlc3QuYwppbmRleCBlNDlmM2ExZTQ1Li5i
YzM4OWQ0MjJiIDEwMDY0NAotLS0gYS90ZXN0cy9xdGVzdC9saWJxdGVzdC5jCisrKyBiL3Rlc3Rz
L3F0ZXN0L2xpYnF0ZXN0LmMKQEAgLTgxLDI0ICs4MSw4IEBAIHN0YXRpYyB2b2lkIHF0ZXN0X2Ns
aWVudF9zZXRfcnhfaGFuZGxlcihRVGVzdFN0YXRlICpzLCBRVGVzdFJlY3ZGbiByZWN2KTsKIAog
c3RhdGljIGludCBpbml0X3NvY2tldChjb25zdCBjaGFyICpzb2NrZXRfcGF0aCkKIHsKLSAgICBz
dHJ1Y3Qgc29ja2FkZHJfdW4gYWRkcjsKLSAgICBpbnQgc29jazsKLSAgICBpbnQgcmV0OwotCi0g
ICAgc29jayA9IHNvY2tldChQRl9VTklYLCBTT0NLX1NUUkVBTSwgMCk7Ci0gICAgZ19hc3NlcnRf
Y21waW50KHNvY2ssICE9LCAtMSk7Ci0KLSAgICBhZGRyLnN1bl9mYW1pbHkgPSBBRl9VTklYOwot
ICAgIHNucHJpbnRmKGFkZHIuc3VuX3BhdGgsIHNpemVvZihhZGRyLnN1bl9wYXRoKSwgIiVzIiwg
c29ja2V0X3BhdGgpOworICAgIGludCBzb2NrID0gcXRlc3Rfc29ja2V0X3NlcnZlcihzb2NrZXRf
cGF0aCk7CiAgICAgcWVtdV9zZXRfY2xvZXhlYyhzb2NrKTsKLQotICAgIGRvIHsKLSAgICAgICAg
cmV0ID0gYmluZChzb2NrLCAoc3RydWN0IHNvY2thZGRyICopJmFkZHIsIHNpemVvZihhZGRyKSk7
Ci0gICAgfSB3aGlsZSAocmV0ID09IC0xICYmIGVycm5vID09IEVJTlRSKTsKLSAgICBnX2Fzc2Vy
dF9jbXBpbnQocmV0LCAhPSwgLTEpOwotICAgIHJldCA9IGxpc3Rlbihzb2NrLCAxKTsKLSAgICBn
X2Fzc2VydF9jbXBpbnQocmV0LCAhPSwgLTEpOwotCiAgICAgcmV0dXJuIHNvY2s7CiB9CiAKQEAg
LTYzNiw2ICs2MjAsMjggQEAgUURpY3QgKnF0ZXN0X3FtcF9yZWNlaXZlX2RpY3QoUVRlc3RTdGF0
ZSAqcykKICAgICByZXR1cm4gcW1wX2ZkX3JlY2VpdmUocy0+cW1wX2ZkKTsKIH0KIAoraW50IHF0
ZXN0X3NvY2tldF9zZXJ2ZXIoY29uc3QgY2hhciAqc29ja2V0X3BhdGgpCit7CisgICAgc3RydWN0
IHNvY2thZGRyX3VuIGFkZHI7CisgICAgaW50IHNvY2s7CisgICAgaW50IHJldDsKKworICAgIHNv
Y2sgPSBzb2NrZXQoUEZfVU5JWCwgU09DS19TVFJFQU0sIDApOworICAgIGdfYXNzZXJ0X2NtcGlu
dChzb2NrLCAhPSwgLTEpOworCisgICAgYWRkci5zdW5fZmFtaWx5ID0gQUZfVU5JWDsKKyAgICBz
bnByaW50ZihhZGRyLnN1bl9wYXRoLCBzaXplb2YoYWRkci5zdW5fcGF0aCksICIlcyIsIHNvY2tl
dF9wYXRoKTsKKworICAgIGRvIHsKKyAgICAgICAgcmV0ID0gYmluZChzb2NrLCAoc3RydWN0IHNv
Y2thZGRyICopJmFkZHIsIHNpemVvZihhZGRyKSk7CisgICAgfSB3aGlsZSAocmV0ID09IC0xICYm
IGVycm5vID09IEVJTlRSKTsKKyAgICBnX2Fzc2VydF9jbXBpbnQocmV0LCAhPSwgLTEpOworICAg
IHJldCA9IGxpc3Rlbihzb2NrLCAxKTsKKyAgICBnX2Fzc2VydF9jbXBpbnQocmV0LCAhPSwgLTEp
OworCisgICAgcmV0dXJuIHNvY2s7Cit9CisKIC8qKgogICogQWxsb3cgdXNlcnMgdG8gc2VuZCBh
IG1lc3NhZ2Ugd2l0aG91dCB3YWl0aW5nIGZvciB0aGUgcmVwbHksCiAgKiBpbiB0aGUgY2FzZSB0
aGF0IHRoZXkgY2hvb3NlIHRvIGRpc2NhcmQgYWxsIHJlcGxpZXMgdXAgdW50aWwKLS0gCjIuMjgu
MAoK


