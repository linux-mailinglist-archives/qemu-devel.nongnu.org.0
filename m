Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1D86FE19D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:34:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwloE-0007DL-0j; Wed, 10 May 2023 11:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pwlo7-0007Ap-8a
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:32:47 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pwlnw-0000Tz-Tl
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:32:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f4249b7badso38276535e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683732755; x=1686324755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csrTYP46uv8wz6vyHOZQLXOhfuaiNnRYRLiW7uRVmzE=;
 b=azReCyQo9AgaGA3ibfYJryDdwquXFqJwPZwK0X3Dm7urN26R+XZbpLATyGxBarPO+i
 k7ftL5jcOPnE7EKvuFlaLv2TD9/5/IvTkpkhFHkWLAB+8ukQkPkuaPRVC9rXpC3f6KrO
 Fs1NSosBcw3/1CEtTRe1+NDu2yBY4Q07/EDs7VQTvFGBCsnFmZWenqSSfIVxmgnlvpe8
 ihlMC3tonynFOnUaDURRitZcA5QkJlhKX5jRlFaj5bPqXiPU1t06cTBaAP/HHlSvmKMa
 ybA1xkRQPPjGPmS8KoOAvx96aiiEL33i+KsqOGr3BN3PUckYiorJFkOPs48TVNeVDmV8
 xMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683732755; x=1686324755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=csrTYP46uv8wz6vyHOZQLXOhfuaiNnRYRLiW7uRVmzE=;
 b=MWItqutlRoKSFZIqce0B5FwTGRxMXfAZYZxeZvIvkpiiK184qGM+31HIpo78G1ec4J
 qRH+sysajrJEIWi4yK/viEGIaFJ5OCgSlDeHfkeYyTTX7QERZvwzu5RFWZjrOa1y5iZN
 m1v4Q4RPAVEM4OGMA8ZYXn8EbfT8dfYwa0D4u4QN3bztJwXNmhSO+p/Z6pKyNkRrjswN
 idQI+YF4Lgwf110tKUyyYQzHSFhgptAhuUbi12ZfPLu0P2AothxiApNjcFMW97COm6m3
 h8kLoJdxuKWdtO7FZ5Zsh6N8rUpPxw/x6NIiVLxqOHlezMxutAKz2jDc3aAGAtyZrmep
 7ESA==
X-Gm-Message-State: AC+VfDzphamUUhyKlTgqU2AejQiq4WD5ld/4JLqUFKKAnGa1wDdsgcQs
 ZzcxHcSfDNZgtx2PuMK7T+o0yMzBg7s=
X-Google-Smtp-Source: ACHHUZ4d8w3jwX0NwLaCbLZ+ubxAXF2N260dZROoXaUG1NICx/cqcEC0cnoWdEno8KdyavlNhKXpzQ==
X-Received: by 2002:a7b:c5d2:0:b0:3f3:2b37:dd34 with SMTP id
 n18-20020a7bc5d2000000b003f32b37dd34mr11817929wmk.9.1683732754947; 
 Wed, 10 May 2023 08:32:34 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 z17-20020a1c4c11000000b003ee20b4b2dasm22951062wmf.46.2023.05.10.08.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:32:34 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2 2/3] target/openrisc: Set PC to cpu state on FPU exception
Date: Wed, 10 May 2023 16:32:27 +0100
Message-Id: <20230510153228.264954-3-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230510153228.264954-1-shorne@gmail.com>
References: <20230510153228.264954-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Store the PC to ensure the correct value can be read in the exception
handler.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v1:
 - Use function do_fpe (similar to do_range) to raise exception.

 target/openrisc/fpu_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/openrisc/fpu_helper.c b/target/openrisc/fpu_helper.c
index f9e34fa2cc..8b81d2f62f 100644
--- a/target/openrisc/fpu_helper.c
+++ b/target/openrisc/fpu_helper.c
@@ -20,8 +20,8 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "exec/exec-all.h"
 #include "exec/helper-proto.h"
-#include "exception.h"
 #include "fpu/softfloat.h"
 
 static int ieee_ex_to_openrisc(int fexcp)
@@ -45,6 +45,15 @@ static int ieee_ex_to_openrisc(int fexcp)
     return ret;
 }
 
+static G_NORETURN
+void do_fpe(CPUOpenRISCState *env, uintptr_t pc)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = EXCP_FPE;
+    cpu_loop_exit_restore(cs, pc);
+}
+
 void HELPER(update_fpcsr)(CPUOpenRISCState *env)
 {
     int tmp = get_float_exception_flags(&env->fp_status);
@@ -55,7 +64,7 @@ void HELPER(update_fpcsr)(CPUOpenRISCState *env)
         if (tmp) {
             env->fpcsr |= tmp;
             if (env->fpcsr & FPCSR_FPEE) {
-                helper_exception(env, EXCP_FPE);
+                do_fpe(env, GETPC());
             }
         }
     }
-- 
2.39.1


