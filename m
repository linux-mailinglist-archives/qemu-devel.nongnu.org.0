Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891106A65E5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCen-0000pF-Ey; Tue, 28 Feb 2023 21:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCec-0008VQ-V4
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:19 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCea-0003AT-SO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:18 -0500
Received: by mail-pl1-x62e.google.com with SMTP id i5so10872433pla.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A4w0v9Gc8NWU/ercwW4/O1xwObucfHLgMmrXMnd3774=;
 b=lWGiAt6Ke84q4BtGLp+WeO5n9yzckSvYg3s7zS5IhesOM+5ropqhV4qh5dhVgDEXgs
 AlYeEp6hYBbMJkc9Q4y2Wa57eAfzHStIxjpObo+fbP1ami++hHAGhGIFmhA6ZgkEIo92
 4iX7rCpFGmvUGrFkhJUwveUeiTNl0d4fyPVhhrRJkD1VHIkz4Ind+CPyesUKtBAtEriz
 E6vhweaDm0CPkENnEgWXa2+BeuXFjieAVgVUW3iwMahR3kaGmHcQY8bUUnsl2GoCSa0R
 HtC8s0ZOQpVGAFcQsJcxQjKj2urRqhAMIArmpvB/XjcnAC2h/ifJjbflX1wDrMEWunOg
 7mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A4w0v9Gc8NWU/ercwW4/O1xwObucfHLgMmrXMnd3774=;
 b=pvDv9sucWlz1wmFJ6W5iF54afqPRJ9hY0ErkW6HFqQatCqCzUa8eqeI7MNCiFnnKX1
 A03BTIJFcVVCU5GXVXjt9VJq/8h13IM70g6VFeF7yoQuT5xcQA0Ifi0fc9/DZDg/2N5W
 gdF0KOEXbEsmrFgK8baAxdK93zm0by97GLoxaMx4s8wsOhquywTH74/0th8vAPUiSZWL
 1SLjJe81cKvfrGw1GMNavopwxi9Jnz9zLk5AylzlOhFiscW3gvxkM6RDwXWjhAffEDLD
 r+Es0XQoI3NTeCzjL4jQlH8/lFAN6IZ5tB7O3ibHnpTfG4c34KBhb9Rt9u+C5XgNlSRM
 3Vlw==
X-Gm-Message-State: AO0yUKVKSR0+1ZWeAwnVW5vos8XlYoG1e5/vOQETUqxe7e+DVokVYqVc
 NNzD+ze6yKiKdRZuyahm8Oc2wHSvFmgevrJ+xHM=
X-Google-Smtp-Source: AK7set8lxtPqKA3ZamUiHEO5LeRsBWXHaEKXdI28Zjr/oAICjK4C9LmWaHaxwQgtgF0npf+Qi9KIbQ==
X-Received: by 2002:a17:902:c407:b0:19d:5b5:c159 with SMTP id
 k7-20020a170902c40700b0019d05b5c159mr6434698plk.1.1677639435201; 
 Tue, 28 Feb 2023 18:57:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 17/62] target/tricore: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:55:58 -1000
Message-Id: <20230301025643.1227244-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-14-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 594cd1efd5..d0a9272961 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -55,7 +55,8 @@ static void tricore_cpu_synchronize_from_tb(CPUState *cs,
     TriCoreCPU *cpu = TRICORE_CPU(cs);
     CPUTriCoreState *env = &cpu->env;
 
-    env->PC = tb_pc(tb);
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    env->PC = tb->pc;
 }
 
 static void tricore_restore_state_to_opc(CPUState *cs,
-- 
2.34.1


