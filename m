Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692746533B5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 16:55:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p81Q1-0007cY-8s; Wed, 21 Dec 2022 10:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1p81Py-0007c6-NH
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 10:54:06 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1p81Px-0004Zn-4Q
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 10:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8pY08YqRgYTnzu61u2AYxZ3mFfYEXTYemqIxv8cgSaY=; b=ReT4rtmMXKkZn3Zw9ZNjt0DB0u
 svUCDJF/OYlDPj9UKbRQu0FPETThA7DkE3FMnx2cTpdIQzdl0d5+mquz72hCkGx1VEFEukLC7Hzwb
 wbPP44YQ0JpFnS/P7c4kG0+pf3Fvv3wqtDPcVT8c0rUvtbFURVhwwse2HtJ79adxsMhQ=;
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Anton Johansson <anjo@rev.ng>,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v2] target/hexagon: suppress unused variable warning
Date: Wed, 21 Dec 2022 16:53:27 +0100
Message-Id: <20221221155327.1504117-1-ale@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch manually suppresses a warning for an unused variable
(yynerrs) emitted by bison.

This warning has been triggered for the first time by clang 15.

This patch also disables `-Wextra`, which is not usually adopted in
QEMU. However, clang 15 triggers the warning fixed in this patch even in
absence of `-Wextra`.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Tested-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/idef-parser/idef-parser.y | 2 ++
 target/hexagon/meson.build               | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
index 8be44a0ad17..c14cb395005 100644
--- a/target/hexagon/idef-parser/idef-parser.y
+++ b/target/hexagon/idef-parser/idef-parser.y
@@ -99,6 +99,8 @@
 /* Input file containing the description of each hexagon instruction */
 input : instructions
       {
+          /* Suppress warning about unused yynerrs */
+          (void) yynerrs;
           YYACCEPT;
       }
       ;
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index e8f250fcac5..c9d31d095ca 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -197,7 +197,6 @@ if idef_parser_enabled and 'hexagon-linux-user' in target_dirs
          idef_parser_dir / 'parser-helpers.c'],
         include_directories: ['idef-parser', '../../include/'],
         dependencies: [glib_dep],
-        c_args: ['-Wextra'],
         native: true
     )
 
-- 
2.38.1


