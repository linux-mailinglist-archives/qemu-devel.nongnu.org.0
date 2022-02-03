Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046C74A85C7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:07:49 +0100 (CET)
Received: from localhost ([::1]:36156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFcm3-0000m8-Jb
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:07:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgF-0005In-P4; Thu, 03 Feb 2022 09:01:48 -0500
Received: from [2a00:1450:4864:20::135] (port=45804
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgD-0000PD-IO; Thu, 03 Feb 2022 09:01:47 -0500
Received: by mail-lf1-x135.google.com with SMTP id o12so6098269lfg.12;
 Thu, 03 Feb 2022 06:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5m1XcZT08wRg21slVm8cJC2woOvIeqHBhplnoF6JM8=;
 b=inwVvLj3zsyT9Dw6fy8wr2cF4Upb5CmuvZVlXTlTzuyKVmieNggZ7kxMHkZsLeZpnN
 M/Cz+sIj34usedqJRM4HjRHPRjrY6TRQMxRtVAx+yEnpAaMslaJLl5e5dQAB/HFrzH9V
 w+B8RxUuzQPVhAKhDbfhPljqoqXr4K0LPO0HXjRUjiM0WsghFT2VxjBzjhgH/Tp/UqnR
 6dDDDVJI5Q7JyHIF5TmOSX31TG4RrcbhDEeUtg8c43TtGK5swK89TMe1zUQVVVevbKO9
 rfV5JtmTGiybYPvMUtkzEj68/ziTv0L5aTUF3dMjXcdplWpJNBaUEwnTk+prr07c+GUM
 qEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5m1XcZT08wRg21slVm8cJC2woOvIeqHBhplnoF6JM8=;
 b=PJFMZkNzKD4HoD7ZqZJ+ZPAGXpyqFIvfja5oPzQ0zjgGjoss8YNjpqTOiEzc9t2Cpg
 u9EMdX8rQyAtJkyUIQYAVlFAIFNdEaQsOwbEL84AwTgd6ODCzuHQpQaOi70kqIXJDkGX
 pD7aPnAM1ZDX32uDrzppbfpZmB8Ilm+q0oXr+mtXsCCZLAoWc0rjVhSlJDZ/wCFHLBnW
 KQQgVgGe1NScAztUbAwWYqd6+K7T/mlx7+KYG/8U0dFb7oDZ2pPQzjf/g4LyTJ1Ll9C6
 hmAtHFH0jr6L+RPGRKsxTbtYaOKl+5liNkmE51uWUK18oK5NU6OUZQsszEt082+aRHvb
 MEoQ==
X-Gm-Message-State: AOAM530i1qd1oSSdQGNjkZDGZLenE6djx3v1Hz8399bKKIe6h52BbYUW
 Trk18ZUXG2rL4ngyCNFXXpBj9ufxuYvNjQ==
X-Google-Smtp-Source: ABdhPJxlIkCGeBPDmImorW2Ej5mJCuQkH+JSLQy4J4IMzhsu+qjeGMUjoGKiVeXd+7LtKG5bxkEJ2g==
X-Received: by 2002:a05:6512:304e:: with SMTP id
 b14mr27448866lfb.154.1643896902335; 
 Thu, 03 Feb 2022 06:01:42 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id t8sm3928037ljj.0.2022.02.03.06.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 06:01:41 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] hw/arm: zynqmp: Add CRF and APU control to support PSCI
Date: Thu,  3 Feb 2022 15:01:35 +0100
Message-Id: <20220203140141.310870-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This adds the necessary modeling to support some of our firmware
tests at EL3 implementing PSCI (TBM). These are the test-cases
that were previously relying on QEMU's builtin PSCI emulation.

I've only tested this on top of Peter's recent PSCI emulation fixes.

Cheers,
Edgar

ChangeLog:

v1 -> v2:
* crf: Change APU_MAX_CPU to CRF_MAX_CPU
* crf: Remove empty interfaces
* crf: Add include guards
* apu-ctrl: Change NUM_CPUS to APU_MAX_CPU
* apu-ctrl: Fix indentation
* apu-ctrl: Remove empty interfaces 
* apu-ctrl: Add include guards 
* xlnx-zynqmp: Add comment clarifying SER/DESerializer

Edgar E. Iglesias (6):
  hw/arm/xlnx-zynqmp: Add an unimplemented SERDES area
  target/arm: Make rvbar settable after realize
  hw/misc: Add a model of the Xilinx ZynqMP CRF
  hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
  hw/misc: Add a model of the Xilinx ZynqMP APU Control
  hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control

 include/hw/arm/xlnx-zynqmp.h           |   4 +
 include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  95 +++++++++
 include/hw/misc/xlnx-zynqmp-crf.h      | 213 ++++++++++++++++++++
 hw/arm/xlnx-zynqmp.c                   |  46 ++++-
 hw/misc/xlnx-zynqmp-apu-ctrl.c         | 254 +++++++++++++++++++++++
 hw/misc/xlnx-zynqmp-crf.c              | 267 +++++++++++++++++++++++++
 target/arm/cpu.c                       |   7 +-
 hw/misc/meson.build                    |   2 +
 8 files changed, 882 insertions(+), 6 deletions(-)
 create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
 create mode 100644 include/hw/misc/xlnx-zynqmp-crf.h
 create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c
 create mode 100644 hw/misc/xlnx-zynqmp-crf.c

-- 
2.25.1


