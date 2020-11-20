Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6080C2BB81F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:11:54 +0100 (CET)
Received: from localhost ([::1]:42424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDhB-0004np-A2
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDeX-0002zO-39
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:09:09 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:32794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDeT-0003ok-3X
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:09:08 -0500
Received: by mail-wr1-x433.google.com with SMTP id u12so11750192wrt.0
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NFuue+LTHum6VoJqYKvYdWIpH/gw7xw5rZVXgy/xi24=;
 b=GAsy7mdyl6zHsrVKjG1tONRaq8KrkjbtGkDpWy/Yh5wDLZWyRZKif6Q7GlXQRo9vre
 CvUjZunNH8qZ1mZWAHkAWmy6XfkHHzB1H9Vp2fDlXVHF6kKtH2zpL5iZ/YYHwmbqJjxy
 QQtZNOMbq5QrOOupmuaLqON1NNDuiskY3cSuOTe1GDCPORxN0oljyD+mzniPZGqlFFBN
 g4U+F8y3hQVBzC4J0s8msRPqO2FTOStezERWjOA0jlQg6mZHECtefuJbAby9oE0efqnz
 SVHBq5LOdn1nX5tHkdXa8/vPcS4dzGvxvXV71AOhuWCr8LaX0CcRrqBlo4aF3J7kND7l
 4k0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NFuue+LTHum6VoJqYKvYdWIpH/gw7xw5rZVXgy/xi24=;
 b=ISRRc9x7KtucDiYDXysac8L0Pxd0mOaedURX6GIxmqj6mIRKmBWRg916oG4AaCB5KH
 YvNK/KshGbWQpspHwMxSo0+2ykB3WNryb8b/axJGHRQVFeCgu5dfx4IzFz93k5BBEd/A
 V03ipT+T21WFh0iVGcO1H1a1fxaAjwZoIemvcS9GEsBJcFgf2kiI93bOjpEhhlQ+mW0Y
 uwPyAej0cYmGvQVs74IrwoMChiyD0Fu/YTMSnSrVb/61sK6F/KEXK4CoWc2GwxtWgYlP
 uKnrz8JBldPJq9XanFrUPEjT7Q4KHw2sWlixfhcgcRZpVGYRj/FDoE0zFiHla+0lmsCq
 ZwNQ==
X-Gm-Message-State: AOAM5321g3mnCJsp59N3c0nDnfYLKij0D0dS2evNSbQeMG81SkhB5Ja9
 Vxc4AxDRNVOPKYjML3vjRBU7NVgHCJE=
X-Google-Smtp-Source: ABdhPJwaP6EVW9PfGYZIPWoNDIY2/5VkCNsyAeMzh84yswQ10qVgR1JFT3ebSDrnj5rX+FjcuWdTrg==
X-Received: by 2002:adf:eb08:: with SMTP id s8mr19212697wrn.12.1605906542531; 
 Fri, 20 Nov 2020 13:09:02 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f2sm6738132wre.63.2020.11.20.13.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:09:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/26] target/mips: Extract MSA helper definitions
Date: Fri, 20 Nov 2020 22:08:21 +0100
Message-Id: <20201120210844.2625602-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep all MSA-related code altogether.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                  | 437 +------------------------
 target/mips/mod-mips-msa_helper.h.inc | 443 ++++++++++++++++++++++++++
 2 files changed, 446 insertions(+), 434 deletions(-)
 create mode 100644 target/mips/mod-mips-msa_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index e97655dc0eb..a44f42c6201 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -781,438 +781,7 @@ DEF_HELPER_FLAGS_3(dmthlip, 0, void, tl, tl, env)
 DEF_HELPER_FLAGS_3(wrdsp, 0, void, tl, tl, env)
 DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
 
