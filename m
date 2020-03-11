Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1B181CB7
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:46:42 +0100 (CET)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3ZA-0008I3-IB
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3VI-0002sf-4h
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3VH-0002vH-2Y
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:39 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21248
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3VG-0002tV-T1
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwtrIe9mlPyMqFukWE3oYgseNckLG6yMm06xtJDpqmM=;
 b=HTgsAAHhIM7fhA7BBsVIB/S8N5Yb3AXXEFFRU/a02YaAH7GzBuB2YD1j0jHXltG4LodAGs
 Qk/Pni/IXmPyAF3TGdF9SLw4d+ubpzLUzchFz5P1aKZcYEWZUzc9NMgWIM4JEcU53yPtOh
 x79IENyjkJ+FNrryx5Uryu2/e5f8fKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-_L-w9CqzPd25RHYR-MThdQ-1; Wed, 11 Mar 2020 11:42:36 -0400
X-MC-Unique: _L-w9CqzPd25RHYR-MThdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD02800D4E;
 Wed, 11 Mar 2020 15:42:35 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 431C160BEE;
 Wed, 11 Mar 2020 15:42:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/13] qapi: Add '@allow-write-only-overlay' feature for
 'blockdev-snapshot'
Date: Wed, 11 Mar 2020 16:42:13 +0100
Message-Id: <20200311154218.15532-9-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Krempa <pkrempa@redhat.com>

Anounce that 'blockdev-snapshot' command's permissions allow changing
of the backing file if the 'consistent_read' permission is not required.

This is useful for libvirt to allow late opening of the backing chain
during a blockdev-mirror.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200310113831.27293-8-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9758fc48d2..91586fb1fb 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1472,6 +1472,12 @@
 #
 # For the arguments, see the documentation of BlockdevSnapshot.
 #
+# Features:
+# @allow-write-only-overlay: If present, the check whether this operation =
is safe
+#                            was relaxed so that it can be used to change
+#                            backing file of a destination of a blockdev-m=
irror.
+#                            (since 5.0)
+#
 # Since: 2.5
 #
 # Example:
@@ -1492,7 +1498,8 @@
 #
 ##
 { 'command': 'blockdev-snapshot',
-  'data': 'BlockdevSnapshot' }
+  'data': 'BlockdevSnapshot',
+  'features': [ 'allow-write-only-overlay' ] }
=20
 ##
 # @change-backing-file:
--=20
2.20.1


