Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1673B124DE9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 17:37:26 +0100 (CET)
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihcKC-0007GJ-JA
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 11:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1ihcFy-0002tO-TS
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:33:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1ihcFx-0007qF-O4
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:33:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34079
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1ihcFx-0007kM-Hi
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576686780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3Jj4kYWESg6MCOpvzRxxz7thEH5G5kwypsCmq41mAU=;
 b=Sv/fShiv4aeUraaOdR3x5v4SbadwGIHRRGp26KhYOM4gcXZulOMaV/l88+8l9Wo+NYuKwg
 Aw9O5Q6Q4RWWGMo4uF10XR4eUflvStbDdN2SWUupOueIBtK0A/LXiaAvQJrAYz5B7YT0KW
 im/p8iFMCUbicSr3v8W1F1xbig999EA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-9_-o2dMkMyes6vjn6YE6zA-1; Wed, 18 Dec 2019 11:32:59 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3933CDB23;
 Wed, 18 Dec 2019 16:32:58 +0000 (UTC)
Received: from localhost (unknown [10.36.118.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9821D26DC5;
 Wed, 18 Dec 2019 16:32:50 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 02/15] qapi/block-core: add option for io_uring
Date: Wed, 18 Dec 2019 16:32:15 +0000
Message-Id: <20191218163228.1613099-3-stefanha@redhat.com>
In-Reply-To: <20191218163228.1613099-1-stefanha@redhat.com>
References: <20191218163228.1613099-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 9_-o2dMkMyes6vjn6YE6zA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, oleksandr@redhat.com,
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Since io_uring is the actual name of the Linux API, we use it as enum
value even though the QAPI schema conventions would prefer io-uring.

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v12:
 * Reword commit description [Markus]
 * Update version from 4.2 to 5.0
---
 qapi/block-core.json | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0cf68fea14..18f907373c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2851,11 +2851,13 @@
 #
 # @threads:     Use qemu's thread pool
 # @native:      Use native AIO backend (only Linux and Windows)
+# @io_uring:    Use linux io_uring (since 5.0)
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevAioOptions',
-  'data': [ 'threads', 'native' ] }
+  'data': [ 'threads', 'native',
+            { 'name': 'io_uring', 'if': 'defined(CONFIG_LINUX_IO_URING)' }=
 ] }
=20
 ##
 # @BlockdevCacheOptions:
--=20
2.23.0


