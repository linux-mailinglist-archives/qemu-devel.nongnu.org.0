Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5F43CAF6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:44:13 +0200 (CEST)
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjDw-0001iM-2z
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c0451f0bc4210d262268ff51c053a9277f20f862@lizzy.crudebyte.com>)
 id 1mfj0G-0006un-1t
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:30:05 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:60271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c0451f0bc4210d262268ff51c053a9277f20f862@lizzy.crudebyte.com>)
 id 1mfj0E-0008JA-If
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=DEC+S65DhfOdjfM6vdAoINUetgRAYxaPAqjzG4NFcqY=; b=PpZ0e
 dCHgMDkIr3jWY9NR+/UheLdf6MXRT8vRJLe7xOPZrC8EXVn1eg6ZXmGovpEfx9+7qGUFylUaUnHnO
 hqUG35YhOMibMHcJ9WVvl2sTSk7bvbePjeNb55Pt2IKBXt1sX8UAqMMeGL4MWDJfk2LtyIAePIeEJ
 MApuzqjrOHftqBxZy0iaUHBPrWbMZs0yzM0BBED4mf+DvAIkX9bYq3YC3bsjtGOZswZSrvJgktYOk
 MK586sDEcsD+qHI/9fx2CIV73T5mnsy7DLEJ5p/QXENSzigV29utm8KDx+nzyQsxWj7/N5Ua0shkT
 7qhgTg+5C0ZpllofGYQrVA9+TzWCw==;
Message-Id: <c0451f0bc4210d262268ff51c053a9277f20f862.1635340713.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1635340713.git.qemu_oss@crudebyte.com>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 27 Oct 2021 15:18:33 +0200
Subject: [PULL 5/8] fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=c0451f0bc4210d262268ff51c053a9277f20f862@lizzy.crudebyte.com;
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

Make sure at compile time that the scalar type of the array
requested to be created via P9ARRAY_NEW() matches the scalar
type of the passed auto reference variable (unique pointer).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <c1965e2a096835dc9e1d4d659dfb15d96755cbe0.1633097129.git.qemu_oss@crudebyte.com>
---
 fsdev/p9array.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fsdev/p9array.h b/fsdev/p9array.h
index fff946a3d7..6aa25327ca 100644
--- a/fsdev/p9array.h
+++ b/fsdev/p9array.h
@@ -27,6 +27,8 @@
 #ifndef QEMU_P9ARRAY_H
 #define QEMU_P9ARRAY_H
 
+#include "qemu/compiler.h"
+
 /**
  * P9Array provides a mechanism to access arrays in common C-style (e.g. by
  * square bracket [] operator) in conjunction with reference variables that
@@ -149,6 +151,10 @@
  * @param len - amount of array elements to be allocated immediately
  */
 #define P9ARRAY_NEW(scalar_type, auto_var, len) \
+    QEMU_BUILD_BUG_MSG( \
+        !__builtin_types_compatible_p(scalar_type, typeof(*auto_var)), \
+        "P9Array scalar type mismatch" \
+    ); \
     p9array_new_##scalar_type((&auto_var), len)
 
 #endif /* QEMU_P9ARRAY_H */
-- 
2.20.1


