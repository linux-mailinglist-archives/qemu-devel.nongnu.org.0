Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057403F3F83
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 15:34:40 +0200 (CEST)
Received: from localhost ([::1]:40958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHncU-0002CS-T8
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 09:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <77d96c7e87c5f25e1e42319131f4d21ec646eb32@lizzy.crudebyte.com>)
 id 1mHnYg-0003L5-5Q
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 09:30:43 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <77d96c7e87c5f25e1e42319131f4d21ec646eb32@lizzy.crudebyte.com>)
 id 1mHnYe-0001Cs-Pa
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 09:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=kSpyee820uqQz+yU57xOxLjJAmEZwnGIMzUGc3CBYLk=; b=a0YsX
 gW6xZ8x1I6dl3GN7c65KBKzNwA/TUf0hYWK0sv3JApOddm8fwiQup48uGElKhTIgAc1Ay6y3yAWeb
 tGzMJLNRZxxUyCuS37oCiS+dnOlFy7h/sqNM9HgkeK7OfKY0o12SmFVcchMDGrjPoLavOFTXjUfyP
 pBqg4f69E32mL15bxFtIkfkuhc0d8mAe6F99EG4mzdKITPM+LuQ/9nBc3vkhtfggUAkIYKZyUcL0o
 ndsApLV36uH5yv3LWh83ZM0uOQ8C03Ifo5rh3QBeAdY8J+uSQMEZ7Jfyaos9OcUG6eTGIWWcOnNvg
 b9PYZpKuiJ2S1xldjL6icxdfAEHcA==;
Message-Id: <77d96c7e87c5f25e1e42319131f4d21ec646eb32.1629638507.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1629638507.git.qemu_oss@crudebyte.com>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 22 Aug 2021 15:17:00 +0200
Subject: [PATCH v2 2/5] qemu/qarray.h: check scalar type in QARRAY_CREATE()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=77d96c7e87c5f25e1e42319131f4d21ec646eb32@lizzy.crudebyte.com;
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
requested to be created via QARRAY_CREATE() matches the scalar
type of the passed auto reference variable (unique pointer).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 include/qemu/qarray.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/qemu/qarray.h b/include/qemu/qarray.h
index 9885e5e9ed..643c8877c5 100644
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
@@ -145,6 +147,10 @@
  * @param len - amount of array elements to be allocated immediately
  */
 #define QARRAY_CREATE(scalar_type, auto_var, len) \
+    QEMU_BUILD_BUG_MSG( \
+        !__builtin_types_compatible_p(scalar_type, typeof(*auto_var)), \
+        "QArray scalar type mismatch" \
+    ); \
     qarray_create_##scalar_type((&auto_var), len)
 
 #endif /* QEMU_QARRAY_H */
-- 
2.20.1


