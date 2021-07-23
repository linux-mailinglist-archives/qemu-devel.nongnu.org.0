Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F3F3D3E43
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:13:45 +0200 (CEST)
Received: from localhost ([::1]:36412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yk4-0003QK-4g
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybv-0002gM-86
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:05:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybq-0005vi-RK
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:05:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id l4so3098079wrs.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yQMjndH/iLO2WTUcjBFbZ9uTKhmeZTZ3TcLfo5Nk7So=;
 b=KiPDTyzXEIjb75ARIypTIYeM3dQimI02g/Ir+cJR1Xy6Y6RlEwpG9CVhf1o4pXgXhP
 BzH+2bQVzcPYCVVmG1p1+Q2HSMbSVPpwYA3tfPCPGGXH6yMCXcIgtnOgggXEdHa5PhAj
 8JN+qfQzZj61lGqVVi0NjYIMdTxcUm2GJj4rIbgTAIHl7FFb7o0vTA7JtmgJgU04wrAd
 ykiNqciAtNzMGq+F16VMhgJDTdL4kXcGLRCWYVT4Ug3zsE/kM+wkuhTJ/XZ9kuyDIOhy
 mk+iSHQiHfbW/Hf2ufrfJWmhcwxv7o3rhEWr21Nwbb9lRRa4/WvI5Sd3bTPOp95jdEPD
 En2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQMjndH/iLO2WTUcjBFbZ9uTKhmeZTZ3TcLfo5Nk7So=;
 b=N+qTmTMOHkA7fT7WdQU0khjm9ljVLx8pckw+/n/fiXeReueRDO1h57Z64AIWKvn0o5
 Zml30P2kHKVXsuQtcaX8dPIjEOUkSF/OHIOcU/+7in+y4ky411HwI7IUVjvF6BuSmlki
 Oe2GlIV1sl+gIHUkmqTn9QhOlsf9QRAkzZ3FDrUTCl8OuSpDydXaNTbnbR2i/2Xnn6Y1
 9QBkuLbDQaPflM19joix6WRVsWqBvlxF6yAvuVgNlSBWsnD3bsoYA1M2RVfIykPHaxPh
 Luk+6yIr/vVmV8OSFX9eEGyvupeTmx65ocBdhYR1r2CAjrMKuS2mOxiIoG9NXlTa+kLy
 IU6g==
X-Gm-Message-State: AOAM532WOYL04RKX8tbgAhHbL3r3Rb58DtkGtz2gKUE16eddUOXAZSAb
 xxcqiovEg8mSllFbOrZM+emdIw==
X-Google-Smtp-Source: ABdhPJyBYKiBJJ+Memj/h9BY0flRoel64mITQxOvxyxB6UFW0zEJCTn4gRQDCAIWFOtqU2Wdli/Lbg==
X-Received: by 2002:a5d:5589:: with SMTP id i9mr6262028wrv.8.1627059913453;
 Fri, 23 Jul 2021 10:05:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e11sm41280731wrt.0.2021.07.23.10.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27DCC1FFAB;
 Fri, 23 Jul 2021 18:03:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 21/28] plugins/cache: Fixed a bug with destroying FIFO metadata
Date: Fri, 23 Jul 2021 18:03:47 +0100
Message-Id: <20210723170354.18975-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

This manifests itself when associativity degree is greater than the
number of sets and FIFO is used, otherwise it's also a memory leak
whenever FIFO was used.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210714172151.8494-2-ma.mandourr@gmail.com>
Message-Id: <20210720232703.10650-22-alex.bennee@linaro.org>

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index bf0d2f6097..4a71602639 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -200,7 +200,7 @@ static void fifo_destroy(Cache *cache)
 {
     int i;
 
-    for (i = 0; i < cache->assoc; i++) {
+    for (i = 0; i < cache->num_sets; i++) {
         g_queue_free(cache->sets[i].fifo_queue);
     }
 }
-- 
2.20.1


