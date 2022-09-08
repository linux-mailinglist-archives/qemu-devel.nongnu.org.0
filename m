Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08735B1F69
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:41:12 +0200 (CEST)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHmJ-0005bh-Pt
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHaA-0004YU-H9; Thu, 08 Sep 2022 09:28:38 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHa9-0002bj-1x; Thu, 08 Sep 2022 09:28:38 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso2407305pjk.0; 
 Thu, 08 Sep 2022 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=k0XM4f4qiZ91vGULk+sJ9slfW6MBFVrfDwbiSLgdr6k=;
 b=M0MKlhgwHWSu9yiJOOaxQHIigmTEwuje7AZBpdjzNrgfFEhHoBU3V5uwnuOtmpXGqf
 GUjrTHLLqF3oERtnfSpIMTANQvGx011cM9usYMHYRnqEuOTuGmmW52YoQYL0A0gQOW4r
 an0bLX7PvVjulLd97Ku6yUvo4ToSuoAL0klqQ+KzHMsZkMSZ3nN+46eb2XLlfl9YPffv
 nR5Z9UTeqdcLaDrhh/7oQhUxOewO9YowItl8JRF85ZMx5+40u05aGd7uK6MNWwzXP8t+
 72ghDGymq/4EAvOsIZtbCX3JfBKdLWqKCWwfvzk7z8LDlxHlEaPIGPQNz7C6Ow+gMqOf
 anLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=k0XM4f4qiZ91vGULk+sJ9slfW6MBFVrfDwbiSLgdr6k=;
 b=UQaeJ471SX2WfIe1w4vrI1Y5hVpuKEY3v7qmlVRgUExZSYm/IMUGwXJsWFwxglIVZC
 PtEaXc4t5OeUyD39atYGzaavEb34OZvRwLHAkr8AB0XMlCGWgF9UOo6t7dSkwdDW3zrG
 Cy1g2UMv8ayIP9HLKujNjAb5jJ0Ln8bm5EUHSJchmihfSbkK+Ll1z+1qnMqd+jE3WOwV
 5ms1rwe16xzxDJYT5SeEUvkhlJvoR1dlZjZ1Gs/hIlMjvqaGNSDfYKZGKoOPCQYYiyDY
 9RasRikiUr8yudHS2i6wqi8BoTZU5g4S+AdJHQ4u4apY1YtfaYD9/K55urnGveRMuw0i
 wkDA==
X-Gm-Message-State: ACgBeo17JopC/SWmV2z9K+w1/eM0kNyoD1DHDd1QN35hDuHzf3bjg0JH
 LEuLxWPHIq4YB0G77Z4v0uqM5J1Xz8U=
X-Google-Smtp-Source: AA6agR5R/WzgW6XjOuLLgIQLZKOlHGctn/skSiCeoLWouyuXyQrTe0wRYxGRyaDvyTgE/G/Dx+VlIg==
X-Received: by 2002:a17:902:9887:b0:172:7090:6485 with SMTP id
 s7-20020a170902988700b0017270906485mr9264432plp.63.1662643715302; 
 Thu, 08 Sep 2022 06:28:35 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a170902be0800b001755ac7dd0asm1731693pls.290.2022.09.08.06.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 06:28:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-block@nongnu.org
Subject: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
Date: Thu,  8 Sep 2022 21:28:15 +0800
Message-Id: <20220908132817.1831008-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908132817.1831008-1-bmeng.cn@gmail.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

libnfs.h declares nfs_fstat() as the following for win32:

  int nfs_fstat(struct nfs_context *nfs, struct nfsfh *nfsfh,
                struct __stat64 *st);

The 'st' parameter should be of type 'struct __stat64'. The
codes happen to build successfully for 64-bit Windows, but it
does not build for 32-bit Windows.

Fixes: 6542aa9c75bc ("block: add native support for NFS")
Fixes: 18a8056e0bc7 ("block/nfs: cache allocated filesize for read-only files")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 block/nfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/nfs.c b/block/nfs.c
index 444c40b458..d5d67937dd 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -418,7 +418,11 @@ static int64_t nfs_client_open(NFSClient *client, BlockdevOptionsNfs *opts,
                                int flags, int open_flags, Error **errp)
 {
     int64_t ret = -EINVAL;
+#ifdef _WIN32
+    struct __stat64 st;
+#else
     struct stat st;
+#endif
     char *file = NULL, *strp = NULL;
 
     qemu_mutex_init(&client->mutex);
@@ -781,7 +785,11 @@ static int nfs_reopen_prepare(BDRVReopenState *state,
                               BlockReopenQueue *queue, Error **errp)
 {
     NFSClient *client = state->bs->opaque;
+#ifdef _WIN32
+    struct __stat64 st;
+#else
     struct stat st;
+#endif
     int ret = 0;
 
     if (state->flags & BDRV_O_RDWR && bdrv_is_read_only(state->bs)) {
-- 
2.34.1


