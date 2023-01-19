Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94ED674298
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIaQF-0000Wz-BZ; Thu, 19 Jan 2023 14:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIaPu-0000Fa-3a
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:17:50 -0500
Received: from mail-oa1-x41.google.com ([2001:4860:4864:20::41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIaPp-0006b7-PW
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:17:41 -0500
Received: by mail-oa1-x41.google.com with SMTP id
 586e51a60fabf-12c8312131fso3724114fac.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AS6xUZx+bFYJADDv8qU9HCdGl/3ckUXhUYmfUUIWhXE=;
 b=nb6EdrrYFY5VZUdO8m+4YLfZPdVG1Lm9OZhJs/DEyeMh8BnRnlMsejKV4F+9TMFSvH
 4T5XJbmv1VxFFe9b8R0rFCy33kgrKIv45RuyakYMM5JSb9096TU6oK4eQncx5DZSD2BW
 xpBb3H0UUd2uduhrP6OcHWB3NndQV1I5eGKJtGwb/0RmwAO1s4qNJht/gJ2rwCBtMph5
 P7mwjxCU1mwHSOiFaC4SXNYzi/BmmvEEdcRNScl0ZQDRMVGCtVOhHSlQChyNx1eQSMRG
 TOW3S2RZz1uH0UCFdNyH/Ywp3RaVj16U41roMb8BG+JT6tvIPDcG7azXpfysAJb4JgOd
 Ypig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AS6xUZx+bFYJADDv8qU9HCdGl/3ckUXhUYmfUUIWhXE=;
 b=BbPTgKP+V77zbW48fIeLHtoIwmBTlbcgHQ9rcynd6F+jmzon99dPm3r+H8d7Y54ZC8
 iLajhqOhokEEJgtwanmo5X0vuHuZvsXxik4cZ8/lXvFmqntfQw8I+XLyhUSbn4rUv9gj
 N6s/T+5aGLx9upU50kJzeDnSN3js7m3xsJ9mbcR/n16jXo7CAt0ygQSzTlZ2WP080UnF
 dptL65CePVgLtmqqs9VtpYU/bODdxvUz6hEQE76F7qRXjOtJNYThh2iJzCPhBUfK9ub3
 oK5p5dA96rQclM/8ZrkGlJCpQRvE+FN1/edZWftH/ax8iQ92JQBiGR+F0q92NOLOABUX
 Xe6w==
X-Gm-Message-State: AFqh2krUtOhXjWnhQPKGOVNYkY/NrK/SGkHyLEZz2QAUpvSQEmr5w9hv
 ZHU9GkbT/Q40sN4icRLjPxRXqjCLQeMMGFrVK0A=
X-Google-Smtp-Source: AMrXdXsoaMnBjgRPatQjvqQZEQFb613YyFaYD+yptbIAHdYud0DCzf0o/2IpYoDsIxlXqF6Xt+XWyg==
X-Received: by 2002:a05:6870:c0d:b0:15f:7324:8860 with SMTP id
 le13-20020a0568700c0d00b0015f73248860mr5436483oab.57.1674155854756; 
 Thu, 19 Jan 2023 11:17:34 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a056870f20900b0015f193c86d2sm9001128oao.6.2023.01.19.11.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 11:17:34 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/7] riscv: fdt related cleanups
Date: Thu, 19 Jan 2023 16:17:21 -0300
Message-Id: <20230119191728.622081-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::41;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x41.google.com
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

In this version I added a new patch (patch 3) that handles the case of
the sparse RAM mapping of the Icicle Kit machine. No relevant changes
made in the other 6 patches.

Patches are based on riscv-to-apply.next.

Changes from v2:
- patch 3 (new):
  - add a specific function to retrieve the FDT addr of the Icicle Kit
    machine
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg03366.html

Daniel Henrique Barboza (7):
  hw/riscv/boot.c: calculate fdt size after fdt_pack()
  hw/riscv: split fdt address calculation from fdt load
  hw/riscv/microchip_pfsoc.c: add an Icicle Kit fdt address function
  hw/riscv: simplify riscv_compute_fdt_addr()
  hw/riscv/virt.c: calculate socket count once in create_fdt_imsic()
  hw/riscv/virt.c: rename MachineState 'mc' pointers to 'ms'
  hw/riscv/spike.c: rename MachineState 'mc' pointers to' ms'

 hw/riscv/boot.c            |  42 +++-
 hw/riscv/microchip_pfsoc.c |  48 +++-
 hw/riscv/sifive_u.c        |   7 +-
 hw/riscv/spike.c           |  24 +-
 hw/riscv/virt.c            | 468 +++++++++++++++++++------------------
 include/hw/riscv/boot.h    |   3 +-
 6 files changed, 331 insertions(+), 261 deletions(-)

-- 
2.39.0


