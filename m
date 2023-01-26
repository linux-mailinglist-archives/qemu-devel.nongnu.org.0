Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A667C9FF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0UF-000570-7w; Thu, 26 Jan 2023 06:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U6-0004XF-CM
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:04 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U3-0007nk-LD
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:01 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z5so1450225wrt.6
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAedoRL+04dN+eFrsiPk6/tHLkIJLlCMSJ8k6o72Dag=;
 b=EXLjZW9+gkxubutLdQDK10aAO4mCkE4phdzQ2QQXzoucZtrF5O5LJaTSdjJSZWO4m+
 gcKSZ+5YwJag+sD4wFWGPrl2qNN3OuMPOsH427K6l8PxnaJLMgg3J6UVGqhDZUI0jcPC
 LeUO8cd63DspAf+EH01UCPCH0MRC30lBWZS2iR3/Be32wUlv0ZfH70uWojI6EN+xTSnh
 gNa1BoKDBE4wfvfhtPHAO/ImnivKd6V6PfdDyFdfE8jHe/bj0L7hXUAK30vSSkuVKkY1
 QOzEsZz63iPd0oEYyK7PrLvMWizT8kIBz9mdqv7vVgM8XzS6NFH36bUUblA+rnyto89N
 gcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KAedoRL+04dN+eFrsiPk6/tHLkIJLlCMSJ8k6o72Dag=;
 b=ZGdKC2ftJa5odyHpzIks5uUjLSNBohoosnUZdOYs1WmcTmAEnLSaayHMbug1ZtGbKO
 O/5839/0AjchE5pJgecOKQuOqhdXSUHVvOS+elNFO/7EVXp2T18sK3+dKtg1vdmpcFaH
 gMasMxPTSre1t0O1/VzrbZTDNLZ330h9mzuBHX9u4WOrutsEhQgMOO/FBbLo7eHxa0uj
 fZvaObdwJO3YNRwwBzzlZagTx8AAWNCWvTydK4FwAI3iMv3R6BWVVGzO7CSzJmrwP1bR
 BDFEFlCa/ct7p1fMy9tbR6NCCj0J8gUBc6v4a7N8j8M2vfJmzqffxqPjpa7ZZ1axBq0f
 T64A==
X-Gm-Message-State: AFqh2kpYB9zkTEWN3F1uk4uXZHulRPyR5y49kYJ8zz8OKQPgq7IbKB4q
 Zbphj6AOfVC0UIeaG82sZGhNIQ==
X-Google-Smtp-Source: AMrXdXtCTP0r8grwb+HJdTpSwaMF0D3jDZlh7w5ncoDk9S9Udp1D37lZayh6isyDyl/9wol9upvRwA==
X-Received: by 2002:a5d:5a85:0:b0:2bd:f5df:2689 with SMTP id
 bp5-20020a5d5a85000000b002bdf5df2689mr33546123wrb.47.1674732718211; 
 Thu, 26 Jan 2023 03:31:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a05600001c400b002bdcce37d31sm1207327wrx.99.2023.01.26.03.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:31:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D3B11FFD0;
 Thu, 26 Jan 2023 11:23:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 35/35] plugins: Iterate on cb_lists in qemu_plugin_user_exit
Date: Thu, 26 Jan 2023 11:22:50 +0000
Message-Id: <20230126112250.2584701-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Rather than iterate over all plugins for all events,
iterate over plugins that have registered a given event.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230117035701.168514-4-richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-36-alex.bennee@linaro.org>

diff --git a/plugins/core.c b/plugins/core.c
index 728bacef95..e04ffa1ba4 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -514,9 +514,10 @@ void qemu_plugin_user_exit(void)
     /* un-register all callbacks except the final AT_EXIT one */
     for (ev = 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
         if (ev != QEMU_PLUGIN_EV_ATEXIT) {
-            struct qemu_plugin_ctx *ctx;
-            QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
-                plugin_unregister_cb__locked(ctx, ev);
+            struct qemu_plugin_cb *cb, *next;
+
+            QLIST_FOREACH_SAFE_RCU(cb, &plugin.cb_lists[ev], entry, next) {
+                plugin_unregister_cb__locked(cb->ctx, ev);
             }
         }
     }
-- 
2.34.1


