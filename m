Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A3F36AAF2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:05:11 +0200 (CEST)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larYb-0003Oc-12
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNk-0007xd-QC
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:57 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNa-0007Zt-7y
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:56 -0400
Received: by mail-pf1-x42b.google.com with SMTP id c3so19200388pfo.3
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r4MugmCP+rYN14B2Da3yFyexQDs8Hm4TBDvsge9u5iA=;
 b=FIUYtMovEa3pVvJCv5POsIdxZbt6Rt1cI6T6wphqSkqfocmeBc1yBe5lwp9f0oEwx2
 LumYrcnSdiRe+rXAPpoaA101XBRYB+L9XPLnHYPloXVrSiXCvOXiQHq7DXl8NkQ4MfoS
 kL8RJkte6je8c4UXbf+DlfpxVPbzlmY81IX3rLonIkrY15j70J5Xpy34mNSmVKkwCTID
 RPAEwwgMFCLpDJ6BSDUIl/V9WrE5nv4RmILs/0hY2YiEoq9D/JmUYTdOepKFru1SqL9w
 TuzQo5ix3PNpEdCu+MJGzyIb1yok53Go1TdR5TBMVbOWYMHH6mAV8lODq1S8jZP0se1U
 8rkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r4MugmCP+rYN14B2Da3yFyexQDs8Hm4TBDvsge9u5iA=;
 b=G+maOBdOfT8BGxlSy1rPp5NQZcRJ7xt7wjE3vwPT02KEphOnRIH9hcs0sX9/Q7rhgR
 UZvq7aoKaILqpwgP+KQQdTW4Iq3U/iJh/AC0QsJq/owVovn+9DIP2KIY8xxteeqW1gR5
 pNwCaYckk4UQmLQwWPcTFydvnN0jtGfFjQtW2BBGNxbrbNgPXdyHaJpYkPL0zjKgIfmp
 8UNeDCTbHYtAYNIbcO7mc+kxFJsQ5NcIwTgf6Ok5w+SLve67dTlszK8heFRbJaW3WWEV
 QvgJoyK4jU3fyoY++tdT1p2ruiGSRyygjGH8hAvJyFiLG2R7Ec168KRGV8B+ATpzrpvc
 auuQ==
X-Gm-Message-State: AOAM53351iNUXpMEYv0/3Je2cLLu8c33lm66j8qLkDaE/fQT2DMaVGAZ
 dDWNCnkH4TJLuY7k4fmjy29SXmB9GL7Fdw==
X-Google-Smtp-Source: ABdhPJzEZTWxftB+U8Fp7lYOpIbg/TIoxFn+YWNlu0KXI+xiqjJva4TcMfwF7HYR7bVwgzF+0ehwaw==
X-Received: by 2002:a63:3c2:: with SMTP id 185mr14846041pgd.26.1619405624527; 
 Sun, 25 Apr 2021 19:53:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/25] linux-user/sparc: Remove target_sigcontext as unused
Date: Sun, 25 Apr 2021 19:53:21 -0700
Message-Id: <20210426025334.1168495-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/signal.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 76579093a8..3d068e0955 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -21,34 +21,6 @@
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
-#define __SUNOS_MAXWIN   31
-
-/* This is what SunOS does, so shall I. */
-struct target_sigcontext {
-    abi_ulong sigc_onstack;      /* state to restore */
-
-    abi_ulong sigc_mask;         /* sigmask to restore */
-    abi_ulong sigc_sp;           /* stack pointer */
-    abi_ulong sigc_pc;           /* program counter */
-    abi_ulong sigc_npc;          /* next program counter */
-    abi_ulong sigc_psr;          /* for condition codes etc */
-    abi_ulong sigc_g1;           /* User uses these two registers */
-    abi_ulong sigc_o0;           /* within the trampoline code. */
-
-    /* Now comes information regarding the users window set
-         * at the time of the signal.
-         */
-    abi_ulong sigc_oswins;       /* outstanding windows */
-
-    /* stack ptrs for each regwin buf */
-    char *sigc_spbuf[__SUNOS_MAXWIN];
-
-    /* Windows to restore after signal */
-    struct {
-        abi_ulong locals[8];
-        abi_ulong ins[8];
-    } sigc_wbuf[__SUNOS_MAXWIN];
-};
 /* A Sparc stack frame */
 struct sparc_stackf {
     abi_ulong locals[8];
-- 
2.25.1


