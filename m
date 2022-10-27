Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCBB61008D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:43:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7fo-00017g-QG; Thu, 27 Oct 2022 14:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7fj-00015Q-QV
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7fi-0002KZ-C5
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HB14wvxuhK564HbnzsLU8faVQmtpZhwhu/zHxdFJp+U=;
 b=hq5p48MKXOSCtPVY3D/A32Dv8qES9Xjl7xN6TRdLxqZ3JhH6UFUXFDyq3cMOOTzVMpISem
 nT6GCsaCe9rLkfm5KLVFdAat3aiDaakSN7CeLnY/wn00yfwpedlivzXzB1ZIimNFRMj3Lw
 qS2qzfCtcC2iBIm2/qJTHpBN8bkEZTU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-xSuDg3-1PAK7yVUILQj-Aw-1; Thu, 27 Oct 2022 14:32:02 -0400
X-MC-Unique: xSuDg3-1PAK7yVUILQj-Aw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90DAA185A7A8;
 Thu, 27 Oct 2022 18:32:01 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90D4B112C06D;
 Thu, 27 Oct 2022 18:31:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 02/58] block: Ignore close() failure in get_tmp_filename()
Date: Thu, 27 Oct 2022 20:30:50 +0200
Message-Id: <20221027183146.463129-3-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

The temporary file has been created and is ready for use. Checking
return value of close() does not seem useful. The file descriptor
is almost certainly closed; see close(2) under "Dealing with error
returns from close()".

Let's simply ignore close() failure here.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221010040432.3380478-1-bin.meng@windriver.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 1fbf6b9e69..66a35b3982 100644
--- a/block.c
+++ b/block.c
@@ -887,10 +887,7 @@ int get_tmp_filename(char *filename, int size)
     if (fd < 0) {
         return -errno;
     }
-    if (close(fd) != 0) {
-        unlink(filename);
-        return -errno;
-    }
+    close(fd);
     return 0;
 #endif
 }
-- 
2.37.3


