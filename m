Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE2E687064
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 22:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNKPh-0001Lc-93; Wed, 01 Feb 2023 16:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPe-0001K8-Iy
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:13:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPc-0003ca-Fd
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675285979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHWRR9w1QzyIfUJvtG7FAfTWAnsQnxANw/2ngu7uzmI=;
 b=GbjVYQVxn93AoSEJf+LMoVZGmgeej/EjdmxiZQKSMC1Z73GB0P9JBhgC+EfzGCEwD4dKjE
 GsdNcaIo+14DSXGescBucmslzqGxlMNLaiJLTgIX7J92j/PYObkyCdIIknqlGT3b7tJJ4j
 AHFSNT/D1DK0L5Zj5N/9cfUcZUw6SxU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-mn2VY8gqPGWksTp_LR4RrQ-1; Wed, 01 Feb 2023 16:12:56 -0500
X-MC-Unique: mn2VY8gqPGWksTp_LR4RrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8140E3C02547;
 Wed,  1 Feb 2023 21:12:56 +0000 (UTC)
Received: from localhost (unknown [10.39.192.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C27A2166B33;
 Wed,  1 Feb 2023 21:12:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, mjt@tls.msk.ru,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 3/5] docs: flesh out raw format driver description
Date: Wed,  1 Feb 2023 16:12:32 -0500
Message-Id: <20230201211234.301918-4-stefanha@redhat.com>
In-Reply-To: <20230201211234.301918-1-stefanha@redhat.com>
References: <20230201211234.301918-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Modernize the description and document the size=/offset= runtime
options.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/system/qemu-block-drivers.rst.inc | 32 ++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index be6eec1eb6..ec9ebb2066 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -16,11 +16,11 @@ options that are supported for it.
 .. option:: raw
 
   Raw disk image format. This format has the advantage of
-  being simple and easily exportable to all other emulators. If your
-  file system supports *holes* (for example in ext2 or ext3 on
-  Linux or NTFS on Windows), then only the written sectors will reserve
-  space. Use ``qemu-img info`` to know the real size used by the
-  image or ``ls -ls`` on Unix/Linux.
+  being simple and easily exportable to all other emulators. Modern
+  file systems support *holes* (for example in btrfs/XFS/ext4 on
+  Linux or NTFS on Windows) where space is allocated on demand as sectors are
+  written. Use ``qemu-img info`` to know the real size used by the image or
+  ``ls -ls`` on Unix/Linux.
 
   Supported create options:
 
@@ -33,6 +33,28 @@ options that are supported for it.
     for image by writing data to underlying storage. This data may or
     may not be zero, depending on the storage location.
 
+  Supported runtime options:
+
+  .. program:: raw
+  .. option:: offset
+
+    The byte position in the underlying file where the virtual disk starts.
+    This is handy when you want to present just a single partition from a
+    physical disk as the virtual disk. This option is usually used in
+    conjunction with the ``size`` option.
+
+  .. option:: size
+
+    Limit the virtual disk size to the given number of bytes, regardless of how
+    large the underlying file is. This option is usually used in conjunction
+    with the ``offset`` option.
+
+  Note the raw format can be omitted when no runtime options are being used. In
+  that case the raw format does nothing besides forwarding I/O requests to the
+  protocol blockdev. You can improve performance slightly by eliminating
+  ``--blockdev raw,file=file0,node-name=drive0`` and renaming the "file0"
+  blockdev to "drive0".
+
 .. program:: image-formats
 .. option:: qcow2
 
-- 
2.39.1


