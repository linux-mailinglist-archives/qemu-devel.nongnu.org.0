Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EDF63FFF9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:51:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymW-0002a5-82; Fri, 02 Dec 2022 00:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymU-0002ZB-Au
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:14 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymS-0003KV-1X
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:14 -0500
Received: by mail-pf1-x42b.google.com with SMTP id h28so3939111pfq.9
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1fcBWbZUmm5Jnpz4Izudl/A6K0HNswQpl9r23JhxDb4=;
 b=jAaQj/OLps/ZCDo+ryycvBLcQ428UdEhRpxAaItRzQg/O3qg3C6QLK6bxLT3daUiay
 MNnEdlEQo3H3qbijuwTkk+laquUKo9D+0ziVZUoQSl2iw9+j09p3lgzxVO3t9OBH4FwS
 LEzXrNBNbQAErEwe+0eAksIjTzsMHsNYyIG/e6MYdi+5KotRE0RgkDQmnzFz22phEm1H
 IrlFl8MfEYfBDW/+/XK7L8xokGfAUkcuWXXpW+US6rfgpFTMPx40V+bjwRxfkIFQbewN
 56cK+m7lWojYYwCg3dlCatWY9XQlRC6fX4+2ZtQwIprgEF4dqRznRjWQZDIBYhGzC9Kg
 4qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1fcBWbZUmm5Jnpz4Izudl/A6K0HNswQpl9r23JhxDb4=;
 b=fwDbG5iTVT667v+v7vz1d4CQfYrTvxoJPdMyVvOg31gxDTWJZXg6wmqokwYsYROHA+
 Q+aVbgpiBlZX5TyYYc+TKXtt/QPCSKVoydZ7X8SZhzBaIRp5lz01i0xjSqJdLfq1pzPf
 DB38YW7kpE4tkkYFtvIKXT4B1e8wl4vqQ7SHtsgklaLaCBNYeBBjdcbkiz4ImgSStD7n
 LWwLjf4JUTeUtMhbSDJ+JDmS3WcPhSfr7B3RY8BVEFE+MZtiJnG7bKtn4cPhcigh2YcA
 ZsxOivYfIx2EhVp9whNORglOoMmplzOLLgmQ0XnxvyzKR9NiMCVNpbSSaxrAwTbYZhqn
 yuog==
X-Gm-Message-State: ANoB5pnfIIwyDcNvM4nvU62i+1PqT3SHC7YngEq4bD1lXO88f0zENPKg
 PzGK/16217Yb6vCCWBlrLSGbUUDyFEYBR+JW
X-Google-Smtp-Source: AA0mqf74oVNT6sDBaHN7ELJwXWs+4KXqAXYTuTvUp4JpPCde4+4oFuOjiGYKjZAU5dY/UJm6oUNXcA==
X-Received: by 2002:a63:f91a:0:b0:477:8109:ccea with SMTP id
 h26-20020a63f91a000000b004778109cceamr47569155pgi.376.1669959611302; 
 Thu, 01 Dec 2022 21:40:11 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/34] accel/tcg: Set cflags_next_tb in cpu_common_initfn
Date: Thu,  1 Dec 2022 21:39:35 -0800
Message-Id: <20221202053958.223890-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index f9fdd46b9d..6a4022eb14 100644
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


