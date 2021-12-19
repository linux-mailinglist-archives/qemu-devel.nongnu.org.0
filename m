Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BE347A182
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 18:24:51 +0100 (CET)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myzvW-0006oh-Qu
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 12:24:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <makovick@gmail.com>)
 id 1myztG-0003i5-3G
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 12:22:30 -0500
Received: from [2a00:1450:4864:20::535] (port=47016
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <makovick@gmail.com>)
 id 1myztE-0007YM-MX
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 12:22:29 -0500
Received: by mail-ed1-x535.google.com with SMTP id y13so28986818edd.13
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 09:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fzwpp890KbfKmJBYFwiswX+sQjyHcST1ldbkqZREDdo=;
 b=Av4bIu2oyToCE9PXEsqRDQZhb8fvPVe80bB904Ci5UJlazhHknjTJqM58Tt5sXk7YE
 UObT4CZ2w2IXfpozuv7qY0OY7Jv0S+fAn7hSmPYr5qnCShRHkOiTfV9O2dsmLdlzLF26
 iAcn3cWeEyFE4Nt2dpSnKQSsrmDnXwj9QnuKa2colywBPCH8c8dz0hNhsKO+85vxUdxF
 eVZKDe9gOMvC89/QIUINW2v15yEGwH1AE2QsSTY+sZ4Y0l7XHi2Z5p5lY/gyLXa4RhM5
 b2k4E71Pxt9/mjPtzdfGlREPwpNpOdffiVzs7G6UavFGOgeiIvKx0YDeNi8OAaHjmUbb
 5gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fzwpp890KbfKmJBYFwiswX+sQjyHcST1ldbkqZREDdo=;
 b=UiQ1Asz+sOx0epbdlEMcaS+pibPhH0RmALu8mQtEaoGZNp2b6dFDzYk36InkY6ZH6Y
 SOZsy1iDUwZ2av1IjrbGO2x0NAiLNS264wL35l1zYfmesfnGHawTC6k/hVYIfe1hZzZf
 jX1X5q8coh0Z0uKk3XE1sD1lwdjxhY5bHf3jrqzOwcFsE3YVUHqEqG+EU5IoA1JGvVdh
 LxXpCq0tPq4FqV2DozRk7ESugj/78aBr+7axSSwKYLVtG/lzLG0xCzZZ3SouM2dsXEqZ
 IRvjHmmQ9vWJ6B3+7QtP5l8ebOg4A9xekvtF0FyWrchVYI+OJuCMYBAXH2qQx3LXgz/3
 86NA==
X-Gm-Message-State: AOAM532O8Qy+Ez/Jq/pyHWfHajXQL+947q4v/0QaoTZwzO8ZEAWO7Q8C
 9i85ykAVyEq0hkCXJCurUdujwrV/1EE=
X-Google-Smtp-Source: ABdhPJwdC2xZtdpW5+BQq9TN7TeyQbl0H109THsviPqG6dY10+MyeRThiB9aqIGwg6aKZiP5YSk/YQ==
X-Received: by 2002:a17:907:7fa2:: with SMTP id
 qk34mr10195825ejc.691.1639934546041; 
 Sun, 19 Dec 2021 09:22:26 -0800 (PST)
Received: from localhost.localdomain (ip-89-177-245-102.net.upcbroadband.cz.
 [89.177.245.102])
 by smtp.gmail.com with ESMTPSA id eg12sm286666edb.25.2021.12.19.09.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 09:22:25 -0800 (PST)
From: =?UTF-8?q?Jind=C5=99ich=20Makovi=C4=8Dka?= <makovick@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: Fix resolution change in fullscreen
Date: Sun, 19 Dec 2021 18:21:51 +0100
Message-Id: <20211219172151.86922-1-makovick@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=makovick@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Jind=C5=99ich=20Makovi=C4=8Dka?= <makovick@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the guest resolution changes and the UI is in full screen,
do not update the size hints. The gfx.scale_x and gfx.scale_y
variables are still wrong as they will be only recomputed on
gd_draw_event.

Just keep the window in fullscreen mode instead.

Signed-off-by: Jindřich Makovička <makovick@gmail.com>
---
 ui/gtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 428f02f2df..12621596e3 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -266,7 +266,7 @@ static void gd_update_geometry_hints(VirtualConsole *vc)
     GtkWindow *geo_window;
 
     if (vc->type == GD_VC_GFX) {
-        if (!vc->gfx.ds) {
+        if (!vc->gfx.ds || s->full_screen) {
             return;
         }
         if (s->free_scale) {
-- 
2.34.1


