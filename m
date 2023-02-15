Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019C1697F60
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:19:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJYK-0002SM-RD; Wed, 15 Feb 2023 10:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSDSX-0006xl-Pk
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:48:14 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSDSW-00071l-8E
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:48:13 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-16e353ce458so4576287fac.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 00:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sIH7K1DDuKRwsNfFS8vI4Hl70V/+l27EFqfoP6TzJWo=;
 b=ZLH8CSJW7e/iH8C/aRz4+H/i08F/baspPZZElIF3+10T7aiHhSuWzxubx+vGkmX9cF
 t6Ersoj99a+2id+m2Ljo1PalvhDNHIiMQoEa4vaH1P7BBbjvG0ala8CaxVyv1BT2C2EN
 egkZ2boPDalPN/4uPvmwxb6bMZqgpsKZE0/l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sIH7K1DDuKRwsNfFS8vI4Hl70V/+l27EFqfoP6TzJWo=;
 b=bI0qXAY5OvC1Z+HtZ09tn/UtXvn+eOcW26kczf/fnny7h9ZOtO/v0wYtiHom3PtF1h
 iUKhAG1aNSoRJnM38pYxkIfLITSKIs4Mriym8YOmPq95Vh2jm8Q7iy9waAo044I4bgNB
 2HnjK/6HescSbDoRZxDWK1oJL5gyeQk3G0OCHJiKTIdau4nDFFuBPaMdKMAjZLKVnQuD
 68Bkn7tjkhXShUf970jSwBP9qRdOA/jxFmrlPZw/38M2MRSwbI8G1LCE+0TrKciaEBWk
 r9Rj6loi/53Os9GdYzbI8OvEFXXoUmcZ30QFzeHj+IH4pQfmoEYT6QPfjsNRy0n+j8RU
 /GYw==
X-Gm-Message-State: AO0yUKWzdSDkNXQqCB7N2ax/E3oW16JwDkyur5gRp8yLn4XX2/jdcTIt
 bCmnbf3RUUoWZg5NKi2FW3dj3RdU3KQk3oiB
X-Google-Smtp-Source: AK7set8gDJleoiAOwe10u465wD6EUyTdxGJK/hhWZ7HR7Fd+fqHE+FZ9ZkhWjl1i4ABFe7uT6qA5wg==
X-Received: by 2002:a05:6871:204:b0:16a:a8af:1cd0 with SMTP id
 t4-20020a056871020400b0016aa8af1cd0mr760817oad.5.1676450890692; 
 Wed, 15 Feb 2023 00:48:10 -0800 (PST)
Received: from WR-NOWAKOWSKI.fungible.local (77-255-255-121.adsl.inetia.pl.
 [77.255.255.121]) by smtp.gmail.com with ESMTPSA id
 a9-20020a056870d60900b0013bc40b09dasm6788811oaq.17.2023.02.15.00.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 00:48:10 -0800 (PST)
From: Marcin Nowakowski <marcin.nowakowski@fungible.com>
To: qemu-devel@nongnu.org
Cc: marcin.nowakowski@fungible.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 2/3] target/mips: fix SWM32 handling for micromips
Date: Wed, 15 Feb 2023 09:47:53 +0100
Message-Id: <20230215084754.3816747-3-marcin.nowakowski@fungible.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
References: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=marcin.nowakowski@fungible.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Feb 2023 10:18:35 -0500
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

SWM32 should store a sequence of 32-bit words from the GPRs, but it was
incorrectly coded to store 16-bit words only. As a result, an LWM32 that
usually follows would restore invalid register values.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
---
 target/mips/tcg/ldst_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index d0bd0267b2..c1a8380e34 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -248,14 +248,14 @@ void helper_swm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
         target_ulong i;
 
         for (i = 0; i < base_reglist; i++) {
-            cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
+            cpu_stl_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
                               mem_idx, GETPC());
             addr += 4;
         }
     }
 
     if (do_r31) {
-        cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
+        cpu_stl_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
     }
 }
 
-- 
2.25.1


