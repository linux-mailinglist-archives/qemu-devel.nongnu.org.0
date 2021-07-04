Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC483BAE55
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:39:23 +0200 (CEST)
Received: from localhost ([::1]:57876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m071W-0003oH-E1
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070D-0001ex-4r
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:01 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:46761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070B-0006J5-ET
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:00 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so8683639wms.5
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GIX+3/+aE+JTh0TYOsPgCq97o4/wm2whr25SRFJscVo=;
 b=pbU/ybrl+fykPYX0xPH0yTrqBTobOq9nqWH8wh4PLR6yExA5fv0PUIqD/KBN8KZUx2
 bve/oRkiGvGLXyRxLdWCupeHzjCt8AakMDnLSj2nYcczu15RtDzuVucKxa7N090lZsv8
 QSuEax3Zc5wBnDQr+3zEi9hSjkzBui23BiIKeMDlQzYhzzEulqd4veyRnmknSrBtJd+7
 fqNI1J9vbeidDrb+FyapMW92DbPPJFLu+cOwM09jqYpC5lQEyAdxpTP39Rnc75PRX1lD
 zfB9+tM0hvFahwz8jF1hGfAQahPP4ukly1ZY8ohlUFozbojAkWe10X6Rlht/RNctduXz
 +qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GIX+3/+aE+JTh0TYOsPgCq97o4/wm2whr25SRFJscVo=;
 b=fDQp7tnhUDR480VFGMh6f9U14Floz7K2peDbqzcl/xbr8Ufb25KN2E0PQk/hM+U2XM
 VruNZ39sSJ5LRR+V9GmeCtH22WMSvkR76jNHLOmUA/rUQIhgL7SoZqaNjeIOGtm58nsm
 AFqbJrsgEWOQCgjdJ/YNbKeY1X9P1iZ3hhgHzwSO1I0GG4Lob1qWbVupryJi+HzRz3r9
 vEwG3nubGjI7tazQuzX9Ipk8M2W+t5nkPVyXpjfOt4VU/ZqGJfQFJWkQ9dJtiJXw1vP1
 57HpPfCwlc00cXchEQGyqLnDufgb80XL/kd6pDeDoQRsvM0anRB4Cp9mIwYOQO53oQp/
 cboQ==
X-Gm-Message-State: AOAM532hMmY/FFaJDkyajUclba4rB2ubEqjuSLsidij541tw3p8yv3Um
 eAVbxICWLihLuw4bWBW3gNSvNVzD+Ck=
X-Google-Smtp-Source: ABdhPJx52nuqDRgBMgJOUERZLOWKfSq25TvQgOA8Fya2xDwGzckwBKI4mFV27wggAMmAQ5oLsEIegg==
X-Received: by 2002:a7b:c2a2:: with SMTP id c2mr10788466wmk.89.1625423877525; 
 Sun, 04 Jul 2021 11:37:57 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h9sm9688260wmb.35.2021.07.04.11.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:37:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/12] linux-user: Extract target errno related functions to
 'target_errno.h'
Date: Sun,  4 Jul 2021 20:37:43 +0200
Message-Id: <20210704183755.655002-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series extract code related to target errno conversion=0D
(to/from host) into a separate header.=0D
=0D
While reviewing I noticed EWOULDBLOCK is defined as EAGAIN=0D
on alpha/hppa/mips targets, these are the first 3 patches.=0D
=0D
Then each target errno definitions are extracted to a new=0D
header: 'target_errno_defs.h' (patches 4-9).=0D
=0D
Finally we extract the generic target errno functions to the=0D
new 'target_errno.c' file in patches 10-12=0D
=0D
Up to here it seems a good refactor.=0D
=0D
From here I'm wondering if we could generate some target specific=0D
library (linux-user-target.fa?) that could be reused by semihosting=0D
code (at least for the Xtensa target). Just an idea...=0D
=0D
Philippe Mathieu-Daud=C3=A9 (12):=0D
  linux-user/alpha: Handle TARGET_EWOULDBLOCK as TARGET_EAGAIN=0D
  linux-user/hppa: Handle TARGET_EWOULDBLOCK as TARGET_EAGAIN=0D
  linux-user/mips: Handle TARGET_EWOULDBLOCK as TARGET_EAGAIN=0D
  linux-user/sparc: Rename target_errno.h -> target_errno_defs.h=0D
  linux-user: Extract target errno to 'target_errno_defs.h'=0D
  linux-user/alpha: Remove hardcoded tabs (code style)=0D
  linux-user/alpha: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user/hppa: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user/mips: Move errno definitions to 'target_errno_defs.h'=0D
  linux-user/syscall: Refactor target_to_host_errno_table_init()=0D
  linux-user/syscall: Remove hardcoded tabs (code style)=0D
  linux-user: Extract target errno related functions to 'target_errno.h'=0D
