Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB06E3C1892
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:42:47 +0200 (CEST)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Y2w-000163-SX
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTJ-0005YW-4T
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:05:57 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTG-0007r6-UO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:05:56 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a13so8388049wrf.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=avqZU2zaRHYwDaI+nphWFrRDm2l36KerUnCAuDOkKSo=;
 b=LgP3vVNz5LyLcd056vdtAlqgEoSXN4R5rOl9rTBfcCNhxZ2vLsYbx/x7aUliTzozO8
 E5xsXnMr7JPO4sflgKiqpk3olIpdqhLkgchcAZOw5ug6CKPlbGfAr5FP82noHwAhTDr8
 XxQGVyEAahxjoOwP9VPJ3ioaSEQbu3L1SM7dDV2rusTMlOtiB4L5NUKg+oudeaC3P0j2
 mbCBbGMS+KnTAeL9K+QoKs+rSANUz6P613OmI3CDouayJ1Ch/y+Y4lP7pAXYxN2BZS0Q
 nhCvMLYZe2RabYLyyMEuNnjIv0o0ht9sEQ1gPxuiQpGslrGgZdaIg/8U96ZiCI24hEfT
 AofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=avqZU2zaRHYwDaI+nphWFrRDm2l36KerUnCAuDOkKSo=;
 b=JXrk4/weOm6PP23yquwZMnUvpYDUs/8SDwSne410MRjl+iJw+QtMMVL+Lif52mKeVa
 qbaVrtSMYvY7SpU8+nnjGECyoa6+3fwzEjQfklZfTfaNkZUAYjovSN+CwNSa30VN6fJH
 g7wD9b11F0Ix5/gQqoVFvaZhhN99OiUJaOwgnnjXCIdAFIIh64SlYqD4p+9w9T808/nW
 gmbLjhTHXDPTQAlH7C+sLUYQvIgk+7QRG5Zbq122/AB2KsUGaGnACem4kj/OcJG+oVlT
 pKFKFUfB0YDPbm+5Hd0JzIO7/k+Bw9jC4tjortKiMrjphCemhH1Er90+36g+X6HEj+3T
 7yiA==
X-Gm-Message-State: AOAM5339v0H5Iga4ovFY0tmvzATUQO/spXt1uutaSRoyZCeR3dufelJj
 WN/+AH1iz8yc0C1FTvtDwnigs2j2xQI=
X-Google-Smtp-Source: ABdhPJwYkwQdQJDtY6GMbHhLWZw6hhlEUOm6F5o0Y4h426TL6uwxp6elKiOpviMipqPH/sMzq3FzxA==
X-Received: by 2002:a05:6000:1ac6:: with SMTP id
 i6mr31570309wry.327.1625763952823; 
 Thu, 08 Jul 2021 10:05:52 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h10sm5021852wmb.46.2021.07.08.10.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:05:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] linux-user: target <-> host errno conversion code
 refactor
Date: Thu,  8 Jul 2021 19:05:42 +0200
Message-Id: <20210708170550.1846343-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series extract code related to target errno conversion=0D
(to/from host) into a separate header.=0D
=0D
Since v2:=0D
- addressed Richard / Laurent review comments=0D
Since v1:=0D
- addressed Taylor / Richard / Laurent review comments=0D
=0D
Based-on: <20210708100756.212085-1-laurent@vivier.eu>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  linux-user/syscall: Fix RF-kill errno (typo in ERFKILL)=0D
  linux-user/sparc: Rename target_errno.h -> target_errno_defs.h=0D
  linux-user: Extract target errno to 'target_errno_defs.h'=0D
  linux-user/alpha: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user/hppa: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user/mips: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user: Simplify host <-> target errno conversion using macros=0D
  linux-user/syscall: Remove ERRNO_TABLE_SIZE check=0D
