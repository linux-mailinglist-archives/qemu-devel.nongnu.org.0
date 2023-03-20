Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBDC6C0E59
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCTe-0003nx-8t; Mon, 20 Mar 2023 06:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTT-0003kw-96
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:44 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTQ-0000D3-Om
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id p34so2049132wms.3
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679307039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnmBMm+SXTgqFEy4wlEqxWB8R7Mqnlhesphm0Wpbwgg=;
 b=oyBmGFF+xugS7ftyi/KFnkKOcysVlSnu4KRkaquSDvel/72SNe7x3t/wE8CquhCYOs
 trSzOoV7EqYmlNWycEWCgXK5UnyN7GIKVvNj0Vp3dJjRgfk0aGQiMfO3e4rYRfoQusnZ
 KvLZu1BDQ+do+VbWT5WRwI/1djqBpFSxPov19tS/fYualtzOxVHI5qtmHchu1CEWsY9N
 /KZyVGaDz7pXdclqwBvtYNRAQ6LeXeUwdEqCGMF1D1cSokvRwlSfiwi/BXsHwcXIRin7
 EDy2JoV+FZyL/5UxdfQaY2aGkepsEOd8t7bGO9V3CWhqs2RyNY6/NCZuBIv/EN0th6aJ
 SGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FnmBMm+SXTgqFEy4wlEqxWB8R7Mqnlhesphm0Wpbwgg=;
 b=3XMlHunXilWAYl14DNYImCCEzLa7YEFrZa2+6+PROTKdi/WjRzgoj1JCgKVJMWhFCf
 I081IP5zzGYSqBW+qw/Db5iR9vgNVje1Ko25Vr19n9TtRS6NZEjAYPWdYKNRrlv5Tj+o
 KoTqSAHSnbkSbo49z9X9EWepBtSkt5ljYGpT6h0NefK0uapA/tsdUxW/wTpO+VrednlJ
 5A7SC+opLGOwv8klb7FxCJpO606+KdwZb1I7yTwzJn0vTh1RZpD5gynUcYwA8eqacuID
 7KdnHhboqjGFOdD+1es180wyN1o1LQELatYlQom39UZPv7piT977l8+soXmkeWPeUVmg
 F0cA==
X-Gm-Message-State: AO0yUKX0WxnqZyOBAbJ3RkNjYJ/7gz59nIPxSkZaESWH1EluyMwkxv0O
 aBD7zoMgW+LWclgsMmBA7+MtOjrG/EtMIYO8So0=
X-Google-Smtp-Source: AK7set8mAwFb45Zy/LQPaBFCDThpf9v7PiUiZavkP5cFfSmcq8G/Wb5sSHwDucrUayfceOPIMmqOgA==
X-Received: by 2002:a05:600c:25d1:b0:3ed:316d:668d with SMTP id
 17-20020a05600c25d100b003ed316d668dmr17494283wml.5.1679307039306; 
 Mon, 20 Mar 2023 03:10:39 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a1c541a000000b003ed246f76a2sm16364380wmb.1.2023.03.20.03.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:10:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD5641FFB8;
 Mon, 20 Mar 2023 10:10:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 10/10] accel/tcg: remove unused includes
Date: Mon, 20 Mar 2023 10:10:35 +0000
Message-Id: <20230320101035.2214196-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320101035.2214196-1-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 56be7956e7..90e327c3bb 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -19,20 +19,16 @@
 
 #include "qemu/osdep.h"
 #include "qemu/qemu-print.h"
-#include "qapi/error.h"
-#include "qapi/type-helpers.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "hw/core/sysemu-cpu-ops.h"
 #include "trace.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/atomic.h"
 #include "qemu/rcu.h"
 #include "exec/log.h"
 #include "qemu/main-loop.h"
 #include "sysemu/cpus.h"
-#include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "exec/replay-core.h"
 #include "sysemu/tcg.h"
-- 
2.39.2


