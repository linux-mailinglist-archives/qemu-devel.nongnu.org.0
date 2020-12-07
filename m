Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C12D1784
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:27:45 +0100 (CET)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKIa-00027E-Q3
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKFT-0000Iv-UP
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKFL-0006se-Cg
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607361861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QaCzPXsqTrq72kSdeIVF6TTRT6cv8h2slHCk9dSuTA4=;
 b=EIOPfw4eLH0lcDwIGUcNOB9xqaBMRVgVoEy7CnD9oilCy+OvmVjlmdwL9RwHy0KxjbsiDz
 rNPZSsOxAV2M3M1v64tSmniGzaBY1MJl8YMcbe0zmykBnFsqD8USDEnJm/XV9lE959+0Xl
 NcVZBEsUU4hPefZ1bEz11G0HOMHan8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-2naF_mUQOKWRy532Mu4yKQ-1; Mon, 07 Dec 2020 12:24:19 -0500
X-MC-Unique: 2naF_mUQOKWRy532Mu4yKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2D681842151;
 Mon,  7 Dec 2020 17:24:17 +0000 (UTC)
Received: from localhost (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C06F5D6AD;
 Mon,  7 Dec 2020 17:24:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] libqtest: add qtest_remove_abrt_handler()
Date: Mon,  7 Dec 2020 17:20:22 +0000
Message-Id: <20201207172030.251905-5-stefanha@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIGEgZnVuY3Rpb24gdG8gcmVtb3ZlIHByZXZpb3VzbHktYWRkZWQgYWJydCBoYW5kbGVyIGZ1
bmN0aW9ucy4KCk5vdyB0aGF0IGEgc3ltbWV0cmljIHBhaXIgb2YgYWRkL3JlbW92ZSBmdW5jdGlv
bnMgZXhpc3RzIHdlIGNhbiBhbHNvCmJhbGFuY2UgdGhlIFNJR0FCUlQgaGFuZGxlciBpbnN0YWxs
YXRpb24uIFRoZSBzaWduYWwgaGFuZGxlciB3YXMKaW5zdGFsbGVkIGVhY2ggdGltZSBxdGVzdF9h
ZGRfYWJydF9oYW5kbGVyKCkgd2FzIGNhbGxlZC4gTm93IGl0IGlzCmluc3RhbGxlZCB3aGVuIHRo
ZSBhYnJ0IGhhbmRsZXIgbGlzdCBiZWNvbWVzIG5vbi1lbXB0eSBhbmQgcmVtb3ZlZCBhZ2Fpbgp3
aGVuIHRoZSBsaXN0IGJlY29tZXMgZW1wdHkuCgpUaGUgcXRlc3RfcmVtb3ZlX2FicnRfaGFuZGxl
cigpIGZ1bmN0aW9uIHdpbGwgYmUgdXNlZCBieQp2aG9zdC11c2VyLWJsay10ZXN0LgoKU2lnbmVk
LW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHRlc3Rz
L3F0ZXN0L2xpYnFvcy9saWJxdGVzdC5oIHwgMTggKysrKysrKysrKysrKysrKysrCiB0ZXN0cy9x
dGVzdC9saWJxdGVzdC5jICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdGVzdHMvcXRlc3QvbGlicW9zL2xpYnF0ZXN0LmggYi90ZXN0cy9xdGVz
dC9saWJxb3MvbGlicXRlc3QuaAppbmRleCA1MTI4N2I5Mjc2Li5hNjhkY2Q3OWQ0IDEwMDY0NAot
LS0gYS90ZXN0cy9xdGVzdC9saWJxb3MvbGlicXRlc3QuaAorKysgYi90ZXN0cy9xdGVzdC9saWJx
b3MvbGlicXRlc3QuaApAQCAtNjQ5LDggKzY0OSwyNiBAQCB2b2lkIHF0ZXN0X2FkZF9kYXRhX2Z1
bmNfZnVsbChjb25zdCBjaGFyICpzdHIsIHZvaWQgKmRhdGEsCiAgICAgICAgIGdfZnJlZShwYXRo
KTsgXAogICAgIH0gd2hpbGUgKDApCiAKKy8qKgorICogcXRlc3RfYWRkX2FicnRfaGFuZGxlcjoK
KyAqIEBmbjogSGFuZGxlciBmdW5jdGlvbgorICogQGRhdGE6IEFyZ3VtZW50IHRoYXQgaXMgcGFz
c2VkIHRvIHRoZSBoYW5kbGVyCisgKgorICogQWRkIGEgaGFuZGxlciBmdW5jdGlvbiB0aGF0IGlz
IGludm9rZWQgb24gU0lHQUJSVC4gVGhpcyBjYW4gYmUgdXNlZCB0bworICogdGVybWluYXRlIHBy
b2Nlc3NlcyBhbmQgcGVyZm9ybSBvdGhlciBjbGVhbnVwLiBUaGUgaGFuZGxlciBjYW4gYmUgcmVt
b3ZlZAorICogd2l0aCBxdGVzdF9yZW1vdmVfYWJydF9oYW5kbGVyKCkuCisgKi8KIHZvaWQgcXRl
c3RfYWRkX2FicnRfaGFuZGxlcihHSG9va0Z1bmMgZm4sIGNvbnN0IHZvaWQgKmRhdGEpOwogCisv
KioKKyAqIHF0ZXN0X3JlbW92ZV9hYnJ0X2hhbmRsZXI6CisgKiBAZGF0YTogQXJndW1lbnQgcHJl
dmlvdXNseSBwYXNzZWQgdG8gcXRlc3RfYWRkX2FicnRfaGFuZGxlcigpCisgKgorICogUmVtb3Zl
IGFuIGFicnQgaGFuZGxlciB0aGF0IHdhcyBwcmV2aW91c2x5IGFkZGVkIHdpdGgKKyAqIHF0ZXN0
X2FkZF9hYnJ0X2hhbmRsZXIoKS4KKyAqLwordm9pZCBxdGVzdF9yZW1vdmVfYWJydF9oYW5kbGVy
KHZvaWQgKmRhdGEpOworCiAvKioKICAqIHF0ZXN0X3FtcF9hc3NlcnRfc3VjY2VzczoKICAqIEBx
dHM6IFFUZXN0U3RhdGUgaW5zdGFuY2UgdG8gb3BlcmF0ZSBvbgpkaWZmIC0tZ2l0IGEvdGVzdHMv
cXRlc3QvbGlicXRlc3QuYyBiL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMKaW5kZXggY2MyY2VjNGEz
NS4uN2NmMjQ3YmFmMCAxMDA2NDQKLS0tIGEvdGVzdHMvcXRlc3QvbGlicXRlc3QuYworKysgYi90
ZXN0cy9xdGVzdC9saWJxdGVzdC5jCkBAIC0xOTYsMTUgKzE5NiwzMCBAQCBzdGF0aWMgdm9pZCBj
bGVhbnVwX3NpZ2FicnRfaGFuZGxlcih2b2lkKQogICAgIHNpZ2FjdGlvbihTSUdBQlJULCAmc2ln
YWN0X29sZCwgTlVMTCk7CiB9CiAKK3N0YXRpYyBib29sIGhvb2tfbGlzdF9pc19lbXB0eShHSG9v
a0xpc3QgKmhvb2tfbGlzdCkKK3sKKyAgICBHSG9vayAqaG9vayA9IGdfaG9va19maXJzdF92YWxp
ZChob29rX2xpc3QsIFRSVUUpOworCisgICAgaWYgKCFob29rKSB7CisgICAgICAgIHJldHVybiBm
YWxzZTsKKyAgICB9CisKKyAgICBnX2hvb2tfdW5yZWYoaG9va19saXN0LCBob29rKTsKKyAgICBy
ZXR1cm4gdHJ1ZTsKK30KKwogdm9pZCBxdGVzdF9hZGRfYWJydF9oYW5kbGVyKEdIb29rRnVuYyBm
biwgY29uc3Qgdm9pZCAqZGF0YSkKIHsKICAgICBHSG9vayAqaG9vazsKIAotICAgIC8qIE9ubHkg
aW5zdGFsbCBTSUdBQlJUIGhhbmRsZXIgb25jZSAqLwogICAgIGlmICghYWJydF9ob29rcy5pc19z
ZXR1cCkgewogICAgICAgICBnX2hvb2tfbGlzdF9pbml0KCZhYnJ0X2hvb2tzLCBzaXplb2YoR0hv
b2spKTsKICAgICB9Ci0gICAgc2V0dXBfc2lnYWJydF9oYW5kbGVyKCk7CisKKyAgICAvKiBPbmx5
IGluc3RhbGwgU0lHQUJSVCBoYW5kbGVyIG9uY2UgKi8KKyAgICBpZiAoaG9va19saXN0X2lzX2Vt
cHR5KCZhYnJ0X2hvb2tzKSkgeworICAgICAgICBzZXR1cF9zaWdhYnJ0X2hhbmRsZXIoKTsKKyAg
ICB9CiAKICAgICBob29rID0gZ19ob29rX2FsbG9jKCZhYnJ0X2hvb2tzKTsKICAgICBob29rLT5m
dW5jID0gZm47CkBAIC0yMTMsNiArMjI4LDE3IEBAIHZvaWQgcXRlc3RfYWRkX2FicnRfaGFuZGxl
cihHSG9va0Z1bmMgZm4sIGNvbnN0IHZvaWQgKmRhdGEpCiAgICAgZ19ob29rX3ByZXBlbmQoJmFi
cnRfaG9va3MsIGhvb2spOwogfQogCit2b2lkIHF0ZXN0X3JlbW92ZV9hYnJ0X2hhbmRsZXIodm9p
ZCAqZGF0YSkKK3sKKyAgICBHSG9vayAqaG9vayA9IGdfaG9va19maW5kX2RhdGEoJmFicnRfaG9v
a3MsIFRSVUUsIGRhdGEpOworICAgIGdfaG9va19kZXN0cm95X2xpbmsoJmFicnRfaG9va3MsIGhv
b2spOworCisgICAgLyogVW5pbnN0YWxsIFNJR0FCUlQgaGFuZGxlciBvbiBsYXN0IGluc3RhbmNl
ICovCisgICAgaWYgKGhvb2tfbGlzdF9pc19lbXB0eSgmYWJydF9ob29rcykpIHsKKyAgICAgICAg
Y2xlYW51cF9zaWdhYnJ0X2hhbmRsZXIoKTsKKyAgICB9Cit9CisKIHN0YXRpYyBjb25zdCBjaGFy
ICpxdGVzdF9xZW11X2JpbmFyeSh2b2lkKQogewogICAgIGNvbnN0IGNoYXIgKnFlbXVfYmluOwpA
QCAtMzY5LDEwICszOTUsNyBAQCBRVGVzdFN0YXRlICpxdGVzdF9pbml0X3dpdGhfc2VyaWFsKGNv
bnN0IGNoYXIgKmV4dHJhX2FyZ3MsIGludCAqc29ja19mZCkKIAogdm9pZCBxdGVzdF9xdWl0KFFU
ZXN0U3RhdGUgKnMpCiB7Ci0gICAgZ19ob29rX2Rlc3Ryb3lfbGluaygmYWJydF9ob29rcywgZ19o
b29rX2ZpbmRfZGF0YSgmYWJydF9ob29rcywgVFJVRSwgcykpOwotCi0gICAgLyogVW5pbnN0YWxs
IFNJR0FCUlQgaGFuZGxlciBvbiBsYXN0IGluc3RhbmNlICovCi0gICAgY2xlYW51cF9zaWdhYnJ0
X2hhbmRsZXIoKTsKKyAgICBxdGVzdF9yZW1vdmVfYWJydF9oYW5kbGVyKHMpOwogCiAgICAgcXRl
c3Rfa2lsbF9xZW11KHMpOwogICAgIGNsb3NlKHMtPmZkKTsKLS0gCjIuMjguMAoK


