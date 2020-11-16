Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74552B4A74
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:14:31 +0100 (CET)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keh9C-0004Bm-O1
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3X-0008F9-Um
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:39 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3V-0007nm-Tq
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:39 -0500
Received: by mail-wm1-x334.google.com with SMTP id d142so24238707wmd.4
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=48eZQ2C/nYOS2OAqVNbzBjE7TFGlmkjwCx4T6ymfUuI=;
 b=GSjjoidCB6ukhgqIRqApgozrZ/KueBqfCf5qdLV2MD37WNygYcPEMwvPWbSIF0561q
 HOenOcFCfCDO05Ovv/9y/HhbEWXAeOODBM23kW/jDztL2Mk6rTNm+pPv+zFGHSHxNY00
 MtR7gRuaAEBqdkYWpmE6tNwKf4SwqzRBRS/PjUuc8c9CuA9B0Vaw1j0fqw2ypJ3nUdSX
 pClVS8EfBDEJApCy+FunX4yS/IaAJL9TC75vpQwMtrcNF25UNw+st4htvZ4ZLIoh6mb5
 2XaNnYmfKCRCXof8tXA+xFKakRvaHF95wtAV6UVwxTZL/ftqekrJuuRj/IfNkXBjm4ry
 rIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=48eZQ2C/nYOS2OAqVNbzBjE7TFGlmkjwCx4T6ymfUuI=;
 b=P5ly8YhCg+oG3pp2Ji2MbrLI4ha2kQ5XW2o41+9iXYIJi0vq32yHLGoBW+JxbIicoe
 B+3xc+97yW+sxE5y/9FNGbVMvcsuh8hG1G/nnWzIGPekV7HAj7SlCxiR6HEM/vFhN/tg
 LztZUplBF0F1SkbNLWr+4KDc5q+PhrL7GQO1bU4BaIC4A6gJPLLwjRlENiJttbmP1pmW
 aHM25TK01RVPzbWFtzraHVUq+vRbkzhhgPh8xW+mEMRkJPlojIlFcVvGubb9BTbvIMYH
 T+WcQ35NbBHtv9evSIHi2196PKnGISDA2bynCLgSLHbDacQbdhSUPxYAtI1z0dBHDOWw
 AEkA==
X-Gm-Message-State: AOAM533YZi6782kpi/GkQinZepFxU+G1w7eR+fAA16guZnYVsdYNqFIe
 Mh/51yEMHrQIdOf7RSkGoG1pFChmJz03Cw==
X-Google-Smtp-Source: ABdhPJxwooqONL0X+twf7xf8zknq79pZgTzg6jByhkcKwXGMcN6RHFF1ab/BLAaV+ytHFSW/Fk5tQw==
X-Received: by 2002:a1c:4485:: with SMTP id
 r127mr16232430wma.177.1605542913760; 
 Mon, 16 Nov 2020 08:08:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/15] target/arm: More v8.1M features
Date: Mon, 16 Nov 2020 16:08:16 +0000
Message-Id: <20201116160831.31000-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset implements a somewhat miscellaneous collection of
new-in-v8.1M features, as well as some bugfixes. It's for-6.0
material.

In the bugfix category:
 * RAZWI (or BusFault for unprivileged accesses) the whole of the
   system PPB address range, not just the SCS
 * Don't clobber ID_PFR1.Security on M-profile
 * Don't allow VMRS/VMSR to fp sysregs that don't exist on M-profile

In the features category:
 * v8.1M PXN extension
 * VSCCLRM and CLRM insns
 * VLDR/VSTR (sysreg) insns
 * new M-profile fp sysregs: FPSCR_nzcvqc, FPCXT_S, FPCXT_NS
 * update FPDSCR masking to allow new-in-v8.1M bits in that register

As usual, none of this will be enabled until we eventually get
to the point of a complete v8.1M implementation and can define
a Cortex-M55 CPU model.

thanks
-- PMM

Peter Maydell (15):
  hw/intc/armv7m_nvic: Make all of system PPB range be RAZWI/BusFault
  target/arm: Implement v8.1M PXN extension
  target/arm: Don't clobber ID_PFR1.Security on M-profile cores
  target/arm: Implement VSCCLRM insn
  target/arm: Implement CLRM instruction
  target/arm: Enforce M-profile VMRS/VMSR register restrictions
  target/arm: Refactor M-profile VMSR/VMRS handling
  target/arm: Move general-use constant expanders up in translate.c
  target/arm: Implement VLDR/VSTR system register
  target/arm: Implement M-profile FPSCR_nzcvqc
  target/arm: Use new FPCR_NZCV_MASK constant
  target/arm: Factor out preserve-fp-state from full_vfp_access_check()
  target/arm: Implement FPCXT_S fp system register
  target/arm: Implement FPCXT_NS fp system register
  hw/intc/armv7m_nvic: Update FPDSCR masking for v8.1M

 include/hw/intc/armv7m_nvic.h  |   1 +
 target/arm/cpu.h               |  30 ++
 target/arm/m-nocp.decode       |   8 +-
 target/arm/t32.decode          |   6 +-
 target/arm/vfp.decode          |  14 +
 hw/arm/armv7m.c                |   2 +-
 hw/intc/armv7m_nvic.c          |  87 ++++-
 target/arm/cpu.c               |   5 +-
 target/arm/helper.c            |   7 +-
 target/arm/translate.c         | 102 ++++--
 target/arm/translate-vfp.c.inc | 581 +++++++++++++++++++++++++++++++--
 11 files changed, 765 insertions(+), 78 deletions(-)

-- 
2.20.1


