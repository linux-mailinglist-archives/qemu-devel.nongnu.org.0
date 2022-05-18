Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1D152B655
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:29:39 +0200 (CEST)
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFzu-0005J9-F9
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFby-0008Fm-OV
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbu-0004NY-6E
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652864689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=So0Ck0PBlIGUIl+Gt+D++S/hXqrdjG39QNv9hWvhAxo=;
 b=AiwAdxHuPDQjEx+BG7Mvqlk2qw6F4dk9ldrfubKi+2fJmYjxy13zrs4lYAMdxzKOIiHfXK
 8en8ODLGn/vpUAg4eEO7ORncXbOVI2jxetN02ouYlmjOBGqxiYcG+tJit9Ffe+mG/LOYrl
 sh4MEjvKTBdkkNODBA1DlW8Zf3G0rts=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-CNQGvgCJMgiK5GpnkSnnJg-1; Wed, 18 May 2022 05:04:45 -0400
X-MC-Unique: CNQGvgCJMgiK5GpnkSnnJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49D7A3C6052D;
 Wed, 18 May 2022 09:04:45 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D87D71410DD5;
 Wed, 18 May 2022 09:04:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 6/8] tests/vm: Add capstone to the NetBSD and OpenBSD VMs
Date: Wed, 18 May 2022 11:04:36 +0200
Message-Id: <20220518090438.158475-7-thuth@redhat.com>
In-Reply-To: <20220518090438.158475-1-thuth@redhat.com>
References: <20220518090438.158475-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The Capstone library that is shipped with NetBSD and OpenBSD works
fine when compiling QEMU, so let's enable this in our build-test
VMs to get a little bit more build-test coverage.

Message-Id: <20220516145823.148450-2-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/netbsd  | 3 ++-
 tests/vm/openbsd | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 4cc58df130..45aa9a7fda 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -46,7 +46,8 @@ class NetBSDVM(basevm.BaseVM):
         "jpeg",
         "png",
 
-	# libs: ui
+        # libs: ui
+        "capstone",
         "SDL2",
         "gtk3+",
         "libxkbcommon",
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index dc34b2718b..13c8254214 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -48,7 +48,8 @@ class OpenBSDVM(basevm.BaseVM):
         "jpeg",
         "png",
 
-	# libs: ui
+        # libs: ui
+        "capstone",
         "sdl2",
         "gtk+3",
         "libxkbcommon",
-- 
2.27.0


