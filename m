Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97812675465
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:28:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqU1-0002jg-GK; Fri, 20 Jan 2023 07:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTu-0002eC-R5
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTt-0000Jr-6N
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6OjpDdQK7AfQc6wKXMmLgcr8zgUFi+p7kpoL6AjLndw=;
 b=UHraIjfFAaVj8jwcrT08mMjr4L/aSoSTkcHgOuN7GWVNlxUjsTDlN68CJuBOkp9E2aZAid
 Upg5FUYJITnYs9DOnDzoDAd7iFfpuVjTwwFR6KjOzgNrXQ64uEkFv8BmUIfhWdp0lkTRlD
 L5badEJdX0zpTA6lITwo3Ms20/tY2zY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-2mI0W8XSOae7Bld6MBMK9A-1; Fri, 20 Jan 2023 07:26:48 -0500
X-MC-Unique: 2mI0W8XSOae7Bld6MBMK9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 621C03814964;
 Fri, 20 Jan 2023 12:26:48 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98CFF40C6EC4;
 Fri, 20 Jan 2023 12:26:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 10/38] qemu-img bitmap: Report errors while closing the image
Date: Fri, 20 Jan 2023 13:26:05 +0100
Message-Id: <20230120122633.84983-11-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Message-Id: <20230112191454.169353-4-kwolf@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


