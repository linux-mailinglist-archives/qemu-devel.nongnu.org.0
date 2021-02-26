Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8F32632E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 14:16:19 +0100 (CET)
Received: from localhost ([::1]:40004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFcyg-0000Rr-7H
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 08:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFcwZ-0007fy-A9; Fri, 26 Feb 2021 08:14:07 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFcwV-0004hT-5E; Fri, 26 Feb 2021 08:14:06 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l12so8536164wry.2;
 Fri, 26 Feb 2021 05:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D7nSUCRfb8txR1q5zJGXHNZDilnXFlqpxGYdUYXSX+A=;
 b=BC5bQAL6w8wvkIRP+zeg3DVvYRqdhr2+BqGagzg8MCU0NZrNeoINQMzrL+43O/a2uz
 6k4sLYr6oxr+mz+31zGOYXXnx5Yby8oFGnslRoDINTthZUnA+MxSZBdII4x+Qf8P4p1E
 8b36WKWAMPqC9JvL0f+FJkxTIkjT/ZqC+1Lh76IILjift+t0pbx2XSXuT4d+sJUeJ9NR
 XatSg/QV0BjNeQr5WW+IOu0rZclPrNiu91QV2T00Xxsj5g1S6UifkhYr2K12kcHe2Iyy
 Ejwz11bPhH6YmpXt1CvcALnwP+x033bTIYsBIl/YqwJhp9k8S8urBmIoOLPfbLLBUdQZ
 6EeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=D7nSUCRfb8txR1q5zJGXHNZDilnXFlqpxGYdUYXSX+A=;
 b=omFnSUL0V29/zTPJ8Zd2E8SUuXFU8uMOVnmlMG6bx6DAIN803rb1u58VJpi4pJFst6
 XEsKkJnbVQAa5lSALU7a4oRMQZS8gFEk40FQ7H7cJmiR4SjRaM5Bp8bkRUcNreurmFs/
 NkZNxep3wJDKq6dBQKqIgLMPwBx92HzZpuhT/ehizfTJ5PSmTh4+5Eyyx/0UyRGFwAlS
 EVrIObqd4Srdsm8+EciBOeAA7ovMW66S+ZS3T48AYR+Mk2uggtfniHJMAj/xw8CncVIR
 NmFtwwDB82MdR6pUWAIbv4hm/zVXX/G1rPHnOIBYG/QHyMbe8a1wDh2N6VXiQxTb5kyp
 z85g==
X-Gm-Message-State: AOAM5325/dmWXcne2Qof+5fzFxpF1zw6FabajKJzSthn+CectYjVqeWY
 Oqxkocaw1Z4yRBSWyFaPiMAVi/XbCYQ=
X-Google-Smtp-Source: ABdhPJzsDYvjco560LOYCBKpBNmnGYMfJVanmaDuDYjBhX/EvJQ/HJ6QE2f4ZbaP5WOEy+sAgNIaPw==
X-Received: by 2002:a5d:4bce:: with SMTP id l14mr3146590wrt.256.1614345239916; 
 Fri, 26 Feb 2021 05:13:59 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c128sm12150240wma.37.2021.02.26.05.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:13:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] semihosting: Move it out of hw/
Date: Fri, 26 Feb 2021 14:13:54 +0100
Message-Id: <20210226131356.3964782-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to reduce CONFIG_USER_ONLY uses in hw/, move=0D
semihosting out of it, being a generic feature.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  semihosting: Move include/hw/semihosting/ -> include/semihosting/=0D
  semihosting: Move hw/semihosting/ -> semihosting/=0D
=0D
 meson.build                                       | 1 +=0D
 include/{hw =3D> }/semihosting/console.h            | 0=0D
 include/{hw =3D> }/semihosting/semihost.h           | 0=0D
 {hw/semihosting =3D> semihosting}/common-semi.h     | 0=0D
 gdbstub.c                                         | 2 +-=0D
 hw/mips/malta.c                                   | 2 +-=0D
 linux-user/aarch64/cpu_loop.c                     | 2 +-=0D
 linux-user/arm/cpu_loop.c                         | 2 +-=0D
 linux-user/riscv/cpu_loop.c                       | 2 +-=0D
 linux-user/semihost.c                             | 2 +-=0D
 {hw/semihosting =3D> semihosting}/arm-compat-semi.c | 6 +++---=0D
 {hw/semihosting =3D> semihosting}/config.c          | 2 +-=0D
 {hw/semihosting =3D> semihosting}/console.c         | 4 ++--=0D
 softmmu/vl.c                                      | 2 +-=0D
 stubs/semihost.c                                  | 2 +-=0D
 target/arm/helper.c                               | 4 ++--=0D
 target/arm/m_helper.c                             | 4 ++--=0D
 target/arm/translate-a64.c                        | 2 +-=0D
 target/arm/translate.c                            | 2 +-=0D
 target/lm32/helper.c                              | 2 +-=0D
 target/m68k/op_helper.c                           | 2 +-=0D
 target/mips/cpu.c                                 | 2 +-=0D
 target/mips/mips-semi.c                           | 4 ++--=0D
 target/mips/translate.c                           | 2 +-=0D
 target/nios2/helper.c                             | 2 +-=0D
 target/riscv/cpu_helper.c                         | 2 +-=0D
 target/unicore32/helper.c                         | 2 +-=0D
 target/xtensa/translate.c                         | 2 +-=0D
 target/xtensa/xtensa-semi.c                       | 2 +-=0D
 Kconfig                                           | 1 +=0D
 MAINTAINERS                                       | 4 ++--=0D
 hw/Kconfig                                        | 1 -=0D
 hw/meson.build                                    | 1 -=0D
 {hw/semihosting =3D> semihosting}/Kconfig           | 0=0D
 {hw/semihosting =3D> semihosting}/meson.build       | 0=0D
 35 files changed, 35 insertions(+), 35 deletions(-)=0D
 rename include/{hw =3D> }/semihosting/console.h (100%)=0D
 rename include/{hw =3D> }/semihosting/semihost.h (100%)=0D
 rename {hw/semihosting =3D> semihosting}/common-semi.h (100%)=0D
 rename {hw/semihosting =3D> semihosting}/arm-compat-semi.c (99%)=0D
 rename {hw/semihosting =3D> semihosting}/config.c (99%)=0D
 rename {hw/semihosting =3D> semihosting}/console.c (98%)=0D
 rename {hw/semihosting =3D> semihosting}/Kconfig (100%)=0D
 rename {hw/semihosting =3D> semihosting}/meson.build (100%)=0D
=0D
-- =0D
2.26.2=0D
=0D

