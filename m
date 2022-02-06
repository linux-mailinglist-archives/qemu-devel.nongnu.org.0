Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34614AB1F7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:15:05 +0100 (CET)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGnw7-00014a-NB
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:15:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp5-00010i-8S
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:47 -0500
Received: from [2607:f8b0:4864:20::82f] (port=45885
 helo=mail-qt1-x82f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp3-0001QG-FK
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:46 -0500
Received: by mail-qt1-x82f.google.com with SMTP id o3so10372860qtm.12
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7OsikZblJEO4FkeB434ZL2dxZiElY/T3vTaiGslty6k=;
 b=pKnwHtMoTz6mqViBmOdGUDVf873kOm5rQh6BsbA2jFqeaFEcBBwu37qrYEihTiDs5z
 5fO28acl/wzkFAzvPzNM00Fcafu5TAbwIX+1aXqri2nQyGnE2YFEjuO3OgqJUR0vjrKL
 KzwOSQgGx87mHwWCsIUAtXjlLxWgHE/A7LkVZLD4vfQ8SFoJ1sDYBikbNJ7BUp+LOFQU
 5WR8qokdFURKETYDz4ccffQ76hlMDj94PFQNqJtQXqFmbmWNNUpTn+vlH6WddHtvr4wZ
 hUBmdvUs9qbEDpq+CYBkZCJlbf+K/mWmMR3slgjaRpVrCjbrjYxMWULLleOqZns1WKzS
 AS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7OsikZblJEO4FkeB434ZL2dxZiElY/T3vTaiGslty6k=;
 b=g3ihxtMSHfrFYgLI+SjWGUmb0dgchWBhWfahLGAbYIkNtAxlSFfFw6QtIXM76FwZa6
 usWXeuV2QbGfxezzYgsuVeTWRToJAE/uSZQghjOYYMczkRXDzEtjJjCzds3O8ovQH6Xu
 4RtU+knaEjWAGWbihpxwXT+WFckjYT0xc8YCIwqrhLoiQlkglczaEd2l92tWOW6sqVN1
 4fKLmf/jewq+FLKTiZNAT2H/qAvaxkYwrL1zUZ0cwg/jvMZQgykOWoWqGTQW1v9ZDtcN
 DbUlxh/rcMgj+mIYAg0CYUCg/SwujAF/0jNxpAyvmrLvYLTNG4fAjwM9vWyZ0GQv3aUr
 DrTQ==
X-Gm-Message-State: AOAM532DF5r+0vx7MWyLV91mq+isTiqT88AkCS67U6nCN0nlub+2MxhW
 6vrVnFSirKvPIkK3Qo/KvvT4avBbdgROUg==
X-Google-Smtp-Source: ABdhPJxL+Kjz9Q+UdMr61fXLBL48UQjOXkvjb+i9xoIDxpPZDQwY1OTpBG9Go/4FwCpdyZX9QOYXXA==
X-Received: by 2002:a05:622a:1010:: with SMTP id
 d16mr5970587qte.632.1644178064313; 
 Sun, 06 Feb 2022 12:07:44 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j11sm4625999qtj.74.2022.02.06.12.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 12:07:43 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/11] 9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
Date: Sun,  6 Feb 2022 15:07:14 -0500
Message-Id: <20220206200719.74464-7-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220206200719.74464-1-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>

Because XATTR_SIZE_MAX is not defined on Darwin,
create a cross-platform P9_XATTR_SIZE_MAX instead.

[Will Cohen: - Adjust coding style
             - Lower XATTR_SIZE_MAX to 64k
             - Add explanatory context related to XATTR_SIZE_MAX]
[Fabian Franz: - Move XATTR_SIZE_MAX reference from 9p.c to
                 P9_XATTR_SIZE_MAX in 9p.h]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
---
 hw/9pfs/9p.c |  2 +-
 hw/9pfs/9p.h | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index f3b00d20a2..440bf5c9e5 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -3957,7 +3957,7 @@ static void coroutine_fn v9fs_xattrcreate(void *opaque)
         rflags |= XATTR_REPLACE;
     }
 
-    if (size > XATTR_SIZE_MAX) {
+    if (size > P9_XATTR_SIZE_MAX) {
         err = -E2BIG;
         goto out_nofid;
     }
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 1567b67841..6a1856b4dc 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -479,4 +479,15 @@ struct V9fsTransport {
     void        (*push_and_notify)(V9fsPDU *pdu);
 };
 
+/*
+ * Darwin doesn't seem to define a maximum xattr size in its user
+ * space header, so manually configure it across platforms as 64k.
+ *
+ * Having no limit at all can lead to QEMU crashing during large g_malloc()
+ * calls. Because QEMU does not currently support macOS guests, the below
+ * preliminary solution only works due to its being a reflection of the limit of
+ * Linux guests.
+ */
+#define P9_XATTR_SIZE_MAX 65536
+
 #endif
-- 
2.32.0 (Apple Git-132)


