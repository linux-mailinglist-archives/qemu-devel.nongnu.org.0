Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0662AF118
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:45:46 +0100 (CET)
Received: from localhost ([::1]:39516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpVR-0007vk-Nj
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpTU-0006TR-CO
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:43:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpTS-0000zC-KT
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iIZgyANcnLg6jGXa8V1uK2/a7j5YnpWtRFtHO8N9Ths=;
 b=gXxJ+w6QW7+BPrV0rGq+r5jYcjLIAg1zWLfiaRLyb7+xnAcphrFKsMnn2SrgulNhpyEk58
 /nnJ+oYZlDWTY75LCojDn/9ohm+GJC91NaiKHgclwO272cAp/4XCmEpQyUIYaapuFG8vcb
 CD/fxZgcHPewb4fhKr2EkfFNkGJqeVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116--oKRtw1HNVCpEsj4FyRSew-1; Wed, 11 Nov 2020 07:43:40 -0500
X-MC-Unique: -oKRtw1HNVCpEsj4FyRSew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10BAB80B71D;
 Wed, 11 Nov 2020 12:43:39 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E136239F;
 Wed, 11 Nov 2020 12:43:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 00/10] block/export: vhost-user-blk server tests and
 input validation
Date: Wed, 11 Nov 2020 12:43:21 +0000
Message-Id: <20201111124331.1393747-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIHZob3N0LXVzZXItYmxrIHNlcnZlciB0ZXN0IHdhcyBhbHJlYWR5IGluIE1pY2hhZWwgVHNp
cmtpbidzIHJlY2VudCB2aG9zdA0KcHVsbCByZXF1ZXN0LCBidXQgd2FzIGRyb3BwZWQgYmVjYXVz
ZSBpdCBleHBvc2VkIHZob3N0LXVzZXIgcmVncmVzc2lvbnMNCihiN2MxYmQ5ZDc4NDggYW5kIHRo
ZSBCYXNlZC1vbiB0YWcgYmVsb3cpLiBOb3cgdGhhdCB0aGUgdmhvc3QtdXNlciByZWdyZXNzaW9u
cw0KYXJlIGZpeGVkIHdlIGNhbiByZS1pbnRyb2R1Y2UgdGhlIHRlc3QgY2FzZS4NCg0KVGhpcyBz
ZXJpZXMgYWRkcyBtaXNzaW5nIGlucHV0IHZhbGlkYXRpb24gdGhhdCBsZWQgdG8gYSBDb3Zlcml0
eSByZXBvcnQuIFRoZQ0KdmlydGlvLWJsayByZWFkLCB3cml0ZSwgZGlzY2FyZCwgYW5kIHdyaXRl
IHplcm9lcyBjb21tYW5kcyBuZWVkIHRvIGNoZWNrDQpzZWN0b3IvYnl0ZSByYW5nZXMgYW5kIG90
aGVyIGlucHV0cy4gVGhpcyBzb2x2ZXMgdGhlIGlzc3VlIFBldGVyIE1heWRlbGwgcmFpc2VkDQpp
biAiW1BBVENIIGZvci01LjJdIGJsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYzog
QXZvaWQgcG90ZW50aWFsDQppbnRlZ2VyIG92ZXJmbG93Ii4NCg0KTWVyZ2luZyBqdXN0IHRoZSBp
bnB1dCB2YWxpZGF0aW9uIHBhdGNoZXMgd291bGQgYmUgcG9zc2libGUgdG9vLCBidXQgSSBwcmVm
ZXINCnRvIG1lcmdlIHRoZSBjb3JyZXNwb25kaW5nIHRlc3RzIHNvIHRoZSBjb2RlIGlzIGV4ZXJj
aXNlZCBieSB0aGUgQ0kuDQoNCkJhc2VkLW9uOiAyMDIwMTEwOTE3NDM1NS4xMDY5MTQ3LTEtc3Rl
ZmFuaGFAcmVkaGF0LmNvbSAoIltQQVRDSCBmb3ItNS4yXSB2aG9zdC11c2VyOiBmaXggVkhPU1Rf
VVNFUl9BREQvUkVNX01FTV9SRUcgdHJ1bmNhdGlvbiIpDQoNCkNvaWJ5IFh1ICgxKToNCiAgdGVz
dDogbmV3IHFUZXN0IGNhc2UgdG8gdGVzdCB0aGUgdmhvc3QtdXNlci1ibGstc2VydmVyDQoNClN0
ZWZhbiBIYWpub2N6aSAoOSk6DQogIHRlc3RzL3F0ZXN0OiBhZGQgbXVsdGktcXVldWUgdGVzdCBj
YXNlIHRvIHZob3N0LXVzZXItYmxrLXRlc3QNCiAgbGlicXRlc3Q6IGFkZCBxdGVzdF9zb2NrZXRf
c2VydmVyKCkNCiAgdmhvc3QtdXNlci1ibGstdGVzdDogcmVuYW1lIGRlc3Ryb3lfZHJpdmUoKSB0
byBkZXN0cm95X2ZpbGUoKQ0KICB2aG9zdC11c2VyLWJsay10ZXN0OiBjbG9zZSBmb3JrIGNoaWxk
IGZpbGUgZGVzY3JpcHRvcnMNCiAgdmhvc3QtdXNlci1ibGstdGVzdDogZHJvcCB1bnVzZWQgcmV0
dXJuIHZhbHVlDQogIHZob3N0LXVzZXItYmxrLXRlc3Q6IGZpeCByYWNlcyBieSB1c2luZyBmZCBw
YXNzaW5nDQogIGJsb2NrL2V4cG9ydDogcG9ydCB2aXJ0aW8tYmxrIGRpc2NhcmQvd3JpdGUgemVy
b2VzIGlucHV0IHZhbGlkYXRpb24NCiAgdmhvc3QtdXNlci1ibGstdGVzdDogdGVzdCBkaXNjYXJk
L3dyaXRlIHplcm9lcyBpbnZhbGlkIGlucHV0cw0KICBibG9jay9leHBvcnQ6IHBvcnQgdmlydGlv
LWJsayByZWFkL3dyaXRlIHJhbmdlIGNoZWNrDQoNCiB0ZXN0cy9xdGVzdC9saWJxb3MvbGlicXRl
c3QuaCAgICAgICAgfCAgMjUgKw0KIHRlc3RzL3F0ZXN0L2xpYnFvcy92aG9zdC11c2VyLWJsay5o
ICB8ICA0OCArKw0KIGJsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYyB8IDEyOSAr
KystDQogdGVzdHMvcXRlc3QvbGlicW9zL3Zob3N0LXVzZXItYmxrLmMgIHwgMTI5ICsrKysNCiB0
ZXN0cy9xdGVzdC9saWJxdGVzdC5jICAgICAgICAgICAgICAgfCAgNzYgKystDQogdGVzdHMvcXRl
c3Qvdmhvc3QtdXNlci1ibGstdGVzdC5jICAgIHwgOTY1ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KIHRlc3RzL3F0ZXN0L2xpYnFvcy9tZXNvbi5idWlsZCAgICAgICB8ICAgMSArDQogdGVz
dHMvcXRlc3QvbWVzb24uYnVpbGQgICAgICAgICAgICAgIHwgICAyICsNCiA4IGZpbGVzIGNoYW5n
ZWQsIDEzMzMgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHRlc3RzL3F0ZXN0L2xpYnFvcy92aG9zdC11c2VyLWJsay5oDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHRlc3RzL3F0ZXN0L2xpYnFvcy92aG9zdC11c2VyLWJsay5jDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHRlc3RzL3F0ZXN0L3Zob3N0LXVzZXItYmxrLXRlc3QuYw0KDQotLSANCjIuMjguMA0KDQo=


