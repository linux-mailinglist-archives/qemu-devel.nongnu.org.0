Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FD8322CDE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:52:45 +0100 (CET)
Received: from localhost ([::1]:34804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZ3M-00023Q-2w
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYz2-0005CE-NX
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:48:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYz0-0002Wt-VA
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614091694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DmVZJcbBH6faQxOuZ8eIPVwUJlg8MXiODXrTwyOpyRI=;
 b=DfuoNRCo5iQQv3p2A9JGIqR/2dC9GpHZpG+BwLiGK6HSYJ/ZGIbUXmy5/0D5cHCDhujEpU
 NpQYXRDH9afwr+RUlLpYGHcUYCQ6vB2hFXuKo3xjnFfJdXFVucy6FmAilV1rGKcMXsH0Xn
 /DYibdwpe1MbVNhEQkLzugdS44ChxFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-b0O1PPhfPRet1YcMzdLlHg-1; Tue, 23 Feb 2021 09:48:10 -0500
X-MC-Unique: b0O1PPhfPRet1YcMzdLlHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7022D18B6386;
 Tue, 23 Feb 2021 14:47:44 +0000 (UTC)
Received: from localhost (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7ABF5D9D3;
 Tue, 23 Feb 2021 14:47:37 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/12] libqtest: add qtest_remove_abrt_handler()
Date: Tue, 23 Feb 2021 14:46:45 +0000
Message-Id: <20210223144653.811468-5-stefanha@redhat.com>
In-Reply-To: <20210223144653.811468-1-stefanha@redhat.com>
References: <20210223144653.811468-1-stefanha@redhat.com>
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

QWRkIGEgZnVuY3Rpb24gdG8gcmVtb3ZlIHByZXZpb3VzbHktYWRkZWQgYWJydCBoYW5kbGVyIGZ1
bmN0aW9ucy4KCk5vdyB0aGF0IGEgc3ltbWV0cmljIHBhaXIgb2YgYWRkL3JlbW92ZSBmdW5jdGlv
bnMgZXhpc3RzIHdlIGNhbiBhbHNvCmJhbGFuY2UgdGhlIFNJR0FCUlQgaGFuZGxlciBpbnN0YWxs
YXRpb24uIFRoZSBzaWduYWwgaGFuZGxlciB3YXMKaW5zdGFsbGVkIGVhY2ggdGltZSBxdGVzdF9h
ZGRfYWJydF9oYW5kbGVyKCkgd2FzIGNhbGxlZC4gTm93IGl0IGlzCmluc3RhbGxlZCB3aGVuIHRo
ZSBhYnJ0IGhhbmRsZXIgbGlzdCBiZWNvbWVzIG5vbi1lbXB0eSBhbmQgcmVtb3ZlZCBhZ2Fpbgp3
aGVuIHRoZSBsaXN0IGJlY29tZXMgZW1wdHkuCgpUaGUgcXRlc3RfcmVtb3ZlX2FicnRfaGFuZGxl
cigpIGZ1bmN0aW9uIHdpbGwgYmUgdXNlZCBieQp2aG9zdC11c2VyLWJsay10ZXN0LgoKU2lnbmVk
LW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpSZXZpZXdlZC1i
eTogV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhIDx3YWluZXJzbUByZWRoYXQuY29tPgotLS0K
IHRlc3RzL3F0ZXN0L2xpYnFvcy9saWJxdGVzdC5oIHwgMTggKysrKysrKysrKysrKysrKysrCiB0
ZXN0cy9xdGVzdC9saWJxdGVzdC5jICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcXRlc3QvbGlicW9zL2xpYnF0ZXN0LmggYi90ZXN0
cy9xdGVzdC9saWJxb3MvbGlicXRlc3QuaAppbmRleCA1MTI4N2I5Mjc2Li5hNjhkY2Q3OWQ0IDEw
MDY0NAotLS0gYS90ZXN0cy9xdGVzdC9saWJxb3MvbGlicXRlc3QuaAorKysgYi90ZXN0cy9xdGVz
dC9saWJxb3MvbGlicXRlc3QuaApAQCAtNjQ5LDggKzY0OSwyNiBAQCB2b2lkIHF0ZXN0X2FkZF9k
YXRhX2Z1bmNfZnVsbChjb25zdCBjaGFyICpzdHIsIHZvaWQgKmRhdGEsCiAgICAgICAgIGdfZnJl
ZShwYXRoKTsgXAogICAgIH0gd2hpbGUgKDApCiAKKy8qKgorICogcXRlc3RfYWRkX2FicnRfaGFu
ZGxlcjoKKyAqIEBmbjogSGFuZGxlciBmdW5jdGlvbgorICogQGRhdGE6IEFyZ3VtZW50IHRoYXQg
aXMgcGFzc2VkIHRvIHRoZSBoYW5kbGVyCisgKgorICogQWRkIGEgaGFuZGxlciBmdW5jdGlvbiB0
aGF0IGlzIGludm9rZWQgb24gU0lHQUJSVC4gVGhpcyBjYW4gYmUgdXNlZCB0bworICogdGVybWlu
YXRlIHByb2Nlc3NlcyBhbmQgcGVyZm9ybSBvdGhlciBjbGVhbnVwLiBUaGUgaGFuZGxlciBjYW4g
YmUgcmVtb3ZlZAorICogd2l0aCBxdGVzdF9yZW1vdmVfYWJydF9oYW5kbGVyKCkuCisgKi8KIHZv
aWQgcXRlc3RfYWRkX2FicnRfaGFuZGxlcihHSG9va0Z1bmMgZm4sIGNvbnN0IHZvaWQgKmRhdGEp
OwogCisvKioKKyAqIHF0ZXN0X3JlbW92ZV9hYnJ0X2hhbmRsZXI6CisgKiBAZGF0YTogQXJndW1l
bnQgcHJldmlvdXNseSBwYXNzZWQgdG8gcXRlc3RfYWRkX2FicnRfaGFuZGxlcigpCisgKgorICog
UmVtb3ZlIGFuIGFicnQgaGFuZGxlciB0aGF0IHdhcyBwcmV2aW91c2x5IGFkZGVkIHdpdGgKKyAq
IHF0ZXN0X2FkZF9hYnJ0X2hhbmRsZXIoKS4KKyAqLwordm9pZCBxdGVzdF9yZW1vdmVfYWJydF9o
YW5kbGVyKHZvaWQgKmRhdGEpOworCiAvKioKICAqIHF0ZXN0X3FtcF9hc3NlcnRfc3VjY2VzczoK
ICAqIEBxdHM6IFFUZXN0U3RhdGUgaW5zdGFuY2UgdG8gb3BlcmF0ZSBvbgpkaWZmIC0tZ2l0IGEv
dGVzdHMvcXRlc3QvbGlicXRlc3QuYyBiL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMKaW5kZXggMmE5
OGRlMjkwNy4uNzFlMzU5ZWZjZCAxMDA2NDQKLS0tIGEvdGVzdHMvcXRlc3QvbGlicXRlc3QuYwor
KysgYi90ZXN0cy9xdGVzdC9saWJxdGVzdC5jCkBAIC0xOTYsMTUgKzE5NiwzMCBAQCBzdGF0aWMg
dm9pZCBjbGVhbnVwX3NpZ2FicnRfaGFuZGxlcih2b2lkKQogICAgIHNpZ2FjdGlvbihTSUdBQlJU
LCAmc2lnYWN0X29sZCwgTlVMTCk7CiB9CiAKK3N0YXRpYyBib29sIGhvb2tfbGlzdF9pc19lbXB0
eShHSG9va0xpc3QgKmhvb2tfbGlzdCkKK3sKKyAgICBHSG9vayAqaG9vayA9IGdfaG9va19maXJz
dF92YWxpZChob29rX2xpc3QsIFRSVUUpOworCisgICAgaWYgKCFob29rKSB7CisgICAgICAgIHJl
dHVybiBmYWxzZTsKKyAgICB9CisKKyAgICBnX2hvb2tfdW5yZWYoaG9va19saXN0LCBob29rKTsK
KyAgICByZXR1cm4gdHJ1ZTsKK30KKwogdm9pZCBxdGVzdF9hZGRfYWJydF9oYW5kbGVyKEdIb29r
RnVuYyBmbiwgY29uc3Qgdm9pZCAqZGF0YSkKIHsKICAgICBHSG9vayAqaG9vazsKIAotICAgIC8q
IE9ubHkgaW5zdGFsbCBTSUdBQlJUIGhhbmRsZXIgb25jZSAqLwogICAgIGlmICghYWJydF9ob29r
cy5pc19zZXR1cCkgewogICAgICAgICBnX2hvb2tfbGlzdF9pbml0KCZhYnJ0X2hvb2tzLCBzaXpl
b2YoR0hvb2spKTsKICAgICB9Ci0gICAgc2V0dXBfc2lnYWJydF9oYW5kbGVyKCk7CisKKyAgICAv
KiBPbmx5IGluc3RhbGwgU0lHQUJSVCBoYW5kbGVyIG9uY2UgKi8KKyAgICBpZiAoaG9va19saXN0
X2lzX2VtcHR5KCZhYnJ0X2hvb2tzKSkgeworICAgICAgICBzZXR1cF9zaWdhYnJ0X2hhbmRsZXIo
KTsKKyAgICB9CiAKICAgICBob29rID0gZ19ob29rX2FsbG9jKCZhYnJ0X2hvb2tzKTsKICAgICBo
b29rLT5mdW5jID0gZm47CkBAIC0yMTMsNiArMjI4LDE3IEBAIHZvaWQgcXRlc3RfYWRkX2FicnRf
aGFuZGxlcihHSG9va0Z1bmMgZm4sIGNvbnN0IHZvaWQgKmRhdGEpCiAgICAgZ19ob29rX3ByZXBl
bmQoJmFicnRfaG9va3MsIGhvb2spOwogfQogCit2b2lkIHF0ZXN0X3JlbW92ZV9hYnJ0X2hhbmRs
ZXIodm9pZCAqZGF0YSkKK3sKKyAgICBHSG9vayAqaG9vayA9IGdfaG9va19maW5kX2RhdGEoJmFi
cnRfaG9va3MsIFRSVUUsIGRhdGEpOworICAgIGdfaG9va19kZXN0cm95X2xpbmsoJmFicnRfaG9v
a3MsIGhvb2spOworCisgICAgLyogVW5pbnN0YWxsIFNJR0FCUlQgaGFuZGxlciBvbiBsYXN0IGlu
c3RhbmNlICovCisgICAgaWYgKGhvb2tfbGlzdF9pc19lbXB0eSgmYWJydF9ob29rcykpIHsKKyAg
ICAgICAgY2xlYW51cF9zaWdhYnJ0X2hhbmRsZXIoKTsKKyAgICB9Cit9CisKIHN0YXRpYyBjb25z
dCBjaGFyICpxdGVzdF9xZW11X2JpbmFyeSh2b2lkKQogewogICAgIGNvbnN0IGNoYXIgKnFlbXVf
YmluOwpAQCAtMzY5LDEwICszOTUsNyBAQCBRVGVzdFN0YXRlICpxdGVzdF9pbml0X3dpdGhfc2Vy
aWFsKGNvbnN0IGNoYXIgKmV4dHJhX2FyZ3MsIGludCAqc29ja19mZCkKIAogdm9pZCBxdGVzdF9x
dWl0KFFUZXN0U3RhdGUgKnMpCiB7Ci0gICAgZ19ob29rX2Rlc3Ryb3lfbGluaygmYWJydF9ob29r
cywgZ19ob29rX2ZpbmRfZGF0YSgmYWJydF9ob29rcywgVFJVRSwgcykpOwotCi0gICAgLyogVW5p
bnN0YWxsIFNJR0FCUlQgaGFuZGxlciBvbiBsYXN0IGluc3RhbmNlICovCi0gICAgY2xlYW51cF9z
aWdhYnJ0X2hhbmRsZXIoKTsKKyAgICBxdGVzdF9yZW1vdmVfYWJydF9oYW5kbGVyKHMpOwogCiAg
ICAgcXRlc3Rfa2lsbF9xZW11KHMpOwogICAgIGNsb3NlKHMtPmZkKTsKLS0gCjIuMjkuMgoK


