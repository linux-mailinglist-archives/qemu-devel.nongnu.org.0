Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E13DA8F4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:26:30 +0200 (CEST)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98rd-0006SI-7M
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98ob-0000U1-GX
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:23:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98oZ-0003zN-MP
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627575799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ioQKIQOS8tOVEHvt3WOZHosjqsNy9caNWDsvYvirkm8=;
 b=K05KcftZk4Cp7dx44w6MN7ppU5iagvb44yH536NR3yNL65MVqH8HFJLAJnAb82hmfdvZk3
 +Ha14KmV3mU11RFniWdxnVs/xBCCHNoVePEnBhSIEISt5KlNj+1Y6nsgyTqLtxPzyTxZz7
 jFBezykj9v1uejvklAGtqylebdjjPy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-ce_4A9cKNLKv8JZ-72tWSA-1; Thu, 29 Jul 2021 12:22:48 -0400
X-MC-Unique: ce_4A9cKNLKv8JZ-72tWSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69793875047;
 Thu, 29 Jul 2021 16:22:47 +0000 (UTC)
Received: from localhost (unknown [10.39.194.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F81F10023B0;
 Thu, 29 Jul 2021 16:22:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 0/3] Block patches
Date: Thu, 29 Jul 2021 17:22:36 +0100
Message-Id: <20210729162239.932125-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzNTIxYWRlMzUxMGViNWNlZmIyZTI3
YTEwMTY2N2YyNWRhZDg5OTM1Og0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvdGh1dGgtZ2l0bGFiL3RhZ3MvcHVsbC1yZXF1ZXN0LTIwMjEtMDctMjknIGludG8gc3Rh
Z2luZyAoMjAyMS0wNy0yOSAxMzoxNzoyMCArMDEwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUg
R2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRsYWIuY29tL3N0ZWZhbmhhL3FlbXUu
Z2l0IHRhZ3MvYmxvY2stcHVsbC1yZXF1ZXN0DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byBjYzhlZWNkN2YxMDVhMWRmZjU4NzZhZGViMjM4YTE0Njk2MDYxYTRhOg0KDQogIE1BSU5U
QUlORVJTOiBBZGRlZCBteXNlbGYgYXMgYSByZXZpZXdlciBmb3IgdGhlIE5WTWUgQmxvY2sgRHJp
dmVyICgyMDIxLTA3LTI5IDE3OjE3OjM0ICswMTAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpQdWxsIHJlcXVlc3QN
Cg0KVGhlIG1haW4gZml4IGhlcmUgaXMgZm9yIGlvX3VyaW5nLiBTcHVyaW91cyAtRUFHQUlOIGVy
cm9ycyBjYW4gaGFwcGVuIGFuZCB0aGUNCnJlcXVlc3QgbmVlZHMgdG8gYmUgcmVzdWJtaXR0ZWQu
DQoNClRoZSBNQUlOVEFJTkVSUyBjaGFuZ2VzIGNhcnJ5IG5vIHJpc2sgYW5kIHdlIG1pZ2h0IGFz
IHdlbGwgaW5jbHVkZSB0aGVtIGluIFFFTVUNCjYuMS4NCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpGYWJpYW4gRWJu
ZXIgKDEpOg0KICBibG9jay9pb191cmluZzogcmVzdWJtaXQgd2hlbiByZXN1bHQgaXMgLUVBR0FJ
Tg0KDQpQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSAoMSk6DQogIE1BSU5UQUlORVJTOiBBZGRlZCBt
eXNlbGYgYXMgYSByZXZpZXdlciBmb3IgdGhlIE5WTWUgQmxvY2sgRHJpdmVyDQoNClN0ZWZhbm8g
R2FyemFyZWxsYSAoMSk6DQogIE1BSU5UQUlORVJTOiBhZGQgU3RlZmFubyBHYXJ6YXJlbGxhIGFz
IGlvX3VyaW5nIHJldmlld2VyDQoNCiBNQUlOVEFJTkVSUyAgICAgIHwgIDIgKysNCiBibG9jay9p
b191cmluZy5jIHwgMTYgKysrKysrKysrKysrKysrLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQotLSANCjIuMzEuMQ0KDQo=


