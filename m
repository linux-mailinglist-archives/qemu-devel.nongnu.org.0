Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB103C31BC
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 04:49:29 +0200 (CEST)
Received: from localhost ([::1]:50848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m233Y-00027P-Ic
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 22:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m232K-0000mS-Uv
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 22:48:12 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m232J-0005ev-9K
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 22:48:12 -0400
Received: by mail-pf1-x42d.google.com with SMTP id j9so4805928pfc.5
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 19:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mkAz14ohKaEU7KoR8ytu+L59auoxHOiI3rwm13ILEcE=;
 b=zR8+URJTolTX/DEqUUtNjG7ttIZQuLevUH6v1fI4e4d3XD+LkT9GxFfUlAkfsloF7w
 It62apWWd36js+tCMALDYR/h1VhlM6F12N27fTLcBcpH8Rs3+cg6Wvuf469d+CbJps5E
 +3K78CfVWTDwxrpUdmKQMPwGKma20XG8U9gHBOdVtPCh7j/8sU3HM4Kl0FIJsiAPhyrv
 NYmZxZelkYzoZtY5PjIwfRTJezAjqQi72KKvy0sphdPfIuslhoeKc9yrZaxWZ9Z3ZoUx
 5/4O91tG9LSr3dVwSgJ9xP2eMDIhV1YufT0n7vwKJDFiUReypHabo+29d+RCWx3Dddk3
 DeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mkAz14ohKaEU7KoR8ytu+L59auoxHOiI3rwm13ILEcE=;
 b=j3a169xVjo6AF7p+BjktIp3HydwuVTBqiQbqzIeoEI+5HtAY33qRxYUd+pcgOYHaov
 CYIUpy+JVC8FqyraU3mzAlawn22yFylrLapoVvQGhgdJhX6cHHJjrl18YGrTeQ2V6ESe
 hJV+ah2xZj7nKOyUjNvnoXgEfl1lcCuxzoamn6uWi0WcxFajmjU8u2FKbCXTeTfkaG8B
 5MJw8vCUOH8zjI2bnFmg1ch3vtDKPrnCR8/9TNTvpfpXzLnEC9E0UA6Zv6JwpJgXbBzb
 uknrV3+4zS/sxvKGosK1J4TBvG1+u3IiSwYifl3+1JJ1l+8ldmv5fQPAXdjiLnxvcY4K
 31UQ==
X-Gm-Message-State: AOAM5304871zWWMZjwXreSwnsZYXFhiQIZH622Mx4e4OyRmjaVf/v3qX
 adT18HiL7nEq5pFB50FUxJZIqw2LVwspIQ==
X-Google-Smtp-Source: ABdhPJwb5+8qZDRY38HDEU1PUFySRAFSQSP2MqvoQLZLFfFwSt1dyZS6c4RHC94/VvcYozysToXobA==
X-Received: by 2002:a05:6a00:9a9:b029:328:2b90:ea8c with SMTP id
 u41-20020a056a0009a9b02903282b90ea8cmr10368933pfg.35.1625885289397; 
 Fri, 09 Jul 2021 19:48:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w22sm8132405pfq.83.2021.07.09.19.48.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 19:48:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Fix prologue disassembly
Date: Fri,  9 Jul 2021 19:48:08 -0700
Message-Id: <20210710024808.1036356-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

In tcg_region_prologue_set, we reset TCGContext.code_gen_ptr.
So do that after we've used it to dump the prologue contents.

Fixes: b0a0794a0f16
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4dd4084419..ed86a70b79 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -752,8 +752,6 @@ void tcg_prologue_init(TCGContext *s)
                         (uintptr_t)s->code_buf, prologue_size);
 #endif
 
-    tcg_region_prologue_set(s);
-
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
         FILE *logfile = qemu_log_lock();
@@ -795,6 +793,8 @@ void tcg_prologue_init(TCGContext *s)
         tcg_debug_assert(tcg_code_gen_epilogue != NULL);
     }
 #endif
+
+    tcg_region_prologue_set(s);
 }
 
 void tcg_func_start(TCGContext *s)
-- 
2.25.1


