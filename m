Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8D76744BF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:38:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcb9-0006HG-Sd; Thu, 19 Jan 2023 16:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIcb0-0006Fn-OM
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:37:21 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIcax-0001nu-03
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:37:17 -0500
Received: by mail-oi1-x244.google.com with SMTP id s124so2867053oif.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 13:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uRotMhtHnKBAO6t2X2uPrp0RVjEDypTQfmHvure0DIU=;
 b=diJp3OKys+kObtFlzg5ZLmw3ZRlmCctSjDOrNUW1RhrxpC6F2RvsvH1jUeJF1zByTz
 84OUkgRPX1x1AYsPFQFjpxPRZLu+OnB9VLoGfRLT6Hj/H/D3A8EVva1DLnx7OJkl56h3
 8sXOXG0zMb2Qhq7hdsxMAy8BwHZxOmxAa+YFRX5YM18Dysjxw0BuBgHfdcYmq8Sd3YnV
 ElVZp2Brkz4gzvCXsNLueV8k27S6CyXE+3IrEVYuzOhGOvAbHPKTDYWekEYKmH8o7eJZ
 vywilixfQ2zC9K7LWADQFmeio/ZhQcPacOUmv2+j7KFBLwA80EUCMMGATFf/EyEjtyoP
 ulmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uRotMhtHnKBAO6t2X2uPrp0RVjEDypTQfmHvure0DIU=;
 b=X4i6pVGnVQP8oUwa4Tw96XywG8Z9tJ+mw+fVpPg22Kg3f4tyEjWqA6GhGWDZIcdw8y
 wDCmVu3MC1IPSE7t2ExOp5YCw36jhqPGoaG0z9ry1KYmRD60QfsoG9XgfguLYE46E6pX
 Wt4lFs/HEa9glna13P+2UT79hSnKLDxNPxKsnVtpJU6p5dSg1LLWtsdWmtCG7PG5z17j
 YAA1i7kgPggCvzZYcSsk03fI/Xd8cXg2C0k0kyIP3tslKLOilFK7LLZqZF4SRSl/UCkl
 xBr22Wh85xyDHGDvuYbrM92aSL6ggRY+C9I5VFvBmJv0X8Hnqni20dYr1reZMLdGrj7x
 gRow==
X-Gm-Message-State: AFqh2kpxcMOYGrQfHg5JGZDeAIBFRJ9+72rgHDMuXmhPUVTbmrlfqgxi
 OIsEjrtHwQImSKQFbAdD5cdYRcARfpPfRb+WdYw=
X-Google-Smtp-Source: AMrXdXuUTfclmD9rOdEeDXq5bSZr5NmmZjRG+7Ov4whzmRHGegiuwipzgbAA0Pn6bEccmRV3QO/ulA==
X-Received: by 2002:aca:5bc1:0:b0:367:18a6:eb26 with SMTP id
 p184-20020aca5bc1000000b0036718a6eb26mr4894316oib.42.1674164232001; 
 Thu, 19 Jan 2023 13:37:12 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 c132-20020aca358a000000b003646062e83bsm13664472oia.29.2023.01.19.13.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 13:37:11 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 0/3] hw/riscv: clear kernel_entry high bits with 32bit CPUs
Date: Thu, 19 Jan 2023 18:37:04 -0300
Message-Id: <20230119213707.651533-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

In this version I changed the patch order to avoid having a patch that
would trigger the 32 bit regression Alistair observed. Patch 3 is now
the first patch.

I've also addressed the comments from Bin and Phil.

Patches based on riscv-to-apply.next.

Changes from v8:
- patch 1 (former 3):
  - comment changes
  - now open code '32' instead of using a macro
- v8 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg03254.html

Daniel Henrique Barboza (3):
  hw/riscv: clear kernel_entry higher bits from load_elf_ram_sym()
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c            | 96 ++++++++++++++++++++++++++------------
 hw/riscv/microchip_pfsoc.c | 12 +----
 hw/riscv/opentitan.c       |  4 +-
 hw/riscv/sifive_e.c        |  4 +-
 hw/riscv/sifive_u.c        | 12 +----
 hw/riscv/spike.c           | 14 ++----
 hw/riscv/virt.c            | 12 +----
 include/hw/riscv/boot.h    |  3 +-
 8 files changed, 82 insertions(+), 75 deletions(-)

-- 
2.39.0


