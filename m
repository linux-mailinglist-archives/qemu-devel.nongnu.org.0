Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4D32D1D9E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:45:25 +0100 (CET)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmPG0-0005KU-ED
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEM-0004JR-Ca
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:43:42 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:35425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEK-0004Xg-2s
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:43:42 -0500
Received: by mail-ed1-x542.google.com with SMTP id u19so15565201edx.2
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mf1Wa9KDa2VUvjT5m3UpRlECGfdLuvfBq6zDpItkeSs=;
 b=L2K/0gPBQxH3HuLUYWHP6q8zMd0+O2I37qLBsC7L9m6WajqCQ2xTZ7o1KpFwIgGnOa
 popgBnR74K7dg0FknaieZBdxRz25Cn1ZvMZhQn9gARjQVhQUWVWVzDD8p7eN8Y0F2m8P
 JDR2OuETyN/wepEu8AKXcVTDG+50C/AwY7Mb5jKaN5SCXj3uXM4hIwDnky9utsMWdCz2
 l07mdzk3fR5mhfgjMsWwViN4okVtaM6frbVubIQUGUmvQqR2LXBoCSbsxCWWLCnTFvqu
 zXeSEdNeLMUJWopHEaNQ+pxE2+PT+sPYNLNDcuFmVTTkEpnZpFyKbF4ixJYVAcGr2DGA
 oKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Mf1Wa9KDa2VUvjT5m3UpRlECGfdLuvfBq6zDpItkeSs=;
 b=tvZ8Jj0Fct0HUaJuSu3tQ2bjkKiTXruH76ULZ+Eb3JiIJjJleNrjVxU16ldP5CZXBG
 3eIYE+b0yrhZhyEG9u2h7U8YUIxpfKZ4lupU059yXU41UiLMDClGRQdDmy9kXQOUTSIr
 M3vYtJYfW98K0yy/6Bs3/LpxY3id7qe/+ksgjeNpQyzud4WKz+7735hvMF2dLE88BlP3
 WR9ZioQljBPnNoDqD799dbA6yuDsI/xSHY36292x5EDcY20zIMiAFamtSnYlS7CG7TcJ
 pOU67YjOgeetdEaO1Cpr1BZZd07I8vyR7oWrEiClg2xdgAaas3sJUpPLVuklLokQ5CZR
 uLaQ==
X-Gm-Message-State: AOAM533TF4GinKpnfSmgCcAxu/rAtAbjs+W+5FwLkn9Iwp0mYC+9zER/
 JrXqPeheFn+2Se3tISJ/Dhc+OwozRtU=
X-Google-Smtp-Source: ABdhPJy+TBll84JJMSI8VYgiveJMKqJHK8YQUPvwlw08zttL0Z07LEzXld9diMF4RlPDPaL8N+qeGg==
X-Received: by 2002:aa7:dc4b:: with SMTP id g11mr22894253edu.379.1607381018313; 
 Mon, 07 Dec 2020 14:43:38 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i2sm15061843edk.93.2020.12.07.14.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:43:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] linux-user: Rework get_elf_hwcap() and support MIPS
 Loongson 2F/3A
Date: Mon,  7 Dec 2020 23:43:29 +0100
Message-Id: <20201207224335.4030582-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Series now fully reviewed.=0D
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
Supersedes: <20201201192807.1094919-1-f4bug@amsat.org>=0D
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

