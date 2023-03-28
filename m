Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BF86CCDC1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 00:59:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGo-0006vu-Hw; Tue, 28 Mar 2023 18:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGm-0006v3-AW
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:24 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGk-00075Z-RM
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:24 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 p3-20020a17090a74c300b0023f69bc7a68so14235620pjl.4
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xB7EoPcPuhHBkTYLQAr4hW1zXQR4T+cKsdLP9y+p2a0=;
 b=oWDGFSszQisVfdhFMzNUMkDj2u1kDJ9tMfx0hN03Dacp9B2mMhCq+1uIWzfc3B1ZGi
 3POdcmqXnexcB0hDnmnxeyPWAu2Pa0WRRAJJK0gK8VJ4g1KMOKdM9mNPryttHAsf5F5M
 AqePjI0dSECvkBGaWlO0KjmawN3ZYTQs4WxhIYGJZ0wXN8RpT4+sSL2aIVP3wMJrs8Lc
 JJ18TyWs+cgKzdafoUHozwuPVTWoKF80hZpUTt41mWOEYrjuaG2mF80+bsxatAVpLqpL
 D+/PUT8yhKEYwcK6T4xy7mLi1PdfiI64rn3uFPy/RgzvnoBxWDZZoMp5YoX8bZsGtr2W
 B2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xB7EoPcPuhHBkTYLQAr4hW1zXQR4T+cKsdLP9y+p2a0=;
 b=8G9bdWYxWvQtZjm4sCp+R+IZbBrifgd9a0gZCadGQSuYRcWQnssSHdJfeSLY74VamX
 1XjrC/4Q0tb3sLSyVgiJYZqgOa2hDdCCAQs8URxNfdQbDh6pHcppvM3FF3Qk+wSfT1oB
 2DXKvq8FgW/wCOdoAqdUy/aVDBGjpvWdrfCcUYdH9oueyDZC+y12Y5aIK+4we6cl2Tnl
 4oU11r/Pc+IfvlR+tSlC37nczBm6UxbuBI5YXpUV5Cd8aqm/mwWolus1Kos5EWiGi+No
 c+xIfmK9cckuLo4WZbpFDwkRhHAz95/gT+fH/61DX5V2eW5bNv24+x++H+cHkj6OpPX2
 /6fA==
X-Gm-Message-State: AAQBX9crLl+KXJVuBDp7J/Iw3iZkO3aZCN/QampO+5XPA2tig3Dy9Zqd
 9mP+t0VcM1MvRY2P9AgcjwUwMo+reA8/LL+fJOo=
X-Google-Smtp-Source: AKy350bwBs9Tuq4Ks3ex1z2+yV/RZ5JH61bu0v/gmDV3xTgjHH0/qA6ImnJlEgze1o0/rtZjVQvuUg==
X-Received: by 2002:a17:902:ecc4:b0:19a:9880:175f with SMTP id
 a4-20020a170902ecc400b0019a9880175fmr18666014plh.51.1680044301003; 
 Tue, 28 Mar 2023 15:58:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 14/15] softmmu/watchpoint: Add missing 'qemu/error-report.h'
 include
Date: Tue, 28 Mar 2023 15:58:05 -0700
Message-Id: <20230328225806.2278728-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

cpu_watchpoint_insert() calls error_report() which is declared
in "qemu/error-report.h". When moving this code in commit 2609ec2868
("softmmu: Extract watchpoint API from physmem.c") we neglected to
include this header. This works so far because it is indirectly
included by TCG headers -> "qemu/plugin.h" -> "qemu/error-report.h".

Currently cpu_watchpoint_insert() is only built with the TCG
accelerator. When building it with other ones (or without TCG)
we get:

  softmmu/watchpoint.c:38:9: error: implicit declaration of function 'error_report' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
        error_report("tried to set invalid watchpoint at %"
        ^

Include "qemu/error-report.h" in order to fix this for non-TCG
builds.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230328173117.15226-3-philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/watchpoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/watchpoint.c b/softmmu/watchpoint.c
index ad58736787..9d6ae68499 100644
--- a/softmmu/watchpoint.c
+++ b/softmmu/watchpoint.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include "qemu/error-report.h"
 #include "exec/exec-all.h"
 #include "exec/translate-all.h"
 #include "sysemu/tcg.h"
-- 
2.34.1


