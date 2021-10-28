Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D845343EA08
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:12:21 +0200 (CEST)
Received: from localhost ([::1]:44752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgChA-0000cC-C7
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCdm-0006VG-Jm
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:08:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCdj-0004QD-QD
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:08:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id v17so12431124wrv.9
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rUc5njoMlEyhGUU57Uk5sqe8eQUnnGM0ikFKSbGWCJw=;
 b=M1LPGm+z6nBO2AKd1BAsiVgBrmbbdjHPJ7JZ//a94wykK2s9mMHe79Jra97BVGl8n5
 t4hIvcfBZ7rE73BgXd1LpDRknPDwNbNTU4t1GFpr5zVMagKkSCp9kB5sH5zImyCueH0v
 E8icxPmLTVp7biE1ucwWy9DQcDCGhpfJ1usx0UbUSGbb1gXTxRC4DCw48cZbUlSok8oG
 E0RkW5vjirDslh7I8LYX9YLBgAF8EE4OdicAFb+dFnmDP65b+4sIPtMHRhKUoofRsGkk
 tlhZeViKnuvNiOcOutjKWb+CU0IYKJajFH/bQNm15PVJAdBeZ5ayYAvmDALfAJ7CzLDg
 7GtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rUc5njoMlEyhGUU57Uk5sqe8eQUnnGM0ikFKSbGWCJw=;
 b=2QmbSK+Df5T+VrQ5Xty3swBa86i/9txxwR9/GB3a0n7M02B5p2Otq4MMr2Qyu5IjvL
 HQAJUppsMJQBvsURu4DpO7szquUYhZ/On+NmVJndnvhDSwdmRWlsWJIr6ba/9Mq4aRyZ
 j2SuJE642ritMnfk3KdZfd9lFRpFZ5s1bCD8Lv3Bw8XsJ3FuLDZTWxKZ3mJlT6HW4DlM
 RwvM+/ryDReWaeoU4j7ixmQncuirKo+U06HC9JA65BoAUnwYiq+3zmWn1ZiLSfgqs2qf
 OBnjXNdIb3HRgGOEx98PX8q1SCyr5ZrNml8hI+UgzIlxOS3R4zlMMF3mxY7gsIZr2O9e
 Ro2A==
X-Gm-Message-State: AOAM530Ie5WZ5j10xxm04gnNTA5UQZ4PFTYo/lj6NrRqaWfNnYfyfb21
 UJPO7JIaf/N/RQaYOzBWqPvOHi4K9Mw=
X-Google-Smtp-Source: ABdhPJyEGhUKxAY4f1J0UppHJvAwlDe2NH+ZSuIzsuuzqV/bBDPlweTiPRyWlGgdBi0sGz4uZuCsSA==
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr8926803wrd.165.1635455325709; 
 Thu, 28 Oct 2021 14:08:45 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n25sm4265297wms.10.2021.10.28.14.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:08:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/32] target/mips: Fully convert MSA opcodes to decodetree
Date: Thu, 28 Oct 2021 23:08:11 +0200
Message-Id: <20211028210843.2120802-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: 3 & 4 (Not reviewed by Richard: 10, 18, 21, 25)=0D
=0D
Since v2/v1:=0D
- Addressed Richard comments (thanks, I learned a lot doing so!=0D
  Although I consider this series 'boring' I enjoyed working on=0D
  your review comments).=0D
Since v1:=0D
- Included Jiaxun R-b tags, but they are conditional on Richard=0D
  ones.=0D
