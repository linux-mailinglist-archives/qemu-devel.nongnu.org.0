Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613694385B2
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:03:58 +0200 (CEST)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP7N-0005mQ-Ez
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOuY-0007sx-MM
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:43 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOuW-0006HQ-HD
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m22so1507861wrb.0
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/DCgbVw+IWwtmfhUeAw0OJzG5d3SGRVlyig0pM8g5Pc=;
 b=lUzLDqp3jtACykWhHjgcvlgfNJ4BPpYSRu9/XVThB2iSlCp8FPVKQ9kjYroJbOawm+
 uFAgh5OayPQBv6d8oniGsdzf/rr1S4WvPMPLnyqnV//JfIxHigDyeEo/nM0SPDK/0eme
 9K13Vbge71e8pV6Py6EB5b/mbwuyuFN61oEKipoVhgej18A0JoEWwvNTVKT0CIK+mRe4
 NB2dSUjMHCrFi9oDkvG1bxJXe8wiZZM6RutKtzUfcKnXTfvRb5v741xE+ejwFr1qb3gi
 XPSmcmz1W4mBNKQgRY+etCMlC+QdqWOn3VBLoKFRgJk20o7Sjem1lWMXs1UakvYMhZZp
 AKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/DCgbVw+IWwtmfhUeAw0OJzG5d3SGRVlyig0pM8g5Pc=;
 b=c4ukRlSBAViThPbQeHh7+N6nEGjOv8oo2sB5YMYLW2Syziiwu3lNS7eeKNz+27n619
 iGs750jrUBAI68C0WSjeT4Tw6als7tG5OHVRuJXOeYu462NVnT4pJSdpselZIUMyi38E
 9cx7fHSreLC0VKS6tEA0d+D115J1Ahu/UMmzUWWBFCPdbN50bQ+nY5OLIOYI9+6G4kkk
 9SUZU85m7/P4tX8yJlGWSfqZNAbrCrvOvzUlHRlIE1AW/P+X0j/M7PJrM0HFkV+by0Hh
 dAjK3G23K8idyQKOuhHqtpGU6jlasGHibUtLLwwyyRhGKzm9ImIIXdZ4/DKYBKuR4D35
 QFQw==
X-Gm-Message-State: AOAM5325OfudBk4BoMGBBkZ1h//48VnWRarVMR6XA7Nvvjovw8euQnL6
 EbKh3SdS4ybZZTBnxm2n235lPACUbXE=
X-Google-Smtp-Source: ABdhPJwzcYgLCMgXjh4owB7y6WR4htDU7K0R0civQf3D+XVYiVs5I2jRyoWdfEsnxTPVshYBt+1rHA==
X-Received: by 2002:a5d:4949:: with SMTP id r9mr1857262wrs.439.1635025839117; 
 Sat, 23 Oct 2021 14:50:39 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o10sm12999826wmq.46.2021.10.23.14.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:50:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/33] target/mips: Remove generic MSA opcode
Date: Sat, 23 Oct 2021 23:48:01 +0200
Message-Id: <20211023214803.522078-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All opcodes have been converted to decodetree. The generic
MSA handler is now pointless, remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      | 2 --
 target/mips/tcg/msa_translate.c | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 52dac0fde6d..8189eae3499 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -245,6 +245,4 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   LD                011110 .......... ..... .....   1000 .. @ldst
   ST                011110 .......... ..... .....   1001 .. @ldst
-
-  MSA               011110 --------------------------
 }
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 51af6f39cc4..5d8cad378e6 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -865,13 +865,6 @@ TRANS_MSA(BMNZ_V,   trans_msa_vec, gen_helper_msa_bmnz_v);
 TRANS_MSA(BMZ_V,    trans_msa_vec, gen_helper_msa_bmz_v);
 TRANS_MSA(BSEL_V,   trans_msa_vec, gen_helper_msa_bsel_v);
 
-static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
-{
-    gen_reserved_instruction(ctx);
-
-    return true;
-}
-
 static bool trans_msa_ldst(DisasContext *ctx, arg_msa_ldst *a,
                            void (*gen_msa_b)(TCGv_ptr, TCGv_i32, TCGv),
                            void (*gen_msa_h)(TCGv_ptr, TCGv_i32, TCGv),
-- 
2.31.1


