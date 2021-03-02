Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB032A27B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:30:49 +0100 (CET)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH62y-0002E8-HS
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lH60R-0000v7-Qx
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:28:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lH60O-00014E-KF
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614695287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9mhjnnXiYmnqklutiBFfmN5pMjO0IsLmHlehd1kxL48=;
 b=N4HWV8TQ9AUBg1eq6MAMyrgORvAf+t3xID1SeYOVSztfXYUr2GoUUJZ2mTza+39GqtS7hO
 oHQC3r7w4/M5CrD5uCrCLoicG/CUYiPxVEf2TlwSYTLKg8TiJS8glYNeX20fhX7zeKDJ0K
 ArEepgG6Spkv4qNeb+aocTtNIiqS4DQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-z6gBx-B8PXqHsdPHrtjGRg-1; Tue, 02 Mar 2021 09:28:06 -0500
X-MC-Unique: z6gBx-B8PXqHsdPHrtjGRg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 564F6874985;
 Tue,  2 Mar 2021 14:28:05 +0000 (UTC)
Received: from localhost (ovpn-114-138.ams2.redhat.com [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA46560C05;
 Tue,  2 Mar 2021 14:28:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] qemu-storage-daemon: add --pidfile option
Date: Tue,  2 Mar 2021 14:27:46 +0000
Message-Id: <20210302142746.170535-1-stefanha@redhat.com>
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
dGVmYW5oYUByZWRoYXQuY29tPgotLS0KdjM6CiAqIEFkZCAtLXBpZGZpbGUgaGVscCBvdXRwdXQg
W0tldmluXQoKIGRvY3MvdG9vbHMvcWVtdS1zdG9yYWdlLWRhZW1vbi5yc3QgICB8IDE0ICsrKysr
KysrKysrCiBzdG9yYWdlLWRhZW1vbi9xZW11LXN0b3JhZ2UtZGFlbW9uLmMgfCAzNiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVtb24ucnN0IGIvZG9jcy90
b29scy9xZW11LXN0b3JhZ2UtZGFlbW9uLnJzdAppbmRleCBmNjM2MjdlYWY2Li4zZDk3MDRkODM1
IDEwMDY0NAotLS0gYS9kb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVtb24ucnN0CisrKyBiL2Rv
Y3MvdG9vbHMvcWVtdS1zdG9yYWdlLWRhZW1vbi5yc3QKQEAgLTExOCw2ICsxMTgsMjAgQEAgU3Rh
bmRhcmQgb3B0aW9uczoKICAgTGlzdCBvYmplY3QgcHJvcGVydGllcyB3aXRoIGBgPHR5cGU+LGhl
bHBgYC4gU2VlIHRoZSA6bWFucGFnZTpgcWVtdSgxKWAKICAgbWFudWFsIHBhZ2UgZm9yIGEgZGVz
Y3JpcHRpb24gb2YgdGhlIG9iamVjdCBwcm9wZXJ0aWVzLgogCisuLiBvcHRpb246OiAtLXBpZGZp
bGUgUEFUSAorCisgIGlzIHRoZSBwYXRoIHRvIGEgZmlsZSB3aGVyZSB0aGUgZGFlbW9uIHdyaXRl
cyBpdHMgcGlkLiBUaGlzIGFsbG93cyBzY3JpcHRzIHRvCisgIHN0b3AgdGhlIGRhZW1vbiBieSBz
ZW5kaW5nIGEgc2lnbmFsOjoKKworICAgICQga2lsbCAtU0lHVEVSTSAkKDxwYXRoL3RvL3FzZC5w
aWQpCisKKyAgQSBmaWxlIGxvY2sgaXMgYXBwbGllZCB0byB0aGUgZmlsZSBzbyBvbmx5IG9uZSBp
bnN0YW5jZSBvZiB0aGUgZGFlbW9uIGNhbiBydW4KKyAgd2l0aCBhIGdpdmVuIHBpZCBmaWxlIHBh
dGguIFRoZSBkYWVtb24gdW5saW5rcyBpdHMgcGlkIGZpbGUgd2hlbiB0ZXJtaW5hdGluZy4KKwor
ICBUaGUgcGlkIGZpbGUgaXMgd3JpdHRlbiBhZnRlciBjaGFyZGV2cywgZXhwb3J0cywgYW5kIE5C
RCBzZXJ2ZXJzIGhhdmUgYmVlbgorICBjcmVhdGVkIGJ1dCBiZWZvcmUgYWNjZXB0aW5nIGNvbm5l
Y3Rpb25zLiBUaGUgZGFlbW9uIGhhcyBzdGFydGVkIHN1Y2Nlc3NmdWxseQorICB3aGVuIHRoZSBw
aWQgZmlsZSBpcyB3cml0dGVuIGFuZCBjbGllbnRzIG1heSBiZWdpbiBjb25uZWN0aW5nLgorCiBF
eGFtcGxlcwogLS0tLS0tLS0KIExhdW5jaCB0aGUgZGFlbW9uIHdpdGggUU1QIG1vbml0b3Igc29j
a2V0IGBgcW1wLnNvY2tgYCBzbyBjbGllbnRzIGNhbiBleGVjdXRlCmRpZmYgLS1naXQgYS9zdG9y
YWdlLWRhZW1vbi9xZW11LXN0b3JhZ2UtZGFlbW9uLmMgYi9zdG9yYWdlLWRhZW1vbi9xZW11LXN0
b3JhZ2UtZGFlbW9uLmMKaW5kZXggOTAyMWE0NmIzYS4uNDY3MjE0NWRmNSAxMDA2NDQKLS0tIGEv
c3RvcmFnZS1kYWVtb24vcWVtdS1zdG9yYWdlLWRhZW1vbi5jCisrKyBiL3N0b3JhZ2UtZGFlbW9u
L3FlbXUtc3RvcmFnZS1kYWVtb24uYwpAQCAtNTksNiArNTksNyBAQAogI2luY2x1ZGUgInN5c2Vt
dS9ydW5zdGF0ZS5oIgogI2luY2x1ZGUgInRyYWNlL2NvbnRyb2wuaCIKIAorc3RhdGljIGNvbnN0
IGNoYXIgKnBpZF9maWxlOwogc3RhdGljIHZvbGF0aWxlIGJvb2wgZXhpdF9yZXF1ZXN0ZWQgPSBm
YWxzZTsKIAogdm9pZCBxZW11X3N5c3RlbV9raWxsZWQoaW50IHNpZ25hbCwgcGlkX3QgcGlkKQpA
QCAtMTE1LDYgKzExNiw4IEBAIHN0YXRpYyB2b2lkIGhlbHAodm9pZCkKICIgICAgICAgICAgICAg
ICAgICAgICAgICAgU2VlIHRoZSBxZW11KDEpIG1hbiBwYWdlIGZvciBkb2N1bWVudGF0aW9uIG9m
IHRoZVxuIgogIiAgICAgICAgICAgICAgICAgICAgICAgICBvYmplY3RzIHRoYXQgY2FuIGJlIGFk
ZGVkLlxuIgogIlxuIgorIiAgLS1waWRmaWxlIDxwYXRoPiAgICAgICB3cml0ZSBwcm9jZXNzIElE
IHRvIGEgZmlsZSBhZnRlciBzdGFydHVwXG4iCisiXG4iCiBRRU1VX0hFTFBfQk9UVE9NICJcbiIs
CiAgICAgZXJyb3JfZ2V0X3Byb2duYW1lKCkpOwogfQpAQCAtMTI2LDYgKzEyOSw3IEBAIGVudW0g
ewogICAgIE9QVElPTl9NT05JVE9SLAogICAgIE9QVElPTl9OQkRfU0VSVkVSLAogICAgIE9QVElP
Tl9PQkpFQ1QsCisgICAgT1BUSU9OX1BJREZJTEUsCiB9OwogCiBleHRlcm4gUWVtdU9wdHNMaXN0
IHFlbXVfY2hhcmRldl9vcHRzOwpAQCAtMTY0LDYgKzE2OCw3IEBAIHN0YXRpYyB2b2lkIHByb2Nl
c3Nfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAgICAgICB7Im1vbml0b3IiLCBy
ZXF1aXJlZF9hcmd1bWVudCwgTlVMTCwgT1BUSU9OX01PTklUT1J9LAogICAgICAgICB7Im5iZC1z
ZXJ2ZXIiLCByZXF1aXJlZF9hcmd1bWVudCwgTlVMTCwgT1BUSU9OX05CRF9TRVJWRVJ9LAogICAg
ICAgICB7Im9iamVjdCIsIHJlcXVpcmVkX2FyZ3VtZW50LCBOVUxMLCBPUFRJT05fT0JKRUNUfSwK
KyAgICAgICAgeyJwaWRmaWxlIiwgcmVxdWlyZWRfYXJndW1lbnQsIE5VTEwsIE9QVElPTl9QSURG
SUxFfSwKICAgICAgICAgeyJ0cmFjZSIsIHJlcXVpcmVkX2FyZ3VtZW50LCBOVUxMLCAnVCd9LAog
ICAgICAgICB7InZlcnNpb24iLCBub19hcmd1bWVudCwgTlVMTCwgJ1YnfSwKICAgICAgICAgezAs
IDAsIDAsIDB9CkBAIC0yNzUsNiArMjgwLDkgQEAgc3RhdGljIHZvaWQgcHJvY2Vzc19vcHRpb25z
KGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgICAgICAgICAgICAgcW9iamVjdF91bnJlZihh
cmdzKTsKICAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgICAgIH0KKyAgICAgICAgY2Fz
ZSBPUFRJT05fUElERklMRToKKyAgICAgICAgICAgIHBpZF9maWxlID0gb3B0YXJnOworICAgICAg
ICAgICAgYnJlYWs7CiAgICAgICAgIGRlZmF1bHQ6CiAgICAgICAgICAgICBnX2Fzc2VydF9ub3Rf
cmVhY2hlZCgpOwogICAgICAgICB9CkBAIC0yODUsNiArMjkzLDI3IEBAIHN0YXRpYyB2b2lkIHBy
b2Nlc3Nfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAgIH0KIH0KIAorc3RhdGlj
IHZvaWQgcGlkX2ZpbGVfY2xlYW51cCh2b2lkKQoreworICAgIHVubGluayhwaWRfZmlsZSk7Cit9
CisKK3N0YXRpYyB2b2lkIHBpZF9maWxlX2luaXQodm9pZCkKK3sKKyAgICBFcnJvciAqZXJyID0g
TlVMTDsKKworICAgIGlmICghcGlkX2ZpbGUpIHsKKyAgICAgICAgcmV0dXJuOworICAgIH0KKwor
ICAgIGlmICghcWVtdV93cml0ZV9waWRmaWxlKHBpZF9maWxlLCAmZXJyKSkgeworICAgICAgICBl
cnJvcl9yZXBvcnRmX2VycihlcnIsICJjYW5ub3QgY3JlYXRlIFBJRCBmaWxlOiAiKTsKKyAgICAg
ICAgZXhpdChFWElUX0ZBSUxVUkUpOworICAgIH0KKworICAgIGF0ZXhpdChwaWRfZmlsZV9jbGVh
bnVwKTsKK30KKwogaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIHsKICNpZmRlZiBD
T05GSUdfUE9TSVgKQEAgLTMxMiw2ICszNDEsMTMgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIg
KmFyZ3ZbXSkKICAgICBxZW11X2luaXRfbWFpbl9sb29wKCZlcnJvcl9mYXRhbCk7CiAgICAgcHJv
Y2Vzc19vcHRpb25zKGFyZ2MsIGFyZ3YpOwogCisgICAgLyoKKyAgICAgKiBXcml0ZSB0aGUgcGlk
IGZpbGUgYWZ0ZXIgY3JlYXRpbmcgY2hhcmRldnMsIGV4cG9ydHMsIGFuZCBOQkQgc2VydmVycyBi
dXQKKyAgICAgKiBiZWZvcmUgYWNjZXB0aW5nIGNvbm5lY3Rpb25zLiBUaGlzIG9yZGVyaW5nIGlz
IGRvY3VtZW50ZWQuIERvIG5vdCBjaGFuZ2UKKyAgICAgKiBpdC4KKyAgICAgKi8KKyAgICBwaWRf
ZmlsZV9pbml0KCk7CisKICAgICB3aGlsZSAoIWV4aXRfcmVxdWVzdGVkKSB7CiAgICAgICAgIG1h
aW5fbG9vcF93YWl0KGZhbHNlKTsKICAgICB9Ci0tIAoyLjI5LjIKCg==


