Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ED82D0825
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:43:16 +0100 (CET)
Received: from localhost ([::1]:42366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3gP-0006nk-JL
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dI-00057o-F6
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:00 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dF-0007Oi-Ty
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:39:59 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k10so10023735wmi.3
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5+L/UCYh+Yz8OUjrhsORCjGrNemm4sUDpLhEt7FajQo=;
 b=TYlsC723yQq4wuLZ89hIbt3GLMlvebNYw7DemJ99SzC+IyJZaxauxVxo1c8dScEjJ8
 05QUUsRBA5/9UKGc3dPHQaTFKylQzLj109R2n/ahuP8Cl7/+e9vCp6FwqvU1x9VIWgEO
 EPT643LV0EQd9M1Ma0uydOQ25+0hgFUlrNAdZz5RHhNEHz1vzMUeusqIcfApxSfUgAY9
 y0s9JT/sKLxyaGN9Cv/Hd7SBOSJ9NEAgQUsBMkFYiWUToT7AgbDKvkaeCaDyzXFs62JW
 UlXWD4nGr60/GRa2k/tUoOi8AGuCaSD2ddAVvA+7LkWY15QC8CFYnOoNXgKa2ErxM6E9
 Djlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5+L/UCYh+Yz8OUjrhsORCjGrNemm4sUDpLhEt7FajQo=;
 b=TymmAzKxP5Z2BCWPF5dCdVwYZ3NCjqF5GvPxGFUDQYp82FZPdqgBNIWo3sieQhslfy
 0aM3s+fKFC2+ktOnIZopfx8zLlugRRdYHZ/3rojqeOoRxqTC2fGDfmILHMKzp4YOsk5X
 opHV6T5Wyc+p14PALpNa9rp+c2nxucsZtq/1EGOioRIw7pGJhOXrGfDzols8do/fOQFu
 Vw+8t4ffwsrinGKaHtJZz4kFCAlb2xSH+nA+6ZhAS5g6n1In5zywPPD+wtSJ2YUOGTCX
 kSmq8AcCFh6e7S/dxdlIS91in5szT6/5aL017Ng+5BH9fTC7H7RD7F2CTSjp4gTrfHpr
 +kwg==
X-Gm-Message-State: AOAM530QO1wp3AaksDbOdqnxSUrM3l9VJoL5vsNUrmmT3M1TnpBiGwPh
 u0RQEVVGKFN/cnnPjczxfRStkydPLnA=
X-Google-Smtp-Source: ABdhPJx/6UZchU4OJqxY2tvT2eli1u94pvJZRHJJdINdB6SatpJ2kqxPJiiPkn1ttDuNKKFU5dXzEQ==
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr15639078wmh.110.1607297992427; 
 Sun, 06 Dec 2020 15:39:52 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z22sm11312366wml.1.2020.12.06.15.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:39:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/19] target/mips: Boring code reordering
Date: Mon,  7 Dec 2020 00:39:30 +0100
Message-Id: <20201206233949.3783184-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This is not what I had plan to finish this WE but well...=0D
at least it is done, and the following series will be=0D
clearer/easier to review.=0D
=0D
There are now less dependencies on the big translate.c,=0D
and we can almost build a KVM-only binary (without TCG).=0D
=0D
Yet another very boring patch series, sorry.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (19):=0D
  hw/mips: Move address translation helpers to target/mips/=0D
  target/mips: Remove unused headers from translate.c=0D
  target/mips: Remove unused headers from fpu_helper.c=0D
  target/mips: Remove unused headers from cp0_helper.c=0D
  target/mips: Remove unused headers from op_helper.c=0D
  target/mips: Remove unused headers from kvm.c=0D
  target/mips: Include "exec/memattrs.h" in 'internal.h'=0D
  target/mips: Extract cpu_supports*/cpu_set* translate.c=0D
  target/mips: Move mips_cpu_add_definition() from helper.c to cpu.c=0D
  target/mips: Add !CONFIG_USER_ONLY comment after #endif=0D
  target/mips: Extract common helpers from helper.c to common_helper.c=0D
  target/mips: Rename helper.c as tlb_helper.c=0D
  target/mips: Fix code style for checkpatch.pl=0D
  target/mips: Move mmu_init() functions to tlb_helper.c=0D
  target/mips: Move cpu definitions, reset() and realize() to cpu.c=0D
  target/mips: Inline cpu_mips_realize_env() in mips_cpu_realizefn()=0D
  target/mips: Rename translate_init.c as cpu-defs.c=0D
  target/mips: Restrict some TCG specific CPUClass handlers=0D
  target/mips: Only build TCG code when CONFIG_TCG is set=0D
=0D
 include/hw/mips/cpudevs.h                     |   7 -=0D
 target/mips/cpu.h                             |   8 +=0D
 target/mips/internal.h                        |   6 +-=0D
 hw/mips/boston.c                              |   1 -=0D
 {hw =3D> target}/mips/addr.c                    |   2 +-=0D
 target/mips/common_helper.c                   | 178 ++++++++++=0D
 target/mips/cp0_helper.c                      |   4 +-=0D
 target/mips/cpu.c                             | 309 +++++++++++++++++-=0D
 target/mips/fpu_helper.c                      |   4 -=0D
 target/mips/kvm.c                             |   3 -=0D
 target/mips/op_helper.c                       |   4 -=0D
 target/mips/{helper.c =3D> tlb_helper.c}        | 244 +++-----------=0D
 target/mips/translate.c                       | 262 ---------------=0D
 hw/mips/meson.build                           |   2 +-=0D
 .../{translate_init.c.inc =3D> cpu-defs.c.inc}  |  57 ----=0D
 target/mips/meson.build                       |  10 +-=0D
 16 files changed, 556 insertions(+), 545 deletions(-)=0D
 rename {hw =3D> target}/mips/addr.c (98%)=0D
 create mode 100644 target/mips/common_helper.c=0D
 rename target/mips/{helper.c =3D> tlb_helper.c} (89%)=0D
 rename target/mips/{translate_init.c.inc =3D> cpu-defs.c.inc} (96%)=0D
=0D
-- =0D
2.26.2=0D
=0D

