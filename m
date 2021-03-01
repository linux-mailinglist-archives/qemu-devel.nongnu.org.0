Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6601432831D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:10:49 +0100 (CET)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGl8C-00080M-EK
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGl6a-00078a-LU
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:09:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGl6X-0002NR-Pj
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614614945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=evKriQ3CQQOBSKYegnsDlyxLK0epVWNdop3+YaIAYVc=;
 b=gXkpxo2znuuGcQnXxjZn9mOOLR4L55fbHqtcB242Xf5NgGJS4TsxvZ8NoeqHKGvCGe4EhC
 cv+sbo4+/9cLRl2W5NpQ6Sh1Hsz5QDnhnqynFogJFs+sp9PaX9sn/dtPV79qzNLvE2F3Cq
 g39r779ARfCCm/daQZGZIHQt7KeRHrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-c8hve3BBPZClf8qL9ih1cg-1; Mon, 01 Mar 2021 11:09:03 -0500
X-MC-Unique: c8hve3BBPZClf8qL9ih1cg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73C351936B6C;
 Mon,  1 Mar 2021 16:09:02 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D37505D6CF;
 Mon,  1 Mar 2021 16:08:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-storage-daemon: add --pidfile option
Date: Mon,  1 Mar 2021 16:08:57 +0000
Message-Id: <20210301160857.130478-1-stefanha@redhat.com>
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
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: afrosi@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
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
dGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGRvY3MvdG9vbHMvcWVtdS1zdG9yYWdlLWRhZW1vbi5y
c3QgICB8IDEwICsrKysrKysrKysKIHN0b3JhZ2UtZGFlbW9uL3FlbXUtc3RvcmFnZS1kYWVtb24u
YyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzkg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RvY3MvdG9vbHMvcWVtdS1zdG9yYWdlLWRhZW1v
bi5yc3QgYi9kb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVtb24ucnN0CmluZGV4IGY2MzYyN2Vh
ZjYuLjhmNGFiMTZmZmMgMTAwNjQ0Ci0tLSBhL2RvY3MvdG9vbHMvcWVtdS1zdG9yYWdlLWRhZW1v
bi5yc3QKKysrIGIvZG9jcy90b29scy9xZW11LXN0b3JhZ2UtZGFlbW9uLnJzdApAQCAtMTE4LDYg
KzExOCwxNiBAQCBTdGFuZGFyZCBvcHRpb25zOgogICBMaXN0IG9iamVjdCBwcm9wZXJ0aWVzIHdp
dGggYGA8dHlwZT4saGVscGBgLiBTZWUgdGhlIDptYW5wYWdlOmBxZW11KDEpYAogICBtYW51YWwg
cGFnZSBmb3IgYSBkZXNjcmlwdGlvbiBvZiB0aGUgb2JqZWN0IHByb3BlcnRpZXMuCiAKKy4uIG9w
dGlvbjo6IC0tcGlkZmlsZSBQQVRICisKKyAgaXMgdGhlIHBhdGggdG8gYSBmaWxlIHdoZXJlIHRo
ZSBkYWVtb24gd3JpdGVzIGl0cyBwaWQuIFRoaXMgYWxsb3dzIHNjcmlwdHMgdG8KKyAgc3RvcCB0
aGUgZGFlbW9uIGJ5IHNlbmRpbmcgYSBzaWduYWw6OgorCisgICAgJCBraWxsIC1TSUdURVJNICQo
PHBhdGgvdG8vcXNkLnBpZCkKKworICBBIGZpbGUgbG9jayBpcyBhcHBsaWVkIHRvIHRoZSBmaWxl
IHNvIG9ubHkgb25lIGluc3RhbmNlIG9mIHRoZSBkYWVtb24gY2FuIHJ1bgorICB3aXRoIGEgZ2l2
ZW4gcGlkIGZpbGUgcGF0aC4gVGhlIGRhZW1vbiB1bmxpbmtzIGl0cyBwaWQgZmlsZSB3aGVuIHRl
cm1pbmF0aW5nLgorCiBFeGFtcGxlcwogLS0tLS0tLS0KIExhdW5jaCB0aGUgZGFlbW9uIHdpdGgg
UU1QIG1vbml0b3Igc29ja2V0IGBgcW1wLnNvY2tgYCBzbyBjbGllbnRzIGNhbiBleGVjdXRlCmRp
ZmYgLS1naXQgYS9zdG9yYWdlLWRhZW1vbi9xZW11LXN0b3JhZ2UtZGFlbW9uLmMgYi9zdG9yYWdl
LWRhZW1vbi9xZW11LXN0b3JhZ2UtZGFlbW9uLmMKaW5kZXggOTAyMWE0NmIzYS4uMDExYWU0OWFj
MyAxMDA2NDQKLS0tIGEvc3RvcmFnZS1kYWVtb24vcWVtdS1zdG9yYWdlLWRhZW1vbi5jCisrKyBi
L3N0b3JhZ2UtZGFlbW9uL3FlbXUtc3RvcmFnZS1kYWVtb24uYwpAQCAtNTksNiArNTksNyBAQAog
I2luY2x1ZGUgInN5c2VtdS9ydW5zdGF0ZS5oIgogI2luY2x1ZGUgInRyYWNlL2NvbnRyb2wuaCIK
IAorc3RhdGljIGNvbnN0IGNoYXIgKnBpZF9maWxlOwogc3RhdGljIHZvbGF0aWxlIGJvb2wgZXhp
dF9yZXF1ZXN0ZWQgPSBmYWxzZTsKIAogdm9pZCBxZW11X3N5c3RlbV9raWxsZWQoaW50IHNpZ25h
bCwgcGlkX3QgcGlkKQpAQCAtMTI2LDYgKzEyNyw3IEBAIGVudW0gewogICAgIE9QVElPTl9NT05J
VE9SLAogICAgIE9QVElPTl9OQkRfU0VSVkVSLAogICAgIE9QVElPTl9PQkpFQ1QsCisgICAgT1BU
SU9OX1BJREZJTEUsCiB9OwogCiBleHRlcm4gUWVtdU9wdHNMaXN0IHFlbXVfY2hhcmRldl9vcHRz
OwpAQCAtMTY0LDYgKzE2Niw3IEBAIHN0YXRpYyB2b2lkIHByb2Nlc3Nfb3B0aW9ucyhpbnQgYXJn
YywgY2hhciAqYXJndltdKQogICAgICAgICB7Im1vbml0b3IiLCByZXF1aXJlZF9hcmd1bWVudCwg
TlVMTCwgT1BUSU9OX01PTklUT1J9LAogICAgICAgICB7Im5iZC1zZXJ2ZXIiLCByZXF1aXJlZF9h
cmd1bWVudCwgTlVMTCwgT1BUSU9OX05CRF9TRVJWRVJ9LAogICAgICAgICB7Im9iamVjdCIsIHJl
cXVpcmVkX2FyZ3VtZW50LCBOVUxMLCBPUFRJT05fT0JKRUNUfSwKKyAgICAgICAgeyJwaWRmaWxl
IiwgcmVxdWlyZWRfYXJndW1lbnQsIE5VTEwsIE9QVElPTl9QSURGSUxFfSwKICAgICAgICAgeyJ0
cmFjZSIsIHJlcXVpcmVkX2FyZ3VtZW50LCBOVUxMLCAnVCd9LAogICAgICAgICB7InZlcnNpb24i
LCBub19hcmd1bWVudCwgTlVMTCwgJ1YnfSwKICAgICAgICAgezAsIDAsIDAsIDB9CkBAIC0yNzUs
NiArMjc4LDkgQEAgc3RhdGljIHZvaWQgcHJvY2Vzc19vcHRpb25zKGludCBhcmdjLCBjaGFyICph
cmd2W10pCiAgICAgICAgICAgICAgICAgcW9iamVjdF91bnJlZihhcmdzKTsKICAgICAgICAgICAg
ICAgICBicmVhazsKICAgICAgICAgICAgIH0KKyAgICAgICAgY2FzZSBPUFRJT05fUElERklMRToK
KyAgICAgICAgICAgIHBpZF9maWxlID0gb3B0YXJnOworICAgICAgICAgICAgYnJlYWs7CiAgICAg
ICAgIGRlZmF1bHQ6CiAgICAgICAgICAgICBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpOwogICAgICAg
ICB9CkBAIC0yODUsNiArMjkxLDI3IEBAIHN0YXRpYyB2b2lkIHByb2Nlc3Nfb3B0aW9ucyhpbnQg
YXJnYywgY2hhciAqYXJndltdKQogICAgIH0KIH0KIAorc3RhdGljIHZvaWQgcGlkX2ZpbGVfY2xl
YW51cCh2b2lkKQoreworICAgIHVubGluayhwaWRfZmlsZSk7Cit9CisKK3N0YXRpYyB2b2lkIHBp
ZF9maWxlX2luaXQodm9pZCkKK3sKKyAgICBFcnJvciAqZXJyID0gTlVMTDsKKworICAgIGlmICgh
cGlkX2ZpbGUpIHsKKyAgICAgICAgcmV0dXJuOworICAgIH0KKworICAgIGlmICghcWVtdV93cml0
ZV9waWRmaWxlKHBpZF9maWxlLCAmZXJyKSkgeworICAgICAgICBlcnJvcl9yZXBvcnRmX2Vycihl
cnIsICJjYW5ub3QgY3JlYXRlIFBJRCBmaWxlOiAiKTsKKyAgICAgICAgZXhpdChFWElUX0ZBSUxV
UkUpOworICAgIH0KKworICAgIGF0ZXhpdChwaWRfZmlsZV9jbGVhbnVwKTsKK30KKwogaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIHsKICNpZmRlZiBDT05GSUdfUE9TSVgKQEAgLTMx
Miw2ICszMzksOCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAgIHFlbXVf
aW5pdF9tYWluX2xvb3AoJmVycm9yX2ZhdGFsKTsKICAgICBwcm9jZXNzX29wdGlvbnMoYXJnYywg
YXJndik7CiAKKyAgICBwaWRfZmlsZV9pbml0KCk7CisKICAgICB3aGlsZSAoIWV4aXRfcmVxdWVz
dGVkKSB7CiAgICAgICAgIG1haW5fbG9vcF93YWl0KGZhbHNlKTsKICAgICB9Ci0tIAoyLjI5LjIK
Cg==


