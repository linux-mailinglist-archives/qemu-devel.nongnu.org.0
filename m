Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD75364A9E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:34:11 +0200 (CEST)
Received: from localhost ([::1]:60870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZes-0005As-Mw
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZPh-0005mR-7P
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:29 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZPf-0000va-4j
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id p6so28471062wrn.9
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S/oWxVJzYryy6UuvDUbLpXclOy4R3wFcK9vqiSAcj3s=;
 b=YwBwjaAJrTO6wHC71ylW437kdKdYEzTjbsERYvQizZggtvGkNCFDoKM2L9DFgzyOkF
 tZGQSwVF/QYo8io1M1eYEUJu95v4cXEsO8kyI9vNLeTiP1N9oZyvXnSUtAuauvx5I14I
 O8R0WXBHYO4SpUza4xC1yQcrRh+/LAt1X6ENmDeSBUHOYfo37iDFS09eb/ljMGbv+150
 0O2h3lW+lrhqRnLWLF4M16Hh1CxQe+1XKyfpG7EvNTLEknkkBSXRtqYbnhV9UvK9Xwvx
 9t0hj0XzBHExSrgSWWK4B1Es7FtVRRpg6+Wnde3IQWaCKvsevXSaoQ9o8cgUKH4/BpMM
 golg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=S/oWxVJzYryy6UuvDUbLpXclOy4R3wFcK9vqiSAcj3s=;
 b=OlzB+Z1FA0nY0D/SMUb4W9kRagoO1pTg1Y4Y9dbAfXULj7stTHTW1pcT5SMxGPir46
 BItCRJwMFG0sqCgUycnYyHCZ+fbLuwhPcAJ6dS09YOR6rAZTxvk/cpLhf7sxPoyyzID6
 zUm8VtpsCq54LtPpc7dNx/3TrIDadCO8LWuMnA7U4pWY7MYbBQOHWhXFw2IlYLsKrJzr
 RSx5I3omxfmQKTmc91Yz675eClmFTjOTZfZr5IO7EbVykgTLGrRVc+Q+grD1MnTe13Hl
 Vjj9GNiW7Aw/W+jo0fMB3TZsRYpPunOjcWxtTmIxmHizdC1MHgbNj5We4stn7r+m4zga
 D5wA==
X-Gm-Message-State: AOAM530RgB7IcJKxdLiSMd5Sti56h5IE5sbOvnJ0JQHSLQd4XpW0TMHO
 pXeSRv1+xiTi+zFs0ejvsZmlw7iQDCGNGQ==
X-Google-Smtp-Source: ABdhPJxbkNc2mtlPerQwSH2LWwUpVOSIIpMisxUysgJ5rF+MyYHayUweQWmFiie8xj0EDLdS67GSTA==
X-Received: by 2002:a05:6000:2ad:: with SMTP id
 l13mr15903869wry.417.1618859905207; 
 Mon, 19 Apr 2021 12:18:25 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f8sm534840wmc.8.2021.04.19.12.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:18:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/30] target/mips: Re-org to allow KVM-only builds
Date: Mon, 19 Apr 2021 21:17:53 +0200
Message-Id: <20210419191823.1555482-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TL;DR:=0D
=0D
This series restrict TCG-specific objects by moving them to=0D
the tcg/ subdir. Code is moved around to satisfy 3 cases:=0D
{ generic sysemu / tcg sysemu / tcg user}.=0D
=0D
Since v2:=0D
- Merge do_translate_address into cpu_mips_translate_address=0D
- Added Thomas & Willian tags=0D
=0D
Since v1:=0D
- Addressed Richard review comments=0D
- Added Richard R-b tag=0D
=0D
Missing review: 5, 7, 8, 9, 18, 19, 24=0D
=0D
Hi,=0D
=0D
This series move the MIPS TCG files under target/mips/tcg/.=0D
tcg/ is split into {sysemu and user}, and code common to=0D
both user/sysemu is left under tcg/ root.=0D
=0D
Non-user code is moved to sysemu/ (common to TCG and KVM).=0D
=0D
- Patches 1 & 11 are Meson generic=0D
- Patches 2 to 10 move generic symbols around to satisfly KVM linking=0D
- Patch 12 introduces tcg-internal.h where we'll move TCG specific=0D
  prototypes from the current big internal.h=0D
- Patches 13-28 move code by topic (first user, then sysemu, then tcg)=0D
- Patch 29 restrict TCG specific machines to TCG (to actually=0D
  only build malta/loongson3-virt machines when restricted to KVM)=0D
- Patch 30 finally add a CI job with "KVM-only" config:=0D
  https://gitlab.com/philmd/qemu/-/jobs/1189874868 (12min 5sec)=0D
