Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8454152A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:34:32 +0200 (CEST)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyfuI-0000Yn-Tg
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nyfsh-0006oo-ER
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:32:51 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:39566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nyfsd-0007AK-K4
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:32:49 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 2E7B62E12A2;
 Tue,  7 Jun 2022 23:32:39 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 2vowoVFYZu-WdJm3jch; Tue, 07 Jun 2022 23:32:39 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654633959; bh=G5liYpBTzgKRRof2K9bJ0RKfh6KYzFpogtB73iELfEM=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=zQu2emlQOyEioztgWElgP8zkqZmT260p8ywlq8yfpPWIW5kc9uL1hwfTwxp/fxa6C
 wiZDUYL+5FtXNl69hoiqgn3WLiN9NC00A+4cFaFo2eXyM7OpK+1EZ6AClt45vd20b0
 YXzVMJakOlrQp9AINb60TrilpqIhBR5BXee60T+s=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b6b6::1:2c])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 LXZN2noJaY-WcMGej8u; Tue, 07 Jun 2022 23:32:38 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	vsementsov@yandex-team.ru
Subject: [PATCH] qemu: make version available in coredump
Date: Tue,  7 Jun 2022 23:32:21 +0300
Message-Id: <20220607203221.966261-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add a variable with QEMU_FULL_VERSION definition. Then the content of
the variable is easily searchable:

   strings /path/to/core | grep QEMU_FULL_VERSION

'volatile' keyword is used to avoid removing the variable by compiler as
unused.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---

Hi all!

Probably, I just don't know the correct way to get version from core
file. If so, please teach me :)

 softmmu/vl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4c1e94b00e..1f51a713a0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -164,6 +164,19 @@ typedef struct DeviceOption {
     QTAILQ_ENTRY(DeviceOption) next;
 } DeviceOption;
 
+/*
+ * qemu_full_version_decl is for debugging. Assume you have coredump file, but
+ * don't know the version neither have original qemu binary file. You need to
+ * download a package with corresponding binary (and debug package with
+ * symbols), but which one? You need the version.
+ *
+ * This variable makes it simple to get the version by command
+ *
+ *     strings path/to/core | grep QEMU_FULL_VERSION
+ */
+static volatile const char qemu_full_version_decl[] =
+    "QEMU_FULL_VERSION: " QEMU_FULL_VERSION;
+
 static const char *cpu_option;
 static const char *mem_path;
 static const char *incoming;
-- 
2.25.1


