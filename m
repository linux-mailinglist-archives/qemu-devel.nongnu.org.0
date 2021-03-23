Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB0934617F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:31:55 +0100 (CET)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOi4X-0003Z1-1h
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOi04-0006Zj-Jv
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:16 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhzq-0007Bk-4t
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z2so20995565wrl.5
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZAFdAmHYOhy8/8TjVO2eDKG5wM7c2ft17CTE4VtZph4=;
 b=TtfdmxgP5begRA2GpjA+kSNI6PIUEyQwuqweXvG+QdiDVAGx1pNyjCHUtllIUBpD8A
 zc3vVBcyzIReqIBYH/ahkSyOzG6gSKIgf94evfkxw9nlsN4md+d90Dzwjw7dIpPHYN4w
 /aqtBfgzEYHS35YCPSovAZGo8raWuSfo7K/UtUe72xhcH6Z1h4m/vQHwI5QMDMCtY2Ae
 LDg/h4A+QWrbmsuasgiSu4QX/8kfsIjBWV6h56p764LYm+LCkiS8z2MOtbtQH8B7SkHv
 DPiLYzIIjNIPB2UZ0ybkkWgIjtoYmWiL0KrXRV3HuJBYz1rE3aJTbeVr6GhZNw5xs4Q8
 PLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZAFdAmHYOhy8/8TjVO2eDKG5wM7c2ft17CTE4VtZph4=;
 b=JcWYyQKPOLNM6N60lrPR/RSKuHsMKWYEU8WGfrhr9xKn4XmHPNn5DLETezA2shQWTh
 BLx11kpgsc+ggj9eIjxmFCv/QsKyIW17wsoRKOHuh6zoUSYYQYBxli7ixids2SZi9+wC
 CrnGGnWKPOWwy30xSPQ2rE3CKOQ1U+1E0LMKIDhqMF+0eL/j/RizNeTWgCEHnPTWmK5x
 96C/+StfihUVWax0nXUmShfq1mLa/y1kRBFUTBuauHc3thJeAum0IARj2f7aughSJGN6
 qDCBMRiLk0URwX+1a/rO5yIeB3cPUqQX4mGg4w2BjwVCMBb5L1WS553vb2FotwP9YtHr
 TWog==
X-Gm-Message-State: AOAM531eDwydMT3AK+7xXdERFDwanelnPAmZohPjyux5lh4OUcCtTbFG
 FVe7CGJ8kPELr9CVFZtVIipKm+A4kag864xA
X-Google-Smtp-Source: ABdhPJztos/BQHjRqnUNlmM8KSDdgjn8KlQqegMNS1jizN+YrjGeEEorZlhu/2CgOXsjgLhgt9faug==
X-Received: by 2002:a5d:5088:: with SMTP id a8mr4348271wrt.294.1616509619803; 
 Tue, 23 Mar 2021 07:26:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a131sm2861292wmc.48.2021.03.23.07.26.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:26:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] target/arm: Make M-profile VTOR loads on reset handle
 memory aliasing
Date: Tue, 23 Mar 2021 14:26:52 +0000
Message-Id: <20210323142653.3538-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323142653.3538-1-peter.maydell@linaro.org>
References: <20210323142653.3538-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For Arm M-profile CPUs, on reset the CPU must load its initial PC and
SP from a vector table in guest memory.  Because we can't guarantee
reset ordering, we have to handle the possibility that the ROM blob
loader's reset function has not yet run when the CPU resets, in which
case the data in an ELF file specified by the user won't be in guest
memory to be read yet.

We work around the reset ordering problem by checking whether the ROM
blob loader has any data for the address where the vector table is,
using rom_ptr().  Unfortunately this does not handle the possibility
of memory aliasing.  For many M-profile boards, memory can be
accessed via multiple possible physical addresses; if the board has
the vector table at address X but the user's ELF file loads data via
a different address Y which is an alias to the same underlying guest
RAM then rom_ptr() will not find it.

Use the new rom_ptr_for_as() function, which deals with memory
aliasing when locating a relevant ROM blob.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210318174823.18066-6-peter.maydell@linaro.org
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae04884408c..0dd623e5909 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -331,7 +331,7 @@ static void arm_cpu_reset(DeviceState *dev)
 
         /* Load the initial SP and PC from offset 0 and 4 in the vector table */
         vecbase = env->v7m.vecbase[env->v7m.secure];
-        rom = rom_ptr(vecbase, 8);
+        rom = rom_ptr_for_as(s->as, vecbase, 8);
         if (rom) {
             /* Address zero is covered by ROM which hasn't yet been
              * copied into physical memory.
-- 
2.20.1