=0D
Diffstat is not that bad, and many #ifdef'ry removed.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Based-on: <20210413081008.3409459-1-f4bug@amsat.org>=0D
          "exec: Remove accel/tcg/ from include paths"=0D
=0D
Philippe Mathieu-Daud=C3=A9 (30):=0D
  target/mips: Simplify meson TCG rules=0D
  target/mips: Move IEEE rounding mode array to new source file=0D
  target/mips: Move msa_reset() to new source file=0D
  target/mips: Make CPU/FPU regnames[] arrays global=0D
  target/mips: Optimize CPU/FPU regnames[] arrays=0D
  target/mips: Restrict mips_cpu_dump_state() to cpu.c=0D
  target/mips: Turn printfpr() macro into a proper function=0D
  target/mips: Declare mips_cpu_set_error_pc() inlined in "internal.h"=0D
  target/mips: Merge do_translate_address into=0D
    cpu_mips_translate_address=0D
  target/mips: Extract load/store helpers to ldst_helper.c=0D
  meson: Introduce meson_user_arch source set for arch-specific=0D
    user-mode=0D
  target/mips: Introduce tcg-internal.h for TCG specific declarations=0D
  target/mips: Add simple user-mode mips_cpu_do_interrupt()=0D
  target/mips: Add simple user-mode mips_cpu_tlb_fill()=0D
  target/mips: Move cpu_signal_handler definition around=0D
  target/mips: Move sysemu specific files under sysemu/ subfolder=0D
  target/mips: Move physical addressing code to sysemu/physaddr.c=0D
  target/mips: Restrict cpu_mips_get_random() / update_pagemask() to TCG=0D
  target/mips: Move sysemu TCG-specific code to tcg/sysemu/ subfolder=0D
  target/mips: Restrict mmu_init() to TCG=0D
  target/mips: Move tlb_helper.c to tcg/sysemu/=0D
  target/mips: Restrict CPUMIPSTLBContext::map_address() handlers scope=0D
  target/mips: Move Special opcodes to tcg/sysemu/special_helper.c=0D
  target/mips: Move helper_cache() to tcg/sysemu/special_helper.c=0D
  target/mips: Move TLB management helpers to tcg/sysemu/tlb_helper.c=0D
  target/mips: Move exception management code to exception.c=0D
  target/mips: Move CP0 helpers to sysemu/cp0.c=0D
  target/mips: Move TCG source files under tcg/ sub directory=0D
  hw/mips: Restrict non-virtualized machines to TCG=0D
  gitlab-ci: Add KVM mips64el cross-build jobs=0D
