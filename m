Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564686B2E14
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:07:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWh-0004OH-Tz; Thu, 09 Mar 2023 15:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWe-0004Bl-Kf
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:08 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWd-0000gT-3g
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:08 -0500
Received: by mail-pj1-x102f.google.com with SMTP id nn12so3132079pjb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EeRasJxEHBTEkcFIOKoj6XcD47W4lUol19HO+QVJY3k=;
 b=dyCDJMrbA9OPUB/7OeJsEKT/zo3hMXJiL9QsDqNZmN9VakE7Tso9eGYpK1F5zY3Et8
 9d6r6jt1tdf+rK1rYDm8rTCx2vLDE7KoEh6Y87qk4z4OXkytEYqmNOFmQGF50WblQjPO
 rX5UfubSbhtp2P0xO2//Hnm3TASD/7iMxnIP7GEHtxORjBuh+0HD6GkKqtxC5aqVV9AX
 9N7eGf4N48+tVVbu2uOe2fyc+kFCy89bD1Hzj4Diw3EqVa2+rQmBdgkapnJDqqpSx2IJ
 gACd3CHXvtoU2cMPYNU9v/jqxJaIv7yDRmPdMgg9cIBdkVtY75dAZfaE2ATu+KxLkOmv
 uTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EeRasJxEHBTEkcFIOKoj6XcD47W4lUol19HO+QVJY3k=;
 b=zRlRNH33ih/mkCypzuHKOWVSVl2iqlbE2hmqMUGKNV4lvVKHMFXiMd0VOnW7uf6KY0
 nngftfREWeo+7dmmNpRQZkol2N2Vr/JsGZxLarTLPZKcmwqoCPQsWYe2Os+KdePirWeD
 Nc5wbA6uRsUYe3652p87/kspOzQ6rET5dtfOTsoTQyMEVaWog41si1F6DIM9FwXWxJfx
 JyOFEB0q/8a7VHaaGjn+9xiae70AaBWIM59Dj/xqFx/sjflo3c6vZZ+sIWn/bxKIhtbx
 +NMA9KLeRtNZHpjcbqAJwMftPcZxiOldKgoyIlWvTa5gdHh1g4Ao0vwQ1HGXRSwz6Zkw
 rejw==
X-Gm-Message-State: AO0yUKW6u8zAzat7dq1iD037Djb4wu+vE+a+56PM4OakORHI8SdoYDAN
 dpjKNYWQaEBdg9nvGrLkK9GsC0qioFVX7LBYHWU=
X-Google-Smtp-Source: AK7set9fvpitHz0GP1Hr5gdWajtM1QDFwAzPgPZDGGTKx08YsNwbi9ypYU+sUGH1xrZKq8Tsy/a+Uw==
X-Received: by 2002:a17:90a:e7c7:b0:236:8e07:4c6d with SMTP id
 kb7-20020a17090ae7c700b002368e074c6dmr24033027pjb.7.1678392366350; 
 Thu, 09 Mar 2023 12:06:06 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 16/91] include/exec: Set default `NB_MMU_MODES` to 16
Date: Thu,  9 Mar 2023 12:04:35 -0800
Message-Id: <20230309200550.3878088-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-2-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index be920d4208..7d9e1f50d8 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -36,9 +36,6 @@
 #ifndef TARGET_LONG_BITS
 # error TARGET_LONG_BITS must be defined in cpu-param.h
 #endif
-#ifndef NB_MMU_MODES
-# error NB_MMU_MODES must be defined in cpu-param.h
-#endif
 #ifndef TARGET_PHYS_ADDR_SPACE_BITS
 # error TARGET_PHYS_ADDR_SPACE_BITS must be defined in cpu-param.h
 #endif
@@ -55,6 +52,14 @@
 # endif
 #endif
 
+/*
+ * Fix the number of mmu modes to 16, which is also the maximum
+ * supported by the softmmu tlb api.
+ */
+#ifndef NB_MMU_MODES
+#define NB_MMU_MODES 16
+#endif
+
 #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
 
 /* target_ulong is the type of a virtual address */
-- 
2.34.1


