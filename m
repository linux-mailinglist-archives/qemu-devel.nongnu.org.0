Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13285793FA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:19:30 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhVv-0002CX-WF
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHT-0002Ou-RP
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHS-0002zm-CU
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbOfIaYvUeCxcORd+nTPkzUQYbT1CCjsSqP7XcqQOTY=;
 b=EDW6JU8vh07bpQkHs1Yk/ELc2zxZgdaKMsz5eh9G9/ykSxLMMEu+aDEqLLJPw+5hfG0pCc
 1edH55+FqjBU7/byzhX4o9pfB7AUltqqEKgwwTgNv9Y8bTwLcKJX6K7+g7N/I/7rm6FthW
 HenQbzhnRN4PdVHJMRDQqgrA1s1djfI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-PIfTBFUBNnK3_wgIV--6eA-1; Tue, 19 Jul 2022 03:04:26 -0400
X-MC-Unique: PIfTBFUBNnK3_wgIV--6eA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4422B3810783;
 Tue, 19 Jul 2022 07:04:26 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EAAE40CFD0A;
 Tue, 19 Jul 2022 07:04:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 13/14] util: Fix broken build on Haiku
Date: Tue, 19 Jul 2022 09:04:11 +0200
Message-Id: <20220719070412.16757-14-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
References: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

A recent commit moved some Haiku-specific code parts from oslib-posix.c
to cutils.c, but failed to move the corresponding header #include
statement, too, so "make vm-build-haiku.x86_64" is currently broken.
Fix it by moving the header #include, too.

Fixes: 06680b15b4 ("include: move qemu_*_exec_dir() to cutils")
Message-Id: <20220718172026.139004-1-thuth@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 util/cutils.c      | 4 ++++
 util/oslib-posix.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index 8199dac598..cb43dda213 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -35,6 +35,10 @@
 #include <sys/sysctl.h>
 #endif
 
+#ifdef __HAIKU__
+#include <kernel/image.h>
+#endif
+
 #ifdef G_OS_WIN32
 #include <pathcch.h>
 #include <wchar.h>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 7a34c1657c..bffec18869 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -62,10 +62,6 @@
 #include <mach-o/dyld.h>
 #endif
 
-#ifdef __HAIKU__
-#include <kernel/image.h>
-#endif
-
 #include "qemu/mmap-alloc.h"
 
 #ifdef CONFIG_DEBUG_STACK_USAGE
-- 
2.31.1


