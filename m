Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D583B310E51
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:08:42 +0100 (CET)
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84b3-0005u7-Tx
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l84Hy-0003aF-IU
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:49:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l84Hw-0007Jl-A9
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612543735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMMsAZbbvX5nadniZiilkgkI30GHtGQ4kjI5uEPvbrY=;
 b=Qx5KTfsoP3AlZecTbR6hWULWZcwvn0XVktGxo4WuFUmPKyNFNZ/N1aDrZkgHhgyiecFQPJ
 Zjy7VkCkFs6nsQqras2BTDaBrEtTp4uoYYKvloqxNxQz9Tn8Vm7Kh7gyWFSM+DJaMbsDsg
 LtgYWJQoxP30EYj6pUUBIHIa3LUTwhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-vrxwtdnKNsGV7heYHcY6uw-1; Fri, 05 Feb 2021 11:48:53 -0500
X-MC-Unique: vrxwtdnKNsGV7heYHcY6uw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A9C580196C;
 Fri,  5 Feb 2021 16:48:51 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82BAC5D71D;
 Fri,  5 Feb 2021 16:48:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v3 20/27] multi-process: add proxy communication functions
Date: Fri,  5 Feb 2021 16:44:52 +0000
Message-Id: <20210205164459.432714-21-stefanha@redhat.com>
In-Reply-To: <20210205164459.432714-1-stefanha@redhat.com>
References: <20210205164459.432714-1-stefanha@redhat.com>
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
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
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
LWxpbmsuYwppbmRleCA0ZWUxMTI4Mjg1Li5mNWU5ZTAxOTIzIDEwMDY0NAotLS0gYS9ody9yZW1v
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


