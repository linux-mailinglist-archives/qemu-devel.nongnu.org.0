Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8482BB81D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:11:31 +0100 (CET)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDgm-00040g-JH
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDeE-0002iM-Gh
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:08:50 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDeC-0003jH-D1
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:08:50 -0500
Received: by mail-wm1-x341.google.com with SMTP id 1so11244778wme.3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HS4dkkkJ6SWXO3Jxlpbfx6onx1niRsHIk5mqrv4bQIs=;
 b=MOIZLRimcJcg0q94FoPacp8pERcCbi3bGQWG3dPtgqocApmMeMXPJQYlPQ0sY5BoI4
 8WWSMIEGA8j5lSmQI0a+oVhIWaBmOWe3NDEHMw7/7tpZ6JqLLbCIZ4pxEpdLK2nVDnSk
 jyaYukiucVHYlFck7jquoH9UTIXLobvQjWa8b3nSU369Rz9wgrT3SOJ2rhQlCDul3kht
 38z7k57zQ1eLsqTwI8qRrGXe4AgDOOi9EQCFN16bxvtgYmke9a0YsnbZFVI1YTKEhXHn
 +a0tiDZtqZXyAOihgtg1mM0bKeiUPx0mbDRc/Sw1SoZ6o77k68ovwo3xfngF0r3uzvmu
 1awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HS4dkkkJ6SWXO3Jxlpbfx6onx1niRsHIk5mqrv4bQIs=;
 b=BX29TtW8sF00Sn9vHJhwpCVwuI8OiDU51YYhNA3bwLMzdxNRtKe31K9AAdTIeT2CbF
 0TTDDQq+rpDJlqw6BBkpukKN0YgjeJVF7ACSq0HxoRIpsg7/uejDAd8P2p7eTaNpFPiL
 g/P6PkUaBgO1z1d4+Yx1uGD65Nm8qggchzw+rc8FJjLMETsCLH/Dz++MH5OXHraW0G1r
 +Jc7d/jM+BGW11B8rpe/y/L6E6OzRYCWkOUyZOSUfo0VUYPRhlwVFWgjz5fRoCahptug
 zl0Pv1+oaUDFMSPUYh5VShqOP32ZO/iJ6/NmTPMfbZbPqrnD4RsUInFS7OFKICFN+uh8
 HYrg==
X-Gm-Message-State: AOAM531ZK1+M5pvMuRgXO12jAQ4zWp4vxswS9vkdetnijrx/b5Pk096o
 IY/43+MdxW4i9rZFCyYqJPAXfIRrp/U=
X-Google-Smtp-Source: ABdhPJyU6doIgTo9JMm4NFxC/YJUhWTXkEEHdqSnbIK0MrS5yex76EJqtB9pe61spJFJf2UkhSEZoQ==
X-Received: by 2002:a1c:1d82:: with SMTP id d124mr12413476wmd.12.1605906526520; 
 Fri, 20 Nov 2020 13:08:46 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id y16sm6320174wrt.25.2020.11.20.13.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:08:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/26] target/mips: Explode 60% of the 32K-lines translate.c
Date: Fri, 20 Nov 2020 22:08:18 +0100
Message-Id: <20201120210844.2625602-1-f4bug@amsat.org>
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
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series, while boring, helps maintainability.=0D
=0D
I simply exploded 60% of the huge target/mips/translate.c,=0D
reducing it from 32K lines of code to 13500.=0D
=0D
The small overhead in the diffstat is due to entries added in=0D
MAINTAINERS and license boilerplate addition:=0D
20225 insertions(+), 19987 deletions(-)=0D
=0D
While being a massive diff, it is a no-brain review using=0D
'git-diff --color-moved=3Ddimmed-zebra' which highlights very few=0D
changes: #include and license lines.=0D
=0D
The exploded new layout, which allows more useful filtering=0D
with the get_maintainer.pl script, is:=0D
=0D
- MIPS ISA, ASE and modules:=0D
=0D
 . isa-micromips_helper.h.inc=0D
 . isa-nanomips_translate.c.inc=0D
