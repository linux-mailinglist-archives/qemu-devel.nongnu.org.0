Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFDE42C678
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:33:32 +0200 (CEST)
Received: from localhost ([::1]:43250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mahC7-0000NW-R2
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mahAJ-0007lm-E7
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:31:39 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mahAD-0007Yc-TZ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:31:36 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so4864360pjb.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0EID8IaZWYCbeaJE1dQju4mohnDGKwlRu3Tz4p1ft5Q=;
 b=kNhpWs/VVgPEJF0z6s+m9T5hAF0AlmIiQOA2kc2UJ4VbvLkBZEgCmhXGF+oTgliM2/
 I2zp1W9/CvQ53tSX1+LiV12g0eDMJD9LIFWCIfAvEu2COLUtWBQN/Slw7aA2u/0SdhO7
 4vlQX0o1nCqF+jH81lBx2TyenUVdC7KEJuiSJOxwOa/sLgGqqn17BoPRqNxQfjCJIP+m
 fmRixDQGa6tAdhnMr5dbtOc51cVpoDWkdYJjKpnOAIj/L9YRt6YrKSC/2XLbcNybST0Z
 7m5gwkWh2gfOicgyvKO2eepn2Vt6yOtZhCqqdIE7YUtqHEECZdKBeZpMhwphdHo/1buD
 2iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0EID8IaZWYCbeaJE1dQju4mohnDGKwlRu3Tz4p1ft5Q=;
 b=dPJDypdo450lQ1ib3/E/bIpVbD2ZyDfOfGvWUNvl4w5wS96qCzhgttEeh31l6YrY0T
 WY8V+ThjjrRZWy/HVKH5JAzSIP8QVcKmqIlUsZZyg8oQJ+LPvWlLkxkzQHiX3fDJB7gc
 NOhvyi35Busoq0BPUyWnMM12D9tBKrAatV1eKhHI4hAf/7ImPXli7A2uf4vbRHaIdV06
 TemzPTR4YeqqL6tP+I1OEePU31vY78yPi2XBAS7ihC2prd3SgsNsryWxLCa8aGNcHQu2
 DC9tePns2dZ47JIYXXaEBrxHY3+dSFkGiB0OAAV0HaPQKN91w7VCPnq659r6Z+CCTImD
 1z4Q==
X-Gm-Message-State: AOAM530YlQ0vetm60a0QUI8fslwJ3RbP3vLamCwGgCt7sH3vDLfB8Dz6
 /VzcS0oQUXrdWWkHtnaFMpB4xyyQ0GvH0w==
X-Google-Smtp-Source: ABdhPJwiFVUEGCex0ZTmWcT0B7Pfq9klDky14zzquOGeR9AlroniW7m29DiNMCXJww7pOF41BnQfTw==
X-Received: by 2002:a17:90b:4f88:: with SMTP id
 qe8mr247913pjb.223.1634142691920; 
 Wed, 13 Oct 2021 09:31:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x17sm26084pfa.209.2021.10.13.09.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 09:31:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/vm/openbsd: Move timezone set to after disk setup
Date: Wed, 13 Oct 2021 09:31:29 -0700
Message-Id: <20211013163129.983810-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: brad@comstyle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the install gets stuck waiting for the timezone
when the installer is waiting on the disk.  Swap the two.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/vm/openbsd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index c4c78a80f1..cbb4006ef7 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -119,7 +119,6 @@ class OpenBSDVM(basevm.BaseVM):
         self.console_send("%s\n" % self._config["guest_pass"])
 
         self.console_wait_send("Allow root ssh login",    "yes\n")
-        self.console_wait_send("timezone",                "UTC\n")
         self.console_wait_send("root disk",               "\n")
         self.console_wait_send("(W)hole disk",            "\n")
         self.console_wait_send("(A)uto layout",           "\n")
@@ -130,6 +129,7 @@ class OpenBSDVM(basevm.BaseVM):
 
         self.print_step("Installation started now, this will take a while")
         self.console_wait_send("Location of sets",        "done\n")
+        self.console_wait_send("timezone",                "UTC\n")
 
         self.console_wait("successfully completed")
         self.print_step("Installation finished, rebooting")
-- 
2.17.1


