Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F3F31629F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 10:47:02 +0100 (CET)
Received: from localhost ([::1]:53190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9m5M-0004Ix-U9
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 04:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9lnF-000316-OY
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:28:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9lnB-00066r-Km
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612949293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qusdGUvJRfUArz9VEKmIEc5pyvqsCVc0zRjN4WyQ0Gc=;
 b=P6lOHbdrQZeXGy/2b7LfdQ6V2iy+QEJ6YE+xLWUErDdB6B/6UYxCxIGGDw7LjpvvBt/yFt
 UBSB5jvwjwjKaWks+k2q6/ESD5BKfGAs3hIjo2LA87baVhaauQoVwcJduEKMn6mtlU7bY7
 gUgDr2Ct+7yT7QAwQCrKVrmMICdYVZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-fjn1qCTDPO-Ef1SjZOZtnA-1; Wed, 10 Feb 2021 04:28:10 -0500
X-MC-Unique: fjn1qCTDPO-Ef1SjZOZtnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AAFF8710E5;
 Wed, 10 Feb 2021 09:28:09 +0000 (UTC)
Received: from localhost (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7173719486;
 Wed, 10 Feb 2021 09:27:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v4 08/27] multi-process: add configure and usage information
Date: Wed, 10 Feb 2021 09:26:09 +0000
Message-Id: <20210210092628.193785-9-stefanha@redhat.com>
In-Reply-To: <20210210092628.193785-1-stefanha@redhat.com>
References: <20210210092628.193785-1-stefanha@redhat.com>
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
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 thuth@redhat.com, Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4KCkFkZHMg
ZG9jdW1lbnRhdGlvbiBleHBsYWluaW5nIHRoZSBjb21tYW5kLWxpbmUgYXJndW1lbnRzIG5lZWRl
ZAp0byB1c2UgbXVsdGktcHJvY2Vzcy4KClNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8
ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJh
bWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24g
PGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkg
PHN0ZWZhbmhhQHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDQ5Zjc1N2E4NGU1ZGQ2ZmFlMTRiMjI1
NDQ4OTdkMTEyNGM1ZmRiYWQuMTYxMTkzODMxOS5naXQuamFnLnJhbWFuQG9yYWNsZS5jb20KCltN
b3ZlIG9ycGhhbiBkb2NzL211bHRpLXByb2Nlc3MucnN0IGRvY3VtZW50IGludG8gZG9jcy9zeXN0
ZW0vIGFuZCBhZGQKaXQgdG8gaW5kZXgucnN0IHRvIHByZXZlbnQgU3BoaW54ICJkb2N1bWVudCBp
c24ndCBpbmNsdWRlZCBpbiBhbnkKdG9jdHJlZSIgZXJyb3IuCi0tU3RlZmFuXQoKU2lnbmVkLW9m
Zi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgICAgIHwgIDEgKwogZG9jcy9zeXN0ZW0vaW5kZXgucnN0ICAgICAg
ICAgfCAgMSArCiBkb2NzL3N5c3RlbS9tdWx0aS1wcm9jZXNzLnJzdCB8IDY0ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL3N5c3RlbS9tdWx0aS1wcm9jZXNzLnJzdAoKZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggZGRmZjhkMjVlOC4uMTY1
ODM5Nzc2MiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTMy
MDYsNiArMzIwNiw3IEBAIE06IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNv
bT4KIE06IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29tPgogUzogTWFp
bnRhaW5lZAogRjogZG9jcy9kZXZlbC9tdWx0aS1wcm9jZXNzLnJzdAorRjogZG9jcy9zeXN0ZW0v
bXVsdGktcHJvY2Vzcy5yc3QKIAogQnVpbGQgYW5kIHRlc3QgYXV0b21hdGlvbgogLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpkaWZmIC0tZ2l0IGEvZG9jcy9zeXN0ZW0vaW5kZXgucnN0IGIvZG9j
cy9zeXN0ZW0vaW5kZXgucnN0CmluZGV4IGQ0MGY3MmM5MmIuLjYyNWI0OTQzNzIgMTAwNjQ0Ci0t
LSBhL2RvY3Mvc3lzdGVtL2luZGV4LnJzdAorKysgYi9kb2NzL3N5c3RlbS9pbmRleC5yc3QKQEAg
LTM0LDYgKzM0LDcgQEAgQ29udGVudHM6CiAgICBwci1tYW5hZ2VyCiAgICB0YXJnZXRzCiAgICBz
ZWN1cml0eQorICAgbXVsdGktcHJvY2VzcwogICAgZGVwcmVjYXRlZAogICAgcmVtb3ZlZC1mZWF0
dXJlcwogICAgYnVpbGQtcGxhdGZvcm1zCmRpZmYgLS1naXQgYS9kb2NzL3N5c3RlbS9tdWx0aS1w
cm9jZXNzLnJzdCBiL2RvY3Mvc3lzdGVtL211bHRpLXByb2Nlc3MucnN0Cm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjQ2YmIwY2FmYzIKLS0tIC9kZXYvbnVsbAorKysgYi9k
b2NzL3N5c3RlbS9tdWx0aS1wcm9jZXNzLnJzdApAQCAtMCwwICsxLDY0IEBACitNdWx0aS1wcm9j
ZXNzIFFFTVUKKz09PT09PT09PT09PT09PT09PQorCitUaGlzIGRvY3VtZW50IGRlc2NyaWJlcyBo
b3cgdG8gY29uZmlndXJlIGFuZCB1c2UgbXVsdGktcHJvY2VzcyBxZW11LgorRm9yIHRoZSBkZXNp
Z24gZG9jdW1lbnQgcmVmZXIgdG8gZG9jcy9kZXZlbC9xZW11LW11bHRpcHJvY2Vzcy4KKworMSkg
Q29uZmlndXJhdGlvbgorLS0tLS0tLS0tLS0tLS0tLQorCittdWx0aS1wcm9jZXNzIGlzIGVuYWJs
ZWQgYnkgZGVmYXVsdCBmb3IgdGFyZ2V0cyB0aGF0IGVuYWJsZSBLVk0KKworCisyKSBVc2FnZQor
LS0tLS0tLS0KKworTXVsdGktcHJvY2VzcyBRRU1VIHJlcXVpcmVzIGFuIG9yY2hlc3RyYXRvciB0
byBsYXVuY2guCisKK0ZvbGxvd2luZyBpcyBhIGRlc2NyaXB0aW9uIG9mIGNvbW1hbmQtbGluZSB1
c2VkIHRvIGxhdW5jaCBtcHFlbXUuCisKKyogT3JjaGVzdHJhdG9yOgorCisgIC0gVGhlIE9yY2hl
c3RyYXRvciBjcmVhdGVzIGEgdW5peCBzb2NrZXRwYWlyCisKKyAgLSBJdCBsYXVuY2hlcyB0aGUg
cmVtb3RlIHByb2Nlc3MgYW5kIHBhc3NlcyBvbmUgb2YgdGhlCisgICAgc29ja2V0cyB0byBpdCB2
aWEgY29tbWFuZC1saW5lLgorCisgIC0gSXQgdGhlbiBsYXVuY2hlcyBRRU1VIGFuZCBzcGVjaWZp
ZXMgdGhlIG90aGVyIHNvY2tldCBhcyBhbiBvcHRpb24KKyAgICB0byB0aGUgUHJveHkgZGV2aWNl
IG9iamVjdAorCisqIFJlbW90ZSBQcm9jZXNzOgorCisgIC0gUUVNVSBjYW4gZW50ZXIgcmVtb3Rl
IHByb2Nlc3MgbW9kZSBieSB1c2luZyB0aGUgInJlbW90ZSIgbWFjaGluZQorICAgIG9wdGlvbi4K
KworICAtIFRoZSBvcmNoZXN0cmF0b3IgY3JlYXRlcyBhICJyZW1vdGUtb2JqZWN0IiB3aXRoIGRl
dGFpbHMgYWJvdXQKKyAgICB0aGUgZGV2aWNlIGFuZCB0aGUgZmlsZSBkZXNjcmlwdG9yIGZvciB0
aGUgZGV2aWNlCisKKyAgLSBUaGUgcmVtYWluaW5nIG9wdGlvbnMgYXJlIG5vIGRpZmZlcmVudCBm
cm9tIGhvdyBvbmUgbGF1bmNoZXMgUUVNVSB3aXRoCisgICAgZGV2aWNlcy4KKworICAtIEV4YW1w
bGUgY29tbWFuZC1saW5lIGZvciB0aGUgcmVtb3RlIHByb2Nlc3MgaXMgYXMgZm9sbG93czoKKwor
ICAgICAgL3Vzci9iaW4vcWVtdS1zeXN0ZW0teDg2XzY0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKKyAgICAgIC1tYWNoaW5lIHgtcmVtb3RlICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAtZGV2aWNlIGxzaTUz
Yzg5NWEsaWQ9bHNpMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAor
ICAgICAgLWRyaXZlIGlkPWRyaXZlX2ltYWdlMixmaWxlPS9idWlsZC9vbDctbnZtZS10ZXN0LTEu
cWNvdzIgICAgICAgICAgIFwKKyAgICAgIC1kZXZpY2Ugc2NzaS1oZCxpZD1kcml2ZTIsZHJpdmU9
ZHJpdmVfaW1hZ2UyLGJ1cz1sc2kwLjAsc2NzaS1pZD0wICBcCisgICAgICAtb2JqZWN0IHgtcmVt
b3RlLW9iamVjdCxpZD1yb2JqMSxkZXZpZD1sc2kxLGZkPTQsCisKKyogUUVNVToKKworICAtIFNp
bmNlIHBhcnRzIG9mIHRoZSBSQU0gYXJlIHNoYXJlZCBiZXR3ZWVuIFFFTVUgJiByZW1vdGUgcHJv
Y2VzcywgYQorICAgIG1lbW9yeS1iYWNrZW5kLW1lbWZkIGlzIHJlcXVpcmVkIHRvIGZhY2lsaXRh
dGUgdGhpcywgYXMgZm9sbG93czoKKworICAgIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtbWVtZmQs
aWQ9bWVtLHNpemU9MkcKKworICAtIEEgIngtcGNpLXByb3h5LWRldiIgZGV2aWNlIGlzIGNyZWF0
ZWQgZm9yIGVhY2ggb2YgdGhlIFBDSSBkZXZpY2VzIGVtdWxhdGVkCisgICAgaW4gdGhlIHJlbW90
ZSBwcm9jZXNzLiBBICJzb2NrZXQiIHN1Yi1vcHRpb24gc3BlY2lmaWVzIHRoZSBvdGhlciBlbmQg
b2YKKyAgICB1bml4IGNoYW5uZWwgY3JlYXRlZCBieSBvcmNoZXN0cmF0b3IuIFRoZSAiaWQiIHN1
Yi1vcHRpb24gbXVzdCBiZSBzcGVjaWZpZWQKKyAgICBhbmQgc2hvdWxkIGJlIHRoZSBzYW1lIGFz
IHRoZSAiaWQiIHNwZWNpZmllZCBmb3IgdGhlIHJlbW90ZSBQQ0kgZGV2aWNlCisKKyAgLSBFeGFt
cGxlIGNvbW1hbmRsaW5lIGZvciBRRU1VIGlzIGFzIGZvbGxvd3M6CisKKyAgICAgIC1kZXZpY2Ug
eC1wY2ktcHJveHktZGV2LGlkPWxzaTAsc29ja2V0PTMKLS0gCjIuMjkuMgoK


