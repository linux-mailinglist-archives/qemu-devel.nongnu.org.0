Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F83655C00
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOV-0002Ia-Mu; Sat, 24 Dec 2022 18:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOS-0002HQ-NJ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:32 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOQ-0006Gx-Of
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:32 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso10213681pjb.1
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pj3A1RydZ5k++XJlvrH6d1P1H8txrpAYpf5yEofm078=;
 b=ZPvPDBrD3LjzYd+bOA2jDhlPFyel6/LPi78k5RWOeLH1Pdi+39AS63232BDTb8S0GE
 +BbjqjRchmxJofsjqrQWbO2wKWOv2wT4/izZ7drTfqXjZ0I7hDZEy0YoLNW0+syAduC2
 eZydlM9uY3JzhXmqlvdHrh4BfTJ035UjTw016LS0b5Rx0mV33vzYtij/32sBWLzx/Tw/
 g+im1DYDNLSsZxBhZ5TUrxFVK4LiLXhQ/4HJjjg7yPS5gi1Y0mRr+rODejdVtTOF9CTC
 jxrQtKY9mknJJTxqY7zMRiaTRwnntdeveJDnhcLu9zCJeE4Ny+jwgixm1vT2oQMvyCo9
 0SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pj3A1RydZ5k++XJlvrH6d1P1H8txrpAYpf5yEofm078=;
 b=YUlDgyRBccp9K/i2gjuaIEHJS3oiHEBY53UjP1CPvnDV4/KHzhgUDLm3ALiGSgbzRm
 4Ht3YNILI2pB09poXYu8WW0lgi3pz8Js5n61nCqtjPRjreeLA1oAt5NY87x1W7cbtgF9
 azwYda04w0gnh5n5JNH6IOgEU00HAhO9Gxv5tILYURwn/Kg7rlxQ8yG3p3AA0pbLcOIB
 UeU9hJangIoIETGpUzbl3iFqgyjlySO42HIsISGzAa4t0wQlE17JgNll6SsonYQrbzwb
 1oAh8SpBXsPrI6etl2UzJW4aRH/xB0HAmas9pbwfMn5fWLmu82VZo3RZhZ95W3wpB6a5
 1OlA==
X-Gm-Message-State: AFqh2koIp+zl5ATtwQM/xMv/eA/6RnX7MVrFKsz6sonu7NT/w4Hnp8yh
 GWIHQSUJVZwkNakh2nZPDvNXch2QUtQq/Mox
X-Google-Smtp-Source: AMrXdXuc0UAoxwuj1A43m+i4axWf6ZxbaBAm10HC8ygb5KlVi1Tq5TSAYFzGgznrMmZuigDNik/10Q==
X-Received: by 2002:a17:902:e944:b0:189:d8fb:1523 with SMTP id
 b4-20020a170902e94400b00189d8fb1523mr17004857pll.36.1671926249349; 
 Sat, 24 Dec 2022 15:57:29 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 07/43] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 ppc_maybe_interrupt
Date: Sat, 24 Dec 2022 15:56:44 -0800
Message-Id: <20221224235720.842093-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index add4d54ae7..287659c74d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2163,22 +2163,13 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
 void ppc_maybe_interrupt(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
-    bool locked = false;
-
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     if (ppc_next_unmasked_interrupt(env)) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
-
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
 }
 
 #if defined(TARGET_PPC64)
-- 
2.34.1


