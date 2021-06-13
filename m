Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040403A59F6
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 20:10:17 +0200 (CEST)
Received: from localhost ([::1]:36966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsUYp-0007v4-Ho
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 14:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davoronetskiy@gmail.com>)
 id 1lsUXb-00073K-LL; Sun, 13 Jun 2021 14:08:59 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:34332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <davoronetskiy@gmail.com>)
 id 1lsUXa-0007s3-59; Sun, 13 Jun 2021 14:08:59 -0400
Received: by mail-lf1-x132.google.com with SMTP id f30so17179958lfj.1;
 Sun, 13 Jun 2021 11:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZsBlRsiDpaW9+FfpUJAOcJMhAi8Jpx2OfNELQoy+pxs=;
 b=rARtDg5H7TobQH3hZdIbCJJQ6iglubgdmorucQ+vefu2U9aAHTNzBUqFTqWcQb0Wuk
 PX2bGjt2BvM76DyWp/K21RtJlvTz6KxiU+WhqejR3bUj3gejN5KWgQyLS0hggoA4AlPR
 jcrRj9QmF2Lgu9IcB21pvALoZspsJheYay3FRWe4DFKb7Y4N5rCPUhBEzE7dZAcjmLzo
 6Luk6gsImgkhHJh/ST1LnqEbwhfhJ+ItV4gvfX8vV0r1L3S8avM3EJhTgFmSArmWj01B
 rEG6uJ9l9uFpFz/6/1ymHJd6Z0YGhxv/nnF4mZeV1RkRHft1Rs9GxujRyXQnEsLsakJ9
 0kXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZsBlRsiDpaW9+FfpUJAOcJMhAi8Jpx2OfNELQoy+pxs=;
 b=UGKRLESb8WcLDzEBYztWqysu1AePd2J8CvyFdvJPshIEkLPxpp3/xTeMI0RyUi9mmJ
 j7QuwN2MYwHV1vLZFvK3SrHiqBEkyEuZx6HMiv6+mV3JsUPOvXbd1lL15NRSBgx6tmXA
 1RJJtp/0nPDl0cNmV4zsL1INkLYL7hd2hUOkKs/EzsK608i6OW0+yHZ2gK6i5nTmdqFo
 Y+dIypdl4D/F+0kVPk0pEcMh0jAGkxy5k2GsW1ZqUwGFl8Dp/vHuANeOKs2SRcuRRtRJ
 UeTsrlPZ9Zn9g6m+YkWZbk8pm1i1uxHrY5XNmsRltgi8zOiIbVYiohNKA7ALrv379lQy
 f3+A==
X-Gm-Message-State: AOAM530PMM/XaJHhHxwU7Pui4LmO8uR5ZEg9jBH5KskpZnyt0swbPbyA
 gygYdaZc2OJhGSgPtaxuTgDd5YIdoN2HJz8r
X-Google-Smtp-Source: ABdhPJzm2ZAjBWFXoBg8ploGrlIZyTQvE1PIPhlYGxAT6YpLACMzNVzbkBby989EbxBqNIJ6lg+rzQ==
X-Received: by 2002:ac2:420e:: with SMTP id y14mr1834633lfh.542.1623607735088; 
 Sun, 13 Jun 2021 11:08:55 -0700 (PDT)
Received: from localhost.localdomain ([46.39.249.124])
 by smtp.gmail.com with ESMTPSA id 10sm1347004lfq.160.2021.06.13.11.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 11:08:54 -0700 (PDT)
From: Dmitry Voronetskiy <davoronetskiy@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386/tcg/sysemu/bpt_helper.c: typo since
 cpu_breakpoint and cpu_watchpoint are in a union,
 the code should access only one of them
Date: Sun, 13 Jun 2021 21:08:38 +0300
Message-Id: <20210613180838.21349-1-davoronetskiy@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=davoronetskiy@gmail.com; helo=mail-lf1-x132.google.com
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
Cc: qemu-trivial@nongnu.org, Dmitry Voronetskiy <davoronetskiy@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Dmitry Voronetskiy <davoronetskiy@gmail.com>
---
 target/i386/tcg/sysemu/bpt_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/sysemu/bpt_helper.c b/target/i386/tcg/sysemu/bpt_helper.c
index 9bdf7e170b..de284dbdcb 100644
--- a/target/i386/tcg/sysemu/bpt_helper.c
+++ b/target/i386/tcg/sysemu/bpt_helper.c
@@ -109,9 +109,9 @@ static void hw_breakpoint_remove(CPUX86State *env, int index)
 
     case DR7_TYPE_DATA_WR:
     case DR7_TYPE_DATA_RW:
-        if (env->cpu_breakpoint[index]) {
+        if (env->cpu_watchpoint[index]) {
             cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[index]);
-            env->cpu_breakpoint[index] = NULL;
+            env->cpu_watchpoint[index] = NULL;
         }
         break;
 
-- 
2.25.1


