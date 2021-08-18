Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A783F0CA6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:22:39 +0200 (CEST)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGS58-0002gx-3D
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2M-00084D-46
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:46 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2H-00069G-8Z
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:45 -0400
Received: by mail-pg1-x52b.google.com with SMTP id y23so3480910pgi.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3D/M6PiJA/KHiyIzYScTLEu+qTs2bRAx1trHXsXn6VU=;
 b=SwtvxVvktXqEGyjD8CyMzVorAjhJRXwznN3H6xIOGkHXaRRxp1eg2xZ9TF9C8tYOtP
 qt6oiSWr/q+YvTDGsDrmHDAkuDldY2Ic7+ItPGEbcS9gxeVkIhZl074D23UE05VewMQ9
 2xcZGlH10cISVqUp96ottPIeeX3ikLiPORqU1QQrS4Qpr4tnHL9Qr/eqQhYWEk3C3bKm
 vf1OjB1WQO/mFcewjeBxSkh8R7cCr3jApZOviorisRjpvLkFB7noW5irPsDWvSYpNq9d
 jFm2WvJJjoH42kXDgKA59Nszh/3xh8yFeZld085QWbzDCBRPZ5L6lY90vCvyfSKh8C4O
 53Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3D/M6PiJA/KHiyIzYScTLEu+qTs2bRAx1trHXsXn6VU=;
 b=dHMVfDydsJcAaWc/ZkCNsqu6hBM0OTt7P10/RstgsehW5/NYmDQ5ZH7VCU2QCY2GbW
 P8KRZsRUQP0LZ0gJJ1e0Ds3zzWXq7ykU+wLdRcn2Q4J66GEpH/XniJv3oZsh4zfozfbX
 bu0P3nj0H5zD3tA+bgcLlFd8TQyaSLjDl1hlshYByLOp3CXclylPSCeBIdQ2j0tHH+59
 AbF/Yhyoj/GhCO9jpwOUzNqZazMa4y0rin5Jbcvq/g6CO4k+g4QvnJUOo6lWte/50C4B
 pJXVGeah41YsiJ2M2IV6qdpJHpvp3SlBLgchLmMPOhkJqU+5K5UmRaAacIP3GGaxWfUe
 Knlw==
X-Gm-Message-State: AOAM533rsVTx5BCuB5+JD2odTVwkwi584t6PcxQhwR/UEGf5SjZkPkbZ
 EjM7xrV+UJVSFDRZKJ3pic5EHBzg62DRPg==
X-Google-Smtp-Source: ABdhPJwSkiDXcvtL0c22HwsP8Oa16FdUdQ5N/mFFyBQhNmk5JQxUQKRxd0otTfEbCeHx6g2zhZqDuQ==
X-Received: by 2002:a65:428b:: with SMTP id j11mr10774429pgp.301.1629317979135; 
 Wed, 18 Aug 2021 13:19:39 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/16] tcg/mips: Move TCG_GUEST_BASE_REG to S7
Date: Wed, 18 Aug 2021 10:19:20 -1000
Message-Id: <20210818201931.393394-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No functional change; just moving the saved reserved regs to the end.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 92bde50704..b3a2cc88ab 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -86,7 +86,7 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #define TCG_TMP3  TCG_REG_T7
 
 #ifndef CONFIG_SOFTMMU
-#define TCG_GUEST_BASE_REG TCG_REG_S1
+#define TCG_GUEST_BASE_REG TCG_REG_S7
 #endif
 
 /* check if we really need so many registers :P */
-- 
2.25.1