=0D
 meson.build                                  |    6 +=0D
 target/mips/helper.h                         |  183 +--=0D
 target/mips/internal.h                       |  106 +-=0D
 target/mips/tcg/tcg-internal.h               |   64 +=0D
 target/mips/{ =3D> tcg}/msa_helper.h.inc       |    0=0D
 target/mips/tcg/sysemu_helper.h.inc          |  185 +++=0D
 target/mips/{ =3D> tcg}/mips32r6.decode        |    0=0D
 target/mips/{ =3D> tcg}/mips64r6.decode        |    0=0D
 target/mips/{ =3D> tcg}/msa32.decode           |    0=0D
 target/mips/{ =3D> tcg}/msa64.decode           |    0=0D
 target/mips/{ =3D> tcg}/tx79.decode            |    0=0D
 target/mips/cpu.c                            |  311 ++---=0D
 target/mips/fpu.c                            |   25 +=0D
 target/mips/msa.c                            |   60 +=0D
 target/mips/op_helper.c                      | 1210 ------------------=0D
 target/mips/{ =3D> sysemu}/addr.c              |    0=0D
 target/mips/sysemu/cp0.c                     |  123 ++=0D
 target/mips/{ =3D> sysemu}/cp0_timer.c         |    0=0D
 target/mips/{ =3D> sysemu}/machine.c           |    0=0D
 target/mips/sysemu/physaddr.c                |  257 ++++=0D
 target/mips/{ =3D> tcg}/dsp_helper.c           |    0=0D
 target/mips/tcg/exception.c                  |  167 +++=0D
 target/mips/{ =3D> tcg}/fpu_helper.c           |    8 -=0D
 target/mips/tcg/ldst_helper.c                |  288 +++++=0D
 target/mips/{ =3D> tcg}/lmmi_helper.c          |    0=0D
 target/mips/{ =3D> tcg}/msa_helper.c           |   36 -=0D
 target/mips/{ =3D> tcg}/msa_translate.c        |    0=0D
 target/mips/{ =3D> tcg}/mxu_translate.c        |    0=0D
 target/mips/tcg/op_helper.c                  |  420 ++++++=0D
 target/mips/{ =3D> tcg}/rel6_translate.c       |    0=0D
 target/mips/{ =3D> tcg/sysemu}/cp0_helper.c    |    0=0D
 target/mips/{ =3D> tcg/sysemu}/mips-semi.c     |    0=0D
 target/mips/tcg/sysemu/special_helper.c      |  173 +++=0D
 target/mips/{ =3D> tcg/sysemu}/tlb_helper.c    |  623 +++++----=0D
 target/mips/{ =3D> tcg}/translate.c            |  104 +-=0D
 target/mips/{ =3D> tcg}/translate_addr_const.c |    0=0D
 target/mips/{ =3D> tcg}/tx79_translate.c       |    0=0D
 target/mips/{ =3D> tcg}/txx9_translate.c       |    0=0D
 target/mips/tcg/user/tlb_helper.c            |   64 +=0D
 .gitlab-ci.d/crossbuilds.yml                 |    8 +=0D
 MAINTAINERS                                  |    3 +-=0D
 hw/mips/meson.build                          |   11 +-=0D
 target/mips/meson.build                      |   55 +-=0D
 target/mips/sysemu/meson.build               |    7 +=0D
 target/mips/tcg/meson.build                  |   35 +=0D
 target/mips/tcg/sysemu/meson.build           |    6 +=0D
 target/mips/tcg/user/meson.build             |    3 +=0D
 47 files changed, 2394 insertions(+), 2147 deletions(-)=0D
 create mode 100644 target/mips/tcg/tcg-internal.h=0D
 rename target/mips/{ =3D> tcg}/msa_helper.h.inc (100%)=0D
 create mode 100644 target/mips/tcg/sysemu_helper.h.inc=0D
 rename target/mips/{ =3D> tcg}/mips32r6.decode (100%)=0D
 rename target/mips/{ =3D> tcg}/mips64r6.decode (100%)=0D
 rename target/mips/{ =3D> tcg}/msa32.decode (100%)=0D
 rename target/mips/{ =3D> tcg}/msa64.decode (100%)=0D
 rename target/mips/{ =3D> tcg}/tx79.decode (100%)=0D
 create mode 100644 target/mips/fpu.c=0D
 create mode 100644 target/mips/msa.c=0D
 delete mode 100644 target/mips/op_helper.c=0D
 rename target/mips/{ =3D> sysemu}/addr.c (100%)=0D
 create mode 100644 target/mips/sysemu/cp0.c=0D
 rename target/mips/{ =3D> sysemu}/cp0_timer.c (100%)=0D
 rename target/mips/{ =3D> sysemu}/machine.c (100%)=0D
 create mode 100644 target/mips/sysemu/physaddr.c=0D
 rename target/mips/{ =3D> tcg}/dsp_helper.c (100%)=0D
 create mode 100644 target/mips/tcg/exception.c=0D
 rename target/mips/{ =3D> tcg}/fpu_helper.c (99%)=0D
 create mode 100644 target/mips/tcg/ldst_helper.c=0D
 rename target/mips/{ =3D> tcg}/lmmi_helper.c (100%)=0D
 rename target/mips/{ =3D> tcg}/msa_helper.c (99%)=0D
 rename target/mips/{ =3D> tcg}/msa_translate.c (100%)=0D
 rename target/mips/{ =3D> tcg}/mxu_translate.c (100%)=0D
 create mode 100644 target/mips/tcg/op_helper.c=0D
 rename target/mips/{ =3D> tcg}/rel6_translate.c (100%)=0D
 rename target/mips/{ =3D> tcg/sysemu}/cp0_helper.c (100%)=0D
 rename target/mips/{ =3D> tcg/sysemu}/mips-semi.c (100%)=0D
 create mode 100644 target/mips/tcg/sysemu/special_helper.c=0D
 rename target/mips/{ =3D> tcg/sysemu}/tlb_helper.c (76%)=0D
 rename target/mips/{ =3D> tcg}/translate.c (99%)=0D
 rename target/mips/{ =3D> tcg}/translate_addr_const.c (100%)=0D
 rename target/mips/{ =3D> tcg}/tx79_translate.c (100%)=0D
 rename target/mips/{ =3D> tcg}/txx9_translate.c (100%)=0D
 create mode 100644 target/mips/tcg/user/tlb_helper.c=0D
 create mode 100644 target/mips/sysemu/meson.build=0D
 create mode 100644 target/mips/tcg/meson.build=0D
 create mode 100644 target/mips/tcg/sysemu/meson.build=0D
 create mode 100644 target/mips/tcg/user/meson.build=0D
=0D
-- =0D
2.26.3=0D
=0D

