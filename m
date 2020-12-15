Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E2B2DB6D2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:01:46 +0100 (CET)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJKC-0005X4-72
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJGf-0002ej-3H
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:05 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJGb-0003Vp-Tv
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:04 -0500
Received: by mail-ej1-x62c.google.com with SMTP id d17so30055641ejy.9
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XTmTU+I/QeMhja7w9GBCfSdZSiPSigvZOhS987dRJBo=;
 b=oLimqBnxuZ+ao84nN51By9sR65R1eDdf2BZhI5VRg1r+POA1uoJ4yBdwG1eJAvQFZy
 FFr5DVpTqFA0XzgvL2eMlOiyF/VKAZNEHVsK3EYX7AyjtPCDvlL9qeAsSZXVv8aT1RPt
 75HXpCGE1FFe4NRbNP64DXn8giZvtzdbmSJEy5BZNxIpJzJQWUjBA14GanuHOx0SsjAs
 tYu0auLQhExF1bItOUkAFFBv2uYsP60I//0Dc6jeIFr5ms02vzHi32TvIMbhTMLW4OLC
 rkSo8PheSiJs7KHdCw7+vdTnfg9yTZMK1uzI6885ZRZjZD+C7eyjIYm7hvdx61mKGVB0
 uylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XTmTU+I/QeMhja7w9GBCfSdZSiPSigvZOhS987dRJBo=;
 b=Nd8QDhuWzz1LmsSoxU7eEi2PcKoITq3XaylqxeTZvB6wCJFFC9paJh7lx3SNjmEETh
 MCUWSHeJzw6akhsVoJndRqlVTG0/dMmSc3w7patFv8jI9e7aBQjN36xPEU5D0ypqdJTe
 UOCPQ4BtKCJ7VX24RISd57vtROdWZS2g3L10TDvCP99uYCMvcaOraH8qV2k+1qjI4BuT
 KdXvCTWGM3AtDa4Jl5bM1N4tTs1Q8N1hluzawImKBd6+8bBrHpdJTczEHXdFZ3sfyzEn
 w/+osg/e7eEULx86JaepP+dYoBSHx7z3UZC6wTV/LcC7Vt0rCk33BXSAbIB4Bt++otFT
 kRRQ==
X-Gm-Message-State: AOAM530MYEA03Esm7dRbDnElRlO7wU6aJj1iMszAOWEI0acWduu0Dglo
 SPKtNSTjfF3w+oCDBkBGwos=
X-Google-Smtp-Source: ABdhPJwyuY0SMLuZ8mv7Kg7MS1wODirFHVtTRpqubaTxWcwvu6I18YNN2a8WCyVz7eRcENkMSDW5Xw==
X-Received: by 2002:a17:906:e8b:: with SMTP id
 p11mr18861695ejf.92.1608073080221; 
 Tue, 15 Dec 2020 14:58:00 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o13sm19168231edr.94.2020.12.15.14.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:57:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/24] target/mips: Convert MSA ASE to decodetree
Date: Tue, 15 Dec 2020 23:57:33 +0100
Message-Id: <20201215225757.764263-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: 1-3 14 17 19-24=0D
=0D
Since v1:=0D
- rebased=0D
- addressed Richard review comments=0D
- reworded some commit descriptions=0D
- avoid 64-bit ifdef'ry=0D
=0D
Finally, we use decodetree with the MIPS target.=0D
=0D
Starting easy with the MSA ASE. 2700+ lines extracted=0D
from helper.h and translate.c, now built as an new=0D
object: mod-msa_translate.o.=0D
=0D
Phil.=0D
=0D
Available:=0D
  https://gitlab.com/philmd/qemu/-/commits/mips_msa_decodetree_v2=0D
=0D
Based-on: <20201214183739.500368-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (24):=0D
  target/mips/translate: Extract decode_opc_legacy() from decode_opc()=0D
  target/mips/translate: Expose check_mips_64() to 32-bit mode=0D
  target/mips/cpu: Introduce isa_rel6_available() helper=0D
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
  target/mips: Use decode_ase_msa() generated from decodetree=0D
  target/mips: Extract LSA/DLSA translation generators=0D
  target/mips: Introduce decodetree helpers for MSA LSA/DLSA opcodes=0D
  target/mips: Introduce decodetree helpers for Release6 LSA/DLSA=0D
    opcodes=0D
  target/mips/mod-msa: Pass TCGCond argument to gen_check_zero_element()=0D
=0D
 target/mips/cpu.h                             |    7 +=0D
 target/mips/helper.h                          |  436 +--=0D
 target/mips/internal.h                        |    4 +-=0D
 target/mips/mips-defs.h                       |    1 -=0D
 target/mips/translate.h                       |   25 +-=0D
 target/mips/isa-mips32r6.decode               |   17 +=0D
 target/mips/isa-mips64r6.decode               |   17 +=0D
 target/mips/mod-msa32.decode                  |   28 +=0D
 target/mips/mod-msa64.decode                  |   17 +=0D
 target/mips/cpu.c                             |   14 +-=0D
 target/mips/isa-mips_rel6_translate.c         |   37 +=0D
 target/mips/kvm.c                             |   12 +-=0D
 .../mips/{msa_helper.c =3D> mod-msa_helper.c}   |  429 +++=0D
 target/mips/mod-msa_translate.c               | 2286 ++++++++++++++++=0D
 target/mips/op_helper.c                       |  394 ---=0D
 target/mips/translate.c                       | 2352 +----------------=0D
 target/mips/translate_addr_const.c            |   52 +=0D
 target/mips/cpu-defs.c.inc                    |   40 +-=0D
 target/mips/meson.build                       |   14 +-=0D
 target/mips/mod-msa_helper.h.inc              |  443 ++++=0D
 20 files changed, 3437 insertions(+), 3188 deletions(-)=0D
 create mode 100644 target/mips/isa-mips32r6.decode=0D
 create mode 100644 target/mips/isa-mips64r6.decode=0D
 create mode 100644 target/mips/mod-msa32.decode=0D
 create mode 100644 target/mips/mod-msa64.decode=0D
 create mode 100644 target/mips/isa-mips_rel6_translate.c=0D
 rename target/mips/{msa_helper.c =3D> mod-msa_helper.c} (93%)=0D
 create mode 100644 target/mips/mod-msa_translate.c=0D
 create mode 100644 target/mips/translate_addr_const.c=0D
 create mode 100644 target/mips/mod-msa_helper.h.inc=0D
=0D
-- =0D
2.26.2=0D
=0D

