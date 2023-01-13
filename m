Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75CF66A0D3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:34:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGNhC-0001W8-3f; Fri, 13 Jan 2023 12:18:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGNh4-0001T2-8G
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:18:18 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGNgx-0001JK-Pc
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:18:17 -0500
Received: by mail-ot1-x342.google.com with SMTP id
 i26-20020a9d68da000000b00672301a1664so12579266oto.6
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 09:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hJBrxLI6QmmeeITsOzUvZaX/VcVW/UkeGDy9RzOvnNw=;
 b=bi+he8/9ip9JE8Do8cE3WvPHlrPyDBRdi5m51xCgYTEA+EHeKD3bmlDRQRdd7E4Clr
 OofxQVk3yqV2DjPg4BIsqBMU++23/TJNvf8usEJdHcfa/5Fw0LqasV7HIVHnS/drt8LV
 WC5gaBm3Mr0AJ6IcMaRw9cCknkSd4ol8RzsWu6RU0HalWxhbn5E20cHKjthMz96tO0fv
 oVw/XJrOF/XgPDii1E5TIiSxAKbH5/EibId8aUQBuqvvAlKsCm1X5PZo+mw0+w4SmvoS
 lieCDqQKREoaQ6BcdywyUb7o2VcZG+QnO6tEkKnS1gzuYemSrg1OZrrvXQtips9aPk+B
 tvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hJBrxLI6QmmeeITsOzUvZaX/VcVW/UkeGDy9RzOvnNw=;
 b=2E+AwKZcO/XktxqLrfGGXngMIj0G5w4hTlU7ZV5FSnqjNN8FibxW72lWm8AwrtJEVS
 HLJMsmUJreMDwK5KA6rz2KwhC5tfEYTpzpq7SGlqr0wB+c+6Nr8+poRzBjxwjCCr5AXG
 AtP6ZJBrXT7LCbm/AhIdfSE7suHrteYexcgbAJvyqKvj/ifQb+/F2OGGF+BmG5oPxgOO
 g7yMdYixB96hZZzRPWpkyQC/j/zGZ2h5i+y9f654aYn0uiJjnXzozBZdfq8uk9EacJ/J
 BUNW5ohDmfHjC6MuNBicc5PO7km3lvGo2p2zndd1LoCwCDG21l/6ZOLr6Eh/V2NE7ZDw
 Db7w==
X-Gm-Message-State: AFqh2kql3rtMLt3qknEJF6Xi4y/UQoSRevjaLapZACdHgiW/PK2I/Tia
 9P0Q+/diVSGV1lYfcfwFZMH2p00KWVj0btAsN5Y=
X-Google-Smtp-Source: AMrXdXtJk8eyNnj5qxKu3U5oACPJ+Vp67zXOx7zqHqf5goEV3gqJ4UBcpG+1/yVVart/iWYjfato8Q==
X-Received: by 2002:a9d:6451:0:b0:684:c8ff:8844 with SMTP id
 m17-20020a9d6451000000b00684c8ff8844mr2588992otl.12.1673630290203; 
 Fri, 13 Jan 2023 09:18:10 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 v25-20020a05683011d900b00683e4084740sm10695872otq.10.2023.01.13.09.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 09:18:09 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 0/3] hw/riscv: clear kernel_entry high bits with 32bit CPUs
Date: Fri, 13 Jan 2023 14:18:02 -0300
Message-Id: <20230113171805.470252-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x342.google.com
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

In this version I followed Bin Meng's suggestion and reverted patch 1
back from what it was in the v5, acks included, and added a new patch
(3) to fix the problem detected with the Xvisor use case. I believe this
reflects that there is nothing particularly wrong with what we
did in the v5 patch and we're going an extra mile to fix what, at first
glance, is a bug somewhere else.

In patch 3 I also followed Phil's idea and used a translate_fn()
callback to do the bit clearing.


Changes from v6:
- patch 1:
  - restored to the state it was in v5, acks included
- patch 3 (new):
  - clear the higher bits from the result of load_elf_ram_sym() using a
    translate_fn() callback for 32 bit CPUs
v6 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02630.html

Daniel Henrique Barboza (3):
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static
  hw/riscv: clear kernel_entry higher bits in load_elf_ram_sym()

 hw/riscv/boot.c            | 111 ++++++++++++++++++++++++-------------
 hw/riscv/microchip_pfsoc.c |  12 +---
 hw/riscv/opentitan.c       |   3 +-
 hw/riscv/sifive_e.c        |   4 +-
 hw/riscv/sifive_u.c        |  12 +---
 hw/riscv/spike.c           |  13 +----
 hw/riscv/virt.c            |  12 +---
 include/hw/riscv/boot.h    |   3 +-
 8 files changed, 89 insertions(+), 81 deletions(-)

-- 
2.39.0


