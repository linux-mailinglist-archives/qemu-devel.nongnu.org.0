Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C66731161D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 23:58:52 +0100 (CET)
Received: from localhost ([::1]:43532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8A3v-00039G-L7
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 17:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A29-0001E4-1O
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:01 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A27-00039f-HK
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:00 -0500
Received: by mail-pg1-x52d.google.com with SMTP id r38so5545180pgk.13
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SCva1h2dUQRt32RzqDb0V6uTgNEuULtJ+A8f47HZjL4=;
 b=htVF+EluHKDgvxHML7/wiWXYAPWb+lePSiMT/4EL3lMCaRy1SsEEiOBJKWfrivGYKj
 sKVDkeePBM69ZLEeKL7xn5xDHZoAhQPnSjj4np1LzrPmzRu2nYiqPQK5t3rVVzGHSl4J
 BUnJEoGPXUq3bj45YB6zsLZgdy69dDKwn+SFDzGBQJDe7qRuKKK1OhdBjE6C6G5uW5kQ
 zVzW8KmV+keN8DG1eoi5E3Os3iQhb2lr53jwK2VM04P1qAg8SK+WRfGhMRNJ8sU6btyb
 hrGAaSQjzTrNvK6OVRrf2MSDd7W1eVsb/8VQzuLLc7Kmr1vkuB5qYJTNoPGrtdyq6pW7
 Ki/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SCva1h2dUQRt32RzqDb0V6uTgNEuULtJ+A8f47HZjL4=;
 b=NVecQ2HBYi41JKpKGjor6RprhCl2sUd8aDJVBbG2HsuhPN5nNYhqCeFo7xXDTaOnnG
 9GD57gkobon0chf3uOfH0cuKnMHrElDYfcUuqMmfq+O8LSWElSoDGYRDQz+KeE4RmORY
 MAuNdHqQFCk9+wg8sJXOl+jk29x22AkK0+ntZR3ATDDfptUGqiBISB/ikWwPDtkEk7Wm
 +oY+mCbuQlPnVhYG7Y/wjRR7QS1cQrw69unmAfFNh03jPTZxZkj0ZbqNRwEikpq3vAbH
 72YyBUBoHiZd+l+5NbGs2812nRfc5j8nN9Q982BT9hDeVzSZ7ri+pe/cifk5FF1Sa/Uo
 UMew==
X-Gm-Message-State: AOAM532ZmLeZFk9ZjjtFEH+tDE6karJF0nzD7whcs4Y0Y47cRanlWYbX
 oYpYlq3AuhpZm/naKm1Slg8QKkYlLbb4eRrj
X-Google-Smtp-Source: ABdhPJwzKDuxH8jYzHTMsKfq5Mo6LEHs2k2VjoQfSOgehsfuAANKo8U/Zy1EgRwMmNWgCRNlZn0mOA==
X-Received: by 2002:a65:5903:: with SMTP id f3mr6810295pgu.28.1612565818122;
 Fri, 05 Feb 2021 14:56:58 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:56:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/46] exec/cpu-defs: Remove TCG backends dependency
Date: Fri,  5 Feb 2021 12:56:06 -1000
Message-Id: <20210205225650.1330794-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

"exec/cpu-defs.h" contains generic CPU definitions for the
TCG frontends (mostly related to TLB). TCG backends definitions
aren't relevant here.

See tcg/README description:

  4) Backend

  tcg-target.h contains the target specific definitions. tcg-target.c.inc
  contains the target specific code; it is #included by tcg/tcg.c, rather
  than being a standalone C file.

So far only "tcg/tcg.h" requires these headers.

Remove the "target-tcg.h" header dependency on TCG frontends, so we
don't have to rebuild all frontends when hacking a single backend.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210204191423.1754158-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index d1f5e3fc3d..ba3cd32a1e 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -25,9 +25,6 @@
 
 #include "qemu/host-utils.h"
 #include "qemu/thread.h"
-#ifdef CONFIG_TCG
-#include "tcg-target.h"
-#endif
 #ifndef CONFIG_USER_ONLY
 #include "exec/hwaddr.h"
 #endif
-- 
2.25.1


