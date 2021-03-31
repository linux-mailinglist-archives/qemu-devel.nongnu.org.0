Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299B34FD8C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:57:29 +0200 (CEST)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXbM-0004X2-3F
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXVo-0008Qd-3R
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXVl-0001Jf-QF
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617184301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJZOOwzx6xVn2ZqNoqqfvd5WL9r43uckU8MubkJTNy8=;
 b=T5Ycye9O4vnBwryu+v50nR86Me/M3hx18QfheITC79PFhN81UB4aJAYjPwcTKm4EtkaMx5
 epelRKFT2C3ozNyjPcUcZ2YoOt/Hip8FnH3HwoiSZIjVlny9ZlpiLy9HHpcQ9GGAhvJ9eH
 KdbnE4AG3xWFQL9C1JFyszwY/uDyEvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-ZhYSU6USOx2cdo1lA5BVow-1; Wed, 31 Mar 2021 05:51:38 -0400
X-MC-Unique: ZhYSU6USOx2cdo1lA5BVow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59D4B8030B5;
 Wed, 31 Mar 2021 09:51:37 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1750C6F991;
 Wed, 31 Mar 2021 09:51:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 5/6] test-coroutine: Add rwlock upgrade test
Date: Wed, 31 Mar 2021 10:50:58 +0100
Message-Id: <20210331095059.303996-6-stefanha@redhat.com>
In-Reply-To: <20210331095059.303996-1-stefanha@redhat.com>
References: <20210331095059.303996-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KClRlc3QgdGhhdCByd2xv
Y2sgdXBncmFkZSBpcyBmYWlyLCBhbmQgdGhhdCByZWFkZXJzIGdvIGJhY2sgdG8gc2xlZXAgaWYK
YSB3cml0ZXIgaXMgaW4gbGluZS4KClNpZ25lZC1vZmYtYnk6IFBhb2xvIEJvbnppbmkgPHBib256
aW5pQHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjEwMzI1MTEyOTQxLjM2NTIzOC02LXBib256
aW5pQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUBy
ZWRoYXQuY29tPgotLS0KIHRlc3RzL3VuaXQvdGVzdC1jb3JvdXRpbmUuYyB8IDYyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdW5pdC90ZXN0LWNvcm91dGluZS5jIGIvdGVzdHMv
dW5pdC90ZXN0LWNvcm91dGluZS5jCmluZGV4IGU5NDZkOTNhNjUuLjZlNmY1MWQ0ODAgMTAwNjQ0
Ci0tLSBhL3Rlc3RzL3VuaXQvdGVzdC1jb3JvdXRpbmUuYworKysgYi90ZXN0cy91bml0L3Rlc3Qt
Y29yb3V0aW5lLmMKQEAgLTI2NCw2ICsyNjQsNjcgQEAgc3RhdGljIHZvaWQgdGVzdF9jb19tdXRl
eF9sb2NrYWJsZSh2b2lkKQogICAgIGdfYXNzZXJ0KFFFTVVfTUFLRV9MT0NLQUJMRShudWxsX3Bv
aW50ZXIpID09IE5VTEwpOwogfQogCitzdGF0aWMgQ29Sd2xvY2sgcndsb2NrOworCisvKiBUZXN0
IHRoYXQgcmVhZGVycyBhcmUgcHJvcGVybHkgc2VudCBiYWNrIHRvIHRoZSBxdWV1ZSB3aGVuIHVw
Z3JhZGluZywKKyAqIGV2ZW4gaWYgdGhleSBhcmUgdGhlIHNvbGUgcmVhZGVycy4gIFRoZSB0ZXN0
IHNjZW5hcmlvIGlzIGFzIGZvbGxvd3M6CisgKgorICoKKyAqIHwgYzEgICAgICAgICAgIHwgYzIg
ICAgICAgICB8CisgKiB8LS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKworICogfCByZGxvY2sg
ICAgICAgfCAgICAgICAgICAgIHwKKyAqIHwgeWllbGQgICAgICAgIHwgICAgICAgICAgICB8Cisg
KiB8ICAgICAgICAgICAgICB8IHdybG9jayAgICAgfAorICogfCAgICAgICAgICAgICAgfCA8cXVl
dWVkPiAgIHwKKyAqIHwgdXBncmFkZSAgICAgIHwgICAgICAgICAgICB8CisgKiB8IDxxdWV1ZWQ+
ICAgICB8IDxkZXF1ZXVlZD4gfAorICogfCAgICAgICAgICAgICAgfCB1bmxvY2sgICAgIHwKKyAq
IHwgPGRlcXVldWVkPiAgIHwgICAgICAgICAgICB8CisgKiB8IHVubG9jayAgICAgICB8ICAgICAg
ICAgICAgfAorICovCisKK3N0YXRpYyB2b2lkIGNvcm91dGluZV9mbiByd2xvY2tfeWllbGRfdXBn
cmFkZSh2b2lkICpvcGFxdWUpCit7CisgICAgcWVtdV9jb19yd2xvY2tfcmRsb2NrKCZyd2xvY2sp
OworICAgIHFlbXVfY29yb3V0aW5lX3lpZWxkKCk7CisKKyAgICBxZW11X2NvX3J3bG9ja191cGdy
YWRlKCZyd2xvY2spOworICAgIHFlbXVfY29fcndsb2NrX3VubG9jaygmcndsb2NrKTsKKworICAg
ICooYm9vbCAqKW9wYXF1ZSA9IHRydWU7Cit9CisKK3N0YXRpYyB2b2lkIGNvcm91dGluZV9mbiBy
d2xvY2tfd3Jsb2NrX3lpZWxkKHZvaWQgKm9wYXF1ZSkKK3sKKyAgICBxZW11X2NvX3J3bG9ja193
cmxvY2soJnJ3bG9jayk7CisgICAgcWVtdV9jb3JvdXRpbmVfeWllbGQoKTsKKworICAgIHFlbXVf
Y29fcndsb2NrX3VubG9jaygmcndsb2NrKTsKKyAgICAqKGJvb2wgKilvcGFxdWUgPSB0cnVlOwor
fQorCitzdGF0aWMgdm9pZCB0ZXN0X2NvX3J3bG9ja191cGdyYWRlKHZvaWQpCit7CisgICAgYm9v
bCBjMV9kb25lID0gZmFsc2U7CisgICAgYm9vbCBjMl9kb25lID0gZmFsc2U7CisgICAgQ29yb3V0
aW5lICpjMSwgKmMyOworCisgICAgcWVtdV9jb19yd2xvY2tfaW5pdCgmcndsb2NrKTsKKyAgICBj
MSA9IHFlbXVfY29yb3V0aW5lX2NyZWF0ZShyd2xvY2tfeWllbGRfdXBncmFkZSwgJmMxX2RvbmUp
OworICAgIGMyID0gcWVtdV9jb3JvdXRpbmVfY3JlYXRlKHJ3bG9ja193cmxvY2tfeWllbGQsICZj
Ml9kb25lKTsKKworICAgIHFlbXVfY29yb3V0aW5lX2VudGVyKGMxKTsKKyAgICBxZW11X2Nvcm91
dGluZV9lbnRlcihjMik7CisKKyAgICAvKiBjMSBub3cgc2hvdWxkIGdvIHRvIHNsZWVwLiAgKi8K
KyAgICBxZW11X2Nvcm91dGluZV9lbnRlcihjMSk7CisgICAgZ19hc3NlcnQoIWMxX2RvbmUpOwor
CisgICAgcWVtdV9jb3JvdXRpbmVfZW50ZXIoYzIpOworICAgIGdfYXNzZXJ0KGMxX2RvbmUpOwor
ICAgIGdfYXNzZXJ0KGMyX2RvbmUpOworfQorCiAvKgogICogQ2hlY2sgdGhhdCBjcmVhdGlvbiwg
ZW50ZXIsIGFuZCByZXR1cm4gd29yawogICovCkBAIC01MDEsNiArNTYyLDcgQEAgaW50IG1haW4o
aW50IGFyZ2MsIGNoYXIgKiphcmd2KQogICAgIGdfdGVzdF9hZGRfZnVuYygiL2Jhc2ljL29yZGVy
IiwgdGVzdF9vcmRlcik7CiAgICAgZ190ZXN0X2FkZF9mdW5jKCIvbG9ja2luZy9jby1tdXRleCIs
IHRlc3RfY29fbXV0ZXgpOwogICAgIGdfdGVzdF9hZGRfZnVuYygiL2xvY2tpbmcvY28tbXV0ZXgv
bG9ja2FibGUiLCB0ZXN0X2NvX211dGV4X2xvY2thYmxlKTsKKyAgICBnX3Rlc3RfYWRkX2Z1bmMo
Ii9sb2NraW5nL2NvLXJ3bG9jay91cGdyYWRlIiwgdGVzdF9jb19yd2xvY2tfdXBncmFkZSk7CiAg
ICAgaWYgKGdfdGVzdF9wZXJmKCkpIHsKICAgICAgICAgZ190ZXN0X2FkZF9mdW5jKCIvcGVyZi9s
aWZlY3ljbGUiLCBwZXJmX2xpZmVjeWNsZSk7CiAgICAgICAgIGdfdGVzdF9hZGRfZnVuYygiL3Bl
cmYvbmVzdGluZyIsIHBlcmZfbmVzdGluZyk7Ci0tIAoyLjMwLjIKCg==


