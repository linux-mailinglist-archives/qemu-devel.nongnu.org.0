Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FC7302455
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:36:55 +0100 (CET)
Received: from localhost ([::1]:43146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40Aw-0004Tt-3m
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l409R-0003do-AS
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:35:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l409O-0002wS-B3
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611574516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kZxv1pHufPEn7T2cy+Qj4EB0EF293gPGL3AP+F7hPqU=;
 b=aWKzmJZfwWPHnxSVvFs1KX1v6tm3KwUnnfRcrlbDwBfCcCyie6VvnVkXk3+UnGTH9T1Q0E
 gOtyddkw2QVvYPbzYKt2mnRQ30pp5z8aaqkdyHDYzJz73neQ202bET7tUURlr5dV3qPvct
 4avC6GSKhd+DdHozTVq3Coq8ieAX33M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434--Thoeov8OXOAJ4qgCRttEg-1; Mon, 25 Jan 2021 06:35:14 -0500
X-MC-Unique: -Thoeov8OXOAJ4qgCRttEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA20918C89DD;
 Mon, 25 Jan 2021 11:35:13 +0000 (UTC)
Received: from localhost (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F15425C1C5;
 Mon, 25 Jan 2021 11:35:08 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] trace: make the 'log' backend timestamp configurable
Date: Mon, 25 Jan 2021 11:35:05 +0000
Message-Id: <20210125113507.224287-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wm9sdGFuIHJlbWluZGVkIG1lIHRoYXQgdGhlICdsb2cnIGJhY2tlbmQgcHJpbnRzIHRpZHMvdGlt
ZXN0YW1wcyBhbmQgdGhpcyBjYW4NCmJlIHVud2FudGVkIGluIHNvbWUgY2FzZXMuIEl0J3MgZWFz
aWVyIHRvIGxvb2sgYXQgdHJhY2Ugb3V0cHV0IHdpdGhvdXQgdGhlbSBhbmQNCmluIHNvbWUgY2Fz
ZXMgcGFyc2luZyBpcyBhbHNvIG1vcmUgY29udmVuaWVudCB3aXRoIHRoZW0uDQoNCkV4dGVuZCAt
bXNnIHRpbWVzdGFtcD1vbnxvZmYgdG8gY29udHJvbCB0aGUgJ2xvZycgYmFja2VuZCdzIHRpZC90
aW1lc3RhbXAgb3V0cHV0Lg0KDQpTdGVmYW4gSGFqbm9jemkgKDIpOg0KICBlcnJvcjogcmVuYW1l
IGVycm9yX3dpdGhfdGltZXN0YW1wIHRvIG1lc3NhZ2Vfd2l0aF90aW1lc3RhbXANCiAgdHJhY2U6
IG1ha2UgdGhlICdsb2cnIGJhY2tlbmQgdGltZXN0YW1wIGNvbmZpZ3VyYWJsZQ0KDQogZG9jcy9k
ZXZlbC90cmFjaW5nLnR4dCAgICAgICAgICAgfCAgMyArKysNCiBpbmNsdWRlL3FlbXUvZXJyb3It
cmVwb3J0LmggICAgICB8ICAyICstDQogc29mdG1tdS92bC5jICAgICAgICAgICAgICAgICAgICAg
fCAgMiArLQ0KIHV0aWwvcWVtdS1lcnJvci5jICAgICAgICAgICAgICAgIHwgIDQgKystLQ0KIHNj
cmlwdHMvdHJhY2V0b29sL2JhY2tlbmQvbG9nLnB5IHwgMTkgKysrKysrKysrKysrKy0tLS0tLQ0K
IDUgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQoNCi0t
IA0KMi4yOS4yDQoNCg==


