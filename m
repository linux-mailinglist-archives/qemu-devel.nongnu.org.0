Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2832DE010
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 09:48:17 +0100 (CET)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqBQu-0003Tt-Rd
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 03:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kqBPB-00029M-59
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 03:46:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kqBP8-0006gq-FI
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 03:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608281185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k+JmyO48+c9gEjL6UWUwjF20x7FMzKNXH3jgSk7bJJg=;
 b=Ja9MkLts4+Ky6xnduWpSnzVuGUtHXEwiC9rUEM45sRfxOUjK/sm7u3sp7csw6v1muOcjOd
 l2CUXqRkLtPVhy9PMbYudymofClw5zyM+C/P7hbxqomUgD5rw31uGTaI5TnGN1TGBu3s9w
 A0u57fqjQpreh6IJHlBuTKyZMm53zk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-ndtXIYrwMcysvcJrKC8H_A-1; Fri, 18 Dec 2020 03:46:21 -0500
X-MC-Unique: ndtXIYrwMcysvcJrKC8H_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3D0F800D55;
 Fri, 18 Dec 2020 08:46:19 +0000 (UTC)
Received: from localhost (unknown [10.36.110.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE6A960C15;
 Fri, 18 Dec 2020 08:46:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] whpx: fix compilation
Date: Fri, 18 Dec 2020 12:46:11 +0400
Message-Id: <20201218084611.634254-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, sunilmut@microsoft.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When compiling WHPX (on msys2)

FAILED: libqemu-x86_64-softmmu.fa.p/target_i386_whpx_whpx-all.c.obj
../target/i386/whpx/whpx-all.c:29:10: fatal error: whp-dispatch.h: No such file or directory
   29 | #include "whp-dispatch.h"
      |          ^~~~~~~~~~~~~~~~

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/sysemu/whpx.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 9346fd92e9..79ab3d73cf 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -15,7 +15,9 @@
 
 #ifdef CONFIG_WHPX
 
-#include "whp-dispatch.h"
+#include <windows.h>
+#include <WinHvPlatform.h>
+#include <WinHvEmulation.h>
 
 struct whpx_state {
     uint64_t mem_quota;
-- 
2.29.0


