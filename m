Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB88C2D9164
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:31:06 +0100 (CET)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koblZ-0002nQ-Qk
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobk5-0001gS-Uz
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:29:33 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobk4-0002Ib-73
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:29:33 -0500
Received: by mail-wm1-x341.google.com with SMTP id 3so13728580wmg.4
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Ov3DDGUHVGdGfIFAiLziKZzpIoW+cIPp6C57lrD8sk=;
 b=or+j1uq+6MOvJEjYWsTu7eD9r1RBQgXv7hIioR6uWSTiJGFOtVpb/5AAOy4izXvlRQ
 IxnK/ZHM82h6HCIIp58v5xmnbr2nqjki/Qxyc2c0DF5yTDMhsyj/wSAa2V4NeWWfvnFC
 ZyTMl1Arqfe/glH9epXaQMD/XLS3jReGXvNKdtWzCOJJZWrZN41oAXIFiv52tFKzbsNU
 AewcX2LUAlIbKzPFxSJP5IvfEKOwU/+pNKc24lbhGrEcWAlvas5TYDOXD+RxHZ6bxbiC
 YqigwJ5pUm/nz0t/XXVtPn9otVytxSDV3SftGezjcLoWP3eDaYOl54kMsTwGHJLWIRra
 gIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4Ov3DDGUHVGdGfIFAiLziKZzpIoW+cIPp6C57lrD8sk=;
 b=Rqjn0qMV1a3+dm8qMyXFAHOo5Iq5OmKNe/k8679vY2WTZn8w/xDuuT/yguULIkhrZO
 AP20anEL7V4ex4lW3DZCKIwujaPJWJBYesG8/nOAdUcRxolOUD+AwrtM/qcDUIA63fGC
 mywC+qDv5ILOI78Uf/aujgor0xtEbWEqPLTDuEyHyKr98ewI37w9CNbMyeYgd1OrDEhh
 fVLYY51jiICiW1KUhBv6FV9b4UrvjHp1vB2jDYYkzKKdGfAjYFloP5XHVTXR/t2fybD6
 HXxFCQGDKjAbT0APGeAvDyieMzhMDVCaxEb2GNXsDlGSms5gZyJ9gC+uzmLK9EbDVSRw
 FkZg==
X-Gm-Message-State: AOAM531rFpAGImLMfyi8R3Pnix3CfnfltslAhJlpEBuQzz+fP43WnCM9
 4cHEOa4kRNpR2NkBbwLbHU3CoLhVNxw=
X-Google-Smtp-Source: ABdhPJzmZwfiOkJnV/Q7qeN6ZudGIrA0pqWqZuOMF9EBo67E6/u5vrzy0SqdDrB3oSAN6fqxovnniQ==
X-Received: by 2002:a1c:7e87:: with SMTP id
 z129mr24867006wmc.176.1607905770259; 
 Sun, 13 Dec 2020 16:29:30 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n14sm28138396wmi.1.2020.12.13.16.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:29:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/7] linux-user: Rework get_elf_hwcap() and support MIPS
 Loongson 2F/3A
Date: Mon, 14 Dec 2020 01:29:21 +0100
Message-Id: <20201214002928.343686-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Series now fully reviewed.=0D
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
Huacai Chen (1):=0D
  MAINTAINERS: chenhc@lemote.com -> chenhuacai@kernel.org=0D
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
 .mailmap             |  2 ++=0D
 MAINTAINERS          |  8 ++++----=0D
 4 files changed, 43 insertions(+), 11 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

