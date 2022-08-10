Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A763458F2D4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 21:12:23 +0200 (CEST)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLr7u-0006jj-Q8
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 15:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqih-0005nS-HR
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:46:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqif-0007GA-ST
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:46:19 -0400
Received: by mail-wr1-x429.google.com with SMTP id l22so18743827wrz.7
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 11:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=nszYKA+Wn9xuhz+k0iviOE+oX3YA6MMJGPbw9qg4mUQ=;
 b=D+bGATHkhF0dkAypX0Wg/9uVqtvaAxsfK7oJ/WhaffXKsIURPk7G5ewlN1qcL0BBo2
 1/x6nejFPw/rCqBa8wDh5LLlcakLthHfkRW4G7QlD29WM6gPFv3GORqvkBN2Do9heGur
 TKQgsrK5ZIimSUT8Uq04k3eXU+f9bzIMMSVBqVy5ncvFGArVKWH57Ds5dl8z4Mm789PP
 s/6hHPDXnJPkZpCErscRolu48YQDO42BF7aoZv3ZbW+XIcS50lQOJKgLHjy2ltYlNSOY
 PxoXeX2GglLqm3joFlCx05vDatlQ5t0OU18NleoH+o1wTOKpxdjbLGUcVL6prcdyGEys
 WP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=nszYKA+Wn9xuhz+k0iviOE+oX3YA6MMJGPbw9qg4mUQ=;
 b=M+ZP5CvdEM+myTYc1UgJKglg1x12IPWbjKMnNcxlKh7AzcuhQV5bcwyGJc20IMdTaV
 KFlCvy6hExIIBFfs+1NBqYNIJLeT5lde/z5Q2k2PVEAXUP31pAJ+VvWqBffOqC5Jsj43
 ls05Iv96eIALuNc7TGqvk2KUPpC6nQN2eFv9s7QS2yVARINQyl9OaQBjt0OzLCPuEj5B
 iBEyJ2ScTjmzsUCaC597DJKtOzDsKKQExfka/Fbv6yapzOQOYs1fwrMOe5LM5eJIys8i
 YyYHWunnzMADsXX1x6OJV5Kx5iTB/yhyu4W+NLWuQxB+XFCMeSlCQQuviU2Kv3o1K6uN
 991g==
X-Gm-Message-State: ACgBeo0mL/sPDhn5wKAqsvlxvPwk4ggfEnlqV7qPONYb/ZX7ZSPwO/Ie
 HAmS0muUfNemmPdT9n1AbjuIDA==
X-Google-Smtp-Source: AA6agR4lftJ4rR1enjLROy20IwJTTV2mtwSG+GS7NWTbpXZhAG1kqQkAn8L7RaD16xE75EHUvj0Sng==
X-Received: by 2002:a05:6000:987:b0:221:7e59:45ec with SMTP id
 by7-20020a056000098700b002217e5945ecmr13407125wrb.64.1660157175809; 
 Wed, 10 Aug 2022 11:46:15 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 11:46:15 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/4] QEMU: Fix RISC-V virt & spike machines' dtbs
Date: Wed, 10 Aug 2022 19:46:08 +0100
Message-Id: <20220810184612.157317-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Conor Dooley <conor.dooley@microchip.com>

The device trees produced automatically for the virt and spike machines
fail dt-validate on several grounds. Some of these need to be fixed in
the linux kernel's dt-bindings, but others are caused by bugs in QEMU.

I mostly opted for what appeared to be the smallest change that would
fix the warnings, partly due to my inexperience with the QEMU codebase.
A "sister" patchset for the kernel will clear the remaining warnings.
Thanks to Rob Herring for reporting these issues [1],
Conor.

Changes since v2:
- move the syscon subnodes back to the top level instead of into the
  syscon node
Changes since v1:
- drop patch 1

To reproduce the errors:
./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
(The processed schema needs to be generated first)

0 - https://lore.kernel.org/linux-riscv/20220805162844.1554247-1-mail@conchuod.ie/
1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/

Conor Dooley (4):
  hw/riscv: virt: fix uart node name
  hw/riscv: virt: fix the plic's address cells
  hw/riscv: virt: fix syscon subnode paths
  hw/core: fix platform bus node name

 hw/core/sysbus-fdt.c    | 2 +-
 hw/riscv/virt.c         | 8 +++++---
 include/hw/riscv/virt.h | 1 +
 3 files changed, 7 insertions(+), 4 deletions(-)


base-commit: 2480f3bbd03814b0651a1f74959f5c6631ee5819
-- 
2.37.1


