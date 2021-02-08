Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D24312904
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:43:19 +0100 (CET)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wWE-0006eu-TB
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRK-0001JS-Fl
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:14 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRI-0005l3-K2
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:14 -0500
Received: by mail-pj1-x1029.google.com with SMTP id z9so7926443pjl.5
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MfW3tSMzNg4i1sVQnx6Ri1BGJD02W5/7jILfn3srnPM=;
 b=VS0waLwYeGHq6EcvrcZIgqfjf4sgCZyhNkWKtePxMAJQ4N9Iu5//tuz9HZM7xC9RcP
 IU80zF8rUa7pWAp6wAIZnXNfI5KenyatFcqhG5PPNwppPq56g0OSBiUqiNRhPGc0xT9J
 sFknPKTUYjyx62jAFYLhHK9K7O78QOZcuqw/8Gn7oUyXEQQLaHwxnvRg1muq4Zuj1kVC
 ayi5txQPhTYhVzdsdmDMNoTuCWu7l8wyCIB2hATuEtkLusoIYIaL1ffJwri9dBkdq+BM
 S0+WfTzgFneB04l440VAGs7clGtaTcm9eqBKBmtoKZTnNLCmiA6YfIasci1r4dWz5RLY
 aUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MfW3tSMzNg4i1sVQnx6Ri1BGJD02W5/7jILfn3srnPM=;
 b=ptC64DZTEmjavzLVXbv1a2LBLPiikkc+Y8tQK46n9FfJ8lnjEQfI7JsWT9i2WkqsiY
 7CdKuSTBbjvbYF4O76g8TFuPEk2ZHzOgko8IGMXwwBKyw3npf9aEiJBsDb4OezdfNgMb
 PL6A7A462VuFxJRFqY9zBUydS+JuljnMnSXOuWK5BwFdourW6IMSYjinbhO3ou/U60/R
 EOEbzU/oARMS7pmC8JCaSEPFdDhERPxjCeTsrDw4/RK0d2Ud4MwId7e/eV5Uxag3cKTD
 aFSDFPGq5zsAKSyH3d3TcTaXfUaNPOppTkrtbNM1RPMjcQ49nZp+s7a6QaERyAzJqa65
 5VHg==
X-Gm-Message-State: AOAM5329anHkKEgbwjUdcaWJ3gi+ZW4WbqUDaVK71pqw5e2Gfq5oXtMm
 /RpgD5osvW8x1V/subKKDInD+SY45Npw7w==
X-Google-Smtp-Source: ABdhPJx3VfMqYjQL/Bu36qZFw293H/sLKB0h+fE+HACxeE3Ol06XPuHgpLxWOmNX9/wlwDHL/GeGYQ==
X-Received: by 2002:a17:90a:4588:: with SMTP id
 v8mr14486510pjg.58.1612751891373; 
 Sun, 07 Feb 2021 18:38:11 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/70] tcg/tci: Remove ifdefs for
 TCG_TARGET_HAS_ext32[us]_i64
Date: Sun,  7 Feb 2021 18:36:56 -0800
Message-Id: <20210208023752.270606-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These operations are always available under different names:
INDEX_op_ext_i32_i64 and INDEX_op_extu_i32_i64, so we remove
no code with the ifdef.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index cdfd9b7af8..1819652c5a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -796,17 +796,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 continue;
             }
             break;
-#if TCG_TARGET_HAS_ext32s_i64
         case INDEX_op_ext32s_i64:
-#endif
         case INDEX_op_ext_i32_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1);
             break;
-#if TCG_TARGET_HAS_ext32u_i64
         case INDEX_op_ext32u_i64:
-#endif
         case INDEX_op_extu_i32_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