=0D
 . ase-mips16e_translate.c.inc=0D
=0D
 . mod-mips-dsp_helper.c=0D
 . mod-mips-dsp_helper.h.inc=0D
 . mod-mips-dsp_translate.c.inc=0D
 . mod-mips-msa_helper.h.inc=0D
 . mod-mips-msa_translate.c.inc=0D
 . mod-mips-msa_helper.c=0D
 . mod-mips-mt_helper.h.inc=0D
=0D
- MIPS Vendor Specific:=0D
=0D
 . vendor-loong-simd_helper.c=0D
 . vendor-loong-lext_translate.c.inc=0D
 . vendor-loong-simd_helper.h.inc=0D
 . vendor-loong-simd_translate.c.inc=0D
=0D
 . vendor-tx-mmi_translate.c.inc=0D
 . vendor-tx_translate.c.inc=0D
=0D
 . vendor-vr54xx_helper.c=0D
 . vendor-vr54xx_helper.h.inc=0D
 . vendor-vr54xx_translate.c.inc=0D
=0D
 . vendor-xburst_translate.c.inc=0D
=0D
There should be no logical code change (only code movement).=0D
=0D
The series is available at:=0D
=0D
  https://gitlab.com/philmd/qemu.git branches/mips_translate_explode=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (26):=0D
  target/mips: Extract FPU helpers to 'fpu_helper.h'=0D
  target/mips: Extract MSA helpers to mod-mips-msa_helper.c=0D
  target/mips: Extract MSA helper definitions=0D
  target/mips: Extract MSA translation routines=0D
  target/mips: Rename dsp_helper.c as mod-mips-dsp_helper.c=0D
  target/mips: Extract DSP helper definitions=0D
  target/mips: Extract DSP translation routines=0D
  target/mips: Extract Multi-Threading helper definitions=0D
  target/mips: Extract Code Compaction ASE translation routines=0D
  target/mips: Extract the microMIPS ISA helper definitions=0D
  target/mips: Extract the microMIPS ISA translation routines=0D
  target/mips: Extract nanoMIPS ISA translation routines=0D
  target/mips: Extract NEC Vr54xx helpers to vendor-vr54xx_helper.c=0D
  target/mips: Extract NEC Vr54xx helper definitions=0D
  target/mips: Extract NEC Vr54xx translation routines=0D
  target/mips: Rename lmmi_helper.c as loong-simd_helper.c=0D
  target/mips: Extract Loongson SIMD helper definitions=0D
  target/mips: Extract Loongson SIMD translation routines=0D
  target/mips: Extract Loongson EXTensions translation routines=0D
  target/mips: Extract XBurst Media eXtension Unit translation routines=0D
  target/mips: Make pipeline 1 multiply opcodes generic=0D
  target/mips: Extract Toshiba TXx9 translation routines=0D
  target/mips: Extract Toshiba TX79 multimedia translation routines=0D
  MAINTAINERS: Add entry for MIPS Loongson TCG=0D
  MAINTAINERS: Add entry for MIPS Ingenic Xburst TCG=0D
  MAINTAINERS: Add entry for MIPS Toshiba TCG=0D
