Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B946514A8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 22:12:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7NPI-0002sU-D9; Mon, 19 Dec 2022 16:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPG-0002rV-31
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:10:42 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPD-0003sa-EC
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 16:10:41 -0500
Received: by mail-ed1-x533.google.com with SMTP id i15so14801736edf.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zh2BhjGyR+505UTOkbHhlLSYmk781PI1Kr+7wOMQdrY=;
 b=h2QSNvj4t9GE6VAVfl5inolgOCKTDTHJcUCqJvm54c8j0JFgzZG+GIBeIMPLYdhsdG
 j9jzPlHosAgwlFwAyqNSDsIKc/FDUfE7kUcWnvcYQD5lxQheHi6NgV/w5hIjbEShcrd3
 +uQVIdCEkBMq95h4ctj6GoHS39ppeoYRi40ncl6bHXC0GMdXdD1h12LFdq6ADv8Awk67
 WxW/1DOcN4yxrXTb12LjcuDt/3JF7VzbeTQ8Htd0LI2F5aCcU6Q3bsVTL2EH85nAnEsW
 nPiEX10O+9fc9uW0Acl+ZFfjAYo5IdWUCmqqRyqX/Jsxn+z//w9Ant6vc4GW8CgePFIs
 dRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zh2BhjGyR+505UTOkbHhlLSYmk781PI1Kr+7wOMQdrY=;
 b=rnG8clfxpJ3LYNpn27+2gtOv/dxPBAAOS5dMP3Tp9/c83Z0oTy1W2JOpjn+XyZKEfU
 gG6DcCVWoS/PJbG+1kTY2awUpAWwwwJb+rQjsmF6kLK2NmUpuEHZAvwOVlKni6AfQoNH
 +KdFhRLSnUuHaErxsFHQu84XYhTsiydrytmUCPIxBi7Y9FQVOawhHNQLGn/lG4Md8zkf
 K0sLdvaXtBDL7j3X/FXUo3JO6hCRxJx4FZO6s0bOPZdoJfBchPBUhpj1SEbEYf66imgS
 9fUFI0TTav8Y4drr3E8nhEjDDq5HSSLp5M2J94LMthcpKkTzvvFSIa0yHl+Q/BRweGhY
 VRVQ==
X-Gm-Message-State: ANoB5pnp3iUNmTBPsuotAv81R0jEhAG4yLB2ozofCujnn21NzVje/ld2
 9onOW2556cavPS84F58N7tWDChwFr0WVW88L19E=
X-Google-Smtp-Source: AA0mqf6OHznNQAEiAXbvwVFPt0qmUkTOfm1DoNftJ2U3d4ZxsbRNBzYvEgA8wVS+po5Mbp9z+g0bWA==
X-Received: by 2002:aa7:d403:0:b0:470:31fb:cdcc with SMTP id
 z3-20020aa7d403000000b0047031fbcdccmr24958380edq.6.1671484237462; 
 Mon, 19 Dec 2022 13:10:37 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 eg53-20020a05640228b500b0044dbecdcd29sm4843803edb.12.2022.12.19.13.10.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 13:10:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PATCH 0/4] target: Restrict 'qapi-commands-machine.h' to system
 emulation
Date: Mon, 19 Dec 2022 22:10:30 +0100
Message-Id: <20221219211034.70491-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
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

The "qapi-commands-machine.h" header is not generated in user-only
emulation. This series removes its use in user-emu code by moving
the QMP code depending on this header into a separate sysemu unit.

Philippe Mathieu-Daudé (4):
  target/arm: Restrict 'qapi-commands-machine.h' to system emulation
  target/loongarch: Restrict 'qapi-commands-machine.h' to system
    emulation
  target/mips: Restrict 'qapi-commands-machine.h' to system emulation
  target/ppc: Restrict 'qapi-commands-machine.h' to system emulation

 target/arm/helper.c            | 29 --------------------
 target/arm/m_helper.c          |  1 -
 target/arm/monitor.c           | 28 +++++++++++++++++++
 target/loongarch/cpu-monitor.c | 37 +++++++++++++++++++++++++
 target/loongarch/cpu.c         | 27 ------------------
 target/loongarch/meson.build   |  1 +
 target/mips/cpu.c              | 29 --------------------
 target/mips/sysemu/meson.build |  1 +
 target/mips/sysemu/monitor.c   | 39 ++++++++++++++++++++++++++
 target/ppc/cpu-qom.h           |  2 ++
 target/ppc/cpu_init.c          | 48 +-------------------------------
 target/ppc/monitor.c           | 50 +++++++++++++++++++++++++++++++++-
 12 files changed, 158 insertions(+), 134 deletions(-)
 create mode 100644 target/loongarch/cpu-monitor.c
 create mode 100644 target/mips/sysemu/monitor.c

-- 
2.38.1


