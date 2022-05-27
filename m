Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BAB5367F8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:19:22 +0200 (CEST)
Received: from localhost ([::1]:40190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugQb-0008Vr-T7
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefn-00021r-RH
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:55 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefh-0005PD-K1
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:55 -0400
Received: by mail-pg1-x52c.google.com with SMTP id r71so4640607pgr.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5vgUVP74YRVFsnCeUfD+lgH38oMFXENYiUeI4E2695s=;
 b=Ty08mZ/fwb7xKloB/7EyPtQGfyTHXfn3722JkXN5y3VPJEcdcrnDPqb4eJv6GxFKQc
 5Fig2vMfF76ryswwJmtm4zcIG4Cbv9zeBNYjZ+H/YVQmWYXyjZbS6urm/Y/gN6FiXhiu
 ZawABUGq/QrmudwwQBigLj2pW0MOhqwgpRETdzhJXZ07TRp6Q8V8/SqFSYwezV2Vqc3n
 nHrRJGsQR/v8MTSFigZQ4QCHtH/sR6vEVq/5uXV2LWjKhraboLlQTSuxypipoaSae3tq
 Zl5wc625WsR6nM8AWeSdBsv0riyQPmef3Pa8sOjGsY4rf/vns3ipCc0PyMMvB6Rp5hgK
 FQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5vgUVP74YRVFsnCeUfD+lgH38oMFXENYiUeI4E2695s=;
 b=ncHa8VU4qK1POYfOmIcIFv68noKZI9WGLr+alLod0Mu1d8xTdpL38n3/1MF1supT/L
 KbPLYE29bwYYRAi/QVEGk+Z0mYwF220WC2Lzo3FxULxdcbxZWLUBi3698feNTP6Dlfya
 yx+YaEz8KhUwTyiB7LPFiICOzDyP3IoBheoDFCudiTuuaE3UfCqBV/qgMosS7dIwXh6D
 XdMMSZ8h3Y4FEia9SZ8eoA54q+8Jvc9XTrnbFhnWXUwxH3x6CauUGpD0rnnl3Oirl+iK
 KF0Ld/BmX86AG3K2vpbsh10aLVb6JOhMxzw9UDI0/e/QwaqPeFOiG4QQSMbbf5xWIKx2
 6hTg==
X-Gm-Message-State: AOAM5309VVbjuwCgHVicSAi4k3QfVftrh1/wnaslFDnT+ST/Tt6SC/3a
 ujMUXogd6r+Ec7WFuIMN8kOtc6V1pMCKrQ==
X-Google-Smtp-Source: ABdhPJxJHT/AxYjkum8yNDc9kFIzbdVU/QMqFLjL5tPvv6SFOFQ5Sy6eLE+Yldcpp2vL0zP/2HxWSw==
X-Received: by 2002:a63:2a8d:0:b0:3f9:d9f9:a5c4 with SMTP id
 q135-20020a632a8d000000b003f9d9f9a5c4mr29068405pgq.614.1653676008338; 
 Fri, 27 May 2022 11:26:48 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 106/114] target/arm: Remove assert in trans_FCMLA_zzxz
Date: Fri, 27 May 2022 11:18:59 -0700
Message-Id: <20220527181907.189259-107-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 636ddeb15c0, we do not require rd == ra.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 886cf539a5..436d09b928 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4027,8 +4027,6 @@ static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
         NULL,
     };
 
-    tcg_debug_assert(a->rd == a->ra);
-
     return gen_gvec_fpst_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra,
                               a->index * 4 + a->rot,
                               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-- 
2.34.1