=0D
 linux-user/aarch64/target_errno_defs.h        |   6 +=0D
 linux-user/alpha/target_errno_defs.h          | 198 ++++++++++++++++=0D
 linux-user/alpha/target_syscall.h             | 194 ----------------=0D
 linux-user/arm/target_errno_defs.h            |   6 +=0D
 linux-user/cris/target_errno_defs.h           |   6 +=0D
 linux-user/errno_defs.h                       |   3 +=0D
 linux-user/hexagon/target_errno_defs.h        |   6 +=0D
 linux-user/hppa/target_errno_defs.h           | 214 +++++++++++++++++=0D
 linux-user/hppa/target_syscall.h              | 208 -----------------=0D
 linux-user/i386/target_errno_defs.h           |   6 +=0D
 linux-user/m68k/target_errno_defs.h           |   6 +=0D
 linux-user/microblaze/target_errno_defs.h     |   6 +=0D
 linux-user/mips/target_errno_defs.h           | 215 ++++++++++++++++++=0D
 linux-user/mips/target_syscall.h              | 209 -----------------=0D
 linux-user/mips64/target_errno_defs.h         | 215 ++++++++++++++++++=0D
 linux-user/mips64/target_syscall.h            | 209 -----------------=0D
 linux-user/nios2/target_errno_defs.h          |   6 +=0D
 linux-user/openrisc/target_errno_defs.h       |   6 +=0D
 linux-user/ppc/target_errno_defs.h            |   6 +=0D
 linux-user/riscv/target_errno_defs.h          |   6 +=0D
 linux-user/s390x/target_errno_defs.h          |   6 +=0D
 linux-user/sh4/target_errno_defs.h            |   6 +=0D
 .../{target_errno.h =3D> target_errno_defs.h}   |   0=0D
 linux-user/sparc/target_syscall.h             |   2 -=0D
 linux-user/target_errno.h                     |  32 +++=0D
 linux-user/x86_64/target_errno_defs.h         |   6 +=0D
 linux-user/xtensa/target_errno_defs.h         |   6 +=0D
 linux-user/syscall.c                          | 156 +------------=0D
 linux-user/target_errno.c                     | 183 +++++++++++++++=0D
 linux-user/meson.build                        |   1 +=0D
 30 files changed, 1153 insertions(+), 976 deletions(-)=0D
 create mode 100644 linux-user/aarch64/target_errno_defs.h=0D
 create mode 100644 linux-user/alpha/target_errno_defs.h=0D
 create mode 100644 linux-user/arm/target_errno_defs.h=0D
 create mode 100644 linux-user/cris/target_errno_defs.h=0D
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
 rename linux-user/sparc/{target_errno.h =3D> target_errno_defs.h} (100%)=0D
 create mode 100644 linux-user/target_errno.h=0D
 create mode 100644 linux-user/x86_64/target_errno_defs.h=0D
 create mode 100644 linux-user/xtensa/target_errno_defs.h=0D
 create mode 100644 linux-user/target_errno.c=0D
=0D
-- =0D
2.31.1=0D
=0D

