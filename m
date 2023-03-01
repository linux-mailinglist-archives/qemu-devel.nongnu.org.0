Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629D06A65BE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCVU-0005WQ-H9; Tue, 28 Feb 2023 21:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCVQ-0005Vy-2M
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:47:48 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCVO-0000gt-HL
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:47:47 -0500
Received: by mail-pg1-x530.google.com with SMTP id q23so6899663pgt.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJhvkoLDc/4Ng5JbPEdzxnJevo2RvOeeg5n87qn4/tg=;
 b=EcHtgWPHsqPX0gnaJMsavzjj0soFFobJjplUK8Ntn0cBPIeXpbnuABfo40WY3Jp4nF
 4VhoPJ8IjtcqCHcW0N3H5MWHnBiByTPln+XV7Rtu46eDyWtcU0Y1rBiwgsDfmXS2p4ul
 nUfakdwygd96QUrM8tmWafRNpG1WsLzFwwxAZXt58EMjSmCSckTS4aQkBdT/gnRJ69Tu
 pebB/YSKGqI81/Le+XgyIfuqyRUAlNYrbZOc7UQk54OESCMeY3isndnVinzdm2/6tfPS
 U/XztOce1TEyWl5kURdPfkqJy4atwNVqxl89iXzan+DaY/cYbHQC+MuyPPIgu9CDOrg4
 dKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XJhvkoLDc/4Ng5JbPEdzxnJevo2RvOeeg5n87qn4/tg=;
 b=PZo0Hktg35r/x5MmW59z+R+GkgFiblB0d82wkSZ5uDYyqdD/qFzy2U8jiTfRT+YHmq
 Mp0wJLLps25Ay8TJH4sSFDLGQf3eU5URAPoo1wygUd48vpClLcfFaeswmTxFnwOfiOHR
 H7pY4FdbyzKqRW5zwUT3HJ88euDAqVpxWULsZkrHEtyjgvS1u9pp9CQysTj1yhN2LDTh
 Z/TGzgmtq3TDffBq3Fv2NHrJ1dWzj8mvqmCoiOS8aKuCw4yc0Hj/IZGajuHiMqGBHMMl
 zFguE2yZO1oGgFLHIUFAE9/NEaKp/Ra7O0ZIvqzSpVdHrgIViZs1KlgLFu5EJqcgUf0L
 BkoQ==
X-Gm-Message-State: AO0yUKX7iARhTo+X0QSiAeyiv+ddy/unwPqq+kOv0v3EsQsgj7FE0aGQ
 hHFrIynowV6krAgGy2M3YtHwj9u7m3lGICJGK9o=
X-Google-Smtp-Source: AK7set+n82YKSdUHNUMxfBjPD1Q/0QSChGPbt6dSy6HqsN0y2T+ePGy/Xh+N9H1CEySw2b2uWd+sGw==
X-Received: by 2002:aa7:9a4a:0:b0:5f1:f57a:b0c3 with SMTP id
 x10-20020aa79a4a000000b005f1f57ab0c3mr4864455pfj.5.1677638865096; 
 Tue, 28 Feb 2023 18:47:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 y18-20020aa78052000000b005a8aab9ae7esm6708449pfm.216.2023.02.28.18.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:47:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, alex.bennee@linaro.org, aaron@os.amperecomputing.com,
 frederic.petrot@univ-grenoble-alpes.fr
Subject: [PATCH 2/2] include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT
Date: Tue, 28 Feb 2023 16:47:37 -1000
Message-Id: <20230301024737.1210851-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301024737.1210851-1-richard.henderson@linaro.org>
References: <20230301024737.1210851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

This macro is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/plugin.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index fb338ba576..e0ebedef84 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -59,8 +59,6 @@ get_plugin_meminfo_rw(qemu_plugin_meminfo_t i)
 #ifdef CONFIG_PLUGIN
 extern QemuOptsList qemu_plugin_opts;
 
-#define QEMU_PLUGIN_ASSERT(cond) g_assert(cond)
-
 static inline void qemu_plugin_add_opts(void)
 {
     qemu_add_opts(&qemu_plugin_opts);
@@ -252,8 +250,6 @@ void qemu_plugin_user_postfork(bool is_child);
 
 #else /* !CONFIG_PLUGIN */
 
-#define QEMU_PLUGIN_ASSERT(cond)
-
 static inline void qemu_plugin_add_opts(void)
 { }
 
-- 
2.34.1


