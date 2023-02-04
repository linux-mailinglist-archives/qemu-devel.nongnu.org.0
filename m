Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E46D68AB49
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:36:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLTz-00054g-AF; Sat, 04 Feb 2023 11:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTc-00050h-TR
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTb-0002Ty-7c
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:20 -0500
Received: by mail-pj1-x1031.google.com with SMTP id mi9so7830952pjb.4
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39PPEuhVRVsZVvJe6r6zmHD1Uy8sB4o4fQgIEwRJuDQ=;
 b=ztSOjccPJpODSGoNnaCqJHr8wVt0R9+XfIlSEuBW7uX5MDBb24EvkDYDwmU8NAdwxT
 A1vDj9yXwbxrUAOFu8AqQVZNWbN3P8DcbBRJJxMIHuMY7f/PUBGuV9phCnASN3IxKRlz
 trqGcjrfiYmVKaHQ3qQwR5rfNSxpJ41qdhXCt6NLoRsPAi/4ivhq9PRFUScMVpr4Jron
 DjyEiYoFDNrtiDptcEhgYa8dbG0El12/3oIlVvHovsimuIX4hJL3AHL9okMV9fk9JneV
 wsusKXe2oYlsxRA1crnQO6o5Jl9yC6xpm2DhwLFVlWl45AmoOkLJnwK+c7q2jpRYC2S8
 aaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39PPEuhVRVsZVvJe6r6zmHD1Uy8sB4o4fQgIEwRJuDQ=;
 b=IWO/uBWOjq6jzkD+dIWzHixe0coR/TVZrw2NXd4HUQxMU//TrxQNu6vStn2S/d9tS1
 EssM7Qo6EvJBCRu1ricRCNGxYj0tvSqSUVRypTK9/FLVRliTgzaEEqyix50z0aCgys44
 jqsFfu3Cj3j5lgU9RuAc1CEkDHxMXGqfSEfzElIj8rt9uDcmEpFM+IZ0XkdlrmR0l0Pa
 Gh0amKYpoizK0TsWcbhClydrmn3zSv3wq0AO33MlbO6+hTqS/dUG7tN1GLkEvTk22J4X
 Z5uMQK1cjFkTiugP7b0cYA8BM7R4Cv4h78ikoHBKveh9oBJe6i3j/adtaFVy2WGe7n5Q
 SKUA==
X-Gm-Message-State: AO0yUKXuxyVKcmBmFU5VV/Y9maVpZn9ybcscYC+rdGbs3ggeUS+z3gNM
 TbqhAvNvx8lvIKvhchaGwaY+laAq/gFAHpOu
X-Google-Smtp-Source: AK7set+bqDvKSwvK67ynh6dhjmdea7ABUHhras/I4yDmrXlKWMRZaJ0ga88Wa2v4QlXT1YR2UhEJjA==
X-Received: by 2002:a17:903:11c6:b0:196:8362:b727 with SMTP id
 q6-20020a17090311c600b001968362b727mr8122151plh.63.1675528397104; 
 Sat, 04 Feb 2023 08:33:17 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 02/40] tcg: Init temp_subindex in liveness_pass_2
Date: Sat,  4 Feb 2023 06:32:32 -1000
Message-Id: <20230204163310.815536-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Correctly handle large types while lowering.

Fixes: fac87bd2a49b ("tcg: Add temp_subindex to TCGTemp")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index fd557d55d3..bc60fd0fe8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3063,6 +3063,7 @@ static bool liveness_pass_2(TCGContext *s)
             TCGTemp *dts = tcg_temp_alloc(s);
             dts->type = its->type;
             dts->base_type = its->base_type;
+            dts->temp_subindex = its->temp_subindex;
             dts->kind = TEMP_EBB;
             its->state_ptr = dts;
         } else {
-- 
2.34.1


