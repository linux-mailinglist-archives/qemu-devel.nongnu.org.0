Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3266A678DE4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:06:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gk-0008Qs-OI; Mon, 23 Jan 2023 21:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gd-0008PB-He
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:24 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gb-0003se-Lb
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:23 -0500
Received: by mail-pj1-x102f.google.com with SMTP id o13so13449916pjg.2
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gK/RYDKYmyheuWzEx2e/8fES02grPktU+6HiGLPgSJw=;
 b=daAYxI9MwewWigLTaaAZX8CvImZz5m630ZPFGko+cTVKJTB6TEcdjuPoMFJB1yzBD9
 LnfU5guLbNTgJcIU3xuUQ60at8IBYVTESrZsvcQLUamW5BX20y9oSt48nxyRtLOkhx5K
 FoDT9rSCHeqNX/ofK7ftjqn7XtQSq3Wdv7ATZeiXV1C0kIXhqcRBQKkrHDdmuiCB+k7/
 qiOkRhl6P8lP70bS9qj8rYiwJSNdw7p616LDJsqToCcBMpftKdeHOK3LbZrIG24vUGxS
 zcl2+nNua13Qe3nVB0WhiHYI8MiRD55Ur7I1hEntVzDOhEtcFM+zDRkOikYl4POhUta3
 kHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gK/RYDKYmyheuWzEx2e/8fES02grPktU+6HiGLPgSJw=;
 b=Q/7DIQeaorsqCOrqElgJwyXxWgM6ppOsQT5pumd14TB8nZb9seYP6gNZhSoJkDVo2k
 Z2fZqGzP4KdUu6Fc/LtWtdCQDYYbrOqLm6TpquDPsyqrexmWoyu2jERvqxz/CaSSA7fS
 17L+3Q2BX48tpRRbs+pAi6AM6rbtD/tsUy7SJ/U3XWNst03aQiZMouTX8z1LhQX8/usX
 UixAEPMxEn+QqbfQSa2b58yBi71gpBaOkXIPIF1Lanr9cAde4XzFhxEyS28mpzv3zjUn
 DHxRO+3YSnl1pA8cNTGTie43ECVGFyTUdDbet18u9dNZK98U1TvqxA61JQFdCxG7MJ5x
 SjBA==
X-Gm-Message-State: AFqh2kppyPa6N3Cdrz4MhrMxsWnigD2obxMXkYzR9iX0+dMTOstrGVaQ
 zISX2JtqVLEWenMADkVb4k0t4C71p6Fqr4HJ
X-Google-Smtp-Source: AMrXdXvtkSKH0gY+SO5SpgSilBsyLlDhLK8YgSxEPyPrDlNjwAMtfR1sjbUV5hyr5uVIvGAkH2nbyA==
X-Received: by 2002:a17:90b:1d0c:b0:22b:b76b:5047 with SMTP id
 on12-20020a17090b1d0c00b0022bb76b5047mr14092285pjb.8.1674525920227; 
 Mon, 23 Jan 2023 18:05:20 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 06/15] target/loongarch: Enable the disassembler for host tcg
Date: Mon, 23 Jan 2023 16:04:58 -1000
Message-Id: <20230124020507.3732200-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
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

Reuse the decodetree based disassembler from
target/loongarch/ for tcg/loongarch64/.

The generation of decode-insns.c.inc into ./libcommon.fa.p/ could
eventually result in conflict, if any other host requires the same
trick, but this is good enough for now.

Reviewed-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas.c                      | 2 ++
 target/loongarch/meson.build | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/disas.c b/disas.c
index 3b31315f40..b087c12c47 100644
--- a/disas.c
+++ b/disas.c
@@ -198,6 +198,8 @@ static void initialize_debug_host(CPUDebug *s)
     s->info.cap_insn_split = 6;
 #elif defined(__hppa__)
     s->info.print_insn = print_insn_hppa;
+#elif defined(__loongarch__)
+    s->info.print_insn = print_insn_loongarch;
 #endif
 }
 
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 6376f9e84b..690633969f 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -3,7 +3,6 @@ gen = decodetree.process('insns.decode')
 loongarch_ss = ss.source_set()
 loongarch_ss.add(files(
   'cpu.c',
-  'disas.c',
 ))
 loongarch_tcg_ss = ss.source_set()
 loongarch_tcg_ss.add(gen)
@@ -24,6 +23,8 @@ loongarch_softmmu_ss.add(files(
   'iocsr_helper.c',
 ))
 
+common_ss.add(when: 'CONFIG_LOONGARCH_DIS', if_true: [files('disas.c'), gen])
+
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
 
 target_arch += {'loongarch': loongarch_ss}
-- 
2.34.1


