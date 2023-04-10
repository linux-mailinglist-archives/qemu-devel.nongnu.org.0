Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C493F6DC89B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 17:35:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pltXm-0000bp-Fu; Mon, 10 Apr 2023 11:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pltXj-0000Xr-7W
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:34:55 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pltXh-0000nf-HU
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:34:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id q2so9832865pll.7
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 08:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681140892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBl5GODmqunu8RhMyVnek3iPrET/1omof3j02qUp0Cw=;
 b=NmMmV9wr+UoyWtllFJOOoYCEeNv9SAP+ygvNMlQXKIIUNneqCsR9j4HXlg5N1Egmn/
 ldGOSgdb8e2vsFZg9N/TZvKazNqXHHYGg25DRbBnGt9mO8SAsR1CY5sjv6eX9r8aKQ/H
 JKzhsapjs3TiW5hkCHFcE8P94SnRhTqF9kj8VxnmzOcoJvj+JUGd67Mi+oBsoSlW3AZ8
 B7Hq8oCHp/LfkGiOfCuOx/qRWowDoGFQfLnbyWzPzs1Ibnypdnp9d/gX9fWoB34y5Yu/
 W7Mczya6vb4rWVtWMR+LSMrBpu/QOOkR88IAEnPpT0urRnTqPuuEt4S0x8CHXlUjel/e
 NYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681140892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBl5GODmqunu8RhMyVnek3iPrET/1omof3j02qUp0Cw=;
 b=Mn1hhdJ5HNcPhdxCFLeF/cEtgIdtamNIbcOgU56lRVC5TegZhTiUncfsbk9uRJhCDR
 1fmY9YFnFiMtGzPUx2D7q4k6hhv5WePEhAi+zhHuf2sVR0F60pOFfOJR5gkRjTlPOSP1
 GyNQXMbs0/c1XqX6QDaIBNJXqsA8RqaDd3lKuGw6jueK9nG7XM2xp73ZAWhEP/vcGmZ1
 VRgqoVvCicqFeuPUAtR5Es2YAQL8tTDD2IYhibc9iX4IutcCCv+hoo/dC/PidCpt9BjA
 uwYzcDVejFsC0QhDOfI0ApkRBumOJsMD/RbFCqJhBr75/7mlxedgfPFKPBIBY2dGNPMQ
 QwMA==
X-Gm-Message-State: AAQBX9eMwrtwxPugWcGk2h6T3hEh9/n1eBzLtyiynqjcAA1uhyo2Cmvh
 4nonUgcrYMRC+HiCl+Porju6GDXOAZ4V8K1vVCc=
X-Google-Smtp-Source: AKy350bvQx22D0phDnUNcfksSQTOR0xfXLg6nEa6zhV+oxHIGC3t6ladeKcS8KtFHQ/bOvjXPBwclQ==
X-Received: by 2002:a17:902:fb07:b0:1a5:ac0e:a4ea with SMTP id
 le7-20020a170902fb0700b001a5ac0ea4eamr5348007plb.29.1681140892246; 
 Mon, 10 Apr 2023 08:34:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:2e6b:e4d3:9526:71d6])
 by smtp.gmail.com with ESMTPSA id
 jj6-20020a170903048600b001a64e854553sm534402plb.159.2023.04.10.08.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 08:34:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 3/3] tcg/ppc: Fix TCG_TARGET_CALL_{ARG,RET}_I128 for ppc32
Date: Mon, 10 Apr 2023 08:34:48 -0700
Message-Id: <20230410153448.787498-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410153448.787498-1-richard.henderson@linaro.org>
References: <20230410153448.787498-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

For both _CALL_SYSV and _CALL_DARWIN, return is by reference,
not in 4 integer registers.  For _CALL_SYSV, argument is also
by reference.

This error resulted in

    $ ./qemu-system-i386 -nographic
    qemu-system-i386: tcg/ppc/tcg-target.c.inc:185: \
        tcg_target_call_oarg_reg: Assertion `slot >= 0 && slot <= 1' failed.

Fixes: 5427a9a7604 ("tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128")
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index afadf9a1e3..066b49224a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -46,17 +46,18 @@
 
 #if TCG_TARGET_REG_BITS == 64
 # define TCG_TARGET_CALL_ARG_I32   TCG_CALL_ARG_EXTEND
+# define TCG_TARGET_CALL_RET_I128  TCG_CALL_RET_NORMAL
 #else
 # define TCG_TARGET_CALL_ARG_I32   TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_RET_I128  TCG_CALL_RET_BY_REF
 #endif
 #ifdef _CALL_SYSV
 # define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_EVEN
+# define TCG_TARGET_CALL_ARG_I128  TCG_CALL_ARG_BY_REF
 #else
 # define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_ARG_I128  TCG_CALL_ARG_NORMAL
 #endif
-/* Note sysv arg alignment applies only to 2-word types, not more. */
-#define TCG_TARGET_CALL_ARG_I128   TCG_CALL_ARG_NORMAL
-#define TCG_TARGET_CALL_RET_I128   TCG_CALL_RET_NORMAL
 
 /* For some memory operations, we need a scratch that isn't R0.  For the AIX
    calling convention, we can re-use the TOC register since we'll be reloading
-- 
2.34.1


