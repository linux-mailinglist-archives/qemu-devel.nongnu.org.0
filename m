Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA828C009
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 20:51:41 +0200 (CEST)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS2v6-0005OR-6Z
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 14:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kS2aB-0005NL-01
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 14:30:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kS2a4-0004Jo-GC
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 14:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602527395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0082Lo4MDolrcETSjUoN1/VyBCJMMbq8vm2eo+Y/Rp4=;
 b=M/TqLYQFRhnuLvpAHEmHLmJQRwWwM9WZ5kog9ShgGi7/1bhZcX4E3+3Awlok//5wVOAvF3
 StfG1rV5O+xh9uZRHtMFVDD85OoJjUrUiPwi2JXafss+OUlNgocLlHcdnSWyI96LySnxQG
 IC7L1pWp+VAb6hQ8uQyYA4usmLyG6x8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-u29UpLGIM_SLHJfDyzXMGQ-1; Mon, 12 Oct 2020 14:29:54 -0400
X-MC-Unique: u29UpLGIM_SLHJfDyzXMGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8415A1062721;
 Mon, 12 Oct 2020 18:29:52 +0000 (UTC)
Received: from localhost (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91A0F55760;
 Mon, 12 Oct 2020 18:29:48 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 29/30] block/io: fix bdrv_is_allocated_above
