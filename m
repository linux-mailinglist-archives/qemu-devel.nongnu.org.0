Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242226040E7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:28:40 +0200 (CEST)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol6JS-00050v-NC
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol6BW-0004w2-2f
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:20:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:37528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol6BT-0001d3-T9
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:20:25 -0400
Received: by mail-pf1-x434.google.com with SMTP id 3so16797253pfw.4
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 03:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wzwj+fpAeUi9phgWTgcb8wbChvupV5gkpnSWwIw/I28=;
 b=XtUoxu9QK2RrE/HwfeWClBQKSo9vkv+/BUp0xWOqqo1AGKp9eFULiaTx0ZLmkzHH5W
 JxXYIDQ00lsSWUZOqrWGtcYIkRs/z1050ozJhrlhPjJuzp1+xU6i0liWEzSNY9GnVbDq
 I5vu9DLr47i18k18+z4jGC4G8qoVExrdSc1P/qfliumleMOkyLsjWQnyAyClBjLxLkMW
 fi69bsRwSkmmoVeYx6YmswHtWMh05RN4TPPhj5No3mHrC3X+MSPxtInJLq8yEueB/xVx
 OmONn6cncdCHXm7D1VEIT5qZ0JiL+TtrZ5o8sf2cTATh9sPIfV6kK83mloLVKZ6UdAjE
 fixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wzwj+fpAeUi9phgWTgcb8wbChvupV5gkpnSWwIw/I28=;
 b=JpLrycIZlF4ceMIOaANtE9PmUC+/4qG/p+jPXXmGQ4CE6YFEcyq3Du4WMHWZrnOeui
 Hf3DACXRICaAsAHXyu21U8+xe05z01qmrbHda2Z/cDsBovNRgaRkYc/x9kwktFygM5f6
 obeCOMAlaxixGyVHdq/+QZ/CvsZymUUjiOZgJDUIQ8OgvN6l2fiED7rSgspP7BOHZE4p
 MXXmaurJNSuRc8xXrykEZznJ6n1yxmMO6XG0rye1KJmJTYK2ftjkQOx2xhdACIFPRvNt
 iaV/Lg0p1B/kuLIQf8RlpdEDEOkfIi2TbdWyIi1x2cYJ7+wMkmBDAYcisgYbFwv+B0mI
 9V6Q==
X-Gm-Message-State: ACrzQf2VoRR43MNIAL88/ubsdklY/Nn30me3464AF9vym1gAyqHhkzi5
 YQvHfOafxy2DoKTjgoMH4+q2zD/mzE0hhg==
X-Google-Smtp-Source: AMsMyM7QjR1XRUIq/bpjPlEHUdHCBLg8bpKZ+M0pvv75EUfF2L2dbTo7G2WU5eWXqkNNJbgwQvQpgA==
X-Received: by 2002:a63:91c7:0:b0:460:924:a34e with SMTP id
 l190-20020a6391c7000000b004600924a34emr6495368pge.492.1666174822161; 
 Wed, 19 Oct 2022 03:20:22 -0700 (PDT)
Received: from ubuntu.. ([65.20.73.185]) by smtp.gmail.com with ESMTPSA id
 u18-20020a170902e5d200b0017f9db0236asm10543879plf.82.2022.10.19.03.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 03:20:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 1/3] util/main-loop: Fix maximum number of wait objects for
 win32
Date: Wed, 19 Oct 2022 18:20:13 +0800
Message-Id: <20221019102015.2441622-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The maximum number of wait objects for win32 should be
MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v4:
- make the out of bounds access protection explicit

Changes in v3:
- move the check of adding the same HANDLE twice to a separete patch

Changes in v2:
- fix the logic in qemu_add_wait_object() to avoid adding
  the same HANDLE twice

 util/main-loop.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/util/main-loop.c b/util/main-loop.c
index f00a25451b..de38876064 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void *opaque)
 /* Wait objects support */
 typedef struct WaitObjects {
     int num;
-    int revents[MAXIMUM_WAIT_OBJECTS + 1];
-    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
-    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
-    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
+    int revents[MAXIMUM_WAIT_OBJECTS];
+    HANDLE events[MAXIMUM_WAIT_OBJECTS];
+    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
+    void *opaque[MAXIMUM_WAIT_OBJECTS];
 } WaitObjects;
 
 static WaitObjects wait_objects = {0};
@@ -395,7 +395,7 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
         if (w->events[i] == handle) {
             found = 1;
         }
-        if (found) {
+        if (found && i < (MAXIMUM_WAIT_OBJECTS - 1)) {
             w->events[i] = w->events[i + 1];
             w->func[i] = w->func[i + 1];
             w->opaque[i] = w->opaque[i + 1];
-- 
2.34.1


