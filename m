Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B029681C1D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbFw-0008Cc-Pp; Mon, 30 Jan 2023 16:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFk-0007Ui-JY
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:52 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFh-0005C8-TA
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:47 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 141so8614043pgc.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RGdgdW64uwORmCGv84R5SKLfk4HZSsoCQbj1kTogu2U=;
 b=zMTLhQF8Pxf9xgr7GbqxaELcNmD4wObiC4/SKB9dOS4SvlJdP0qwF9ot7YCWPE2hWG
 hRKjxBxsVj/pHeqfhbQ2qJznaKYOcW10zSmPMabUegPhX4Qd82TuQc7NmEKjuzwY6qoe
 pLHxE4EH4AejMGw26NmNgq66Lx3chJu+d2tZVVDulJNjA+Bk5t2NokQXaIiKY8WbaNjG
 E1DRM1i0/B1F3zrXQ3Y3XaQ1LcxXJmK7sPOVKHtthhWSfn0vXyxhjMaWGapXq2pWguiJ
 afWQZ6c1/99tFjcpqv2hLco+ITEsC8tsmti0yMLmPKrTu0r4ZTCGkJtmCKzUGojxnKN8
 sQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGdgdW64uwORmCGv84R5SKLfk4HZSsoCQbj1kTogu2U=;
 b=t8pJSTQoqe2vN7rBnZG7wm+o0d/UOO5qQsGb4EfgPJscmUzKW1oXebYXaP09AecOdo
 eVxXTQX0h104XzcADWYDEqN3jSyOIeacnTDcfYlXAOCgPlKzxq8O5+mhiowZIyDNQQd0
 NNksB4PhPTtQRH8BnDrIsNWreZF5f308Kx05fzVd1jqel/KpDrjXfodjtTJ00U6faKPH
 KyM+dWFZDpjpdIgWIOD+rCr4wdTVaZJSlImORTxUHjDm5hoZjEVxNroRpTUrrQ3hV4Gs
 ztxqjxywsOyhCM1GTt+HE4Q5YhQPrI+pGx3gWCL7luSlRB/jm4yHF2V01QoX8FcZau5P
 dX6Q==
X-Gm-Message-State: AFqh2koDu/2FXyszJddEz5vCvxxg6L8d/7dOfMFvtbRjr4GWHk+DHyw5
 okak6APu2BnKpIoLoyJnhMoluunaIl85/TH4
X-Google-Smtp-Source: AMrXdXvUscvyvZgm6Yr7Di4lF2673Gvo0Eke0fFEENRA4sAg9pzQtvPScM+7qenzsrG9/2JyOgDOKQ==
X-Received: by 2002:a62:be04:0:b0:58d:95aa:88a0 with SMTP id
 l4-20020a62be04000000b0058d95aa88a0mr46007393pff.24.1675112382147; 
 Mon, 30 Jan 2023 12:59:42 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:59:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 01/27] tcg: Adjust TCGContext.temps_in_use check
Date: Mon, 30 Jan 2023 10:59:09 -1000
Message-Id: <20230130205935.1157347-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Change the temps_in_use check to use assert not fprintf.
Move the assert for double-free before the check for count,
since that is the more immediate problem.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index fee96b3d9c..0bb0bdbe43 100644
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


