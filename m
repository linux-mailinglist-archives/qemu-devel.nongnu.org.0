Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E73F2D1F23
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:41:27 +0100 (CET)
Received: from localhost ([::1]:53488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmR4I-0004oZ-1E
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR08-0003RG-CO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:08 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR06-000176-R6
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:08 -0500
Received: by mail-ej1-x631.google.com with SMTP id a16so22181963ejj.5
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OWgkzaBL8Ks+W5c6hc//5jS9TAtR2BEXueICNpeXGzI=;
 b=dA3Jz1COIag7v1M7puPMdmwoXec5vp17JFsARrNCqYYWr9GEeAr97x4gvDHoEiUlRs
 61h7Vg50DmSQ25pu5RCo7FN4NlIixt75Dmh8aQCiiWYnU1GHti7ElSExMxy6xDh+YTTC
 0tUsR/1rk4BaEvtM4zpttMWb45vyR+RNfOsdA1yP6WuwRKk5+lrenQkpCkjuY3N2Gi1s
 VlnHCQBoRusSlPaQ6DnxhDFoTZJd46+WbYFizK7IRLMJld4kiQ1NzI+fKO/CY8/zFxHZ
 RVEK47YWVx6sSNuxdnrlY1ilkxemJKEwCSpwKP7wQamiBixRgdzEd8/6o/j2UqvlXJqP
 rw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OWgkzaBL8Ks+W5c6hc//5jS9TAtR2BEXueICNpeXGzI=;
 b=D7gI4Xj/ftMT91RotKzqKillJxPa2fI672rI95XG9Cxxy4ZWnO9UxflNq9isVJGPw9
 2P7Ns0Lz3MwxfsTT2npe8DqUMtfapBALKt4Q76xTH1Y321rRtirt4dK98IywNazbqAWG
 EFdUvi016jVTI+k4xHt0gfo9pKv72RAAY7rHcdWe2Cz0CBecGcvbFIlYhR75FURWlyeu
 gi1uxQU2aeFnfxDnq2zjgY0mmfQ9N6TWy7j0HfhX8vjAD9INEDe67rJtaY5MGbMK2yrJ
 gZUUuGpspbhP9yIaR4zhQ4wTPmdOEWxkfm4NPsUN3K8TyVjBG0TGWgK8EvzopWXPIvBg
 ZWmw==
X-Gm-Message-State: AOAM531XMxwjhqXCQuo7rTg2bdTr4u2h2ayIQjycPrIMXm+h0IdkZ3RW
 sV09+lJ8ZsEYNJ7jKqWiZNE4TpaFe/4=
X-Google-Smtp-Source: ABdhPJyOLT7IrJOkvySteoCMLX7D7ldLNTWfL3J3pXoTi91sQP7BLNIp4IPEJBTN7t8ugtAPLoMvIQ==
X-Received: by 2002:a17:906:b74b:: with SMTP id
 fx11mr21056135ejb.410.1607387825097; 
 Mon, 07 Dec 2020 16:37:05 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id mb15sm13785560ejb.9.2020.12.07.16.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:37:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/17] target/mips: Convert MSA ASE to decodetree
Date: Tue,  8 Dec 2020 01:36:45 +0100
Message-Id: <20201208003702.4088927-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finally, we use decodetree with the MIPS target.=0D
=0D
Starting easy with the MSA ASE. 2700+ lines extracted=0D
from helper.h and translate.c, now built as an new=0D
object: mod-msa_translate.o.=0D
=0D
While the diff stat is positive by 86 lines, we actually=0D
(re)moved code, but added (C) notices.=0D
=0D
The most interesting patches are the 2 last ones.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Based-on: <20201207224335.4030582-1-f4bug@amsat.org>=0D
(linux-user: Rework get_elf_hwcap() and support MIPS Loongson 2F/3A)=0D
Based-on: <20201207235539.4070364-1-f4bug@amsat.org>=0D
(target/mips: Add translate.h and fpu_translate.h headers)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (17):=0D
  target/mips: Introduce ase_msa_available() helper=0D
  target/mips: Simplify msa_reset()=0D
  target/mips: Use CP0_Config3 to set MIPS_HFLAG_MSA=0D
  target/mips: Simplify MSA TCG logic=0D
  target/mips: Remove now unused ASE_MSA definition=0D
  target/mips: Alias MSA vector registers on FPU scalar registers=0D
  target/mips: Extract msa_translate_init() from mips_tcg_init()=0D
  target/mips: Remove CPUMIPSState* argument from gen_msa*() methods=0D
  target/mips: Explode gen_msa_branch() as gen_msa_BxZ_V/BxZ()=0D
  target/mips: Rename msa_helper.c as mod-msa_helper.c=0D
  target/mips: Move msa_reset() to mod-msa_helper.c=0D
  target/mips: Extract MSA helpers from op_helper.c=0D
  target/mips: Extract MSA helper definitions=0D
  target/mips: Declare gen_msa/_branch() in 'translate.h'=0D
  target/mips: Extract MSA translation routines=0D
  target/mips: Introduce decode tree bindings for MSA opcodes=0D
  target/mips: Use decode_msa32() generated from decodetree=0D
=0D
 target/mips/cpu.h                             |    6 +=0D
 target/mips/fpu_translate.h                   |   10 -=0D
 target/mips/helper.h                          |  436 +---=0D
 target/mips/internal.h                        |    4 +-=0D
 target/mips/mips-defs.h                       |    1 -=0D
 target/mips/translate.h                       |    4 +=0D
 target/mips/mod-msa32.decode                  |   24 +=0D
 target/mips/kvm.c                             |   12 +-=0D
 .../mips/{msa_helper.c =3D> mod-msa_helper.c}   |  429 ++++=0D
 target/mips/mod-msa_translate.c               | 2270 +++++++++++++++++=0D
 target/mips/op_helper.c                       |  394 ---=0D
 target/mips/translate.c                       | 2264 +---------------=0D
 target/mips/meson.build                       |    9 +-=0D
 target/mips/mod-msa_helper.h.inc              |  443 ++++=0D
 target/mips/translate_init.c.inc              |   38 +-=0D
 15 files changed, 3215 insertions(+), 3129 deletions(-)=0D
 create mode 100644 target/mips/mod-msa32.decode=0D
 rename target/mips/{msa_helper.c =3D> mod-msa_helper.c} (93%)=0D
 create mode 100644 target/mips/mod-msa_translate.c=0D
 create mode 100644 target/mips/mod-msa_helper.h.inc=0D
=0D
-- =0D
2.26.2=0D
=0D

