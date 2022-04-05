Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE69E4F3146
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 14:40:40 +0200 (CEST)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbiUB-0003BF-Fb
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 08:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nbiPS-0001ZC-Sc; Tue, 05 Apr 2022 08:35:48 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nbiPR-00043s-Cf; Tue, 05 Apr 2022 08:35:46 -0400
Received: by mail-ed1-x532.google.com with SMTP id b15so14723467edn.4;
 Tue, 05 Apr 2022 05:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZYqQsfsii8k/ZquAa02XYTZnvbPfLXV2MWaxC5hbxsw=;
 b=JSmvN0KmdEWuMWIrqnZrzNjHKqnAcR9W7dtxUzK8LgkDfE9oD5nI8G+2HEyNJTja1r
 9mbery9l8N5JbUpvpMEwOVQlsPy62J43WxhhmnMqzsG2GAIiWb0OkqJ6vYxRfiu7+EeR
 L7ZXVBtFnSrwZ8yp7U30ohugZGHiXKoxsRJkvwEn3Qt7OJS4RcVJd39cGQGY7e+dnWXA
 0DamI9PgtKHj0OoAvwCUc5+FQBUO91fVgMkwJ7G8hvJ6YZHHWXM+1AEMf6uypM642K32
 F/4bdaklmVNKcTJRaVHkeVJVwvFUwlzD5rHXnObQAHpOdg4dPeu8QZGg9WZkEkKEXcXN
 pSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZYqQsfsii8k/ZquAa02XYTZnvbPfLXV2MWaxC5hbxsw=;
 b=HYSWsWN14SY+FgyiuRi8SHqjkpdiz61bGEDst2HQfdHQk8265URf1WUYxIoJkuB50V
 JDecZFQ85t1G3q5biEf4L3DjQXCauO1dpHwQ5Py6XmZ9ThEw69jaG8daCR83PUgewKD3
 6NsUGU+wEe8aEd1ow72Ek2MIyFTFnG4jKVN76tyWoNJ4oV1131IthoKBUoL7qHX/867Z
 HrgQExPTTaM3o9/UMpAytAXgmj16f9j8FkMCVzENCKkcLBSnUmgEAtn1SP7rcKfHsmQC
 egm8fJEO/f+usLtBjEw3SscySxHCRS5ExycM/uiYZWiatmYim++ZroENepgrQbXeMH+j
 KN0A==
X-Gm-Message-State: AOAM531cdURC8QFi9Uhw6extk91g4wFHlGIZ1VLMU1oxoOmK719DyR2V
 lIqxrLa2BgzJV+xXtP8r2805Awc4Qf8=
X-Google-Smtp-Source: ABdhPJyUtloVK50IvzebP6lJrcgG0GGeFsYT9vekdTW8beNSnBMlJnpFB04sAgnaefzo/Tw9DBiolQ==
X-Received: by 2002:a05:6402:1c87:b0:41c:dd9c:2e94 with SMTP id
 cy7-20020a0564021c8700b0041cdd9c2e94mr3461089edb.2.1649162143120; 
 Tue, 05 Apr 2022 05:35:43 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-013-166-174.77.13.pool.telefonica.de. [77.13.166.174])
 by smtp.gmail.com with ESMTPSA id
 kw5-20020a170907770500b006db075e5358sm5350049ejc.66.2022.04.05.05.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 05:35:42 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/ppc/ppc405_boards: Initialize g_autofree pointer
Date: Tue,  5 Apr 2022 14:35:34 +0200
Message-Id: <20220405123534.3395-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: qemu-trivial@nongnu.org, "open list:ppc4xx" <qemu-ppc@nongnu.org>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resolves the only compiler warning when building a full QEMU under Arch Linux:

  Compiling C object libqemu-ppc-softmmu.fa.p/hw_ppc_ppc405_boards.c.o
  In file included from /usr/include/glib-2.0/glib.h:114,
                   from qemu/include/glib-compat.h:32,
                   from qemu/include/qemu/osdep.h:132,
                   from ../src/hw/ppc/ppc405_boards.c:25:
  ../src/hw/ppc/ppc405_boards.c: In function ‘ref405ep_init’:
  /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: warning: ‘filename’ may be used uninitialized in this function [-Wmaybe-uninitialized]
     28 |   g_free (*pp);
        |   ^~~~~~~~~~~~
  ../src/hw/ppc/ppc405_boards.c:265:26: note: ‘filename’ was declared here
    265 |         g_autofree char *filename;
        |                          ^~~~~~~~

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/ppc405_boards.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 7e1a4ac955..3bed7002d2 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -262,13 +262,13 @@ static void ref405ep_init(MachineState *machine)
     /* allocate and load BIOS */
     if (machine->firmware) {
         MemoryRegion *bios = g_new(MemoryRegion, 1);
-        g_autofree char *filename;
+        g_autofree char *filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
+                                                   machine->firmware);
         long bios_size;
 
         memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
                                &error_fatal);
 
-        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmware);
         if (!filename) {
             error_report("Could not find firmware '%s'", machine->firmware);
             exit(1);
-- 
2.35.1


