Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA634425D30
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:24:34 +0200 (CEST)
Received: from localhost ([::1]:41582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZwP-00015W-PF
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXJ-0007ZD-7i
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:38 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXG-0003t8-PX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:36 -0400
Received: by mail-pg1-x529.google.com with SMTP id g184so831259pgc.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V8FaT5wh45Jchl4v6/n+w9IMnzZef9SRdxsANm8+ru0=;
 b=d1virIxInMYB9gHnSPcNwJva5WuRe0hkuzllw0y1CZjOYiVympb91mHZvPDlnIlRgx
 wzVRKk7ovL40JeOijB5h9GwDr5rRiQ90lzQjUuKy/rf2SdjFL8a4DWZLHtrXTq/hw7j0
 pu4LrDw+B7QgOUBVWdODVuu4qo+wKFh8mh00WqmW676b9vJXy8YN4MeJzghIhaW4uFux
 5WoHwYlIvJT+keD/gOvwo0didytAEEPWE/qvC7lLxHEpHwb3x6oxwePR8izTu6BjHvn5
 XQIHskcTK31Zz6AclNnDzHV87mASoYDGeqL3mMI1d8njfQtABmaIdZv00ZFDIfuVJK/7
 tXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V8FaT5wh45Jchl4v6/n+w9IMnzZef9SRdxsANm8+ru0=;
 b=C/Ixd+km0ltJE3VLcq1YTzdS9Gm+BSNPMvMJZlHP9EXiGsGsWUpC7esmbNm7O7hj7S
 8yKKfcxCSu5xfSr/++I6IGb22KAOlbSu17v+CrCrAIVdSxX3DYpqxv8m+BFlLZoD3OYs
 gjE6i14fJ65R36X/8z1IbkbXiMhfIBWlQtW3Jemhk/kiTuxEg0vcJOd4QvXZZCmZzysc
 rtAgJzdrFM94eHahT214UTb0CXAXlxlBZvtZ3/BL5FrGcNWbF586EGmrchgXZ26emfae
 P1xhSd9ng4O6Ho//FiXWj3yFMfyJwXfo1cLgk1t74b+U+eKndE0z8I/W+J8Ha+SCoabi
 GuMw==
X-Gm-Message-State: AOAM533/orp49Bo0V0/FT/P/nL2ubCr3Jj7f40bBpX0cseoZ8N8i5eUU
 /t07a/qVvWTN/f1K59Ycym+9UEUvMst5rw==
X-Google-Smtp-Source: ABdhPJx3MMn7h5SikITX6LDKr/SwpcqbB/KT6p8Yl2RWWuXQ1zkI2YelV0j2wUSnhST0SrMmtRy0FA==
X-Received: by 2002:aa7:943a:0:b0:44b:e771:c7d1 with SMTP id
 y26-20020aa7943a000000b0044be771c7d1mr6002093pfo.42.1633636713413; 
 Thu, 07 Oct 2021 12:58:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t2sm8995380pjf.1.2021.10.07.12.58.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:58:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 46/48] tcg/optimize: Propagate sign info for setcond
Date: Thu,  7 Oct 2021 12:54:54 -0700
Message-Id: <20211007195456.1168070-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

The result is either 0 or 1, which means that we have
a 2 bit signed result, and thus 62 bits of sign.
For clarity, use the smask_from_zmask function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 71e97ccd99..1c106bfbc3 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1689,6 +1689,7 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 }
 
@@ -1761,6 +1762,7 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = 1;
+    ctx->s_mask = smask_from_zmask(1);
     return false;
 
  do_setcond_const:
-- 
2.25.1


