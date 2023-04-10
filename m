Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635D16DC89A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 17:35:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pltXl-0000bW-VP; Mon, 10 Apr 2023 11:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pltXi-0000UX-Gr
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:34:54 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pltXg-0000nP-5i
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:34:54 -0400
Received: by mail-pl1-x62a.google.com with SMTP id ke16so4885857plb.6
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 08:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681140890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcNEhGFLchqZMB3huLw45XXaPWISEFJfrSvpuPV2BPc=;
 b=AyjpoMXiXPIjRc41wrEmqxI6orJkcCMvzAJEB3j5RxJw1PpqKF5YCb86SHu8dZBsIA
 mDwPbmSt14OJ7CdRb3AXyyuRRA0m1Q6BRonkP3QS6M6MljZ+IogZu70PDhXgMOjcgTZp
 +sP+WSBUACNkHx3+XDFi02UOBdJzQsw7fxNOKXNcvFdc7HRE1GiZbNYIikb7aLZw/PuZ
 8x4KurMCj1uvQ/9Dl3Um5fjO1IwhXtz27bVjU4RoXmwbW4sXOdo7ypoQqslC29MRlv4t
 hfjLwr9fYJaDrRZUlq2dZbybzHqNt6lm9yy2Ao4orHuEhrDkwpHf+k8gnndIM0ch6oO/
 5ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681140890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rcNEhGFLchqZMB3huLw45XXaPWISEFJfrSvpuPV2BPc=;
 b=GZXBoe7IQselhmGvgk3iH5l8OAupIaIJMSqjokbz+DMPzHPtHOyJX8PFacakjURrXT
 cGpv0PsgfJfsc5ISRDRifG9+LELUaVoY3zBrnMhN7lIFvWvgyO404L+/X+19rbmBMkK8
 Hu+cwyyLlRlOAxC7glGl3PhXCX3iDXke5pX+eD2RjwI/haRQpeCJS0eMoeqPeimT5qWA
 MwQLxiu8zHac/uCeyc7LmxUCgHYk/P0VpVOen6BG9LOF3Xv7F9qrWsxNgkikGZdgqcmJ
 3FhThB2jgYAm79iIrFAcuTVAgQsD9jLEjLnhx+h7YQvHB/fZwm9MFYNLLGev1j2uFcqe
 fYcw==
X-Gm-Message-State: AAQBX9ehr6OBRCrknMARm16c85+2mZc7pS/Yq+kq1P2oeVa0hWV0jA+C
 Lm46tg2gfr45v23/ngimurXWSIKMzrXW1suPuAQ=
X-Google-Smtp-Source: AKy350araymii7Q9LaWEQHlyfWjW3nFs3kRz8uhq1wES1LcKF/06+9o1GTYjDAh8SYmIDENwFgzcBg==
X-Received: by 2002:a17:903:4101:b0:1a5:19bc:d70d with SMTP id
 r1-20020a170903410100b001a519bcd70dmr8196103pld.38.1681140890674; 
 Mon, 10 Apr 2023 08:34:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:2e6b:e4d3:9526:71d6])
 by smtp.gmail.com with ESMTPSA id
 jj6-20020a170903048600b001a64e854553sm534402plb.159.2023.04.10.08.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 08:34:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 1/3] tcg/i386: Adjust assert in tcg_out_addi_ptr
Date: Mon, 10 Apr 2023 08:34:46 -0700
Message-Id: <20230410153448.787498-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410153448.787498-1-richard.henderson@linaro.org>
References: <20230410153448.787498-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

We can arrive here on _WIN64 because Int128 is passed by reference.
Change the assert to check that the immediate is in range,
instead of attempting to check the host ABI.

Fixes: 6a6d772e30d ("tcg: Introduce tcg_out_addi_ptr")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1581
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4444eb9234..5a151fe64a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1082,7 +1082,7 @@ static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
     /* This function is only used for passing structs by reference. */
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+    tcg_debug_assert(imm == (int32_t)imm);
     tcg_out_modrm_offset(s, OPC_LEA, rd, rs, imm);
 }
 
-- 
2.34.1


