Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E2B3E3BFA
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 19:32:36 +0200 (CEST)
Received: from localhost ([::1]:39556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCmf5-0006bN-VR
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 13:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmcx-0004my-Be
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:24 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmcv-0006J0-Lh
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:23 -0400
Received: by mail-wr1-x431.google.com with SMTP id z4so18218741wrv.11
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hMaTG7WGAPwmvq9tz7x0rhidIZO4rQrr9wrlyN0NAu8=;
 b=KH0auIrkAlzoZsEBp3OOwyxdsmw2oE2a6L65B9PYkcZGkaPbbeyS16HU2askZxbKhU
 PIs9lL8bTSB3XVfsI32qefpAtPzxN60wa/7tze9+wiAJ+huBsEpI/isretQNTyGBDdtg
 LBilDYNTtj/TlVZK58dG2hk7w1eykwxwluaRk8sY/pqVGY10UM0J1eTnUXaUNueQ+Q86
 Ds1rdykBCVJhZ2hkrEsVm0GUX1UwveEP1uJHXceum8eZiGQ/+YWYQSJ8AKtyDHIT4uqT
 wUJ6H52itof0lps+2XJM1meXwgO0R/xboEp3CbaAZ38R0HDa2vipXCUdyGT9A4nS/I4c
 bh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hMaTG7WGAPwmvq9tz7x0rhidIZO4rQrr9wrlyN0NAu8=;
 b=AVj/KlMg3S7R0yQrDNDHouonSSv42K1hBo518X9f2hf/So1Jk6Z7lxujIspB9ybLWd
 NZDV1YDke1LPT1BVnSZE2kxXUh6OqfkelvSy8JIiNFbNW5iSgknW2Q0B15u+OPAoJA0w
 jF+Zf+grDvYkDXp5T9PfIAtasngwSjUVJBScCL3P7ffkudXnd1cUElfpf8DcICxL043T
 HSmFh8k38gHkg/ggqjNGoPrfTwa2Rs4yvydMxNSfxzZ4WoxEH/18P8jHBunH0n5YIhtr
 FWBSfhJf0PCsn2Qv0Kiy+b+CY13uBmiR82MrXdRG2aRgJHTPRRItNAeN9rV4VFtaGJDL
 wPTQ==
X-Gm-Message-State: AOAM530UE7mpkkHm9mXGcC7GUWpMHk+immNOkWStMeDUmhjxIIbH1nVH
 Yc+LuoXe6ytfzftfWHM/IuL0G7SrSZE=
X-Google-Smtp-Source: ABdhPJz6+5d12UuQjeN0yZp7Jt5ehTO5jOYWQ751Kj31GawToPLiSn2jbwzOUVp+ND0CJfjYIIJzEw==
X-Received: by 2002:adf:e0c4:: with SMTP id m4mr20677409wri.312.1628443819973; 
 Sun, 08 Aug 2021 10:30:19 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 a18sm2521433wmg.43.2021.08.08.10.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 10:30:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 0/7] target/mips: Convert NEC Vr54xx to decodetree
Date: Sun,  8 Aug 2021 19:30:11 +0200
Message-Id: <20210808173018.90960-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: #1=0D
=0D
Trivial conversion, few more lines moved out of the huge translate.c.=0D
=0D
Since v2:=0D
- Move TRANS() to translate.h (rth)=0D
=0D
Since v1:=0D
- Use TRANS() macro from ppc/translate.c, per rth's comment:=0D
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg827660.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  target/mips: Introduce generic TRANS() macro for decodetree helpers=0D
  target/mips: Extract NEC Vr54xx helper definitions=0D
  target/mips: Extract NEC Vr54xx helpers to vr54xx_helper.c=0D
  target/mips: Introduce decodetree structure for NEC Vr54xx extension=0D
  target/mips: Convert Vr54xx MACC* opcodes to decodetree=0D
  target/mips: Convert Vr54xx MUL* opcodes to decodetree=0D
  target/mips: Convert Vr54xx MSA* opcodes to decodetree=0D
=0D
 target/mips/helper.h                |  18 +---=0D
 target/mips/tcg/translate.h         |   9 ++=0D
 target/mips/tcg/vr54xx_helper.h.inc |  24 +++++=0D
 target/mips/tcg/vr54xx.decode       |  27 ++++++=0D
 target/mips/tcg/op_helper.c         | 118 -----------------------=0D
 target/mips/tcg/translate.c         |  98 +------------------=0D
 target/mips/tcg/vr54xx_helper.c     | 142 ++++++++++++++++++++++++++++=0D
 target/mips/tcg/vr54xx_translate.c  |  72 ++++++++++++++=0D
 target/mips/tcg/meson.build         |   3 +=0D
 9 files changed, 285 insertions(+), 226 deletions(-)=0D
 create mode 100644 target/mips/tcg/vr54xx_helper.h.inc=0D
 create mode 100644 target/mips/tcg/vr54xx.decode=0D
 create mode 100644 target/mips/tcg/vr54xx_helper.c=0D
 create mode 100644 target/mips/tcg/vr54xx_translate.c=0D
=0D
-- =0D
2.31.1=0D
=0D

