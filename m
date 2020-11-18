Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B345C2B7A38
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:18:48 +0100 (CET)
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJbz-0005u3-7L
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfJaR-0004ja-9n
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:17:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfJaL-0003XE-0s
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:17:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605691022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TpXuglKPNY32SmoUaf9Ky3Fs6lBJA4BCK7o5Q2GFRjk=;
 b=I4vNbvYFxXkusTDft06koNVA6avVE36r3plsk042+lRUiqZcZNx7XDk454xbAZ5yFfADeC
 6cZbo4HOoZKivoHi3Pu81otj03j9od7+IVuvP4Tcw0kYUW/Cwhiq3j1qTn/fu16JJwSZBq
 pjoPCXKmWaHwdkH91CmVHIl/faLUVDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-ryLq6eVwP-mrv7lAFk5IJA-1; Wed, 18 Nov 2020 04:17:01 -0500
X-MC-Unique: ryLq6eVwP-mrv7lAFk5IJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE221186DD3D;
 Wed, 18 Nov 2020 09:16:59 +0000 (UTC)
Received: from localhost (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 954A65D9D2;
 Wed, 18 Nov 2020 09:16:45 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] vhost-user: avoid g_return_val_if() in get/set_config()
Date: Wed, 18 Nov 2020 09:16:40 +0000
Message-Id: <20201118091644.199527-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TWFya3VzIEFybWJydXN0ZXIgcG9pbnRlZCBvdXQgdGhhdCBnX3JldHVybl92YWxfaWYoKSBpcyBt
ZWFudCBmb3IgcHJvZ3JhbW1pbmcNCmVycm9ycy4gSXQgbXVzdCBub3QgYmUgdXNlZCBmb3IgaW5w
dXQgdmFsaWRhdGlvbiBzaW5jZSBpdCBjYW4gYmUgY29tcGlsZWQgb3V0Lg0KVXNlIGV4cGxpY2l0
IGlmIHN0YXRlbWVudHMgaW5zdGVhZC4NCg0KVGhpcyBwYXRjaCBzZXJpZXMgY29udmVydHMgdmhv
c3QtdXNlciBkZXZpY2UgYmFja2VuZHMgdGhhdCB1c2UNCmdfcmV0dXJuX3ZhbF9pZigpIGluIGdl
dC9zZXRfY29uZmlnKCkuDQoNClN0ZWZhbiBIYWpub2N6aSAoNCk6DQogIGNvbnRyaWIvdmhvc3Qt
dXNlci1ibGs6IGF2b2lkIGdfcmV0dXJuX3ZhbF9pZigpIGlucHV0IHZhbGlkYXRpb24NCiAgY29u
dHJpYi92aG9zdC11c2VyLWdwdTogYXZvaWQgZ19yZXR1cm5fdmFsX2lmKCkgaW5wdXQgdmFsaWRh
dGlvbg0KICBjb250cmliL3Zob3N0LXVzZXItaW5wdXQ6IGF2b2lkIGdfcmV0dXJuX3ZhbF9pZigp
IGlucHV0IHZhbGlkYXRpb24NCiAgYmxvY2svZXhwb3J0OiBhdm9pZCBnX3JldHVybl92YWxfaWYo
KSBpbnB1dCB2YWxpZGF0aW9uDQoNCiBibG9jay9leHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVy
LmMgICAgfCA0ICsrKy0NCiBjb250cmliL3Zob3N0LXVzZXItYmxrL3Zob3N0LXVzZXItYmxrLmMg
fCA0ICsrKy0NCiBjb250cmliL3Zob3N0LXVzZXItZ3B1L3Zob3N0LXVzZXItZ3B1LmMgfCA0ICsr
Ky0NCiBjb250cmliL3Zob3N0LXVzZXItaW5wdXQvbWFpbi5jICAgICAgICAgfCA0ICsrKy0NCiA0
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCi0tIA0K
Mi4yOC4wDQoNCg==


