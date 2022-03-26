Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675784E8116
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:33:36 +0100 (CET)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6Xv-0007JU-H0
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:33:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QM-0006k0-Ue
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:46 -0400
Received: from [2001:4860:4864:20::2b] (port=45849
 helo=mail-oa1-x2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QL-0005Kb-EB
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:46 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d6ca46da48so10698454fac.12
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RUBe0C4iT5t4/OHe4DJ+hJf3HvDnr2dd4byJPft2OJg=;
 b=SS7zup/SZrIrLiMXZnwvbwZjRdq7LBu/EkobD595kZy9Z7pP/vxiFBZAIFnAKh4WWk
 pc2xu6WI2Pz1CufeZG9pgKJzAMeQ8P/waZu4NjbmSESFvQbTm8BoWgCKh08tESN8V/a5
 B6rJjEPPS+sOXF0If5xMGV0vfZzsAMEadC9bVTMNjKEt855Ht/xdEeZ2Bn1IVoqnMHVh
 bZ447rWDcMuuAG5wt91pH6v3To4ridHOYE6HIeWiVN+3WcjwKT0PbtRdq/QCzVDnMJgA
 NKuvG5lfjgMrdQes3I6njT01abWH8FP18TplyObdAflPOI6gc2oQtm3JKN1eBYFGqW5Z
 KSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RUBe0C4iT5t4/OHe4DJ+hJf3HvDnr2dd4byJPft2OJg=;
 b=RFS4Q6za2wzjqzFnjPRKIDjD4nPOn/L/SIBnbw40b5su5qaKF8Z6F4JCYEPIPQLdZW
 cv0WA8t5U1HIc4CBdjFnR9zqoi3cRLW21dejjTYw70ZAOM2KHo3dWI/9Irlq2sx2UKJv
 TI3cGseHjWCf5AMPXwN9TMJyqr+M2NhZIuTi8u1pjgirCOBBUNATC+/BfoCzq3FrKVO+
 VwHUamGeeRsRGln4+m6zvs+UWWecuiGXn0MrGMxnF0s7yomQ3BRy57vtCuw+jo7KP7Cr
 Ll2/YlInHCIxhDJKsEYQODy3TZsfj88SmliDoRl9Rg9yWGPXzfWQF2t40ACl3nxr7T8X
 r3mw==
X-Gm-Message-State: AOAM53023uo6tsV1BXsntOjBZsWffyiUYyCenwYYqGEG1171ADN4Ns92
 9lRPz2PQOHtEZ38wfu6TI1TQJdqbtR9Al2AP
X-Google-Smtp-Source: ABdhPJwtMtTk5i3Q21A9G0mNZ/nfU2Qqz6c2mIw5AsOSpAmIrwVFJecFSj/KXjR/3Yo67gyx1Q3hoA==
X-Received: by 2002:a05:6870:14d6:b0:dd:9907:2c4c with SMTP id
 l22-20020a05687014d600b000dd99072c4cmr7200126oab.70.1648301143026; 
 Sat, 26 Mar 2022 06:25:43 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/39] target/hexagon: Remove qemu_set_log in
 hexagon_translate_init
Date: Sat, 26 Mar 2022 07:24:51 -0600
Message-Id: <20220326132534.543738-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2b
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code appears to be trying to make sure there is a logfile.
But that's already true -- the logfile will either be set by -D,
or will be stderr.  In either case, not appropriate here.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index b6f541ecb2..98f1452cad 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -874,12 +874,6 @@ void hexagon_translate_init(void)
 
     opcode_init();
 
-    if (HEX_DEBUG) {
-        if (!qemu_logfile) {
-            qemu_set_log(qemu_loglevel);
-        }
-    }
-
     for (i = 0; i < TOTAL_PER_THREAD_REGS; i++) {
         hex_gpr[i] = tcg_global_mem_new(cpu_env,
             offsetof(CPUHexagonState, gpr[i]),
-- 
2.25.1


