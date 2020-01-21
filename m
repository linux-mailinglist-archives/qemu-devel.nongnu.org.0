Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573EA1439E6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 10:54:31 +0100 (CET)
Received: from localhost ([::1]:50734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itqEw-0000qj-1X
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 04:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60472)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1itqCs-0007Ua-Dm
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 04:52:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1itqCr-0005Wr-AQ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 04:52:22 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39215
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1itqCr-0005WT-7O
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 04:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579600340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jee1MID4OO2ltZAPo29e9r/gt4/OoRw9E7ePzIUEGnc=;
 b=cW3dvhhhpfbNcLaePAzt+1iXFg5xLIubXrHJfQyyEq2aWZdxTDs/cw/zS9COWCiE+NVUMB
 jMOhhYjMI+UhhmaEGszC8WYF5wFthS7dgx6RVg71RU5HJe9n3Ti/AEIYl1O33D7H7ly+kU
 6Lw/2JybVApJhFarmefbAtNK/Xf728I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-wqGe1LNaOU2qmSR1Djeofw-1; Tue, 21 Jan 2020 04:52:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9FC01005514;
 Tue, 21 Jan 2020 09:52:15 +0000 (UTC)
Received: from thuth.com (ovpn-116-121.ams2.redhat.com [10.36.116.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99E6510027A9;
 Tue, 21 Jan 2020 09:52:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v5 3/6] iotests: Test 183 does not work on macOS and OpenBSD
Date: Tue, 21 Jan 2020 10:52:02 +0100
Message-Id: <20200121095205.26323-4-thuth@redhat.com>
In-Reply-To: <20200121095205.26323-1-thuth@redhat.com>
References: <20200121095205.26323-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: wqGe1LNaOU2qmSR1Djeofw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the long run, we might want to add test 183 to the "auto" group
(but it still fails occasionally, so we cannot do that yet). However,
when running 183 in Cirrus-CI on macOS, or with our vm-build-openbsd
target, it currently always fails with an "Timeout waiting for return
on handle 0" error.

Let's mark it as supported only on systems where the test is working
most of the time (i.e. Linux, FreeBSD and NetBSD).

Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/183 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/183 b/tests/qemu-iotests/183
index 3f74b9f62d..a5e0d7e8b7 100755
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


