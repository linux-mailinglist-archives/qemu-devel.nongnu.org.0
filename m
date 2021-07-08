Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D2A3C17DB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:13:02 +0200 (CEST)
Received: from localhost ([::1]:48780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xa9-0006Y4-LO
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5N-0001yg-7z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:13 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5E-0008E1-1N
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:12 -0400
Received: by mail-pl1-x633.google.com with SMTP id b12so383914plh.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0XGP5M0/S2fABB4PAMPPK5NzpSQUgfPh56YyyNp9Yc=;
 b=inADRwfegSKuHBbx2YDG9QijXDCOVLZNG0M1zvT6viBlfiOCcUCsRDiJdqUJp3jsTV
 EZJtDJ7VtoyVf2BiCZeNKnW9QsA0a4Llvx2YTlgMdAYYNe8QMmngHCSIvfgtkBXFIbAg
 YyQr02r2j7YqYTcGogXvpWgabxf0Hajn7duB9QEY5qwEkTvqCZBX3IGG/XU467JB9Nmd
 6ztIjxxDZJ0xdiUjlKB+ZEPiVKoEH+m5EumKfDVK6cqDZ9lPLHAurevcfvIygb4uhrzN
 Orjzwl5d3phwodWz/ckcLAGEhJOc/jIctsJL6Z6jN/a4nT9jC3HgdLmP6EcJMEQh8fZv
 tOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p0XGP5M0/S2fABB4PAMPPK5NzpSQUgfPh56YyyNp9Yc=;
 b=e/M37kNWROxgk4+f+1pGl5qd5UhqyOzh3OlKCTzRVBGltTPjju3d9SMqLe7EPQqjEr
 rtfPOAD4TJqfcqP/axUDNtIywOLMNnWObwlXBrqdP75VjOzTp117xcH6/M/IboZgVDBh
 SRn0mjbJGXckIvBVyEf6B8UQ8bzVAXpAv4AxsGnI6tyf9Raa+1eBE2lFcomYAr6varCd
 KB9qLi/Ztdl0eVif25oPxb4Vx6r209mIEmZhtJAx9jFq/iUtNaCLGjIcMb3goDzWt6R0
 FvyJ9al/5eiOhQD0xSY+LGAMGeoseoH+WgokMCIe/NNYmCbXQlAxof1mpTs+6iLlU/g8
 3RIg==
X-Gm-Message-State: AOAM532YaxObh1M3f/lYdSGiZ9/GYpGgtuTtbyRfXKKK6CS43vRF+lwK
 4UwZDUzehLyf6OkG4YXseNm9JV/WgK7Pcg==
X-Google-Smtp-Source: ABdhPJzPmj/I1u0s2Cfh9JPlyHfUfMIFbkTmeV+pvJJb5qnz99WGwp1Gaou11cQ0j/djph9U1Eyx/g==
X-Received: by 2002:a17:90a:7f87:: with SMTP id
 m7mr2669178pjl.101.1625762462747; 
 Thu, 08 Jul 2021 09:41:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/28] target/rx: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:43 -0700
Message-Id: <20210708164050.711967-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 9ea941c630..2443406de5 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -143,18 +143,9 @@ void rx_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-static bool use_goto_tb(DisasContext *dc, target_ulong dest)
-{
-    if (unlikely(dc->base.singlestep_enabled)) {
-        return false;
-    } else {
-        return true;
-    }
-}
-
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
-    if (use_goto_tb(dc, dest)) {
+    if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(dc->base.tb, n);
-- 
2.25.1


