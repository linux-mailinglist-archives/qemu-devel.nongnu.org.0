Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436266A8F86
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:00:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcq-0007XL-BR; Thu, 02 Mar 2023 21:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvco-0007Vk-CV
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:26 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcl-0001s6-Vq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:26 -0500
Received: by mail-pl1-x62b.google.com with SMTP id a2so1357344plm.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wh4TGmta6KxxW4dXBB2Rrca4W4QJFWocfsDlY9pkBAI=;
 b=ZDa5PO+zBCiVL2e0e6EO7+8jePdHFOXeUPD3s/Qks0ANq4FahMk39oKhOwOV2EFNLo
 6u6YKkrJgXrAXbJa0VshPjxP2iEzox31MckeA+yYbaxgj+RIP8D43Ihxpo6WxEmmGdOj
 0tb0UNFbTAieu8M0lHBMo0K7/a9v44UByCd5oGRDMZgDNBlZyrfhtX9WJ9pN2sr2TXYX
 mgrYxt5lkficjeoSQkVwLqfmvq1x57njBR7dY7NRul2/zABzYrb4gwObrJPoF+dLwySt
 1BqkwmIM6h/2leA32kAnkqUg5FZ+SNc6MQm7wWbnTeyeWUlW7GDv/xOokxedqVcvV0zA
 0xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wh4TGmta6KxxW4dXBB2Rrca4W4QJFWocfsDlY9pkBAI=;
 b=tyIbFpmZEXxDXnBsSosKJUaBLXGQA+A5Ym2W4FExn/CqB4lc0qh6avw72kv6BKvLOK
 Kt604+v779ue4onRTEZC9le2z4DY8OL6/d8a5hipMBtVntoM5TQGevFyXe/rGBee7a+t
 g4KH7Y+pXhVZ+rFVCxXkoHBAyJ2lSfP7LRdqs+qtmzbND3gRQ4sa+9scR6rCm9BprxdP
 jLijfG3PsRwAvS91Koogo37Bq1GxvKY7/D1tT61jRad4RWvpjFRLKgXLEqno+wKF9jtb
 ENvQntruJodWpj7IUQCSXFfiwk5BYFMf0d5u3p7zzmRxJFavXK0VddxQDcnGSrlZoJJr
 gRcg==
X-Gm-Message-State: AO0yUKW6YJEzmSQF+NjCC+YpCN0zEIFMWVEGfszEE7wS5rWlpMTh4dcE
 DOsRN8FI3kDz2Z0UHJIM2YGITMcmM+0SdMLm2aM=
X-Google-Smtp-Source: AK7set8FHUFnG9AKLOPjDl86RwU1t07WIE6SLtF4YGDOH7yn0+iWkCYZN+gJnwNr1iXoC6Kb5rLkag==
X-Received: by 2002:a17:902:e54f:b0:19c:b4e3:c65b with SMTP id
 n15-20020a170902e54f00b0019cb4e3c65bmr659386plf.8.1677812302499; 
 Thu, 02 Mar 2023 18:58:22 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4.5 18/29] gdbstub: fix address type of gdb_set_cpu_pc
Date: Thu,  2 Mar 2023 18:57:54 -0800
Message-Id: <20230303025805.625589-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

The underlying call uses vaddr and the comms API uses unsigned long
long which will always fit. We don't need to deal in target_ulong
here.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-19-alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 7301466ff5..b8aead03bd 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -535,7 +535,7 @@ static void gdb_process_breakpoint_remove_all(GDBProcess *p)
 }
 
 
-static void gdb_set_cpu_pc(target_ulong pc)
+static void gdb_set_cpu_pc(vaddr pc)
 {
     CPUState *cpu = gdbserver_state.c_cpu;
 
@@ -1290,7 +1290,7 @@ static void handle_file_io(GArray *params, void *user_ctx)
 static void handle_step(GArray *params, void *user_ctx)
 {
     if (params->len) {
-        gdb_set_cpu_pc((target_ulong)get_param(params, 0)->val_ull);
+        gdb_set_cpu_pc(get_param(params, 0)->val_ull);
     }
 
     cpu_single_step(gdbserver_state.c_cpu, gdbserver_state.sstep_flags);
-- 
2.34.1


