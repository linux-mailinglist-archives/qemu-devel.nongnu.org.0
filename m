Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D433ADCC9
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:28:54 +0200 (CEST)
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup4m-0006UJ-Vc
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoy4-0005MG-MY
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:57 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:44782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxz-00080l-7N
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:56 -0400
Received: by mail-pf1-x42e.google.com with SMTP id u18so5644019pfk.11
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 21:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=soBxmYzIZMGH+aXCnzU66X8RLdvoKJnc1fvxigxH0fg=;
 b=of+tKD29OLtcKdR0OPS8PhlSF+PcG44d4in9HuN2gHtJ7sx2LTIaDNvFmHkIal2z+q
 iTPVPTWuKZi0/XnIhOLdeBWCpbBBVnqgHgNRQNUvVM5kU3PApsD7eaT6h9BAjMlMoT5z
 OozTtbsZR7qFi8+VvAHE4NlHeTx/4ZaEGIyzmKGrIlvWCl/P/yp3885WU+NclzVuldh1
 O2K3nFcxKj35jhfMdPb3TX8mdIlNSzZXhivzpPkyMNNQSbV7ruYWglRweJ1PK1C9iUhj
 lXUwo0PU9Z0Ra2+ph8Fd4otuo4HHyqtW/ZhL2w+kJQsMXvcETRxtVvKZWjlTl4lQpBsa
 4j6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=soBxmYzIZMGH+aXCnzU66X8RLdvoKJnc1fvxigxH0fg=;
 b=RVZ+wcnHLOBHdFRKjzeGsxn6qY1KThT0nqcjCiASvqfl3AOgLh7xgagm61SAc+dmou
 VogUzpGyTsDhnGWKEC6fdNErz9gRU8JN/APXGkTX+lIDdKhvANZf+LKF0Ff+/mJQaEJd
 fyEj16zJ/SYQQq+qRT1Agr4Ssi7G9qbB0+1s1zy30QemqaJqzf84e6SGlwauZeL+nc2I
 +6lE+KFGdai2u//knqygbiqOZqckMo1hrz0B9o/GqzPbEun1m3LKkOuMAmhI7F2AhsHs
 8/hRL74a0OnFnuQokv+PZSuPxqGfkirwTG9k00Z76M9c283M/dCgqrqylK4fjndVk5ad
 NdUg==
X-Gm-Message-State: AOAM530e/B9xbCZQUkXrtwZBs/MCza+vpOtcZ/KPBA1RF8HuUzhj3rrb
 zPMzuGS+XAAeTr+8vW9XV0exAWg8jAe/mA==
X-Google-Smtp-Source: ABdhPJxPC3xV490iQ5Ap3LWhGg6J0MO636mB60pxQh/OOk76y8GfLYepEQYaZuLWpKMIfRXZV4djvg==
X-Received: by 2002:a63:e04e:: with SMTP id n14mr8530781pgj.324.1624162908886; 
 Sat, 19 Jun 2021 21:21:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b6sm11923156pfv.16.2021.06.19.21.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 21:21:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] target/cris: Use tcg_gen_lookup_and_goto_ptr
Date: Sat, 19 Jun 2021 21:21:41 -0700
Message-Id: <20210620042141.1235541-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620042141.1235541-1-richard.henderson@linaro.org>
References: <20210620042141.1235541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Indirect jumps can use this to avoid returning to the main loop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index e4cbc35ebd..8a8d62f11b 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3330,6 +3330,9 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, npc);
             break;
         case DISAS_JUMP:
+            /* indirect chain to the next TB */
+            tcg_gen_lookup_and_goto_ptr();
+            break;
         case DISAS_UPDATE:
             /* indicate that the hash table must be used to find the next TB */
             tcg_gen_exit_tb(NULL, 0);
-- 
2.25.1


