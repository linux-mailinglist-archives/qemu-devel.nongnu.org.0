Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA4D2D916B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:36:47 +0100 (CET)
Received: from localhost ([::1]:38192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobr4-0001le-1M
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobmm-0004tP-Sq
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:21 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobml-0003Fc-CY
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:20 -0500
Received: by mail-wr1-x443.google.com with SMTP id c5so11104338wrp.6
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQRch1XqgY6YjfjSvLdcSTDqbNcyV3L4vUo+tEuCq5U=;
 b=llvfwan1askoBlQMHQgS2ygviyO/lOVnOvQnfSsbBJj7vSrriDmF3GuW7AIvyTrfsL
 N7+rMzxyNqFXa58CivV13ITf797qx041nT2I/E7RmLvUc9rgIR76DCAbjv9T/JlFYSI/
 UzWPDZTiAw9SDioqHRjNqpHKErW+2EWef41VsOStKQSZnMVlBQUcub+w1vU25HOH0mto
 u0JlnSVGA5cUsUnTKAAFeuum2X9Jz4zDPOBTziMbMpjEetuI+65sgjvd2Ferw77KRo/Z
 4QBHZbUTLQ8N8lYu8AuGrCl94Lcn9HVPyaNGnSGvS3DRfrogP21FYyzP4XA8vLv46W78
 laIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eQRch1XqgY6YjfjSvLdcSTDqbNcyV3L4vUo+tEuCq5U=;
 b=EYxKxo+vIbFAXRiG30L3sU0qXah8+kpvg646d7ndWWcQ+JgLosX00z1M2Gyzp+/g8C
 BLYrxScHcsbLnZpv086e1M6FAlRlVQL9xCeJna0LUHX/L4HFDQmSI8SUDLe+iGh8hp0W
 pR/lMPUiH62bnAl8WK/7RkwSYtVvHdQOOUJcERhpYv1WVA0miqdGqza/kq0NpX/yZzQR
 SwTHMW3RqPjtYPxzAOqReDC+gW3tT2NzZIRfmPf7oNG01RPW9vQuYiXAY27DhQ85S+1H
 fF7/GHfZDHx5RKfjN1nJh47dHNhmRWSWKpg23vQ4rv2KYuZ+PzpWtTQuO2LIld5PduH0
 1qVg==
X-Gm-Message-State: AOAM530ie5oqUoO8Y3d5Tg04R6IjCqQmRF/cXh2Jru1Mp3k4nBSTvlPb
 aWZ9AC80FoZnNg5S0RH/gB8yvK0XW14=
X-Google-Smtp-Source: ABdhPJzGYERoI5XKVye+1MULGDSQnDx/sCQf6lAECJhPHnz5LvcNnLixtmjbvoUB9uZHjXSxmXlEUA==
X-Received: by 2002:a5d:488d:: with SMTP id g13mr25857855wrq.274.1607905937916; 
 Sun, 13 Dec 2020 16:32:17 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h14sm29945860wrx.37.2020.12.13.16.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:32:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/6] linux-user: Rework get_elf_hwcap() and support MIPS
 Loongson 2F/3A
Date: Mon, 14 Dec 2020 01:32:09 +0100
Message-Id: <20201214003215.344522-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Series now fully reviewed.=0D
=0D
Since v5:=0D
- Dropped MAINTAINERS patch =3D)=0D
=0D
Since v4:=0D
- Fixed yet another typo...=0D
=0D
Since v3:=0D
- Add CP0C0_AR_LENGTH definition (Richard)=0D
- Fixed 3E -> 3A, Longsoon -> Loongson typos (Huacai)=0D
=0D
Since v2:=0D
- Use extract32() in GET_FEATURE_REG_EQU (rth)=0D
=0D
Introduce the GET_FEATURE_REG_SET() and GET_FEATURE_REG_EQU()=0D
macros to check if an instruction set is supported by a CPU=0D
using CP0 read-only bits (instead of QEMU insn_flags which=0D
is not always coherent - we might remove it soon).=0D
=0D
Use these macros to test for MSA ASE and Release 6.=0D
=0D
Update the ELF HWCAP bits and set the Loongson instructions=0D
so we can run 2F/3A userland binaries.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  linux-user/elfload: Move GET_FEATURE macro out of get_elf_hwcap() body=0D
  linux-user/elfload: Rename MIPS GET_FEATURE() as GET_FEATURE_INSN()=0D
  linux-user/elfload: Introduce MIPS GET_FEATURE_REG_SET() macro=0D
  linux-user/elfload: Introduce MIPS GET_FEATURE_REG_EQU() macro=0D
  linux-user/elfload: Update HWCAP bits from linux 5.7=0D
  linux-user: Add support for MIPS Loongson 2F/3A=0D
=0D
 target/mips/cpu.h    |  1 +=0D
 linux-user/elfload.c | 43 ++++++++++++++++++++++++++++++++++++-------=0D
 2 files changed, 37 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

