Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970266A4476
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:34:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeDI-0006o3-JN; Mon, 27 Feb 2023 09:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCa-0006Yb-6n
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCY-0000fj-BW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:03 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so3407538wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9i8Ap7rsoDJGC5IE6sGz5Ob3MAuQT6Rsd3pA6gNBUDI=;
 b=WpkHBP5vu/Eg1TybTsaiNo8cESIRxpz5CEo0UI/UChm/dmf5THZRbF7F8aCgNliPAp
 OGjcfTT14P4FJXtfax94Wzlmn+vpVBtRnriRchNKhL11kE20RJBRmSOEMWgx4TnDEfQZ
 YaXCI+ga7QXMiIZXUbV2o24KeE7UCPV+yv0sOGc4YvSXcbu9Jh0K1wZFWZ5eHgcyETAG
 cwfXtmTVOhNn3hQf5vA4/4to8Cop1jJ9VeVjFtSPq0CCRPcFSuLyFBoGq5B1vFAvqx0d
 ekwNBnfIkP70PhelPvyC+zu2OqUQQ6ZUDG2fNWkK7rQhE0l8k3bPOpaao2u98D3Lf36W
 zLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9i8Ap7rsoDJGC5IE6sGz5Ob3MAuQT6Rsd3pA6gNBUDI=;
 b=jZLM0xCGqgfqRzc2mFGOnLk4R5jz8jp4CIRtkCOp0NEamx7xMacjGliYRwHPdOAoU3
 uom4TA2GF3v/OU90aDZwh2AU6Hz2IlxgSLyHtGB61ZHRw7o85qLRO4NAy4IVodNOr9wG
 3LBmZ6RFJTkTn1x1qUTRRwqRjPfP0Qvev23Bl9F/whHEanoX144lweYmtBAnlIR53k+H
 hZK7jTYKQXePH6M9xdekPRPYZjjUQYCb2WgtvnBGE/3bMJKvnwoB606QA8U3eL8l6iv9
 kySa7n/EWoy/STAPeqZ1rzp5hohKdVwaGxcMOJsr4hK6A6VZ4F5xAqzjuGvc3FminB41
 9RVg==
X-Gm-Message-State: AO0yUKWPSFmxnIGUppCg85wzJkcgt6eVAPP8YCUsySrmHQN0KoOEgvQT
 4tgtbuTI9t4Pdd0yt77F5MyD8O6fGz+OnivQ
X-Google-Smtp-Source: AK7set+xVOaTZxOzngpl4+dIuKKovqVjwBbFgfT34+sZiV3B9ndU+oRSVcn/ddkKmAb6GBNhoKYFxg==
X-Received: by 2002:a05:600c:492a:b0:3dc:42d2:aee4 with SMTP id
 f42-20020a05600c492a00b003dc42d2aee4mr12956427wmp.25.1677507000532; 
 Mon, 27 Feb 2023 06:10:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h8-20020adff188000000b002c54241b4fesm7121983wro.80.2023.02.27.06.09.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:10:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 095/126] scripts/checkpatch.pl: Do not allow assert(0)
Date: Mon, 27 Feb 2023 15:01:42 +0100
Message-Id: <20230227140213.35084-86-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Since commit 262a69f428 ("osdep.h: Prohibit disabling assert()
in supported builds") we can not build QEMU with NDEBUG (or
G_DISABLE_ASSERT) defined, thus 'assert(0)' always aborts QEMU.

However some static analyzers / compilers doesn't notice NDEBUG
can't be defined and emit warnings if code is used after an
'assert(0)' call.

Apparently such compiler isn't as clever with G_DISABLE_ASSERT,
so we can silent these warnings by using g_assert_not_reached()
which is easier to read anyway.

In order to avoid these annoying warnings, add a checkpatch rule
to prohibit 'assert(0)'. Suggest using g_assert_not_reached()
instead. For example when reverting the previous patch we get:

  ERROR: use g_assert_not_reached() instead of assert(0)
  #21: FILE: target/ppc/dfp_helper.c:124:
  +            assert(0); /* cannot get here */

  ERROR: use g_assert_not_reached() instead of assert(0)
  #30: FILE: target/ppc/dfp_helper.c:141:
  +            assert(0); /* cannot get here */

  total: 2 errors, 0 warnings, 16 lines checked

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230221232520.14480-3-philmd@linaro.org>
---
 scripts/checkpatch.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 6ecabfb2b5..d768171dcf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2982,6 +2982,9 @@ sub process {
 		if ($line =~ /\bsysconf\(_SC_PAGESIZE\)/) {
 			ERROR("use qemu_real_host_page_size() instead of sysconf(_SC_PAGESIZE)\n" . $herecurr);
 		}
+		if ($line =~ /\b(g_)?assert\(0\)/) {
+			ERROR("use g_assert_not_reached() instead of assert(0)\n" . $herecurr);
+		}
 		my $non_exit_glib_asserts = qr{g_assert_cmpstr|
 						g_assert_cmpint|
 						g_assert_cmpuint|
-- 
2.38.1


