Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD48495309
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:18:12 +0100 (CET)
Received: from localhost ([::1]:46354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAb4d-0003LD-JT
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:18:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgN-0004Bc-FC
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:52 -0500
Received: from [2a00:1450:4864:20::32a] (port=43637
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgJ-00039p-52
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:50 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so13398904wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FZNzOyeGj4/sq8Srv8WNLvy4rb7thXkM78LTfwnMVmc=;
 b=tPiJtsp6J2VAAB1jEFZg62QZhuPg3UYg8bAcABT8OdUbwtsCaGCBGW/v/XvqS7Rclo
 iqhZiAj+h2dlDN2NCmqqKJl07yVH24a2baN7Ucu6kpEYsCugnr5rfZDbDgCp71NGNXDA
 9TtjUTvH0Jd4XXfxBzIXYIkYSTehZTgT7pB2imC8jMQCoD3M2rn7PEKJBQhOosNNTfT/
 ScvBSeOxkvEpT99XfNOKenvEiTRDGP/Ks3tWE+ujas2s240yUoKTD0dGRqRFCdKQNAEp
 Zx++ihOxqIn0Ouo3CNiJf33hM7LXyWdJIyfZIiRZQwIGmIuPl4fApeVseiFhJ93xYWJn
 dr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZNzOyeGj4/sq8Srv8WNLvy4rb7thXkM78LTfwnMVmc=;
 b=PMv57EUvLOdBzgCgOLXAijhu8IGnyZ+J1AS0r/iuxdbr1nRzCXiiMFV6WwLdGYQDov
 JBOUoXTZiq0ShCBG00mw0T7Xm+EjcGEtVlxVy623697z3umpZbswhZx2ittNA9mWkCN9
 uyEtYL10x0i8bzQdBtSNF4bchI5u8/ud//5jKIniQx3SG/G5bXVLUOQ+Y+FHr3w8acNm
 B7zfx+L+Uu0iLz3CDvu4l+TZalBPKubbAfjHt1Ul2gGKxbmI/ooLTuznx/dmpWXmaXIN
 znM74jKTEInuAcJoyt0OR/f073T9dS+9j1Vnxrw7QcFmzdmnXVWv3wJAdu4mQuI6+467
 pS9A==
X-Gm-Message-State: AOAM5319Mi3uSchaLga7hzdYFPK1H8ZSGlvUWSe8+Xmoecd/fYDbsDTi
 04+h4/PIG0LyXdtxc77bw5Q/cOCQv9NhLw==
X-Google-Smtp-Source: ABdhPJz7oWxJYvt9QfxITy51R703MN31Jcdm4GaNNtC36MwNSbJBSjnLG/HV9yDDQMadCsmm+fKPDw==
X-Received: by 2002:adf:fa91:: with SMTP id h17mr417582wrr.189.1642682204891; 
 Thu, 20 Jan 2022 04:36:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/38] hw/intc/arm_gic: Allow reset of the running priority
Date: Thu, 20 Jan 2022 12:36:07 +0000
Message-Id: <20220120123630.267975-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Petr Pavlu <petr.pavlu@suse.com>

When running Linux on a machine with GICv2, the kernel can crash while
processing an interrupt and can subsequently start a kdump kernel from
the active interrupt handler. In such a case, the crashed kernel might
not gracefully signal the end of interrupt to the GICv2 hardware. The
kdump kernel will however try to reset the GIC state on startup to get
the controller into a sane state, in particular the kernel writes ones
to GICD_ICACTIVERn and wipes out GICC_APRn to make sure that no
interrupt is active.

The patch adds a logic to recalculate the running priority when
GICC_APRn/GICC_NSAPRn is written which makes sure that the mentioned
reset works with the GICv2 emulation in QEMU too and the kdump kernel
starts receiving interrupts.

The described scenario can be reproduced on an AArch64 QEMU virt machine
with a kdump-enabled Linux system by using the softdog module. The kdump
kernel will hang at some point because QEMU still thinks the running
priority is that of the timer interrupt and asserts no new interrupts to
the system:
$ modprobe softdog soft_margin=10 soft_panic=1
$ cat > /dev/watchdog
[Press Enter to start the watchdog, wait for its timeout and observe
that the kdump kernel hangs on startup.]

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
Message-id: 20220113151916.17978-3-ppavlu@suse.cz
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 0cd9ceca8d1..492b2421ab4 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1736,6 +1736,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         } else {
             s->apr[regno][cpu] = value;
         }
+        s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
         break;
     }
     case 0xe0: case 0xe4: case 0xe8: case 0xec:
@@ -1752,6 +1753,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
             return MEMTX_OK;
         }
         s->nsapr[regno][cpu] = value;
+        s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
         break;
     }
     case 0x1000:
-- 
2.25.1


