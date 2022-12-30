Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2F86593B5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:15:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2rA-00031m-Kx; Thu, 29 Dec 2022 19:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r8-00031D-Gq
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:38 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r6-0002g0-To
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:38 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso24358816pjp.4
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8QfQ1uDgH78xLrd7SQL4h0WAoUU3UOZ3RoOlmiv5EM=;
 b=XDvLP2D4sbHY9NDu/KvrVhYeB2GOX4knxUYlKvLRGZjXhRHdUK30YpqvQ2Fas5/WGm
 zBh95vQMfSOTxco1aIk6FzAilcBFIFJYBEZG8Fl/BTf2Q2MnWvNwktkiob28QYjs3RBT
 wS2tJ583tmnuQ0WWhIq9AYU2FRyhAD8rI4du2a2eq6ECMdym75GCFPcUMyxfzNaAUXMI
 xmyQaa3WBZlUzvPU6PN6eqo7e9OnJStNcwG0Y92RyVuXcg0NLZkN98R90LgCw4GrZya4
 9viS6DM1o68IiGspa5d4RlvSB2zYyj2GTXdCMHtw50iYWVVLoGw64zvrfSbzaG6loQhS
 hWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8QfQ1uDgH78xLrd7SQL4h0WAoUU3UOZ3RoOlmiv5EM=;
 b=vNP5R/HUNC5GTdzdPQBNOSoUP1QDb70C1XCKR6DtmOdMgJHHqtSrSpdnJQrJMSWclg
 YTbKzlgQMYLa/ixKy7qc0rKsUqPHB1+z0uiK1SPGdBqwjnPwXL6NPnSdRcFpy2VD/Hzu
 t/WRPiEWOaFXk7rzBUPNLDnwRH0fZBwkmxsiR0B8eesat7DbquozmkT4m8PQBsbtXmfC
 6bxAg4+V4JMSca1J0xzksF4PvTGMulDylauG9RdJno2SZjCKld47K+O1RiU3YqhTeajM
 YYhCIcQGuGmOFCEcdlqMSS9LphYF0V87l6+sjX/0axrufUqTw8CQkbUCZ5oluTtvZV+r
 Xc7g==
X-Gm-Message-State: AFqh2kqEoBtZdK9Eu3I51dDd4FlfCq/jamYTRSOYhOBfKp7T61wzQUBt
 io2Gj2zZarJ/g+jJhBMC/CqVhh+GowmUlWyn
X-Google-Smtp-Source: AMrXdXu+oRPFYHXtAXaiQWc/JClwyHBSWL2/CszSRZHfd+NnaLD9Ja4nX2kb7mB2AO6cXPQBHAjwXQ==
X-Received: by 2002:a17:902:ea0a:b0:192:6b73:ccee with SMTP id
 s10-20020a170902ea0a00b001926b73cceemr30844831plg.18.1672358556097; 
 Thu, 29 Dec 2022 16:02:36 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 14/47] tci: MAX_OPC_PARAM_IARGS is no longer used
Date: Thu, 29 Dec 2022 16:01:48 -0800
Message-Id: <20221230000221.2764875-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Unused since commit 7b7d8b2d9a ("tcg/tci: Use ffi for calls").

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 1 -
 tcg/tci/tcg-target.c.inc | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index bdfac83492..05a24163d3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
 #include "exec/cpu_ldst.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-ldst.h"
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f3d7441e06..c1acaa943e 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -197,10 +197,6 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R0,
 };
 
-#if MAX_OPC_PARAM_IARGS != 7
-# error Fix needed, number of supported input arguments changed!
-#endif
-
 /* No call arguments via registers.  All will be stored on the "stack". */
 static const int tcg_target_call_iarg_regs[] = { };
 
-- 
2.34.1


