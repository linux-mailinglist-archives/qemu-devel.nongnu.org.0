Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100B4675485
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:31:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqTt-0002Ts-Lf; Fri, 20 Jan 2023 07:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTp-0002R3-5L
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTm-0000Go-Aj
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/qovKCHixQ1h4ZvD0YYlb7bCZEWSK7CPqWq0G/k15A=;
 b=FLQfIhwnrBRVdYZiNpOqgljGUkHiuQ5XsnJpFcd4YJRv3SdzhmpA8c4E/vaZHVYhlynA7s
 DJC5SZdYpDcogxDBtVhwanBdOfaOV2uUNtJjeywwgwQdiEc2QisS3PZ5x1/Xk5JrWhpfkd
 1c224WHyvp8dENoye/48MdlCnHaX7ks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-O0ajlSq2P0q5Y-hDAvR5-w-1; Fri, 20 Jan 2023 07:26:40 -0500
X-MC-Unique: O0ajlSq2P0q5Y-hDAvR5-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 264DF800B30;
 Fri, 20 Jan 2023 12:26:40 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B88340C6EC4;
 Fri, 20 Jan 2023 12:26:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 02/38] tests/qemu-iotests/262: Check for availability of
 "blkverify" first
Date: Fri, 20 Jan 2023 13:25:57 +0100
Message-Id: <20230120122633.84983-3-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Thomas Huth <thuth@redhat.com>

In downstream RHEL builds, we do not have "blkverify" enabled, so
iotest 262 is currently failing there. Thus let's list "blkverify"
as required item so that the test properly gets skipped instead if
"blkverify" is missing.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230104112850.261480-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/262 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/262 b/tests/qemu-iotests/262
index 2294fd5ecb..a4a92de45a 100755
--- a/tests/qemu-iotests/262
+++ b/tests/qemu-iotests/262
@@ -25,7 +25,8 @@ import iotests
 import os
 
 iotests.script_initialize(supported_fmts=['qcow2'],
-                          supported_platforms=['linux'])
+                          supported_platforms=['linux'],
+                          required_fmts=['blkverify'])
 
 with iotests.FilePath('img') as img_path, \
      iotests.FilePath('mig_fifo') as fifo, \
-- 
2.38.1


