Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5517A30E9A0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:51:43 +0100 (CET)
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7To6-0001yS-Cg
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiA-0004cl-15
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:37 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ti4-0003Zs-7a
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:33 -0500
Received: by mail-pf1-x433.google.com with SMTP id q20so1061354pfu.8
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=onZUWhtxKDVzYiKYm4mcVALF5M4RSZvicSg1zN9qm0A=;
 b=hBRwnBjJOGd90+PlG3cx3eV94tCTthP6l6BAbCd6MkTYms3dLPFhe3ZeeWzwboJXdM
 C06ztdWAeeXl5rVM0JZaxUrq/eg70N6hwcDQJ5JrUlDGqnuedca/rSIgvhwTQ9Rch2jU
 xDvyH651hvdCulacf7xtk3nqYqNd01xvhsQiNk9Dc8fK3bITPg5EwmE+vP4ywN+f45Ew
 ok9t8Clf6dOysDCZK4eb6RtSsbaJ18W8XN+5QxRn21ekaAVSOQwJFh/tBYvWTGZLAi/U
 ji7Ny6C53NbgJI/p7q03SEcbt79m2BKyLOXA5sNt6XOHJZZUbpU8//8A7u9D3Jkyr9Rd
 vSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=onZUWhtxKDVzYiKYm4mcVALF5M4RSZvicSg1zN9qm0A=;
 b=Ts5UmPxALkmbewLbCCpRBWhKMhyDG8q3VsXyiKrd0C0V6KacY0ZNzFQBNpDESF6o6v
 BAmRSjZgEeiSTCUvVIloRXj/6XkbgJVaMDQ033Q95YaXh5k8ydgRvQTKLIStJBJpyefi
 z3Gyph+NoNf36SdA4v1AaXhB/2+bqO8/38a5j0RIvZbpoe9W4NLiDku8Nk7NBzUdVXEB
 L19XeWGG4AwTp3wHF+AgomgJkQEG3/nI6rAH0AxFwkqDnQDLOX3W7XlMqKpU3obQ4MaX
 ezGH1HNxFDrmZU1CAQy9YLhtCSkQTT0JjA6NBEM55/ZVNjijFFsBOsJ5yU7BE6n52q3W
 VMVw==
X-Gm-Message-State: AOAM532SC+Bo04lZbG2qlz7PkC3/cTeNRGr27LqcoKxPUgbi8Pjt5Ud1
 kWfG78/JufAztw8XbbIp3Uq3GC9FeqLhOeAb
X-Google-Smtp-Source: ABdhPJwD30+jKm/CpC0pIN4jgY2sHgksObJNp2+PewkQMu9Bp4mqIPrOrd6UCJzfjKMKLm8hu/8dKg==
X-Received: by 2002:a62:401:0:b029:1c3:fb36:8f55 with SMTP id
 1-20020a6204010000b02901c3fb368f55mr5737251pfe.52.1612403126215; 
 Wed, 03 Feb 2021 17:45:26 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/93] tcg/tci: Implement INDEX_op_ld16s_i32
Date: Wed,  3 Feb 2021 15:43:42 -1000
Message-Id: <20210204014509.882821-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

That TCG opcode is used by debian-buster (arm64) running ffmpeg:

    qemu-aarch64 /usr/bin/ffmpeg -i theora.mkv theora.webm

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20210128024814.2056958-1-sw@weilnetz.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index b3f9531a73..2ba97da189 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -615,7 +615,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             TODO();
             break;
         case INDEX_op_ld16s_i32:
-            TODO();
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(int16_t *)(t1 + t2));
             break;
         case INDEX_op_ld_i32:
             t0 = *tb_ptr++;
-- 
2.25.1


