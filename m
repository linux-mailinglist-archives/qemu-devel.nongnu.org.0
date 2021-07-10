Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A931D3C3540
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:42:10 +0200 (CEST)
Received: from localhost ([::1]:47168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F7J-0005bx-LJ
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExW-0005c3-7f
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:02 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExU-0002Lv-LP
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:01 -0400
Received: by mail-pj1-x1033.google.com with SMTP id cu14so2112164pjb.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54L5C75jlygvay8zC4dzGDDxDxXFnKO0N5KrZ/57hyE=;
 b=hswm1tv4/Y7f8EZfsmIVmEIUGwHENz5qnUpvxRm82HuFygP9LOoeqprp2LUYTDndQ6
 BbAu3WyQxWo570iHjKu5JX3sipYHrEPlIFu7kIe8nBlXfEm0GI70qwxBAZGOrsHbqx+N
 w847x/iDPQRVp8ekNE/v7ovotBxqjsfhrN/9LpxTp1Ul08RiDN/MdKPLfmmuA/st1po9
 fHWRJh4F9EIcT4Y2FSLJqitaO/FvZH+q07oHnWiv2oCWwLzSyx7iEmiAmHNBlQNyrS3T
 4mRjz4xyh5hJrXlb7L0jcXlkaGx3yaKdawf6V5LVW3aYoUT6VqW5J2mwESUvhadDEgXX
 Hg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54L5C75jlygvay8zC4dzGDDxDxXFnKO0N5KrZ/57hyE=;
 b=JPY9w+Ll9BtQfuG4WiM2Syz9noguLT5bhMUal87wpj0LLzoKLPZcn9bd37Luxudbxy
 lciXpAjr6et9YhwlkKfFne2BgHywZF7ePiVg9lkardZGIwAaM8wVI5I3OoqXg9ifPyCL
 TD9teQs3Td8wx8wNw/CbTzOh3g0wEbbH8ys0Azy6ftyNu08o9HICOrIlpKjxWBuz9NzY
 NX6kM/O+30hE2pPkAz/YBnp4MYa0s4MsfOVXI4pcUmBWlrYzqXP5x2KQ3v0RoMDfeTly
 GjFGVMeGhaueES0+1xvQIzP+IQh4gVa0OKp/aaZ+R3oIF6lpBfCP+xYiqHOlz0W5DOye
 AdOw==
X-Gm-Message-State: AOAM531w7PJWtIuaplbHKY38P0d3XHf+O0WaiRdHxxxAYLH2Cpl61Evs
 D1I+rJMHAqbqMLw0HIgnZ8iU9ni0wrMTWg==
X-Google-Smtp-Source: ABdhPJyYDp2jpvXES0B9jjJcQf7IhGIwP9pKLQZn/j5l0oCsOzrE/KgeIP8ND9jHQ2927n1KTOje0w==
X-Received: by 2002:a17:90a:4417:: with SMTP id
 s23mr4776204pjg.228.1625931119462; 
 Sat, 10 Jul 2021 08:31:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/41] target/mips: Fix missing else in gen_goto_tb
Date: Sat, 10 Jul 2021 08:31:23 -0700
Message-Id: <20210710153143.1320521-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not emit dead code for the singlestep_enabled case,
after having exited the TB with a debug exception.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 5cd3e7d8dd..47c967acbf 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4958,8 +4958,9 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         if (ctx->base.singlestep_enabled) {
             save_cpu_state(ctx, 0);
             gen_helper_raise_exception_debug(cpu_env);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
         }
-        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
-- 
2.25.1


