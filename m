Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85354687063
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 22:13:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNKPg-0001L1-0e; Wed, 01 Feb 2023 16:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPd-0001IY-Is
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:13:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPb-0003bx-L8
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675285976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzDLW2wIIEuSeH7MPMjSMTFM/i89K9YuJTi44QgwlR0=;
 b=aRCqfbJlbQr2cxzU0Q+sEU6lgBxcB/ZgZcjAy/xfnqEogpRdsCp/Z+1nhFazQJpu11IRxz
 5u2QJMdsbLXIFAp3T53G7snfROBZag8m2vUTquzMEuvDf3ObNDd7buk2WvAXh2YASfEoL8
 HZF51pLDkCxcVr+0/yAMlY+iV7PCMDs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-ASiHeM0NNvic31F5GEs0-w-1; Wed, 01 Feb 2023 16:12:54 -0500
X-MC-Unique: ASiHeM0NNvic31F5GEs0-w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E6CE185A794;
 Wed,  1 Feb 2023 21:12:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3AAC492B05;
 Wed,  1 Feb 2023 21:12:53 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, mjt@tls.msk.ru,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 2/5] docs: differentiate between block driver create and
 runtime opts
Date: Wed,  1 Feb 2023 16:12:31 -0500
Message-Id: <20230201211234.301918-3-stefanha@redhat.com>
In-Reply-To: <20230201211234.301918-1-stefanha@redhat.com>
References: <20230201211234.301918-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Options available with qemu-img create -o ... are called create options.
They affect how the image file is created on disk.

Options available with --blockdev ... are called runtime options. They
affect how the open blockdev behaves.

The documentation makes no distinction is made between the two. For
example, the preallocation filter driver talks about the runtime options
while the image format drivers talk about the create options.

Be explicit about create vs runtime options.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/system/qemu-block-drivers.rst.inc | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index dfe5d2293d..be6eec1eb6 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -6,9 +6,11 @@ any of the tools (like ``qemu-img``). This includes the preferred formats
 raw and qcow2 as well as formats that are supported for compatibility with
 older QEMU versions or other hypervisors.
 
-Depending on the image format, different options can be passed to
-``qemu-img create`` and ``qemu-img convert`` using the ``-o`` option.
-This section describes each format and the options that are supported for it.
+Depending on the image format, different options can be passed to ``qemu-img
+create`` and ``qemu-img convert`` using the ``-o`` option. These are called
+*create options*. Image formats also support different ``--blockdev`` options.
+These are called *runtime options*. This section describes each format and the
+options that are supported for it.
 
 .. program:: image-formats
 .. option:: raw
@@ -20,7 +22,7 @@ This section describes each format and the options that are supported for it.
   space. Use ``qemu-img info`` to know the real size used by the
   image or ``ls -ls`` on Unix/Linux.
 
-  Supported options:
+  Supported create options:
 
   .. program:: raw
   .. option:: preallocation
@@ -181,7 +183,7 @@ This section describes each format and the options that are supported for it.
    When converting QED images to qcow2, you might want to consider using the
    ``lazy_refcounts=on`` option to get a more QED-like behaviour.
 
-   Supported options:
+   Supported create options:
 
    .. program:: qed
    .. option:: backing_file
@@ -212,7 +214,7 @@ This section describes each format and the options that are supported for it.
   Old QEMU image format with support for backing files, compact image files,
   encryption and compression.
 
-  Supported options:
+  Supported create options:
 
    .. program:: qcow
    .. option:: backing_file
@@ -248,7 +250,7 @@ This section describes each format and the options that are supported for it.
 
   LUKS v1 encryption format, compatible with Linux dm-crypt/cryptsetup
 
-  Supported options:
+  Supported create options:
 
   .. program:: luks
   .. option:: key-secret
@@ -289,7 +291,7 @@ This section describes each format and the options that are supported for it.
 
   VirtualBox 1.1 compatible image format.
 
-  Supported options:
+  Supported create options:
 
   .. program:: vdi
   .. option:: static
@@ -302,7 +304,7 @@ This section describes each format and the options that are supported for it.
 
   VMware 3 and 4 compatible image format.
 
-  Supported options:
+  Supported create options:
 
   .. program: vmdk
   .. option:: backing_file
@@ -332,7 +334,7 @@ This section describes each format and the options that are supported for it.
 
   VirtualPC compatible image format (VHD).
 
-  Supported options:
+  Supported create options:
 
   .. program:: vpc
   .. option:: subformat
@@ -345,7 +347,7 @@ This section describes each format and the options that are supported for it.
 
   Hyper-V compatible image format (VHDX).
 
-  Supported options:
+  Supported create options:
 
   .. program:: VHDX
   .. option:: subformat
@@ -920,7 +922,7 @@ some additional tasks, hooking io requests.
   (expanding the protocol file) when writing past the file’s end. This can be
   useful for file-systems with slow allocation.
 
-  Supported options:
+  Supported runtime options:
 
   .. program:: preallocate
   .. option:: prealloc-align
-- 
2.39.1


