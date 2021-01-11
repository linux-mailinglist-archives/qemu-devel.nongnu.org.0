Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE1A2F162F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:50:02 +0100 (CET)
Received: from localhost ([::1]:34712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxa5-0007zn-Mr
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxUJ-0002h2-00
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxU8-00082S-L1
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610372629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hqdGg1DmuVBLQCME0XMtrCACu1/74eKOoo5haog/gaM=;
 b=Hs1ibNu1lz2KDEUS5LG3ZjSEcAwNGZvw5AOWQG4lZEoafT3knr6gPaVz0KKx7jNIAS4pVs
 N/914/PXV1/YB3Y2hQw+KVsm2mtYvOMj3xah+8zNoCtNcktkqGYUoyeg9aIwGWfRAVKv20
 5IH5m4ixt7H44s80qCeou6UlfWffYUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-5RuXzlPeMkWw78VILk1DzA-1; Mon, 11 Jan 2021 08:43:47 -0500
X-MC-Unique: 5RuXzlPeMkWw78VILk1DzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6BFA19251C1;
 Mon, 11 Jan 2021 13:43:45 +0000 (UTC)
Received: from thuth.com (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCCF317C5F;
 Mon, 11 Jan 2021 13:43:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/15] util/oslib-win32: Fix _aligned_malloc() arguments order
Date: Mon, 11 Jan 2021 14:43:16 +0100
Message-Id: <20210111134328.157775-4-thuth@redhat.com>
In-Reply-To: <20210111134328.157775-1-thuth@redhat.com>
References: <20210111134328.157775-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Warner Losh <imp@freebsd.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit dfbd0b873a8 inadvertently swapped the arguments
of _aligned_malloc(), correct it to fix [*]:

  G_TEST_SRCDIR=C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/tests
  G_TEST_BUILDDIR=C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/build/tests
  tests/test-qht.exe --tap -k
  ERROR test-qht - too few tests run (expected 2, got 0)
  make: *** [Makefile.mtest:256: run-test-30] Error 1

[*] https://cirrus-ci.com/task/6055645751279616?command=test#L593

Fixes: dfbd0b873a8 ("util/oslib-win32: Use _aligned_malloc for qemu_try_memalign")
Reported-by: Yonggang Luo <luoyonggang@gmail.com>
Reported-by: Volker Rümelin <vr_qemu@t-online.de>
Suggested-by: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20210111001606.1122983-1-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 util/oslib-win32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index e6f83e10ed..f68b8012bb 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -59,7 +59,7 @@ void *qemu_try_memalign(size_t alignment, size_t size)
 
     g_assert(size != 0);
     g_assert(is_power_of_2(alignment));
-    ptr = _aligned_malloc(alignment, size);
+    ptr = _aligned_malloc(size, alignment);
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
 }
-- 
2.27.0


