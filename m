Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29787341E7B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:37:46 +0100 (CET)
Received: from localhost ([::1]:33490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFJx-0006Rh-9K
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF9C-0001HN-TL
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:38 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF96-0004Bf-LL
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:38 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo5233573wmq.4
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dughqH1cx9PZP0psDeqXff4h8j75pyRUTE0x8cTekeU=;
 b=QaOvPmtgIJAVBkzxC7G5f5APK5fBiY5URqmRLkpyB2Z7sRlgn7DlPoHIF3X2SciaZs
 l1rICCeNsimSjC2Ve30ECSCijm4gdi8Ul6abCVb09wtcfjnaq1j5fiieMdLSB2eoziGQ
 HXM2falcM7a8vevshPILGEuF+Yai4+z1XA5ZJIe+NiF8CFO5GaidYdbJLtdO2VaBVT5O
 8XAXYX8KfRkIE/BbYjMBXZ4uAby6n33GPsgYsQDhqv14Bg6Kp2Lbkc/Q1BWGzf+TsN5q
 nXJ1rJOD29cGoYlOhqM9h19G5ObT0vi1J6TeXlNK+9XvXnMjayFMEDak95FooL6ZntzO
 LGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dughqH1cx9PZP0psDeqXff4h8j75pyRUTE0x8cTekeU=;
 b=fQVsF2WC6SD6AG7j5EA5o2hch7dwJ8lv085TQc/690Y9fl0k3AKbDZ1JJNDraSOCuc
 TwwmmAXrnaMdEMmc70jYsMNEq1mCAMxd0WJptLayB+W8MK4GnIY5gSZamd20O8c2vTZF
 PiZJfkbTakvG+PI6op5eNgjlsYzDi2CjxTYEF9Siw13gdI1LPWHIslNLPutWJF/v9uBK
 TrCafrg5K4I9hm4ZDQhbXCBV1U4NxvW8UoR4MQVAQoqIH1tFxQWKXbhtRqtezNN12c0S
 DTiH6+zDdZK144s8Zk0UsPU49nLGKa41lRsCJPpemxzPbEjS8EEnGiFZV0HHsLlUGIJg
 ZbJw==
X-Gm-Message-State: AOAM5314n/MPaAcgJhENrhlVUJAffRZSPMTGYJwVpiIbIi51G2BRsl4I
 feYkTegDq21qm03bA782fVZsD1zXFLs=
X-Google-Smtp-Source: ABdhPJyrJ+pHeR+G2D2JQyq4huZZ/vjRg/4z/LN0JvkxAv8+/YT+l7VrWAF+Scs48NFIQNdSKLDjSw==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr3773540wml.44.1616160390077; 
 Fri, 19 Mar 2021 06:26:30 -0700 (PDT)
Received: from localhost.localdomain ([102.47.92.134])
 by smtp.googlemail.com with ESMTPSA id v13sm8889584wrt.45.2021.03.19.06.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:26:29 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] virtiofsd: Changed fuse_pollhandle allocation to GLib's
 functions
Date: Fri, 19 Mar 2021 15:25:22 +0200
Message-Id: <20210319132527.3118-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319132527.3118-1-ma.mandourr@gmail.com>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changed allocation of fuse_pollhandle structs to GLib's g_new().

Removed the null checking as allocating such a small memory segment
should always succeed on a healthy system. Otherwise, the system
is already in a critical state.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 66607100f2..45527ff703 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1755,7 +1755,7 @@ static void do_ioctl(fuse_req_t req, fuse_ino_t nodeid,
 
 void fuse_pollhandle_destroy(struct fuse_pollhandle *ph)
 {
-    free(ph);
+    g_free(ph);
 }
 
 static void do_poll(fuse_req_t req, fuse_ino_t nodeid,
@@ -1778,11 +1778,7 @@ static void do_poll(fuse_req_t req, fuse_ino_t nodeid,
         struct fuse_pollhandle *ph = NULL;
 
         if (arg->flags & FUSE_POLL_SCHEDULE_NOTIFY) {
-            ph = malloc(sizeof(struct fuse_pollhandle));
-            if (ph == NULL) {
-                fuse_reply_err(req, ENOMEM);
-                return;
-            }
+            ph = g_new(struct fuse_pollhandle, 1);
             ph->kh = arg->kh;
             ph->se = req->se;
         }
-- 
2.25.1


