Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F873C3527
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:33:28 +0200 (CEST)
Received: from localhost ([::1]:40572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Eys-0007xo-VX
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExJ-0004wf-N0
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:49 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExH-0002BD-Cd
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:49 -0400
Received: by mail-pf1-x42f.google.com with SMTP id q10so11649352pfj.12
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6CQ6Qnqlq6xTqG9WUDwZDgwIT9JsVyB41tajyHgQO/U=;
 b=OaOa9DcrNQEGHqLgJejxdc4OrxKuG7ipg7/1MKx8RF3WGKB+YwQyawMWQm9XAZ4sgW
 9jW+NUbtJkEY6jRX/dywsIoL3LPg86bGqaxUEekNO9AAN3qroU3CN+oyWvvRm+en20D0
 USCKvBFnYL6GgXaUs+vuMbdz5soE9wi9QveAOP/ISTJwbT1cCjD15D3Y0n9sKhDrPX0K
 UEz1EurUV3+VT0kXnFYFJ6lzrNkupgJMyyeUUYBolzb1Cd5RzTZ+FepFb/YHdar75b/b
 Yv2GWJ1dZOynab3wafmEBjmIC7TluiKygtw29gZE4wnMvMBhCs3iEZvc9L0fe356K85V
 EGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6CQ6Qnqlq6xTqG9WUDwZDgwIT9JsVyB41tajyHgQO/U=;
 b=I80v3OrzQAba3hVHjxynTBehyUbjH9aqmj3Fy+Wl2yTmZnFjM2NlGSNY6mcGxK+Jzi
 f/uIWYE/IhMXvsRAtfRTUMcmokPVPvk/Poj5FDMgqmKXnLtXaVHPbf2+vGq7HCXq9aPU
 wv+Nfb/0dvgVLtQmK2oo2s5N/KZPm3p2F3u6nge+uMfPj+PFnPyK88tzsfCeggOJ5NOW
 /jGCL9fU8Qx7C4k0MysscHSjqRytHJHOueodJqiPnl8zPOnIXzP1IYOqVfsz8NprU5iP
 KEFzgw0HvICeDu/ViSEx8Dld4KGixij8wNa+YrmVAgO5D9JhMEceQxYoUABf0w+ZP6FN
 OhYA==
X-Gm-Message-State: AOAM53310yYlm2oX/K6XT9YQ/cWSAgiF+z2C2PA1d9dRzqHKkeWnc7ZG
 NKy6gjqGVt/b9Sdd7h5Qaot5ijQj0+kT6g==
X-Google-Smtp-Source: ABdhPJzTW6c03uP2a1PXVGgg1A3n1P0fvHHc84VMiM0n4ztvK5A2Yq4GEF8NEU6wsYWoBwsTE0hY0Q==
X-Received: by 2002:a65:6283:: with SMTP id f3mr14639285pgv.370.1625931105548; 
 Sat, 10 Jul 2021 08:31:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/41] tcg: Add separator in INDEX_op_call dump
Date: Sat, 10 Jul 2021 08:31:03 -0700
Message-Id: <20210710153143.1320521-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We lost the ',' following the called function name.

Fixes: 3e92aa34434
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5150ed700e..4dd4084419 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1849,7 +1849,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
                 col += qemu_log("plugin(%p)", func);
             }
 
-            col += qemu_log("$0x%x,$%d", info->flags, nb_oargs);
+            col += qemu_log(",$0x%x,$%d", info->flags, nb_oargs);
             for (i = 0; i < nb_oargs; i++) {
                 col += qemu_log(",%s", tcg_get_arg_str(s, buf, sizeof(buf),
                                                        op->args[i]));
-- 
2.25.1


