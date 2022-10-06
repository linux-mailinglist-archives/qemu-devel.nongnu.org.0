Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F18E5F635B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:14:56 +0200 (CEST)
Received: from localhost ([::1]:37982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMxz-00015q-A9
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogMJw-0006Gz-Qt
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:33:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogMJs-0005xR-C3
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665045207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5tSyFqD28vxVxyyVk01ZmeFc6UN2uhtvrjU5y9XMP7w=;
 b=DHFwI4RlRQ9NZCMBRAx4gOJ13zVD5bGXoTf3Npxj7qZ68czZAjX9ccz3kKUgykL27cHSd2
 J7T9TaC18R94WFKaOFVFzlwJ26SonBOhDXpAJTBgc5MVoR1qd9jiokzfEiDAqjsoqvFBpD
 TgIYfkKCE0i5h6ZpoWrz/bSILb1oO/c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-jlOTrTO9P564qXX_U-D2xQ-1; Thu, 06 Oct 2022 04:33:26 -0400
X-MC-Unique: jlOTrTO9P564qXX_U-D2xQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3B62185A7AB;
 Thu,  6 Oct 2022 08:33:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB43DC15BA4;
 Thu,  6 Oct 2022 08:33:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: jb-gnumlists@wisemo.com, thuth@redhat.com, jasowang@redhat.com,
 qemu_oss@crudebyte.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2] build-sys: error when slirp is not found and not disabled
Date: Thu,  6 Oct 2022 12:33:22 +0400
Message-Id: <20221006083322.2612639-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is an alternative configure-time solution to "[PATCH] net:
print a more actionable error when slirp is not found".

See also "If your networking is failing after updating to the latest git
version of QEMU..." ML thread.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meson.build b/meson.build
index 4321b8f8da..b05080b051 100644
--- a/meson.build
+++ b/meson.build
@@ -690,6 +690,13 @@ if not get_option('slirp').auto() or have_system
   endif
 endif
 
+# Remove this error after QEMU 8.1 has been released.
+if not get_option('slirp').disabled() and not slirp.found()
+  error('libslirp is not explicitely disabled and was not found. ' +
+        'Since qemu 7.2, libslirp is no longer included as a submodule ' +
+        'fallback, you must install it on your system or --disable-slirp.')
+endif
+
 vde = not_found
 if not get_option('vde').auto() or have_system or have_tools
   vde = cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
-- 
2.37.3


