Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E70667EDE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 20:17:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG32d-0007aT-JM; Thu, 12 Jan 2023 14:15:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pG32a-0007Z3-5t
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:15:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pG32Y-0008E2-FG
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673550905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4FMIKqOkK3PfzSvu0coa8Cvc9krYVpVU37RFcG4z+g=;
 b=H/117CVcaRaylDDQulVfboVEkslUkY98IZehN51jqtrTLOxcb0zF+1nKw/5zWYBf3qOyZC
 1cV5VdyjyYm9kQrEDCuFwZ00jjiKErLZQgxXmwbHyIt6FvkrVmL0E6S77KgKWG+bRAFBr0
 Jn4syCz8D47j2GhxV1RtmezOWAu3w7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-zB5t0XBBPeie9XP0WKEKQw-1; Thu, 12 Jan 2023 14:15:04 -0500
X-MC-Unique: zB5t0XBBPeie9XP0WKEKQw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F05CB802D36;
 Thu, 12 Jan 2023 19:15:03 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B19F0492C14;
 Thu, 12 Jan 2023 19:15:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, aesteve@redhat.com,
 nsoffer@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 3/4] qemu-img bitmap: Report errors while closing the image
Date: Thu, 12 Jan 2023 20:14:53 +0100
Message-Id: <20230112191454.169353-4-kwolf@redhat.com>
In-Reply-To: <20230112191454.169353-1-kwolf@redhat.com>
References: <20230112191454.169353-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
'qemu-img bitmap' won't see any error return value and will therefore
look successful with exit code 0.

In order to fix this, manually inactivate the image first before calling
blk_unref(). This already performs the operations that would be most
likely to fail while closing the image, but it can still return errors.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1330
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-img.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/qemu-img.c b/qemu-img.c
index 22d6ecefd5..c3671d4890 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4645,6 +4645,7 @@ static int img_bitmap(int argc, char **argv)
     QSIMPLEQ_HEAD(, ImgBitmapAction) actions;
     ImgBitmapAction *act, *act_next;
     const char *op;
+    int inactivate_ret;
 
     QSIMPLEQ_INIT(&actions);
 
@@ -4829,6 +4830,16 @@ static int img_bitmap(int argc, char **argv)
     ret = 0;
 
  out:
+    /*
+     * Manually inactivate the images first because this way we can know whether
+     * an error occurred. blk_unref() doesn't tell us about failures.
+     */
+    inactivate_ret = bdrv_inactivate_all();
+    if (inactivate_ret < 0) {
+        error_report("Error while closing the image: %s", strerror(-inactivate_ret));
+        ret = 1;
+    }
+
     blk_unref(src);
     blk_unref(blk);
     qemu_opts_del(opts);
-- 
2.38.1


