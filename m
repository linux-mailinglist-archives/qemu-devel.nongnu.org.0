Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3597067CCCE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 14:53:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL2g7-0003dE-IP; Thu, 26 Jan 2023 08:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pL2g1-0003c3-SL
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 08:52:31 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pL2fz-00043E-9a
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 08:52:28 -0500
Received: by mail-ot1-x343.google.com with SMTP id
 x21-20020a056830245500b006865ccca77aso801687otr.11
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d1knL1PmLCMTfdnT7lvIVkkfe7oOtwmHZaVkSwNWmqw=;
 b=QitkWlK1WurRhOImB4F+o4hbcghU1t9PZuTGbiFZV/sOD5OSZKTtSnjR2Zc0QGX7dx
 GDc3EsjvifediunAkPanKvDNg//XLRkU8prHpyGy7sGu2GxaP+wo1kZzRlYBDtekpUuC
 48XTiJD+VgNY5g2dKFJUWE9lJg05cTRicd8xBF+Oq+nOoAepxUgKMVZStifalXvM50TA
 6R13aFbCv06T1hmoN8K1Wt3feV9jsKeblplIWMIzIwD1aBFQcjGYEtuOem4wGR4jCaC6
 0nceJHt3EF+j+/gutG+KPQhkigQML6gjo/t43JI7NN1nCvEK2B8C1jGAse5TgVuG/hXZ
 2S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d1knL1PmLCMTfdnT7lvIVkkfe7oOtwmHZaVkSwNWmqw=;
 b=w9rXDkD6NqvowY3eQ5//T1yIZnCyVW98sShUUmLzVOKqSPVO1gGkNiZZ7zpPYnYTP7
 BRigfHjyMAcgIrdsc+OJCwumdFeYAwoyLf77R4NQs9HGxwaQa8VHmEs9mLWG7WqSPd6/
 sb9I2J+lc8VawstFLVDY5rxuQRWyJrIGvhyd4BCmN13NOBE+SZq8N1Ko+gYWzvJ8ufJX
 p/+l6fEGQZ/VEveShVPdTLOGXwhwPwJ8+XZoNWjEn2iBa0l+ILa8dFWg1X/W6IxQcQs+
 hEF5AsDjYbcis6MpChlTef8DAlY9CCUMNRcMqVQVWao8zHkRYo/hov746twewf0Vtyz4
 IkkA==
X-Gm-Message-State: AFqh2kqXDmNp3PSNMzvYWptvX16HN67vlh9K9kGrw98I8stQhLXFR91M
 x89a0Vj7/HTle1imcvnvS6Jz3cZRlo4f2u1EqPw=
X-Google-Smtp-Source: AMrXdXuhkf7F4ATl6Y3nqZlQ3OXKc60D0jpBgIRVz5DMWIzI9FXv58cOL6rtU+gcBcLD4ORL8dfXdw==
X-Received: by 2002:a9d:12a4:0:b0:686:628b:a9d9 with SMTP id
 g33-20020a9d12a4000000b00686628ba9d9mr14103789otg.14.1674741145416; 
 Thu, 26 Jan 2023 05:52:25 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 w19-20020a9d77d3000000b00661b46cc26bsm496323otl.9.2023.01.26.05.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 05:52:24 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 0/3] riscv_load_fdt() semantics change
Date: Thu, 26 Jan 2023 10:52:16 -0300
Message-Id: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x343.google.com
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

After discussions in the previous version, where we ended up discovering
the details of why the current riscv_load_fdt() works with the Microchip
Icicle Kit board almost by accident, I decided to change how
riscv_compute_fdt_addr() (the FDT address calculation from
riscv_load_fdt()) operates. 

Instead of relying on premises that the Icicle Kit board can't hold
right from start, since dram_base + mem_size will never be contained in
a contiguous RAM area, change the FDT address calculation to also
receive the bondaries of the DRAM block that the board guarantees that
it's not sparse. With this extra information we're able to make a more
consistent FDT address calculation that will cover all existing cases we
have today.


Changes from v3:
- patch 3:
  - function to handle Icicle Kit FDT separately: discarded
  - change riscv_compute_fdt_addr() to clearly handle cases like the
    Icicle Kit board where not all RAM is contiguous
- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04464.html

Daniel Henrique Barboza (3):
  hw/riscv/boot.c: calculate fdt size after fdt_pack()
  hw/riscv: split fdt address calculation from fdt load
  hw/riscv: change riscv_compute_fdt_addr() semantics

 hw/riscv/boot.c            | 56 +++++++++++++++++++++++++++++++-------
 hw/riscv/microchip_pfsoc.c |  7 +++--
 hw/riscv/sifive_u.c        |  8 ++++--
 hw/riscv/spike.c           |  7 +++--
 hw/riscv/virt.c            |  8 ++++--
 include/hw/riscv/boot.h    |  4 ++-
 6 files changed, 68 insertions(+), 22 deletions(-)

-- 
2.39.1


