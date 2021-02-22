Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE71A321CCC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:24:00 +0100 (CET)
Received: from localhost ([::1]:51902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEE07-0005iS-IY
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEDnf-0002WQ-Dt
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:11:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEDnZ-0002Ar-Jx
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614010260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kyQVeW3SZHIzuncjSdxabt1zPE9DI3StzCwmRR6zQFY=;
 b=cKjKUBNVwGvogTk+zw0ubVSwJKT834Nr92KwfZHyj1daJQdPhRAPcoxPxkZ7qonH11b5qe
 7FrgjvKOWQIbBHVqU2QLb7Zgy8pOPmdqDUf0KjCU6ybySfmtZXC3q/+b950DzyOD2ZyoBo
 qAM8P54UW59W/+bC3vHS+GZyq8vh8WA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-_MSk7sTrM_qxQr99mPbwsA-1; Mon, 22 Feb 2021 11:10:59 -0500
X-MC-Unique: _MSk7sTrM_qxQr99mPbwsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AAC0196633C
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 16:10:57 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3D2A60CEA;
 Mon, 22 Feb 2021 16:10:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] vhost-user: warn when guest RAM is not shared
Date: Mon, 22 Feb 2021 16:10:14 +0000
Message-Id: <20210222161017.570837-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dmhvc3QtdXNlciByZXF1aXJlcyAtb2JqZWN0IG1lbW9yeS1iYWNrZW5kLSosc2hhcmU9b24gb3B0
aW9uIHNvIHRoYXQgUUVNVSB1c2VzDQptbWFwKE1BUF9TSEFSRUQpIG9uIGd1ZXN0IFJBTSB0aGF0
IGlzIHNoYXJlZCB3aXRoIHRoZSB2aG9zdC11c2VyIGRldmljZSBiYWNrZW5kDQpwcm9jZXNzLiBU
aGlzIGlzIG5lZWRlZCBzbyB0aGUgUUVNVSBwcm9jZXNzIHNlZXMgY2hhbmdlcyBtYWRlIGJ5IHRo
ZSB2aG9zdC11c2VyDQpkZXZpY2UgYmFja2VuZCBwcm9jZXNzLCBhbmQgdmljZSB2ZXJzYS4NCg0K
VG9kYXkgUUVNVSBhbmQgdGhlIHZob3N0LXVzZXIgZGV2aWNlIHByb2Nlc3Mgd2lsbCBzdGFydCB1
cCBhbmQgdGhlbiBmYWlsIHdpdGggYQ0KY29uZnVzaW5nIGVycm9yIG1lc3NhZ2UgaWYgdGhlIHVz
ZXIgZm9yZ290IHRvIHNwZWNpZnkgc2hhcmU9b24uDQoNClRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMg
YSB3YXJuaW5nIGxldHRpbmcgdGhlIHVzZXIga25vdyB0aGF0IHNoYXJlPW9uIGlzDQpyZXF1aXJl
ZC4NCg0KU3RlZmFuIEhham5vY3ppICgzKToNCiAgdGVzdHMvcXRlc3Qvdmhvc3QtdXNlci10ZXN0
OiB1c2Ugc2hhcmU9b24gd2l0aCBtZW1mZA0KICBtZW1vcnk6IGFkZCBtZW1vcnlfcmVnaW9uX2lz
X21hcHBlZF9zaGFyZWQoKQ0KICB2aG9zdC11c2VyOiB3YXJuIHdoZW4gZ3Vlc3QgUkFNIGlzIG5v
dCBzaGFyZWQNCg0KIGluY2x1ZGUvZXhlYy9tZW1vcnkuaCAgICAgICAgIHwgMTEgKysrKysrKysr
KysNCiBody92aXJ0aW8vdmhvc3QtdXNlci5jICAgICAgICB8IDIwICsrKysrKysrKysrKysrKyst
LS0tDQogc29mdG1tdS9tZW1vcnkuYyAgICAgICAgICAgICAgfCAgNiArKysrKysNCiB0ZXN0cy9x
dGVzdC92aG9zdC11c2VyLXRlc3QuYyB8ICAyICstDQogNCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KDQotLSANCjIuMjkuMg0KDQo=


