Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48B0675486
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqU2-0002kX-93; Fri, 20 Jan 2023 07:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTt-0002Zj-IG
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTr-0000JK-LZ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtriGm4Erllbe8FgqiiZsOao7apLlLhjpCfchWhRWZI=;
 b=KMdrZ2+CGxoNJsQHts0+6YdQlBGKt6Z2yMjy/yjCVbJFKZBMwXmKhyzk1/WtvI/KgMfaK2
 rgE/4tQJtZvSWTDXRs0op8nGqp2rQLfOzFxq/qnKfOrScPDGVzuQHFAz9+Ies409YUPDTY
 7N2Q7yUo45ecZ69sr0gQvZ2AA5dFge0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-xIkTv5H8PwW4AN9ea6XqNg-1; Fri, 20 Jan 2023 07:26:47 -0500
X-MC-Unique: xIkTv5H8PwW4AN9ea6XqNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CDFD381494A;
 Fri, 20 Jan 2023 12:26:47 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 926EE40C6EC4;
 Fri, 20 Jan 2023 12:26:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 09/38] qemu-img commit: Report errors while closing the image
Date: Fri, 20 Jan 2023 13:26:04 +0100
Message-Id: <20230120122633.84983-10-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

blk_unref() can't report any errors that happen while closing the image.
For example, if qcow2 hits an -ENOSPC error while writing out dirty
bitmaps when it's closed, it prints error messages to stderr, but
'qemu-img commit' won't see any error return value and will therefore
look successful with exit code 0.

In order to fix this, manually inactivate the image first before calling
blk_unref(). This already performs the operations that would be most
likely to fail while closing the image, but it can still return errors.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230112191454.169353-3-kwolf@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-img.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/qemu-img.c b/qemu-img.c
index 439d8de1e3..22d6ecefd5 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -449,6 +449,11 @@ static BlockBackend *img_open(bool image_opts,
         blk = img_open_file(filename, NULL, fmt, flags, writethrough, quiet,
                             force_share);
     }
+
+    if (blk) {
+        blk_set_force_allow_inactivate(blk);
+    }
+
     return blk;
 }
 
@@ -1119,6 +1124,14 @@ unref_backing:
 done:
     qemu_progress_end();
 
+    /*
+     * Manually inactivate the image first because this way we can know whether
+     * an error occurred. blk_unref() doesn't tell us about failures.
+     */
+    ret = bdrv_inactivate_all();
+    if (ret < 0 && !local_err) {
+        error_setg_errno(&local_err, -ret, "Error while closing the image");
+    }
     blk_unref(blk);
 
     if (local_err) {
-- 
2.38.1


