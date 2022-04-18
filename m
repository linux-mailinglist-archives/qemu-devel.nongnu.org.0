Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E3506045
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 01:36:01 +0200 (CEST)
Received: from localhost ([::1]:57724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngauV-0001th-TY
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 19:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ngash-0000Ih-NP
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 19:34:08 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ngasg-0000mZ-6L
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 19:34:07 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so668250pjb.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 16:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XRCUYaUS0iizOIPfgxkPP1xgvWVZPhNiUXIGykl/OMQ=;
 b=GJ5r8afuwpTL8qbccQWHNa/0sfg2rr6RK0WLSaJSMMygtE/MZL9KNEYr9Xyl+mpVOt
 HSz7WQbetZPRESBgz1fTiTfuFRC/dsZsyXx3KEuxKp/U7IcD4i+k/9Y6XqyNe/e9M2Uf
 IqA7aScnA8yUn6BwfOw13VRJrKbXrFhe2DYGqffSmvNpmLb7vsjqEiKxdPRpUjdVLnuc
 A6pH+OSx9fAm0ngXZ+YQg00uX5NBZO6D+vU/nyaJSAF4vz4WWfWiAKl5xtN8J5uSD3v8
 8YrYmQXFIJOUuong9LoRqEa2LIj505J/jlXfXPEajZoH98v2/3pYQix05v0u4NzGlotD
 lCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XRCUYaUS0iizOIPfgxkPP1xgvWVZPhNiUXIGykl/OMQ=;
 b=ZsOLnivCQYXeyqw/mmSQxo4oAv6SMlQxdeek21NbvQHPp2buMFbNolVwFfvebxdJNq
 zWXcUDDY5qj5+wq1YGFZAwZ8tWOXwmzUAdr27OzhyCRhaOs0Zwdj8FeTcLaE44XCPRh8
 leH9ne5wJ2IigbAAuBpbx63I+SC4TvSFBVyZ7wH0PtBNueEoHMMJSEKoynQOuRBTPXpx
 hXmG8P0hMPrR0osQF0ZyqxZJyBhaLi6udOuq+jKiL2L1SnaMlIiV9Mc3/LWLwUVKCypR
 Djl0hQhpnJCQ5GeblrUzTSzDoIMFO/A+dIerEOclQ05AiVRw/fBW+of5hw0fsKIMclOm
 yW0g==
X-Gm-Message-State: AOAM531P6nZHn0KqhCWljJWZSldxfGacEzHlP1VtMuNsvTh0bRBtS6Bg
 2+HLdkflh6LmqT0qABC10ZfswjQ5dEM4RAs2
X-Google-Smtp-Source: ABdhPJyAOtW9kzSBjzC2hBu3LcZZjmLY6vaaXAc5G6RGYLiJF+/UUU2ix2T1zBsN6Zt+744KyTy9Ww==
X-Received: by 2002:a17:90a:de87:b0:1cb:b207:a729 with SMTP id
 n7-20020a17090ade8700b001cbb207a729mr15556094pjv.144.1650324844769; 
 Mon, 18 Apr 2022 16:34:04 -0700 (PDT)
Received: from fedora.. ([101.206.166.4]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa79ac5000000b0050a4f4c4251sm10377096pfp.206.2022.04.18.16.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 16:34:04 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3] Use io_uring_register_ring_fd() to skip fd operations
Date: Tue, 19 Apr 2022 07:33:31 +0800
Message-Id: <20220418233331.7528-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Sam Li <faithilikerun@gmail.com>, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux recently added a new io_uring(7) optimization API that QEMU
doesn't take advantage of yet. The liburing library that QEMU uses
has added a corresponding new API calling io_uring_register_ring_fd().
When this API is called after creating the ring, the io_uring_submit()
library function passes a flag to the io_uring_enter(2) syscall
allowing it to skip the ring file descriptor fdget()/fdput()
operations. This saves some CPU cycles.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/io_uring.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 782afdb433..51f4834b69 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)
     }
 
     ioq_init(&s->io_q);
-    return s;
+    if (io_uring_register_ring_fd(&s->ring) < 0) {
+        /*
+         * Only warn about this error: we will fallback to the non-optimized
+         * io_uring operations.
+         */
+        error_setg_errno(errp, errno,
+                         "failed to register linux io_uring ring file descriptor");
+    }
 
+    return s;
 }
 
 void luring_cleanup(LuringState *s)
-- 
2.35.1