=0D
v1 unchanged cover:=0D
=0D
Hi,=0D
=0D
This series converts 2000+ lines of switch() code to decodetree=0D
description, so this hard-to-review/modify switch is auto generated=0D
by the decodetree script. This is a big win for maintenance (and=0D
indeed the convertion revealed 2 bugs).=0D
=0D
Massive convertions are - beside being often boring - bug-prone.=0D
In this series we re-start running the MSA tests (the tests are=0D
run automagically in the 'build-user-static' job on gitlab CI).=0D
=0D
Although boring, the conversion is very clean, so I hope it will=0D
be easy enough to review. The TRANS*() macros are heavily used.=0D
=0D
When possible, constant fields are hold with tcg_constant().=0D
=0D
Note, various opcodes can be optimized using TCG host vectors.=0D
We won't address that in this series, as it makes the resulting=0D
review harder. We will post that in a following series. Here we=0D
simply dummy-convert.=0D
=0D
The resulting msa.decode file is quite pleasant to look at, and=0D
the diff-stat is encouraging: number of LoC halved.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
git: https://gitlab.com/philmd/qemu.git tree/mips-msa-decodetree=0D
Based-on: <20211023164329.328137-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (32):=0D
  target/mips: Fix MSA MADDV.B opcode=0D
  target/mips: Fix MSA MSUBV.B opcode=0D
  tests/tcg/mips: Run MSA opcodes tests on user-mode emulation=0D
  target/mips: Use dup_const() to simplify=0D
  target/mips: Have check_msa_access() return a boolean=0D
  target/mips: Use enum definitions from CPUMIPSMSADataFormat enum=0D
  target/mips: Rename sa16 -> sa, bz_df -> bz -> bz_v=0D
  target/mips: Convert MSA LDI opcode to decodetree=0D
  target/mips: Convert MSA I5 instruction format to decodetree=0D
  target/mips: Convert MSA BIT instruction format to decodetree=0D
  target/mips: Convert MSA SHF opcode to decodetree=0D
  target/mips: Convert MSA I8 instruction format to decodetree=0D
  target/mips: Convert MSA load/store instruction format to decodetree=0D
  target/mips: Convert MSA 2RF instruction format to decodetree=0D
  target/mips: Convert MSA FILL opcode to decodetree=0D
  target/mips: Convert MSA 2R instruction format to decodetree=0D
  target/mips: Convert MSA VEC instruction format to decodetree=0D
  target/mips: Convert MSA 3RF instruction format to decodetree=0D
    (DF_HALF)=0D
  target/mips: Convert MSA 3RF instruction format to decodetree=0D
    (DF_WORD)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    1/4)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    2/4)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    3/4)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    4/4)=0D
  target/mips: Convert MSA ELM instruction format to decodetree=0D
  target/mips: Convert MSA COPY_U opcode to decodetree=0D
  target/mips: Convert MSA COPY_S and INSERT opcodes to decodetree=0D
  target/mips: Convert MSA MOVE.V opcode to decodetree=0D
  target/mips: Convert CFCMSA opcode to decodetree=0D
  target/mips: Convert CTCMSA opcode to decodetree=0D
  target/mips: Remove generic MSA opcode=0D
  target/mips: Remove one MSA unnecessary decodetree overlap group=0D
  target/mips: Adjust style in msa_translate_init()=0D
=0D
 tests/tcg/mips/ase-msa.mak         |   30 +=0D
 target/mips/tcg/msa.decode         |  243 ++-=0D
 target/mips/tcg/msa_helper.c       |   64 +-=0D
 target/mips/tcg/msa_translate.c    | 2743 +++++++---------------------=0D
 MAINTAINERS                        |    1 +=0D
 tests/tcg/mips/Makefile.target     |    5 +=0D
 tests/tcg/mips64/Makefile.target   |    9 +=0D
 tests/tcg/mips64el/Makefile.target |   12 +=0D
 tests/tcg/mipsel/Makefile.target   |    9 +=0D
 9 files changed, 970 insertions(+), 2146 deletions(-)=0D
 create mode 100644 tests/tcg/mips/ase-msa.mak=0D
 create mode 100644 tests/tcg/mips64/Makefile.target=0D
 create mode 100644 tests/tcg/mips64el/Makefile.target=0D
 create mode 100644 tests/tcg/mipsel/Makefile.target=0D
=0D
-- =0D
2.31.1=0D
=0D

