Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34B56A888
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 18:46:47 +0200 (CEST)
Received: from localhost ([::1]:54004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9UeM-0000O6-Sm
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 12:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UVw-0008Sj-8i
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UVp-0006nk-CX
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657211874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SntZfyZnnODfKVkCXVO1fSkhca/EX/tEr2CvULvE+ms=;
 b=MFHHe/wByndJpGE1T/d6fv51+aynaDyxoqH7lCGL/HfixcV4DM7FpMpU+mqZxbr6dMxwLk
 HwYiQR2ItTnfwnIn/JObAGLIu8Id857SjQHdqANj/m6wK7FZSUAaHAHn2TU7/RUlUTX0Si
 UwvsL16G5ud06DbbDKcTwzDW34eiiEs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-StqnwGDHNxSepUoDNZ1DKQ-1; Thu, 07 Jul 2022 12:37:51 -0400
X-MC-Unique: StqnwGDHNxSepUoDNZ1DKQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D86B1C1AD55;
 Thu,  7 Jul 2022 16:37:35 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D43DE492C3B;
 Thu,  7 Jul 2022 16:37:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 7/9] tests/style: check qemu/osdep.h is included in all .c
 files
Date: Thu,  7 Jul 2022 17:37:18 +0100
Message-Id: <20220707163720.1421716-8-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-1-berrange@redhat.com>
References: <20220707163720.1421716-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

The qemu/osdep.h file must be included as the very first header in
all C source files, to ensure its definitions take effect over all
other header files, including system headers.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/style.yml | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/tests/style.yml b/tests/style.yml
index d06c55bb29..6d91ac6115 100644
--- a/tests/style.yml
+++ b/tests/style.yml
@@ -120,4 +120,26 @@ double_words:
     - pc-bios/
     - qemu-options\.hx
     - scripts/checkpatch\.pl
-    - tests/qtest/arm-cpu-features\.c
\ No newline at end of file
+    - tests/qtest/arm-cpu-features\.c
+
+osdep_h_in_source:
+  multiline: true
+  files: \.c$
+  require: ^((?!#include)[^\n]*\n)*#include "qemu/osdep.h"
+  message: all C source files must include qemu/osdep.h, as the first header
+  ignore:
+    - contrib/plugins/.*
+    - linux-user/(mips64|x86_64)/(signal|cpu_loop)\.c
+    - pc-bios/.*
+    - scripts/coverity-scan/model\.c
+    - scripts/xen-detect\.c
+    - subprojects/.*
+    - target/hexagon/(gen_semantics|gen_dectree_import)\.c
+    - target/s390x/gen-features\.c
+    - tests/migration/s390x/a-b-bios\.c
+    - tests/multiboot/.*
+    - tests/plugin/.*
+    - tests/tcg/.*
+    - tests/uefi-test-tools/.*
+    - tests/unit/test-rcu-(simpleq|slist|tailq)\.c
+    - tools/ebpf/rss.bpf.c
-- 
2.36.1


