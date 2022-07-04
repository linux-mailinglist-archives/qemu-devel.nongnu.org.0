Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05295659C2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:28:03 +0200 (CEST)
Received: from localhost ([::1]:46294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NzW-0005Mr-MW
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nv2-0005Ti-Ng
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nv1-0002NW-AF
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cz3FLXYsv9LD+2zT1u+KWE/qqaCdb6vlf39nVdM7GxM=;
 b=XLEmuN5uc+GrYYiXdcTbm+upiOP1fjlDCRTEj5lrngVthyBbWHQRlREQ8d0INE/gSZcx0U
 FtxFnJSu9BoTPZ7oqjAuPNDXaRQobYTSEDRD+IU4PxeiPXUhuQrgNGZGSuLX9YFccAg1Mt
 D9KnpVyhQ8TxNtsRCZ9atv1uMF6Rq0M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-wOXADXa0P4Sc1r3WmuatmQ-1; Mon, 04 Jul 2022 11:23:21 -0400
X-MC-Unique: wOXADXa0P4Sc1r3WmuatmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4181D185A7B2;
 Mon,  4 Jul 2022 15:23:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D77EBC28100;
 Mon,  4 Jul 2022 15:23:19 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 7/7] tests/style: check qemu/osdep.h is included in all .c
 files
Date: Mon,  4 Jul 2022 16:23:03 +0100
Message-Id: <20220704152303.760983-8-berrange@redhat.com>
In-Reply-To: <20220704152303.760983-1-berrange@redhat.com>
References: <20220704152303.760983-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/style-excludes.mak | 17 +++++++++++++++++
 tests/style.mak          |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/tests/style-excludes.mak b/tests/style-excludes.mak
index 931dd03a64..df158e1d9d 100644
--- a/tests/style-excludes.mak
+++ b/tests/style-excludes.mak
@@ -14,3 +14,20 @@ exclude_file_name_regexp--sc_prohibit_doubled_word = \
 	tests/qemu-iotests/142(\.out)? \
 	tests/qtest/arm-cpu-features\.c \
 	ui/cursor\.c
+
+exclude_file_name_regexp--sc_c_file_osdep_h = \
+	contrib/plugins/.* \
+	linux-user/(mips64|x86_64)/(signal|cpu_loop)\.c \
+	pc-bios/.* \
+	scripts/coverity-scan/model\.c \
+	scripts/xen-detect\.c \
+	subprojects/.* \
+	target/hexagon/(gen_semantics|gen_dectree_import)\.c \
+	target/s390x/gen-features\.c \
+	tests/migration/s390x/a-b-bios\.c \
+	tests/multiboot/.* \
+	tests/plugin/.* \
+	tests/tcg/.* \
+	tests/uefi-test-tools/.* \
+	tests/unit/test-rcu-(simpleq|slist|tailq)\.c \
+	tools/ebpf/rss.bpf.c
diff --git a/tests/style.mak b/tests/style.mak
index 4056bde619..301d978155 100644
--- a/tests/style.mak
+++ b/tests/style.mak
@@ -52,3 +52,9 @@ sc_prohibit_doubled_word:
 	  | $(GREP) .							\
 	  && { echo '$(ME): doubled words' 1>&2; exit 1; }		\
 	  || :
+
+sc_c_file_osdep_h:
+	@require='#include "qemu/osdep.h"' \
+	in_vc_files='\.c$$' \
+	halt='all C files must include qemu/osdep.h' \
+	$(_sc_search_regexp)
-- 
2.36.1


