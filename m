Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DFC322CC9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:50:15 +0100 (CET)
Received: from localhost ([::1]:54552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZ0w-0006qz-1D
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYz9-0005Hm-QM
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:48:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYz7-0002ZS-0d
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614091700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9NnMW3NeBcwW/Q6CCu/aZONa/CakBaYrqvdv3rwE/YQ=;
 b=NnYCM3S77kJnkisszP41A2zcfJDzS+4hMM1Y3sAeUBfVzNiFoukOYQgDR010vkRR0JCfRd
 MoSFYhNuHmOvNAOkkfmlqi/kNqfHx8AXwDxoSGQs9386Et0AEl8tu6dumgRz73qebrgRMv
 3K/6/HC8/A2ffrXrOUm3HH6wSvbmcks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-c7fe_SjqP8K2ivty_2_37Q-1; Tue, 23 Feb 2021 09:47:33 -0500
X-MC-Unique: c7fe_SjqP8K2ivty_2_37Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4EE1192AB99;
 Tue, 23 Feb 2021 14:47:00 +0000 (UTC)
Received: from localhost (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 879CC5D6A1;
 Tue, 23 Feb 2021 14:46:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/12] block/export: vhost-user-blk server tests and input
 validation
Date: Tue, 23 Feb 2021 14:46:41 +0000
Message-Id: <20210223144653.811468-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djM6DQogKiBSZWJhc2VkIG9udG8gcWVtdS5naXQvbWFzdGVyICg3ZWY4MTM0NTY1ZGMpDQogKiBJ
IGFza2VkIENvaWJ5IFh1IGZvciBjbGFyaWZpY2F0aW9uIG9uIGEgY29tbWVudCBhYm91dCB2aG9z
dC11c2VyLWJsay10ZXN0IGluDQogICB2Mi4gUGxlYXNlIHdhaXQgZm9yIHRoYXQgZGlzY3Vzc2lv
biB0byBmaW5pc2ggYmVmb3JlIG1lcmdpbmcuDQoNCnYyOg0KICogQWRkIGFicnQgaGFuZGxlciB0
aGF0IHRlcm1pbmF0ZXMgcWVtdS1zdG9yYWdlLWRhZW1vbiB0bw0KICAgdmhvc3QtdXNlci1ibGst
dGVzdC4gTm8gbW9yZSBvcnBoYW5lZCBwcm9jZXNzZXMgb24gdGVzdCBmYWlsdXJlLiBbUGV0ZXJd
DQogKiBGaXggc2VjdG9yIG51bWJlciBjYWxjdWxhdGlvbiBpbiB2aG9zdC11c2VyLWJsay1zZXJ2
ZXIuYw0KICogSW50cm9kdWNlIFZJUlRJT19CTEtfU0VDVE9SX0JJVFMvU0laRSB0byBtYWtlIGNv
ZGUgY2xlYXJlciBbTWF4XQ0KICogRml4IHZob3N0LXVzZXItYmxrLXNlcnZlci5jIGJsa19zaXpl
IGRvdWJsZSBieXRlc3dhcA0KICogRml4IHZob3N0LXVzZXItYmxrIGJsa2NmZy0+bnVtX3F1ZXVl
cyBlbmRpYW5uZXNzIFtQZXRlcl0NCiAqIFNxdWFzaGVkIGNsZWFudXBzIGludG8gQ29pYnkgdmhv
c3QtdXNlci1ibGstdGVzdCBjb21taXQgc28gdGhlIGNvZGUgaXMNCiAgIGVhc2llciB0byByZXZp
ZXcNCg0KVGhlIHZob3N0LXVzZXItYmxrIHNlcnZlciB0ZXN0IHdhcyBhbHJlYWR5IGluIE1pY2hh
ZWwgVHNpcmtpbidzIHJlY2VudCB2aG9zdA0KcHVsbCByZXF1ZXN0LCBidXQgd2FzIGRyb3BwZWQg
YmVjYXVzZSBpdCBleHBvc2VkIHZob3N0LXVzZXIgcmVncmVzc2lvbnMNCihiN2MxYmQ5ZDc4NDgg
YW5kIHRoZSBCYXNlZC1vbiB0YWcgYmVsb3cpLiBOb3cgdGhhdCB0aGUgdmhvc3QtdXNlciByZWdy
ZXNzaW9ucw0KYXJlIGZpeGVkIHdlIGNhbiByZS1pbnRyb2R1Y2UgdGhlIHRlc3QgY2FzZS4NCg0K
VGhpcyBzZXJpZXMgYWRkcyBtaXNzaW5nIGlucHV0IHZhbGlkYXRpb24gdGhhdCBsZWQgdG8gYSBD
b3Zlcml0eSByZXBvcnQuIFRoZQ0KdmlydGlvLWJsayByZWFkLCB3cml0ZSwgZGlzY2FyZCwgYW5k
IHdyaXRlIHplcm9lcyBjb21tYW5kcyBuZWVkIHRvIGNoZWNrDQpzZWN0b3IvYnl0ZSByYW5nZXMg
YW5kIG90aGVyIGlucHV0cy4gVGhpcyBzb2x2ZXMgdGhlIGlzc3VlIFBldGVyIE1heWRlbGwgcmFp
c2VkDQppbiAiW1BBVENIIGZvci01LjJdIGJsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2
ZXIuYzogQXZvaWQgcG90ZW50aWFsDQppbnRlZ2VyIG92ZXJmbG93Ii4NCg0KTWVyZ2luZyBqdXN0
IHRoZSBpbnB1dCB2YWxpZGF0aW9uIHBhdGNoZXMgd291bGQgYmUgcG9zc2libGUgdG9vLCBidXQg
SSBwcmVmZXINCnRvIG1lcmdlIHRoZSBjb3JyZXNwb25kaW5nIHRlc3RzIHNvIHRoZSBjb2RlIGlz
IGV4ZXJjaXNlZCBieSB0aGUgQ0kuDQoNCkNvaWJ5IFh1ICgxKToNCiAgdGVzdDogbmV3IHFUZXN0
IGNhc2UgdG8gdGVzdCB0aGUgdmhvc3QtdXNlci1ibGstc2VydmVyDQoNClN0ZWZhbiBIYWpub2N6
aSAoMTEpOg0KICB2aG9zdC11c2VyLWJsazogZml4IGJsa2NmZy0+bnVtX3F1ZXVlcyBlbmRpYW5u
ZXNzDQogIGxpYnF0ZXN0OiBhZGQgcXRlc3Rfc29ja2V0X3NlcnZlcigpDQogIGxpYnF0ZXN0OiBh
ZGQgcXRlc3Rfa2lsbF9xZW11KCkNCiAgbGlicXRlc3Q6IGFkZCBxdGVzdF9yZW1vdmVfYWJydF9o
YW5kbGVyKCkNCiAgdGVzdHMvcXRlc3Q6IGFkZCBtdWx0aS1xdWV1ZSB0ZXN0IGNhc2UgdG8gdmhv
c3QtdXNlci1ibGstdGVzdA0KICBibG9jay9leHBvcnQ6IGZpeCBibGtfc2l6ZSBkb3VibGUgYnl0
ZXN3YXANCiAgYmxvY2svZXhwb3J0OiB1c2UgVklSVElPX0JMS19TRUNUT1JfQklUUw0KICBibG9j
ay9leHBvcnQ6IGZpeCB2aG9zdC11c2VyLWJsayBleHBvcnQgc2VjdG9yIG51bWJlciBjYWxjdWxh
dGlvbg0KICBibG9jay9leHBvcnQ6IHBvcnQgdmlydGlvLWJsayBkaXNjYXJkL3dyaXRlIHplcm9l
cyBpbnB1dCB2YWxpZGF0aW9uDQogIHZob3N0LXVzZXItYmxrLXRlc3Q6IHRlc3QgZGlzY2FyZC93
cml0ZSB6ZXJvZXMgaW52YWxpZCBpbnB1dHMNCiAgYmxvY2svZXhwb3J0OiBwb3J0IHZpcnRpby1i
bGsgcmVhZC93cml0ZSByYW5nZSBjaGVjaw0KDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICsNCiB0ZXN0cy9xdGVzdC9saWJxb3MvbGlicXRlc3QuaCAgICAgICAg
fCAgMzcgKw0KIHRlc3RzL3F0ZXN0L2xpYnFvcy92aG9zdC11c2VyLWJsay5oICB8ICA0OCArKw0K
IGJsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYyB8IDE1MCArKystDQogaHcvYmxv
Y2svdmhvc3QtdXNlci1ibGsuYyAgICAgICAgICAgIHwgICA3ICstDQogdGVzdHMvcXRlc3QvbGli
cW9zL3Zob3N0LXVzZXItYmxrLmMgIHwgMTMwICsrKysNCiB0ZXN0cy9xdGVzdC9saWJxdGVzdC5j
ICAgICAgICAgICAgICAgfCAgODIgKystDQogdGVzdHMvcXRlc3Qvdmhvc3QtdXNlci1ibGstdGVz
dC5jICAgIHwgOTgzICsrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIHRlc3RzL3F0ZXN0L2xp
YnFvcy9tZXNvbi5idWlsZCAgICAgICB8ICAgMSArDQogdGVzdHMvcXRlc3QvbWVzb24uYnVpbGQg
ICAgICAgICAgICAgIHwgICA0ICsNCiAxMCBmaWxlcyBjaGFuZ2VkLCAxMzg1IGluc2VydGlvbnMo
KyksIDU5IGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9xdGVzdC9saWJx
b3Mvdmhvc3QtdXNlci1ibGsuaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9xdGVzdC9saWJx
b3Mvdmhvc3QtdXNlci1ibGsuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9xdGVzdC92aG9z
dC11c2VyLWJsay10ZXN0LmMNCg0KLS0gDQoyLjI5LjINCg0K


