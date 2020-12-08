Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A762D3591
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:50:40 +0100 (CET)
Received: from localhost ([::1]:45472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmksZ-0001ZX-Se
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjT-00047E-4y
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:11 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjR-0008Aw-0d
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:10 -0500
Received: by mail-ej1-x635.google.com with SMTP id ce23so22764408ejb.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=89tDxb1NG5RhKGPI5IblTTONwvbtQrZRv1iQAnxqkp4=;
 b=RmsWMC1XwdapgWVn4d9EapH8W8iLX3YuUpRhVHpjtLYSDIJ1mu2qx1f0LExfL/2fFz
 Lt31PPZsU0aqS10PChlEo8pn/6kmcL1KWmIktGge8iVEPf6c6dMC5UuPsx5WrpFgCP1+
 7VIX2IML7/S1bt/ulFrTQfQ6tji8pddv7IBxUnXc7tPQ0yIq+nFhbjsJ4LwdrbF7xekZ
 IemKpXjMvXz0Pb/0ijPy2TCqtbS6YB7g2p8TZ0nt+QkKc9gkF3Y1KJq0So8fb+GdoI2u
 +atC4BhKzP8SFNKFS8zlqmEVb7MGT020mqAx2FR7Qni+Ya19pHz3M721PLYL76K7yRvT
 XiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=89tDxb1NG5RhKGPI5IblTTONwvbtQrZRv1iQAnxqkp4=;
 b=oIANukYp6qpgCYWhQQbJCNV8gPcxz0TXjl1GyPMjvOsqbExIGgH4p1n02mSlpR341Y
 9KFz6UoxK+cgiyLg8GNThp5qYRaM/MbpmhXN3K51F+TvinsSEGuPy0qo263CFu0c9Dbj
 s2sRh8HSRJC4S7Z1K1r/oWJVJ7ekOeSfQritJIYDhQC5UuM4+dUnj0eLfzydRPcU0MbY
 r8qiYOddkiOPTbdW0vRqRDsFZynWHM1lBUsTf6IjROSjmU4K2ILMwM3bQ9H84ci4P98V
 hjWsgT9brUbWOExnKG6heA+CLKpodiioKxtOTs/L4dtWqpzW4sRIXIB50TeQYvbyaoth
 A+nw==
X-Gm-Message-State: AOAM532fDso0QZ1H4X8a1/4S+VaECA46zYsbuZ/mc7qRP31dLJ5Oh5F+
 vYHDlnbzjWQRfPKAsTQVd4Tqx2zJO1M=
X-Google-Smtp-Source: ABdhPJy56OFeDb7/zSP/aWY/tipeb+r02WRH7MO8uh9Wz3ZxLl3mudhUH4/zsFfQ7rfR9q0CmNXiZA==
X-Received: by 2002:a17:906:af49:: with SMTP id
 ly9mr19357538ejb.38.1607459826936; 
 Tue, 08 Dec 2020 12:37:06 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id u26sm17800029edo.37.2020.12.08.12.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/13] target/mips: Convert LSA/DLSA and part of the Rel6
 removed opcodes
Date: Tue,  8 Dec 2020 21:36:51 +0100
Message-Id: <20201208203704.243704-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Complete the MSA conversion with the LSA/DLSA opcodes,=0D
which are shared with the Release 6.=0D
=0D
Keep going converting the removed opcodes.=0D
=0D
We now have 2 decoders on 32-bit, and 4 on 64-bit.=0D
=0D
Extensions are decoded first, then ISA.=0D
=0D
I might introduce a macro to have a generic decode()=0D
function to hide the 32/64 check, to keep the main=0D
decode_opc() loop easy to review.=0D
=0D
Series available here:=0D
https://gitlab.com/philmd/qemu/-/tree/mips_decodetree_lsa_r6=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (13):=0D
  !fixup "target/mips/translate: Add declarations for generic code"=0D
  target/mips: Extract LSA/DLSA translation generators=0D
  target/mips: Introduce decodetree helpers for MSA LSA/DLSA opcodes=0D
  target/mips: Introduce decodetree helpers for Release6 LSA/DLSA=0D
    opcodes=0D
  target/mips: Remove now unreachable LSA/DLSA opcodes code=0D
  target/mips: Convert Rel6 Special2 opcode to decodetree=0D
  target/mips: Convert Rel6 COP1X opcode to decodetree=0D
  target/mips: Convert Rel6 CACHE/PREF opcodes to decodetree=0D
  target/mips: Convert Rel6 LWL/LWR/SWL/SWR opcodes to decodetree=0D
  target/mips: Convert Rel6 LWLE/LWRE/SWLE/SWRE opcodes to decodetree=0D
  target/mips: Convert Rel6 LDL/LDR/SDL/SDR opcodes to decodetree=0D
  target/mips: Convert Rel6 LLD/SCD opcodes to decodetree=0D
  target/mips: Convert Rel6 LL/SC opcodes to decodetree=0D
=0D
 target/mips/translate.h               | 21 +++++-=0D
 target/mips/isa-mips32r6.decode       | 36 ++++++++++=0D
 target/mips/isa-mips64r6.decode       | 26 +++++++=0D
 target/mips/mod-msa32.decode          |  4 ++=0D
 target/mips/mod-msa64.decode          | 17 +++++=0D
 target/mips/isa-mips_rel6_translate.c | 40 +++++++++++=0D
 target/mips/mod-msa_translate.c       | 15 ++++=0D
 target/mips/translate.c               | 98 +++++++--------------------=0D
 target/mips/translate_addr_const.c    | 54 +++++++++++++++=0D
 target/mips/meson.build               |  9 +++=0D
 10 files changed, 245 insertions(+), 75 deletions(-)=0D
 create mode 100644 target/mips/isa-mips32r6.decode=0D
 create mode 100644 target/mips/isa-mips64r6.decode=0D
 create mode 100644 target/mips/mod-msa64.decode=0D
 create mode 100644 target/mips/isa-mips_rel6_translate.c=0D
 create mode 100644 target/mips/translate_addr_const.c=0D
=0D
-- =0D
2.26.2=0D
=0D

