Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C7E2F20EB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 21:36:33 +0100 (CET)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz3vT-00006E-Tk
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 15:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kz3sp-00084c-9p
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 15:33:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kz3sm-0002Cm-At
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 15:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610397222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZvuYC/PlqY5gmoh/A3aa5lYpn2jvm9KfOXjPjNNvGeA=;
 b=KuTVGcWIScbsxgBCJ0+IKkhkNV1/QLasAqla5LmsJDrT4barEXebjv39KUMzc240+DzRB4
 bukEDb3GM3bUsTk2vPsxBKbqHQcpjngAs4HQmTjYhnnRWsZwVhmq5HoN464IVxPRQGq8qP
 cImQ5B9WFwkPmS1bbcrumspz+22zVqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-1UaxNwpvPyWUqLb0PDu7FA-1; Mon, 11 Jan 2021 15:33:40 -0500
X-MC-Unique: 1UaxNwpvPyWUqLb0PDu7FA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51A4384A5EF
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 20:33:38 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77F4A6F13C;
 Mon, 11 Jan 2021 20:33:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Deprecate pmem=on with non-DAX capable backend file
Date: Mon, 11 Jan 2021 15:33:32 -0500
Message-Id: <20210111203332.740815-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, pbonzini@redhat.com, thuth@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not safe to pretend that emulated NVDIMM supports
persistence while backend actually failed to enable it
and used non-persistent mapping as fall back.
Instead of falling-back, QEMU should be more strict and
error out with clear message that it's not supported.
So if user asks for persistence (pmem=on), they should
store backing file on NVDIMM.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2:
  rephrase deprecation comment andwarning message
  (Philippe Mathieu-Daudé <philmd@redhat.com>)
---
 docs/system/deprecated.rst | 17 +++++++++++++++++
 util/mmap-alloc.c          |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index bacd76d7a5..e79fb02b3a 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -327,6 +327,23 @@ The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
 to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
 machines have been renamed ``raspi2b`` and ``raspi3b``.
 
+Backend options
+---------------
+
+Using non-persistent backing file with pmem=on (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+This option is used when ``memory-backend-file`` is consumed by emulated NVDIMM
+device. However enabling ``memory-backend-file.pmem`` option, when backing file
+is (a) not DAX capable or (b) not on a filesystem that support direct mapping
+of persistent memory, is not safe and may lead to data loss or corruption in case
+of host crash.
+Options are:
+    - modify VM configuration to set ``pmem=off`` to continue using fake NVDIMM
+      (without persistence guaranties) with backing file on non DAX storage
+    - move backing file to NVDIMM storage and keep ``pmem=on``
+      (to have NVDIMM with persistence guaranties).
+
 Device options
 --------------
 
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 27dcccd8ec..0388cc3be2 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/mmap-alloc.h"
 #include "qemu/host-utils.h"
+#include "qemu/error-report.h"
 
 #define HUGETLBFS_MAGIC       0x958458f6
 
@@ -166,6 +167,8 @@ void *qemu_ram_mmap(int fd,
                     "crash.\n", file_name);
             g_free(proc_link);
             g_free(file_name);
+            warn_report("Using non DAX backing file with 'pmem=on' option"
+                        " is deprecated");
         }
         /*
          * if map failed with MAP_SHARED_VALIDATE | MAP_SYNC,
-- 
2.27.0


