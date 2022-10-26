Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC7D60E8EE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:23:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlvH-0008Ar-FF; Wed, 26 Oct 2022 15:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onlvE-00089g-4g
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:18:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onlv6-00022q-Da
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:18:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y16so17627906wrt.12
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zZ7vlB5G4gE9+icHVq6Fuskp82aBSH1yxuuRzo1DuC4=;
 b=QsuL1CZq25P/ZzPvZdxwJmOq8tiEpePohzz/upKYLpT36Ud33Z6Ip7K4+1RzEEn7uX
 1O6wtvNJMNx5l3NO/H6/mnq50XT18ofMDAueQoQVsbxPtFMLzLWmodNnnczZrdILdCGt
 gBr2DmE3q+PiL/Iuwm4d39ht3hrqNxPqegB4nMGhwhBUfkocsmZWkRZVwmMy/Sh7GFhu
 AaI/6zJgX6Zpo+v2cZTz5v9lwYQrZplK029htWlqHvDaNUBnfOUioKgoVTwtO42rgEIJ
 yBZnhfU2A61JY/yHKtjnGCL1S5IGoDt8d9/aMxJ0YhuhmLpv/VZAIOGQTfU1OxlANtnj
 Mm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zZ7vlB5G4gE9+icHVq6Fuskp82aBSH1yxuuRzo1DuC4=;
 b=kU4qlFr/7/amRRcemYfXwvbRGzg0VHloeR8QWfgb2hwHm4xtEeaUgrs42UzKop5u/0
 dq07fesbEm1a0aO6QkTkXXLIHeZ+vr9leP3PJ3kc3BxmJb5OAdfg597hQFN6WSa689Ss
 Y8prLUUVEwc463oQXD3Nk9M1tDi0oH4CmtqzWQvTu7lDPzbpRUIGoTYHcfM8VsbnMECm
 RU+/Zzckx32E11ppjCu2yLeAAeZoMpI2Vc7QGL7cD34+HSAzOwbQpPoyfd96VO1bgBW/
 SAhX75NqmVrbfYv7YuDeUJNXsFbjqtzG0wmRG6grxtIMfzCmNXcx4qFIf1JF+ms1VNbr
 ozLw==
X-Gm-Message-State: ACrzQf1nOHm5A03/q8Grea7IN+fql5LqEVhe5mbGSob1CfGVTywpmP+Q
 6fwOacQ09Gtg86E4FMFIlLtIV1gjgkZ2WbbM
X-Google-Smtp-Source: AMsMyM7o44+t0R5KHr+rfOdTbE0KhY+RPEYSvkpyk2qAy4/jFSuYt3chMR1413IT0YNsRquzv+Mtng==
X-Received: by 2002:a5d:59af:0:b0:236:6b90:1e65 with SMTP id
 p15-20020a5d59af000000b002366b901e65mr13352581wrr.362.1666811903983; 
 Wed, 26 Oct 2022 12:18:23 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bp4-20020a5d5a84000000b0022e57e66824sm7496407wrb.99.2022.10.26.12.18.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 26 Oct 2022 12:18:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v4 0/3] MIPS Bootloader helper
Date: Wed, 26 Oct 2022 21:18:18 +0200
Message-Id: <20221026191821.28167-1-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This is a respin of Jiaxun v3 [1] addressing the semihosting review
comment [2].

[1] https://lore.kernel.org/qemu-devel/20210127065424.114125-1-jiaxun.yang@flygoat.com/
[2] https://lore.kernel.org/qemu-devel/5a22bbe1-5023-6fc3-a41b-8d72ec2bb4a1@flygoat.com/

*** BLURB HERE ***

Jiaxun Yang (2):
  hw/mips: Use bl_gen_kernel_jump to generate bootloaders
  hw/mips/malta: Use bootloader helper to set BAR registers

Philippe Mathieu-Daudé (1):
  hw/mips/bootloader: Allow bl_gen_jump_kernel to optionally set
    register

 hw/mips/bootloader.c         |  28 ++++++--
 hw/mips/boston.c             |   5 +-
 hw/mips/fuloong2e.c          |   8 ++-
 hw/mips/malta.c              | 122 ++++++++++++++---------------------
 include/hw/mips/bootloader.h |   8 ++-
 5 files changed, 86 insertions(+), 85 deletions(-)

-- 
2.37.3


