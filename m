Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78FE2A67C6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 16:35:42 +0100 (CET)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaKp3-000272-If
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 10:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kaKbB-0007wy-KR
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:21:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kaKb5-0008Kw-Ky
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604503270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2tnggx0PjpW2FI/fnM212J+0RjWe6HBl7UPP21HCu48=;
 b=MuCMWWPlieMyO11Cf5xC4TdYYQ4VaM8algA0QvIeNKYEhOu3PQQPq0T9GaXYoXVAR7OU/S
 Rekv4dzqSFopLIT4pUdmC2XaUlNW+VgQVKBRvwR7+F1zo12ekfQ3J92hLx9Eh1dkjPxDHM
 hNFIlL47ZGzEKMAOVL8ZrXWgyXTGm5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588--2WqZDsTM-GgKXR0C3XS-g-1; Wed, 04 Nov 2020 10:21:06 -0500
X-MC-Unique: -2WqZDsTM-GgKXR0C3XS-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF218801F9A;
 Wed,  4 Nov 2020 15:21:03 +0000 (UTC)
Received: from localhost (ovpn-115-145.ams2.redhat.com [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 732E060C84;
 Wed,  4 Nov 2020 15:21:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 22/33] block/nvme: Change size and alignment of queue
Date: Wed,  4 Nov 2020 15:18:17 +0000
Message-Id: <20201104151828.405824-23-stefanha@redhat.com>
In-Reply-To: <20201104151828.405824-1-stefanha@redhat.com>
References: <20201104151828.405824-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRXJpYyBBdWdlciA8ZXJpYy5hdWdlckByZWRoYXQuY29tPgoKSW4gcHJlcGFyYXRpb24g
b2YgNjRrQiBob3N0IHBhZ2Ugc3VwcG9ydCwgbGV0J3MgY2hhbmdlIHRoZSBzaXplCmFuZCBhbGln
bm1lbnQgb2YgdGhlIHF1ZXVlIHNvIHRoYXQgdGhlIFZGSU8gRE1BIE1BUCBzdWNjZWVkcy4KV2Ug
YWxpZ24gb24gdGhlIGhvc3QgcGFnZSBzaXplLgoKU2lnbmVkLW9mZi1ieTogRXJpYyBBdWdlciA8
ZXJpYy5hdWdlckByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPgpUZXN0ZWQtYnk6IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0
LmNvbT4KU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRo
YXQuY29tPgpNZXNzYWdlLWlkOiAyMDIwMTAyOTA5MzMwNi4xMDYzODc5LTIxLXBoaWxtZEByZWRo
YXQuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNv
bT4KVGVzdGVkLWJ5OiBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+Ci0tLQogYmxv
Y2svbnZtZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jsb2NrL252bWUuYyBiL2Jsb2NrL252bWUuYwppbmRl
eCA3NjI4NjIzYzA1Li40YTg1ODlkMmQyIDEwMDY0NAotLS0gYS9ibG9jay9udm1lLmMKKysrIGIv
YmxvY2svbnZtZS5jCkBAIC0xNjcsOSArMTY3LDkgQEAgc3RhdGljIGJvb2wgbnZtZV9pbml0X3F1
ZXVlKEJEUlZOVk1lU3RhdGUgKnMsIE5WTWVRdWV1ZSAqcSwKICAgICBzaXplX3QgYnl0ZXM7CiAg
ICAgaW50IHI7CiAKLSAgICBieXRlcyA9IFJPVU5EX1VQKG5lbnRyaWVzICogZW50cnlfYnl0ZXMs
IHMtPnBhZ2Vfc2l6ZSk7CisgICAgYnl0ZXMgPSBST1VORF9VUChuZW50cmllcyAqIGVudHJ5X2J5
dGVzLCBxZW11X3JlYWxfaG9zdF9wYWdlX3NpemUpOwogICAgIHEtPmhlYWQgPSBxLT50YWlsID0g
MDsKLSAgICBxLT5xdWV1ZSA9IHFlbXVfdHJ5X21lbWFsaWduKHMtPnBhZ2Vfc2l6ZSwgYnl0ZXMp
OworICAgIHEtPnF1ZXVlID0gcWVtdV90cnlfbWVtYWxpZ24ocWVtdV9yZWFsX2hvc3RfcGFnZV9z
aXplLCBieXRlcyk7CiAgICAgaWYgKCFxLT5xdWV1ZSkgewogICAgICAgICBlcnJvcl9zZXRnKGVy
cnAsICJDYW5ub3QgYWxsb2NhdGUgcXVldWUiKTsKICAgICAgICAgcmV0dXJuIGZhbHNlOwotLSAK
Mi4yOC4wCgo=


