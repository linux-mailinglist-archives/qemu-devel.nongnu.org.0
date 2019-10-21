Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1C1DEA2B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 12:56:39 +0200 (CEST)
Received: from localhost ([::1]:37708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMVMb-0006WW-Jd
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 06:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iMVKI-0004CX-4M
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:54:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iMVKH-0001iC-0S
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:54:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20024
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iMVKG-0001hu-T3
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571655252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7fE3CimUtLQu2tN3FQVw3n9zYsYUqqPEGbjy3LxWxA=;
 b=arMCC35MslvvjXdhMpxJT9Rov1uwkjKBHEsDN504vx/NdWsZUSBbfRWYkI9OXApoM+k7/l
 vN9QEiZ2HsfFa0aClracKZwBXyL4c/shzSlYrRadvb9wrgcbuCdULBYjpWxdwCSfxLikyK
 u1dY/HjacN1KkcLo7zvLL5WVEWGpMgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-EdhVZ12nNDKt55oaSxN3pA-1; Mon, 21 Oct 2019 06:54:09 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC3D15ED;
 Mon, 21 Oct 2019 10:54:08 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CAAD60BE2;
 Mon, 21 Oct 2019 10:54:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org
Subject: [PATCH v2 3/6] iotests: Test 183 does not work on macOS and OpenBSD
Date: Mon, 21 Oct 2019 12:53:47 +0200
Message-Id: <20191021105350.1710-4-thuth@redhat.com>
In-Reply-To: <20191021105350.1710-1-thuth@redhat.com>
References: <20191021105350.1710-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: EdhVZ12nNDKt55oaSxN3pA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running 183 in Cirrus-CI on macOS, or with our vm-build-openbsd
target, it fails with an "Timeout waiting for return on handle 0" error.

Let's mark it as supported only on systems where the test is working
fine (i.e. Linux, FreeBSD and NetBSD).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/183 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/183 b/tests/qemu-iotests/183
index bced83fae0..0bbae13647 100755
--- a/tests/qemu-iotests/183
+++ b/tests/qemu-iotests/183
@@ -42,6 +42,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 . ./common.filter
 . ./common.qemu
=20
+_supported_os Linux FreeBSD NetBSD
 _supported_fmt qcow2 raw qed quorum
 _supported_proto file
=20
--=20
2.18.1


