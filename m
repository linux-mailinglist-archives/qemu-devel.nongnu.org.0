Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD31C3D3E44
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:13:48 +0200 (CEST)
Received: from localhost ([::1]:36756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yk7-0003dl-VZ
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yby-0002l3-AP
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:05:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybw-0005yk-OG
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:05:22 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j2so3059109wrx.9
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xPhq1bIibdgmNHpoXhVrPGALc+WLIK/v7krtBEhhmz4=;
 b=CnLcCf4Mhmuj55Qna+0UfkcjPPf8/KNki2faOEi1bT6ytLQk9Qfpv/OcpGX0sH7z23
 rpDxeULc0b7MuhoRIoHiKBU+ACFUL9QuvrSrZ7TJocQe0JwF2XoR73IVzDBAdwbxGnrX
 j/aVtW2XVAix/Fe1mYto+Rf/7sDWI+Y/IkJzsDlgYp9btMYR+gEa3wZ0y6K17AgsyU7i
 jquNKtjbU40yesw4RWbW+tCGbforgufbAvHkbFbqSkakM4XqbRSCato5U9GBwKSXeD6j
 qOM7brFyu86j5yIqYb+sNiz9X0MmObhzYirQ9nLdgSz1ob3keOnTtKodpBzWXSF7nwmq
 a+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xPhq1bIibdgmNHpoXhVrPGALc+WLIK/v7krtBEhhmz4=;
 b=N/3bqae5ucJ9vYcBUE1xWBXgAYKS7R+2GdvIJlstASpWh3h/+lvvwgBxW2pkB/6soj
 1P4XUb+s2NtFk58mVlXXQd97vgV2uaHl19R9HcQokWUUDhRgYJX7J7SLnqbRhwENmW5s
 FOLSPDhczrcLLFsS2B9elrYG9j2I2a60sg+r1ZZYcRvLHyPKQoQryq4tYdTEX2Y3Z9rK
 oPSWac5+rYHdxVyqOKK5iVPj6xeukxslQyyXTDQqw/txs9juaM7T9BrXa7E5ceADQacY
 tSRjN1Qt+A5PrsLNGHGbd0jRRvf4sEDr9+VdGsEwli6+pgqBa6oK67BWYNx1l+DVRnSO
 9QTQ==
X-Gm-Message-State: AOAM530wmrc7ga1uOzKDfBpvMzWxRzUU9zboVXWKtBatgBqS7X87oQSP
 F+C9G5ym1X2+Jf2Ba1aqJDX60w==
X-Google-Smtp-Source: ABdhPJxzBMsjTPlmDZvBZh7wFMloDw+7zHsnr5PPaQ4xbbSwVh59scX0mHOFaQAdc6sGbyK9TY8Zew==
X-Received: by 2002:adf:ed0f:: with SMTP id a15mr6248873wro.78.1627059918163; 
 Fri, 23 Jul 2021 10:05:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g3sm33489581wru.95.2021.07.23.10.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 53F3A1FFAE;
 Fri, 23 Jul 2021 18:03:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 23/28] plugins/cache: Fixed "function decl. is not a prototype"
 warnings
Date: Fri, 23 Jul 2021 18:03:49 +0100
Message-Id: <20210723170354.18975-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210714172151.8494-7-ma.mandourr@gmail.com>
Message-Id: <20210720232703.10650-24-alex.bennee@linaro.org>

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 695fb969dc..066ea6d8ec 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -469,7 +469,7 @@ static int icmp(gconstpointer a, gconstpointer b)
     return insn_a->imisses < insn_b->imisses ? 1 : -1;
 }
 
-static void log_stats()
+static void log_stats(void)
 {
     g_autoptr(GString) rep = g_string_new("");
     g_string_append_printf(rep,
@@ -487,7 +487,7 @@ static void log_stats()
     qemu_plugin_outs(rep->str);
 }
 
-static void log_top_insns()
+static void log_top_insns(void)
 {
     int i;
     GList *curr, *miss_insns;
@@ -536,7 +536,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     g_hash_table_destroy(miss_ht);
 }
 
-static void policy_init()
+static void policy_init(void)
 {
     switch (policy) {
     case LRU:
-- 
2.20.1


