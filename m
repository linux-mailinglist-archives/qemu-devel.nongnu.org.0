Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562F5F389A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 20:30:07 +0100 (CET)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSnTk-00027r-G2
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 14:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iSnRe-0001ES-9h
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 14:27:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iSnRc-0008GF-Uz
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 14:27:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51995
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iSnRc-0008Dg-Nu
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 14:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573154866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nTddeKcTbMV2kX0+TyyGOOiaSYjfT4Je/1zNFi/T0pM=;
 b=bNFlVii0xSYRaCq+/LjuGCXS4zOxs4i35Co+xeymJoN/rEN1jSjXk5PMUkQAIl/N+1WjpR
 /dH8ru5l62pKZysvefHomasVDETUnsY9kAdKEq0wFn3uzWJVofxSUFbD/0q1brXeu5/ezb
 WkDQnzAcdlm60WqqrAkbtlDN7Q8VBx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-H0SJ6RyLNt25o_FlTHaGew-1; Thu, 07 Nov 2019 14:27:45 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 398758017DD
 for <qemu-devel@nongnu.org>; Thu,  7 Nov 2019 19:27:44 +0000 (UTC)
Received: from localhost (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73DD8608B4;
 Thu,  7 Nov 2019 19:27:35 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Some memory leak fixes
Date: Thu,  7 Nov 2019 23:27:28 +0400
Message-Id: <20191107192731.17330-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: H0SJ6RyLNt25o_FlTHaGew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Another bunch of fixes spotted by ASAN when running check-qtest-x86_64.

Marc-Andr=C3=A9 Lureau (3):
  virtio-input: fix memory leak on unrealize
  qtest: fix qtest_qmp_device_add leak
  cpu-plug-test: fix leaks

 hw/input/virtio-input.c | 3 +++
 tests/cpu-plug-test.c   | 2 ++
 tests/libqtest.c        | 1 +
 3 files changed, 6 insertions(+)

--=20
2.24.0.rc0.20.gd81542e6f3


