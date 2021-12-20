Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5090C47B464
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:32:31 +0100 (CET)
Received: from localhost ([::1]:53174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPKg-0004bN-EV
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:32:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDj-0001ji-F6
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:20 -0500
Received: from [2607:f8b0:4864:20::535] (port=42689
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDg-000722-1d
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:19 -0500
Received: by mail-pg1-x535.google.com with SMTP id g2so7773061pgo.9
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fyndVhlQb13TDZ3esc1S9oqyuqQXnQYXlc770BtW8OY=;
 b=cPTQvpMJJHcmhTTuf8m2m0W0gg6pweDn1YFCy8kwDo7yLFhX9peQS1RBDosUWQQBDC
 YfwUebS25aRnjYkoYF4hKRuJTIX+HuqzktQtfaq/p8BYF+mMq2R3tkeIwpKJ45HZZ3n1
 KII8NtlwQ5r+V/J30wQzf5Te3CptMt2WdLyKhyOpfwOnesk7sL17FFL6HZ+nQ3Kgm93K
 1Jx7wrFWxumfYPjF8Pfo9k9I1MV+3k/CkXjmFgXDagh12vbLfUUACuJFYMZuM1eggyjW
 1jqOcJ8Z1wEUkEPQRhZxat4GLJ7sicQmrHP0cefN3uU8UTA3N7r4W90Ej7JVa+jjWnEK
 Dd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fyndVhlQb13TDZ3esc1S9oqyuqQXnQYXlc770BtW8OY=;
 b=qz2EbWJ78mlTlEtYoaKLQKMhr9q9LFLSWgw4vaA/v1d1FtNWM5AIRsA35+Mjxp4Nmr
 baTp7WaEZj35bcq2k9mZROXAiOnOQjo+rJpVpWoIrqx52p2LmcmbwXrRHrwHz+qt+4i4
 YbguGlDgCGAHG9BCm18xqp2LAoeo9D1gAwYDWg3oplxE2gcEnQpmMuwZG9ByiK+nKEvv
 w+YcX4F+kdd8MU7zFHkwqkoEQp0LuFEYa8tLYfA7M6cASHxbV0nfer3fqqyssKVogbEZ
 jTFst4bb0D8LL4fbW68H+LXOQrBcNjiSymXDnhPakpavnUunLYXr5VO8lHYO0F4yzkqj
 keFQ==
X-Gm-Message-State: AOAM530erLhD9vz88CFZZ/4GBwfkdmmC5CbNHlDgU82UP5N4OOy8UnHb
 V2sARrv8CBPALZy9l3ftfz/+zAFjzQvHgw==
X-Google-Smtp-Source: ABdhPJxkJlrWnAuKMMzqJ4OZ6UcTwrP17uxDUwhvB/GksEsjPFMYfswHiTPxOcEeQQhTMvJyULEeTw==
X-Received: by 2002:a63:2b05:: with SMTP id r5mr16412301pgr.0.1640031914332;
 Mon, 20 Dec 2021 12:25:14 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm233118pjd.21.2021.12.20.12.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:25:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/15] meson: Move linux_user_ss to linux-user/
Date: Mon, 20 Dec 2021 12:24:59 -0800
Message-Id: <20211220202500.111897-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220202500.111897-1-richard.henderson@linaro.org>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have no need to reference linux_user_ss outside of linux-user.
Go ahead and merge it directly into specific_ss.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build            | 3 ---
 linux-user/meson.build | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index eebeaab9ce..cc4df68b20 100644
--- a/meson.build
+++ b/meson.build
@@ -2382,7 +2382,6 @@ common_user_ss = ss.source_set()
 crypto_ss = ss.source_set()
 hwcore_ss = ss.source_set()
 io_ss = ss.source_set()
-linux_user_ss = ss.source_set()
 qmp_ss = ss.source_set()
 qom_ss = ss.source_set()
 softmmu_ss = ss.source_set()
@@ -2633,8 +2632,6 @@ subdir('linux-user')
 
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
-
 common_user_ss = common_user_ss.apply(config_all, strict: false)
 common_user = static_library('common-user',
                              sources: common_user_ss.sources(),
diff --git a/linux-user/meson.build b/linux-user/meson.build
index ca8b86f209..b2f4afd5e7 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -2,6 +2,8 @@ if not have_linux_user
    subdir_done()
 endif
 
+linux_user_ss = ss.source_set()
+
 common_user_inc += include_directories('host/' / host_arch)
 common_user_inc += include_directories('.')
 
@@ -42,3 +44,5 @@ subdir('sh4')
 subdir('sparc')
 subdir('x86_64')
 subdir('xtensa')
+
+specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
-- 
2.25.1


