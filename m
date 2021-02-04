Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C030F743
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:10:11 +0100 (CET)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hCs-0008TK-Jj
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gpF-00006P-Us
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gpD-00050Y-A8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMLyNEibZrrvvOgQKGmNjVmqHFUEKL29qF8ilAlWx1U=;
 b=ffIHvGOSebr8tELgt+zY9BRcg5mNEeLREY0We1kaNGk9xsv0nvGRyfqFJJ8yVYbPM5Jee2
 v1aibKJfrgKzVNNKnu4yre8zIc2E+bWlvXSnG5NFyxtdjUrkQMrXizp8Whg1oNAf9yWnyy
 jPmdtWwo1pzAwChhqIVjUCu7tg66Mww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-G1qZLu32MbqO3Sd6K3BWfQ-1; Thu, 04 Feb 2021 10:45:40 -0500
X-MC-Unique: G1qZLu32MbqO3Sd6K3BWfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D76F107ACC7;
 Thu,  4 Feb 2021 15:45:38 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4BB760BF1;
 Thu,  4 Feb 2021 15:45:26 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 12/27] multi-process: setup a machine object for remote
 device process
Date: Thu,  4 Feb 2021 15:43:12 +0000
Message-Id: <20210204154327.386529-13-stefanha@redhat.com>
In-Reply-To: <20210204154327.386529-1-stefanha@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPgoKeC1yZW1vdGUt
bWFjaGluZSBvYmplY3Qgc2V0cyB1cCB2YXJpb3VzIHN1YnN5c3RlbXMgb2YgdGhlIHJlbW90ZQpk
ZXZpY2UgcHJvY2Vzcy4gSW5zdGFudGlhdGUgUENJIGhvc3QgYnJpZGdlIG9iamVjdCBhbmQgaW5p
dGlhbGl6ZSBSQU0sIElPICYKUENJIG1lbW9yeSByZWdpb25zLgoKU2lnbmVkLW9mZi1ieTogSm9o
biBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEph
Z2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogRWxl
bmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4KUmV2aWV3ZWQtYnk6IFN0
ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KTWVzc2FnZS1pZDogYzUzN2YzOGQx
N2Y5MDQ1M2NhNjEwYzZiNzBjZjM0ODAyNzRlMGJhMS4xNjExOTM4MzE5LmdpdC5qYWcucmFtYW5A
b3JhY2xlLmNvbQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhh
dC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICB8ICAyICsrCiBpbmNsdWRl
L2h3L3BjaS1ob3N0L3JlbW90ZS5oIHwgIDEgKwogaW5jbHVkZS9ody9yZW1vdGUvbWFjaGluZS5o
ICB8IDI3ICsrKysrKysrKysrKysrCiBody9yZW1vdGUvbWFjaGluZS5jICAgICAgICAgIHwgNzAg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBody9tZXNvbi5idWlsZCAgICAg
ICAgICAgICAgIHwgIDEgKwogaHcvcmVtb3RlL21lc29uLmJ1aWxkICAgICAgICB8ICA1ICsrKwog
NiBmaWxlcyBjaGFuZ2VkLCAxMDYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvaHcvcmVtb3RlL21hY2hpbmUuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L3JlbW90ZS9t
YWNoaW5lLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9yZW1vdGUvbWVzb24uYnVpbGQKCmRpZmYg
LS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDQ1ZTc3N2JjNTUuLjQ1OTc5
NDUyZWQgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0zMjAz
LDYgKzMyMDMsOCBAQCBGOiBkb2NzL2RldmVsL211bHRpLXByb2Nlc3MucnN0CiBGOiBkb2NzL3N5
c3RlbS9tdWx0aS1wcm9jZXNzLnJzdAogRjogaHcvcGNpLWhvc3QvcmVtb3RlLmMKIEY6IGluY2x1
ZGUvaHcvcGNpLWhvc3QvcmVtb3RlLmgKK0Y6IGh3L3JlbW90ZS9tYWNoaW5lLmMKK0Y6IGluY2x1
ZGUvaHcvcmVtb3RlL21hY2hpbmUuaAogCiBCdWlsZCBhbmQgdGVzdCBhdXRvbWF0aW9uCiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3BjaS1ob3N0L3Jl
bW90ZS5oIGIvaW5jbHVkZS9ody9wY2ktaG9zdC9yZW1vdGUuaAppbmRleCAwNmI4YTgzYTRiLi4z
ZGNmNmFhNTFkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3BjaS1ob3N0L3JlbW90ZS5oCisrKyBi
L2luY2x1ZGUvaHcvcGNpLWhvc3QvcmVtb3RlLmgKQEAgLTI0LDYgKzI0LDcgQEAgc3RydWN0IFJl
bW90ZVBDSUhvc3QgewogCiAgICAgTWVtb3J5UmVnaW9uICptcl9wY2lfbWVtOwogICAgIE1lbW9y
eVJlZ2lvbiAqbXJfc3lzX2lvOworICAgIE1lbW9yeVJlZ2lvbiAqbXJfc3lzX21lbTsKIH07CiAK
ICNlbmRpZgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9yZW1vdGUvbWFjaGluZS5oIGIvaW5jbHVk
ZS9ody9yZW1vdGUvbWFjaGluZS5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLmJkZmJjYTQwYjkKLS0tIC9kZXYvbnVsbAorKysgYi9pbmNsdWRlL2h3L3JlbW90ZS9tYWNo
aW5lLmgKQEAgLTAsMCArMSwyNyBAQAorLyoKKyAqIFJlbW90ZSBtYWNoaW5lIGNvbmZpZ3VyYXRp
b24KKyAqCisgKiBDb3B5cmlnaHQgwqkgMjAxOCwgMjAyMSBPcmFjbGUgYW5kL29yIGl0cyBhZmZp
bGlhdGVzLgorICoKKyAqIFRoaXMgd29yayBpcyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHUEwsIHZlcnNpb24gMiBvciBsYXRlci4KKyAqIFNlZSB0aGUgQ09QWUlORyBmaWxl
IGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5LgorICoKKyAqLworCisjaWZuZGVmIFJFTU9URV9N
QUNISU5FX0gKKyNkZWZpbmUgUkVNT1RFX01BQ0hJTkVfSAorCisjaW5jbHVkZSAicW9tL29iamVj
dC5oIgorI2luY2x1ZGUgImh3L2JvYXJkcy5oIgorI2luY2x1ZGUgImh3L3BjaS1ob3N0L3JlbW90
ZS5oIgorCitzdHJ1Y3QgUmVtb3RlTWFjaGluZVN0YXRlIHsKKyAgICBNYWNoaW5lU3RhdGUgcGFy
ZW50X29iajsKKworICAgIFJlbW90ZVBDSUhvc3QgKmhvc3Q7Cit9OworCisjZGVmaW5lIFRZUEVf
UkVNT1RFX01BQ0hJTkUgIngtcmVtb3RlLW1hY2hpbmUiCitPQkpFQ1RfREVDTEFSRV9TSU1QTEVf
VFlQRShSZW1vdGVNYWNoaW5lU3RhdGUsIFJFTU9URV9NQUNISU5FKQorCisjZW5kaWYKZGlmZiAt
LWdpdCBhL2h3L3JlbW90ZS9tYWNoaW5lLmMgYi9ody9yZW1vdGUvbWFjaGluZS5jCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjk1MTlhNmMwYTQKLS0tIC9kZXYvbnVsbAor
KysgYi9ody9yZW1vdGUvbWFjaGluZS5jCkBAIC0wLDAgKzEsNzAgQEAKKy8qCisgKiBNYWNoaW5l
IGZvciByZW1vdGUgZGV2aWNlCisgKgorICogIFRoaXMgbWFjaGluZSB0eXBlIGlzIHVzZWQgYnkg
dGhlIHJlbW90ZSBkZXZpY2UgcHJvY2VzcyBpbiBtdWx0aS1wcm9jZXNzCisgKiAgUUVNVS4gUUVN
VSBkZXZpY2UgbW9kZWxzIGRlcGVuZCBvbiBwYXJlbnQgYnVzc2VzLCBpbnRlcnJ1cHQgY29udHJv
bGxlcnMsCisgKiAgbWVtb3J5IHJlZ2lvbnMsIGV0Yy4gVGhlIHJlbW90ZSBtYWNoaW5lIHR5cGUg
b2ZmZXJzIHRoaXMgZW52aXJvbm1lbnQgc28KKyAqICB0aGF0IFFFTVUgZGV2aWNlIG1vZGVscyBj
YW4gYmUgdXNlZCBhcyByZW1vdGUgZGV2aWNlcy4KKyAqCisgKiBDb3B5cmlnaHQgwqkgMjAxOCwg
MjAyMSBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLgorICoKKyAqIFRoaXMgd29yayBpcyBs
aWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHUEwsIHZlcnNpb24gMiBvciBsYXRl
ci4KKyAqIFNlZSB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5Lgor
ICoKKyAqLworCisjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgorI2luY2x1ZGUgInFlbXUtY29tbW9u
LmgiCisKKyNpbmNsdWRlICJody9yZW1vdGUvbWFjaGluZS5oIgorI2luY2x1ZGUgImV4ZWMvYWRk
cmVzcy1zcGFjZXMuaCIKKyNpbmNsdWRlICJleGVjL21lbW9yeS5oIgorI2luY2x1ZGUgInFhcGkv
ZXJyb3IuaCIKKworc3RhdGljIHZvaWQgcmVtb3RlX21hY2hpbmVfaW5pdChNYWNoaW5lU3RhdGUg
Km1hY2hpbmUpCit7CisgICAgTWVtb3J5UmVnaW9uICpzeXN0ZW1fbWVtb3J5LCAqc3lzdGVtX2lv
LCAqcGNpX21lbW9yeTsKKyAgICBSZW1vdGVNYWNoaW5lU3RhdGUgKnMgPSBSRU1PVEVfTUFDSElO
RShtYWNoaW5lKTsKKyAgICBSZW1vdGVQQ0lIb3N0ICpyZW1faG9zdDsKKworICAgIHN5c3RlbV9t
ZW1vcnkgPSBnZXRfc3lzdGVtX21lbW9yeSgpOworICAgIHN5c3RlbV9pbyA9IGdldF9zeXN0ZW1f
aW8oKTsKKworICAgIHBjaV9tZW1vcnkgPSBnX25ldyhNZW1vcnlSZWdpb24sIDEpOworICAgIG1l
bW9yeV9yZWdpb25faW5pdChwY2lfbWVtb3J5LCBOVUxMLCAicGNpIiwgVUlOVDY0X01BWCk7CisK
KyAgICByZW1faG9zdCA9IFJFTU9URV9QQ0lIT1NUKHFkZXZfbmV3KFRZUEVfUkVNT1RFX1BDSUhP
U1QpKTsKKworICAgIHJlbV9ob3N0LT5tcl9wY2lfbWVtID0gcGNpX21lbW9yeTsKKyAgICByZW1f
aG9zdC0+bXJfc3lzX21lbSA9IHN5c3RlbV9tZW1vcnk7CisgICAgcmVtX2hvc3QtPm1yX3N5c19p
byA9IHN5c3RlbV9pbzsKKworICAgIHMtPmhvc3QgPSByZW1faG9zdDsKKworICAgIG9iamVjdF9w
cm9wZXJ0eV9hZGRfY2hpbGQoT0JKRUNUKHMpLCAicmVtb3RlLXBjaWhvc3QiLCBPQkpFQ1QocmVt
X2hvc3QpKTsKKyAgICBtZW1vcnlfcmVnaW9uX2FkZF9zdWJyZWdpb25fb3ZlcmxhcChzeXN0ZW1f
bWVtb3J5LCAweDAsIHBjaV9tZW1vcnksIC0xKTsKKworICAgIHFkZXZfcmVhbGl6ZShERVZJQ0Uo
cmVtX2hvc3QpLCBzeXNidXNfZ2V0X2RlZmF1bHQoKSwgJmVycm9yX2ZhdGFsKTsKK30KKworc3Rh
dGljIHZvaWQgcmVtb3RlX21hY2hpbmVfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqb2MsIHZvaWQg
KmRhdGEpCit7CisgICAgTWFjaGluZUNsYXNzICptYyA9IE1BQ0hJTkVfQ0xBU1Mob2MpOworCisg
ICAgbWMtPmluaXQgPSByZW1vdGVfbWFjaGluZV9pbml0OworICAgIG1jLT5kZXNjID0gIkV4cGVy
aW1lbnRhbCByZW1vdGUgbWFjaGluZSI7Cit9CisKK3N0YXRpYyBjb25zdCBUeXBlSW5mbyByZW1v
dGVfbWFjaGluZSA9IHsKKyAgICAubmFtZSA9IFRZUEVfUkVNT1RFX01BQ0hJTkUsCisgICAgLnBh
cmVudCA9IFRZUEVfTUFDSElORSwKKyAgICAuaW5zdGFuY2Vfc2l6ZSA9IHNpemVvZihSZW1vdGVN
YWNoaW5lU3RhdGUpLAorICAgIC5jbGFzc19pbml0ID0gcmVtb3RlX21hY2hpbmVfY2xhc3NfaW5p
dCwKK307CisKK3N0YXRpYyB2b2lkIHJlbW90ZV9tYWNoaW5lX3JlZ2lzdGVyX3R5cGVzKHZvaWQp
Cit7CisgICAgdHlwZV9yZWdpc3Rlcl9zdGF0aWMoJnJlbW90ZV9tYWNoaW5lKTsKK30KKwordHlw
ZV9pbml0KHJlbW90ZV9tYWNoaW5lX3JlZ2lzdGVyX3R5cGVzKTsKZGlmZiAtLWdpdCBhL2h3L21l
c29uLmJ1aWxkIGIvaHcvbWVzb24uYnVpbGQKaW5kZXggMDEwZGU3MjE5Yy4uZTYxNWQ3MmQ0ZCAx
MDA2NDQKLS0tIGEvaHcvbWVzb24uYnVpbGQKKysrIGIvaHcvbWVzb24uYnVpbGQKQEAgLTU2LDYg
KzU2LDcgQEAgc3ViZGlyKCdtb3hpZScpCiBzdWJkaXIoJ25pb3MyJykKIHN1YmRpcignb3BlbnJp
c2MnKQogc3ViZGlyKCdwcGMnKQorc3ViZGlyKCdyZW1vdGUnKQogc3ViZGlyKCdyaXNjdicpCiBz
dWJkaXIoJ3J4JykKIHN1YmRpcignczM5MHgnKQpkaWZmIC0tZ2l0IGEvaHcvcmVtb3RlL21lc29u
LmJ1aWxkIGIvaHcvcmVtb3RlL21lc29uLmJ1aWxkCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLjE5N2IwMzg2NDYKLS0tIC9kZXYvbnVsbAorKysgYi9ody9yZW1vdGUvbWVz
b24uYnVpbGQKQEAgLTAsMCArMSw1IEBACityZW1vdGVfc3MgPSBzcy5zb3VyY2Vfc2V0KCkKKwor
cmVtb3RlX3NzLmFkZCh3aGVuOiAnQ09ORklHX01VTFRJUFJPQ0VTUycsIGlmX3RydWU6IGZpbGVz
KCdtYWNoaW5lLmMnKSkKKworc29mdG1tdV9zcy5hZGRfYWxsKHdoZW46ICdDT05GSUdfTVVMVElQ
Uk9DRVNTJywgaWZfdHJ1ZTogcmVtb3RlX3NzKQotLSAKMi4yOS4yCgo=


