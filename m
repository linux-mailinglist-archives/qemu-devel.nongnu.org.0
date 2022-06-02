Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0D53C13B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 01:06:46 +0200 (CEST)
Received: from localhost ([::1]:56934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtts-00037l-QY
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 19:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0001il-Ex
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskN-0000vZ-EB
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:54 -0400
Received: by mail-pl1-x62b.google.com with SMTP id s12so5586268plp.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SAiy4u2+hcjlkm4K4/FWEX6wsTP/y8YNbat6sNJslGQ=;
 b=LZVb9I1gjy3lEmOuvnrHzTPD7EeKZn7wicuW1n8fOgUHmjSpU1grEBNZyO63gg2mrZ
 WZHmeKlrfKOK4D1d47Zfizvroehz1IZRLT/CjqPGyj0sJDuW8yzGfG2kYj7Llz17jLF0
 YIe8pgLJgqXQ1wlI33LlPkIY+ARw5x2MEforEkIwMLIL6/qdp9eA2M79DEhG1LLeToSj
 4KgDKjMX/uE4hNsk4H6hLzlep/EoVUgbeCf/KqHABZVQDfr2XoQSXYIZMgTvqMe/logg
 3FgiVTwOlqwHLawAlIe3prLge6UX5I3jP6jtCqZYuCPSGw3Xp6VPfvv1CfoqG/tqvTJM
 N3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SAiy4u2+hcjlkm4K4/FWEX6wsTP/y8YNbat6sNJslGQ=;
 b=6hpOUyGYj1rAC6FZBNX/qkvee8n4Y0r8KfSvmBpGtf6d9g7Z9lk6RG3cHVQCT/YBry
 Aqi/e+gxdTDTSL9EPsMhzgZPVlyhGcKA50I2yVHFWKtizYn/p8uLkzoFHpXCDsgA4738
 PViWakLBMxsSl67Itmb7jy6mAHT9w6NbFg0RJpg+PVr+qK0EUN0ENiM7HD9f20HY7xuW
 fR+Go2N5qPfWFcoEARRvR+vd+pmw/49iue9ySuULH4CMetW/iMWcZrSZq3Dsu7E3f2D7
 Px7bG3AMT0Fru4L9K48cybuUI1+0wd4XfXyqOmRaZ/m3d7OUEPbbbKC47pWqC6+YYEU6
 NXGw==
X-Gm-Message-State: AOAM531xLEZuKtnNvwI1QcnjkiHgLZzRbo6/PDXX0SvABVrztdzSPoUL
 D6LjZHCnePGGgJI7fH+f4QpbLxaaIVmUJg==
X-Google-Smtp-Source: ABdhPJwx/oTbDCDeSxamegsIUOiBhWM2AvzlLAivo8tcfp0T9XMwxtgTAOPCnY3dOL839wgstXfjhA==
X-Received: by 2002:a17:902:bf06:b0:14d:8c72:96c6 with SMTP id
 bi6-20020a170902bf0600b0014d8c7296c6mr7019950plb.156.1654206770666; 
 Thu, 02 Jun 2022 14:52:50 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 64/71] linux-user/aarch64: Verify extra record lock succeeded
Date: Thu,  2 Jun 2022 14:48:46 -0700
Message-Id: <20220602214853.496211-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 590f2258b2..711fd19701 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -340,6 +340,9 @@ static int target_restore_sigframe(CPUARMState *env,
             __get_user(extra_size,
                        &((struct target_extra_context *)ctx)->size);
             extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
+            if (!extra) {
+                return 1;
+            }
             break;
 
         default:
-- 
2.34.1


