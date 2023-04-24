Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CAE6ED3F9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 19:56:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr0PY-00080y-TK; Mon, 24 Apr 2023 13:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pr0PW-000809-EV
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pr0PT-0007ty-VV
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682358931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DyRg2nO17XfSte2Qiq60HFpJmMSh6St95+0xBJuJYUw=;
 b=Xrnfssi5U2Q1KsH97gYW9oMOp4CMxR67rROYvgnU9qRFc3GY0lfMwe90DDWgxJ9jC9M7yh
 Xh6zD4w5ebqJ211d78UfnGK9744ZaL6H95JLs3CUkq+yXRKAH6HHLOE8fg+lSWXIdC30kz
 mkzpoApyDfXG4a5I3gk7lF4AHGwgqvc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-oAnBs-z6NrSCL3WqXhLh2g-1; Mon, 24 Apr 2023 13:55:23 -0400
X-MC-Unique: oAnBs-z6NrSCL3WqXhLh2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F4C23C02B70;
 Mon, 24 Apr 2023 17:55:23 +0000 (UTC)
Received: from localhost (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A65C22027043;
 Mon, 24 Apr 2023 17:55:22 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 1/2] block/dmg: Declare a type definition for DMG uncompress
 function
Date: Mon, 24 Apr 2023 13:55:17 -0400
Message-Id: <20230424175518.325931-2-stefanha@redhat.com>
In-Reply-To: <20230424175518.325931-1-stefanha@redhat.com>
References: <20230424175518.325931-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Introduce the BdrvDmgUncompressFunc type defintion. To emphasis
dmg_uncompress_bz2 and dmg_uncompress_lzfse are pointer to functions,
declare them using this new typedef.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230320152610.32052-1-philmd@linaro.org
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/dmg.h | 8 ++++----
 block/dmg.c | 7 ++-----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/block/dmg.h b/block/dmg.h
index e488601b62..dcd6165e63 100644
--- a/block/dmg.h
+++ b/block/dmg.h
@@ -51,10 +51,10 @@ typedef struct BDRVDMGState {
     z_stream zstream;
 } BDRVDMGState;
 
-extern int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
-                                 char *next_out, unsigned int avail_out);
+typedef int BdrvDmgUncompressFunc(char *next_in, unsigned int avail_in,
+                                  char *next_out, unsigned int avail_out);
 
-extern int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
-                                   char *next_out, unsigned int avail_out);
+extern BdrvDmgUncompressFunc *dmg_uncompress_bz2;
+extern BdrvDmgUncompressFunc *dmg_uncompress_lzfse;
 
 #endif
diff --git a/block/dmg.c b/block/dmg.c
index e10b9a2ba5..2769900359 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -31,11 +31,8 @@
 #include "qemu/memalign.h"
 #include "dmg.h"
 
-int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
-                          char *next_out, unsigned int avail_out);
-
-int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
-                            char *next_out, unsigned int avail_out);
+BdrvDmgUncompressFunc *dmg_uncompress_bz2;
+BdrvDmgUncompressFunc *dmg_uncompress_lzfse;
 
 enum {
     /* Limit chunk sizes to prevent unreasonable amounts of memory being used
-- 
2.39.2


