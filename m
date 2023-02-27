Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223FB6A3C17
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:13:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWOM-0000Yl-6G; Mon, 27 Feb 2023 00:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNP-0004VY-0e
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:44 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNI-0007aA-Kw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:41 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so8930758pjb.1
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1GGh7DMqJjXiFDkrXWmx7lkNkzrItdtK7foWMBTyE4=;
 b=GVzzv4mkD/9Ikhv7Z96vauy6VKz9nqaW86TpN43eHsBR6JkHepotzv3WUUv1GPPMZC
 kGDiPq9UqdczFT0/r6K6JJftUhNqrrBxH+pDk1SOwQMhRreFTjDjdkVDxx6ZFQqSjoMz
 qL4O9v6FXOpaC6n2CNWXVUG7RZfCQurZjovB/E2zD5yq1eZKgGbRnBuTXUeqto8JsbIY
 cEo9VqMliCy5A8/anLb1GbAqFpw2nX3vy3hqLPWW/GGb6/TwJmkO3lLLj2+Xk317i7/t
 6mmw6eE/c7vqKGiPJ26hajB08yULISCduEJ7OkB44vyL0xdmIBw8ZckfZtGhasEupMOL
 qgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1GGh7DMqJjXiFDkrXWmx7lkNkzrItdtK7foWMBTyE4=;
 b=6jCjzOvmMo8/4suUSjd4nJac8wopUxE3eD+xJKkLID913qtm0cutLsK7X0WzMrdLGD
 AxC7wwLMvB43XVoInKf/+JyUY15BUvT+UJAKMMosC7OoaNEyJJ4543xtXg6h8c9Bm9DJ
 urbgro8xiOt6kZer+OSOd2J1PpjTJiXNgcFax61iyCMhpCLI/n2N+cZOSUowNIyqdc7g
 njMJ4tYssWO2Gu70vPQUteTqu/eXt7ykoLf6XvL6l35PcORF/lXygjFQ6wAG8V0YnI1P
 4ByPRD6C9YdK48yHxHG/nfYF89Oqg2OJ2G8F0756AqhChuZ7q3ONdNbpfo/vcEVYBukg
 ghhg==
X-Gm-Message-State: AO0yUKUeQ9YG4FDbR5a+avXNlyXfiVvTLwAY/E5aCD6DjUtGlfqonJbd
 kCJqH4tpuF+OX4Nc9paAOqeXvvNY9FuSEiGvCXg=
X-Google-Smtp-Source: AK7set+ioxGZuhaynWjAjJLLvkSn1bgSWRU5/TNZK8fD4IO+WoKscUuHPndAHq8yE224LKWJ8W1XGg==
X-Received: by 2002:a17:902:e851:b0:19a:7758:e5e6 with SMTP id
 t17-20020a170902e85100b0019a7758e5e6mr29462074plg.48.1677476914605; 
 Sun, 26 Feb 2023 21:48:34 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 64/70] target/xtensa: Avoid tcg_const_i32 in translate_l32r
Date: Sun, 26 Feb 2023 19:42:27 -1000
Message-Id: <20230227054233.390271-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Use addi on the addition side and tcg_constant_i32 on the other.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index d727f9ffd8..41b84082de 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1721,10 +1721,10 @@ static void translate_l32r(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp;
 
     if (dc->base.tb->flags & XTENSA_TBFLAG_LITBASE) {
-        tmp = tcg_const_i32(arg[1].raw_imm - 1);
-        tcg_gen_add_i32(tmp, cpu_SR[LITBASE], tmp);
+        tmp = tcg_temp_new();
+        tcg_gen_addi_i32(tmp, cpu_SR[LITBASE], arg[1].raw_imm - 1);
     } else {
-        tmp = tcg_const_i32(arg[1].imm);
+        tmp = tcg_constant_i32(arg[1].imm);
     }
     tcg_gen_qemu_ld32u(arg[0].out, tmp, dc->cring);
 }
-- 
2.34.1


