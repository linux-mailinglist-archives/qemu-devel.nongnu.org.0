Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284F53AE185
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:45:36 +0200 (CEST)
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv90J-0008Pa-6y
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pu-0003ii-O8
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:50 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pq-0005As-Ba
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:50 -0400
Received: by mail-pl1-x62a.google.com with SMTP id h1so7663215plt.1
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRMrTx4NopqOKJx2Uk7lglqxDnltwjXqtnzEu6kn91s=;
 b=lmzWe61B2HYcthxnMJUxKtS2qgp07znoEMfMaNOpIIbbliJ77Ln21Vh7fajq1DzPfB
 e4v3lcSrqRWEDnboFxYspTG/QaP4d+WaR9zbYq6pb+blkaOCLMfxt0E5JRnDSohoxfu9
 xtEnVO8ndDwiOYwZsRET+PvyHzwio8S3fmJgbbGevrrkn22xmvkuTPJOTlHshx8eGZBi
 yba+KykPsYPe6ARSOONc9sey7ZfJUt6vKw14Wt4OJpRkQXTrQbSyDPVcEZ546mlC1VWZ
 HfmjDWIJKxP/HjJJnggwSN6NUBILSbx+c/+gTQiqQsIzJ6wGq++Iw899nST8knX/cAkh
 wfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRMrTx4NopqOKJx2Uk7lglqxDnltwjXqtnzEu6kn91s=;
 b=QgkGEXYlNYfSoSo5iFVtClQ3kjB2h4csKANs2oUsLdJjSkhCrprPFmTeiHdBpdfMf5
 wmeOwjqvodzGDboxtgZAkuGlv6gDEUVhHcaPT0Zy4qdZXPUH1Q1SaamkxLtMKVALGGK6
 T71oDVVhvTDVoYO5vkAaed8RitD6YjtbGLTCoZ/uqpndGcwPrey9+bqw8f4rfvZZf1Rw
 RCmtv/kD0sspWQeGc1Cd1l7MFdv+ZE3fYiR2REaf0X/GOB6s3nXgtaPzjjhxOGdenHmh
 xDRE0XfRhybq49C/jcZaWxyEm07vU6yGLROwemUNSUkEpQFSCwbo26mF9staRdve1Fla
 1TUw==
X-Gm-Message-State: AOAM530wXIiZxliyUXIpLmzwJksqMd8wwUMr5A4lUeB95O21vH+0chsI
 Emu1sj4RvlBT3Nl/jrkydi/Yxtp7OV9Low==
X-Google-Smtp-Source: ABdhPJyFLDQM+I9q6LC3YSL7ig2j8thaebvsGftuZViBN5ukhaX11/p/+/qLsbKSYwNlu/a+9nkvwA==
X-Received: by 2002:a17:902:a981:b029:116:a139:6054 with SMTP id
 bh1-20020a170902a981b0290116a1396054mr15453997plb.60.1624239285064; 
 Sun, 20 Jun 2021 18:34:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/26] target/avr: Mark some helpers noreturn
Date: Sun, 20 Jun 2021 18:34:20 -0700
Message-Id: <20210621013439.1791385-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
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
Cc: Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All of these helpers end with cpu_loop_exit.

Cc: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/avr/helper.h b/target/avr/helper.h
index 8e1ae7fda0..4d02e648fa 100644
--- a/target/avr/helper.h
+++ b/target/avr/helper.h
@@ -19,10 +19,10 @@
  */
 
 DEF_HELPER_1(wdr, void, env)
-DEF_HELPER_1(debug, void, env)
-DEF_HELPER_1(break, void, env)
-DEF_HELPER_1(sleep, void, env)
-DEF_HELPER_1(unsupported, void, env)
+DEF_HELPER_1(debug, noreturn, env)
+DEF_HELPER_1(break, noreturn, env)
+DEF_HELPER_1(sleep, noreturn, env)
+DEF_HELPER_1(unsupported, noreturn, env)
 DEF_HELPER_3(outb, void, env, i32, i32)
 DEF_HELPER_2(inb, tl, env, i32)
 DEF_HELPER_3(fullwr, void, env, i32, i32)
-- 
2.25.1


