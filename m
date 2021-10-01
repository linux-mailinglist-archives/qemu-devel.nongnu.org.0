Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B941EFB8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 16:39:21 +0200 (CEST)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWJh2-000072-Rd
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 10:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ce9f7a0a63585dc27f4545c485109efbec1251da@lizzy.crudebyte.com>)
 id 1mWJe7-0005qK-1W
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 10:36:19 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ce9f7a0a63585dc27f4545c485109efbec1251da@lizzy.crudebyte.com>)
 id 1mWJe1-00009Z-RM
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 10:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=DtmXlnTKkaqkfkLEXuYn38vF/UYku/m/joogRjWe1fE=; b=XFMI9
 kcrVfR+AC2O075QrW/FsqcdT2E6e6JimokXkDtPPfp7YeEN+rB1b63pPKbAwi7oKIBJQf9k8E0gf5
 h0x1T3iw7Lw5EZdtKppm1lKCvJXyWTfJlLiiVHB4jwZ/Uf5QE1LELhsx/xWoRwrTBjJbNDdvZnKAY
 tI/zr0lZ7jKIPSSmoKrsPI9ShhrzyDrSm61G3Fj5kL0CtwkXWfSff4oEix+7SoZjohe1/7HEedJWG
 faf5zPGwpuys3+rMcLo9bdycgnu4GN8etngGhdvIN2wWl0k/EI03BwJ15RX241l8YRmT4SfU6aEPZ
 obx6XrVo5rs6CcVVDgEdFzDZOMQFw==;
Message-Id: <ce9f7a0a63585dc27f4545c485109efbec1251da.1633097129.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1633097129.git.qemu_oss@crudebyte.com>
References: <cover.1633097129.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 1 Oct 2021 16:27:29 +0200
Subject: [PATCH 3/5] 9pfs: make V9fsString usable via P9Array API
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=ce9f7a0a63585dc27f4545c485109efbec1251da@lizzy.crudebyte.com;
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
 fsdev/9p-marshal.c | 2 ++
 fsdev/9p-marshal.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/fsdev/9p-marshal.c b/fsdev/9p-marshal.c
index a01bba6908..51881fe220 100644
--- a/fsdev/9p-marshal.c
+++ b/fsdev/9p-marshal.c
@@ -18,6 +18,8 @@
 
 #include "9p-marshal.h"
 
+P9ARRAY_DEFINE_TYPE(V9fsString, v9fs_string_free);
+
 void v9fs_string_free(V9fsString *str)
 {
     g_free(str->data);
diff --git a/fsdev/9p-marshal.h b/fsdev/9p-marshal.h
index ceaf2f521e..f1abbe151c 100644
--- a/fsdev/9p-marshal.h
+++ b/fsdev/9p-marshal.h
@@ -1,10 +1,13 @@
 #ifndef QEMU_9P_MARSHAL_H
 #define QEMU_9P_MARSHAL_H
 
+#include "p9array.h"
+
 typedef struct V9fsString {
     uint16_t size;
     char *data;
 } V9fsString;
+P9ARRAY_DECLARE_TYPE(V9fsString);
 
 typedef struct V9fsQID {
     uint8_t type;
-- 
2.20.1


