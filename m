Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1963C14E7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:13:57 +0200 (CEST)
Received: from localhost ([::1]:50176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Umq-0002vN-6m
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1UkU-0000Mw-6B
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:11:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1UkS-0002VF-8Y
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:11:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id g10so4198873wmh.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Zkkmcw1+gnJkf0Tef+58w/DhlDxaYJwg0AfOkSpF00=;
 b=i3SdAIrKB/UAM/Z5zaobCoCJkKZ04spqbtXxjyLR60FMaBn4bQv2WXF8zlLDVDjx89
 vRAcPmWbMbxLT3J1jzcfoB2t/4Y1NMuU8Et+h3yx7v44Si0p1xZcCQ8yTkV+2fE/bgKv
 5LOXqMR5nMFPDBM1BtOeI8m/b68GbdFu/moApztEuWg9L5eSSz79yQXc+L4hmSQQeVsq
 b/jPwqyyWtaVj+pE2M9Twz755n1oXsJgByBeK2QIhPLDuXD8URqUmv33IBMTb0dDz8Gg
 QiYx8InHw3D8jPP6jZKAZmeu7ceBh3h00sG/8Yme92j81NlYq/fUwPYYk+00orHpAvEb
 gkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2Zkkmcw1+gnJkf0Tef+58w/DhlDxaYJwg0AfOkSpF00=;
 b=t0gAfcKrJi6KW7o5K8cWbNo/HEtUctokDEb6lbDuHujpODxRZUmsa8s7Eij1S0Das0
 L1YOOSk9+9BdRShUjb6lDjJkbPxyAjteyZqc6RRtwjwYAPuXvxf6jDrv+sW4GK48PJRB
 fwdS1t1sfgJoPVCta2smNMkgFIk/qrFz+paWlbYbeQYtG+SagZ9kHnYA+BMGWRrgXiN+
 YwpbTR1fYPfkOH9BtfPf5xghB793vxuue+VgVXPne4kIDIlzH9tgnCSTXmOv9n4o9u7J
 VvB8tMe8vdD4sgAftPTqUAHMPA5SA7r5u01vRbPk/R+of7AEuKiWn+eDM66K6T3AiHSK
 ysWA==
X-Gm-Message-State: AOAM532vbb0jPruv/lm79HqrkYeIaOAvhV08hjKceGNmRybKqXSTNVvC
 uMAA06f6I323o+JuEefOD/3hHVfHQcc=
X-Google-Smtp-Source: ABdhPJxbDljv5BGn0XUmPO4uzyAgBd+e0C2h5h2GYz9DFE0H976MA59NeS0/eLBQGhkodxPtscqX6Q==
X-Received: by 2002:a1c:a704:: with SMTP id q4mr33095669wme.112.1625753482883; 
 Thu, 08 Jul 2021 07:11:22 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l20sm2195225wmq.3.2021.07.08.07.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:11:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] linux-user: target <-> host errno conversion code
 refactor
Date: Thu,  8 Jul 2021 16:11:13 +0200
Message-Id: <20210708141121.1731691-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series extract code related to target errno conversion=0D
(to/from host) into a separate header.=0D
=0D
Since v1:=0D
- addressed Taylor / Richard / Laurent review comments=0D
=0D
Supersedes: <20210704183755.655002-1-f4bug@amsat.org>=0D
Based-on: <20210708100756.212085-1-laurent@vivier.eu>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  linux-user/syscall: Fix RF-kill errno (typo in ERFKILL)=0D
  linux-user/sparc: Rename target_errno.h -> target_errno_defs.h=0D
  linux-user: Extract target errno to 'target_errno_defs.h'=0D
  linux-user/alpha: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user/hppa: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user/mips: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user/syscall: Introduce errno_exists()=0D
  linux-user: Simplify host <-> target errno conversion using macros=0D
=0D
 linux-user/aarch64/target_errno_defs.h        |   6 +=0D
 linux-user/alpha/target_errno_defs.h          | 200 ++++++++++++++++=0D
 linux-user/alpha/target_syscall.h             | 194 ----------------=0D
 linux-user/arm/target_errno_defs.h            |   6 +=0D
 linux-user/cris/target_errno_defs.h           |   6 +=0D
 .../target_errno_defs.h}                      |   4 +-=0D
 linux-user/hexagon/target_errno_defs.h        |   6 +=0D
 linux-user/hppa/target_errno_defs.h           | 216 +++++++++++++++++=0D
 linux-user/hppa/target_syscall.h              | 210 -----------------=0D
 linux-user/i386/target_errno_defs.h           |   6 +=0D
 linux-user/m68k/target_errno_defs.h           |   6 +=0D
 linux-user/microblaze/target_errno_defs.h     |   6 +=0D
 linux-user/mips/target_errno_defs.h           | 217 ++++++++++++++++++=0D
 linux-user/mips/target_syscall.h              | 211 -----------------=0D
 linux-user/mips64/target_errno_defs.h         | 217 ++++++++++++++++++=0D
 linux-user/mips64/target_syscall.h            | 211 -----------------=0D
 linux-user/nios2/target_errno_defs.h          |   6 +=0D
 linux-user/openrisc/target_errno_defs.h       |   6 +=0D
 linux-user/ppc/target_errno_defs.h            |   6 +=0D
 linux-user/riscv/target_errno_defs.h          |   6 +=0D
 linux-user/s390x/target_errno_defs.h          |   6 +=0D
 linux-user/sh4/target_errno_defs.h            |   6 +=0D
 .../{target_errno.h =3D> target_errno_defs.h}   |   6 +-=0D
 linux-user/sparc/target_syscall.h             |   2 -=0D
 linux-user/syscall_defs.h                     |   2 +-=0D
 linux-user/x86_64/target_errno_defs.h         |   6 +=0D
 linux-user/xtensa/target_errno_defs.h         |   6 +=0D
 linux-user/syscall.c                          | 174 +++-----------=0D
 linux-user/errnos.c.inc                       | 140 +++++++++++=0D
 linux-user/safe-syscall.S                     |   2 +-=0D
 30 files changed, 1114 insertions(+), 982 deletions(-)=0D
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
 rename linux-user/sparc/{target_errno.h =3D> target_errno_defs.h} (98%)=0D
 create mode 100644 linux-user/x86_64/target_errno_defs.h=0D
 create mode 100644 linux-user/xtensa/target_errno_defs.h=0D
 create mode 100644 linux-user/errnos.c.inc=0D
=0D
-- =0D
2.31.1=0D
=0D

