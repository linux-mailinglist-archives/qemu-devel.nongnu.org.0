Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D476A40CE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbpR-0007RF-6T; Mon, 27 Feb 2023 06:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboY-0005uL-9F
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboV-0005in-En
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFyqSE77x/lb5S+4fZTLjLQ+XpLZl2e0Anp7H7hasUk=;
 b=R+oHg1wa+O09qYNUd7y+xXK1eimzTTWB3NzPa9gkfN8LFsE9RLKCQnwurcidHeyj2Jiy5G
 CBGscG+Qwau9Tmf6bwNg71KsJujk6Qj2k4l9KLvK9HjlsdMZIT3FfOapyn8jytDWJlDwjl
 iJzdklVpxAJHGyemdvPYYvWKspfXNL0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-cHSGs_TAM1Ov9BtxhFhaOQ-1; Mon, 27 Feb 2023 06:36:55 -0500
X-MC-Unique: cHSGs_TAM1Ov9BtxhFhaOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A20E829AA3BB;
 Mon, 27 Feb 2023 11:36:54 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B57C21121314;
 Mon, 27 Feb 2023 11:36:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Steve Sistare <steven.sistare@oracle.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 26/33] meson: fix dependency on qemu-keymap
Date: Mon, 27 Feb 2023 12:36:14 +0100
Message-Id: <20230227113621.58468-27-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Steve Sistare <steven.sistare@oracle.com>

When qemu-keymap is not available on the host, and enable-xkbcommon
is specified, parallel make fails with:

  % make clean
  ...
  % make -j 32
  ...
  FAILED: pc-bios/keymaps/is
  ./qemu-keymap -f pc-bios/keymaps/is -l is
  /bin/sh: ./qemu-keymap: No such file or directory
  ... many similar messages ...

The code always runs find_program, rather than waiting to build
qemu-keymap, because it looks for CONFIG_XKBCOMMON in config_host
rather than config_host_data.  Making serially succeeds, by soft
linking files from pc-bios/keymaps, but that is not the desired
result for enable-xkbcommon.

Examining all occurrences of 'in config_host' for similar bugs shows one
instance in the docs, which is also fixed here.

Fixes: 4113f4cfee ("meson: move xkbcommon to meson")

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <1675708442-74966-1-git-send-email-steven.sistare@oracle.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/kconfig.rst      | 2 +-
 pc-bios/keymaps/meson.build | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index 69674d008a..cc1a456edf 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -306,6 +306,6 @@ variable::
 
     host_kconfig = \
       (have_tpm ? ['CONFIG_TPM=y'] : []) + \
-      ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
+      ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
       (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
       ...
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 06c75e646b..158a3b410c 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -33,7 +33,7 @@ keymaps = {
   'tr': '-l tr',
 }
 
-if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in config_host
+if meson.is_cross_build() or not xkbcommon.found()
   native_qemu_keymap = find_program('qemu-keymap', required: false, disabler: true)
 else
   native_qemu_keymap = qemu_keymap
-- 
2.31.1