-/* MIPS SIMD Architecture */
-
-DEF_HELPER_3(msa_nloc_b, void, env, i32, i32)
-DEF_HELPER_3(msa_nloc_h, void, env, i32, i32)
-DEF_HELPER_3(msa_nloc_w, void, env, i32, i32)
-DEF_HELPER_3(msa_nloc_d, void, env, i32, i32)
-
-DEF_HELPER_3(msa_nlzc_b, void, env, i32, i32)
-DEF_HELPER_3(msa_nlzc_h, void, env, i32, i32)
-DEF_HELPER_3(msa_nlzc_w, void, env, i32, i32)
-DEF_HELPER_3(msa_nlzc_d, void, env, i32, i32)
-
-DEF_HELPER_3(msa_pcnt_b, void, env, i32, i32)
-DEF_HELPER_3(msa_pcnt_h, void, env, i32, i32)
-DEF_HELPER_3(msa_pcnt_w, void, env, i32, i32)
-DEF_HELPER_3(msa_pcnt_d, void, env, i32, i32)
-
-DEF_HELPER_4(msa_binsl_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_binsl_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_binsl_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_binsl_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_binsr_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_binsr_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_binsr_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_binsr_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_bmnz_v, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bmz_v, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bsel_v, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_bclr_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bclr_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bclr_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bclr_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_bneg_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bneg_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bneg_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bneg_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_bset_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bset_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bset_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bset_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_add_a_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_add_a_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_add_a_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_add_a_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_adds_a_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_adds_a_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_adds_a_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_adds_a_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_adds_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_adds_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_adds_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_adds_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_adds_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_adds_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_adds_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_adds_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_addv_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_addv_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_addv_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_addv_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_hadd_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_hadd_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_hadd_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_hadd_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_hadd_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_hadd_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_ave_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ave_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ave_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ave_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_ave_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ave_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ave_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ave_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_aver_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_aver_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_aver_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_aver_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_aver_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_aver_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_aver_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_aver_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_ceq_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ceq_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ceq_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ceq_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_cle_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_cle_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_cle_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_cle_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_cle_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_cle_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_cle_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_cle_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_clt_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_clt_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_clt_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_clt_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_clt_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_clt_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_clt_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_clt_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_div_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_div_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_div_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_div_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_div_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_div_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_div_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_div_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_max_a_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_max_a_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_max_a_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_max_a_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_max_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_max_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_max_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_max_s_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_max_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_max_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_max_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_max_u_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_a_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_a_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_a_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_a_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_s_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_min_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_mod_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_mod_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_mod_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_mod_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_mod_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_mod_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_mod_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_mod_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_maddv_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_maddv_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_maddv_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_maddv_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_msubv_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_msubv_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_msubv_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_msubv_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_mulv_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_mulv_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_mulv_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_mulv_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_asub_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_asub_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_asub_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_asub_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_asub_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_asub_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_asub_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_asub_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_hsub_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_hsub_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_hsub_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_hsub_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_hsub_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_hsub_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_subs_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subs_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subs_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subs_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_subs_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subs_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subs_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subs_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_subsus_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subsus_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subsus_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subsus_u_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_subsuu_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subsuu_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subsuu_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subsuu_s_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_subv_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subv_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subv_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_subv_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_ilvev_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvev_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvev_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvev_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvod_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvod_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvod_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvod_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvl_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvl_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvl_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvl_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvr_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvr_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvr_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ilvr_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_and_v, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_nor_v, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_or_v, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_xor_v, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_pckev_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_pckev_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_pckev_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_pckev_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_pckod_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_pckod_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_pckod_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_pckod_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_sll_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_sll_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_sll_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_sll_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_sra_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_sra_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_sra_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_sra_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_srar_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_srar_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_srar_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_srar_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_srl_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_srl_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_srl_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_srl_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_srlr_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_srlr_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_srlr_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_srlr_d, void, env, i32, i32, i32)
-
-DEF_HELPER_3(msa_move_v, void, env, i32, i32)
-
-DEF_HELPER_4(msa_andi_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ori_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_nori_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_xori_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bmnzi_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bmzi_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_bseli_b, void, env, i32, i32, i32)
-DEF_HELPER_5(msa_shf_df, void, env, i32, i32, i32, i32)
-
-DEF_HELPER_5(msa_addvi_df, void, env, i32, i32, i32, s32)
-DEF_HELPER_5(msa_subvi_df, void, env, i32, i32, i32, s32)
-DEF_HELPER_5(msa_maxi_s_df, void, env, i32, i32, i32, s32)
-DEF_HELPER_5(msa_maxi_u_df, void, env, i32, i32, i32, s32)
-DEF_HELPER_5(msa_mini_s_df, void, env, i32, i32, i32, s32)
-DEF_HELPER_5(msa_mini_u_df, void, env, i32, i32, i32, s32)
-DEF_HELPER_5(msa_ceqi_df, void, env, i32, i32, i32, s32)
-DEF_HELPER_5(msa_clti_s_df, void, env, i32, i32, i32, s32)
-DEF_HELPER_5(msa_clti_u_df, void, env, i32, i32, i32, s32)
-DEF_HELPER_5(msa_clei_s_df, void, env, i32, i32, i32, s32)
-DEF_HELPER_5(msa_clei_u_df, void, env, i32, i32, i32, s32)
-DEF_HELPER_4(msa_ldi_df, void, env, i32, i32, s32)
-
-DEF_HELPER_5(msa_slli_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_srai_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_srli_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_bclri_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_bseti_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_bnegi_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_binsli_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_binsri_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_sat_s_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_sat_u_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_srari_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_srlri_df, void, env, i32, i32, i32, i32)
-
-DEF_HELPER_5(msa_binsl_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_binsr_df, void, env, i32, i32, i32, i32)
-
-DEF_HELPER_4(msa_dotp_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dotp_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dotp_s_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dotp_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dotp_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dotp_u_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpadd_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpadd_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpadd_s_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpadd_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpadd_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpadd_u_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpsub_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpsub_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpsub_s_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpsub_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpsub_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_dpsub_u_d, void, env, i32, i32, i32)
-DEF_HELPER_5(msa_sld_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_splat_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_vshf_df, void, env, i32, i32, i32, i32)
-
-DEF_HELPER_5(msa_sldi_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_splati_df, void, env, i32, i32, i32, i32)
-
-DEF_HELPER_5(msa_insve_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_3(msa_ctcmsa, void, env, tl, i32)
-DEF_HELPER_2(msa_cfcmsa, tl, env, i32)
-
-DEF_HELPER_5(msa_fcaf_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fcun_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fceq_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fcueq_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fclt_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fcult_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fcle_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fcule_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fsaf_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fsun_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fseq_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fsueq_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fslt_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fsult_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fsle_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fsule_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fadd_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fsub_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fmul_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fdiv_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fmadd_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fmsub_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fexp2_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fexdo_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_ftq_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fmin_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fmin_a_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fmax_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fmax_a_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fcor_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fcune_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fcne_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_mul_q_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_madd_q_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_msub_q_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fsor_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fsune_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_fsne_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_mulr_q_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_maddr_q_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_msubr_q_df, void, env, i32, i32, i32, i32)
-
-DEF_HELPER_4(msa_fill_df, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_copy_s_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_copy_s_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_copy_s_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_copy_s_d, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_copy_u_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_copy_u_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_copy_u_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_insert_b, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_insert_h, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_insert_w, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_insert_d, void, env, i32, i32, i32)
-
-DEF_HELPER_4(msa_fclass_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ftrunc_s_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ftrunc_u_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_fsqrt_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_frsqrt_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_frcp_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_frint_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_flog2_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_fexupl_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_fexupr_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ffql_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ffqr_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ftint_s_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ftint_u_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ffint_s_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_ffint_u_df, void, env, i32, i32, i32)
-
-#define MSALDST_PROTO(type)                         \
-DEF_HELPER_3(msa_ld_ ## type, void, env, i32, tl)   \
-DEF_HELPER_3(msa_st_ ## type, void, env, i32, tl)
-MSALDST_PROTO(b)
-MSALDST_PROTO(h)
-MSALDST_PROTO(w)
-MSALDST_PROTO(d)
-#undef MSALDST_PROTO
-
 DEF_HELPER_3(cache, void, env, tl, i32)
+
+#include "mod-mips-msa_helper.h.inc"
+
diff --git a/target/mips/mod-mips-msa_helper.h.inc b/target/mips/mod-mips-msa_helper.h.inc
new file mode 100644
index 00000000000..4963d1553a0
--- /dev/null
+++ b/target/mips/mod-mips-msa_helper.h.inc
@@ -0,0 +1,443 @@
+/*
+ *  MIPS SIMD Architecture Module (MSA) helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *  Copyright (c) 2012 Jia Liu & Dongxue Zhang (MIPS ASE DSP support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_3(msa_nloc_b, void, env, i32, i32)
+DEF_HELPER_3(msa_nloc_h, void, env, i32, i32)
+DEF_HELPER_3(msa_nloc_w, void, env, i32, i32)
+DEF_HELPER_3(msa_nloc_d, void, env, i32, i32)
+
+DEF_HELPER_3(msa_nlzc_b, void, env, i32, i32)
+DEF_HELPER_3(msa_nlzc_h, void, env, i32, i32)
+DEF_HELPER_3(msa_nlzc_w, void, env, i32, i32)
+DEF_HELPER_3(msa_nlzc_d, void, env, i32, i32)
+
+DEF_HELPER_3(msa_pcnt_b, void, env, i32, i32)
+DEF_HELPER_3(msa_pcnt_h, void, env, i32, i32)
+DEF_HELPER_3(msa_pcnt_w, void, env, i32, i32)
+DEF_HELPER_3(msa_pcnt_d, void, env, i32, i32)
+
+DEF_HELPER_4(msa_binsl_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsl_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsl_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsl_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_binsr_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsr_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsr_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsr_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_bmnz_v, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bmz_v, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bsel_v, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_bclr_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bclr_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bclr_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bclr_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_bneg_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bneg_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bneg_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bneg_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_bset_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bset_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bset_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bset_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_add_a_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_add_a_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_add_a_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_add_a_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_adds_a_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_a_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_a_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_a_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_adds_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_adds_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_addv_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_addv_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_addv_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_addv_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_hadd_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hadd_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hadd_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_hadd_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hadd_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hadd_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_ave_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ave_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ave_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ave_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_ave_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ave_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ave_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ave_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_aver_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_aver_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_aver_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_aver_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_aver_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_aver_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_aver_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_aver_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_ceq_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ceq_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ceq_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ceq_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_cle_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_cle_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_cle_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_cle_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_cle_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_cle_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_cle_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_cle_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_clt_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_clt_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_clt_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_clt_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_clt_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_clt_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_clt_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_clt_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_div_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_div_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_max_a_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_a_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_a_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_a_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_s_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_u_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_a_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_a_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_a_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_a_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_s_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_mod_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_mod_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_mod_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_mod_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_mod_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_mod_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_mod_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_mod_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_maddv_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_maddv_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_maddv_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_maddv_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_msubv_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_msubv_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_msubv_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_msubv_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_mulv_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_mulv_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_mulv_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_mulv_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_asub_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_asub_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_asub_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_asub_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_asub_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_asub_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_asub_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_asub_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_hsub_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hsub_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hsub_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_hsub_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hsub_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hsub_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_subs_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subs_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subs_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subs_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_subs_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subs_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subs_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subs_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_subsus_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsus_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsus_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsus_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_subsuu_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsuu_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsuu_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subsuu_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_subv_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subv_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subv_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_subv_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_ilvev_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvev_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvev_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvev_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvod_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvod_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvod_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvod_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvl_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvl_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvl_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvl_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvr_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvr_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvr_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ilvr_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_and_v, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_nor_v, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_or_v, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_xor_v, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_pckev_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_pckev_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_pckev_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_pckev_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_pckod_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_pckod_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_pckod_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_pckod_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_sll_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_sll_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_sll_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_sll_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_sra_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_sra_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_sra_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_sra_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_srar_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_srar_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_srar_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_srar_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_srl_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_srl_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_srl_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_srl_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_srlr_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_srlr_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_srlr_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_srlr_d, void, env, i32, i32, i32)
+
+DEF_HELPER_3(msa_move_v, void, env, i32, i32)
+
+DEF_HELPER_4(msa_andi_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ori_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_nori_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_xori_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bmnzi_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bmzi_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_bseli_b, void, env, i32, i32, i32)
+DEF_HELPER_5(msa_shf_df, void, env, i32, i32, i32, i32)
+
+DEF_HELPER_5(msa_addvi_df, void, env, i32, i32, i32, s32)
+DEF_HELPER_5(msa_subvi_df, void, env, i32, i32, i32, s32)
+DEF_HELPER_5(msa_maxi_s_df, void, env, i32, i32, i32, s32)
+DEF_HELPER_5(msa_maxi_u_df, void, env, i32, i32, i32, s32)
+DEF_HELPER_5(msa_mini_s_df, void, env, i32, i32, i32, s32)
+DEF_HELPER_5(msa_mini_u_df, void, env, i32, i32, i32, s32)
+DEF_HELPER_5(msa_ceqi_df, void, env, i32, i32, i32, s32)
+DEF_HELPER_5(msa_clti_s_df, void, env, i32, i32, i32, s32)
+DEF_HELPER_5(msa_clti_u_df, void, env, i32, i32, i32, s32)
+DEF_HELPER_5(msa_clei_s_df, void, env, i32, i32, i32, s32)
+DEF_HELPER_5(msa_clei_u_df, void, env, i32, i32, i32, s32)
+DEF_HELPER_4(msa_ldi_df, void, env, i32, i32, s32)
+
+DEF_HELPER_5(msa_slli_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_srai_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_srli_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_bclri_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_bseti_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_bnegi_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_binsli_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_binsri_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_sat_s_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_sat_u_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_srari_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_srlri_df, void, env, i32, i32, i32, i32)
+
+DEF_HELPER_5(msa_binsl_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_binsr_df, void, env, i32, i32, i32, i32)
+
+DEF_HELPER_4(msa_dotp_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dotp_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dotp_s_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dotp_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dotp_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dotp_u_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpadd_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpadd_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpadd_s_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpadd_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpadd_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpadd_u_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpsub_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpsub_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpsub_s_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpsub_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpsub_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_dpsub_u_d, void, env, i32, i32, i32)
+DEF_HELPER_5(msa_sld_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_splat_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_vshf_df, void, env, i32, i32, i32, i32)
+
+DEF_HELPER_5(msa_sldi_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_splati_df, void, env, i32, i32, i32, i32)
+
+DEF_HELPER_5(msa_insve_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_3(msa_ctcmsa, void, env, tl, i32)
+DEF_HELPER_2(msa_cfcmsa, tl, env, i32)
+
+DEF_HELPER_5(msa_fcaf_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fcun_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fceq_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fcueq_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fclt_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fcult_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fcle_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fcule_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fsaf_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fsun_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fseq_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fsueq_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fslt_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fsult_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fsle_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fsule_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fadd_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fsub_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fmul_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fdiv_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fmadd_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fmsub_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fexp2_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fexdo_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_ftq_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fmin_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fmin_a_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fmax_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fmax_a_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fcor_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fcune_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fcne_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_mul_q_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_madd_q_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_msub_q_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fsor_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fsune_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_fsne_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_mulr_q_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_maddr_q_df, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(msa_msubr_q_df, void, env, i32, i32, i32, i32)
+
+DEF_HELPER_4(msa_fill_df, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_copy_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_s_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_copy_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_insert_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_insert_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_insert_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_insert_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_fclass_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ftrunc_s_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ftrunc_u_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_fsqrt_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_frsqrt_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_frcp_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_frint_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_flog2_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_fexupl_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_fexupr_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ffql_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ffqr_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ftint_s_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ftint_u_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ffint_s_df, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ffint_u_df, void, env, i32, i32, i32)
+
+#define MSALDST_PROTO(type)                         \
+DEF_HELPER_3(msa_ld_ ## type, void, env, i32, tl)   \
+DEF_HELPER_3(msa_st_ ## type, void, env, i32, tl)
+MSALDST_PROTO(b)
+MSALDST_PROTO(h)
+MSALDST_PROTO(w)
+MSALDST_PROTO(d)
+#undef MSALDST_PROTO
-- 
2.26.2


