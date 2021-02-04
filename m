Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268E830F781
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:21:02 +0100 (CET)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hNN-0003X7-4d
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gqh-0001CO-HU
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:47:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gqa-0005e6-4u
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpLDch2T64hefa8N2wT8x7jUwItZKOQ1gBj0fH3LHIY=;
 b=M50yDdZR7dgU5CIhJ4Zf61zLwIKXip/QTdqGIJVD13ldgH1bUC0bbDHEsjuaB1f12Xhhtd
 3NSdWvAvcASIAQvN5Z/bkfowf0aMvIu2ILgmkkP9MAkEvAP9lh4ZP62WuhEtLurv7U5Dvf
 EAkvEIsyys9+00VbQRiSugWL9yr3HQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-2c3_h5FWOUKsL_XM-RH6IQ-1; Thu, 04 Feb 2021 10:47:05 -0500
X-MC-Unique: 2c3_h5FWOUKsL_XM-RH6IQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB20192AB78;
 Thu,  4 Feb 2021 15:47:03 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED46519709;
 Thu,  4 Feb 2021 15:47:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 20/27] multi-process: add proxy communication functions
Date: Thu,  4 Feb 2021 15:43:20 +0000
Message-Id: <20210204154327.386529-21-stefanha@redhat.com>
In-Reply-To: <20210204154327.386529-1-stefanha@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

RnJvbTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4KClNpZ25l
ZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+ClNp
Z25lZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4KU2ln
bmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+ClJl
dmlld2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ck1lc3NhZ2Ut
aWQ6IGQ1NGVkYjQxNzYzNjFlZWQ4NmI5MDNlOGYyNzA1ODM2M2I2YzgzYjMuMTYxMTkzODMxOS5n
aXQuamFnLnJhbWFuQG9yYWNsZS5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxz
dGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvaHcvcmVtb3RlL21wcWVtdS1saW5rLmgg
fCAgNCArKysrCiBody9yZW1vdGUvbXBxZW11LWxpbmsuYyAgICAgICAgIHwgMzQgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3JlbW90ZS9tcHFlbXUtbGluay5oIGIvaW5jbHVk
ZS9ody9yZW1vdGUvbXBxZW11LWxpbmsuaAppbmRleCA2ZWU1YmM1NzUxLi4xYjM1ZDQwOGY4IDEw
MDY0NAotLS0gYS9pbmNsdWRlL2h3L3JlbW90ZS9tcHFlbXUtbGluay5oCisrKyBiL2luY2x1ZGUv
aHcvcmVtb3RlL21wcWVtdS1saW5rLmgKQEAgLTE1LDYgKzE1LDggQEAKICNpbmNsdWRlICJxZW11
L3RocmVhZC5oIgogI2luY2x1ZGUgImlvL2NoYW5uZWwuaCIKICNpbmNsdWRlICJleGVjL2h3YWRk
ci5oIgorI2luY2x1ZGUgImlvL2NoYW5uZWwtc29ja2V0LmgiCisjaW5jbHVkZSAiaHcvcmVtb3Rl
L3Byb3h5LmgiCiAKICNkZWZpbmUgUkVNT1RFX01BWF9GRFMgOAogCkBAIC02OCw2ICs3MCw4IEBA
IHR5cGVkZWYgc3RydWN0IHsKIGJvb2wgbXBxZW11X21zZ19zZW5kKE1QUWVtdU1zZyAqbXNnLCBR
SU9DaGFubmVsICppb2MsIEVycm9yICoqZXJycCk7CiBib29sIG1wcWVtdV9tc2dfcmVjdihNUFFl
bXVNc2cgKm1zZywgUUlPQ2hhbm5lbCAqaW9jLCBFcnJvciAqKmVycnApOwogCit1aW50NjRfdCBt
cHFlbXVfbXNnX3NlbmRfYW5kX2F3YWl0X3JlcGx5KE1QUWVtdU1zZyAqbXNnLCBQQ0lQcm94eURl
diAqcGRldiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRXJyb3Ig
KiplcnJwKTsKIGJvb2wgbXBxZW11X21zZ192YWxpZChNUFFlbXVNc2cgKm1zZyk7CiAKICNlbmRp
ZgpkaWZmIC0tZ2l0IGEvaHcvcmVtb3RlL21wcWVtdS1saW5rLmMgYi9ody9yZW1vdGUvbXBxZW11
LWxpbmsuYwppbmRleCA0YjI1NjQ5YjM5Li44OGQxZjliZDVjIDEwMDY0NAotLS0gYS9ody9yZW1v
dGUvbXBxZW11LWxpbmsuYworKysgYi9ody9yZW1vdGUvbXBxZW11LWxpbmsuYwpAQCAtMTgyLDYg
KzE4Miw0MCBAQCBmYWlsOgogICAgIHJldHVybiByZXQ7CiB9CiAKKy8qCisgKiBTZW5kIG1zZyBh
bmQgd2FpdCBmb3IgYSByZXBseSB3aXRoIGNvbW1hbmQgY29kZSBSRVRfTVNHLgorICogUmV0dXJu
cyB0aGUgbWVzc2FnZSByZWNlaXZlZCBvZiBzaXplIHU2NCBvciBVSU5UNjRfTUFYCisgKiBvbiBl
cnJvci4KKyAqIENhbGxlZCBmcm9tIFZDUFUgdGhyZWFkIGluIG5vbi1jb3JvdXRpbmUgY29udGV4
dC4KKyAqIFVzZWQgYnkgdGhlIFByb3h5IG9iamVjdCB0byBjb21tdW5pY2F0ZSB0byByZW1vdGUg
cHJvY2Vzc2VzLgorICovCit1aW50NjRfdCBtcHFlbXVfbXNnX3NlbmRfYW5kX2F3YWl0X3JlcGx5
KE1QUWVtdU1zZyAqbXNnLCBQQ0lQcm94eURldiAqcGRldiwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgRXJyb3IgKiplcnJwKQoreworICAgIEVSUlBfR1VBUkQoKTsK
KyAgICBNUFFlbXVNc2cgbXNnX3JlcGx5ID0gezB9OworICAgIHVpbnQ2NF90IHJldCA9IFVJTlQ2
NF9NQVg7CisKKyAgICBhc3NlcnQoIXFlbXVfaW5fY29yb3V0aW5lKCkpOworCisgICAgUUVNVV9M
T0NLX0dVQVJEKCZwZGV2LT5pb19tdXRleCk7CisgICAgaWYgKCFtcHFlbXVfbXNnX3NlbmQobXNn
LCBwZGV2LT5pb2MsIGVycnApKSB7CisgICAgICAgIHJldHVybiByZXQ7CisgICAgfQorCisgICAg
aWYgKCFtcHFlbXVfbXNnX3JlY3YoJm1zZ19yZXBseSwgcGRldi0+aW9jLCBlcnJwKSkgeworICAg
ICAgICByZXR1cm4gcmV0OworICAgIH0KKworICAgIGlmICghbXBxZW11X21zZ192YWxpZCgmbXNn
X3JlcGx5KSkgeworICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJFUlJPUjogSW52YWxpZCByZXBs
eSByZWNlaXZlZCBmb3IgY29tbWFuZCAlZCIsCisgICAgICAgICAgICAgICAgICAgICAgICAgbXNn
LT5jbWQpOworICAgICAgICByZXR1cm4gcmV0OworICAgIH0KKworICAgIHJldHVybiBtc2dfcmVw
bHkuZGF0YS51NjQ7Cit9CisKIGJvb2wgbXBxZW11X21zZ192YWxpZChNUFFlbXVNc2cgKm1zZykK
IHsKICAgICBpZiAobXNnLT5jbWQgPj0gTVBRRU1VX0NNRF9NQVggJiYgbXNnLT5jbWQgPCAwKSB7
Ci0tIAoyLjI5LjIKCg==


