Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD556A661C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:02:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCfA-0002j9-J9; Tue, 28 Feb 2023 21:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCes-00015F-FS
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:37 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeq-0003GF-IO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:34 -0500
Received: by mail-pj1-x102e.google.com with SMTP id oj5so7940465pjb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5BXGBlt74DJJyoNslsOhSd2HGdWDnB0E5Y2PhUEbn4=;
 b=KOa1mY2jhcmQOyc7AdQjXdH8QE2LyRuTkJQ1iswaEkpMphxsEqd+ZAatGWOFCxXR4w
 Kk2gCQUF20d6fTGjojqLFnwrUXlHS+ihSjv99i09CwE6Kkqxujp106G4QteE4kseTopy
 WeqexNA/iquun2dc2WtiNxkHYCs0GzJbUamNY1EZabAJZOAJeCZOPGkIGPkFcNqsiWmK
 LukxCPefsHw/i2Drcuup3KkALF521hx6Y6hrhq0pPCh7z486oqsSXfDLPRZQ/VnouSSu
 v2RFMh2WYWz6y72QKRSkVg+PkulxBX1XxYNHnYlT/qg7vcbi8X9QP/wN6Hbs/5HalHUB
 le0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5BXGBlt74DJJyoNslsOhSd2HGdWDnB0E5Y2PhUEbn4=;
 b=gUiKdWNe+StvVhxXJbNybsqwHOiRvwiMsJPOWzwlRUWejRydjpp7qoqP8ynbIBpDBy
 9HQoQx69zBD9kgZZ633j1Y8qFEGkK1fKStUzNmrigrV1X62njysljGe6pGoYA7+UD3Xg
 YfTqdHkxP+MEfemyxOgKVYa+LXcMQcYwB+4x/SBfdECyFdMZ2wIBCB9qo4S8aDnf951d
 Iz5nA+wj5tMcaRO5LfOKF7y9DwdWB0eW+YP9c2ZFwSH1mhNyK3LXyGgkXqTcxozFSC0O
 Auw6S02u25Z+mD7BhbMTxGsqOOuGHgKdFTTs2f/CkS6+v/KVSmBIi4HEWB3YKeNqpNTH
 I7GA==
X-Gm-Message-State: AO0yUKUO+BGf502FZw6PUXTfy2wVraY/pNa7XmacIF15x0I1g/02HDHH
 c2P+RBc3iY8g39t0t6fmr6NgBdaBTegVdZ/yt0Y=
X-Google-Smtp-Source: AK7set+nTv70qSYVTjeIpp1t9eSGehjfAWutqaPO6ivv/ld5uwMbryF0R8FprTMEuhB+Nn2ZcBzRKQ==
X-Received: by 2002:a17:902:700b:b0:19a:e96a:58b3 with SMTP id
 y11-20020a170902700b00b0019ae96a58b3mr4350136plk.22.1677639451006; 
 Tue, 28 Feb 2023 18:57:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 26/62] target/i386: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:07 -1000
Message-Id: <20230301025643.1227244-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-23-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/tcg-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index c090ce152b..b942c306d6 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -52,7 +52,7 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
     /* The instruction pointer is always up to date with CF_PCREL. */
     if (!(tb_cflags(tb) & CF_PCREL)) {
         CPUX86State *env = cs->env_ptr;
-        env->eip = tb_pc(tb) - tb->cs_base;
+        env->eip = tb->pc - tb->cs_base;
     }
 }
 
-- 
2.34.1


