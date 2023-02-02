Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70412687F67
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 14:59:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNa6X-0006K7-Jz; Thu, 02 Feb 2023 08:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa6V-0006JZ-Oy
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:58:19 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa6T-0008R9-SD
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:58:19 -0500
Received: by mail-oi1-x241.google.com with SMTP id s124so1491095oif.1
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 05:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JeHkLWbWJslXjM1ij2IkLLDw73ufxiwNdc+5UsgYMus=;
 b=QORCuQmE+WtEZxQiML01hsChi9Fx+e8BPqBJeMykv0Tf0wXkU3KD/uRkB3EbXFXtIw
 Shd5kPCvgZUJ8LY+07yOkfCS6xZUZpq3TDv44c+UZ/2LGggIkJumGIpv4gfS9VQIuXw/
 Rh+YPWjfMWyijLdNPFTMyyV+I6ynxA0vY6USqDf0LAR4nrltMMluCOkTYDyQ8crFPqrx
 coh+ODUgN93/UyU5USn3VLPrS6jEML86iM4xyMw7bVDtyTqmtXgMwmu22J2ELQFPGJEB
 Q4FdfBEqZEOzLu/+d0SJDt+sL7pZTpXzlDflCVvwG1n9MetBhWbZRmswOB6sD7MVoB4O
 zAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JeHkLWbWJslXjM1ij2IkLLDw73ufxiwNdc+5UsgYMus=;
 b=i2tulchN6RteKpBtf87QxFULyqxr3ps1hAXl299SuL2bnMHztpdd+xHCIkWjtqBl3g
 TLwdO6Z/SD50W91DVayYdVF7PDU2YxocwrsPmRJGLBZ1hoYXeGE5cammp/f5xMRNshHF
 SI6tj6S5uoGYyZGPL8PBLH6iPpl59Ts0St+oEo9KC8U1NmU/KAT+qiXdKB6J0GAlWCx1
 /lRvRRkdSN6vWvsiJemrYEE05fQusJ7PI1peZEGavHMf9MWh9z1DWpo7pEdiXHJgxhFx
 prTwinJtEUHjZyDECjmVR8jBuQPrXzqpv3IGbMIA2KsVs610lVdnG2THhda1SwDowfne
 Reqw==
X-Gm-Message-State: AO0yUKU8h14aiWN/V5HUtW2KsJ2cO1klgBI3sDbubOYAeIGdaTC5GtKs
 gfwdKEX3+xRl9UwEeiFz+r33+vsIDSaHX35SfkQ=
X-Google-Smtp-Source: AK7set/XxOA62KV2gMeQGSMcKE10SOP7mOtJYTRU/VVdXa8LjsOewXBOJRtnBGo/kmA5n1a1ztLpcQ==
X-Received: by 2002:a05:6808:221b:b0:365:367:7c7a with SMTP id
 bd27-20020a056808221b00b0036503677c7amr3967076oib.11.1675346295261; 
 Thu, 02 Feb 2023 05:58:15 -0800 (PST)
Received: from grind.. ([177.102.69.207]) by smtp.gmail.com with ESMTPSA id
 m24-20020a05680806d800b00377fae9d36csm6707382oih.52.2023.02.02.05.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:58:14 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 0/3] hw/riscv: handle kernel_entry high bits with 32bit
 CPUs
Date: Thu,  2 Feb 2023 10:58:07 -0300
Message-Id: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x241.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

This new version removed the translate_fn() from patch 1 because it
wasn't removing the sign-extension for pentry as we thought it would.
A more detailed explanation is given in the commit msg of patch 1.

We're now retrieving the 'lowaddr' value from load_elf_ram_sym() and
using it when we're running a 32-bit CPU. This worked with 32 bit
'virt' machine booting with the -kernel option.

If this approach doesn't work for the Xvisor use case, IMO  we should
just filter kernel_load_addr bits directly as we were doing a handful of
versions ago.

Patches are based on current riscv-to-apply.next. 

Changes from v9:
- patch 1:
  - removed the translate_fn() callback
  - return 'kernel_low' when running a 32-bit CPU
- v9 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04509.html

Daniel Henrique Barboza (3):
  hw/riscv: handle 32 bit CPUs kernel_addr in riscv_load_kernel()
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c            | 96 +++++++++++++++++++++++---------------
 hw/riscv/microchip_pfsoc.c | 12 +----
 hw/riscv/opentitan.c       |  4 +-
 hw/riscv/sifive_e.c        |  4 +-
 hw/riscv/sifive_u.c        | 12 +----
 hw/riscv/spike.c           | 14 ++----
 hw/riscv/virt.c            | 12 +----
 include/hw/riscv/boot.h    |  3 +-
 8 files changed, 76 insertions(+), 81 deletions(-)

-- 
2.39.1


