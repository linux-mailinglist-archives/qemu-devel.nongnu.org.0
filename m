Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950413C60E7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:54:08 +0200 (CEST)
Received: from localhost ([::1]:60034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zC3-0006tS-KK
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z8m-0000u9-AU
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:50:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z8k-0002Wy-LS
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626108641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTJ9FEHHEZO1BSZakoJS4sd7+cxGKn5F0u8GqKxrbMk=;
 b=ezvoYwM/C+TiDenABCyONJQL5cnvmMPa3Y5fNw0uAzDjK9FLr/01gGCNbvTIghoGWwUHkL
 vIxVw2mIUY7xjzJRQ52y7vA+mS72bGPJajcCXcnbgx2h4UWLtEVrcrSHfjTDVwofmItlMo
 rBdfylmZzy1UKx1btdkdOnnJcWrBRuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-8Bv8AzHcOkW6N86_xMzsow-1; Mon, 12 Jul 2021 12:50:40 -0400
X-MC-Unique: 8Bv8AzHcOkW6N86_xMzsow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 246628042FE;
 Mon, 12 Jul 2021 16:50:39 +0000 (UTC)
Received: from localhost (ovpn-112-230.ams2.redhat.com [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDC2F5D6BA;
 Mon, 12 Jul 2021 16:50:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] trace/simple: pass iter to st_write_event_mapping
Date: Mon, 12 Jul 2021 17:49:59 +0100
Message-Id: <20210712165001.429113-5-stefanha@redhat.com>
In-Reply-To: <20210712165001.429113-1-stefanha@redhat.com>
References: <20210712165001.429113-1-stefanha@redhat.com>
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
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpQYXNzIGFuIGl0ZXIgdG8g
c3Rfd3JpdGVfZXZlbnRfbWFwcGluZywgc28gdGhlIGZ1bmN0aW9uIGNhbiBpbnRlcmF0ZQpkaWZm
ZXJlbnQgdGhpbmdzIGRlcGVuZGluZyBvbiBob3cgd2UgaW5pdGlhbGl6ZSB0aGUgaXRlci4KClNp
Z25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpSZXZpZXdlZC1i
eTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIx
MDYwMTEzMjQxNC40MzI0MzAtNS1rcmF4ZWxAcmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5OiBTdGVm
YW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogdHJhY2Uvc2ltcGxlLmMgfCAx
MCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3RyYWNlL3NpbXBsZS5jIGIvdHJhY2Uvc2ltcGxlLmMKaW5kZXgg
OTdiNmY4NTE2OC4uZWMyMTU2ZDEzNSAxMDA2NDQKLS0tIGEvdHJhY2Uvc2ltcGxlLmMKKysrIGIv
dHJhY2Uvc2ltcGxlLmMKQEAgLTI4MCwxNCArMjgwLDEyIEBAIHZvaWQgdHJhY2VfcmVjb3JkX2Zp
bmlzaChUcmFjZUJ1ZmZlclJlY29yZCAqcmVjKQogICAgIH0KIH0KIAotc3RhdGljIGludCBzdF93
cml0ZV9ldmVudF9tYXBwaW5nKHZvaWQpCitzdGF0aWMgaW50IHN0X3dyaXRlX2V2ZW50X21hcHBp
bmcoVHJhY2VFdmVudEl0ZXIgKml0ZXIpCiB7CiAgICAgdWludDY0X3QgdHlwZSA9IFRSQUNFX1JF
Q09SRF9UWVBFX01BUFBJTkc7Ci0gICAgVHJhY2VFdmVudEl0ZXIgaXRlcjsKICAgICBUcmFjZUV2
ZW50ICpldjsKIAotICAgIHRyYWNlX2V2ZW50X2l0ZXJfaW5pdF9hbGwoJml0ZXIpOwotICAgIHdo
aWxlICgoZXYgPSB0cmFjZV9ldmVudF9pdGVyX25leHQoJml0ZXIpKSAhPSBOVUxMKSB7CisgICAg
d2hpbGUgKChldiA9IHRyYWNlX2V2ZW50X2l0ZXJfbmV4dChpdGVyKSkgIT0gTlVMTCkgewogICAg
ICAgICB1aW50NjRfdCBpZCA9IHRyYWNlX2V2ZW50X2dldF9pZChldik7CiAgICAgICAgIGNvbnN0
IGNoYXIgKm5hbWUgPSB0cmFjZV9ldmVudF9nZXRfbmFtZShldik7CiAgICAgICAgIHVpbnQzMl90
IGxlbiA9IHN0cmxlbihuYW1lKTsKQEAgLTMwOSw2ICszMDcsNyBAQCBzdGF0aWMgaW50IHN0X3dy
aXRlX2V2ZW50X21hcHBpbmcodm9pZCkKICAqLwogYm9vbCBzdF9zZXRfdHJhY2VfZmlsZV9lbmFi
bGVkKGJvb2wgZW5hYmxlKQogeworICAgIFRyYWNlRXZlbnRJdGVyIGl0ZXI7CiAgICAgYm9vbCB3
YXNfZW5hYmxlZCA9IHRyYWNlX2ZwOwogCiAgICAgaWYgKGVuYWJsZSA9PSAhIXRyYWNlX2ZwKSB7
CkBAIC0zMzMsOCArMzMyLDkgQEAgYm9vbCBzdF9zZXRfdHJhY2VfZmlsZV9lbmFibGVkKGJvb2wg
ZW5hYmxlKQogICAgICAgICAgICAgcmV0dXJuIHdhc19lbmFibGVkOwogICAgICAgICB9CiAKKyAg
ICAgICAgdHJhY2VfZXZlbnRfaXRlcl9pbml0X2FsbCgmaXRlcik7CiAgICAgICAgIGlmIChmd3Jp
dGUoJmhlYWRlciwgc2l6ZW9mIGhlYWRlciwgMSwgdHJhY2VfZnApICE9IDEgfHwKLSAgICAgICAg
ICAgIHN0X3dyaXRlX2V2ZW50X21hcHBpbmcoKSA8IDApIHsKKyAgICAgICAgICAgIHN0X3dyaXRl
X2V2ZW50X21hcHBpbmcoJml0ZXIpIDwgMCkgewogICAgICAgICAgICAgZmNsb3NlKHRyYWNlX2Zw
KTsKICAgICAgICAgICAgIHRyYWNlX2ZwID0gTlVMTDsKICAgICAgICAgICAgIHJldHVybiB3YXNf
ZW5hYmxlZDsKLS0gCjIuMzEuMQoK