Date: Mon, 12 Oct 2020 19:27:59 +0100
Message-Id: <20201012182800.157697-30-stefanha@redhat.com>
In-Reply-To: <20201012182800.157697-1-stefanha@redhat.com>
References: <20201012182800.157697-1-stefanha@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Alberto Garcia <berto@igalia.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8u
Y29tPgoKYmRydl9pc19hbGxvY2F0ZWRfYWJvdmUgd3JvbmdseSBoYW5kbGVzIHNob3J0IGJhY2tp
bmcgZmlsZXM6IGl0IHJlcG9ydHMKYWZ0ZXItRU9GIHNwYWNlIGFzIFVOQUxMT0NBVEVEIHdoaWNo
IGlzIHdyb25nLCBhcyBvbiByZWFkIHRoZSBkYXRhIGlzCmdlbmVyYXRlZCBvbiB0aGUgbGV2ZWwg
b2Ygc2hvcnQgYmFja2luZyBmaWxlIChpZiBhbGwgb3ZlcmxheXMgaGF2ZQp1bmFsbG9jYXRlZCBh
cmVhcyBhdCB0aGF0IHBsYWNlKS4KClJldXNpbmcgYmRydl9jb21tb25fYmxvY2tfc3RhdHVzX2Fi
b3ZlIGZpeGVzIHRoZSBpc3N1ZSBhbmQgdW5pZmllcyBjb2RlCnBhdGguCgpTaWduZWQtb2ZmLWJ5
OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+
ClJldmlld2VkLWJ5OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6
IEFsYmVydG8gR2FyY2lhIDxiZXJ0b0BpZ2FsaWEuY29tPgpNZXNzYWdlLWlkOiAyMDIwMDkyNDE5
NDAwMy4yMjA4MC01LXZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbQpbRml4IHMvaGFzL2hhdmUvIGFz
IHN1Z2dlc3RlZCBieSBFcmljIEJsYWtlLiBGaXggcy9hcmVhL2FyZWFzLy4KLS1TdGVmYW5dClNp
Z25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBi
bG9jay9pby5jIHwgNDMgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYmxvY2svaW8uYyBiL2Jsb2NrL2lvLmMKaW5kZXggYjYxNmJjNGFkYS4uMDI1Mjhi
MzgyMyAxMDA2NDQKLS0tIGEvYmxvY2svaW8uYworKysgYi9ibG9jay9pby5jCkBAIC0yNDc3LDUy
ICsyNDc3LDE5IEBAIGludCBjb3JvdXRpbmVfZm4gYmRydl9pc19hbGxvY2F0ZWQoQmxvY2tEcml2
ZXJTdGF0ZSAqYnMsIGludDY0X3Qgb2Zmc2V0LAogICogYXQgJ29mZnNldCArICpwbnVtJyBtYXkg
cmV0dXJuIHRoZSBzYW1lIGFsbG9jYXRpb24gc3RhdHVzIChpbiBvdGhlcgogICogd29yZHMsIHRo
ZSByZXN1bHQgaXMgbm90IG5lY2Vzc2FyaWx5IHRoZSBtYXhpbXVtIHBvc3NpYmxlIHJhbmdlKTsK
ICAqIGJ1dCAncG51bScgd2lsbCBvbmx5IGJlIDAgd2hlbiBlbmQgb2YgZmlsZSBpcyByZWFjaGVk
LgotICoKICAqLwogaW50IGJkcnZfaXNfYWxsb2NhdGVkX2Fib3ZlKEJsb2NrRHJpdmVyU3RhdGUg
KnRvcCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCbG9ja0RyaXZlclN0YXRlICpiYXNl
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaW5jbHVkZV9iYXNlLCBpbnQ2NF90
IG9mZnNldCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQ2NF90IGJ5dGVzLCBpbnQ2
NF90ICpwbnVtKQogewotICAgIEJsb2NrRHJpdmVyU3RhdGUgKmludGVybWVkaWF0ZTsKLSAgICBp
bnQgcmV0OwotICAgIGludDY0X3QgbiA9IGJ5dGVzOwotCi0gICAgYXNzZXJ0KGJhc2UgfHwgIWlu
Y2x1ZGVfYmFzZSk7Ci0KLSAgICBpbnRlcm1lZGlhdGUgPSB0b3A7Ci0gICAgd2hpbGUgKGluY2x1
ZGVfYmFzZSB8fCBpbnRlcm1lZGlhdGUgIT0gYmFzZSkgewotICAgICAgICBpbnQ2NF90IHBudW1f
aW50ZXI7Ci0gICAgICAgIGludDY0X3Qgc2l6ZV9pbnRlcjsKLQotICAgICAgICBhc3NlcnQoaW50
ZXJtZWRpYXRlKTsKLSAgICAgICAgcmV0ID0gYmRydl9pc19hbGxvY2F0ZWQoaW50ZXJtZWRpYXRl
LCBvZmZzZXQsIGJ5dGVzLCAmcG51bV9pbnRlcik7Ci0gICAgICAgIGlmIChyZXQgPCAwKSB7Ci0g
ICAgICAgICAgICByZXR1cm4gcmV0OwotICAgICAgICB9Ci0gICAgICAgIGlmIChyZXQpIHsKLSAg
ICAgICAgICAgICpwbnVtID0gcG51bV9pbnRlcjsKLSAgICAgICAgICAgIHJldHVybiAxOwotICAg
ICAgICB9Ci0KLSAgICAgICAgc2l6ZV9pbnRlciA9IGJkcnZfZ2V0bGVuZ3RoKGludGVybWVkaWF0
ZSk7Ci0gICAgICAgIGlmIChzaXplX2ludGVyIDwgMCkgewotICAgICAgICAgICAgcmV0dXJuIHNp
emVfaW50ZXI7Ci0gICAgICAgIH0KLSAgICAgICAgaWYgKG4gPiBwbnVtX2ludGVyICYmCi0gICAg
ICAgICAgICAoaW50ZXJtZWRpYXRlID09IHRvcCB8fCBvZmZzZXQgKyBwbnVtX2ludGVyIDwgc2l6
ZV9pbnRlcikpIHsKLSAgICAgICAgICAgIG4gPSBwbnVtX2ludGVyOwotICAgICAgICB9Ci0KLSAg
ICAgICAgaWYgKGludGVybWVkaWF0ZSA9PSBiYXNlKSB7Ci0gICAgICAgICAgICBicmVhazsKLSAg
ICAgICAgfQotCi0gICAgICAgIGludGVybWVkaWF0ZSA9IGJkcnZfZmlsdGVyX29yX2Nvd19icyhp
bnRlcm1lZGlhdGUpOworICAgIGludCByZXQgPSBiZHJ2X2NvbW1vbl9ibG9ja19zdGF0dXNfYWJv
dmUodG9wLCBiYXNlLCBpbmNsdWRlX2Jhc2UsIGZhbHNlLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgb2Zmc2V0LCBieXRlcywgcG51bSwgTlVMTCwgTlVMTCk7
CisgICAgaWYgKHJldCA8IDApIHsKKyAgICAgICAgcmV0dXJuIHJldDsKICAgICB9CiAKLSAgICAq
cG51bSA9IG47Ci0gICAgcmV0dXJuIDA7CisgICAgcmV0dXJuICEhKHJldCAmIEJEUlZfQkxPQ0tf
QUxMT0NBVEVEKTsKIH0KIAogaW50IGNvcm91dGluZV9mbgotLSAKMi4yNi4yCgo=


