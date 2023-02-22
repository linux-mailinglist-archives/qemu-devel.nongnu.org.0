Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8618769FF82
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:30:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWj-0000WN-SK; Wed, 22 Feb 2023 18:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWb-0000VO-1o
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:49 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWZ-0005N7-Gl
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:48 -0500
Received: by mail-pj1-x1036.google.com with SMTP id u10so10861051pjc.5
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2x/6xSpCKlYJ34/8OxjWcHuDhp8kikr1JE7fyXvIhlE=;
 b=w5r8lj5wR+9iQYozZKSvwrYWbYw+WswE6/EkxaFVgi3eh+PLL0ZXxNszxpZTTRye+l
 1OUD4QJvZmVU8rSjh6pGBWrcr3Z7tjDWK/kMrc3QgsmVcBX5FiooUmMGDnSvX+DaXGS4
 KHXd7TCr5DL1YPC0p93bEIqyFZCDxH8/Vy5AuwC796U3LZKB/0ZKlsubcQS0BnK+KLOb
 M2CRh/Zm+sjsUWh4asMuKldSVeMflN8asGA7rqYV7KfNrhvEft3I9REmdHXfz+sGiQM9
 fcekc1hVfQMGIwSWzI7Q1ikaLiqAkvRFjU0fGoOIBzGwOw1Vt7BnTIT+jKxjsOobJCWx
 DO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2x/6xSpCKlYJ34/8OxjWcHuDhp8kikr1JE7fyXvIhlE=;
 b=pM5tfop57fL/rg8DLSWNEAMaWbrkvvBubW1LWobN+60UEUsej9BXqYt2jrxAXBkgny
 udRs2ZRY3B3NS9aMAnYX8/5j899e3RI7OWJ77h3Os7ChzAzwSKPqYhlDTuhqpk8hVMl7
 S/7P0ybXPLT+RTZLkFHP6TTFzpLk/Gjqs9/H4uLsImCDM/rmhJcyIVQK3i+ceTZyYR1s
 Epsu9bN1urDcWOjIzgWpDAOPuogUUAapXbdd6Mh1WwyXevi53bGADzitA+oVhawa0j8B
 BMrsfuHBp3+G/eHfwAd3KOe8143SlYOUhq+MXKipQc6SOVdRT3w233ChdAMQzerln6+q
 FzCw==
X-Gm-Message-State: AO0yUKV+d2dsTs2nG/9UOI3A8xc4kGnEnx7gPZQUiXxsxFs6xH9I8Zyp
 jE9vNAb2GzQzaRcvRbVkvgjtZFmqLAWU7vQcJkM=
X-Google-Smtp-Source: AK7set8vdmI2d7EpIQK/Wdg6RcSLcMFvvUvLPcPpcJRk6wzTjZrKKTMHHB3h7GN3OCntyG3CzJYvlQ==
X-Received: by 2002:a17:90b:1d05:b0:234:bff5:97e0 with SMTP id
 on5-20020a17090b1d0500b00234bff597e0mr9066409pjb.20.1677108466287; 
 Wed, 22 Feb 2023 15:27:46 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 20/28] target/hppa: Don't use tcg_temp_local_new
Date: Wed, 22 Feb 2023 13:27:07 -1000
Message-Id: <20230222232715.15034-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This wasn't actually used at all, just some unused
macro re-definitions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 0102cf451b..cee960949f 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -35,7 +35,6 @@
 #undef TCGv
 #undef tcg_temp_new
 #undef tcg_global_mem_new
-#undef tcg_temp_local_new
 #undef tcg_temp_free
 
 #if TARGET_LONG_BITS == 64
@@ -59,7 +58,6 @@
 
 #define tcg_temp_new         tcg_temp_new_i64
 #define tcg_global_mem_new   tcg_global_mem_new_i64
-#define tcg_temp_local_new   tcg_temp_local_new_i64
 #define tcg_temp_free        tcg_temp_free_i64
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i64
@@ -155,7 +153,6 @@
 #define TCGv_reg             TCGv_i32
 #define tcg_temp_new         tcg_temp_new_i32
 #define tcg_global_mem_new   tcg_global_mem_new_i32
-#define tcg_temp_local_new   tcg_temp_local_new_i32
 #define tcg_temp_free        tcg_temp_free_i32
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i32
-- 
2.34.1


