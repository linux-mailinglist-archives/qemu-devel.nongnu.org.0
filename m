Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C782C310E89
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:23:49 +0100 (CET)
Received: from localhost ([::1]:53436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84pg-00040C-Q6
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l84JS-00059v-9T
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:50:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l84JI-0007tO-EM
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:50:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612543816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2Qvy19eJdC+602G2SjjJETx98iWAlmXaIyusGU/mUY=;
 b=McVxNRO5cGI/r9OrOqJSjbhAy7a1YAUfDk+d1jKSksIZFPP8ys4NSLgE1/y/0VOBxOtNNP
 aUu79eHoJl9PYzWMzRsGkF1GfpSAWeATi0FvMhMajM1HIO50GAi1vCE/QQejaiNB0GgO/b
 TQiJoxGzpoc97b3Sk/hT6jgcEQVakAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-Wm5WsacKO8SyCM8FtRq76w-1; Fri, 05 Feb 2021 11:50:14 -0500
X-MC-Unique: Wm5WsacKO8SyCM8FtRq76w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 968CB801975;
 Fri,  5 Feb 2021 16:50:12 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AA0D1A86C;
 Fri,  5 Feb 2021 16:49:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v3 26/27] multi-process: perform device reset in the remote
 process
Date: Fri,  5 Feb 2021 16:44:58 +0000
Message-Id: <20210205164459.432714-27-stefanha@redhat.com>
In-Reply-To: <20210205164459.432714-1-stefanha@redhat.com>
References: <20210205164459.432714-1-stefanha@redhat.com>
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
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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

RnJvbTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4KClBlcmZv
cm0gZGV2aWNlIHJlc2V0IGluIHRoZSByZW1vdGUgcHJvY2VzcyB3aGVuIFFFTVUgcGVyZm9ybXMK
ZGV2aWNlIHJlc2V0LiBUaGlzIGlzIHJlcXVpcmVkIHRvIHJlc2V0IHRoZSBpbnRlcm5hbCBzdGF0
ZQoobGlrZSByZWdpc3RlcnMsIGV0Yy4uLikgb2YgZW11bGF0ZWQgZGV2aWNlcwoKU2lnbmVkLW9m
Zi1ieTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4KU2lnbmVk
LW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+ClNpZ25l
ZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4KUmV2aWV3
ZWQtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KTWVzc2FnZS1pZDog
N2NiMjIwYTUxZjU2NWRjMDgxN2JkNzZlMmY1NDBlODljMmQyYjg1MC4xNjExOTM4MzE5LmdpdC5q
YWcucmFtYW5Ab3JhY2xlLmNvbQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9ody9yZW1vdGUvbXBxZW11LWxpbmsuaCB8ICAx
ICsKIGh3L3JlbW90ZS9tZXNzYWdlLmMgICAgICAgICAgICAgfCAyMiArKysrKysrKysrKysrKysr
KysrKysrCiBody9yZW1vdGUvcHJveHkuYyAgICAgICAgICAgICAgIHwgMTkgKysrKysrKysrKysr
KysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9ody9yZW1vdGUvbXBxZW11LWxpbmsuaCBiL2luY2x1ZGUvaHcvcmVtb3RlL21wcWVt
dS1saW5rLmgKaW5kZXggNzFkMjA2ZjAwZS4uNGVjMDkxNTg4NSAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9ody9yZW1vdGUvbXBxZW11LWxpbmsuaAorKysgYi9pbmNsdWRlL2h3L3JlbW90ZS9tcHFlbXUt
bGluay5oCkBAIC00MCw2ICs0MCw3IEBAIHR5cGVkZWYgZW51bSB7CiAgICAgTVBRRU1VX0NNRF9C
QVJfV1JJVEUsCiAgICAgTVBRRU1VX0NNRF9CQVJfUkVBRCwKICAgICBNUFFFTVVfQ01EX1NFVF9J
UlFGRCwKKyAgICBNUFFFTVVfQ01EX0RFVklDRV9SRVNFVCwKICAgICBNUFFFTVVfQ01EX01BWCwK
IH0gTVBRZW11Q21kOwogCmRpZmYgLS1naXQgYS9ody9yZW1vdGUvbWVzc2FnZS5jIGIvaHcvcmVt
b3RlL21lc3NhZ2UuYwppbmRleCBhZGFiMDQwY2ExLi4xMWQ3Mjk4NDVjIDEwMDY0NAotLS0gYS9o
dy9yZW1vdGUvbWVzc2FnZS5jCisrKyBiL2h3L3JlbW90ZS9tZXNzYWdlLmMKQEAgLTE5LDYgKzE5
LDcgQEAKICNpbmNsdWRlICJleGVjL21lbWF0dHJzLmgiCiAjaW5jbHVkZSAiaHcvcmVtb3RlL21l
bW9yeS5oIgogI2luY2x1ZGUgImh3L3JlbW90ZS9pb2h1Yi5oIgorI2luY2x1ZGUgInN5c2VtdS9y
ZXNldC5oIgogCiBzdGF0aWMgdm9pZCBwcm9jZXNzX2NvbmZpZ193cml0ZShRSU9DaGFubmVsICpp
b2MsIFBDSURldmljZSAqZGV2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVBR
ZW11TXNnICptc2csIEVycm9yICoqZXJycCk7CkBAIC0yNiw2ICsyNyw4IEBAIHN0YXRpYyB2b2lk
IHByb2Nlc3NfY29uZmlnX3JlYWQoUUlPQ2hhbm5lbCAqaW9jLCBQQ0lEZXZpY2UgKmRldiwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVBRZW11TXNnICptc2csIEVycm9yICoqZXJy
cCk7CiBzdGF0aWMgdm9pZCBwcm9jZXNzX2Jhcl93cml0ZShRSU9DaGFubmVsICppb2MsIE1QUWVt
dU1zZyAqbXNnLCBFcnJvciAqKmVycnApOwogc3RhdGljIHZvaWQgcHJvY2Vzc19iYXJfcmVhZChR
SU9DaGFubmVsICppb2MsIE1QUWVtdU1zZyAqbXNnLCBFcnJvciAqKmVycnApOworc3RhdGljIHZv
aWQgcHJvY2Vzc19kZXZpY2VfcmVzZXRfbXNnKFFJT0NoYW5uZWwgKmlvYywgUENJRGV2aWNlICpk
ZXYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRXJyb3IgKiplcnJwKTsK
IAogdm9pZCBjb3JvdXRpbmVfZm4gbXBxZW11X3JlbW90ZV9tc2dfbG9vcF9jbyh2b2lkICpkYXRh
KQogewpAQCAtNjksNiArNzIsOSBAQCB2b2lkIGNvcm91dGluZV9mbiBtcHFlbXVfcmVtb3RlX21z
Z19sb29wX2NvKHZvaWQgKmRhdGEpCiAgICAgICAgIGNhc2UgTVBRRU1VX0NNRF9TRVRfSVJRRkQ6
CiAgICAgICAgICAgICBwcm9jZXNzX3NldF9pcnFmZF9tc2cocGNpX2RldiwgJm1zZyk7CiAgICAg
ICAgICAgICBicmVhazsKKyAgICAgICAgY2FzZSBNUFFFTVVfQ01EX0RFVklDRV9SRVNFVDoKKyAg
ICAgICAgICAgIHByb2Nlc3NfZGV2aWNlX3Jlc2V0X21zZyhjb20tPmlvYywgcGNpX2RldiwgJmxv
Y2FsX2Vycik7CisgICAgICAgICAgICBicmVhazsKICAgICAgICAgZGVmYXVsdDoKICAgICAgICAg
ICAgIGVycm9yX3NldGcoJmxvY2FsX2VyciwKICAgICAgICAgICAgICAgICAgICAgICAgIlVua25v
d24gY29tbWFuZCAoJWQpIHJlY2VpdmVkIGZvciBkZXZpY2UgJXMiCkBAIC0yMDYsMyArMjEyLDE5
IEBAIGZhaWw6CiAgICAgICAgICAgICAgICAgICAgICAgZ2V0cGlkKCkpOwogICAgIH0KIH0KKwor
c3RhdGljIHZvaWQgcHJvY2Vzc19kZXZpY2VfcmVzZXRfbXNnKFFJT0NoYW5uZWwgKmlvYywgUENJ
RGV2aWNlICpkZXYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRXJyb3Ig
KiplcnJwKQoreworICAgIERldmljZUNsYXNzICpkYyA9IERFVklDRV9HRVRfQ0xBU1MoZGV2KTsK
KyAgICBEZXZpY2VTdGF0ZSAqcyA9IERFVklDRShkZXYpOworICAgIE1QUWVtdU1zZyByZXQgPSB7
IDAgfTsKKworICAgIGlmIChkYy0+cmVzZXQpIHsKKyAgICAgICAgZGMtPnJlc2V0KHMpOworICAg
IH0KKworICAgIHJldC5jbWQgPSBNUFFFTVVfQ01EX1JFVDsKKworICAgIG1wcWVtdV9tc2dfc2Vu
ZCgmcmV0LCBpb2MsIGVycnApOworfQpkaWZmIC0tZ2l0IGEvaHcvcmVtb3RlL3Byb3h5LmMgYi9o
dy9yZW1vdGUvcHJveHkuYwppbmRleCBhMDgyNzA5ODgxLi40ZmE0YmUwNzlkIDEwMDY0NAotLS0g
YS9ody9yZW1vdGUvcHJveHkuYworKysgYi9ody9yZW1vdGUvcHJveHkuYwpAQCAtMjYsNiArMjYs
NyBAQAogI2luY2x1ZGUgInV0aWwvZXZlbnRfbm90aWZpZXItcG9zaXguYyIKIAogc3RhdGljIHZv
aWQgcHJvYmVfcGNpX2luZm8oUENJRGV2aWNlICpkZXYsIEVycm9yICoqZXJycCk7CitzdGF0aWMg
dm9pZCBwcm94eV9kZXZpY2VfcmVzZXQoRGV2aWNlU3RhdGUgKmRldik7CiAKIHN0YXRpYyB2b2lk
IHByb3h5X2ludHhfdXBkYXRlKFBDSURldmljZSAqcGNpX2RldikKIHsKQEAgLTIwMiw2ICsyMDMs
OCBAQCBzdGF0aWMgdm9pZCBwY2lfcHJveHlfZGV2X2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmts
YXNzLCB2b2lkICpkYXRhKQogICAgIGstPmNvbmZpZ19yZWFkID0gcGNpX3Byb3h5X3JlYWRfY29u
ZmlnOwogICAgIGstPmNvbmZpZ193cml0ZSA9IHBjaV9wcm94eV93cml0ZV9jb25maWc7CiAKKyAg
ICBkYy0+cmVzZXQgPSBwcm94eV9kZXZpY2VfcmVzZXQ7CisKICAgICBkZXZpY2VfY2xhc3Nfc2V0
X3Byb3BzKGRjLCBwcm94eV9wcm9wZXJ0aWVzKTsKIH0KIApAQCAtMzU4LDMgKzM2MSwxOSBAQCBz
dGF0aWMgdm9pZCBwcm9iZV9wY2lfaW5mbyhQQ0lEZXZpY2UgKmRldiwgRXJyb3IgKiplcnJwKQog
ICAgICAgICB9CiAgICAgfQogfQorCitzdGF0aWMgdm9pZCBwcm94eV9kZXZpY2VfcmVzZXQoRGV2
aWNlU3RhdGUgKmRldikKK3sKKyAgICBQQ0lQcm94eURldiAqcGRldiA9IFBDSV9QUk9YWV9ERVYo
ZGV2KTsKKyAgICBNUFFlbXVNc2cgbXNnID0geyAwIH07CisgICAgRXJyb3IgKmxvY2FsX2VyciA9
IE5VTEw7CisKKyAgICBtc2cuY21kID0gTVBRRU1VX0NNRF9ERVZJQ0VfUkVTRVQ7CisgICAgbXNn
LnNpemUgPSAwOworCisgICAgbXBxZW11X21zZ19zZW5kX2FuZF9hd2FpdF9yZXBseSgmbXNnLCBw
ZGV2LCAmbG9jYWxfZXJyKTsKKyAgICBpZiAobG9jYWxfZXJyKSB7CisgICAgICAgIGVycm9yX3Jl
cG9ydF9lcnIobG9jYWxfZXJyKTsKKyAgICB9CisKK30KLS0gCjIuMjkuMgoK


