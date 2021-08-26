Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B73F889D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:17:09 +0200 (CEST)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFFa-0003UT-7i
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7b71cae8424b62c78461047ae722d74122e3ecb8@lizzy.crudebyte.com>)
 id 1mJF7l-0003UY-Ud
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:08:55 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:49007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7b71cae8424b62c78461047ae722d74122e3ecb8@lizzy.crudebyte.com>)
 id 1mJF7k-0006jd-K3
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=7V7AtSA/GGpLfVhFDdKh0FTfh0YNxsRShVikFoZsWHQ=; b=Y8tpZ
 h37+okSrtFLFHpRXfryLhi6vAGAGGpQ5hDpnCBj7Vooct1j3llbcXWo9LVy9vO1AT5+DVaYplWvMr
 ArDZQty9zdEr70RaPIIfAtftA1n1NblsJW/527Czm9X83/o2NSChVPcKXbOhwjcylSW/2sA5JZq/N
 ppWDsV4InAc5YjrwUsV6UTL/hAMhMe1NUQ7twelSqFk7bKjy3KNoGCN+51yq1MkK1+b7qDskoLD69
 Z20S/DbnAqqMqP+J3TPn7S1SbbOrPYYAebakdLkL+Bb218DXIo1Kc32SvVMgr6Kqrf1MiXM3vYNpG
 HJ6oNk2zCq3rKcyBcdG1jaT7fltkg==;
Message-Id: <7b71cae8424b62c78461047ae722d74122e3ecb8.1629982046.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1629982046.git.qemu_oss@crudebyte.com>
References: <cover.1629982046.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 26 Aug 2021 14:31:43 +0200
Subject: [PATCH v3 3/5] 9pfs: make V9fsString usable via QArray API
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=7b71cae8424b62c78461047ae722d74122e3ecb8@lizzy.crudebyte.com;
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
index a01bba6908..fbfc2a62cd 100644
--- a/fsdev/9p-marshal.c
+++ b/fsdev/9p-marshal.c
@@ -18,6 +18,8 @@
 
 #include "9p-marshal.h"
 
+DEFINE_QARRAY_TYPE(V9fsString, v9fs_string_free);
+
 void v9fs_string_free(V9fsString *str)
 {
     g_free(str->data);
diff --git a/fsdev/9p-marshal.h b/fsdev/9p-marshal.h
index ceaf2f521e..7229e4e617 100644
--- a/fsdev/9p-marshal.h
+++ b/fsdev/9p-marshal.h
@@ -1,10 +1,13 @@
 #ifndef QEMU_9P_MARSHAL_H
 #define QEMU_9P_MARSHAL_H
 
+#include "qemu/qarray.h"
+
 typedef struct V9fsString {
     uint16_t size;
     char *data;
 } V9fsString;
+DECLARE_QARRAY_TYPE(V9fsString);
 
 typedef struct V9fsQID {
     uint8_t type;
-- 
2.20.1


