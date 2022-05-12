Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73988525114
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:17:43 +0200 (CEST)
Received: from localhost ([::1]:50088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAZS-0006Bj-9i
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWs-00032I-LI
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWq-0000An-PH
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 k126-20020a1ca184000000b003943fd07180so3218674wme.3
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4NZwA8ge6C+ju35yO9CmUblphVx+yvgRUYns9xyf3A=;
 b=H79cUtFgfTKTDHwdS7gpOTcMBPjGUibrZBNDTFJ+MfS/S+uOKIQqpggmh3A2Js9WvM
 yyaExiLuQMM0VWYuZAQ5ebK8QuN6JIYEoSKnzYbRvEvWzyEN62lhR3uAGMVUQ5zTYotE
 73J6a7DBiuNIOvoND+vUduyT899w49yvF7mS/49wMfI83xAJq5dEsH2+9LOpNl0Ozx3k
 A/NWZeD7CJ2Hw/RSsUHKGAfKJjixxbHmPdf5WV93KVNucHaDei82YTd3Hv46kh8G3baX
 Kesae7DWdSU/gmiM3GO+mSUi/6rYn/kILeyOVNpzB6Cz3l51CadFyMD4dm3iyX9ULLtv
 N3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4NZwA8ge6C+ju35yO9CmUblphVx+yvgRUYns9xyf3A=;
 b=iXwqKyy0tZB3w9JSLLAiVmnT48mSbALCQ4fa/TQ+tpVzQcYtppu4ew53JfLN8ldgUt
 VlgQiuwyyofM+rskSpoZkhyCMYyPxcyKdDDDgC51xbLHfGWEMGNg71Sxf/mwrIXs7m4r
 WSwjmvM1xh3Jt3q0YbWTk1iMCWQ8kR8GOwefErVaBtrIWXv0OLpsecOMX02C9luNZJS5
 8oiw1KIQ9zFD0iNxa3pzH2V+Vwcfy0s9WjO1RM2OPgSeY7wPWbznYgNSdCQUowTCdl33
 LjsGtQBjZwaozkAilgTQYGjSOVFEieaZjocp0sb5Kdhh8ukPgc0DRkNYSKr552qCAnSr
 GKHw==
X-Gm-Message-State: AOAM53286ZId2DB34LyWrLtW0OibeZznEnH74+nJk/RpdzZRsp70Yk3b
 epAu+fInN27MGIaWRy8ZdojzfA==
X-Google-Smtp-Source: ABdhPJygmo4Aq0Dcjt0OxNW81LNqE814txTOS2hU92VPlxoLh/eA52hPD+GXQnpI/jre3L2ZQkVNDg==
X-Received: by 2002:a05:600c:2552:b0:394:65f:fbf1 with SMTP id
 e18-20020a05600c255200b00394065ffbf1mr291125wma.55.1652368499185; 
 Thu, 12 May 2022 08:14:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm3048378wmb.42.2022.05.12.08.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:14:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 0/6] gicv3: Use right number of prio bits for the CPU
Date: Thu, 12 May 2022 16:14:51 +0100
Message-Id: <20220512151457.3899052-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

This patchset fills in an odd inconsistency in our GICv3 emulation
that I noticed while I was doing the GICv4 work.  At the moment we
allow the CPU to specify the number of bits of virtual priority (via
the ARMCPU::gic_vpribits field), but we always use 8 bits of physical
priority, even though to my knowledge no real Arm CPU hardware has
that many.

This series makes the GICv3 emulation use a runtime-configurable
number of physical priority bits, and sets it to match the number
used by the various CPUs we implement (which is 5 for all the
Cortex-Axx CPUs we emulate).  Because changing the number of priority
bits is a migration compatibility break, we use a compat property to
keep the number of priority bits at 8 for older versions of the virt
board.

The main change in version 2 fixes a failure in 'make check'
(oops...) by stopping the GICv3 from asserting when used with CPUs
which don't specify the various priority bit values.  In practice
that means one of the 32-bit CPUs which in real hardware don't have a
GICv3.  The fix is to use a set of sensible default values if the CPU
doesn't specify.  The other approach would be to make the GIC fail
realize if the CPU type doesn't officially have a GICv3 interface,
and make the virt board check for mismatches and handle 'gic-version'
accordingly, but this seems like less effort.  I don't think
anybody's likely using this corner case anyway: the only reason I ran
into it is that with my patches to add cpu->gic_prebits one of the
tests in 'make check' now runs into it because it unintentionally and
unnecessarily asks for gicv3 and cortex-a15.

The new patch 1 implements that "use default values" logic for the
existing gic_num_lrs/gic_vpribits/gic_vprebits, fixing a bug where
the combination of GICv3 + 32-bit CPU + EL2 would cause us to
register the EL1 GICv3 sysregs but not the EL2 sysregs, probably
causing a guest crash.  Patch 5 then gains the minor tweak to make
the new gic_pribits follow suit.

Changes v1->v2:
 * new patch 1, as above
 * patch 5: drop TODO comment about a64fx
 * patch 5: add settings for cortex-a76, neoverse-n1
 * patch 5: default pribits to 5 if CPU doesn't set it
 * patch 6: retain local variable for loop bound

Patches 2-6 have been reviewed.

thanks
-- PMM

Peter Maydell (6):
  hw/intc/arm_gicv3_cpuif: Handle CPUs that don't specify GICv3
    parameters
  hw/intc/arm_gicv3: report correct PRIbits field in ICV_CTLR_EL1
  hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
  hw/intc/arm_gicv3: Support configurable number of physical priority
    bits
  hw/intc/arm_gicv3: Use correct number of priority bits for the CPU
  hw/intc/arm_gicv3: Provide ich_num_aprs()

 include/hw/intc/arm_gicv3_common.h |   8 +-
 target/arm/cpu.h                   |   1 +
 hw/core/machine.c                  |   4 +-
 hw/intc/arm_gicv3_common.c         |   5 +
 hw/intc/arm_gicv3_cpuif.c          | 225 ++++++++++++++++++++---------
 hw/intc/arm_gicv3_kvm.c            |  16 +-
 target/arm/cpu64.c                 |   6 +
 7 files changed, 190 insertions(+), 75 deletions(-)

-- 
2.25.1


