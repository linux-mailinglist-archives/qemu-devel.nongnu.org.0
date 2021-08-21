Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857823F3C82
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 23:13:21 +0200 (CEST)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHYIq-0002CW-JP
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 17:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a3f07198ba9e12b45ef38b45fa543e9b597ee70f@lizzy.crudebyte.com>)
 id 1mHYHN-0000B2-Ha
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 17:11:49 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:52949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a3f07198ba9e12b45ef38b45fa543e9b597ee70f@lizzy.crudebyte.com>)
 id 1mHYHJ-0001b8-7n
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 17:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=5ZVZyj3YzMwTNDGFgyv9k2EPVfxtHmOdwi1p8mZRfZ0=; b=SF/Ks
 Pnmj08oJmdChuHRSKvqiqWlzWTwoDx06Is2aSeWV293HghprW4IG4Md1Z2Zz8/c0BvAp3pMsu+bwW
 0UTwRqJmyCr8bJ21ppcF0A6ZCEx/HK1A7Jvi1h5W9Lxuv5n4kU3sFhaXFBMNrqmm5q3udLgSqE5Ad
 2xErHHTW++2bhE31yI6nlcOGzemjSKhdegXTZuZK+CpIGqW8cVOxocjPAiKpMDxHwlpDg+uzWxC27
 f5k9hPJAL55YTyQXcqDjB9g9R8KzmWFGl/i5054HMchfsIYbAdb3iZfw7slOJSIFNkUkhY8gk7nBx
 rhzpqa0RHjV7dI2D8yzilteMVmzmw==;
Message-Id: <a3f07198ba9e12b45ef38b45fa543e9b597ee70f.1629578875.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1629578875.git.qemu_oss@crudebyte.com>
References: <cover.1629578875.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 21 Aug 2021 22:30:49 +0200
Subject: [PATCH 2/5] qemu/qarray.h: weak scalar type check in QARRAY_CREATE()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a3f07198ba9e12b45ef38b45fa543e9b597ee70f@lizzy.crudebyte.com;
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

Unfortunately something like

  _Static_assert(typeof(a) == typeof(b), "type mismatch");

is currently not suported by C. So for the time being at least
check that the size of the scalar types match at compile time.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 include/qemu/qarray.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/qemu/qarray.h b/include/qemu/qarray.h
index 230a556e81..2cb8656c5d 100644
--- a/include/qemu/qarray.h
+++ b/include/qemu/qarray.h
@@ -27,6 +27,8 @@
 #ifndef QEMU_QARRAY_H
 #define QEMU_QARRAY_H
 
+#include "qemu/compiler.h"
+
 /**
  * QArray provides a mechanism to access arrays in common C-style (e.g. by
  * square bracket [] operator) in conjunction with reference variables that
@@ -143,6 +145,10 @@
  * @param len - amount of array elements to be allocated immediately
  */
 #define QARRAY_CREATE(scalar_type, auto_var, len) \
+    QEMU_BUILD_BUG_MSG( \
+        sizeof(scalar_type) != sizeof(*auto_var), \
+        "QArray scalar type mismatch" \
+    ); \
     qarray_create_##scalar_type((&auto_var), len)
 
 #endif /* QEMU_QARRAY_H */
-- 
2.20.1


