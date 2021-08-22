Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461D93F3F84
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 15:34:46 +0200 (CEST)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHncW-0002GO-CG
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 09:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0467fef600952f766b5598d136b34e91e19170cc@lizzy.crudebyte.com>)
 id 1mHnYv-0003Ns-2X
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 09:30:57 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0467fef600952f766b5598d136b34e91e19170cc@lizzy.crudebyte.com>)
 id 1mHnYt-0001MB-4a
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 09:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=vQaRlv4ehwFofDzfKsbV8n12CLuEweQkA+Zqbl7DPSM=; b=g2Rcu
 UfitGtZ5WS1dyF3BTUCxF/18ztzUMB+q5RSQfFeF0bLHfAllfIN5UfDXFAmXTW0fbwybKAIuPhE8p
 0LK3IORmgPwsk7JmwyPIrF7dTHQHgEk3OGchDZGMHGahuxyUbBScrBGaCzFWpAqJS/Ymy9bJ/u7lG
 U6HudK8X3J3NLqZPEc2eL9/nGcapXHQm0GLspAbCZnpTWnssK26b+6/7/WC80hMIrVc43KaulOsqo
 F4gZw4FfQM4UrSo1NkYvw4BguLMdzHS2CvrGZti24mNBi1OlYrowAzaeh+0QT1/qF6IjB06/Laj5k
 6wHOp72H+wED+edu9BpBi294JKYfw==;
Message-Id: <0467fef600952f766b5598d136b34e91e19170cc.1629638507.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1629638507.git.qemu_oss@crudebyte.com>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 22 Aug 2021 15:17:16 +0200
Subject: [PATCH v2 4/5] 9pfs: make V9fsPath usable via QArray API
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0467fef600952f766b5598d136b34e91e19170cc@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 fsdev/file-op-9p.h | 2 ++
 hw/9pfs/9p.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 42f677cf38..7630f0e538 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -18,6 +18,7 @@
 #include <utime.h>
 #include <sys/vfs.h>
 #include "qemu-fsdev-throttle.h"
+#include "qemu/qarray.h"
 
 #define SM_LOCAL_MODE_BITS    0600
 #define SM_LOCAL_DIR_MODE_BITS    0700
@@ -105,6 +106,7 @@ struct V9fsPath {
     uint16_t size;
     char *data;
 };
+DECLARE_QARRAY_TYPE(V9fsPath);
 
 typedef union V9fsFidOpenState V9fsFidOpenState;
 
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index c857b31321..b59572fa79 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -50,6 +50,8 @@ enum {
     Oappend = 0x80,
 };
 
+DEFINE_QARRAY_TYPE(V9fsPath, v9fs_path_free);
+
 static ssize_t pdu_marshal(V9fsPDU *pdu, size_t offset, const char *fmt, ...)
 {
     ssize_t ret;
-- 
2.20.1


