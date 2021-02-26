Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24759326019
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:34:31 +0100 (CET)
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZW2-0005RV-1s
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZSv-00042r-SN
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:17 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:44775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZSu-0002gD-9G
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:17 -0500
Received: by mail-ej1-x62a.google.com with SMTP id w1so13655092ejf.11
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wL3AGqhYSjF9EoFbnqDL5zekUK1XsP5iyKDd4gg/r0s=;
 b=aXpnSG2C3XsFoxkq/d6QanQRR0DzTMKeyvJP5HhEheHGlI9EmmJjkykBUDojib7Ul0
 wX2lRdIXNepEiJwx4bMqVWyvWhQq1xQa3FpYmi4mT6OeqBCwzbIyw/Dw0bM7OgbjJvA6
 Adqriw96VBdt1P+2VQ1j0b5wX7C6JPEfSeZMTvdA8PsiAjjxw6UFqmvRsyDT8voY3TQn
 8phDZHUvQv34grU7Ql3Y3IBJi1fM7lR5X7Ei5zbnmMP9rYS/hVPdiehBTw5vTDCyg/jX
 bJyWbObq5LwYIDgA91rWcazDGuN9GyBfWnP0k3Iky2508g9ArDmHUPazSOGQgb7XrNq3
 VygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wL3AGqhYSjF9EoFbnqDL5zekUK1XsP5iyKDd4gg/r0s=;
 b=tpVAbN6+40/P65PXKHLXImYjO1DetZ7wmg5/ZC9izP4UEVZOVOtEYQ0aWKBRWB0u78
 rx0OSzvK+P0q9Ys/krLjCABWUokf9CsH2eZjBJ1bFnMXvAO7a8gNIjw09Riv0zk+tiE5
 oFVvc+AtHr1AzWrcZKi1QYSf8+7REZjWl2PGQDSz2wRp4vB67PCnw9yq7l+URamLIJEf
 3doW8vbbKdKnB8LJJ76NECk6ppncij6nZtjV2EmPz4M+ZBkFGGD1GQnKEtFiDMpqDNOe
 eFNg/gbBUdkzFfRZOWIejgjcTFlZhF9RprGGC4V2ZPiPL73b9qF8Zr72jOEC0UCfmHCl
 AFXw==
X-Gm-Message-State: AOAM5334zvUnq8jAugwqb8y4wuEQrIvIOkdzUwpdYDec23TvX3Gktjs7
 5DbUYRMrcZztyWXev3AmAQUphJrJngs=
X-Google-Smtp-Source: ABdhPJyE7MiqVLl6rHJISNdL+55YxZ+x/tL6JzjF2e9fbkNqDSlxm235WtZ2RNijaiYi2N20U4gyYA==
X-Received: by 2002:a17:907:78d9:: with SMTP id
 kv25mr2363748ejc.415.1614331873877; 
 Fri, 26 Feb 2021 01:31:13 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b18sm4675285ejb.77.2021.02.26.01.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:31:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/13] target/mips: Extract MXU code to new mxu_translate.c
 file
Date: Fri, 26 Feb 2021 10:30:57 +0100
Message-Id: <20210226093111.3865906-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Series fully reviewed.=0D
=0D
Since v4:=0D
- Explicit decode_opc_mxu() -> decode_ase_mxu() renaming=0D
=0D
Since v3:=0D
- addressed Richard's review comments, elide code when possible=0D
=0D
$ git backport-diff -u v4=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
ve=3D=0D
ly=0D
=0D
001/13:[----] [--] 'target/mips/meson: Introduce mips_tcg source set'=0D
002/13:[----] [--] 'target/mips/meson: Restrict mips-semi.c to TCG'=0D
003/13:[----] [--] 'target/mips: Rewrite complex ifdef'ry'=0D
004/13:[----] [--] 'target/mips: Remove XBurst Media eXtension Unit dead co=
de'=0D
005/13:[----] [--] 'target/mips: Remove unused CPUMIPSState* from MXU funct=
io=3D=0D
ns'=0D
006/13:[----] [--] 'target/mips: Pass instruction opcode to decode_opc_mxu(=
)'=0D
007/13:[----] [--] 'target/mips: Use OPC_MUL instead of OPC__MXU_MUL'=0D
008/13:[----] [--] 'target/mips: Move MUL opcode check from decode_mxu() to=
 d=3D=0D
ecode_legacy()'=0D
009/13:[down] 'target/mips: Rename decode_opc_mxu() as decode_ase_mxu()'=0D
010/13:[down] 'target/mips: Convert decode_ase_mxu() to decodetree prototyp=
e'=0D
011/13:[----] [--] 'target/mips: Simplify decode_opc_mxu() ifdef'ry'=0D
012/13:[----] [--] 'target/mips: Introduce mxu_translate_init() helper'=0D
013/13:[----] [--] 'target/mips: Extract MXU code to new mxu_translate.c fi=
le'=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (13):=0D
  target/mips/meson: Introduce mips_tcg source set=0D
  target/mips/meson: Restrict mips-semi.c to TCG=0D
  target/mips: Rewrite complex ifdef'ry=0D
  target/mips: Remove XBurst Media eXtension Unit dead code=0D
  target/mips: Remove unused CPUMIPSState* from MXU functions=0D
  target/mips: Pass instruction opcode to decode_opc_mxu()=0D
  target/mips: Use OPC_MUL instead of OPC__MXU_MUL=0D
  target/mips: Move MUL opcode check from decode_mxu() to=0D
    decode_legacy()=0D
  target/mips: Rename decode_opc_mxu() as decode_ase_mxu()=0D
  target/mips: Convert decode_ase_mxu() to decodetree prototype=0D
  target/mips: Simplify decode_opc_mxu() ifdef'ry=0D
  target/mips: Introduce mxu_translate_init() helper=0D
  target/mips: Extract MXU code to new mxu_translate.c file=0D
=0D
 target/mips/translate.h     |    4 +=0D
 target/mips/mxu_translate.c | 1609 +++++++++++++++++++=0D
 target/mips/translate.c     | 2920 +----------------------------------=0D
 target/mips/meson.build     |   13 +-=0D
 4 files changed, 1636 insertions(+), 2910 deletions(-)=0D
 create mode 100644 target/mips/mxu_translate.c=0D
=0D
--=3D20=0D
2.26.2=0D
=0D

