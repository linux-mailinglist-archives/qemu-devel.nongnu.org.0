Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178CC2D3C18
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 08:22:44 +0100 (CET)
Received: from localhost ([::1]:49444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmtoB-0006Qb-6L
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 02:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1kmtmB-0005pc-0v
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 02:20:39 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:46617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1kmtm8-0001T5-N9
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 02:20:38 -0500
Received: by mail-ed1-x543.google.com with SMTP id b73so403009edf.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 23:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTAK5HEDMpAr/+fzCsEXLb0+ULO1peRumvDw6H7WOrY=;
 b=S7U0cvaRI5FRfrNJshLtKQ+kk/CR8aH5PGhmEenl10Ei6sJzsq12qcAivzWy82zyGn
 v0yFB/z81MU9A/AjDCxeqI5JBVgFdAYkpFmBhMAuISciBgHYXrOBt6crViC9fVOavU4/
 vHGsGaSb/kG1IUC4eDhjjis3knegxRiT+eomw2LhsGhopPrw1kL3MR08ynpK5gz7WSu5
 YpZGskyJz47KYGj+5uy/86tGkt25qt6D2kP5Sf+PRdTrJGpgB8ZX2h04IQzW8LwDQ5WC
 LFQSceLcoE8fYLESE6nAB9mkByew3JUty+PvzVN5y1O2AQ6TEcXz2jlxMeXzHHNsqZ3X
 vHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTAK5HEDMpAr/+fzCsEXLb0+ULO1peRumvDw6H7WOrY=;
 b=k8QbolrQ9gK0FIEkWW8czxzxdhQZAObmQNTkmu4xAMve8R2JgkK046qxCTxsAt914M
 n0b/DhLGW6/CiaOtYP/RItgaAlJpm3paDgzJn9EXwr+CX7frBqvs4ueNK6vuE/Sk2XoB
 Rh5xS/1OJUdgvhclhWiDIo16xz+6PvhF5OkqXeinkQkEaljq3x1NjPByDwbo1UeUEZZ0
 /vNkE3gSJq8+14pkPAQIJF6hKaTPvrbfzGDVWiAshQTYSacDlT0dc9/MFeJMYSD7lhA0
 SvSDsoih1ji28zwrtSjrVPxqXegqZwHViAVclhTw48Q11B5Dtuvu2w87Cv2MLSvLmhT3
 abtw==
X-Gm-Message-State: AOAM532OydBvpcfK6cmUnk5wkmmdZfDN7wJllRnIJh5AiKRsl8BBJJCA
 zR0gstkZ/+7djo6YNJnJyZmX8Y7SFznpvDNb1yo=
X-Google-Smtp-Source: ABdhPJwPcmqGxcuJNtCj14ulm7OdcQKqd0OZwy03xDyn9uav/4lUNJbGToIxyiywKrZq3MxtihBNRQ==
X-Received: by 2002:a05:6402:1421:: with SMTP id
 c1mr754551edx.247.1607498434567; 
 Tue, 08 Dec 2020 23:20:34 -0800 (PST)
Received: from localhost.localdomain (ip85-215-238-161.pbiaas.com.
 [85.215.238.161])
 by smtp.gmail.com with ESMTPSA id j20sm595069ejy.124.2020.12.08.23.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 23:20:33 -0800 (PST)
From: Li Zhang <zhlcindy@gmail.com>
X-Google-Original-From: Li Zhang <li.zhang@cloud.ionos.com>
To: qemu-devel@nongnu.org,
	quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 1/1] Avoid migration if guest is in postmigrated status
Date: Wed,  9 Dec 2020 07:20:29 +0000
Message-Id: <20201209072029.2338351-1-li.zhang@cloud.ionos.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=zhlcindy@gmail.com; helo=mail-ed1-x543.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Zhang <li.zhang@cloud.ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is to avoid executing migrations twice, which causes
coredump. After the migration has been completed, guest is in postmigrated
status on source host and the block device is inactive. If executing 
migration again, it will cause coredump and a block error. For exmaple, 
executing #migrate "exec:cat>file" twice on source host, block error:
bdrv_inactivate_recurse: Assertion `!(bs->open_flags & BDRV_O_INACTIVE)' failed

Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 migration/migration.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 87a9b59f83..113f7e1e41 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2115,6 +2115,11 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
         return false;
     }
 
+    if (runstate_check(RUN_STATE_POSTMIGRATE)) {
+        error_setg(errp, "Unable to migrate, guest has been migrated");
+        return false;
+    }
+
     if (migration_is_blocked(errp)) {
         return false;
     }
-- 
2.18.4


