Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F3C28C013
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 20:53:22 +0200 (CEST)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS2wj-0000Qc-Sm
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 14:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kS2Ze-0004Xu-5e
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 14:29:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kS2Zc-0004Gq-92
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 14:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602527367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DAikgXGsrvX+Gc+t0sKrq+7dNV1umIAADR+DJpDBBbY=;
 b=GIYSLF7l76RZDyb2b8u7/th2jACStzmV2BpRL6M/eUsZGnbv/vVoFkThxrKyeb8g7S4koJ
 cP87RkSehBBARL54XdbHUvdde+n5yJtB5UG5g23/ZkkaPqCyF08uS3U7KpZ/MbJVjaDNzV
 +9gZMNOSSg2TZV8r3Xt566rDY71vY5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-q_n8nMdwMRimG9wSJLjkSg-1; Mon, 12 Oct 2020 14:29:25 -0400
X-MC-Unique: q_n8nMdwMRimG9wSJLjkSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DE8B879517;
 Mon, 12 Oct 2020 18:29:24 +0000 (UTC)
Received: from localhost (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E608D5576C;
 Mon, 12 Oct 2020 18:29:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 21/30] qemu-storage-daemon: avoid compiling blockdev_ss twice
Date: Mon, 12 Oct 2020 19:27:51 +0100
Message-Id: <20201012182800.157697-22-stefanha@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SW50cm9kdWNlIGxpYmJsa2Rldi5mYSB0byBhdm9pZCByZWNvbXBpbGluZyBibG9ja2Rldl9zcyB0
d2ljZS4KClN1Z2dlc3RlZC1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4K
UmV2aWV3ZWQtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KTWVzc2FnZS1pZDog
MjAyMDA5MjkxMjU1MTYuMTg2NzE1LTMtc3RlZmFuaGFAcmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5
OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogbWVzb24uYnVpbGQg
ICAgICAgICAgICAgICAgfCAxMiArKysrKysrKysrLS0KIHN0b3JhZ2UtZGFlbW9uL21lc29uLmJ1
aWxkIHwgIDMgKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAppbmRleCA0ZGRk
ODk5ZmRkLi4yZmIwYmI3Y2I0IDEwMDY0NAotLS0gYS9tZXNvbi5idWlsZAorKysgYi9tZXNvbi5i
dWlsZApAQCAtMTM2Niw3ICsxMzY2LDYgQEAgYmxvY2tkZXZfc3MuYWRkKGZpbGVzKAogYmxvY2tk
ZXZfc3MuYWRkKHdoZW46ICdDT05GSUdfUE9TSVgnLCBpZl90cnVlOiBmaWxlcygnb3MtcG9zaXgu
YycpKQogc29mdG1tdV9zcy5hZGQod2hlbjogJ0NPTkZJR19XSU4zMicsIGlmX3RydWU6IFtmaWxl
cygnb3Mtd2luMzIuYycpXSkKIAotc29mdG1tdV9zcy5hZGRfYWxsKGJsb2NrZGV2X3NzKQogc29m
dG1tdV9zcy5hZGQoZmlsZXMoCiAgICdib290ZGV2aWNlLmMnLAogICAnZG1hLWhlbHBlcnMuYycs
CkBAIC0xNDYyLDYgKzE0NjEsMTUgQEAgYmxvY2sgPSBkZWNsYXJlX2RlcGVuZGVuY3kobGlua193
aG9sZTogW2xpYmJsb2NrXSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpbmtfYXJnczog
J0BibG9jay5zeW1zJywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlcGVuZGVuY2llczog
W2NyeXB0bywgaW9dKQogCitibG9ja2Rldl9zcyA9IGJsb2NrZGV2X3NzLmFwcGx5KGNvbmZpZ19o
b3N0LCBzdHJpY3Q6IGZhbHNlKQorbGliYmxvY2tkZXYgPSBzdGF0aWNfbGlicmFyeSgnYmxvY2tk
ZXYnLCBibG9ja2Rldl9zcy5zb3VyY2VzKCkgKyBnZW5oLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkZXBlbmRlbmNpZXM6IGJsb2NrZGV2X3NzLmRlcGVuZGVuY2llcygpLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBuYW1lX3N1ZmZpeDogJ2ZhJywKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYnVpbGRfYnlfZGVmYXVsdDogZmFsc2UpCisKK2Jsb2NrZGV2ID0gZGVj
bGFyZV9kZXBlbmRlbmN5KGxpbmtfd2hvbGU6IFtsaWJibG9ja2Rldl0sCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkZXBlbmRlbmNpZXM6IFtibG9ja10pCisKIHFtcF9zcyA9IHFtcF9z
cy5hcHBseShjb25maWdfaG9zdCwgc3RyaWN0OiBmYWxzZSkKIGxpYnFtcCA9IHN0YXRpY19saWJy
YXJ5KCdxbXAnLCBxbXBfc3Muc291cmNlcygpICsgZ2VuaCwKICAgICAgICAgICAgICAgICAgICAg
ICAgIGRlcGVuZGVuY2llczogcW1wX3NzLmRlcGVuZGVuY2llcygpLApAQCAtMTQ3OCw3ICsxNDg2
LDcgQEAgZm9yZWFjaCBtIDogYmxvY2tfbW9kcyArIHNvZnRtbXVfbW9kcwogICAgICAgICAgICAg
ICAgIGluc3RhbGxfZGlyOiBjb25maWdfaG9zdFsncWVtdV9tb2RkaXInXSkKIGVuZGZvcmVhY2gK
IAotc29mdG1tdV9zcy5hZGQoYXV0aHosIGJsb2NrLCBjaGFyZGV2LCBjcnlwdG8sIGlvLCBxbXAp
Citzb2Z0bW11X3NzLmFkZChhdXRoeiwgYmxvY2tkZXYsIGNoYXJkZXYsIGNyeXB0bywgaW8sIHFt
cCkKIGNvbW1vbl9zcy5hZGQocW9tLCBxZW11dXRpbCkKIAogY29tbW9uX3NzLmFkZF9hbGwod2hl
bjogJ0NPTkZJR19TT0ZUTU1VJywgaWZfdHJ1ZTogW3NvZnRtbXVfc3NdKQpkaWZmIC0tZ2l0IGEv
c3RvcmFnZS1kYWVtb24vbWVzb24uYnVpbGQgYi9zdG9yYWdlLWRhZW1vbi9tZXNvbi5idWlsZApp
bmRleCAwNDA5YWNjM2Y1Li5jNWFkY2U4MWMzIDEwMDY0NAotLS0gYS9zdG9yYWdlLWRhZW1vbi9t
ZXNvbi5idWlsZAorKysgYi9zdG9yYWdlLWRhZW1vbi9tZXNvbi5idWlsZApAQCAtMSw3ICsxLDYg
QEAKIHFzZF9zcyA9IHNzLnNvdXJjZV9zZXQoKQogcXNkX3NzLmFkZChmaWxlcygncWVtdS1zdG9y
YWdlLWRhZW1vbi5jJykpCi1xc2Rfc3MuYWRkKGJsb2NrLCBjaGFyZGV2LCBxbXAsIHFvbSwgcWVt
dXV0aWwpCi1xc2Rfc3MuYWRkX2FsbChibG9ja2Rldl9zcykKK3FzZF9zcy5hZGQoYmxvY2tkZXYs
IGNoYXJkZXYsIHFtcCwgcW9tLCBxZW11dXRpbCkKIAogc3ViZGlyKCdxYXBpJykKIAotLSAKMi4y
Ni4yCgo=


