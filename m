Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EFF66D535
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 04:58:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHd6A-0000WK-JW; Mon, 16 Jan 2023 22:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHd62-0000Ru-QZ
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 22:57:14 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHd5w-0005e3-Qk
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 22:57:12 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso4872174pjg.2
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 19:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5N30iQwf9eez9/YSvtx8wfqPKT+MxH+YK1LIg/g+IY=;
 b=kWOqMUaDsgR9c/SLozPJCr5wvkgGK6kvjMh0RXRsjStNWt20EkcCHJaovDLvigr47P
 3Qe168wiUzwwi2OWINA2JWtbheTVgoKCdEZjfHeOWe1Z9H7GTkLwgYiprQsfK4MBm2hl
 yGtWtli9e5yBhI78sRo9Sr0JRk61mKWl5O4XC77sNZoVlcl9/uJ9CErkqWjiGwL6gRKJ
 w+Vzw0BR10D90fnY9Bdgp/c0ZDbB5UgM+bcRFNbiqrZw5BQdlvu/JFFuH3hOHsIdQbKH
 mJHFLHiGb2w2I62NqPh+WNdXtUoupU440bSppMy9fjniZnK5wXDrnCo31IwNyvJs3sQG
 4+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5N30iQwf9eez9/YSvtx8wfqPKT+MxH+YK1LIg/g+IY=;
 b=wXVs86fGLUwrOSE7XTY13SlzDDxRM1h/zBxMwpLWbBbLjM/Ea9xtomgDkbkXOrMabc
 RX9gpSHOqLTaZGTOxvSAS3lOllDs30a0c0WHd3d9JItbmjpqQYBmZm4Ax+ERDT21OlGc
 Pp1EYH0soUCx1APx5K8VnVMY4jcn83igy/zBlZ4Lmkr8eqmpuynBQiZs3BvgdFbsRRsU
 Y1twNStMOnbcwuhWSqQxlwBioO8QW17nlW3pu4RE2StRPElOFPiCDJoucCnyTPiNg5d/
 Bo1U6nv97eEV67skdtUXEsBGI9T+UGfjLxTfWODwVevYEQon6SQcRpadkQMmMYnhM89Z
 hJwA==
X-Gm-Message-State: AFqh2kqfygvyMCdmaHClyjN6M+r7QbIrOoEH6DKA1lhWK+HKoXefmOHj
 U6YqLibjXXiZdKqdZ2ILClYhTAjsycIbg8e1
X-Google-Smtp-Source: AMrXdXt32bF9kAFzNO1uxoEaMHs8cjbuEKffWGSLLtorNWshaBNirf6+RPqPUGjR63YQppjKYbDR2Q==
X-Received: by 2002:a05:6a20:6d22:b0:b8:2e75:c97a with SMTP id
 fv34-20020a056a206d2200b000b82e75c97amr1258235pzb.34.1673927827359; 
 Mon, 16 Jan 2023 19:57:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a1709027e8f00b001869079d083sm19991531pla.90.2023.01.16.19.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 19:57:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 2/3] plugins: Avoid deadlock in qemu_plugin_user_exit
Date: Mon, 16 Jan 2023 17:57:00 -1000
Message-Id: <20230117035701.168514-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117035701.168514-1-richard.henderson@linaro.org>
References: <20230117035701.168514-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Use of start_exclusive on this exit path leads to deadlock,
in particular when called from dump_core_and_abort.  There
does not appear to be a need for it.

While we're at it, skip the entire function if no plugins.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 plugins/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/plugins/core.c b/plugins/core.c
index ccb770a485..35aca0266d 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -502,7 +502,9 @@ void qemu_plugin_user_exit(void)
 
     QEMU_LOCK_GUARD(&plugin.lock);
 
-    start_exclusive();
+    if (QTAILQ_EMPTY(&plugin.ctxs)) {
+        return;
+    }
 
     /* un-register all callbacks except the final AT_EXIT one */
     for (ev = 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
@@ -520,8 +522,6 @@ void qemu_plugin_user_exit(void)
         qemu_plugin_disable_mem_helpers(cpu);
     }
 
-    end_exclusive();
-
     /* now it's safe to handle the exit case */
     qemu_plugin_atexit_cb();
 }
-- 
2.34.1


