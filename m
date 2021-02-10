Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8AA3162DA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 10:55:43 +0100 (CET)
Received: from localhost ([::1]:42990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mDm-0003zn-U7
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 04:55:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9lqM-0006ci-2G
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:31:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9lqH-00080B-Sr
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612949485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Zh8p4SflgSqAiHL8Zqv7hpdRPhsOqr+pSuTgvlZxJk=;
 b=LIuVSnMEI8hqA//9OZnEvx/kkdv3gaaC4Dx82f5dM5h0aNOwx63dTmdJJM+fbQP/BF70R2
 3JcMpkwsH+Fy1ne2S3iFhTjqVDkOctCBgxbgSiwkQgPA+CT7tFFe0uSzeK/4vh5nIOa9u2
 ly7seBN4T0DJUmV/uygQo5bMqJhIERc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-3i-V2Z-pOlOMppBwBgmWIg-1; Wed, 10 Feb 2021 04:31:23 -0500
X-MC-Unique: 3i-V2Z-pOlOMppBwBgmWIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DDF680196C;
 Wed, 10 Feb 2021 09:31:21 +0000 (UTC)
Received: from localhost (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96D1360BE2;
 Wed, 10 Feb 2021 09:31:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v4 25/27] multi-process: Retrieve PCI info from remote process
Date: Wed, 10 Feb 2021 09:26:26 +0000
Message-Id: <20210210092628.193785-26-stefanha@redhat.com>
In-Reply-To: <20210210092628.193785-1-stefanha@redhat.com>
References: <20210210092628.193785-1-stefanha@redhat.com>
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
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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

RnJvbTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPgoKUmV0cmlldmUg
UENJIGNvbmZpZ3VyYXRpb24gaW5mbyBhYm91dCB0aGUgcmVtb3RlIGRldmljZSBhbmQKY29uZmln
dXJlIHRoZSBQcm94eSBQQ0kgb2JqZWN0IGJhc2VkIG9uIHRoZSByZXR1cm5lZCBpbmZvcm1hdGlv
bgoKU2lnbmVkLW9mZi1ieTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xl
LmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNs
ZS5jb20+ClNpZ25lZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xl
LmNvbT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4K
TWVzc2FnZS1pZDogODVlZTM2N2JiYjk5M2FhMjM2OTliNDRjZmVkZDgzYjRlYTZkNTIyMS4xNjEx
OTM4MzE5LmdpdC5qYWcucmFtYW5Ab3JhY2xlLmNvbQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFq
bm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogaHcvcmVtb3RlL3Byb3h5LmMgfCA4NCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDg0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ody9yZW1vdGUvcHJveHkuYyBi
L2h3L3JlbW90ZS9wcm94eS5jCmluZGV4IDU1NWIzMTAzZjQuLmEwODI3MDk4ODEgMTAwNjQ0Ci0t
LSBhL2h3L3JlbW90ZS9wcm94eS5jCisrKyBiL2h3L3JlbW90ZS9wcm94eS5jCkBAIC0yNSw2ICsy
NSw4IEBACiAjaW5jbHVkZSAic3lzZW11L2t2bS5oIgogI2luY2x1ZGUgInV0aWwvZXZlbnRfbm90
aWZpZXItcG9zaXguYyIKIAorc3RhdGljIHZvaWQgcHJvYmVfcGNpX2luZm8oUENJRGV2aWNlICpk
ZXYsIEVycm9yICoqZXJycCk7CisKIHN0YXRpYyB2b2lkIHByb3h5X2ludHhfdXBkYXRlKFBDSURl
dmljZSAqcGNpX2RldikKIHsKICAgICBQQ0lQcm94eURldiAqZGV2ID0gUENJX1BST1hZX0RFVihw
Y2lfZGV2KTsKQEAgLTc3LDYgKzc5LDcgQEAgc3RhdGljIHZvaWQgcGNpX3Byb3h5X2Rldl9yZWFs
aXplKFBDSURldmljZSAqZGV2aWNlLCBFcnJvciAqKmVycnApCiB7CiAgICAgRVJSUF9HVUFSRCgp
OwogICAgIFBDSVByb3h5RGV2ICpkZXYgPSBQQ0lfUFJPWFlfREVWKGRldmljZSk7CisgICAgdWlu
dDhfdCAqcGNpX2NvbmYgPSBkZXZpY2UtPmNvbmZpZzsKICAgICBpbnQgZmQ7CiAKICAgICBpZiAo
IWRldi0+ZmQpIHsKQEAgLTEwNiw5ICsxMDksMTQgQEAgc3RhdGljIHZvaWQgcGNpX3Byb3h5X2Rl
dl9yZWFsaXplKFBDSURldmljZSAqZGV2aWNlLCBFcnJvciAqKmVycnApCiAgICAgcWVtdV9tdXRl
eF9pbml0KCZkZXYtPmlvX211dGV4KTsKICAgICBxaW9fY2hhbm5lbF9zZXRfYmxvY2tpbmcoZGV2
LT5pb2MsIHRydWUsIE5VTEwpOwogCisgICAgcGNpX2NvbmZbUENJX0xBVEVOQ1lfVElNRVJdID0g
MHhmZjsKKyAgICBwY2lfY29uZltQQ0lfSU5URVJSVVBUX1BJTl0gPSAweDAxOworCiAgICAgcHJv
eHlfbWVtb3J5X2xpc3RlbmVyX2NvbmZpZ3VyZSgmZGV2LT5wcm94eV9saXN0ZW5lciwgZGV2LT5p
b2MpOwogCiAgICAgc2V0dXBfaXJxZmQoZGV2KTsKKworICAgIHByb2JlX3BjaV9pbmZvKFBDSV9E
RVZJQ0UoZGV2KSwgZXJycCk7CiB9CiAKIHN0YXRpYyB2b2lkIHBjaV9wcm94eV9kZXZfZXhpdChQ
Q0lEZXZpY2UgKnBkZXYpCkBAIC0yNzQsMyArMjgyLDc5IEBAIGNvbnN0IE1lbW9yeVJlZ2lvbk9w
cyBwcm94eV9tcl9vcHMgPSB7CiAgICAgICAgIC5tYXhfYWNjZXNzX3NpemUgPSA4LAogICAgIH0s
CiB9OworCitzdGF0aWMgdm9pZCBwcm9iZV9wY2lfaW5mbyhQQ0lEZXZpY2UgKmRldiwgRXJyb3Ig
KiplcnJwKQoreworICAgIFBDSURldmljZUNsYXNzICpwYyA9IFBDSV9ERVZJQ0VfR0VUX0NMQVNT
KGRldik7CisgICAgdWludDMyX3Qgb3JpZ192YWwsIG5ld192YWwsIGJhc2VfY2xhc3MsIHZhbDsK
KyAgICBQQ0lQcm94eURldiAqcGRldiA9IFBDSV9QUk9YWV9ERVYoZGV2KTsKKyAgICBEZXZpY2VD
bGFzcyAqZGMgPSBERVZJQ0VfQ0xBU1MocGMpOworICAgIHVpbnQ4X3QgdHlwZTsKKyAgICBpbnQg
aSwgc2l6ZTsKKworICAgIGNvbmZpZ19vcF9zZW5kKHBkZXYsIFBDSV9WRU5ET1JfSUQsICZ2YWws
IDIsIE1QUUVNVV9DTURfUENJX0NGR1JFQUQpOworICAgIHBjLT52ZW5kb3JfaWQgPSAodWludDE2
X3QpdmFsOworCisgICAgY29uZmlnX29wX3NlbmQocGRldiwgUENJX0RFVklDRV9JRCwgJnZhbCwg
MiwgTVBRRU1VX0NNRF9QQ0lfQ0ZHUkVBRCk7CisgICAgcGMtPmRldmljZV9pZCA9ICh1aW50MTZf
dCl2YWw7CisKKyAgICBjb25maWdfb3Bfc2VuZChwZGV2LCBQQ0lfQ0xBU1NfREVWSUNFLCAmdmFs
LCAyLCBNUFFFTVVfQ01EX1BDSV9DRkdSRUFEKTsKKyAgICBwYy0+Y2xhc3NfaWQgPSAodWludDE2
X3QpdmFsOworCisgICAgY29uZmlnX29wX3NlbmQocGRldiwgUENJX1NVQlNZU1RFTV9JRCwgJnZh
bCwgMiwgTVBRRU1VX0NNRF9QQ0lfQ0ZHUkVBRCk7CisgICAgcGMtPnN1YnN5c3RlbV9pZCA9ICh1
aW50MTZfdCl2YWw7CisKKyAgICBiYXNlX2NsYXNzID0gcGMtPmNsYXNzX2lkID4+IDQ7CisgICAg
c3dpdGNoIChiYXNlX2NsYXNzKSB7CisgICAgY2FzZSBQQ0lfQkFTRV9DTEFTU19CUklER0U6Cisg
ICAgICAgIHNldF9iaXQoREVWSUNFX0NBVEVHT1JZX0JSSURHRSwgZGMtPmNhdGVnb3JpZXMpOwor
ICAgICAgICBicmVhazsKKyAgICBjYXNlIFBDSV9CQVNFX0NMQVNTX1NUT1JBR0U6CisgICAgICAg
IHNldF9iaXQoREVWSUNFX0NBVEVHT1JZX1NUT1JBR0UsIGRjLT5jYXRlZ29yaWVzKTsKKyAgICAg
ICAgYnJlYWs7CisgICAgY2FzZSBQQ0lfQkFTRV9DTEFTU19ORVRXT1JLOgorICAgICAgICBzZXRf
Yml0KERFVklDRV9DQVRFR09SWV9ORVRXT1JLLCBkYy0+Y2F0ZWdvcmllcyk7CisgICAgICAgIGJy
ZWFrOworICAgIGNhc2UgUENJX0JBU0VfQ0xBU1NfSU5QVVQ6CisgICAgICAgIHNldF9iaXQoREVW
SUNFX0NBVEVHT1JZX0lOUFVULCBkYy0+Y2F0ZWdvcmllcyk7CisgICAgICAgIGJyZWFrOworICAg
IGNhc2UgUENJX0JBU0VfQ0xBU1NfRElTUExBWToKKyAgICAgICAgc2V0X2JpdChERVZJQ0VfQ0FU
RUdPUllfRElTUExBWSwgZGMtPmNhdGVnb3JpZXMpOworICAgICAgICBicmVhazsKKyAgICBjYXNl
IFBDSV9CQVNFX0NMQVNTX1BST0NFU1NPUjoKKyAgICAgICAgc2V0X2JpdChERVZJQ0VfQ0FURUdP
UllfQ1BVLCBkYy0+Y2F0ZWdvcmllcyk7CisgICAgICAgIGJyZWFrOworICAgIGRlZmF1bHQ6Cisg
ICAgICAgIHNldF9iaXQoREVWSUNFX0NBVEVHT1JZX01JU0MsIGRjLT5jYXRlZ29yaWVzKTsKKyAg
ICAgICAgYnJlYWs7CisgICAgfQorCisgICAgZm9yIChpID0gMDsgaSA8IFBDSV9OVU1fUkVHSU9O
UzsgaSsrKSB7CisgICAgICAgIGNvbmZpZ19vcF9zZW5kKHBkZXYsIFBDSV9CQVNFX0FERFJFU1Nf
MCArICg0ICogaSksICZvcmlnX3ZhbCwgNCwKKyAgICAgICAgICAgICAgICAgICAgICAgTVBRRU1V
X0NNRF9QQ0lfQ0ZHUkVBRCk7CisgICAgICAgIG5ld192YWwgPSAweGZmZmZmZmZmOworICAgICAg
ICBjb25maWdfb3Bfc2VuZChwZGV2LCBQQ0lfQkFTRV9BRERSRVNTXzAgKyAoNCAqIGkpLCAmbmV3
X3ZhbCwgNCwKKyAgICAgICAgICAgICAgICAgICAgICAgTVBRRU1VX0NNRF9QQ0lfQ0ZHV1JJVEUp
OworICAgICAgICBjb25maWdfb3Bfc2VuZChwZGV2LCBQQ0lfQkFTRV9BRERSRVNTXzAgKyAoNCAq
IGkpLCAmbmV3X3ZhbCwgNCwKKyAgICAgICAgICAgICAgICAgICAgICAgTVBRRU1VX0NNRF9QQ0lf
Q0ZHUkVBRCk7CisgICAgICAgIHNpemUgPSAofihuZXdfdmFsICYgMHhGRkZGRkZGMCkpICsgMTsK
KyAgICAgICAgY29uZmlnX29wX3NlbmQocGRldiwgUENJX0JBU0VfQUREUkVTU18wICsgKDQgKiBp
KSwgJm9yaWdfdmFsLCA0LAorICAgICAgICAgICAgICAgICAgICAgICBNUFFFTVVfQ01EX1BDSV9D
RkdXUklURSk7CisgICAgICAgIHR5cGUgPSAobmV3X3ZhbCAmIDB4MSkgPworICAgICAgICAgICAg
ICAgICAgIFBDSV9CQVNFX0FERFJFU1NfU1BBQ0VfSU8gOiBQQ0lfQkFTRV9BRERSRVNTX1NQQUNF
X01FTU9SWTsKKworICAgICAgICBpZiAoc2l6ZSkgeworICAgICAgICAgICAgZ19hdXRvZnJlZSBj
aGFyICpuYW1lOworICAgICAgICAgICAgcGRldi0+cmVnaW9uW2ldLmRldiA9IHBkZXY7CisgICAg
ICAgICAgICBwZGV2LT5yZWdpb25baV0ucHJlc2VudCA9IHRydWU7CisgICAgICAgICAgICBpZiAo
dHlwZSA9PSBQQ0lfQkFTRV9BRERSRVNTX1NQQUNFX01FTU9SWSkgeworICAgICAgICAgICAgICAg
IHBkZXYtPnJlZ2lvbltpXS5tZW1vcnkgPSB0cnVlOworICAgICAgICAgICAgfQorICAgICAgICAg
ICAgbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigiYmFyLXJlZ2lvbi0lZCIsIGkpOworICAgICAgICAg
ICAgbWVtb3J5X3JlZ2lvbl9pbml0X2lvKCZwZGV2LT5yZWdpb25baV0ubXIsIE9CSkVDVChwZGV2
KSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcHJveHlfbXJfb3BzLCAmcGRl
di0+cmVnaW9uW2ldLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hbWUsIHNp
emUpOworICAgICAgICAgICAgcGNpX3JlZ2lzdGVyX2JhcihkZXYsIGksIHR5cGUsICZwZGV2LT5y
ZWdpb25baV0ubXIpOworICAgICAgICB9CisgICAgfQorfQotLSAKMi4yOS4yCgo=


