Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5760FD7C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 18:50:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo63T-0007lv-03; Thu, 27 Oct 2022 12:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo638-0006Ir-L8
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:48:10 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo633-0002Ny-1j
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:48:10 -0400
Received: by mail-pg1-x530.google.com with SMTP id q71so2038884pgq.8
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 09:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cs6MdajnS9xSPVgjIzzjVHHNowtixIzYZNV0CDroCs0=;
 b=gmIgeeF6cy+lj49We64Zwps2eYqwZ6au9KKNo6gJaRkqe/FgDTmUNBP0k05l5dVcjS
 E59DiRfgbdw2HqW7tpXbUWNjgm6nCDenWTeZ8oLZ2GG6TAV9gOvIuLs8BWl6o80x41QY
 EotIAUj5r+UdatfGrai0T46Tn7v5e4J/ziqR3cAYju8+kgImThMjjrELLX45pFfSGrKf
 V62AxhuWeHEwfhvzpp5xSpGJlZItHRRhFoJ5dW15hNcpjxZLgUDegL+sN2EHi91DnAWf
 MNUSreOSaxEKubRdJhkSWf91/tiWqErvPAlc4MNyA0T3aW9W/TTi3pMOwUhPJ4AZTqNe
 JhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cs6MdajnS9xSPVgjIzzjVHHNowtixIzYZNV0CDroCs0=;
 b=QmOgLqdaahZ4FimoMQhhwp2gNn7VK5lVNYb1qPmYihb7siMA8CTchLt3IyrQ7xs1YZ
 oNbO0Z/aJUm4L+JsRhUX+6eOUoPbwuy7qkyt/KKwhB7tpAfc1zx5+QoI86nCb/iGGMaq
 3tN434Uv5slDNbBb6uCNkME1Hcx8D59ADVAN3C1nOSdyX3xSBzdrqUBF5IGEzM7zWZoF
 D/Dc9ESSuZ9cE+qYPL3fW4BUuuTzWHZE25v+1kDTm/ty54BgEni5JOuyoWEAeQm0/XCh
 hmYvIU8kMl3zMUZWhbq6J7Y3Ktw1ZYihg1B+6j5v7Jskbt2hU1MaPpbO4f/pkWsvp1AN
 zFNQ==
X-Gm-Message-State: ACrzQf1glAhgw4TRdoVxXn0X53PTzodb9uqxegwuW7NwkYQgOQDjb57L
 CyGoB1yGEPdca+LkA7UOgkBnhw==
X-Google-Smtp-Source: AMsMyM5r0ouXLpRI13WuLbYa68qApMAELq9E+7EqhKtfxHv60Gm8rsZ4nqZlhQubsry8O5qTPVRKbg==
X-Received: by 2002:a05:6a00:24cb:b0:56c:7815:bc7d with SMTP id
 d11-20020a056a0024cb00b0056c7815bc7dmr7423642pfv.44.1666889282248; 
 Thu, 27 Oct 2022 09:48:02 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a17090a9bc800b00212e5fe09d7sm1212543pjw.10.2022.10.27.09.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 09:48:01 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/5] Nested virtualization fixes for QEMU
Date: Thu, 27 Oct 2022 22:17:38 +0530
Message-Id: <20221027164743.194265-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x530.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series mainly includes fixes discovered while developing nested
virtualization running on QEMU.

These patches can also be found in the riscv_nested_fixes_v1 branch at:
https://github.com/avpatel/qemu.git

Anup Patel (5):
  target/riscv: Typo fix in sstc() predicate
  target/riscv: Update VS timer whenever htimedelta changes
  target/riscv: Don't clear mask in riscv_cpu_update_mip() for VSTIP
  target/riscv: No need to re-start QEMU timer when timecmp ==
    UINT64_MAX
  target/riscv: Ensure opcode is saved for all relevant instructions

 target/riscv/cpu_helper.c                   |  2 --
 target/riscv/csr.c                          | 18 +++++++++++++++++-
 target/riscv/insn_trans/trans_rva.c.inc     | 10 +++++++---
 target/riscv/insn_trans/trans_rvd.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvf.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvh.c.inc     |  3 +++
 target/riscv/insn_trans/trans_rvi.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc   |  2 ++
 target/riscv/insn_trans/trans_svinval.c.inc |  3 +++
 target/riscv/time_helper.c                  | 20 ++++++++++++++++----
 10 files changed, 54 insertions(+), 10 deletions(-)

-- 
2.34.1


