Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26C83F887F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:14:30 +0200 (CEST)
Received: from localhost ([::1]:45504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFDC-0000JN-0Q
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <462b178cb715f0ed889cda49c10e834df5ba84d6@lizzy.crudebyte.com>)
 id 1mJF7w-0003X1-RG
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:09:05 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <462b178cb715f0ed889cda49c10e834df5ba84d6@lizzy.crudebyte.com>)
 id 1mJF7t-0006oR-9L
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=vQaRlv4ehwFofDzfKsbV8n12CLuEweQkA+Zqbl7DPSM=; b=nAlzh
 wsesPDdSDDa9eA/4wBUF6SE9iL+t/zvC2CAubtdLrkt4za8108ATyXlWyrexaqLJQYUEjJyw9rtP9
 +B1deePEPUEnqoLr3hd0xQag2aJb7IG4+lWUvtMhPkmIOijt4XXHtg6hHbWWvBVkdI2Z7skRlJ2bl
 Gl9iXglCopU0VbpgfNDxxki+34b71/e/NvzJb1XLxb4Bqcr4IyDlB1m/LA/MDCMe36D4f22ys7DaP
 SFNo5E3t585kHAJy764N9G65dyGvB80OWNp+ecieOefwAFGzEyUkrfykQW9UFUs2wwQLq6Rwk+E7m
 WYvhF599tjXsGruHk/W3isrEDvUXw==;
Message-Id: <462b178cb715f0ed889cda49c10e834df5ba84d6.1629982046.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1629982046.git.qemu_oss@crudebyte.com>
References: <cover.1629982046.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 26 Aug 2021 14:31:55 +0200
Subject: [PATCH v3 4/5] 9pfs: make V9fsPath usable via QArray API
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=462b178cb715f0ed889cda49c10e834df5ba84d6@lizzy.crudebyte.com;
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


