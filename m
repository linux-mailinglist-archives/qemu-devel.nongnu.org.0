Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD756F1EDD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:51:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psU6f-0000vt-9D; Fri, 28 Apr 2023 15:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6U-0000rW-DQ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:50:02 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6N-00017R-Eg
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:50:02 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 7FA6860F51;
 Fri, 28 Apr 2023 22:49:49 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b432::1:18])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id TnPWb50Oca60-EV3h3wTi; Fri, 28 Apr 2023 22:49:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682711388; bh=OV0iXQLzRLTp2vN+Z8GCJ+NGvHDYEPz+faryG230/mQ=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=IGmZ1eRHMkonVZYyN6uzCmh/YpiAIc7258ooYq3yGJqw4PPBsY+vU4cqGI1CpplLv
 NXZ6cIXKE8znCfuId+bMhp810kPEkr8GK2P92gVn8bzpbMdlOaAEXojFUwQ5eEEsp2
 xMvOQtXh0L8XvO8K8TxkFK0dS3TFCvYCVROVzR1g=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: lukasstraub2@web.de, quintela@redhat.com, chen.zhang@intel.com,
 vsementsov@yandex-team.ru, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v4 10/10] migration: block incoming colo when capability is
 disabled
Date: Fri, 28 Apr 2023 22:49:28 +0300
Message-Id: <20230428194928.1426370-11-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We generally require same set of capabilities on source and target.
Let's require x-colo capability to use COLO on target.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 8c5bbf3e94..5e162c0622 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -395,6 +395,12 @@ int migration_incoming_enable_colo(void)
     return -ENOTSUP;
 #endif
 
+    if (!migrate_colo()) {
+        error_report("ENABLE_COLO command come in migration stream, but c-colo "
+                     "capability is not set");
+        return -EINVAL;
+    }
+
     if (ram_block_discard_disable(true)) {
         error_report("COLO: cannot disable RAM discard");
         return -EBUSY;
-- 
2.34.1


