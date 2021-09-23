Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F20415C60
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:58:38 +0200 (CEST)
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMR3-0006sZ-Mq
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mTMO7-0003Vc-Bj
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mTMO5-0000mP-TC
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632394533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzoUTsFLtkJspbJAhM96eE+9Rjia4zxVCbXKjsR3Mjg=;
 b=HoP1T16QEulJ4BVmDy/Zf0Cqfez0dmoq9ty9CHuAanWt5E9HJ+rB0ZDE4yqrS10siz00Uq
 QH8ZuNQpvNDVDDfndKmFS5jidAb4aNfYlBDkFxGjW7VF6x8qi+qMuZd5xKd/Ma4dCz2oV/
 IlHw+RVxNnD4AA316DcTXOxD/JMdN78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-WbUmh5aPN7KMkd97OurnCA-1; Thu, 23 Sep 2021 06:55:31 -0400
X-MC-Unique: WbUmh5aPN7KMkd97OurnCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA76781426E;
 Thu, 23 Sep 2021 10:55:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AE42226E8;
 Thu, 23 Sep 2021 10:55:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] meson: unpack edk2 firmware even if --disable-blobs
Date: Thu, 23 Sep 2021 06:55:28 -0400
Message-Id: <20210923105529.3845741-1-pbonzini@redhat.com>
In-Reply-To: <20210923105451.3845510-1-pbonzini@redhat.com>
References: <20210923105451.3845510-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The edk2 firmware blobs are needed to run bios-tables-test.  Unpack
them if any UEFI-enabled target is selected, so that the test can run.
This is a bit more than is actually necessary, since bios-tables-test
does not run for all UEFI-enabled targets, but it is the easiest
way to write this logic.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                     | 16 ++++++++--------
 pc-bios/descriptors/meson.build |  4 ++--
 pc-bios/meson.build             |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meson.build b/meson.build
index 3945a6cc2d..4cd8b67ad0 100644
--- a/meson.build
+++ b/meson.build
@@ -95,15 +95,15 @@ if targetos != 'darwin'
 endif
 
 edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
-install_edk2_blobs = false
-if get_option('install_blobs')
-  foreach target : target_dirs
-    install_edk2_blobs = install_edk2_blobs or target in edk2_targets
-  endforeach
-endif
+unpack_edk2_blobs = false
+foreach target : edk2_targets
+  if target in target_dirs
+    bzip2 = find_program('bzip2', required: get_option('install_blobs'))
+    unpack_edk2_blobs = bzip2.found()
+    break
+  endif
+endforeach
 
-bzip2 = find_program('bzip2', required: install_edk2_blobs)
-
 ##################
 # Compiler flags #
 ##################
diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
index 29efa16d99..66f85d01c4 100644
--- a/pc-bios/descriptors/meson.build
+++ b/pc-bios/descriptors/meson.build
@@ -1,4 +1,4 @@
-if install_edk2_blobs
+if unpack_edk2_blobs and get_option('install_blobs')
   foreach f: [
     '50-edk2-i386-secure.json',
     '50-edk2-x86_64-secure.json',
@@ -10,7 +10,7 @@ if install_edk2_blobs
     configure_file(input: files(f),
                    output: f,
                    configuration: {'DATADIR': get_option('prefix') / qemu_datadir},
-                   install: get_option('install_blobs'),
+                   install: true,
                    install_dir: qemu_datadir / 'firmware')
   endforeach
 endif
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index f2b32598af..a3b3d87891 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -1,4 +1,4 @@
-if install_edk2_blobs
+if unpack_edk2_blobs
   fds = [
     'edk2-aarch64-code.fd',
     'edk2-arm-code.fd',
-- 
2.27.0



