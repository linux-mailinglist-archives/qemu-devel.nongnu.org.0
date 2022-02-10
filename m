Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33794B0CAE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:45:28 +0100 (CET)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7t8-0002HJ-Be
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:45:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <98c520acce46f855d29f5f7c857103975926939e@lizzy.crudebyte.com>)
 id 1nI7kB-0007eg-Ou
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:36:14 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:44097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <98c520acce46f855d29f5f7c857103975926939e@lizzy.crudebyte.com>)
 id 1nI7jp-0003T7-GD
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=nol1mgUdNPIinW3AvolOp2b+vCDqiMhIC5upX6MUJlg=; b=mABlf
 eVcgmghIK3MNl5+XXgsZrMAAtnGV/u/yXOH/PxU9EWDORqeXUMLmX8ubt6MzcvUV8o2DneUsZ4dSb
 0Z10Xpv2T5QUYwZc3VSVrrpRpLsLsVRhoqU7eRPxZueGeoxqDk56uGReX1IvZm56lYmARTrIJHgxC
 676Tbg1pm0CROGB7rT4tTTKY3ztSchkPPmnNsHezwAxq2T6GLo5iH0K45b5wlas+qds0niup/vTPc
 jiQK7SlGwEiX0dsYqsVqIdh4wNCyvIvv8xVHFld7SlSgdTVtxKxRwekxw/ksXnIqgPAHeyBp7Sghd
 Zr5zXJoGPzqJ5NrWMN/1R6f0YB6yw==;
Message-Id: <98c520acce46f855d29f5f7c857103975926939e.1644492115.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1644492115.git.qemu_oss@crudebyte.com>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 10 Feb 2022 12:21:55 +0100
Subject: [PULL 3/5] tests/9pfs: Fix leak of local_test_path
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=98c520acce46f855d29f5f7c857103975926939e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Greg Kurz <groug@kaod.org>

local_test_path is allocated in virtio_9p_create_local_test_dir() to hold the path
of the temporary directory. It should be freed in virtio_9p_remove_local_test_dir()
when the temporary directory is removed. Clarify the lifecycle of local_test_path
while here.

Based-on: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20220201151508.190035-2-groug@kaod.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index ef96ef006a..5d18e5eae5 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -39,8 +39,13 @@ static char *concat_path(const char* a, const char* b)
 
 void virtio_9p_create_local_test_dir(void)
 {
+    g_assert(local_test_path == NULL);
     struct stat st;
     char *pwd = g_get_current_dir();
+    /*
+     * template gets cached into local_test_path and freed in
+     * virtio_9p_remove_local_test_dir().
+     */
     char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
 
     local_test_path = mkdtemp(template);
@@ -66,6 +71,8 @@ void virtio_9p_remove_local_test_dir(void)
         /* ignore error, dummy check to prevent compiler error */
     }
     g_free(cmd);
+    g_free(local_test_path);
+    local_test_path = NULL;
 }
 
 char *virtio_9p_test_path(const char *path)
-- 
2.20.1


