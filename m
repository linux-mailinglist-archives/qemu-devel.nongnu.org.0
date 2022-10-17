Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F047601038
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 15:28:25 +0200 (CEST)
Received: from localhost ([::1]:60398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQAK-0007pr-L7
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 09:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okQ2n-0007ym-1Z; Mon, 17 Oct 2022 09:20:38 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okQ2l-0001Og-Hk; Mon, 17 Oct 2022 09:20:36 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 a6-20020a17090abe0600b0020d7c0c6650so14257443pjs.0; 
 Mon, 17 Oct 2022 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lHqDO/CtwHZxAdbxjsuRjbM6IKKNSg2c8E7Gksy+A9c=;
 b=f6mpCbhcd/C58X+iGRRpsEV6mRjTCbQY00eqf38JQRlR/F700/RE4p0/PQZwbasMdO
 YEgvmyBoOrO4VWgP7hZ9vxcF3kycyLef5FKC+oyk1gWbX7aYci5LQnaL/GyVGs451NCm
 cnL1KAOz8ApC6WTNTtTA7FU1+Gn8tnR9ufaMFTYLUy47PAlEguLomXaMOtmg8vr6Y63C
 tOrDNW4bgiQnpofm9S7zO3yheTa3Edk8Sq11cBlBGwmeyNPeLNbrbIsCEauqDxrnaODq
 EZtWjxl7my291+K/HmI2oEckH6IhiTenLLxQbjpgdFhQUNkY7UBCGW5cazhCh6zWyAQZ
 5P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lHqDO/CtwHZxAdbxjsuRjbM6IKKNSg2c8E7Gksy+A9c=;
 b=khAka8ODNX0UKh6eYOL35KiMwA1BZWXOnebo8rYuuu6+2WcUIFC8MwsUOG9L4stHiO
 YQ3ngbW/r5/sx3m0Lq8D9ciMgtcdpdiH9yyA+qpHTyww3lKvUeSN80Kd59yUzJEXZ8bu
 CXPqyWq05Yd/ibNf1+2IuB4/YhbaEANVKTv8s+/OqdVe0tButDxXOFx/G7n2WVlPa7/6
 VOYJFvI+PTLNWnFCHIg0LxI5z4lqX4FqyKT1HpNV0/XwX2TTlRXiQhj0XdwoUz+c99HP
 SvWGqCpLWUqgtzSU9wV5o1R4d8r2dKOrWMs2dMDC6Zfq0Od/9pJQGWY2ZHF4j7nECBKI
 OPyQ==
X-Gm-Message-State: ACrzQf2XDoZMgdSK3wcmJupUrltWml8TZflQ2DTKI5xiozVnEH9XHPJC
 xRxFbtEls1cxB2OTs7AZ01jDO+fZZjhRjQ==
X-Google-Smtp-Source: AMsMyM4zYp690tbexTm3JWPExXXHl7pnvc4XxSuo3Moywy/H5M2J+vissk59Qvz7X6mtIrJkbkMTkQ==
X-Received: by 2002:a17:90b:3908:b0:20d:4151:1b73 with SMTP id
 ob8-20020a17090b390800b0020d41511b73mr13957312pjb.45.1666012832549; 
 Mon, 17 Oct 2022 06:20:32 -0700 (PDT)
Received: from ubuntu.. ([65.20.73.185]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090332c600b001806f4fbf25sm6634255plr.182.2022.10.17.06.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 06:20:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Shengjiang Wu <shengjiang.wu@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 1/2] tests/qtest: migration-test: Fix
 [-Werror=format-overflow=] build warning
Date: Mon, 17 Oct 2022 21:20:22 +0800
Message-Id: <20221017132023.2228641-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

When tmpfs is NULL, a build warning is seen with GCC 9.3.0.
It's strange that GCC 11.2.0 on Ubuntu 22.04 does not catch this,
neither did the QEMU CI.

While we are here, improve the error message as well.

Reported-by: Shengjiang Wu <shengjiang.wu@windriver.com>
Fixes: e5553c1b8d28 ("tests/qtest: migration-test: Avoid using hardcoded /tmp")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---

Changes in v2:
- improve the error message

 tests/qtest/migration-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index ef4427ff4d..aa1ba179fa 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2481,8 +2481,8 @@ int main(int argc, char **argv)
 
     tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
     if (!tmpfs) {
-        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
-                       err->message);
+        g_test_message("Can't create temporary directory in %s: %s",
+                       g_get_tmp_dir(), err->message);
     }
     g_assert(tmpfs);
 
-- 
2.34.1


