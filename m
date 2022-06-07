Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED70541E60
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:30:00 +0200 (CEST)
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhi3-00089G-MK
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5j-0007Gn-DP
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:23 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5h-0001O6-QG
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:19 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 129so16993761pgc.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DQgmHJOF15U5zzhYNDvf6Vx+wAM6Z86OsiDfINyn1f0=;
 b=mVZpV9NFDPTM1fBkVtLtX+rVnpBVZIOO2qO1JOxSAjFezXoHS3+D56flBpQwvDcABq
 4m57uM4S8FQTRFALwcHpUrWuusknLyalf6e3dqxwwdH+VwedyAEBNtyPmgIPOdl2ZjxR
 fmy5iaHNMvl083XVxS9FqZ7Gq/irz2lVvBgEGzNe23WzyoJDvvpwzdwhJTAEiKFzojZH
 CDHV8IDihrbhmyFRe4b1iMKUeWFqQ+apjrayjCYtBnrOi/S9SPqNtvvKAulASkP6DRdK
 OULy4WFNpQ5XJOWYrqJagn70Ii4hh92fO3n5UP+89Wajs0udFgwgKe3zR5wryZJe6hPT
 h72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DQgmHJOF15U5zzhYNDvf6Vx+wAM6Z86OsiDfINyn1f0=;
 b=FQ5KAt/cc7EEvF98yjY+9MruISwzW8qdTHV0kIsds/nj7dlWiku2azkIz8NrT/mKbk
 BNvffuSPLAgJ+H06WwssKtcRSeNjGhZVP9sEwN/2+Hy75TIFC+3v1nvVcqVAQag+myn+
 D9zCYvTgfysBJwgs3NGAdKNxuD+d9Qxf7jhFtLww+feAiyD2Il//2Ek8hLbuqkhUpx+K
 5RnwV8IOvJjgWOWijH6Ypcb3cJ2Nxtlr32WVrGLRcxLjG64N3dQtDz/J3Z9hiwEdkDqB
 /8ZtiCf9MsyOCu+Vi9jFQlQQEpWB2ohycSVm+qSb3/XwX+GmrppPaaQIfTfUe6NLOyxU
 DXrQ==
X-Gm-Message-State: AOAM533K1nh1ucI2C4GceVfvHZiiUjd7OjxTJjOWHoMJcHnVCfvPmNt6
 wje0H/haRUhjrDmyjtSRQbBu3qR63sQUfA==
X-Google-Smtp-Source: ABdhPJzdh1eresUF3oXfwB6MxnLbx1v+Ulvso1HB8/NHnB9DmOMFlEOM4uYXPwJjIoN9919g3CppPQ==
X-Received: by 2002:a05:6a00:1502:b0:51c:2991:f1c with SMTP id
 q2-20020a056a00150200b0051c29910f1cmr9128470pfu.37.1654634776065; 
 Tue, 07 Jun 2022 13:46:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/53] gdbstub: Convert GDB error numbers to host error
 numbers
Date: Tue,  7 Jun 2022 13:45:23 -0700
Message-Id: <20220607204557.658541-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the callback with consistent state -- always use
host error numbers.  The individual callback can then
decide if the errno requires conversion for the guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index a3ff8702ce..ecc9d9cd6f 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1878,6 +1878,37 @@ static void handle_file_io(GArray *params, void *user_ctx)
         } else {
             err = 0;
         }
+
+        /* Convert GDB error numbers back to host error numbers. */
+#define E(X)  case GDB_E##X: err = E##X; break
+        switch (err) {
+        case 0:
+            break;
+        E(PERM);
+        E(NOENT);
+        E(INTR);
+        E(BADF);
+        E(ACCES);
+        E(FAULT);
+        E(BUSY);
+        E(EXIST);
+        E(NODEV);
+        E(NOTDIR);
+        E(ISDIR);
+        E(INVAL);
+        E(NFILE);
+        E(MFILE);
+        E(FBIG);
+        E(NOSPC);
+        E(SPIPE);
+        E(ROFS);
+        E(NAMETOOLONG);
+        default:
+            err = EINVAL;
+            break;
+        }
+#undef E
+
         gdbserver_state.current_syscall_cb(gdbserver_state.c_cpu, ret, err);
         gdbserver_state.current_syscall_cb = NULL;
     }
-- 
2.34.1


