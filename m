Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E59E508335
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:16:21 +0200 (CEST)
Received: from localhost ([::1]:56940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh5Vb-0004oy-Vf
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Og-0001nW-RL
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:09:10 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Oe-0001KC-Cg
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:09:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id be5so1096569plb.13
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 01:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z9iGgyehXFFotQ+yNPADTnzkBzf01bwCukSA+wfvbAA=;
 b=Orgujn9b7FkS5okNtitVASYzucDosgl3UDXDfcW2VQO4YwrEurtu1LEIBz/u4NEWgi
 sGMc3ln+vOg8HKwPJZ6Le3yjSMeetwt9rhSKIB6XwCw0Hmww1V3D5gXbARkaMsGk3HYO
 jeGbatQ0cRZ1GYyuLL06V71eK5Aao8ql4Bdzg65G6GSR2YAVcio4uZprMZys4hnZVklc
 Pa4/Ms/CQusJXWsDiSEmptSNjJHtpeZ8l9her0ztD8yepGvDofzloPsqc1kznnkzCID+
 Jvn90of33SXrcwVkxlWRINRDW19xRcYueTTjcbjbArtP4Bga2OkdiuqhvvVS4hC5TZfw
 hdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z9iGgyehXFFotQ+yNPADTnzkBzf01bwCukSA+wfvbAA=;
 b=Ml29zoDRhYE0zPOh06nGBWY+nx2LLjeRq13CKLa1YqXamMPInwMXnj9p1YEMnjs8X/
 +lFfhB4NyQa7D7OAFYlxLVc5QS4VDHvXYYx+uOuFTPtsZpiTUquO/9Hj+AIWveB54rqh
 OAbjCAJpQi+YknnJ69XgwTzWHycx/DQWz0JGA/W44qJ57ir99nOdvkSSiJaE/Wx6J36v
 oNAYQHmeMaWZKlojuMlWddHGBjLRb/llTiSHcykKK52Zg786W67HaPu9Q2VSWs0xFhzf
 0fs/0suYd17Eb5bB0AZ5DLP23YtYkB0UvU8aAUgWWXGe3KkR5R7aCGjwTZ496l+AwmBj
 vk0Q==
X-Gm-Message-State: AOAM532uWUKsqOv2Yf5MNTXLM7vfub0EmWWT+ayDhz+w7NOvULOsvC/z
 xxXPknbzPlk6uP+27CnC6e6fAsiYXRlY8IEz
X-Google-Smtp-Source: ABdhPJzKQZsC0qYGmQUyDJQAyHzkY0N/rS0t/KPFZIaphp5PLjQ22Q3wdhmTbRe6tWwS3uyH/9iEQA==
X-Received: by 2002:a17:902:ba8c:b0:14f:d9b7:ab4 with SMTP id
 k12-20020a170902ba8c00b0014fd9b70ab4mr19748312pls.23.1650442146620; 
 Wed, 20 Apr 2022 01:09:06 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g15-20020aa7818f000000b00505ce2e4640sm18554898pfi.100.2022.04.20.01.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:09:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] Support ACLINT 32/64-bit mtimecmp/mtime read/write
 accesses
Date: Wed, 20 Apr 2022 16:08:56 +0800
Message-Id: <20220420080901.14655-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

This patchset makes ACLINT mtime to be writable as RISC-V privilege
spec defines that mtime is exposed as a memory-mapped machine-mode
read-write register. Also, mtimecmp and mtime should be 32/64-bit memory
accessible registers. ACLINT reset function is also added, which requires
mtime to be resetable if we need to support core power-gating feature in
the future.

This patchset is the updated verion of:
https://patchew.org/QEMU/20220126095448.2964-1-frank.chang@sifive.com/

Changelog:

v4:
  * Replace the error log mask for invalid 8-byte timecmp_hi and time_hi
    writes from LOG_UNIMP to LOG_GUEST_ERROR.

v3:
  * Forbid 8-byte write access to timecmp_hi and time_hi.
  * Add ACLINT reset function.

v2:
  * Support 32/64-bit mtimecmp/mtime memory accesses.
  * Add .impl.[min|max]_access_size declaration.

Frank Chang (3):
  hw/intc: Add .impl.[min|max]_access_size declaration in RISC-V ACLINT
  hw/intc: Support 32/64-bit mtimecmp and mtime accesses in RISC-V
    ACLINT
  hw/intc: Make RISC-V ACLINT mtime MMIO register writable

Jim Shu (1):
  hw/intc: riscv_aclint: Add reset function of ACLINT devices

 hw/intc/riscv_aclint.c         | 144 ++++++++++++++++++++++++++-------
 include/hw/intc/riscv_aclint.h |   1 +
 target/riscv/cpu.h             |   8 +-
 target/riscv/cpu_helper.c      |   4 +-
 4 files changed, 121 insertions(+), 36 deletions(-)

--
2.35.1


