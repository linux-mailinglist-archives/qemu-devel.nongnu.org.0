Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451F766870C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 23:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG69z-00008u-Su; Thu, 12 Jan 2023 17:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pG69y-00008G-3j
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 17:34:58 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pG69v-0008IJ-Ki
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 17:34:57 -0500
Received: by mail-oo1-xc44.google.com with SMTP id
 187-20020a4a09c4000000b004d8f3cb09f5so5171899ooa.6
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 14:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OE84YYKjoFuqo0u9NWqw6q7gCrIwMHdGUeaSVIGT2ls=;
 b=CviH951q7QV7L4hrftd9zhLpv571+bGcqypr6RtQpfbeVP+dXSbzW7xFTlq5HHvMC+
 9EmdW9DidyO6/IkcV32Sev7WcZ6NPYn1FADmYtP9hfSPisC57mzMbAPld6mQT2k9A4SP
 iQIc8pQIgPo5370RgCw2rJTxreALMZWtGc4V/1dXwOjfC8M6BOZTwqaia/fVHS8pAP0c
 XNPPdLHsj4knvKu1e2SgOvEAsh+Z6XzfIdwWXL8aI6RcIZhS73O/1DWIeyMs+0rECkU5
 MCPUCxNzr2LtzZHRpt2eqICaWIV80Chfvga3bIC1UJeinuA00Gjc8Qz8PmmeoW7q/iEg
 YcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OE84YYKjoFuqo0u9NWqw6q7gCrIwMHdGUeaSVIGT2ls=;
 b=h/kHYmZCJrnWofxjvV+O093WUVGC+iYYXLtVg/uK+enx+RobV2FVSDyFS7/uxT32W0
 HMZogouN0kWsTtfDi+7L3UHuah4b+M6hNQ5+kdIf2975D2EXw4dWpgEirLqJEZGBBABj
 kdbYznMul64oITs6RyM24WiA7bDoG5FJD04R+3FCS5SN5hkaBZOPhOO/+mO1zfoCmsaa
 EzpAJVUl8BOWrsW+jDaI80tv/j/8UVunNLCnAgP6QXWsgHa93RHw+kStOKAmAvtY9oOK
 50UB3DxIgZVjc8j3+HaFFMu9IxJYRylF8zJ39DyCnuZ/RgwT7yHIcvYJvJbktVU7sOi9
 X8TQ==
X-Gm-Message-State: AFqh2krsq4tWvbMROGUEAeWjhMNd+O5LNXEPFzdj3WwR/bKpmVL3NEq0
 uHewohAiElQbghNJIGv8TOAjGFiXDu5CX19etHk=
X-Google-Smtp-Source: AMrXdXsjqmveLeam8IXE5jHe5PlwxIQRUAG9R7bCFW7i3BvJa73ql1Uz4gY6n3md5rDhiA0AEvXOhA==
X-Received: by 2002:a4a:97b1:0:b0:49f:dba7:5e65 with SMTP id
 w46-20020a4a97b1000000b0049fdba75e65mr31872147ooi.3.1673562891394; 
 Thu, 12 Jan 2023 14:34:51 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 h4-20020a4a9404000000b004a532a32408sm8946830ooi.16.2023.01.12.14.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 14:34:50 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 0/2] hw/riscv: consolidate kernel init in
 riscv_load_kernel()
Date: Thu, 12 Jan 2023 19:34:42 -0300
Message-Id: <20230112223444.484879-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc44.google.com
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

These are the 2 remaining patches, patches 10 and 11, of:

"[PATCH v5 00/11] riscv: OpenSBI boot test and cleanups"

The first 9 patches are already available in riscv-to-apply.next. 

The only change made was in patch 10 where we're now handling the case
where load_elf_ram_sym is padding the resulting kernel_entry with 1s for
32 bits. Patch 11 is unchanged.

Changes from v5:
- former patches 1-9: already pushed to riscv-to-apply.next
- patch 10:
  - added an 'is_32bit' flag in riscv_load_kernel(). Use it to eliminate the
  sign-extension from load_elf() if we're running a 32-bit guest.
v5 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00051.html

Daniel Henrique Barboza (2):
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c            | 98 ++++++++++++++++++++++++--------------
 hw/riscv/microchip_pfsoc.c | 12 +----
 hw/riscv/opentitan.c       |  3 +-
 hw/riscv/sifive_e.c        |  4 +-
 hw/riscv/sifive_u.c        | 13 ++---
 hw/riscv/spike.c           | 10 +---
 hw/riscv/virt.c            | 13 ++---
 include/hw/riscv/boot.h    |  3 +-
 8 files changed, 77 insertions(+), 79 deletions(-)

-- 
2.39.0


