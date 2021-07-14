Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9403C81A2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:32:35 +0200 (CEST)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bFq-0002ox-JM
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3bDQ-0001OE-AQ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:30:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3bDO-0008Ee-Tm
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626255001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YxgQp8KyBJuU6NKznzUPScm4dge+Is8AXPNosiW8/R8=;
 b=aZ8Km9pjERJY6lhNIqbkY+QQEqzgxpqZCPzpgdoYwhKUvUO1kG+pikkzCgx44ICZOxtMFl
 gqj7DFyXlecH8pqQ5VLShqfAbsXOQnefjpCnUH3Bx/ZxrMQdmPDDESMheL2oOJ/eOz56/r
 uQmewIVmD3ioxa3qMLf7iy0WkcSCpQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-hk3soAXgNNGD22SYaMnPOQ-1; Wed, 14 Jul 2021 05:30:00 -0400
X-MC-Unique: hk3soAXgNNGD22SYaMnPOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C74A804144
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 09:29:59 +0000 (UTC)
Received: from localhost (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A19A1000324;
 Wed, 14 Jul 2021 09:29:47 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] vhost-user: warn when guest RAM is not shared
Date: Wed, 14 Jul 2021 10:29:43 +0100
Message-Id: <20210714092946.569516-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, kwolf@redhat.com,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djM6DQogKiBSZWJhc2VkDQp2MjoNCiAqIENsYXJpZnkgdGhhdCBvYmplY3QtbWVtb3J5LW1lbWZk
IGVuYWJsZXMgc2hhcmU9b24gYnkgZGVmYXVsdCBbTWFyYy1BbmRyw6ldDQogKiBSZWJhc2VkDQoN
CnZob3N0LXVzZXIgcmVxdWlyZXMgLW9iamVjdCBtZW1vcnktYmFja2VuZC0qLHNoYXJlPW9uIG9w
dGlvbiBzbyB0aGF0IFFFTVUgdXNlcw0KbW1hcChNQVBfU0hBUkVEKSBvbiBndWVzdCBSQU0gdGhh
dCBpcyBzaGFyZWQgd2l0aCB0aGUgdmhvc3QtdXNlciBkZXZpY2UgYmFja2VuZA0KcHJvY2Vzcy4g
VGhpcyBpcyBuZWVkZWQgc28gdGhlIFFFTVUgcHJvY2VzcyBzZWVzIGNoYW5nZXMgbWFkZSBieSB0
aGUgdmhvc3QtdXNlcg0KZGV2aWNlIGJhY2tlbmQgcHJvY2VzcywgYW5kIHZpY2UgdmVyc2EuDQoN
ClRvZGF5IFFFTVUgYW5kIHRoZSB2aG9zdC11c2VyIGRldmljZSBwcm9jZXNzIHdpbGwgc3RhcnQg
dXAgYW5kIHRoZW4gZmFpbCB3aXRoIGENCmNvbmZ1c2luZyBlcnJvciBtZXNzYWdlIGlmIHRoZSB1
c2VyIGZvcmdvdCB0byBzcGVjaWZ5IHNoYXJlPW9uLg0KDQpUaGlzIHBhdGNoIHNlcmllcyBhZGRz
IGEgd2FybmluZyBsZXR0aW5nIHRoZSB1c2VyIGtub3cgdGhhdCBzaGFyZT1vbiBpcw0KcmVxdWly
ZWQuDQoNClN0ZWZhbiBIYWpub2N6aSAoMyk6DQogIHRlc3RzL3F0ZXN0L3Zob3N0LXVzZXItdGVz
dDogdXNlIHNoYXJlPW9uIHdpdGggbWVtZmQNCiAgbWVtb3J5OiBhZGQgbWVtb3J5X3JlZ2lvbl9p
c19tYXBwZWRfc2hhcmVkKCkNCiAgdmhvc3QtdXNlcjogd2FybiB3aGVuIGd1ZXN0IFJBTSBpcyBu
b3Qgc2hhcmVkDQoNCiBpbmNsdWRlL2V4ZWMvbWVtb3J5LmggICAgICAgICB8IDExICsrKysrKysr
KysrDQogaHcvdmlydGlvL3Zob3N0LXVzZXIuYyAgICAgICAgfCAyMCArKysrKysrKysrKysrKysr
LS0tLQ0KIHNvZnRtbXUvbWVtb3J5LmMgICAgICAgICAgICAgIHwgIDYgKysrKysrDQogdGVzdHMv
cXRlc3Qvdmhvc3QtdXNlci10ZXN0LmMgfCAgMiArLQ0KIDQgZmlsZXMgY2hhbmdlZCwgMzQgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjMxLjENCg0K


