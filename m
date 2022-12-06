Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB20643C7D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:42:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2PlM-0003AZ-K2; Mon, 05 Dec 2022 23:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlK-0003A8-3J
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:40:58 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlI-0002zw-IU
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:40:57 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 t19-20020a9d7753000000b0066d77a3d474so8595931otl.10
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ogIAt5FgnN0QLqnt8iJRtUeRa6SqWvj0nc+qu2gXRbE=;
 b=c2iY7ZK9ZSgzPYL3wq9Ggwp/MucD4vpw5JVke1h0rHikcb6FNNjGLMCwvGITPDxgBW
 Kg1mYxvs/oJ6kECIOHP4+CASyf0VBI8tee7lD3W9h0EFxHOPsiOlMHX9yCeAA/4QOSgf
 X39sSYO3POUJJG1oemURqdTM6QQMcxXNaBfYC38G/YBCS098NqZkbbPbSyxURq88qCDL
 cA8t3uC9u2n+ZfLBxvlZmWhGPAig1yE9vB336Cg/lteKagwk1ck5woH45JVPjKVNJYiP
 Sb1kFJcMALfGGO45DSMM3DkrVwLbV6MppmrMJ/NBttwJ6oMNjfA1ElGrJJt/nohKil39
 +PFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ogIAt5FgnN0QLqnt8iJRtUeRa6SqWvj0nc+qu2gXRbE=;
 b=rh8AkvFmHoR0uhhZTdUrPl4SoZF4qpHWI4Noc4kXaa5dddQrzCg92e2cGecQIC/B3c
 8L5s9na7Ok5qwWBncgZFL6SeNzZb192OVUwnMgZ86xKiKFwrfKlrnYHhMpGlffx8I5gN
 2vUl1PfADhuskPTpilIisO7FIXbFqINf/0mlwagKV+1TI4EGFaMkJGfGDxRBiJtaXG2i
 kOJEoI5QTyjQERNyBLHkRJLch+tvu/nZWDJSeQpPSX2fii4GQSa67fFcraB5zlRg5nXq
 zjGifww8KYm+cASZc+gXU+Di5TKkSEfcE8jUE5j+sPOZJfykCJkpIeIQDtM0501nBBnD
 y/fw==
X-Gm-Message-State: ANoB5plHW5/e3d6BY/+fzoU1DAOZrTB2zIG2zOagcfuJq2aQA+Jo1W+7
 hy/HkN+L1u6IEVl+Tz0N6pG4xWKbf/kSfFuD/2A=
X-Google-Smtp-Source: AA0mqf7uRXaywmi4GZMw68whTEIxHiweh4lHOUOfJ/PHwqj90s2i5P06L9+QLF9S3MSwJ7uIUos5jQ==
X-Received: by 2002:a9d:7b5a:0:b0:661:a568:7b30 with SMTP id
 f26-20020a9d7b5a000000b00661a5687b30mr32549140oto.132.1670301655391; 
 Mon, 05 Dec 2022 20:40:55 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05687041c600b001442fada152sm7561864oac.46.2022.12.05.20.40.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:40:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] target/loongarch: Enable the disassembler for host tcg
Date: Mon,  5 Dec 2022 22:40:44 -0600
Message-Id: <20221206044051.322543-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206044051.322543-1-richard.henderson@linaro.org>
References: <20221206044051.322543-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas.c                      | 2 ++
 target/loongarch/meson.build | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/disas.c b/disas.c
index 94d3b45042..758824d749 100644
--- a/disas.c
+++ b/disas.c
@@ -198,6 +198,8 @@ static void initialize_debug_host(CPUDebug *s)
     s->info.cap_insn_split = 6;
 #elif defined(__hppa__)
     s->info.print_insn = print_insn_hppa;
+#elif defined(__loongarch64)
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


