Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FB53D68F5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:50:42 +0200 (CEST)
Received: from localhost ([::1]:52528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88Uj-0000KA-TU
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Ro-0002Sa-My
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:40 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:46647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rn-000685-6C
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:40 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so1978234pji.5
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0tlojEqymtJJ88WhLXCc2lj6xJ1RmfHWdzsWqjyqPLM=;
 b=bjQKOf8yQohKavSuOFGF52GOdzpoFrwsx/J2NUtSneRBHYkGiWjwiQGiR/bxmhD+iP
 JOSCuSIv9bkKHmEFSikWAi2BJW/Blo/uvQaMgY+IZus3VYqGW1e9jFIOHZWfYypNqyA6
 g8xMVEQvhCZI/HmYGwLdqZRVGbbH9Kn/APQnU5Jh9plkFhPtgL1/BOa8AZ9Fyzc9enFT
 T0o49naHFQSg7Kici3Ql9tHiRnwCOCPjUk12gnmNZKgXts5m7i0RJfLaH8cYh4IDe1Cb
 S56k0AjsSzsqKo0dS6Td3gR6xymZPurNNCZgayXdGThTqEaSmrdbPgAiFYXcMGwJ6dDw
 EEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0tlojEqymtJJ88WhLXCc2lj6xJ1RmfHWdzsWqjyqPLM=;
 b=cHOHTID/hkTG5vMaNaMHVIDBttU+gjbMNTCac7U+BAuvmFZLVAQSN91nryrGgWhrVC
 yROKWJRtW33wAAxiI1wkVzTHxKrPDp+mm6fQDMhMsdTFL//vp1tdv/oCo7wOr86Ql8tJ
 8bcvgkoImHUJOqJrh/sMCFUZInOQe+gS29wg2Ndg2V3ysEWK7jPEaTGViyAKjDmf/0aj
 KoxxnTUgsIFoz+R/nnHZ6ZmpcaeyHt7PpaHq2r6Ins4hofIQ4Dvef5o4+34FNDmjyiuV
 nWoL69eGB5kePjzfUjifTGKOMCphtJ8dUbqtKkt2h1u27sZFGh1McMOssMDjWYKEYoQu
 O7Qg==
X-Gm-Message-State: AOAM531C6EV/QOQ4dn2arP7gVy8sKvzsnpbsvv482qDz2ptJo0mkYzIo
 6Cu6h9y0vnHTcc2e9jvTAGWsLxsrybo3Tw==
X-Google-Smtp-Source: ABdhPJwu8L7ZXdwej902Qekx1hbRRtUMmxkIeF8Kz6pZRltKGg1J8YpOdj6Sc7CEW0o6JXI2zVUEpw==
X-Received: by 2002:a17:902:d90b:b029:11b:f58c:f3d6 with SMTP id
 c11-20020a170902d90bb029011bf58cf3d6mr15986920plz.42.1627336057894; 
 Mon, 26 Jul 2021 14:47:37 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 04/12] nbd/server: Mark variable unused in
 nbd_negotiate_meta_queries
Date: Mon, 26 Jul 2021 11:47:21 -1000
Message-Id: <20210726214729.2062862-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
nbd/server.c:976:22: error: variable 'bitmaps' set but not used \
    [-Werror,-Wunused-but-set-variable]

which is incorrect; see //bugs.llvm.org/show_bug.cgi?id=3888.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 nbd/server.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/nbd/server.c b/nbd/server.c
index b60ebc3ab6..3927f7789d 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -973,7 +973,8 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
 {
     int ret;
     g_autofree char *export_name = NULL;
-    g_autofree bool *bitmaps = NULL;
+    /* Mark unused to work around https://bugs.llvm.org/show_bug.cgi?id=3888 */
+    g_autofree G_GNUC_UNUSED bool *bitmaps = NULL;
     NBDExportMetaContexts local_meta = {0};
     uint32_t nb_queries;
     size_t i;
-- 
2.25.1


