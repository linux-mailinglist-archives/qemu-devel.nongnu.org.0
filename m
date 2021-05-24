Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8438E720
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:08:49 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAK8-0005Zc-7s
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llAEK-00039J-TJ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llAEI-0007wV-PJ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621861365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrpIWLzkGWcUYwerLw6c+S6FjPBoS4ixy8WOaOcBcK4=;
 b=Je+zOHmGbXcZGAZGJl1Ou30tBMWSb0U6h14n1ui/9nM6oF6PuM2w1Qa/smyKPe0ruPL+M8
 xSTWds2nmdroWRnrCpQsV+/sTvJvk1QHZOsivt7Ge+R4gxPZyiy1u8YqFySfSnTwokVGYL
 8X/PZnVQ2bV3FCoJrmoDh+O6/cgn92E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-03Wvw-pCNLWBSoxcnfhOfw-1; Mon, 24 May 2021 09:02:41 -0400
X-MC-Unique: 03Wvw-pCNLWBSoxcnfhOfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BEFEA40C1;
 Mon, 24 May 2021 13:02:40 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1B9C10190AA;
 Mon, 24 May 2021 13:02:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 8/8] coroutine-sleep: introduce qemu_co_sleep
Date: Mon, 24 May 2021 14:01:50 +0100
Message-Id: <20210524130150.50998-9-stefanha@redhat.com>
In-Reply-To: <20210524130150.50998-1-stefanha@redhat.com>
References: <20210524130150.50998-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 John G Johnson <john.g.johnson@oracle.com>, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KCkFsbG93IHVzaW5nIFFl
bXVDb1NsZWVwIHRvIHNsZWVwIGZvcmV2ZXIgdW50aWwgd29rZW4gYnkgcWVtdV9jb19zbGVlcF93
YWtlLgpUaGlzIG1ha2VzIHRoZSBsb2dpYyBvZiBxZW11X2NvX3NsZWVwX25zX3dha2VhYmxlIGVh
c3kgdG8gdW5kZXJzdGFuZC4KCkluIHRoZSBmdXR1cmUgd2Ugd2lsbCBpbnRyb2R1Y2UgYW4gQVBJ
IHRoYXQgY2FuIHdvcmsgZXZlbiBpZiB0aGUKc2xlZXAgYW5kIHdha2UgaGFwcGVuIGZyb20gZGlm
ZmVyZW50IHRocmVhZHMuICBGb3Igbm93LCBpbml0aWFsaXppbmcKdy0+dG9fd2FrZSBhZnRlciB0
aW1lcl9tb2QgaXMgZmluZSBiZWNhdXNlIHRoZSB0aW1lciBjYW4gb25seSBmaXJlIGluCnRoZSBz
YW1lIEFpb0NvbnRleHQuCgpSZXZpZXdlZC1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tp
eSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPgpTaWduZWQtb2ZmLWJ5OiBQYW9sbyBCb256aW5p
IDxwYm9uemluaUByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIxMDUxNzEwMDU0OC4yODgwNi03
LXBib256aW5pQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvcWVtdS9jb3JvdXRpbmUuaCAgICB8ICA1ICsr
KysrCiB1dGlsL3FlbXUtY29yb3V0aW5lLXNsZWVwLmMgfCAyNiArKysrKysrKysrKysrKysrKysr
LS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvcWVtdS9jb3JvdXRpbmUuaCBiL2luY2x1ZGUvcWVtdS9j
b3JvdXRpbmUuaAppbmRleCA4MmMwNjcxZjgwLi4yOTJlNjFhZWYwIDEwMDY0NAotLS0gYS9pbmNs
dWRlL3FlbXUvY29yb3V0aW5lLmgKKysrIGIvaW5jbHVkZS9xZW11L2Nvcm91dGluZS5oCkBAIC0z
MDMsNiArMzAzLDExIEBAIHR5cGVkZWYgc3RydWN0IFFlbXVDb1NsZWVwIHsKIHZvaWQgY29yb3V0
aW5lX2ZuIHFlbXVfY29fc2xlZXBfbnNfd2FrZWFibGUoUWVtdUNvU2xlZXAgKncsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFFFTVVDbG9ja1R5cGUgdHlwZSwg
aW50NjRfdCBucyk7CiAKKy8qKgorICogWWllbGQgdGhlIGNvcm91dGluZSB1bnRpbCB0aGUgbmV4
dCBjYWxsIHRvIHFlbXVfY29fc2xlZXBfd2FrZS4KKyAqLwordm9pZCBjb3JvdXRpbmVfZm4gcWVt
dV9jb19zbGVlcChRZW11Q29TbGVlcCAqdyk7CisKIHN0YXRpYyBpbmxpbmUgdm9pZCBjb3JvdXRp
bmVfZm4gcWVtdV9jb19zbGVlcF9ucyhRRU1VQ2xvY2tUeXBlIHR5cGUsIGludDY0X3QgbnMpCiB7
CiAgICAgUWVtdUNvU2xlZXAgdyA9IHsgMCB9OwpkaWZmIC0tZ2l0IGEvdXRpbC9xZW11LWNvcm91
dGluZS1zbGVlcC5jIGIvdXRpbC9xZW11LWNvcm91dGluZS1zbGVlcC5jCmluZGV4IDg5YzNiNzU4
YzUuLjU3MWFiNTIxZmYgMTAwNjQ0Ci0tLSBhL3V0aWwvcWVtdS1jb3JvdXRpbmUtc2xlZXAuYwor
KysgYi91dGlsL3FlbXUtY29yb3V0aW5lLXNsZWVwLmMKQEAgLTQxLDEyICs0MSw5IEBAIHN0YXRp
YyB2b2lkIGNvX3NsZWVwX2NiKHZvaWQgKm9wYXF1ZSkKICAgICBxZW11X2NvX3NsZWVwX3dha2Uo
dyk7CiB9CiAKLXZvaWQgY29yb3V0aW5lX2ZuIHFlbXVfY29fc2xlZXBfbnNfd2FrZWFibGUoUWVt
dUNvU2xlZXAgKncsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFFFTVVDbG9ja1R5cGUgdHlwZSwgaW50NjRfdCBucykKK3ZvaWQgY29yb3V0aW5lX2ZuIHFlbXVf
Y29fc2xlZXAoUWVtdUNvU2xlZXAgKncpCiB7CiAgICAgQ29yb3V0aW5lICpjbyA9IHFlbXVfY29y
b3V0aW5lX3NlbGYoKTsKLSAgICBBaW9Db250ZXh0ICpjdHggPSBxZW11X2dldF9jdXJyZW50X2Fp
b19jb250ZXh0KCk7Ci0gICAgUUVNVVRpbWVyIHRzOwogCiAgICAgY29uc3QgY2hhciAqc2NoZWR1
bGVkID0gcWF0b21pY19jbXB4Y2hnKCZjby0+c2NoZWR1bGVkLCBOVUxMLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBxZW11X2NvX3NsZWVwX25zX19zY2hlZHVs
ZWQpOwpAQCAtNTgsMTEgKzU1LDI2IEBAIHZvaWQgY29yb3V0aW5lX2ZuIHFlbXVfY29fc2xlZXBf
bnNfd2FrZWFibGUoUWVtdUNvU2xlZXAgKncsCiAgICAgfQogCiAgICAgdy0+dG9fd2FrZSA9IGNv
OwotICAgIGFpb190aW1lcl9pbml0KGN0eCwgJnRzLCB0eXBlLCBTQ0FMRV9OUywgY29fc2xlZXBf
Y2IsIHcpLAotICAgIHRpbWVyX21vZCgmdHMsIHFlbXVfY2xvY2tfZ2V0X25zKHR5cGUpICsgbnMp
OwogICAgIHFlbXVfY29yb3V0aW5lX3lpZWxkKCk7Ci0gICAgdGltZXJfZGVsKCZ0cyk7CiAKICAg
ICAvKiB3LT50b193YWtlIGlzIGNsZWFyZWQgYmVmb3JlIHJlc3VtaW5nIHRoaXMgY29yb3V0aW5l
LiAgKi8KICAgICBhc3NlcnQody0+dG9fd2FrZSA9PSBOVUxMKTsKIH0KKwordm9pZCBjb3JvdXRp
bmVfZm4gcWVtdV9jb19zbGVlcF9uc193YWtlYWJsZShRZW11Q29TbGVlcCAqdywKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUUVNVUNsb2NrVHlwZSB0eXBlLCBp
bnQ2NF90IG5zKQoreworICAgIEFpb0NvbnRleHQgKmN0eCA9IHFlbXVfZ2V0X2N1cnJlbnRfYWlv
X2NvbnRleHQoKTsKKyAgICBRRU1VVGltZXIgdHM7CisKKyAgICBhaW9fdGltZXJfaW5pdChjdHgs
ICZ0cywgdHlwZSwgU0NBTEVfTlMsIGNvX3NsZWVwX2NiLCB3KTsKKyAgICB0aW1lcl9tb2QoJnRz
LCBxZW11X2Nsb2NrX2dldF9ucyh0eXBlKSArIG5zKTsKKworICAgIC8qCisgICAgICogVGhlIHRp
bWVyIHdpbGwgZmlyZSBpbiB0aGUgY3VycmVudCBBaU9Db250ZXh0LCBzbyB0aGUgY2FsbGJhY2sK
KyAgICAgKiBtdXN0IGhhcHBlbiBhZnRlciBxZW11X2NvX3NsZWVwIHlpZWxkcyBhbmQgdGhlcmUg
aXMgbm8gcmFjZQorICAgICAqIGJldHdlZW4gdGltZXJfbW9kIGFuZCBxZW11X2NvX3NsZWVwLgor
ICAgICAqLworICAgIHFlbXVfY29fc2xlZXAodyk7CisgICAgdGltZXJfZGVsKCZ0cyk7Cit9Ci0t
IAoyLjMxLjEKCg==


