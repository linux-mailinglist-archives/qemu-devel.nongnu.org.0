Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0082E6A3AC1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:46:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWCH-0001VH-Tb; Mon, 27 Feb 2023 00:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCF-0001Ph-P1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:11 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCD-0002Qe-Va
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:11 -0500
Received: by mail-pl1-x62a.google.com with SMTP id ky4so5570113plb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMu/UfowZNJPZ+Z1nOXWigHv/O+5gtKWuTrVMk/F7g0=;
 b=GbCQgYK4QIDZXquSfLjwaM8VLvXl3NZfdSR+K7f4x6xbPqUXXCA7G0bJ/NSehLc62F
 Dy5dzfvd7MGIk11q4Zuo2ARMpBsf5HOCeOKtL7EiqrvpHOHfpZ6n8m/eoSwQrDAZfzH8
 z7dfJ7ANSSe17QNY6USFGaRnwqmUfNfvsgJXZFbEnW7oAeKL+pO6eXmppdbmPMcvaoWd
 Cz4Li5wfB1zJX2lWXlBWeE0b6JgXpkmfaW+XPsmts/oNfe0cwg9UOqa2xI5pCYF6Lm5j
 ej8L+aEYGRfwoAC/Bqt5rbu/+bT+SNFs51Vu1wBFFYpk0u01qzrr4EB4ibkCNENBN1Rj
 bNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMu/UfowZNJPZ+Z1nOXWigHv/O+5gtKWuTrVMk/F7g0=;
 b=vKo40GW1pIeQzj3FqszG4IFpqJEuKiwsMKMf3AISguD1P6y4qBVCDfn0j6m8DWT02l
 mp9t6NqRKv3irgzgilQQYAUlBzWHlfFnWLZ0gav2aiZTh0fODcNY3zvERwU20bneVBBS
 6zCpD0RsV4Obdf57Wn721DXCLYwBtC2EedGMiGuXuUqdw9m0DAAlpY0iGC1XMOSeSwkT
 GtsH6UzLSeCu/MqWCm5hmU+3nSLHeGbterRgKgKq4j63aCny+2e/RvwGNoojrk+EsGdN
 AGSv+xTUEObf4tprGeMkcTQmoNT6PTcZyaGCGfJITOfaRKTyq1XGK9wAKV0cYecGILoZ
 cfwA==
X-Gm-Message-State: AO0yUKUtDgN8HT201UQ3DWJrrsqZQlEm0qs8IjevLsoyo1D4SuEZ3ZoG
 s9npmEwfRzpomz7ZfY5fRpsy4PwUezrNR4CHMdk=
X-Google-Smtp-Source: AK7set+X6twf+6dc+BmF+qyH9KhM7twYjroLflo/66HPIlYF8hVCb75WwFCJOiKmB0ZbSPkeELL6Kg==
X-Received: by 2002:a05:6a21:869d:b0:cb:fe3e:e20 with SMTP id
 ox29-20020a056a21869d00b000cbfe3e0e20mr12752517pzb.42.1677476228549; 
 Sun, 26 Feb 2023 21:37:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 01/31] tcg: Adjust TCGContext.temps_in_use check
Date: Sun, 26 Feb 2023 19:36:31 -1000
Message-Id: <20230227053701.368744-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Change the temps_in_use check to use assert not fprintf.
Move the assert for double-free before the check for count,
since that is the more immediate problem.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a4a3da6804..06209e6160 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1375,16 +1375,14 @@ void tcg_temp_free_internal(TCGTemp *ts)
         g_assert_not_reached();
     }
 
-#if defined(CONFIG_DEBUG_TCG)
-    s->temps_in_use--;
-    if (s->temps_in_use < 0) {
-        fprintf(stderr, "More temporaries freed than allocated!\n");
-    }
-#endif
-
     tcg_debug_assert(ts->temp_allocated != 0);
     ts->temp_allocated = 0;
 
+#if defined(CONFIG_DEBUG_TCG)
+    assert(s->temps_in_use > 0);
+    s->temps_in_use--;
+#endif
+
     idx = temp_idx(ts);
     k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
     set_bit(idx, s->free_temps[k].l);
-- 
2.34.1


