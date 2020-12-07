Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6138C2D1793
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:32:11 +0100 (CET)
Received: from localhost ([::1]:39754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKMs-0005Xw-DU
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKFe-0000LE-1g
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKFb-0006ti-1n
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607361871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qBAEzim/8xy2sKbyHEdUAcSIFAyWh24Oo/9V0t/01r8=;
 b=bZvjUOOw2GJSMXBggbE8Otb4skhcwgNH2VyPQuxdKoEuPJRIZrL1P8SekFKy56Hvm6/8fL
 YkQUs2oSYQd5EsaqiX3NO47tg2ZiSgtOy8r6DyyvT8/6br5jKKCDECrT8NeiqWG6KsQ3X6
 XKcuzdy2dntJxL/pQCwBZ4Wr7+lKqPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204--4R2F6raPyGk98zCxeI63A-1; Mon, 07 Dec 2020 12:24:29 -0500
X-MC-Unique: -4R2F6raPyGk98zCxeI63A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB2E5107ACFE;
 Mon,  7 Dec 2020 17:24:27 +0000 (UTC)
Received: from localhost (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2C6E6A052;
 Mon,  7 Dec 2020 17:24:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] block/export: vhost-user-blk server tests and input
 validation
Date: Mon,  7 Dec 2020 17:20:18 +0000
Message-Id: <20201207172030.251905-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djI6DQogKiBBZGQgYWJydCBoYW5kbGVyIHRoYXQgdGVybWluYXRlcyBxZW11LXN0b3JhZ2UtZGFl
bW9uIHRvDQogICB2aG9zdC11c2VyLWJsay10ZXN0LiBObyBtb3JlIG9ycGhhbmVkIHByb2Nlc3Nl
cyBvbiB0ZXN0IGZhaWx1cmUuIFtQZXRlcl0NCiAqIEZpeCBzZWN0b3IgbnVtYmVyIGNhbGN1bGF0
aW9uIGluIHZob3N0LXVzZXItYmxrLXNlcnZlci5jDQogKiBJbnRyb2R1Y2UgVklSVElPX0JMS19T
RUNUT1JfQklUUy9TSVpFIHRvIG1ha2UgY29kZSBjbGVhcmVyIFtNYXhdDQogKiBGaXggdmhvc3Qt
dXNlci1ibGstc2VydmVyLmMgYmxrX3NpemUgZG91YmxlIGJ5dGVzd2FwDQogKiBGaXggdmhvc3Qt
dXNlci1ibGsgYmxrY2ZnLT5udW1fcXVldWVzIGVuZGlhbm5lc3MgW1BldGVyXQ0KICogU3F1YXNo
ZWQgY2xlYW51cHMgaW50byBDb2lieSB2aG9zdC11c2VyLWJsay10ZXN0IGNvbW1pdCBzbyB0aGUg
Y29kZSBpcw0KICAgZWFzaWVyIHRvIHJldmlldw0KDQpUaGUgdmhvc3QtdXNlci1ibGsgc2VydmVy
IHRlc3Qgd2FzIGFscmVhZHkgaW4gTWljaGFlbCBUc2lya2luJ3MgcmVjZW50IHZob3N0DQpwdWxs
IHJlcXVlc3QsIGJ1dCB3YXMgZHJvcHBlZCBiZWNhdXNlIGl0IGV4cG9zZWQgdmhvc3QtdXNlciBy
ZWdyZXNzaW9ucw0KKGI3YzFiZDlkNzg0OCBhbmQgdGhlIEJhc2VkLW9uIHRhZyBiZWxvdykuIE5v
dyB0aGF0IHRoZSB2aG9zdC11c2VyIHJlZ3Jlc3Npb25zDQphcmUgZml4ZWQgd2UgY2FuIHJlLWlu
dHJvZHVjZSB0aGUgdGVzdCBjYXNlLg0KDQpUaGlzIHNlcmllcyBhZGRzIG1pc3NpbmcgaW5wdXQg
dmFsaWRhdGlvbiB0aGF0IGxlZCB0byBhIENvdmVyaXR5IHJlcG9ydC4gVGhlDQp2aXJ0aW8tYmxr
IHJlYWQsIHdyaXRlLCBkaXNjYXJkLCBhbmQgd3JpdGUgemVyb2VzIGNvbW1hbmRzIG5lZWQgdG8g
Y2hlY2sNCnNlY3Rvci9ieXRlIHJhbmdlcyBhbmQgb3RoZXIgaW5wdXRzLiBUaGlzIHNvbHZlcyB0
aGUgaXNzdWUgUGV0ZXIgTWF5ZGVsbCByYWlzZWQNCmluICJbUEFUQ0ggZm9yLTUuMl0gYmxvY2sv
ZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jOiBBdm9pZCBwb3RlbnRpYWwNCmludGVnZXIg
b3ZlcmZsb3ciLg0KDQpNZXJnaW5nIGp1c3QgdGhlIGlucHV0IHZhbGlkYXRpb24gcGF0Y2hlcyB3
b3VsZCBiZSBwb3NzaWJsZSB0b28sIGJ1dCBJIHByZWZlcg0KdG8gbWVyZ2UgdGhlIGNvcnJlc3Bv
bmRpbmcgdGVzdHMgc28gdGhlIGNvZGUgaXMgZXhlcmNpc2VkIGJ5IHRoZSBDSS4NCg0KQ29pYnkg
WHUgKDEpOg0KICB0ZXN0OiBuZXcgcVRlc3QgY2FzZSB0byB0ZXN0IHRoZSB2aG9zdC11c2VyLWJs
ay1zZXJ2ZXINCg0KU3RlZmFuIEhham5vY3ppICgxMSk6DQogIHZob3N0LXVzZXItYmxrOiBmaXgg
YmxrY2ZnLT5udW1fcXVldWVzIGVuZGlhbm5lc3MNCiAgbGlicXRlc3Q6IGFkZCBxdGVzdF9zb2Nr
ZXRfc2VydmVyKCkNCiAgbGlicXRlc3Q6IGFkZCBxdGVzdF9raWxsX3FlbXUoKQ0KICBsaWJxdGVz
dDogYWRkIHF0ZXN0X3JlbW92ZV9hYnJ0X2hhbmRsZXIoKQ0KICB0ZXN0cy9xdGVzdDogYWRkIG11
bHRpLXF1ZXVlIHRlc3QgY2FzZSB0byB2aG9zdC11c2VyLWJsay10ZXN0DQogIGJsb2NrL2V4cG9y
dDogZml4IGJsa19zaXplIGRvdWJsZSBieXRlc3dhcA0KICBibG9jay9leHBvcnQ6IHVzZSBWSVJU
SU9fQkxLX1NFQ1RPUl9CSVRTDQogIGJsb2NrL2V4cG9ydDogZml4IHZob3N0LXVzZXItYmxrIGV4
cG9ydCBzZWN0b3IgbnVtYmVyIGNhbGN1bGF0aW9uDQogIGJsb2NrL2V4cG9ydDogcG9ydCB2aXJ0
aW8tYmxrIGRpc2NhcmQvd3JpdGUgemVyb2VzIGlucHV0IHZhbGlkYXRpb24NCiAgdmhvc3QtdXNl
ci1ibGstdGVzdDogdGVzdCBkaXNjYXJkL3dyaXRlIHplcm9lcyBpbnZhbGlkIGlucHV0cw0KICBi
bG9jay9leHBvcnQ6IHBvcnQgdmlydGlvLWJsayByZWFkL3dyaXRlIHJhbmdlIGNoZWNrDQoNCiBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KIHRlc3RzL3F0ZXN0
L2xpYnFvcy9saWJxdGVzdC5oICAgICAgICB8ICAzNyArDQogdGVzdHMvcXRlc3QvbGlicW9zL3Zo
b3N0LXVzZXItYmxrLmggIHwgIDQ4ICsrDQogYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNl
cnZlci5jIHwgMTUwICsrKy0NCiBody9ibG9jay92aG9zdC11c2VyLWJsay5jICAgICAgICAgICAg
fCAgIDcgKy0NCiB0ZXN0cy9xdGVzdC9saWJxb3Mvdmhvc3QtdXNlci1ibGsuYyAgfCAxMzAgKysr
Kw0KIHRlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMgICAgICAgICAgICAgICB8ICA4MiArKy0NCiB0ZXN0
cy9xdGVzdC92aG9zdC11c2VyLWJsay10ZXN0LmMgICAgfCA5ODMgKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQogdGVzdHMvcXRlc3QvbGlicW9zL21lc29uLmJ1aWxkICAgICAgIHwgICAxICsN
CiB0ZXN0cy9xdGVzdC9tZXNvbi5idWlsZCAgICAgICAgICAgICAgfCAgIDQgKw0KIDEwIGZpbGVz
IGNoYW5nZWQsIDEzODUgaW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHRlc3RzL3F0ZXN0L2xpYnFvcy92aG9zdC11c2VyLWJsay5oDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHRlc3RzL3F0ZXN0L2xpYnFvcy92aG9zdC11c2VyLWJsay5jDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHRlc3RzL3F0ZXN0L3Zob3N0LXVzZXItYmxrLXRlc3QuYw0KDQotLSANCjIuMjgu
MA0KDQo=


