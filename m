Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870105F5FA1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:31:12 +0200 (CEST)
Received: from localhost ([::1]:53076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHbL-0003Hv-Ll
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIN-0005qg-Q7
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:35 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIK-0006yB-Uj
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:35 -0400
Received: by mail-pg1-x52d.google.com with SMTP id b5so706015pgb.6
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qe41tPmrZPNm4lsk1VtLTF/awnlvrW85rsXFJpGy/rU=;
 b=BqsbHKo56x4zJXrgkOYBIzdlv2kyo/5jTC+OT18QmOktP07b6jzLe5G4RazD4ZN1MW
 rwkF9h1MHd0YGknwrJ/8ojFb6jELHWra/kJesCzFyoQio9YIgnSRwvEuPHg40oWEahBl
 4x8C5VKxws6KP6uA4wCGm8YXb1Di/0UVyw9rQwVXIGNgBtp27dHyxFqvhd02A7zGH4ST
 LUyubscjrjnc7tbmSTAykhje70ZSSSkwBnY748zBs/OA0KhJwX/IaZInO7GJth5lSTa9
 m+ne+vmpFH3e86MyQPyIEPmTYlPca+Gad5mrF6r/RuyOzT88d1jixIXZyoQifMCBoMn+
 Qekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qe41tPmrZPNm4lsk1VtLTF/awnlvrW85rsXFJpGy/rU=;
 b=zOMqbwoI69to1eZF0+mZ3DI4Z3B4ulnc5PWnnyNYBEgTfRyJl1VctildluhwZeNaDg
 HEjS6jJqpErQvAPRFMVl5rnO6m1XSCrN9el7g+k3wB0hxz+2P7Aby+jbykKvZJt/OpLd
 HE/PCfz5o4s5pEZASGwHZ4dVWz79cNsP1uFazSmv97hDbJbl6qDn/Y+7zuETV4MhTsfm
 EM5YR7lo/bCpMw2PxbTzD3i42tn8uqUzK7BxzpmRNywK9B9lIx9vS46sWi2RbOYYNZKm
 SUVuLAIccn6uie0bqpFCtZVUNH9A/3NR9TBM8xZYfQt7IPpRUaP0eZGaMfcek1tOYIsE
 PzQQ==
X-Gm-Message-State: ACrzQf1hCA2ygG00h+QVui6Nf76NAhfT/YJN5lu8G3Uv/8QkGGGgqhYT
 iDaGKdONfMb2sjNI9rTSxnLL8XLbCM3pTQ==
X-Google-Smtp-Source: AMsMyM5nPSY+1T3av9L0m3IfuYPS18TS458o2HrRdR47lLsypYeWJBXLY1kc31Iq05QESRm2D4bFRQ==
X-Received: by 2002:a63:f010:0:b0:446:13df:7018 with SMTP id
 k16-20020a63f010000000b0044613df7018mr2490378pgh.546.1665025891618; 
 Wed, 05 Oct 2022 20:11:31 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 13/24] accel/tcg: Use tb_invalidate_phys_page in page_set_flags
Date: Wed,  5 Oct 2022 20:11:02 -0700
Message-Id: <20221006031113.1139454-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not require detection of overlapping TBs here,
so use the more appropriate function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index aa8d213514..8d5233fa9e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1382,7 +1382,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
         if (!(p->flags & PAGE_WRITE) &&
             (flags & PAGE_WRITE) &&
             p->first_tb) {
-            tb_invalidate_phys_page_unwind(addr, 0);
+            tb_invalidate_phys_page(addr);
         }
         if (reset_target_data) {
             g_free(p->target_data);
-- 
2.34.1


