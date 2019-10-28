Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC0EE77D9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 18:49:58 +0100 (CET)
Received: from localhost ([::1]:39736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP99Q-0005ty-DI
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 13:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP7yN-0000rx-7o
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:34:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP7jG-0003hh-Uc
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:18:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30927
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP7jG-0003h1-PW
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572279530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7gKbmnFpKl+1jbTdbbPkMmYZ5hw+7LhIFOifFREUiyc=;
 b=KwGyscUKCraw2aGB2ziEcrhrYeUgnXIAmSvV7N9Db6MMzgxK1TBwOddKMZKziV9FohKk11
 5wRthIa7N3dy5UAUFTvi6LZggv1UXvqm+kTEchCFY+qcwci9mkC9HVDZbXer11HQwHeelS
 8epxU+QWOJjxdzD6Rgscvs868HSRhsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-LG22HMZBN_mUFmUjeza6zg-1; Mon, 28 Oct 2019 12:18:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B818C180496F;
 Mon, 28 Oct 2019 16:18:45 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 606D85C1B2;
 Mon, 28 Oct 2019 16:18:45 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-4.2 1/2] qcow2: Fix QCOW2_COMPRESSED_SECTOR_MASK
Date: Mon, 28 Oct 2019 17:18:40 +0100
Message-Id: <20191028161841.1198-2-mreitz@redhat.com>
In-Reply-To: <20191028161841.1198-1-mreitz@redhat.com>
References: <20191028161841.1198-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: LG22HMZBN_mUFmUjeza6zg-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Masks for L2 table entries should have 64 bit.

Fixes: b6c246942b14d3e0dec46a6c5868ed84e7dbea19
Buglink: https://bugs.launchpad.net/qemu/+bug/1850000
Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 601c2e4c82..0942126232 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -83,7 +83,7 @@
=20
 /* Defined in the qcow2 spec (compressed cluster descriptor) */
 #define QCOW2_COMPRESSED_SECTOR_SIZE 512U
-#define QCOW2_COMPRESSED_SECTOR_MASK (~(QCOW2_COMPRESSED_SECTOR_SIZE - 1))
+#define QCOW2_COMPRESSED_SECTOR_MASK (~(QCOW2_COMPRESSED_SECTOR_SIZE - 1UL=
L))
=20
 /* Must be at least 2 to cover COW */
 #define MIN_L2_CACHE_SIZE 2 /* cache entries */
--=20
2.21.0


