Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED6E3CC69C
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:22:32 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4shb-0004No-L1
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seB-0006s9-Sx
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:18:59 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4se9-0001zO-GM
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:18:59 -0400
Received: by mail-pg1-x534.google.com with SMTP id s18so14538069pgg.8
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cHskM/Im3sqLBPWIjdLsVhT3rTD2wZzJE7Y5KBjA5y4=;
 b=d+epOdSPtvf6T+zO7P6NGztdurfWFOA1xKfL9+lSreVbQOWpNNGCxxy3LjqhagfJPR
 H96F/zv0h5VA6PGI5X9zmze5bFjCWHO1HfmKA6rq8kDa1qDLgzwZumhfuHNvu8fvoTL/
 Xb30pBzuStlzY9LuJDHmkEE/d/3HAg8nrEwLKInXeY8VpPzmcmkn1RhXIXIkKk9hp7pi
 lYw3mXpB4OybsS0gnSEFX5h99NBhzXCu+whF7A/qri7Zi/Hj3QH333Als9D9rMz8hfbv
 B4WJk6reaAd12E6I0wY7PDxozv13oRHfQg3zKJEFo4lDNg+YwUcu1iX75WOxFxzNsR/S
 s5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cHskM/Im3sqLBPWIjdLsVhT3rTD2wZzJE7Y5KBjA5y4=;
 b=USL0LC+IclIMjhUd1A/y+b7ANWmAlZRoJS2DiQmeatGRSDFHapAo6YYVxAenNtQ0Th
 szYxjXmmYsIizhgGrBG1/aoV8IF/QjL597EjbpGi2hqDypsUGyCZxg5OICgdFQ0aQhK5
 6UYZtXJjPUZHzrDKQATyefQ3J7LZvJS26oANMnmnbO//4bp1N+SX/aAiE/pA4nWLT8th
 yEztxVIYx2o0gd/KFySh+PktHbW62kyp2Hcjf705D1nV96s3agSA7yhZ6ypoIEZayLEO
 NdWQw012R7an07WCyJw0rZRVtQcB1HPSEeBS+AlnOFnuYKmzrMbKeyUq6mIbCoH5IOXj
 yjzg==
X-Gm-Message-State: AOAM531bp4K+5QZ6lxbv5q2mCSE++9ccgYhakv5uBul4pbNRRUX+BHzn
 sthpc9dPHAOaecpvqLixbC9AEMQNXAnnew==
X-Google-Smtp-Source: ABdhPJzmXovdQjkzPaM59T0Fgs0aktXjY7+jEwzeQk70j7sxFGYuyvLZqPOJIwIpGPDrAwxP5kk5Og==
X-Received: by 2002:a62:3542:0:b029:332:c821:1ef3 with SMTP id
 c63-20020a6235420000b0290332c8211ef3mr17185592pfa.33.1626560335293; 
 Sat, 17 Jul 2021 15:18:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:18:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/13] accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
Date: Sat, 17 Jul 2021 15:18:42 -0700
Message-Id: <20210717221851.2124573-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717221851.2124573-1-richard.henderson@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of suppressing goto_ptr from -d nochain had been
to return to the main loop so that -d cpu would be recognized.
But we now include -d cpu logging in helper_lookup_tb_ptr so
there is no need to exclude goto_ptr.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index d3232d5764..70ea3c7d68 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -150,7 +150,7 @@ uint32_t curr_cflags(CPUState *cpu)
     uint32_t cflags = cpu->tcg_cflags;
 
     if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
-        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR;
+        cflags |= CF_NO_GOTO_TB;
     }
 
     return cflags;
-- 
2.25.1


