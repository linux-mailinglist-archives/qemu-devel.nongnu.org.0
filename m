Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7048D4F97F5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:24:13 +0200 (CEST)
Received: from localhost ([::1]:57140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpX2-0004k8-Ig
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP7-0006hc-5l
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:04 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP3-0002Dz-OM
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso7706452wma.0
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vqFEef+PoO6P4+Yluk3sTBRVOWf6f49lZyd6Jx1qSYk=;
 b=yjamuJc2pqo6y6Mkj2KLfZViz+fuzfyhj7AYPuCSvrYaycqs1FeEAnHWT5jJpxI6F1
 uGiEiiOcnSGEpzmondjlIj0k+QtZIEm92d1sb2gxIXdU4lQa8PL4WnUnejTrTczIrgb2
 m7K7Y6kcBzsUtGJvm36dfH8zZmaljljLMWOD1fsVKRxGLx3tuwbHqus8UpPaaRveAKqy
 hi0gHNhk7WtZ5LviKdCjb5tnq5ylaclpodouEpsaIVTZkj3nAIFVvaiEQQVvM9iLpwnQ
 SxtxambsXGQeLXbUj3UNm6bYHjjF6Qz8eSCQz3CPSkIcZ8gh8y9oaf+KGEUAJntpCYFk
 ZzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqFEef+PoO6P4+Yluk3sTBRVOWf6f49lZyd6Jx1qSYk=;
 b=s4m5R69tPA5XhxlPRSMl74HNjFjE06meh/MTRy2qUK7MCgrV9tLbg72DRM7Lj7PT6q
 pWULYl539D9srBmcNtYgQ93vW+OkPfJM95noXfpFSFvKeMG8EBqEcKzwfKU3+a3nOzWm
 J+fLrWimxSLqKKUN39fGlbX8ktOTdomXle3F425hF4r4BH0xfYjjhzMkj29fLz6t9M4a
 CgP6HhgCX01ZjNNfUT0OiQ6p56j643FBZZdgzR5n1dczdM6a+bxJkB4QIzxfkR8vzvd9
 puQxzyqVp+7NeGSUD5b3ee3gy75epzLwjC3pTSIGngoYeNgcRvJCSox52nG0RoM8mgQ+
 ADOQ==
X-Gm-Message-State: AOAM532u0D3brlLMAaq9vnsg8lRt7NuWOcC5LuN6W/aT+Mr8RqFG/Q3U
 1TxuvGm4j06sYh0+LiB8n8uOgg==
X-Google-Smtp-Source: ABdhPJyNj35L0gCubvv3iS6PLeNts7xN3Q20pqkxstGe2IJdkb7n3V3AGbQFKBJYOmd58xvPMC2qWg==
X-Received: by 2002:a1c:4408:0:b0:38e:aa45:db99 with SMTP id
 r8-20020a1c4408000000b0038eaa45db99mr1615744wma.176.1649427355739; 
 Fri, 08 Apr 2022 07:15:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:15:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/41] hw/intc/arm_gicv3_its: Add missing blank line
Date: Fri,  8 Apr 2022 15:15:10 +0100
Message-Id: <20220408141550.1271295-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit b6f96009acc we split do_process_its_cmd() from
process_its_cmd(), but forgot the usual blank line between function
definitions.  Add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 87466732139..44914f25780 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -380,6 +380,7 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     }
     return CMD_CONTINUE;
 }
+
 static ItsCmdResult process_its_cmd(GICv3ITSState *s, const uint64_t *cmdpkt,
                                     ItsCmdType cmd)
 {
-- 
2.25.1


