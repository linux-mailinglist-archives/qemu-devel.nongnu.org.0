Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D64CC30FCD8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:33:28 +0100 (CET)
Received: from localhost ([::1]:35004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kNb-0003Qz-VR
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7k5E-0000Fj-Q3
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:14:28 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7k5D-000429-Bg
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:14:28 -0500
Received: by mail-ej1-x632.google.com with SMTP id p20so7368164ejb.6
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 11:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tzD0bWLvrJuHdSAU0iemw994PzFpgeqZwEOcF0GHL5o=;
 b=pvwlCWxAlTfZDar4wBmSkVxwUBP+kn7k7SRKcKwjkOcWEft3w2tBqgm89KqbrdKEo2
 fN58cQ+ufKehGrV/aVZ+G77Egzq0V8zzOjgQIuFc/9V7WnpNrYrXpjWwB5X0Q7PG/8Ji
 WeSGNMZFRN91NlAVgxQ1jTemkNB96VbLUNsvMfknqqMYkA29Yj/S6iODbCgQhRLrqtTj
 zwh4SLZBo2s3K/CwgMcTxAteUx8EeRuIsekv8Hq87uZeH+Rxe67y2EK2V0DHoFcMIjFF
 7pZdTqNcyodtTqIFwCF+52CckR5ODD3GTl3gv+GJcpZzwyTY4/bYe97E/Hr0d7gEJ4/l
 9qDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tzD0bWLvrJuHdSAU0iemw994PzFpgeqZwEOcF0GHL5o=;
 b=GBaVKCnYvfgJEk6UI2rdATlghnlM7kQ2k8OL3HoqAac0bJxzvXJub7H+4rMp/J+l/q
 pYH385KphENMFcfUhe2hqQCDdiO75GbkSgZLPrb1hdLhJv3JNXcwNvFF0gy3K+OK+j0a
 8TifhNIds5mroDIstsYwhKl2HZ/HLjdpkvpryAz3AP2P3p4RI4lNrg2GI1Kbbe29IKUN
 I7qqKMfa4yELC3tUAha+mnlxshZYWILVelxCjjImdNAf9YeO8NBgDR+eQuNcbazAxQvW
 7gWjjBCpuEGzLZb076ILF0tdeZllyAufQ0i9F1yn12wYPXgWPqCyNypgMVFhgxs7eqWX
 4KNA==
X-Gm-Message-State: AOAM5303lFOtP/IwJjCwPmb7ZRXxaVFPHAoECUz7PGHiVg/KJk9QA5U1
 DOHj2ggAueiKV4zWN/4mAoMsR9sUinw=
X-Google-Smtp-Source: ABdhPJygc0P7pZQGT47UOPjnBF0W1Y4nJX6ZmM4xDIiYw10oEeZQibLGxsoPBkgp/HTUvCyKEuVkIQ==
X-Received: by 2002:a17:907:7605:: with SMTP id
 jx5mr595313ejc.340.1612466065519; 
 Thu, 04 Feb 2021 11:14:25 -0800 (PST)
Received: from x1w.redhat.com (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id e19sm2964363eds.79.2021.02.04.11.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 11:14:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] exec/cpu-defs: Remove TCG backends dependency
Date: Thu,  4 Feb 2021 20:14:23 +0100
Message-Id: <20210204191423.1754158-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
v2: Reword description (bonzini)
---
 include/exec/cpu-defs.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index d1f5e3fc3d8..ba3cd32a1ec 100644
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
2.26.2


