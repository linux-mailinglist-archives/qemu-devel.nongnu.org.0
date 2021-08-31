Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57803FCACC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 17:28:17 +0200 (CEST)
Received: from localhost ([::1]:48586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL5gO-00022u-HL
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 11:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groche@genymobile.com>)
 id 1mL4a7-0007uS-Iq
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:17:43 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groche@genymobile.com>)
 id 1mL4a4-0006hz-It
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:17:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id b6so27951433wrh.10
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 07:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=genymobile.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5x2arDbB8sLXtiooJkHC4NR0dmL5V2If/7TksgITY7U=;
 b=FFnXA0F2kc9TFeKxZJIJxf5e6t5xS8DcTpSvAYjddMOkQhJnHhUm34PCmO3rjvbb9T
 B/Cvnp26kFsR9JkxiSBfPVJ8LBSCNWG8OzwVjgiC1/pAUvXn8oIytjR7Pp2uaEvW84/o
 cx+Ti9NlMJHUDEcWiNU9mY4tdVlMop+zkNvvDLlCNdYpaVucjxsek2uUxYchcnNuBmCL
 3yXiZvQR4M74BIf0kZdsq87mmv48iw9UD6a5yXxESQlG+8xCAQNhPWfEkYzTXK7eBLbJ
 oQfmN1qt6sk8dJq1GPXUByYyi3qmcfcIRdQq/ZXpGZgVSCOWmQVypuveMqyUxBKGdm5R
 UZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5x2arDbB8sLXtiooJkHC4NR0dmL5V2If/7TksgITY7U=;
 b=FoTEUpaNUaDHvatQZ+wXTKeHUxVIa5siZn3HfJxF+KzkSy3QJCAKCPAnXW2KNKUNRJ
 UViil0XGAQr0cXGg+Is9y2/qotUuMKp9ScoN7GRzFppuml5XjX10RwerT+AWb/+Y0ONd
 byWEW/Trr9KEte1ZrwuNGm9mVMbBzpm6+sLZGYukbP3ABHsZSL88+s1Rb5CQNe5Uiu2F
 HZQBooe98MQ1STo8CMP97emna4EH6KYgj/86dbbe/uUD61rGCJHlW/UCOpC3ok02A7qo
 tx57NI8iB6xElrZdyUw96GspHh8sBoaxjc0hSxd0ASXL5+md0/F93MOOzueNhEKUN/Dp
 oKEw==
X-Gm-Message-State: AOAM530ZjRoDGAP5osEhFV0ufGo0TZ3zZ74JxwiHGo57Qg9hMhs6+Fd5
 yrabvMi7ICmUpNzkqG2lNC8auQ==
X-Google-Smtp-Source: ABdhPJziA0aSSwwLycbIO5WKuKR1oUUfyfkOxQL43+JWzC0cOkzpd+JkKQ5dDUpAlYvg+bRmY6/aTQ==
X-Received: by 2002:a5d:58e9:: with SMTP id f9mr32294747wrd.154.1630419457920; 
 Tue, 31 Aug 2021 07:17:37 -0700 (PDT)
Received: from localhost.localdomain (136.165.66.86.rev.sfr.net.
 [86.66.165.136])
 by smtp.gmail.com with ESMTPSA id e26sm19375258wrc.6.2021.08.31.07.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 07:17:37 -0700 (PDT)
From: Guillaume Roche <groche@genymobile.com>
To: 
Cc: Guillaume Roche <groche@genymobile.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] block/vvfat: Fix ro shared folder
Date: Tue, 31 Aug 2021 16:17:27 +0200
Message-Id: <20210831141727.347597-1-groche@genymobile.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=groche@genymobile.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 31 Aug 2021 11:27:08 -0400
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

QEMU exits in error when passing a vfat shared folder in read-only mode.

To fix this issue, this patch removes any potential write permission
from cumulative_perms, when a read-only block device is in use.

Buglink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=918950

Signed-off-by: Guillaume Roche <groche@genymobile.com>
---
This is an attempt to fix this behavior, but it feels a bit hacky to me
since this patch checks for the vvfat format in a generic function.

However, I'd be glad to have some advice to make it better. Anyway, I
ran the block tests to ensure this does not introduce any regression.

To add some context: I know that this can be worked around by setting 
the shared folder in rw mode. But our use-case requires using both
shared and VM snapshots, and QEMU prevents using snapshot with a rw 
shared folder.

 block.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block.c b/block.c
index e97ce0b1c8..3f59e3843f 100644
--- a/block.c
+++ b/block.c
@@ -2383,6 +2383,12 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
         cumulative_shared_perms &= c->shared_perm;
     }
 
+    /* Discard write permission if vvfat block device is read-only */
+    const char *format = bdrv_get_format_name(bs);
+    if (format != NULL && strncmp(format, "vvfat", 5) == 0 && bdrv_is_read_only(bs)) {
+        cumulative_perms &= ~BLK_PERM_WRITE;
+    }
+
     *perm = cumulative_perms;
     *shared_perm = cumulative_shared_perms;
 }
-- 
2.31.1


