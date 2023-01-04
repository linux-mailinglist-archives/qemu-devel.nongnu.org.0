Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B785765D166
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 12:30:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD1x6-0003r8-Q0; Wed, 04 Jan 2023 06:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD1x5-0003qt-2l
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 06:28:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD1x3-0003nl-MZ
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 06:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672831736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3eyTItxNBGpnqVif0TdDViRoRhyzwbdY8wV+ypjuWxs=;
 b=V86NksA4TGtBCuZZloG8BQiD2pR5FzWAdEIuHdK51e011saFxdj2zrEWXl7DUJdlCjvmk5
 EKvdsGqSdP3H4dvLNFxmFXTGXo74ssrIztLW56kHvTuIJIT+HQ2tdx60aaAsym1OJn0CqN
 R3Osh0F+3EnkFV2EZLZED9GWbliMd2w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-hWZp6letMNWsEXd4_AjtdQ-1; Wed, 04 Jan 2023 06:28:53 -0500
X-MC-Unique: hWZp6letMNWsEXd4_AjtdQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E0FF811E6E;
 Wed,  4 Jan 2023 11:28:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ED4E492D8B;
 Wed,  4 Jan 2023 11:28:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH] tests/qemu-iotests/262: Check for availability of "blkverify"
 first
Date: Wed,  4 Jan 2023 12:28:50 +0100
Message-Id: <20230104112850.261480-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In downstream RHEL builds, we do not have "blkverify" enabled, so
iotest 262 is currently failing there. Thus let's list "blkverify"
as required item so that the test properly gets skipped instead if
"blkverify" is missing.

Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.31.1


