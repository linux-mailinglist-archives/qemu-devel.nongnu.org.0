Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3531E3AE0B5
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:34:48 +0200 (CEST)
Received: from localhost ([::1]:36886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv55b-00052j-79
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53s-0002LD-N1
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:00 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53n-0008UT-HN
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:00 -0400
Received: by mail-pl1-x630.google.com with SMTP id v12so7457366plo.10
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oqu6i/kvNHrYtHemRicmatPUkUSmc3yTCi7Ugc/TW74=;
 b=PDi6MCigN/kQXgFwgSVPBR848SyHXrsX4qj099P2w8I18a2TFz0iXxLpwqp87YdqBL
 hxSr/ZtR+nf6mk92rdUwtIbHwacSeiC9WhKooJvH+plk+O8C/TkkhXWdzLl3HpyzqkGc
 xT+k4VyT0pDIudtjIvNeP6IQ0tghwIlMCBTU8H/RyulUWC8ZaciilQKiqSooIOUm0RDh
 bpwx5eu0YuVIAAUzBAkUSzXfYlUkdTOZbQG9UuUdAmsH1scNYdVa4P9f2J2v5K2DafAi
 hgCdJGFjjCAPdNhCOCi8X1GUqyvTuD+wer5nWnQbxmUx1zEvehpWcb4aMt6Mw+ASWYWe
 FQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oqu6i/kvNHrYtHemRicmatPUkUSmc3yTCi7Ugc/TW74=;
 b=F8KeBMfxr/bPcogsV/ciHyvnd+ua9oSJINhbPmBXP4/5gMCfKVkiAvUurxcOngBBRv
 eOueHP2h3PYG6xe0p3z1VzFBYy1RykS1mKhn5q38Ae5QWMIZ5uA8Cu7eIwB+E/nyFNmo
 rQ5H3U+ekyCv/GfuZNR1d04QQP8SsEfA5jG4avaJuMGih4IieQ/q2fDKHowsjhEptWGL
 Ev77t41Jxvx+qlWz4RLNLtvNg8vFxz8S3oZywajt9prU0jZIRqOi2YJjCz2LFCfirpAn
 fq8XP9fP+jR+qGTSAet8zqiZ2e78AN+HngOLycssOENbS6UKssEYJagrjbMWhVOg2nAN
 I+dA==
X-Gm-Message-State: AOAM530Ba4WBdUjdYiHiltUWXAmp/V47TcCoeqGnGTTIdnFcxPtkwFY4
 jyQzUmE9mmIfYvfAaXB2DVQL7qLhg17giQ==
X-Google-Smtp-Source: ABdhPJxc7mJDm/wz2K7m6Jnt+N1zjF3QaPNG33V8pCqhF3cE4wNGsz+GuzyMcdY/8pRvhM6IcctozA==
X-Received: by 2002:a17:90b:187:: with SMTP id t7mr6849684pjs.67.1624224773860; 
 Sun, 20 Jun 2021 14:32:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w21sm13608329pfq.143.2021.06.20.14.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:32:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/11] target/cris: Mark helper_raise_exception noreturn
Date: Sun, 20 Jun 2021 14:32:45 -0700
Message-Id: <20210620213249.1494274-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620213249.1494274-1-richard.henderson@linaro.org>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/cris/helper.h b/target/cris/helper.h
index 20d21c4358..3abf608682 100644
--- a/target/cris/helper.h
+++ b/target/cris/helper.h
@@ -1,4 +1,4 @@
-DEF_HELPER_2(raise_exception, void, env, i32)
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
 DEF_HELPER_2(tlb_flush_pid, void, env, i32)
 DEF_HELPER_2(spc_write, void, env, i32)
 DEF_HELPER_1(rfe, void, env)
-- 
2.25.1


