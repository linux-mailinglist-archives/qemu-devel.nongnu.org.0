Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C13F3ADD3C
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 07:28:57 +0200 (CEST)
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luq0u-0004IA-63
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 01:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxw-00070L-K6
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:52 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxu-00088a-E7
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:52 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g6so11097145pfq.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 22:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4qSVnysY1E8uYLiCdr9A04N8MDgbO/MjR9FZSilMZo=;
 b=pQj3twemU34HIwHWMb2w70sjRmKKgtMPfrtushO47oEh2JINoY3aLDmrdL7VDcHrKJ
 kmQSJtPgOg3MQ0/YHgeD06433e+DBg7RlSnzQT1zvGFhVt2lxgeS76nLZnZz2q3jPGwA
 t01fmTYjbVngMO0WzFl1xn1mHtDryE5d4uxhAI2VOyqbG/AUX0MOEJVpFa4Kng35DVYz
 2QqmstD+Tj1DvBqzKqo/Kklb0oeJkQaRmwFIxMcf2OsJO17WdRW3ihXu8XYrYgbjr/Fn
 JUdCFYviBrvaEykw9vC53S09ND7HZSOBQ73EbHd0513eJUpuzODQbaL///0Fgrz51EfN
 yVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n4qSVnysY1E8uYLiCdr9A04N8MDgbO/MjR9FZSilMZo=;
 b=qibV0fnFysciXdeio3c8TQw7l/hci7GgA82x+WMpVmby4Gcn2yg3GHJzPSrbr/xVSu
 FP08wMoYOWYWEGrBT0Zz5RXD6sm7VsXJrbkxJqzkJ6gh+0yoc0M7Zz2L77IKlUA4gQXX
 qh1xvTgaGfa9A7udIUkZHohsgVBSJUKCpNQNaXUkCIjbhDx4fBITFWziEk8hLa++Pbf8
 GrZb2NUjC4Tr32tCD0s2vLyEBKO4VXlWBTQkjDHYDhkZNhB/cN7Pd64gxJfMNEQ79fbl
 EdBfbCwpZrNHe10JnUl5tvs8rCF9GfvH17jnLnyL/YhgdgqeqVYUshGEXCjMHaVDNfqp
 qJqg==
X-Gm-Message-State: AOAM533ojI5oHkbeAprzrKe5FFt9AH15KHDrZj3M/EfLiDm/7eZfvdpB
 T6SaFmN8w0TB1k7NEy9Hlsl7302S+YTttQ==
X-Google-Smtp-Source: ABdhPJzEISkOq7l+zgSiMtlLLXoeeAc3p4gOMmCf2bXYY2RYbrXsMTEEbjiBhly8EtjWBqn/b8CCSg==
X-Received: by 2002:a62:a217:0:b029:2ee:48e1:fd92 with SMTP id
 m23-20020a62a2170000b02902ee48e1fd92mr12993092pff.55.1624166748931; 
 Sat, 19 Jun 2021 22:25:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm11409741pfh.103.2021.06.19.22.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 22:25:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] target/nios2: Clean up goto in handle_instruction
Date: Sat, 19 Jun 2021 22:25:43 -0700
Message-Id: <20210620052543.1315091-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620052543.1315091-1-richard.henderson@linaro.org>
References: <20210620052543.1315091-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index ce4a4c40aa..3f4027ff1b 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -753,7 +753,8 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
     op = get_opcode(code);
 
     if (unlikely(op >= ARRAY_SIZE(i_type_instructions))) {
-        goto illegal_op;
+        t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
+        return;
     }
 
     dc->zero = NULL;
@@ -764,11 +765,6 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
     if (dc->zero) {
         tcg_temp_free(dc->zero);
     }
-
-    return;
-
-illegal_op:
-    t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
 }
 
 static const char * const regnames[] = {
-- 
2.25.1


