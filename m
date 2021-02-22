Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCFB32156F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:52:56 +0100 (CET)
Received: from localhost ([::1]:43102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE9ln-0004HU-Th
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lE9ii-0002rQ-4K
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:49:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lE9ig-0005tC-Ix
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613994581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tYTo3cly4fpzaMCYqtpm/UrbCHSc2K+BwtgMtLr7EsU=;
 b=KDGuydF+Uec9w2mnC4jFwDN3TsXlkK9qceljQX1CH+MHG7Cxn3BTmxRYrozHNL0hwdSrV0
 iqgmUSw2or2sOAVy9wPWrf+2yrONcMbPiiL20rQK943Jcijnq0dsgg/NMiKOu7e2eK/gQl
 vCcDNpnJgr8fILh6M6vpfUqwt23eOVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-ex7tngm-OZy5WO1lKfWrPw-1; Mon, 22 Feb 2021 06:49:40 -0500
X-MC-Unique: ex7tngm-OZy5WO1lKfWrPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37CFC1E561
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 11:49:39 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0156D5D9CC;
 Mon, 22 Feb 2021 11:49:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost: simplify vhost_dev_init() fail_busyloop label
Date: Mon, 22 Feb 2021 11:49:31 +0000
Message-Id: <20210222114931.272308-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmVxdWlyaW5nIGEgY29uZGl0aW9uYWwgZm9yIGV2ZXJ5IGdvdG8gaXMgdGVkaW91czoKCiAgaWYg
KGJ1c3lsb29wX3RpbWVvdXQpIHsKICAgICAgZ290byBmYWlsX2J1c3lsb29wOwogIH0gZWxzZSB7
CiAgICAgIGdvdG8gZmFpbDsKICB9CgpNb3ZlIHRoZSBjb25kaXRpb25hbCB0byBpbnRvIHRoZSBm
YWlsX2J1c3lsb29wIGxhYmVsIHNvIHRoYXQgaXQncyBzYWZlCnRvIGp1bXAgdG8gdGhpcyBsYWJl
bCB1bmNvbmRpdGlvbmFsbHkuCgpUaGlzIGNoYW5nZSBtYWtlcyB0aGUgbWlncmF0ZV9hZGRfYmxv
Y2tlcigpIGVycm9yIGNhc2UgbW9yZSBjb25zaXN0ZW50LgpJdCBqdW1wZWQgdG8gZmFpbF9idXN5
bG9vcCB1bmNvbmRpdGlvbmFsbHkgd2hlcmVhcyB0aGUgbWVtc2xvdHMgbGltaXRzCmVycm9yIGNh
c2Ugd2FzIGNvbmRpdGlvbmFsLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPgotLS0KIGh3L3ZpcnRpby92aG9zdC5jIHwgMTIgKysrKystLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2h3L3ZpcnRpby92aG9zdC5jIGIvaHcvdmlydGlvL3Zob3N0LmMKaW5kZXggNmUxN2Q2
MzFmNy4uMmEwMTY2MmIwOCAxMDA2NDQKLS0tIGEvaHcvdmlydGlvL3Zob3N0LmMKKysrIGIvaHcv
dmlydGlvL3Zob3N0LmMKQEAgLTEzODgsMTggKzEzODgsMTYgQEAgaW50IHZob3N0X2Rldl9pbml0
KHN0cnVjdCB2aG9zdF9kZXYgKmhkZXYsIHZvaWQgKm9wYXF1ZSwKICAgICAgICAgZXJyb3JfcmVw
b3J0KCJ2aG9zdCBiYWNrZW5kIG1lbW9yeSBzbG90cyBsaW1pdCBpcyBsZXNzIgogICAgICAgICAg
ICAgICAgICIgdGhhbiBjdXJyZW50IG51bWJlciBvZiBwcmVzZW50IG1lbW9yeSBzbG90cyIpOwog
ICAgICAgICByID0gLTE7Ci0gICAgICAgIGlmIChidXN5bG9vcF90aW1lb3V0KSB7Ci0gICAgICAg
ICAgICBnb3RvIGZhaWxfYnVzeWxvb3A7Ci0gICAgICAgIH0gZWxzZSB7Ci0gICAgICAgICAgICBn
b3RvIGZhaWw7Ci0gICAgICAgIH0KKyAgICAgICAgZ290byBmYWlsX2J1c3lsb29wOwogICAgIH0K
IAogICAgIHJldHVybiAwOwogCiBmYWlsX2J1c3lsb29wOgotICAgIHdoaWxlICgtLWkgPj0gMCkg
ewotICAgICAgICB2aG9zdF92aXJ0cXVldWVfc2V0X2J1c3lsb29wX3RpbWVvdXQoaGRldiwgaGRl
di0+dnFfaW5kZXggKyBpLCAwKTsKKyAgICBpZiAoYnVzeWxvb3BfdGltZW91dCkgeworICAgICAg
ICB3aGlsZSAoLS1pID49IDApIHsKKyAgICAgICAgICAgIHZob3N0X3ZpcnRxdWV1ZV9zZXRfYnVz
eWxvb3BfdGltZW91dChoZGV2LCBoZGV2LT52cV9pbmRleCArIGksIDApOworICAgICAgICB9CiAg
ICAgfQogZmFpbDoKICAgICBoZGV2LT5udnFzID0gbl9pbml0aWFsaXplZF92cXM7Ci0tIAoyLjI5
LjIKCg==


