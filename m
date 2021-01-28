Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39E30716E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:29:13 +0100 (CET)
Received: from localhost ([::1]:42122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52fw-0002gK-8c
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52am-0005jJ-25
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:52 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52af-0005e4-K0
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:51 -0500
Received: by mail-pl1-x631.google.com with SMTP id 31so2908147plb.10
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7upBAxh+r6e67PJNYJC15zDRNacBwT3vrKSjjXc1s0Q=;
 b=jGAh5On0geQZGQLoV+mk0Cdxo7APB7y2C4I9jg//oJjt4Kb2XcCvllYpv6mWWl/8p7
 3jHR7Dz8rbxZy3rI+ayRtERDFpKT2nAgnj7gmWHKMU3Xc1Ud5kE0RsSEGCpRID/ZR2zs
 FIyvpKBVh4yoy4XrzR0dNnDWbssBcNDogRUJEpB98UsdzzOycqpaumjkQiEla2vxRgo3
 6NYMiYZUwXSs63tR88Dwp6cDDJ6QPaC2prLK7QxMtjgE0EHE/Qv2oDVpiIO503J1ATXR
 yrhxQkv/s7N5IcK8Ws0ko4T7+xC/y3ZF8wVVMcOi1w3+aFhM1VyXXBdJFAScUcoAl30o
 hOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7upBAxh+r6e67PJNYJC15zDRNacBwT3vrKSjjXc1s0Q=;
 b=UL2ysjLEqluPPTkLsJEBVqzymgcwre/z1SAA2gHuBji/opNP6sZOHtx83HmTna10S/
 Jp6XxeOY5qZfQ7g8RmOtVqkqhS3hXBVaNc61xedfePBGjTmolF2Zu1eDOln/XRWZiloL
 XAb3EGv9CztnA+l330beRZNfNKAk8y0AYR0KokTVK12/BeL4AJDSjrTzNOc9b+IwMfIB
 fRf4mC1N/4clYFistSZN7KSZqAOhk2L4rgEdvW+L47eU3f6dZn9gfwdRozeVPUFUhl4s
 N1ynBn7fuXG46L+5c+h5KW+Xdit1orJH3nhGetGxNf42LQrZNruvnz0gmY18PR/QajqC
 g95Q==
X-Gm-Message-State: AOAM532ZkHquMs51hewthy76eqmATwXEP6W6i1b6LFqjb4fSkJ5Efav9
 huzyDi1AcBvA6TcRVxgqj/aYDT2zLru2vp8P
X-Google-Smtp-Source: ABdhPJwbevZy8XHB9fL2FD3mF6YrR83zJVuX3Coh+zdePxDwa4NzUk7mlKUk2MawDjjPcamjc0+Gow==
X-Received: by 2002:a17:90a:cb0f:: with SMTP id
 z15mr10375103pjt.88.1611822224056; 
 Thu, 28 Jan 2021 00:23:44 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/23] tcg/tci: Implement INDEX_op_ld8s_i64
Date: Wed, 27 Jan 2021 22:23:13 -1000
Message-Id: <20210128082331.196801-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20210128020425.2055454-1-sw@weilnetz.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 2edb47506e..0e1b8e8383 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -882,7 +882,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg8(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         case INDEX_op_ld8s_i64:
-            TODO();
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
             break;
         case INDEX_op_ld16u_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


