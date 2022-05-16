Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442C252885A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:18:39 +0200 (CEST)
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcUY-0002Ys-Ci
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqcB9-0006Qj-0Q
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:58:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqcB5-0001Sl-As
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652713110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yc04DmIrdWqFUxElNJcQamGpuXRop+AjQTvHTWm6mo0=;
 b=SEzTNwTZO7mvJm0oieKRhQ69qmMOFbkRDYY9zYJvDLqW59HWM0nlVcHCbcNyDThyCYTjK0
 G54sgOMTq3/o8hBxlmmeNMsP+T3rS2afcn2MkVYUVhXHnXDKoKmspBy0rxAp5m5W7aA7MV
 XXv5maVW1pilys9Ji1Ibxaw+5W0mu+s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-1-0eee3HPZWqg1jAwLQ2_Q-1; Mon, 16 May 2022 10:58:28 -0400
X-MC-Unique: 1-0eee3HPZWqg1jAwLQ2_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A02929ABA24;
 Mon, 16 May 2022 14:58:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10A6715088CE;
 Mon, 16 May 2022 14:58:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/3] tests/vm: Add capstone to the NetBSD and OpenBSD VMs
Date: Mon, 16 May 2022 16:58:21 +0200
Message-Id: <20220516145823.148450-2-thuth@redhat.com>
In-Reply-To: <20220516145823.148450-1-thuth@redhat.com>
References: <20220516145823.148450-1-thuth@redhat.com>
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


