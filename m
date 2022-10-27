Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5044360FF6E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:38:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6jf-0007Sn-Oz; Thu, 27 Oct 2022 13:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jP-0006hg-HE
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jN-0000yT-UY
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZN4otH6OYdNYiEpCHYHTLI1HOMAHNTbt9cJvAZR4+Ck=;
 b=fYRV+QtdReAp4GIYN6okX9StAuAUhjWLbYEZFyRuLUiCXasOtnmLZEVttNSw2qJAVmHgEg
 BQtkZWSKodVrRY5BIRWVZlDbGxk387gljW/d9fXVzLDQq3mZKn+AvmRluTAkqlzfh7T+R9
 7+uXqhGIFM4hBOfdIeQWJKLtwdc9Yj8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-lNiaW8tbNvKx544lIGbUBQ-1; Thu, 27 Oct 2022 13:31:38 -0400
X-MC-Unique: lNiaW8tbNvKx544lIGbUBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5902895222;
 Thu, 27 Oct 2022 17:31:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B603D414A809;
 Thu, 27 Oct 2022 17:31:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/20] seccomp: Get actual errno value from failed seccomp
 functions
Date: Thu, 27 Oct 2022 18:30:49 +0100
Message-Id: <20221027173103.299479-7-berrange@redhat.com>
In-Reply-To: <20221027173103.299479-1-berrange@redhat.com>
References: <20221027173103.299479-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michal Privoznik <mprivozn@redhat.com>

Upon failure, a libseccomp API returns actual errno value very
rarely. Fortunately, after its commit 34bf78ab (contained in
2.5.0 release), the SCMP_FLTATR_API_SYSRAWRC attribute can be set
which makes subsequent APIs return true errno on failure.

This is especially critical when seccomp_load() fails, because
generic -ECANCELED says nothing.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build            |  9 +++++++++
 softmmu/qemu-seccomp.c | 13 +++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/meson.build b/meson.build
index b686dfef75..5f114c89d9 100644
--- a/meson.build
+++ b/meson.build
@@ -636,10 +636,16 @@ if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
 endif
 
 seccomp = not_found
+seccomp_has_sysrawrc = false
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
                        required: get_option('seccomp'),
                        method: 'pkg-config', kwargs: static_kwargs)
+  if seccomp.found()
+    seccomp_has_sysrawrc = cc.has_header_symbol('seccomp.h',
+                                                'SCMP_FLTATR_API_SYSRAWRC',
+                                                dependencies: seccomp)
+  endif
 endif
 
 libcap_ng = not_found
@@ -1849,6 +1855,9 @@ config_host_data.set('CONFIG_RDMA', rdma.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_SECCOMP', seccomp.found())
+if seccomp.found()
+  config_host_data.set('CONFIG_SECCOMP_SYSRAWRC', seccomp_has_sysrawrc)
+endif
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_TPM', have_tpm)
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index deaf8a4ef5..d66a2a1226 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -312,6 +312,19 @@ static int seccomp_start(uint32_t seccomp_opts, Error **errp)
         goto seccomp_return;
     }
 
+#if defined(CONFIG_SECCOMP_SYSRAWRC)
+    /*
+     * This must be the first seccomp_attr_set() call to have full
+     * error propagation from subsequent seccomp APIs.
+     */
+    rc = seccomp_attr_set(ctx, SCMP_FLTATR_API_SYSRAWRC, 1);
+    if (rc != 0) {
+        error_setg_errno(errp, -rc,
+                         "failed to set seccomp rawrc attribute");
+        goto seccomp_return;
+    }
+#endif
+
     rc = seccomp_attr_set(ctx, SCMP_FLTATR_CTL_TSYNC, 1);
     if (rc != 0) {
         error_setg_errno(errp, -rc,
-- 
2.37.3


