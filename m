Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DE56A8658
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:29:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlo4-00047w-Uk; Thu, 02 Mar 2023 11:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pXlnw-00043F-3p
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:29:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pXlnu-00066g-Jt
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LcOjsfw4RqfZOPzhp+nJz1hLQXzqOpV5lgeqxeKcxeo=;
 b=AU7ULHdm/cIpt0XwOuVW9Rf0aRCkmwCJqK6bVuarS7nL2bO/ckqzYnmUs/1UyJ5zcZR+xj
 2VnTeoXyESg8hyVGAwSjIln/oIBSU/eQjg7nj+zoJ85+0Kz6ObZur5CMQMdAfV9SK09Xt+
 vjeZBB5/B3cxYkUJzPeNCcLeTSIgndo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-9ltTy6gsMRWJQHHics9JsA-1; Thu, 02 Mar 2023 11:29:12 -0500
X-MC-Unique: 9ltTy6gsMRWJQHHics9JsA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06DDC858F09;
 Thu,  2 Mar 2023 16:29:12 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E2372026D4B;
 Thu,  2 Mar 2023 16:29:11 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PATCH] tcg: Include "qemu/timer.h" for profile_getclock
Date: Thu,  2 Mar 2023 16:29:09 +0000
Message-Id: <20230302162909.3267074-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
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

When CONFIG_PROFILER is set there are various undefined references to
profile_getclock.  Include the header which defines this function.

For example:

../tcg/tcg.c: In function ‘tcg_gen_code’:
../tcg/tcg.c:4905:51: warning: implicit declaration of function ‘profile_getclock’ [-Wimplicit-function-declaration]
 4905 |     qatomic_set(&prof->opt_time, prof->opt_time - profile_getclock());
      |                                                   ^~~~~~~~~~~~~~~~

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 tcg/tcg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5cccc06ae3..6b830ade4c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -36,6 +36,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/cacheflush.h"
 #include "qemu/cacheinfo.h"
+#include "qemu/timer.h"
 
 /* Note: the long term plan is to reduce the dependencies on the QEMU
    CPU definitions. Currently they are used for qemu_ld/st
-- 
2.39.2


