Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578573636A4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:35:08 +0200 (CEST)
Received: from localhost ([::1]:50186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAO3-0003zr-CE
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAKn-0002MU-B7
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:31:45 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAKl-0004OJ-Pe
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:31:45 -0400
Received: by mail-wr1-x431.google.com with SMTP id c15so22552524wro.13
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h6o8Su8ndKPaEq67rctyv9OT1saUKeNWbq+sGKwz9v8=;
 b=P17L2VzTY9plsKoLwb2GlKas+92aYie7tyv5SQ/gOOJ17v1rTmfJHDwJH0apwX93wA
 Cu18F+KxiXHT5XThCl0Y+ohFiNhlHN5AiLKcq7iegkPUd+UrcyjkVBdPlu1ujrOyZKbZ
 Ynry87yK+xtRVusMS0zYr0dd5dl39kthRX2Do1LL5B+yCH+cQ8UQPrHRjEeWb3Tk6heq
 ctTfv7k6EkIqFCyuw7qe7GbGJPIzpvxXKoUpPW5wZJ7IUj168HL9kWXV1iEhadvbmDlG
 gp9cDMcEfymmCjf5rET2tcwp8CDa+ubjgt1xtYoLQUEBUdtyryXQ4+wiDMaAdbx+3Cnk
 PjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h6o8Su8ndKPaEq67rctyv9OT1saUKeNWbq+sGKwz9v8=;
 b=GfxkgFHs7Re8TQJ+9irrEbeDXe2AzfCH99vs06NLQHAPVMG7sokPaBOxXrs74LulYk
 g00GDOT+2Gzn/Ttnet5H0G6kLczv62igEEh7+frixBpJ+/ybCKCQUFVNTAyA08QgIMSH
 WHVgfDaVSBR/jS7oBTMDPt8OuawqvyKa/uAzyYqW2yxgzCQ+sH3EGkKU/8xGR9LdSqb7
 HlRSoGb8sYlogM9sU+/zJMcepBqsAKN42upeu4bgNpYWwbjPHXbxahg/YPubnCgKqKPI
 yW6mmQBWUiAGgxnW1eWGmgC5jDN1vQF9GwRDmZfg6vY4m+/sPtooEJQYbhiNxlIUTEeY
 EjbQ==
X-Gm-Message-State: AOAM533mtnNLK+3YfB9rZTops3Qb8Jq0hUiKlogQA5oBFkt/bJ34NBht
 SNy6YI1SJ0o/KoERURFJQ6ZGDSvs4PAq1Q==
X-Google-Smtp-Source: ABdhPJy8FQf0/gwTb2VEZTah0N3IsZY8vZU+7yG9YEiDR2R3QACiYLS59h6QkBxYignhRT0jTjPyvQ==
X-Received: by 2002:a5d:45ce:: with SMTP id b14mr9680446wrs.357.1618763502146; 
 Sun, 18 Apr 2021 09:31:42 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i133sm17196448wmi.40.2021.04.18.09.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:31:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/26] target/mips: Simplify meson TCG rules
Date: Sun, 18 Apr 2021 18:31:09 +0200
Message-Id: <20210418163134.1133100-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have the mips_tcg_ss source set for TCG-specific files,
use it for mxu_translate.c and tx79_translate.c to simplify a bit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 3b131c4a7f6..3733d1200f7 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -26,10 +26,9 @@
   'translate_addr_const.c',
   'txx9_translate.c',
 ))
-mips_ss.add(when: ['CONFIG_TCG', 'TARGET_MIPS64'], if_true: files(
+mips_tcg_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
-))
-mips_tcg_ss.add(when: 'TARGET_MIPS64', if_false: files(
+), if_false: files(
   'mxu_translate.c',
 ))
 
-- 
2.26.3


