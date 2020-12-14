Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7102D9A04
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:32:31 +0100 (CET)
Received: from localhost ([::1]:40236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooto-0002AO-Mm
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSE-0001yI-Cm
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:58 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSB-0003yG-Sn
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:58 -0500
Received: by mail-ot1-x32b.google.com with SMTP id h18so15762807otq.12
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YKIoLTi5ySgzCVvhycZMdw7nP6Jv58IFUwkqltF23wU=;
 b=NWB61TiIZFqsBWSTFRTlWr8p0DDqLOVuvdA0LBRrcL12HTHdURYadXRUDBCbYcPmYd
 MMGxNLPDpgDAAicWJXM0/G5IE+7sEhcWivp0xZxVm7rjm2pasD2nUt0x5aCASMK5Ifa4
 cLMwk/rNeyymqOJjwcyW1KyTBaddD/9BG8b9fKM0yL6X2a1QRexgXzXex6DlZBs+u2yA
 /Cv1qFXRGAdtaWMbKOzu8arXMvW5Q68LwjoC9oaB4QwcfdP8a0Mkc52ZQqhWGGQMBL4V
 VzLdBGw2pdCmexnDKSeSVkOaKoo8wsk32bt2BoClNgp8IWABn/JsyEIPYxCZqd2nu6Jd
 /98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YKIoLTi5ySgzCVvhycZMdw7nP6Jv58IFUwkqltF23wU=;
 b=SSU68Ujfi2ktZwntvvTlxfsxMF2mJMDqZkntv26aAPNKOmMDYM9kthAE2W6ICIpgD1
 u8FCnB5P+eZmphhr8J/eQ9bGfBH3nIhdFmNPEJad0OO5ItQoJvBXxuXj3Q1Xvg38977F
 x90lPeGyPxUU7Ezo/OF1RR0qV/xIMknUh4N9lPRzZWEnRR+StC+XHctBJCw1n/As422p
 Odu8g08UJrHhXxpUgGYRP8UP6anyNi1CY5KcLM53TBX2tzOMG68QpItEtFT1CSwv6x/A
 IppKzLvgsIEiCg6yI7kNMNJKvQtjMHOayn07mb+tLyWY+SHoWa6ZUfTXmsr6unDYGp6x
 er2Q==
X-Gm-Message-State: AOAM532ucEQyC2LsAeTm2kgerohcSlAI5rQQU4CLujRaB0XKLFr2Tu1R
 nMzjCtEeUxsheZUOr15leMcmcZjiCxlzdWZ1
X-Google-Smtp-Source: ABdhPJxLU6Ww1hWfsg9WyxiRFzvKFyys8iVoZFMTMfE5OCcENzeJ65qXXXEAIGX5xDYOrCUVtPrfpA==
X-Received: by 2002:a9d:32b6:: with SMTP id u51mr18875591otb.119.1607954634157; 
 Mon, 14 Dec 2020 06:03:54 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/43] tcg/aarch64: Use B not BL for tcg_out_goto_long
Date: Mon, 14 Dec 2020 08:02:53 -0600
Message-Id: <20201214140314.18544-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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

A typo generated a branch-and-link insn instead of plain branch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fea784cf75..bd888bc66d 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1317,7 +1317,7 @@ static inline void tcg_out_goto_long(TCGContext *s, tcg_insn_unit *target)
 {
     ptrdiff_t offset = target - s->code_ptr;
     if (offset == sextract64(offset, 0, 26)) {
-        tcg_out_insn(s, 3206, BL, offset);
+        tcg_out_insn(s, 3206, B, offset);
     } else {
         tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
         tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
-- 
2.25.1


