Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6374932982A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:36:34 +0100 (CET)
Received: from localhost ([::1]:36926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH1SD-00075H-GE
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lH1Lh-0003Yt-MF
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:29:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lH1La-0006X7-4z
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614677380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NSn1IsWlcSv4k+PHJ/QjqVzjsqcD6JhkBUe9xeOfuS0=;
 b=O8v19trZiNoY7t4IS5APEiN1i/2l5JRF40VwouAT1epJgjmuxGXckxgTcELSp0Hxsp5abc
 aRumj3JzlyTF4fGLzsrY0VcyQjmFZCEKZxAndB+0Gy/YN+mqfLKC1My0FY4oBOnrFmpou6
 SpCZcF7KQkf/uwAtoolHmI+13rmoVkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-86rMww6LPgKBh6BEKJ9-Pw-1; Tue, 02 Mar 2021 04:29:38 -0500
X-MC-Unique: 86rMww6LPgKBh6BEKJ9-Pw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9F80801976;
 Tue,  2 Mar 2021 09:29:37 +0000 (UTC)
Received: from localhost (ovpn-114-138.ams2.redhat.com [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E91F1F455;
 Tue,  2 Mar 2021 09:29:27 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qemu-storage-daemon: add --pidfile option
Date: Tue,  2 Mar 2021 09:29:26 +0000
Message-Id: <20210302092926.163080-1-stefanha@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-block@nongnu.org, afrosi@redhat.com,
 "Richard W . M . Jones" <rjones@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RGFlbW9ucyBvZnRlbiBoYXZlIGEgLS1waWRmaWxlIG9wdGlvbiB3aGVyZSB0aGUgcGlkIGlzIHdy
aXR0ZW4gdG8gYSBmaWxlCnNvIHRoYXQgc2NyaXB0cyBjYW4gc3RvcCB0aGUgZGFlbW9uIGJ5IHNl
bmRpbmcgYSBzaWduYWwuCgpUaGUgcGlkIGZpbGUgYWxzbyBhY3RzIGFzIGEgbG9jayB0byBwcmV2
ZW50IG11bHRpcGxlIGluc3RhbmNlcyBvZiB0aGUKZGFlbW9uIGZyb20gbGF1bmNoaW5nIGZvciBh
IGdpdmVuIHBpZCBmaWxlLgoKUUVNVSwgcWVtdS1uYmQsIHFlbXUtZ2EsIHZpcnRpb2ZzZCwgYW5k
IHFlbXUtcHItaGVscGVyIGFsbCBzdXBwb3J0IHRoZQotLXBpZGZpbGUgb3B0aW9uLiBBZGQgaXQg
dG8gcWVtdS1zdG9yYWdlLWRhZW1vbiB0b28uCgpSZXBvcnRlZC1ieTogUmljaGFyZCBXLk0uIEpv
bmVzIDxyam9uZXNAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxz
dGVmYW5oYUByZWRoYXQuY29tPgotLS0KdjI6CiAqIEFkZCBkb2N1bWVudGF0aW9uIGFib3V0IHN0
YXJ0dXAgb3JkZXIgW1JpY2gsIERhbmllbF0KCiBkb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVt
b24ucnN0ICAgfCAxNCArKysrKysrKysrKysKIHN0b3JhZ2UtZGFlbW9uL3FlbXUtc3RvcmFnZS1k
YWVtb24uYyB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RvY3MvdG9vbHMvcWVtdS1zdG9yYWdl
LWRhZW1vbi5yc3QgYi9kb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVtb24ucnN0CmluZGV4IGY2
MzYyN2VhZjYuLjNkOTcwNGQ4MzUgMTAwNjQ0Ci0tLSBhL2RvY3MvdG9vbHMvcWVtdS1zdG9yYWdl
LWRhZW1vbi5yc3QKKysrIGIvZG9jcy90b29scy9xZW11LXN0b3JhZ2UtZGFlbW9uLnJzdApAQCAt
MTE4LDYgKzExOCwyMCBAQCBTdGFuZGFyZCBvcHRpb25zOgogICBMaXN0IG9iamVjdCBwcm9wZXJ0
aWVzIHdpdGggYGA8dHlwZT4saGVscGBgLiBTZWUgdGhlIDptYW5wYWdlOmBxZW11KDEpYAogICBt
YW51YWwgcGFnZSBmb3IgYSBkZXNjcmlwdGlvbiBvZiB0aGUgb2JqZWN0IHByb3BlcnRpZXMuCiAK
Ky4uIG9wdGlvbjo6IC0tcGlkZmlsZSBQQVRICisKKyAgaXMgdGhlIHBhdGggdG8gYSBmaWxlIHdo
ZXJlIHRoZSBkYWVtb24gd3JpdGVzIGl0cyBwaWQuIFRoaXMgYWxsb3dzIHNjcmlwdHMgdG8KKyAg
c3RvcCB0aGUgZGFlbW9uIGJ5IHNlbmRpbmcgYSBzaWduYWw6OgorCisgICAgJCBraWxsIC1TSUdU
RVJNICQoPHBhdGgvdG8vcXNkLnBpZCkKKworICBBIGZpbGUgbG9jayBpcyBhcHBsaWVkIHRvIHRo
ZSBmaWxlIHNvIG9ubHkgb25lIGluc3RhbmNlIG9mIHRoZSBkYWVtb24gY2FuIHJ1bgorICB3aXRo
IGEgZ2l2ZW4gcGlkIGZpbGUgcGF0aC4gVGhlIGRhZW1vbiB1bmxpbmtzIGl0cyBwaWQgZmlsZSB3
aGVuIHRlcm1pbmF0aW5nLgorCisgIFRoZSBwaWQgZmlsZSBpcyB3cml0dGVuIGFmdGVyIGNoYXJk
ZXZzLCBleHBvcnRzLCBhbmQgTkJEIHNlcnZlcnMgaGF2ZSBiZWVuCisgIGNyZWF0ZWQgYnV0IGJl
Zm9yZSBhY2NlcHRpbmcgY29ubmVjdGlvbnMuIFRoZSBkYWVtb24gaGFzIHN0YXJ0ZWQgc3VjY2Vz
c2Z1bGx5CisgIHdoZW4gdGhlIHBpZCBmaWxlIGlzIHdyaXR0ZW4gYW5kIGNsaWVudHMgbWF5IGJl
Z2luIGNvbm5lY3RpbmcuCisKIEV4YW1wbGVzCiAtLS0tLS0tLQogTGF1bmNoIHRoZSBkYWVtb24g
d2l0aCBRTVAgbW9uaXRvciBzb2NrZXQgYGBxbXAuc29ja2BgIHNvIGNsaWVudHMgY2FuIGV4ZWN1
dGUKZGlmZiAtLWdpdCBhL3N0b3JhZ2UtZGFlbW9uL3FlbXUtc3RvcmFnZS1kYWVtb24uYyBiL3N0
b3JhZ2UtZGFlbW9uL3FlbXUtc3RvcmFnZS1kYWVtb24uYwppbmRleCA5MDIxYTQ2YjNhLi44NmNm
NmExZjA4IDEwMDY0NAotLS0gYS9zdG9yYWdlLWRhZW1vbi9xZW11LXN0b3JhZ2UtZGFlbW9uLmMK
KysrIGIvc3RvcmFnZS1kYWVtb24vcWVtdS1zdG9yYWdlLWRhZW1vbi5jCkBAIC01OSw2ICs1OSw3
IEBACiAjaW5jbHVkZSAic3lzZW11L3J1bnN0YXRlLmgiCiAjaW5jbHVkZSAidHJhY2UvY29udHJv
bC5oIgogCitzdGF0aWMgY29uc3QgY2hhciAqcGlkX2ZpbGU7CiBzdGF0aWMgdm9sYXRpbGUgYm9v
bCBleGl0X3JlcXVlc3RlZCA9IGZhbHNlOwogCiB2b2lkIHFlbXVfc3lzdGVtX2tpbGxlZChpbnQg
c2lnbmFsLCBwaWRfdCBwaWQpCkBAIC0xMjYsNiArMTI3LDcgQEAgZW51bSB7CiAgICAgT1BUSU9O
X01PTklUT1IsCiAgICAgT1BUSU9OX05CRF9TRVJWRVIsCiAgICAgT1BUSU9OX09CSkVDVCwKKyAg
ICBPUFRJT05fUElERklMRSwKIH07CiAKIGV4dGVybiBRZW11T3B0c0xpc3QgcWVtdV9jaGFyZGV2
X29wdHM7CkBAIC0xNjQsNiArMTY2LDcgQEAgc3RhdGljIHZvaWQgcHJvY2Vzc19vcHRpb25zKGlu
dCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgICAgIHsibW9uaXRvciIsIHJlcXVpcmVkX2FyZ3Vt
ZW50LCBOVUxMLCBPUFRJT05fTU9OSVRPUn0sCiAgICAgICAgIHsibmJkLXNlcnZlciIsIHJlcXVp
cmVkX2FyZ3VtZW50LCBOVUxMLCBPUFRJT05fTkJEX1NFUlZFUn0sCiAgICAgICAgIHsib2JqZWN0
IiwgcmVxdWlyZWRfYXJndW1lbnQsIE5VTEwsIE9QVElPTl9PQkpFQ1R9LAorICAgICAgICB7InBp
ZGZpbGUiLCByZXF1aXJlZF9hcmd1bWVudCwgTlVMTCwgT1BUSU9OX1BJREZJTEV9LAogICAgICAg
ICB7InRyYWNlIiwgcmVxdWlyZWRfYXJndW1lbnQsIE5VTEwsICdUJ30sCiAgICAgICAgIHsidmVy
c2lvbiIsIG5vX2FyZ3VtZW50LCBOVUxMLCAnVid9LAogICAgICAgICB7MCwgMCwgMCwgMH0KQEAg
LTI3NSw2ICsyNzgsOSBAQCBzdGF0aWMgdm9pZCBwcm9jZXNzX29wdGlvbnMoaW50IGFyZ2MsIGNo
YXIgKmFyZ3ZbXSkKICAgICAgICAgICAgICAgICBxb2JqZWN0X3VucmVmKGFyZ3MpOwogICAgICAg
ICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgfQorICAgICAgICBjYXNlIE9QVElPTl9QSURG
SUxFOgorICAgICAgICAgICAgcGlkX2ZpbGUgPSBvcHRhcmc7CisgICAgICAgICAgICBicmVhazsK
ICAgICAgICAgZGVmYXVsdDoKICAgICAgICAgICAgIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCk7CiAg
ICAgICAgIH0KQEAgLTI4NSw2ICsyOTEsMjcgQEAgc3RhdGljIHZvaWQgcHJvY2Vzc19vcHRpb25z
KGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgfQogfQogCitzdGF0aWMgdm9pZCBwaWRfZmls
ZV9jbGVhbnVwKHZvaWQpCit7CisgICAgdW5saW5rKHBpZF9maWxlKTsKK30KKworc3RhdGljIHZv
aWQgcGlkX2ZpbGVfaW5pdCh2b2lkKQoreworICAgIEVycm9yICplcnIgPSBOVUxMOworCisgICAg
aWYgKCFwaWRfZmlsZSkgeworICAgICAgICByZXR1cm47CisgICAgfQorCisgICAgaWYgKCFxZW11
X3dyaXRlX3BpZGZpbGUocGlkX2ZpbGUsICZlcnIpKSB7CisgICAgICAgIGVycm9yX3JlcG9ydGZf
ZXJyKGVyciwgImNhbm5vdCBjcmVhdGUgUElEIGZpbGU6ICIpOworICAgICAgICBleGl0KEVYSVRf
RkFJTFVSRSk7CisgICAgfQorCisgICAgYXRleGl0KHBpZF9maWxlX2NsZWFudXApOworfQorCiBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogewogI2lmZGVmIENPTkZJR19QT1NJWApA
QCAtMzEyLDYgKzMzOSwxMyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAg
IHFlbXVfaW5pdF9tYWluX2xvb3AoJmVycm9yX2ZhdGFsKTsKICAgICBwcm9jZXNzX29wdGlvbnMo
YXJnYywgYXJndik7CiAKKyAgICAvKgorICAgICAqIFdyaXRlIHRoZSBwaWQgZmlsZSBhZnRlciBj
cmVhdGluZyBjaGFyZGV2cywgZXhwb3J0cywgYW5kIE5CRCBzZXJ2ZXJzIGJ1dAorICAgICAqIGJl
Zm9yZSBhY2NlcHRpbmcgY29ubmVjdGlvbnMuIFRoaXMgb3JkZXJpbmcgaXMgZG9jdW1lbnRlZC4g
RG8gbm90IGNoYW5nZQorICAgICAqIGl0LgorICAgICAqLworICAgIHBpZF9maWxlX2luaXQoKTsK
KwogICAgIHdoaWxlICghZXhpdF9yZXF1ZXN0ZWQpIHsKICAgICAgICAgbWFpbl9sb29wX3dhaXQo
ZmFsc2UpOwogICAgIH0KLS0gCjIuMjkuMgoK


