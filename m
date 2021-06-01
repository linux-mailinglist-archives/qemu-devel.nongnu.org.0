Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D8B397609
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:04:20 +0200 (CEST)
Received: from localhost ([::1]:42174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5wJ-0005tX-DK
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tM-0002CJ-P9
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:16 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:45585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tK-0002U9-Sr
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:16 -0400
Received: by mail-il1-x12f.google.com with SMTP id b5so13184418ilc.12
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+jwIdOBO2HuauixyPD0ovcZT3pv5ECKgnsaAtql7n/I=;
 b=RmnaGj0TjTTOgBAXxXlk5YxFmGGO+X04BfXf6VPl/XV6w9Z5MDlDaikGwCHNiQJKxX
 v7PYloizp0AC0cPm0FLVm9APJlRZ2SIQDz+ixxodc6OQ7vclT+xAbAJJ50UJ45b4LAGi
 1vQi/TU7uPfkYzCa9WUcmDWHvCiqXLdiHfb+UP4OPKOZZC0m3/COHyS1Dy2yeh8dXdcv
 PlYWzS9EpcKJ9KvA9vQ7IKpWKT+iL+kghh/tjFDP42T+TOi9+NRws2EgwRlRtDIwuo76
 xmLMvy1JjExzaJNednhqxQKr7Y7VZx9+pRuzjDZzUdgB/6ST6JguIvDu6DSKgLWH7TK0
 Poeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+jwIdOBO2HuauixyPD0ovcZT3pv5ECKgnsaAtql7n/I=;
 b=mpJVgfon28OjmBKIWHQKa4gD9qRPva+gPuaJtEjDj8gXvHqC4CfDDKchUnmrPteTqs
 xu/N9eBpuJvLm4PVw64SC+w6GPac2L0a5Bqe5kRbEyzxPknEIaiqrCXntnZ7Dtyyruzv
 +utl6nT7Ls8SLxd0Jn/BxXLTH4cNSxcBp4jJC+cdpQb3fUcANg2/skDRyM791zIKd1M5
 bXeMiSKNkml5QG4ZkaG5SOGm4KfUP3O2hBbZaI1qES5c6zs4fE9EOgNQvddbs6QBo/RX
 qSUefIUzjpbWD2Yy6SPDpgAGYF4XPi20h8k8/24rFZycytFTCLU2BXszNz3DaXfkoLu2
 0ePg==
X-Gm-Message-State: AOAM5325IwbhQJ9bAWxv4lCy0DZta6exyrqA0ytZnVzv7M2yqf0UREty
 gfA+NRyOyNBOSV5BEd6PLzaD+6yoCpX6x1/a
X-Google-Smtp-Source: ABdhPJwtCbRbclmFvnAhjEfEo0R35gnqUHkR+nXbzXiSCB4muyrXDycQYwf4MI8c3unraQTJ0i6Wsg==
X-Received: by 2002:a92:ad07:: with SMTP id w7mr21617507ilh.98.1622559673922; 
 Tue, 01 Jun 2021 08:01:13 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/27] accel/tcg/plugin-gen: Drop inline markers
Date: Tue,  1 Jun 2021 08:00:42 -0700
Message-Id: <20210601150106.12761-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12f.google.com
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

Let the compiler decide on inlining.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 7627225aef..48bd2f36f0 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -160,9 +160,8 @@ static void gen_empty_mem_helper(void)
     tcg_temp_free_ptr(ptr);
 }
 
-static inline
-void gen_plugin_cb_start(enum plugin_gen_from from,
-                         enum plugin_gen_cb type, unsigned wr)
+static void gen_plugin_cb_start(enum plugin_gen_from from,
+                                enum plugin_gen_cb type, unsigned wr)
 {
     TCGOp *op;
 
@@ -179,7 +178,7 @@ static void gen_wrapped(enum plugin_gen_from from,
     tcg_gen_plugin_cb_end();
 }
 
-static inline void plugin_gen_empty_callback(enum plugin_gen_from from)
+static void plugin_gen_empty_callback(enum plugin_gen_from from)
 {
     switch (from) {
     case PLUGIN_GEN_AFTER_INSN:
@@ -513,9 +512,8 @@ static bool op_rw(const TCGOp *op, const struct qemu_plugin_dyn_cb *cb)
     return !!(cb->rw & (w + 1));
 }
 
-static inline
-void inject_cb_type(const GArray *cbs, TCGOp *begin_op, inject_fn inject,
-                    op_ok_fn ok)
+static void inject_cb_type(const GArray *cbs, TCGOp *begin_op,
+                           inject_fn inject, op_ok_fn ok)
 {
     TCGOp *end_op;
     TCGOp *op;
-- 
2.25.1


