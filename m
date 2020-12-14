Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA82D997D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:12:48 +0100 (CET)
Received: from localhost ([::1]:34642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooal-00024G-Oo
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRm-0001Y9-8D
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:30 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRd-0003tf-IQ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:29 -0500
Received: by mail-ot1-x343.google.com with SMTP id d8so15771377otq.6
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0sMgt4Z0WrQXqhn3zEIbyMUGDzX3mT9jw9a9qSAx+tA=;
 b=MxfCyiuLfFp8pXMYOZRypiU3ZlEQtSHHG9PZcJ+08XL/K8b9HyfW7IDRbV1zGGHEvo
 9oBNAbrEPukelQ4fRAHejBytl01MTaYz5NXiSBAF59wkoQrQknpQihVFVfKIrngM0su8
 boj+lPHxcBWigcP/dcJdRL6q2tItwaScM8PqvRYSJD/pEQywlnxMgJTkct+6zKIP2bCQ
 +l50ZRpGbfM7az1dsfA1zP6N5VO99dJ6NzvrqQSeK6TxqvO0csWQTJ7A9PB8e+Oy52oW
 E7DcfdQr8grt/NfBYG3iMx1CbeVNPPDZ4SCmfVJigoKJZ8tJe3RbRes+6pf96Jc2YuCp
 oAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sMgt4Z0WrQXqhn3zEIbyMUGDzX3mT9jw9a9qSAx+tA=;
 b=cubulGngXwzJS5c5cZjRvxxfnYe28OSoexzKQVZedxlRc8+ENRmUfVjbA2YLdxMxdE
 0oc+ae8RHFNpG5/6uFcZvd5qYV32od5F/1zmBKGJ5i9zp+z9A2ee4W8JufUZ3uql70mf
 Bcaco+lzDFhe9M9BAVTSxgxF5od59nioCej7Ayx4zOBdM2SBMXDbttuShkBgcUJGCSdj
 zs7kvYGsuERNQ06OWwNKQZt7zVdMEHVWbiChKLTphNIiECf1Sb1vHuiRx6nZxkCRdjSf
 4cuBAo4F5bSS6s0r/T9fPbhVo77wux6MI+txLHwg5Oe3/WTDt+rINScWIXPuEeiQVciD
 9dFw==
X-Gm-Message-State: AOAM531Cb0oE2xRN5cYO/F1HHiSpaEie5LSOWndXoKq8XcT6gQf8+ORG
 GZVw6qh7ZsuHK14+qiVUCS1q1AWyo9Ny77vS
X-Google-Smtp-Source: ABdhPJzFSrCuZjEVOsl1LaCFngj6li7xOAVcAf0pNc0m9tlbobPeA4R27ZVFQOi72BAylwqaeh/99A==
X-Received: by 2002:a9d:32b6:: with SMTP id u51mr18872273otb.119.1607954598082; 
 Mon, 14 Dec 2020 06:03:18 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/43] tcg: Do not flush icache for interpreter
Date: Mon, 14 Dec 2020 08:02:32 -0600
Message-Id: <20201214140314.18544-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is currently a no-op within tci/tcg-target.h, but
is about to be moved to a more generic location.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 43c6cf8f52..3b3f366acd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1077,7 +1077,9 @@ void tcg_prologue_init(TCGContext *s)
 #endif
 
     buf1 = s->code_ptr;
+#ifndef CONFIG_TCG_INTERPRETER
     flush_icache_range((uintptr_t)buf0, (uintptr_t)buf1);
+#endif
 
     /* Deduct the prologue from the buffer.  */
     prologue_size = tcg_current_code_size(s);
@@ -4319,8 +4321,10 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
         return -2;
     }
 
+#ifndef CONFIG_TCG_INTERPRETER
     /* flush instruction cache */
     flush_icache_range((uintptr_t)s->code_buf, (uintptr_t)s->code_ptr);
+#endif
 
     return tcg_current_code_size(s);
 }
-- 
2.25.1


