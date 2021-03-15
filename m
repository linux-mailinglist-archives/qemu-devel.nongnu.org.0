Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6BA33AF4F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:55:06 +0100 (CET)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjwH-0000oC-Lf
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLjss-0006ys-LN
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:51:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLjsp-0004Su-5w
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615801889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zP3dU1xxMEbAz9ZYaMapUsSY7hsI4dujiBQ2vAxbPXE=;
 b=A0dslsuY7+VqXssi38GybTTrKheWqSsa5cZVDt7zdWxRogarRRe3FWY/Qn5qFXhBPL01Tb
 Zs9Y+ZkmcHsfLUYPrqqDGRIYP9A6hWX1Tzc+K41pLxTGmw7sSvU6lpRj606vj7wfSYdhph
 4aNBwc3zYuSaUcSm3xUMkG777bAXyEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-uL8WmxOfPSG9h3NYXsi4eA-1; Mon, 15 Mar 2021 05:51:27 -0400
X-MC-Unique: uL8WmxOfPSG9h3NYXsi4eA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5555E8030DD;
 Mon, 15 Mar 2021 09:51:26 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25D432CFDB;
 Mon, 15 Mar 2021 09:51:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/1] virtio-blk: Respect discard granularity
Date: Mon, 15 Mar 2021 09:51:10 +0000
Message-Id: <20210315095110.110003-2-stefanha@redhat.com>
In-Reply-To: <20210315095110.110003-1-stefanha@redhat.com>
References: <20210315095110.110003-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBnbWFpbC5jb20+CgpSZXBvcnQgdGhl
IGNvbmZpZ3VyZWQgZ3JhbnVsYXJpdHkgZm9yIGRpc2NhcmQgb3BlcmF0aW9uIHRvIHRoZQpndWVz
dC4gSWYgdGhpcyBpcyBub3Qgc2V0IHVzZSB0aGUgYmxvY2sgc2l6ZS4KClNpbmNlIHVudGlsIG5v
dyB3ZSBoYXZlIGlnbm9yZWQgdGhlIGNvbmZpZ3VyZWQgZGlzY2FyZCBncmFudWxhcml0eQphbmQg
YWx3YXlzIHJlcG9ydGVkIHRoZSBibG9jayBzaXplLCBsZXQncyBhZGQKJ3JlcG9ydC1kaXNjYXJk
LWdyYW51bGFyaXR5JyBwcm9wZXJ0eSBhbmQgZGlzYWJsZSBpdCBmb3Igb2xkZXIKbWFjaGluZSB0
eXBlcyB0byBhdm9pZCBtaWdyYXRpb24gaXNzdWVzLgoKU2lnbmVkLW9mZi1ieTogQWtpaGlrbyBP
ZGFraSA8YWtpaGlrby5vZGFraUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW5vIEdhcnph
cmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6
aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KTWVzc2FnZS1JZDogPDIwMjEwMjI1MDAxMjM5LjQ3MDQ2
LTEtYWtpaGlrby5vZGFraUBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS9ody92aXJ0aW8vdmlydGlv
LWJsay5oIHwgMSArCiBody9ibG9jay92aXJ0aW8tYmxrLmMgICAgICAgICAgfCA4ICsrKysrKyst
CiBody9jb3JlL21hY2hpbmUuYyAgICAgICAgICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92
aXJ0aW8vdmlydGlvLWJsay5oIGIvaW5jbHVkZS9ody92aXJ0aW8vdmlydGlvLWJsay5oCmluZGV4
IDIxNGFiNzQ4MjIuLjI5NjU1YTQwNmQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvdmlydGlvL3Zp
cnRpby1ibGsuaAorKysgYi9pbmNsdWRlL2h3L3ZpcnRpby92aXJ0aW8tYmxrLmgKQEAgLTQxLDYg
KzQxLDcgQEAgc3RydWN0IFZpcnRJT0Jsa0NvbmYKICAgICB1aW50MTZfdCBudW1fcXVldWVzOwog
ICAgIHVpbnQxNl90IHF1ZXVlX3NpemU7CiAgICAgYm9vbCBzZWdfbWF4X2FkanVzdDsKKyAgICBi
b29sIHJlcG9ydF9kaXNjYXJkX2dyYW51bGFyaXR5OwogICAgIHVpbnQzMl90IG1heF9kaXNjYXJk
X3NlY3RvcnM7CiAgICAgdWludDMyX3QgbWF4X3dyaXRlX3plcm9lc19zZWN0b3JzOwogICAgIGJv
b2wgeF9lbmFibGVfd2NlX2lmX2NvbmZpZ193Y2U7CmRpZmYgLS1naXQgYS9ody9ibG9jay92aXJ0
aW8tYmxrLmMgYi9ody9ibG9jay92aXJ0aW8tYmxrLmMKaW5kZXggM2QyMDcyY2Y3NS4uZDI4OTc5
ZWZiOCAxMDA2NDQKLS0tIGEvaHcvYmxvY2svdmlydGlvLWJsay5jCisrKyBiL2h3L2Jsb2NrL3Zp
cnRpby1ibGsuYwpAQCAtOTYyLDEwICs5NjIsMTQgQEAgc3RhdGljIHZvaWQgdmlydGlvX2Jsa191
cGRhdGVfY29uZmlnKFZpcnRJT0RldmljZSAqdmRldiwgdWludDhfdCAqY29uZmlnKQogICAgIGJs
a2NmZy53Y2UgPSBibGtfZW5hYmxlX3dyaXRlX2NhY2hlKHMtPmJsayk7CiAgICAgdmlydGlvX3N0
d19wKHZkZXYsICZibGtjZmcubnVtX3F1ZXVlcywgcy0+Y29uZi5udW1fcXVldWVzKTsKICAgICBp
ZiAodmlydGlvX2hhc19mZWF0dXJlKHMtPmhvc3RfZmVhdHVyZXMsIFZJUlRJT19CTEtfRl9ESVND
QVJEKSkgeworICAgICAgICB1aW50MzJfdCBkaXNjYXJkX2dyYW51bGFyaXR5ID0gY29uZi0+ZGlz
Y2FyZF9ncmFudWxhcml0eTsKKyAgICAgICAgaWYgKGRpc2NhcmRfZ3JhbnVsYXJpdHkgPT0gLTEg
fHwgIXMtPmNvbmYucmVwb3J0X2Rpc2NhcmRfZ3JhbnVsYXJpdHkpIHsKKyAgICAgICAgICAgIGRp
c2NhcmRfZ3JhbnVsYXJpdHkgPSBibGtfc2l6ZTsKKyAgICAgICAgfQogICAgICAgICB2aXJ0aW9f
c3RsX3AodmRldiwgJmJsa2NmZy5tYXhfZGlzY2FyZF9zZWN0b3JzLAogICAgICAgICAgICAgICAg
ICAgICAgcy0+Y29uZi5tYXhfZGlzY2FyZF9zZWN0b3JzKTsKICAgICAgICAgdmlydGlvX3N0bF9w
KHZkZXYsICZibGtjZmcuZGlzY2FyZF9zZWN0b3JfYWxpZ25tZW50LAotICAgICAgICAgICAgICAg
ICAgICAgYmxrX3NpemUgPj4gQkRSVl9TRUNUT1JfQklUUyk7CisgICAgICAgICAgICAgICAgICAg
ICBkaXNjYXJkX2dyYW51bGFyaXR5ID4+IEJEUlZfU0VDVE9SX0JJVFMpOwogICAgICAgICAvKgog
ICAgICAgICAgKiBXZSBzdXBwb3J0IG9ubHkgb25lIHNlZ21lbnQgcGVyIHJlcXVlc3Qgc2luY2Ug
bXVsdGlwbGUgc2VnbWVudHMKICAgICAgICAgICogYXJlIG5vdCB3aWRlbHkgdXNlZCBhbmQgdGhl
cmUgYXJlIG5vIHVzZXJzcGFjZSBBUElzIHRoYXQgYWxsb3cKQEAgLTEyOTksNiArMTMwMyw4IEBA
IHN0YXRpYyBQcm9wZXJ0eSB2aXJ0aW9fYmxrX3Byb3BlcnRpZXNbXSA9IHsKICAgICAgICAgICAg
ICAgICAgICAgIElPVGhyZWFkICopLAogICAgIERFRklORV9QUk9QX0JJVDY0KCJkaXNjYXJkIiwg
VmlydElPQmxvY2ssIGhvc3RfZmVhdHVyZXMsCiAgICAgICAgICAgICAgICAgICAgICAgVklSVElP
X0JMS19GX0RJU0NBUkQsIHRydWUpLAorICAgIERFRklORV9QUk9QX0JPT0woInJlcG9ydC1kaXNj
YXJkLWdyYW51bGFyaXR5IiwgVmlydElPQmxvY2ssCisgICAgICAgICAgICAgICAgICAgICBjb25m
LnJlcG9ydF9kaXNjYXJkX2dyYW51bGFyaXR5LCB0cnVlKSwKICAgICBERUZJTkVfUFJPUF9CSVQ2
NCgid3JpdGUtemVyb2VzIiwgVmlydElPQmxvY2ssIGhvc3RfZmVhdHVyZXMsCiAgICAgICAgICAg
ICAgICAgICAgICAgVklSVElPX0JMS19GX1dSSVRFX1pFUk9FUywgdHJ1ZSksCiAgICAgREVGSU5F
X1BST1BfVUlOVDMyKCJtYXgtZGlzY2FyZC1zZWN0b3JzIiwgVmlydElPQmxvY2ssCmRpZmYgLS1n
aXQgYS9ody9jb3JlL21hY2hpbmUuYyBiL2h3L2NvcmUvbWFjaGluZS5jCmluZGV4IDQzODZmNTdi
NWMuLjRjMWE0YTRjMzIgMTAwNjQ0Ci0tLSBhL2h3L2NvcmUvbWFjaGluZS5jCisrKyBiL2h3L2Nv
cmUvbWFjaGluZS5jCkBAIC0zOSw2ICszOSw3IEBACiBHbG9iYWxQcm9wZXJ0eSBod19jb21wYXRf
NV8yW10gPSB7CiAgICAgeyAiSUNIOS1MUEMiLCAic21tLWNvbXBhdCIsICJvbiJ9LAogICAgIHsg
IlBJSVg0X1BNIiwgInNtbS1jb21wYXQiLCAib24ifSwKKyAgICB7ICJ2aXJ0aW8tYmxrLWRldmlj
ZSIsICJyZXBvcnQtZGlzY2FyZC1ncmFudWxhcml0eSIsICJvZmYiIH0sCiB9OwogY29uc3Qgc2l6
ZV90IGh3X2NvbXBhdF81XzJfbGVuID0gR19OX0VMRU1FTlRTKGh3X2NvbXBhdF81XzIpOwogCi0t
IAoyLjI5LjIKCg==


