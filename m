Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541D741FEA7
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 01:33:45 +0200 (CEST)
Received: from localhost ([::1]:56326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWoVk-0000le-CA
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 19:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWoTF-00074k-DC
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 19:31:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWoTD-0003Wd-VI
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 19:31:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id k7so21976509wrd.13
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 16:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/XSPdS6mUUOVQyWpXNtGY9qG3RSAnZDpHduGfTbprJ8=;
 b=HSxlBaWtOglpYEzkrbVBQL2YGSp6e3Ui7xu5kwpIKeAI5rw0aS+HiPL2HicBav4XnV
 LRZk9OxnWS8Ajs896+PwAzGwkW0YpM8fn6nYPYIcsuOJp7OybmtT91KVRp29Fr47dlfs
 1sTmcyBRmWoGveU3bIRJfkh+65XqDtWKyRZ/zzf0LV7P0SAlXzEy+a6MPT9zP33zebkY
 juYy8VUBXgKLBXWklzXBeBftBGUBkEQCxHt39SgMO0+Hey2CXWv1WD341jyOA6gfbpCa
 1yAtVpwBEIHTPOC7VWrCNbitKkxxhf+ADH5+Rw/P0yYZW2prrp2sY/G9J07R5aJXj28+
 RHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/XSPdS6mUUOVQyWpXNtGY9qG3RSAnZDpHduGfTbprJ8=;
 b=i4D14y70i3nJmMGhtcUMCpJXziDZcI2ce8biTPAoBWPWfQIrG6V02m2cuLkID7F048
 uvnZSOL6R4KIKyLyYUlMdIfdqzreJl+UaO6VmfevjsFoX/8d9FSdOGsZUVYq0fNb0ZfN
 6FQjrS+FBXNFQa/c2pdaQFzcP9usfa/QtqS4WH9IziVZpQiJzevNhVWKAcaXWxmoEkJE
 gfpLPScbtAONSSlrZhIIJGRcNljb91A6FabwaaSGGPUkLUyGGYJiF+jG4ySYEghvRaAo
 Cll1nfGFZ4j6UeeA36OiMR8IXxiRmGpLdLgQW6N5iisvmPY58oZLEXwwGepdpNtfBoso
 QevA==
X-Gm-Message-State: AOAM532BvhdpB++MeHDFbgrJHUcQFulkEAlPO13eH5cnig8gj2V8qHLU
 n+BvJQPWp8Jsa4eOwQinws98WBSSQCI=
X-Google-Smtp-Source: ABdhPJzv8yrd5Uzce9jXlnf1wF/wrFzWi7p6KjKutPUoARsVca8WW3QsKdfqKkvMns8sCXpK1OoyNA==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr5432592wri.419.1633217466485; 
 Sat, 02 Oct 2021 16:31:06 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j5sm10098336wrw.39.2021.10.02.16.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:31:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/nios2: Use DisasContext::zero constant instead of
 temporary
Date: Sun,  3 Oct 2021 01:30:53 +0200
Message-Id: <20211002233054.3575646-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002233054.3575646-1-f4bug@amsat.org>
References: <20211002233054.3575646-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a register holding the zero value in the constant
pool, use it instead of a temporary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index c398c5320fb..8524a2f6dd8 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -613,17 +613,15 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
 
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_const_tl(0);
     TCGv t3 = tcg_const_tl(1);
 
     tcg_gen_ext32u_tl(t0, load_gpr(dc, instr.a));
     tcg_gen_ext32u_tl(t1, load_gpr(dc, instr.b));
-    tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, dc->zero, t3, t1);
     tcg_gen_divu_tl(cpu_R[instr.c], t0, t1);
     tcg_gen_ext32s_tl(cpu_R[instr.c], cpu_R[instr.c]);
 
     tcg_temp_free(t3);
-    tcg_temp_free(t2);
     tcg_temp_free(t1);
     tcg_temp_free(t0);
 }
-- 
2.31.1