=0D
 linux-user/aarch64/target_errno_defs.h        |   7 +=0D
 linux-user/alpha/target_errno_defs.h          | 204 ++++++++++++++++=0D
 linux-user/alpha/target_syscall.h             | 194 ---------------=0D
 linux-user/arm/target_errno_defs.h            |   7 +=0D
 linux-user/cris/target_errno_defs.h           |   7 +=0D
 .../target_errno_defs.h}                      |   4 +-=0D
 linux-user/hexagon/target_errno_defs.h        |   7 +=0D
 linux-user/hppa/target_errno_defs.h           | 220 +++++++++++++++++=0D
 linux-user/hppa/target_syscall.h              | 210 -----------------=0D
 linux-user/i386/target_errno_defs.h           |   7 +=0D
 linux-user/m68k/target_errno_defs.h           |   7 +=0D
 linux-user/microblaze/target_errno_defs.h     |   7 +=0D
 linux-user/mips/target_errno_defs.h           | 221 ++++++++++++++++++=0D
 linux-user/mips/target_syscall.h              | 211 -----------------=0D
 linux-user/mips64/target_errno_defs.h         |  10 +=0D
 linux-user/mips64/target_syscall.h            | 211 -----------------=0D
 linux-user/nios2/target_errno_defs.h          |   7 +=0D
 linux-user/openrisc/target_errno_defs.h       |   7 +=0D
 linux-user/ppc/target_errno_defs.h            |   7 +=0D
 linux-user/riscv/target_errno_defs.h          |   7 +=0D
 linux-user/s390x/target_errno_defs.h          |   7 +=0D
 linux-user/sh4/target_errno_defs.h            |   7 +=0D
 .../{target_errno.h =3D> target_errno_defs.h}   |  11 +-=0D
 linux-user/sparc/target_syscall.h             |   2 -=0D
 linux-user/syscall_defs.h                     |   2 +-=0D
 linux-user/x86_64/target_errno_defs.h         |   7 +=0D
 linux-user/xtensa/target_errno_defs.h         |   7 +=0D
 linux-user/syscall.c                          | 164 ++-----------=0D
 linux-user/errnos.c.inc                       | 140 +++++++++++=0D
 linux-user/safe-syscall.S                     |   2 +-=0D
 30 files changed, 926 insertions(+), 985 deletions(-)=0D
 create mode 100644 linux-user/aarch64/target_errno_defs.h=0D
 create mode 100644 linux-user/alpha/target_errno_defs.h=0D
 create mode 100644 linux-user/arm/target_errno_defs.h=0D
 create mode 100644 linux-user/cris/target_errno_defs.h=0D
 rename linux-user/{errno_defs.h =3D> generic/target_errno_defs.h} (99%)=0D
 create mode 100644 linux-user/hexagon/target_errno_defs.h=0D
 create mode 100644 linux-user/hppa/target_errno_defs.h=0D
 create mode 100644 linux-user/i386/target_errno_defs.h=0D
 create mode 100644 linux-user/m68k/target_errno_defs.h=0D
 create mode 100644 linux-user/microblaze/target_errno_defs.h=0D
 create mode 100644 linux-user/mips/target_errno_defs.h=0D
 create mode 100644 linux-user/mips64/target_errno_defs.h=0D
 create mode 100644 linux-user/nios2/target_errno_defs.h=0D
 create mode 100644 linux-user/openrisc/target_errno_defs.h=0D
 create mode 100644 linux-user/ppc/target_errno_defs.h=0D
 create mode 100644 linux-user/riscv/target_errno_defs.h=0D
 create mode 100644 linux-user/s390x/target_errno_defs.h=0D
 create mode 100644 linux-user/sh4/target_errno_defs.h=0D
 rename linux-user/sparc/{target_errno.h =3D> target_errno_defs.h} (97%)=0D
 create mode 100644 linux-user/x86_64/target_errno_defs.h=0D
 create mode 100644 linux-user/xtensa/target_errno_defs.h=0D
 create mode 100644 linux-user/errnos.c.inc=0D
=0D
-- =0D
2.31.1=0D
=0D

