Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB4E63FFE9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:43:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymk-0002iL-Bw; Fri, 02 Dec 2022 00:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymi-0002i3-Un
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:29 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymh-0003OS-CZ
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:28 -0500
Received: by mail-pg1-x536.google.com with SMTP id 82so3593727pgc.0
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8QfQ1uDgH78xLrd7SQL4h0WAoUU3UOZ3RoOlmiv5EM=;
 b=av0j1aK1fUyYJRCuA+C1NQ/GO5LG8mfdUWshaIkF0jX7s5Jvl0z8rRk17T/Xsc5/Zg
 tBKN/KqKJFpyuQu2zEQcSg5bwCCXASQoZ3VxoftnzpoYCgDNxFNeVkmvzVu49p/TwVQO
 xLhTGcU3B+ZzilaMk1aoOWHWZhqfAMl3Yf76zl2E3u0ZriTqrjVTV1lEHmiwEY2PFSmP
 yqiDU863ZiHIdfpFSNkQmv8Ok3N7ml8eQ9NMotcy9hSN6NEKQvm1d+j+fZHHXmS1MFGy
 cLwl03FDRSNfBudI58TvpeHGrndEf4BcVhgkyt3eABi4WrI13mNK14F2uT0wRVo/CinV
 NnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8QfQ1uDgH78xLrd7SQL4h0WAoUU3UOZ3RoOlmiv5EM=;
 b=njV3aPvU7JM+D6DchjO9hfnlB71iHQ4/Eh4sZ+kJe9Bg/tc8cwqIgGvIjsx7JZ/J5D
 2pJ3EfgFXvokKS1349TxGWSC4JlphuVCi5WOEVp+54+GOWb1YXFMbjW/6iFhW8L4ckdk
 Pi92WKD4tbliThPMuAVgstOqqztDAY472RpTUaDx2dyPyTnY1mNttCk1fcg7A2SqqIKH
 j2MMXA/WoTwRK6ZqxFGyWWSr9BNp3YlgYCB+nWIDJwbto82U05hJgGUOYrmAE05Tnr3e
 zMbL9UjNmcmvLpLP/C8yVQPdRknt7XBx+gr38IBTtRtiyNW9Xw0AVHk07FVYT4L/wv9W
 vR8A==
X-Gm-Message-State: ANoB5pmkYRBBb5G3cmlUVaj9oW1FGc3v9U/fvRnAKs9SF6pXfIKMvRSA
 MiHNVmA+qjLNS3uO+TSf4j62M1jTRXAl7qJk
X-Google-Smtp-Source: AA0mqf6Xvfzddc8+awRBWpUCH6IMErRn2SzuGJnXc6stc5G3UT/dDYUo0au2kW+tFWQXCJtEK5YSTA==
X-Received: by 2002:a63:f406:0:b0:44b:89b6:3026 with SMTP id
 g6-20020a63f406000000b0044b89b63026mr45920003pgi.115.1669959626029; 
 Thu, 01 Dec 2022 21:40:26 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 26/34] tci: MAX_OPC_PARAM_IARGS is no longer used
Date: Thu,  1 Dec 2022 21:39:50 -0800
Message-Id: <20221202053958.223890-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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


