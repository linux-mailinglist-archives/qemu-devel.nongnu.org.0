Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80377655BDA
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 00:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOq-0002Og-DZ; Sat, 24 Dec 2022 18:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOe-0002NH-KZ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:46 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOd-0006KL-24
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:44 -0500
Received: by mail-pj1-x1035.google.com with SMTP id v23so7961343pju.3
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0A7BGyHqAN6alhYKfJ9E1yLwyik0pT3tSjb2m0LkGsk=;
 b=DAU9YZa/cEeLYK2mQvOl6NTOgvaHDxTjM2F5b8YSdt9krfSOLSOUTXIH2pJ5fPqb/d
 VOz3XoZuTARIZZ21MSxoUko7b8DUu26jaPaOwW238CJPPpFXjgUX1Vh/tL+Whs2aRjni
 8cVwHpBA7CJ1z9s7BGsxVJNy9ih/I55eAXhxpgpvwsoJnSqasgHFJ3bozxjMyUkZB1fc
 dtGmpu77UtdJc0LOy3rddtk2hNuknc27furVB+/qboSa1piwXic449O37pqORuCWHFq6
 ippErLrRpr0V/+HMxOxO0NeOJMxzON3I3qajB4SoD3LWpgCeUg1IcHYGCaicHKP5lOTE
 Q4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0A7BGyHqAN6alhYKfJ9E1yLwyik0pT3tSjb2m0LkGsk=;
 b=EiZ3Px6QgY7UK1Vu7carAPQVP3x+sT223Ge4bUEqjqCvlr7/jKXqV0ebVuVUQMBlcl
 H9AL5hV7woYDoxYhDdF6RnY4bXBoNUbk/dsxhSs3my3kAGrIdMOamS6CEdYPFqooRAtB
 4y24O0L5fCBA+4CZ1KolqN01CZfxMDJYUWRgwgwsOgRVUIarI9z/ZTw+nyWzQcEzV55O
 NBrl2atq+UEReYZyxTSOLyhKhFQ8O3XthMYTFUTftr/knRl6Y5/Hn0lRFeHaKYs1fIIu
 Agt+bBGAh5aY0nxjg8sAz5kk77jy9nXAQrESIAwJ939Zw2dsjoy6ZCYqmL/GA7BSWAzg
 dzRA==
X-Gm-Message-State: AFqh2kpN8kh967FhI2/n0OdWfMpc69rdrY99SXfuJidg7btQRmnTDfbE
 6xsJ7Nz+CvZEBjIs1kyrd1lIV1XHMGO6hphu
X-Google-Smtp-Source: AMrXdXsZzkzlvGAa/OeQrp7U5Lpvttl7w2exA0t0SGrHcCu+jvv8HCGkZ7z7NS7+hICR/GYSbXr0Cg==
X-Received: by 2002:a17:902:e54f:b0:187:49e0:4ab with SMTP id
 n15-20020a170902e54f00b0018749e004abmr21813308plf.4.1671926261631; 
 Sat, 24 Dec 2022 15:57:41 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 20/43] accel/tcg: Set cflags_next_tb in cpu_common_initfn
Date: Sat, 24 Dec 2022 15:56:57 -0800
Message-Id: <20221224235720.842093-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

While we initialize this value in cpu_common_reset, that
isn't called during startup, so set it as well in init.
This fixes -singlestep versus the very first TB.

Fixes: 04f5b647ed07 ("accel/tcg: Handle -singlestep in curr_cflags")
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 78b5f350a0..b177e761f0 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -235,6 +235,7 @@ static void cpu_common_initfn(Object *obj)
     /* the default value is changed by qemu_init_vcpu() for softmmu */
     cpu->nr_cores = 1;
     cpu->nr_threads = 1;
+    cpu->cflags_next_tb = -1;
 
     qemu_mutex_init(&cpu->work_mutex);
     QSIMPLEQ_INIT(&cpu->work_list);
-- 
2.34.1


