Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B23327F4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:59:16 +0100 (CET)
Received: from localhost ([::1]:59626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJctH-0000Nr-43
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJcs1-0007u4-CB
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:57:57 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJcrz-0000yW-RC
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:57:57 -0500
Received: by mail-wm1-x32e.google.com with SMTP id i9so1986890wml.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 05:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O5RBOSfx7iDmIi9Xz0oLA+stkvsgLx1qUA7neDwYRCc=;
 b=ty4+ZWgg4q3N7jhXDhN5UPd/QJsSjoz1/525dtpt53stUfh7D/PNnzXsHW0aJYYxJD
 uwasGWvkcdDnxqSrohzWjI8usjIFeMs7cr21KO7xIRTtba7+AqlZKirul0qwHkg66mP/
 PlpHguM9hlpgKERcaeXJRwLdh4EOWSfhcvjaNscOYOPzxjUZMTo5g2JYGUBwXrZ30i/h
 luw2Ve/GvR7whTyqLLDK9gwTAsgXmjcvOZQxtOm3wBv7/MgYq932GBDTY2Zigp8kjklw
 Br8jdrm7fXbnZWlziScBjJlhe4uQZgEc1G0gLpUOcqv8w8VW/HVAoJfCkUN8hCgHHPL3
 Iulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=O5RBOSfx7iDmIi9Xz0oLA+stkvsgLx1qUA7neDwYRCc=;
 b=awYVfZZM501Z/lUDnCUGcyQR/SDceHtsvVgRT74LxtgmKCx99o9MFEoHnKYJi5ViI8
 IP7DjiCWnWz/4qzjBlUwpEqXFPXRLNmOhTT3uqYBoo7s+QbammRiLi98aT9hd8i3O4u5
 ypFYNsWTqPgmRW+YYv8JNtlAg5WqQ4tirl16jGVaUyuFGj7VzlzhTdAyoXj430xXmJZa
 0vo5zK1tONnmRDDGvvIsGgPG+DuYMZb7YkYejC+GV7mGkybBd3UTHnWtIYgJ7swH1Wtu
 CXZFyljHUyW2lGiRu/KeBR7cpohEx7VrkBH9W1JgDOL+e3eBJIlUFUdc4bBu/OZmTQ6u
 +PbA==
X-Gm-Message-State: AOAM530reC6BFx9//tFUIbWcYv40pXr/CXDga/UXUyRCKWAcsdpFpHgQ
 qTDmlp1QuMoCPSmFmW40KODkUbhpgww=
X-Google-Smtp-Source: ABdhPJy0BCBTduClHQxKMRvJELAAA1489GhHSXLo0lsGDWCzF0EX+K69DXKzDJwd/9fmtVezty41hg==
X-Received: by 2002:a1c:1f04:: with SMTP id f4mr4313619wmf.12.1615298273995;
 Tue, 09 Mar 2021 05:57:53 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 a5sm24097138wrs.35.2021.03.09.05.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:57:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scsi: fix sense code for EREMOTEIO
Date: Tue,  9 Mar 2021 14:57:52 +0100
Message-Id: <20210309135752.187916-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SENSE_CODE(LUN_COMM_FAILURE) has an ABORTED COMMAND sense key,
so it results in a retry in Linux.  To ensure that EREMOTEIO
is forwarded to the guest, use a HARDWARE ERROR sense key
instead.  Note that the code before commit d7a84021d was incorrect
because it used HARDWARE_ERROR as a SCSI status, not as a sense
key.

Reported-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scsi/utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scsi/utils.c b/scsi/utils.c
index 873e05aeaf..357b036671 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -589,7 +589,7 @@ int scsi_sense_from_errno(int errno_value, SCSISense *sense)
         return TASK_SET_FULL;
 #ifdef CONFIG_LINUX
         /* These errno mapping are specific to Linux.  For more information:
-         * - scsi_decide_disposition in drivers/scsi/scsi_error.c
+         * - scsi_check_sense and scsi_decide_disposition in drivers/scsi/scsi_error.c
          * - scsi_result_to_blk_status in drivers/scsi/scsi_lib.c
          * - blk_errors[] in block/blk-core.c
          */
@@ -599,7 +599,7 @@ int scsi_sense_from_errno(int errno_value, SCSISense *sense)
         *sense = SENSE_CODE(READ_ERROR);
         return CHECK_CONDITION;
     case EREMOTEIO:
-        *sense = SENSE_CODE(LUN_COMM_FAILURE);
+        *sense = SENSE_CODE(TARGET_FAILURE);
         return CHECK_CONDITION;
 #endif
     case ENOMEDIUM:
-- 
2.29.2


