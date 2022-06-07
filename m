Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1480653F415
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 04:50:01 +0200 (CEST)
Received: from localhost ([::1]:56602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPI8-0001pY-5U
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 22:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFt-0006UU-3d
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:41 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFq-0000Gj-3Z
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:40 -0400
Received: by mail-pg1-x52c.google.com with SMTP id e66so14528830pgc.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/iHX6ANtN/zAKSj1imBD0tjZXjeiBLskpYlkOhgS0I=;
 b=l/7OOMPftewRQ7d5M9h66/VaR4dPsLiZn0T3Qs6jObKZiZgQzo1vMpuKLQ3YiN6bVB
 miMOTc7eKix0N4ZYFb7CmR0z2RJ2u2G4m1BzyjDPJ7Em+sOIA28o00VV4yTUvvOsoOQl
 52mSktWwu/0VnlUHnRxSemyfRobgjkQCHr8V+BM7mm8I/zA1Kz8NJPfvAsefICOiLMKT
 7lndCtyo7ViLUPteE0lHy4NhaMFwlZ8Dchlf8gAfl+mA9N7XsCBETZ4vOGHpPEtOwbhv
 Xv1ZGQR15UPtdY8BvAjOaXUPRHVvuDMi/vZo/VWgmKG3GpJMFlEaUye+AGc2BIvxL8do
 6ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w/iHX6ANtN/zAKSj1imBD0tjZXjeiBLskpYlkOhgS0I=;
 b=WtMuWCe6r8NaSHVhqhpdPBpZIfScVxNNrT3arYrZ7tZhDuhfc8TjqmmgKNwFN5QDMj
 2pzs8JZYALIzH+nwjDqWnTvmh5YjrwEo/O+nBmSs1r1U3tMJsVz2u3k/Svjygao4Lhhf
 U1TGfv4HQnlsl/HABB+oVhl3YvNla2AvsFKKxNoIlipOOYQ2iE6mV57722GUigvAbTTe
 lG1bKQKZZAxMUH5JUCj25U9WldaG6M+cAJxFxsgzfVx3Lm1rGg9QLO1pW6yBb+nTZhh+
 0yiFC0sa25yTrKkedNOiRi7+5T3QcjKEP2BuOdC4oX3jF100j7q4HVxGRY4z4f1PiOnl
 +icw==
X-Gm-Message-State: AOAM5313uvBX74D3tdAWS2XhnuGF3oFOXhFKPu+blxPf7Q8iWN4vX6Ka
 3gfEPaZovOjMvfTT0ms5QfrABj4YTFCHSQ==
X-Google-Smtp-Source: ABdhPJyi299yVhcAdOOUfg+pVKZkWCPX2cIzsMDU5S80yIymESwriEI39MGBlAa00Li91zPwQvGwYg==
X-Received: by 2002:a65:5385:0:b0:3fa:52e3:6468 with SMTP id
 x5-20020a655385000000b003fa52e36468mr23849622pgq.366.1654570056819; 
 Mon, 06 Jun 2022 19:47:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 01/25] target/arm: Mark exception helpers as noreturn
Date: Mon,  6 Jun 2022 19:47:10 -0700
Message-Id: <20220607024734.541321-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index b1334e0c42..5161cdf73d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -44,9 +44,9 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
-DEF_HELPER_2(exception_internal, void, env, i32)
-DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
-DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
+DEF_HELPER_2(exception_internal, noreturn, env, i32)
+DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
+DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
-- 
2.34.1


