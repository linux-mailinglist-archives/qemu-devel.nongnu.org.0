Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB0C30F75E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:14:01 +0100 (CET)
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hGa-0003yg-Dk
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gq3-0000tz-Nj
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:46:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gpz-0005P4-3l
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73vaRN72VMR4JYMuD5vgrIXRPYVSUarKAqNJp6z11Ao=;
 b=T5AGlYb5to4kia/gwRlTstjJhnam7UPzpn8atfC3L4vmzr99pli9QNYdrxeh77tHbKZcB0
 +jn7xuSBnUdD0J3chziynCYsRilqTrxO8TzX7wNH1YvE+Myl4tR/4tNcpAVJjJFsZ45D4d
 uLsw1b5pDnv8ztaqTefEooWXbAZCoNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-u2kyNY5WMUKZ8uDWtRz5jw-1; Thu, 04 Feb 2021 10:46:28 -0500
X-MC-Unique: u2kyNY5WMUKZ8uDWtRz5jw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F911835E22;
 Thu,  4 Feb 2021 15:46:27 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C30010016FD;
 Thu,  4 Feb 2021 15:46:14 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 16/27] multi-process: Initialize message handler in remote
 device
Date: Thu,  4 Feb 2021 15:43:16 +0000
Message-Id: <20210204154327.386529-17-stefanha@redhat.com>
In-Reply-To: <20210204154327.386529-1-stefanha@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

RnJvbTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPgoKSW5pdGlhbGl6
ZXMgdGhlIG1lc3NhZ2UgaGFuZGxlciBmdW5jdGlvbiBpbiB0aGUgcmVtb3RlIHByb2Nlc3MuIEl0
IGlzCmNhbGxlZCB3aGVuZXZlciB0aGVyZSdzIGFuIGV2ZW50IHBlbmRpbmcgb24gUUlPQ2hhbm5l
bCB0aGF0IHJlZ2lzdGVycwp0aGlzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogRWxlbmEgVWZp
bXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBH
IEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEphZ2Fu
bmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbiBI
YWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KTWVzc2FnZS1pZDogOTlkMzhkOGI5Mzc1M2E2
NDA5YWMyMzQwZTg1ODg1OGNkYTU5YWIxYi4xNjExOTM4MzE5LmdpdC5qYWcucmFtYW5Ab3JhY2xl
LmNvbQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+
Ci0tLQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgIHwgIDEgKwogaW5jbHVkZS9ody9yZW1v
dGUvbWFjaGluZS5oIHwgIDkgKysrKysrCiBody9yZW1vdGUvbWVzc2FnZS5jICAgICAgICAgfCA1
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBody9yZW1vdGUvbWVzb24u
YnVpbGQgICAgICAgfCAgMSArCiA0IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBody9yZW1vdGUvbWVzc2FnZS5jCgpkaWZmIC0tZ2l0IGEvTUFJTlRB
SU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA5NzEzN2Y2MTdiLi43NzE1MTNiYzM0IDEwMDY0NAot
LS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMzIwNyw2ICszMjA3LDcgQEAg
RjogaHcvcmVtb3RlL21hY2hpbmUuYwogRjogaW5jbHVkZS9ody9yZW1vdGUvbWFjaGluZS5oCiBG
OiBody9yZW1vdGUvbXBxZW11LWxpbmsuYwogRjogaW5jbHVkZS9ody9yZW1vdGUvbXBxZW11LWxp
bmsuaAorRjogaHcvcmVtb3RlL21lc3NhZ2UuYwogCiBCdWlsZCBhbmQgdGVzdCBhdXRvbWF0aW9u
CiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3JlbW90
ZS9tYWNoaW5lLmggYi9pbmNsdWRlL2h3L3JlbW90ZS9tYWNoaW5lLmgKaW5kZXggYmRmYmNhNDBi
OS4uYjkyYjJjZTcwNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody9yZW1vdGUvbWFjaGluZS5oCisr
KyBiL2luY2x1ZGUvaHcvcmVtb3RlL21hY2hpbmUuaApAQCAtMTQsNiArMTQsNyBAQAogI2luY2x1
ZGUgInFvbS9vYmplY3QuaCIKICNpbmNsdWRlICJody9ib2FyZHMuaCIKICNpbmNsdWRlICJody9w
Y2ktaG9zdC9yZW1vdGUuaCIKKyNpbmNsdWRlICJpby9jaGFubmVsLmgiCiAKIHN0cnVjdCBSZW1v
dGVNYWNoaW5lU3RhdGUgewogICAgIE1hY2hpbmVTdGF0ZSBwYXJlbnRfb2JqOwpAQCAtMjEsNyAr
MjIsMTUgQEAgc3RydWN0IFJlbW90ZU1hY2hpbmVTdGF0ZSB7CiAgICAgUmVtb3RlUENJSG9zdCAq
aG9zdDsKIH07CiAKKy8qIFVzZWQgdG8gcGFzcyB0byBjby1yb3V0aW5lIGRldmljZSBhbmQgaW9j
LiAqLwordHlwZWRlZiBzdHJ1Y3QgUmVtb3RlQ29tbURldiB7CisgICAgUENJRGV2aWNlICpkZXY7
CisgICAgUUlPQ2hhbm5lbCAqaW9jOworfSBSZW1vdGVDb21tRGV2OworCiAjZGVmaW5lIFRZUEVf
UkVNT1RFX01BQ0hJTkUgIngtcmVtb3RlLW1hY2hpbmUiCiBPQkpFQ1RfREVDTEFSRV9TSU1QTEVf
VFlQRShSZW1vdGVNYWNoaW5lU3RhdGUsIFJFTU9URV9NQUNISU5FKQogCit2b2lkIGNvcm91dGlu
ZV9mbiBtcHFlbXVfcmVtb3RlX21zZ19sb29wX2NvKHZvaWQgKmRhdGEpOworCiAjZW5kaWYKZGlm
ZiAtLWdpdCBhL2h3L3JlbW90ZS9tZXNzYWdlLmMgYi9ody9yZW1vdGUvbWVzc2FnZS5jCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjM2ZTJkNGZiMGMKLS0tIC9kZXYvbnVs
bAorKysgYi9ody9yZW1vdGUvbWVzc2FnZS5jCkBAIC0wLDAgKzEsNTcgQEAKKy8qCisgKiBDb3B5
cmlnaHQgwqkgMjAyMCwgMjAyMSBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLgorICoKKyAq
IFRoaXMgd29yayBpcyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHUEwtdjIs
IHZlcnNpb24gMiBvciBsYXRlci4KKyAqCisgKiBTZWUgdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUg
dG9wLWxldmVsIGRpcmVjdG9yeS4KKyAqCisgKi8KKworI2luY2x1ZGUgInFlbXUvb3NkZXAuaCIK
KyNpbmNsdWRlICJxZW11LWNvbW1vbi5oIgorCisjaW5jbHVkZSAiaHcvcmVtb3RlL21hY2hpbmUu
aCIKKyNpbmNsdWRlICJpby9jaGFubmVsLmgiCisjaW5jbHVkZSAiaHcvcmVtb3RlL21wcWVtdS1s
aW5rLmgiCisjaW5jbHVkZSAicWFwaS9lcnJvci5oIgorI2luY2x1ZGUgInN5c2VtdS9ydW5zdGF0
ZS5oIgorCit2b2lkIGNvcm91dGluZV9mbiBtcHFlbXVfcmVtb3RlX21zZ19sb29wX2NvKHZvaWQg
KmRhdGEpCit7CisgICAgZ19hdXRvZnJlZSBSZW1vdGVDb21tRGV2ICpjb20gPSAoUmVtb3RlQ29t
bURldiAqKWRhdGE7CisgICAgUENJRGV2aWNlICpwY2lfZGV2ID0gTlVMTDsKKyAgICBFcnJvciAq
bG9jYWxfZXJyID0gTlVMTDsKKworICAgIGFzc2VydChjb20tPmlvYyk7CisKKyAgICBwY2lfZGV2
ID0gY29tLT5kZXY7CisgICAgZm9yICg7ICFsb2NhbF9lcnI7KSB7CisgICAgICAgIE1QUWVtdU1z
ZyBtc2cgPSB7MH07CisKKyAgICAgICAgaWYgKCFtcHFlbXVfbXNnX3JlY3YoJm1zZywgY29tLT5p
b2MsICZsb2NhbF9lcnIpKSB7CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQorCisgICAg
ICAgIGlmICghbXBxZW11X21zZ192YWxpZCgmbXNnKSkgeworICAgICAgICAgICAgZXJyb3Jfc2V0
ZygmbG9jYWxfZXJyLCAiUmVjZWl2ZWQgaW52YWxpZCBtZXNzYWdlIGZyb20gcHJveHkiCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJpbiByZW1vdGUgcHJvY2VzcyBwaWQ9IkZN
VF9waWQiIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0cGlkKCkpOwor
ICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIH0KKworICAgICAgICBzd2l0Y2ggKG1zZy5jbWQp
IHsKKyAgICAgICAgZGVmYXVsdDoKKyAgICAgICAgICAgIGVycm9yX3NldGcoJmxvY2FsX2VyciwK
KyAgICAgICAgICAgICAgICAgICAgICAgIlVua25vd24gY29tbWFuZCAoJWQpIHJlY2VpdmVkIGZv
ciBkZXZpY2UgJXMiCisgICAgICAgICAgICAgICAgICAgICAgICIgKHBpZD0iRk1UX3BpZCIpIiwK
KyAgICAgICAgICAgICAgICAgICAgICAgbXNnLmNtZCwgREVWSUNFKHBjaV9kZXYpLT5pZCwgZ2V0
cGlkKCkpOworICAgICAgICB9CisgICAgfQorCisgICAgaWYgKGxvY2FsX2VycikgeworICAgICAg
ICBlcnJvcl9yZXBvcnRfZXJyKGxvY2FsX2Vycik7CisgICAgICAgIHFlbXVfc3lzdGVtX3NodXRk
b3duX3JlcXVlc3QoU0hVVERPV05fQ0FVU0VfSE9TVF9FUlJPUik7CisgICAgfSBlbHNlIHsKKyAg
ICAgICAgcWVtdV9zeXN0ZW1fc2h1dGRvd25fcmVxdWVzdChTSFVURE9XTl9DQVVTRV9HVUVTVF9T
SFVURE9XTik7CisgICAgfQorfQpkaWZmIC0tZ2l0IGEvaHcvcmVtb3RlL21lc29uLmJ1aWxkIGIv
aHcvcmVtb3RlL21lc29uLmJ1aWxkCmluZGV4IGEyYjJmYzBlNTkuLjlmNWM1N2YzNWEgMTAwNjQ0
Ci0tLSBhL2h3L3JlbW90ZS9tZXNvbi5idWlsZAorKysgYi9ody9yZW1vdGUvbWVzb24uYnVpbGQK
QEAgLTIsNSArMiw2IEBAIHJlbW90ZV9zcyA9IHNzLnNvdXJjZV9zZXQoKQogCiByZW1vdGVfc3Mu
YWRkKHdoZW46ICdDT05GSUdfTVVMVElQUk9DRVNTJywgaWZfdHJ1ZTogZmlsZXMoJ21hY2hpbmUu
YycpKQogcmVtb3RlX3NzLmFkZCh3aGVuOiAnQ09ORklHX01VTFRJUFJPQ0VTUycsIGlmX3RydWU6
IGZpbGVzKCdtcHFlbXUtbGluay5jJykpCityZW1vdGVfc3MuYWRkKHdoZW46ICdDT05GSUdfTVVM
VElQUk9DRVNTJywgaWZfdHJ1ZTogZmlsZXMoJ21lc3NhZ2UuYycpKQogCiBzb2Z0bW11X3NzLmFk
ZF9hbGwod2hlbjogJ0NPTkZJR19NVUxUSVBST0NFU1MnLCBpZl90cnVlOiByZW1vdGVfc3MpCi0t
IAoyLjI5LjIKCg==


