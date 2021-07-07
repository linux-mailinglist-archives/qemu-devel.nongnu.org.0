Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC08A3BF04E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:34:57 +0200 (CEST)
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DJw-0003ML-MO
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1DHv-0001DZ-Vm
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1DHt-0007c7-5R
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625686367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXrAFMnrKnwrkhFdDtPiujztDYX2W+xq4SoIb47z0Oo=;
 b=FrsuCIO6Y6P3dLsZOpKEWOmxIlPgC7ugRVgRjezk+d81uxvpq49g2p4sHmxSdcbdhUX1bj
 WJUWN3WNVtgcMm2meQFV90lzsrly30ObDfEup1eF9pXG/LqfOsAaSFZXo8qpNiow3op29P
 4XmHNToVsl6ti5F19inWqCTL6ntG8JE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-XcWTXugRP1S8nJ2y5XuyZw-1; Wed, 07 Jul 2021 15:32:45 -0400
X-MC-Unique: XcWTXugRP1S8nJ2y5XuyZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD20B1932489;
 Wed,  7 Jul 2021 19:32:44 +0000 (UTC)
Received: from localhost (ovpn-113-79.rdu2.redhat.com [10.10.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81BC35D705;
 Wed,  7 Jul 2021 19:32:44 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 02/15] Deprecate pmem=on with non-DAX capable backend file
Date: Wed,  7 Jul 2021 15:32:28 -0400
Message-Id: <20210707193241.2659335-3-ehabkost@redhat.com>
In-Reply-To: <20210707193241.2659335-1-ehabkost@redhat.com>
References: <20210707193241.2659335-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

It is not safe to pretend that emulated NVDIMM supports
persistence while backend actually failed to enable it
and used non-persistent mapping as fall back.
Instead of falling-back, QEMU should be more strict and
error out with clear message that it's not supported.
So if user asks for persistence (pmem=on), they should
store backing file on NVDIMM.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210111203332.740815-1-imammedo@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/system/deprecated.rst | 18 ++++++++++++++++++
 util/mmap-alloc.c          |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 70e08baff62..94fb7dbf4e6 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -221,6 +221,24 @@ This machine is deprecated because we have enough AST2500 based OpenPOWER
 machines. It can be easily replaced by the ``witherspoon-bmc`` or the
 ``romulus-bmc`` machines.
 
+Backend options
+---------------
+
+Using non-persistent backing file with pmem=on (since 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+This option is used when ``memory-backend-file`` is consumed by emulated NVDIMM
+device. However enabling ``memory-backend-file.pmem`` option, when backing file
+is (a) not DAX capable or (b) not on a filesystem that support direct mapping
+of persistent memory, is not safe and may lead to data loss or corruption in case
+of host crash.
+Options are:
+
+    - modify VM configuration to set ``pmem=off`` to continue using fake NVDIMM
+      (without persistence guaranties) with backing file on non DAX storage
+    - move backing file to NVDIMM storage and keep ``pmem=on``
+      (to have NVDIMM with persistence guaranties).
+
 Device options
 --------------
 
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 838e286ce51..893d864354a 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -225,6 +225,8 @@ static void *mmap_activate(void *ptr, size_t size, int fd,
                     "crash.\n", file_name);
             g_free(proc_link);
             g_free(file_name);
+            warn_report("Using non DAX backing file with 'pmem=on' option"
+                        " is deprecated");
         }
         /*
          * If mmap failed with MAP_SHARED_VALIDATE | MAP_SYNC, we will try
-- 
2.31.1