=0D
 target/mips/fpu_helper.h                      |    50 +=0D
 target/mips/helper.h                          |   881 +-=0D
 target/mips/internal.h                        |    42 -=0D
 linux-user/mips/cpu_loop.c                    |     1 +=0D
 target/mips/fpu_helper.c                      |     1 +=0D
 target/mips/gdbstub.c                         |     1 +=0D
 target/mips/kvm.c                             |     1 +=0D
 target/mips/machine.c                         |     1 +=0D
 .../{dsp_helper.c =3D> mod-mips-dsp_helper.c}   |     2 +=0D
 .../{msa_helper.c =3D> mod-mips-msa_helper.c}   |   393 +=0D
 target/mips/op_helper.c                       |   511 -=0D
 target/mips/translate.c                       | 18598 +---------------=0D
 ...mi_helper.c =3D> vendor-loong-simd_helper.c} |     0=0D
 target/mips/vendor-vr54xx_helper.c            |   131 +=0D
 MAINTAINERS                                   |    20 +=0D
 target/mips/ase-mips16e_translate.c.inc       |  1170 +=0D
 target/mips/isa-micromips_helper.h.inc        |    17 +=0D
 target/mips/isa-micromips_translate.c.inc     |  3316 +++=0D
 target/mips/isa-nanomips_translate.c.inc      |  4839 ++++=0D
 target/mips/meson.build                       |     8 +-=0D
 target/mips/mod-mips-dsp_helper.h.inc         |   344 +=0D
 target/mips/mod-mips-dsp_translate.c.inc      |  2158 ++=0D
 target/mips/mod-mips-msa_helper.h.inc         |   443 +=0D
 target/mips/mod-mips-msa_translate.c.inc      |  2218 ++=0D
 target/mips/mod-mips-mt_helper.h.inc          |    36 +=0D
 target/mips/vendor-loong-lext_translate.c.inc |   450 +=0D
 target/mips/vendor-loong-simd_helper.h.inc    |    69 +=0D
 target/mips/vendor-loong-simd_translate.c.inc |   611 +=0D
 target/mips/vendor-tx-mmi_translate.c.inc     |   573 +=0D
 target/mips/vendor-tx_translate.c.inc         |   317 +=0D
 target/mips/vendor-vr54xx_helper.h.inc        |    24 +=0D
 target/mips/vendor-vr54xx_translate.c.inc     |    93 +=0D
 target/mips/vendor-xburst_translate.c.inc     |  2893 +++=0D
 33 files changed, 20225 insertions(+), 19987 deletions(-)=0D
 create mode 100644 target/mips/fpu_helper.h=0D
 rename target/mips/{dsp_helper.c =3D> mod-mips-dsp_helper.c} (99%)=0D
 rename target/mips/{msa_helper.c =3D> mod-mips-msa_helper.c} (94%)=0D
 rename target/mips/{lmmi_helper.c =3D> vendor-loong-simd_helper.c} (100%)=
=0D
 create mode 100644 target/mips/vendor-vr54xx_helper.c=0D
 create mode 100644 target/mips/ase-mips16e_translate.c.inc=0D
 create mode 100644 target/mips/isa-micromips_helper.h.inc=0D
 create mode 100644 target/mips/isa-micromips_translate.c.inc=0D
 create mode 100644 target/mips/isa-nanomips_translate.c.inc=0D
 create mode 100644 target/mips/mod-mips-dsp_helper.h.inc=0D
 create mode 100644 target/mips/mod-mips-dsp_translate.c.inc=0D
 create mode 100644 target/mips/mod-mips-msa_helper.h.inc=0D
 create mode 100644 target/mips/mod-mips-msa_translate.c.inc=0D
 create mode 100644 target/mips/mod-mips-mt_helper.h.inc=0D
 create mode 100644 target/mips/vendor-loong-lext_translate.c.inc=0D
 create mode 100644 target/mips/vendor-loong-simd_helper.h.inc=0D
 create mode 100644 target/mips/vendor-loong-simd_translate.c.inc=0D
 create mode 100644 target/mips/vendor-tx-mmi_translate.c.inc=0D
 create mode 100644 target/mips/vendor-tx_translate.c.inc=0D
 create mode 100644 target/mips/vendor-vr54xx_helper.h.inc=0D
 create mode 100644 target/mips/vendor-vr54xx_translate.c.inc=0D
 create mode 100644 target/mips/vendor-xburst_translate.c.inc=0D
=0D
-- =0D
2.26.2=0D
=0D

