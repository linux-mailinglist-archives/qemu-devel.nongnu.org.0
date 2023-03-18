Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD46BF9AB
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:48:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdV1X-0004oi-Us; Sat, 18 Mar 2023 07:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1Q-0004mK-4y
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1N-0007DA-UH
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:51 -0400
Received: by mail-wr1-x430.google.com with SMTP id v16so6525789wrn.0
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJOw9krfcPlJ6wcYXSThrOaozHtoi6cPC6GULZW68Zc=;
 b=DdsgKN+siFhEyfm2oklxJTizJdKc2Y98JnE4edeNcrPKsDv8IqJr+gVJk9lwxBnfGs
 +3wEyx+OFx5cxNx9FDpeCD+6UkzexD8CCrdIlynY3JBExh85Mg2URLpxvWwDdU9xmjQs
 BGNidFtMJSGclKdmgCZ9K+0XC4jHCPQbNb318l6U61BAHKo/lWz7QImj4Ks2GYA3lO6l
 z01ARIiF8Y0XN+NP1pbFNL2c1AiAVy7iTvZUYKxhsSYMpu72YlHhUX6jHOqEXxBYrGra
 2VyKESPfQ0PMT01kVJJ42TG0qT2pGcT+K8gsVPgGDIxry/riqvXXDkQE+pSYvsRxn5yY
 z1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJOw9krfcPlJ6wcYXSThrOaozHtoi6cPC6GULZW68Zc=;
 b=GvO8gz7hAx+GBIL6LNiR/9126s5MTHjJrTVQKRR8OVVo1vUzHgSCckJhfECsOED1Ps
 CnhiA9c3AQsOiXpMCiywjDMhjriETgnieydS7tP0p/5lHamLo15kU7a7Cn0jwuBoPhec
 DncLJl1NTyG8NITOuSWLFnBfq4qmlhVEkSvazbvNxXpHtXnFKZ9qCU0blsqZFSMVp3iz
 texiRacz62bsG+KEywS5gD0pa8yABTz5ynEhOcr3Ndhp90wHlXhK5feb/g8Re7NeKA14
 GuZArcyEIT7W+HagU/44MKmOMhcnc71Pb2QTP74wXgSMM5Bpva/Qpyv+sQPp1TAF+GYP
 FiNQ==
X-Gm-Message-State: AO0yUKVHR3m+FCtArkjTVREovM5l3P0WNF/Lu5JITf1W+KBo/uC+2Uie
 JsIrM+cZAV1f44vaGmUnkeL/zLhe74O/NvjK/MQ=
X-Google-Smtp-Source: AK7set9SSIjDIF8ZrFmh9u9CldLrbf0OSJktrc8xzYdLLGdpXI7DrOWXIiX2f0aDIwYRnLg0ASqljg==
X-Received: by 2002:adf:cc8b:0:b0:2d0:776:b766 with SMTP id
 p11-20020adfcc8b000000b002d00776b766mr8556571wrj.8.1679140008652; 
 Sat, 18 Mar 2023 04:46:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u8-20020adfdb88000000b002cff06039d7sm4162153wri.39.2023.03.18.04.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:46:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 863991FFB7;
 Sat, 18 Mar 2023 11:46:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 10/31] tcg: Drop plugin_gen_disable_mem_helpers from
 tcg_gen_exit_tb
Date: Sat, 18 Mar 2023 11:46:23 +0000
Message-Id: <20230318114644.1340899-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Now that we call qemu_plugin_disable_mem_helpers in cpu_tb_exec,
we don't need to do this in generated code as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230310195252.210956-3-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230315174331.2959-13-alex.bennee@linaro.org>

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index ddab20a6a6..3136cef81a 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2808,7 +2808,6 @@ void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
         tcg_debug_assert(idx == TB_EXIT_REQUESTED);
     }
 
-    plugin_gen_disable_mem_helpers();
     tcg_gen_op1i(INDEX_op_exit_tb, val);
 }
 
-- 
2.39.2


