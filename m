Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E0F687066
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 22:13:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNKPi-0001Qv-Ue; Wed, 01 Feb 2023 16:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPg-0001Lk-U6
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:13:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPf-0003eK-6G
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675285982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ym5PB7wFVphQx6AdIHDJ9zSbsu6D0R9a9T5xuWH3qmU=;
 b=bkHgNzr07/SkAec3L/Cw0OnGfzVd6H81dIDdBXad0AARv2CZsDHNMXAZ3R/ZDWHjNRiHdp
 U8vjCpLphfzS0XRQHTgv0z+fOf+9KDTsbFZfwdhXapmPwjwIuuM6dqTXSnx1a+RqGLrfsD
 86Z5SNxZVFW/nMO1VINYn6M21S7g7yM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-EPFxP8d2O12P_aCi6-HqfQ-1; Wed, 01 Feb 2023 16:12:59 -0500
X-MC-Unique: EPFxP8d2O12P_aCi6-HqfQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9763C1C05AF9;
 Wed,  1 Feb 2023 21:12:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F068A492B00;
 Wed,  1 Feb 2023 21:12:57 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, mjt@tls.msk.ru,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 4/5] docs: flesh out qcow2 format driver description
Date: Wed,  1 Feb 2023 16:12:33 -0500
Message-Id: <20230201211234.301918-5-stefanha@redhat.com>
In-Reply-To: <20230201211234.301918-1-stefanha@redhat.com>
References: <20230201211234.301918-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Put the create options in alphabetical order, add compression_type and
extended_l2, and also mention the common runtime options. I did not add
rarely-used runtime options because I think it's too much information.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/system/qemu-block-drivers.rst.inc | 91 ++++++++++++++++++++------
 1 file changed, 70 insertions(+), 21 deletions(-)

diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index ec9ebb2066..af72817763 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -59,13 +59,27 @@ options that are supported for it.
 .. option:: qcow2
 
   QEMU image format, the most versatile format. Use it to have smaller
-  images (useful if your filesystem does not supports holes, for example
-  on Windows), zlib based compression and support of multiple VM
+  images (useful if your filesystem does not support holes, for example
+  on Windows), zlib/zstd compression and support of multiple VM
   snapshots.
 
-  Supported options:
+  Supported create options:
 
   .. program:: qcow2
+  .. option:: backing_file
+
+    File name of a base image (see ``create`` subcommand)
+
+  .. option:: backing_fmt
+
+    Image format of the base image
+
+  .. option:: cluster_size
+
+    Changes the qcow2 cluster size (must be between 512 and 2M). Smaller cluster
+    sizes can improve the image file size whereas larger cluster sizes generally
+    provide better performance.
+
   .. option:: compat
 
     Determines the qcow2 version to use. ``compat=0.10`` uses the
@@ -74,13 +88,9 @@ options that are supported for it.
     newer understand (this is the default). Amongst others, this includes
     zero clusters, which allow efficient copy-on-read for sparse images.
 
-  .. option:: backing_file
+  .. option:: compression_type
 
-    File name of a base image (see ``create`` subcommand)
-
-  .. option:: backing_fmt
-
-    Image format of the base image
+    Selects the compression algorithm (zlib or zstd).
 
   .. option:: encryption
 
@@ -150,19 +160,11 @@ options that are supported for it.
     Amount of time, in milliseconds, to use for PBKDF algorithm per key slot.
     Defaults to ``2000``. Only used when ``encrypt.format=luks``.
 
-  .. option:: cluster_size
+  .. option:: extended_l2
 
-    Changes the qcow2 cluster size (must be between 512 and 2M). Smaller cluster
-    sizes can improve the image file size whereas larger cluster sizes generally
-    provide better performance.
-
-  .. option:: preallocation
-
-    Preallocation mode (allowed values: ``off``, ``metadata``, ``falloc``,
-    ``full``). An image with preallocated metadata is initially larger but can
-    improve performance when the image needs to grow. ``falloc`` and ``full``
-    preallocations are like the same options of ``raw`` format, but sets up
-    metadata also.
+    Enables the Extended L2 Entries feature that divides each cluster into 32
+    separately allocated sub-clusters. A larger cluster size can be used, thus
+    reducing metadata overhead, while still allowing fine-grained allocation.
 
   .. option:: lazy_refcounts
 
@@ -196,6 +198,53 @@ options that are supported for it.
     filename`` to check if the NOCOW flag is set or not (Capital 'C' is
     NOCOW flag).
 
+  .. option:: preallocation
+
+    Preallocation mode (allowed values: ``off``, ``metadata``, ``falloc``,
+    ``full``). An image with preallocated metadata is initially larger but can
+    improve performance when the image needs to grow. ``falloc`` and ``full``
+    preallocations are like the same options of ``raw`` format, but sets up
+    metadata also.
+
+  Supported runtime options:
+
+  .. program:: qcow2
+  .. option:: cache-clean-interval
+
+    Clean unused cache entries after this time (in seconds).
+
+  .. option:: cache-size
+
+    Maximum combined metadata (L2 tables and refcount blocks) cache size.
+
+  .. option:: encrypt.key-secret
+
+    ID of secret providing qcow2 AES key or LUKS passphrase.
+
+  .. option:: l2-cache-size
+
+    Maximum L2 table cache size.
+
+  .. option:: l2-cache-entry-size
+
+    Size of each entry in the L2 cache.
+
+  .. option:: pass-discard-request
+
+    Pass guest discard requests to the layer below (on/off).
+
+  .. option:: pass-discard-snapshot
+
+    Generate discard requests when snapshot related space is freed (on/off).
+
+  .. option:: pass-discard-other
+
+    Generate discard requests when other clusters are freed (on/off).
+
+  .. option:: refcount-cache-size
+
+    Maximum refcount block cache size.
+
 .. program:: image-formats
 .. option:: qed
 
-- 
2.39.1


