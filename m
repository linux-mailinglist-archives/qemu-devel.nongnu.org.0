Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ED830FBFF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:53:30 +0100 (CET)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jku-0006EO-ML
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7iyc-00048P-Us
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:03:40 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:32868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7iyb-0007kG-HA
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:03:34 -0500
Received: by mail-ej1-x634.google.com with SMTP id sa23so7029993ejb.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 10:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Zt8LLsY/fZ2QnxXToXtfgew9lhBwjfUHXrvWw/scB0=;
 b=PXlZaYGQtonDX6eZFnsiD7qn3a8IsOnPL1O3OFy+tHm1wUN8I70UG8Jz4Ks2bgWINl
 wmUEFFmRF/1qTDDn37TbgqnksjUSIcT9y83Vacn/mr+pffuWevVnMS50jnEybT6MQCMN
 3qrYykOIv2qyjwSLU2/WJxBhk6Q6zaX+1uLC0xoNyNUQKM1QrkBrBigcmTpOyJ9KCMIP
 PFfZUAsos4M//3fAJQPj4UO1b2DUhaJbzW4t2lbPdFTB8kXH8tE/I2d+Wt1T1rozE5v0
 NIAdcySCcdDEXKT0599ucVVJq8ANZNsn3YdVPwgshH3ywboAiNqlAEWZxzK2YXk68zAE
 njgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6Zt8LLsY/fZ2QnxXToXtfgew9lhBwjfUHXrvWw/scB0=;
 b=s7TN8dJwBAe3GQP0aYtOd1FFgZ6yL+2flF1F/rwH4+4KKJEm+8668kUEQgC2dw8KjZ
 BUbiYO2mA1UtFODBOTkccC5QSd99b73VPjiJzEHKUqLEhIIzgfwRl9bPHoPNMfN2V9FI
 v3440mzL9SJhPERmkxWyxFAoTTY4+WS5PEec02C0/lMR0eoMFI8kT9qYkIOerxx8870z
 S3uM1VrzGqQTPJLQ1uQAiVp9E+RqDFCGfYUrf9emjG12+oGbcqq/NI4MqGHYt4QOwGrW
 IejvupilKzvEnHl/XAgbbR60MXt+g8zPaBQNZ08jzXgNRegciOqLf/J3ZuIy7Di6wS2U
 AikQ==
X-Gm-Message-State: AOAM530Mx0hfjwpkrx7mbJqnMnzsFQ+N309p0YBmEm6ebrdqgiMZyVRi
 5qD6DQ4DxxBkvKeyzwkorzLTrD0ipyk=
X-Google-Smtp-Source: ABdhPJx6uzouM5bTstVsopU9zgMPj/xEOH7MI5+oCCKMCIdNiFCn+hlTuTf/X+4ydnyrC7WExPtHxA==
X-Received: by 2002:a17:906:3899:: with SMTP id
 q25mr289632ejd.173.1612461811215; 
 Thu, 04 Feb 2021 10:03:31 -0800 (PST)
Received: from x1w.redhat.com (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id x20sm2759454ejv.66.2021.02.04.10.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 10:03:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] exec/cpu-defs: Remove TCG backends dependency
Date: Thu,  4 Feb 2021 19:03:28 +0100
Message-Id: <20210204180328.1735105-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
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

"exec/cpu-defs.h" contains common CPU definitions for
accelerators, which is not related to the TCG backends.
See tcg/README description:

  4) Backend

  tcg-target.h contains the target specific definitions. tcg-target.c.inc
  contains the target specific code; it is #included by tcg/tcg.c, rather
  than being a standalone C file.

So far only "tcg/tcg.h" requires these headers.

Remove the "target-tcg.h" header dependency on accelerators.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


