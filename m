Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3CF324432
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:59:37 +0100 (CET)
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzNo-0008CX-0s
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzLU-0005sd-IE
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzLS-0002Ui-LV
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:12 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w11so2888694wrr.10
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dj13YrzgTbtVZjjVZROsxXbo1mqZjBV3ebmaGke9Whs=;
 b=ulMrcTwHOpfPI7jAEFBwE9jtD8VETijAkHlILHwEuKGJRDMtFhI7d+JG0nUR1m1hEM
 EvOhI/VuHe/pf3YGsb47i6GZbYmceNBa5OWiI85ejVUnywZ5fq4GZ8U21xdK2PO/O8ik
 XJKaNMACg86zteIhjxEJBXnus0BX+KV7Bam1DkWUKg0uEjXZWJN9zTyMNg9P8/y71irE
 G/FAjjuBuPqKog06EG0v7oOJI8B/LLD57q+DpNzbHf8OKQRJwjgr/FXM7QN7TRNY5Zt0
 WHHux9SnI1yNgTVnm9Mvy8s6kZ0KacieTKmuynnIvqtJ8mRHq6IL44LvvlhlNSpf/0mX
 OIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Dj13YrzgTbtVZjjVZROsxXbo1mqZjBV3ebmaGke9Whs=;
 b=rLfDkNcGBiWzH8nldgyOTbPsBdr5MV6odE5X4GOf4/zZcnMvDLpW3vvh9M5ewWkJlT
 Bub4mm8z9ATaH53mQMk/273mZ5WB7y0t2rQD1qyFhvxTQKS5Qr2RDKIcRYTrUCkNW7Ee
 MN/hhLnV1BJXfav4mkd9vBCxgj3ie6awa4zb8UDM64ZOHILF3EjBbsrdbeSWTHcEQFeS
 NbMhlygoFyUV+/bAfbC/+CXA3CXOdlqyPFx3KRGEJU0uF9IOVhTxzLh5ZIn2Twcab+sd
 ybe+Qr4A3FbQhxaT4W+JcvVJC+DHtQVe+Xu3U6lsC1VCJGoVl024zDX5VIyGoP9X7G/s
 1btw==
X-Gm-Message-State: AOAM530nVyGIiIvpnhN4iHh+SJXK2eZGeiu051kFD1GNHH68mBuyu7wU
 Y3Mw9zlvw8KFQVCp6JRrmVy/AiXjlIM=
X-Google-Smtp-Source: ABdhPJxdIGAFHXInamOR9bzPU5jw+uMbfYXay4aaqpKMjHAfgrQxW9cocagCoANeov6miooG9CkY0g==
X-Received: by 2002:a5d:4521:: with SMTP id j1mr6268903wra.354.1614193028780; 
 Wed, 24 Feb 2021 10:57:08 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u4sm4849164wrr.37.2021.02.24.10.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:57:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/12] target/mips: Extract MXU code to new mxu_translate.c
 file
Date: Wed, 24 Feb 2021 19:56:54 +0100
Message-Id: <20210224185706.3293058-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v3:=0D
- addressed Richard's review comments, elide code when possible=0D
=0D
This is a respin of "Extract XBurst Media eXtension Unit=0D
translation routines" v2:=0D
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05889.html=0D
=0D
But instead of an included C file (.c.inc) we now have an=0D
independent C unit. We gain faster recompilation time when=0D
hacking translate.c or mxu_translate.c, and we also gain=0D
in code maintainability.=0D
=0D
$ git backport-diff -u v3=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
ve=3D=0D
ly=0D
=0D
001/12:[down] 'target/mips/meson: Introduce mips_tcg source set'=0D
002/12:[down] 'target/mips/meson: Restrict mips-semi.c to TCG'=0D
003/12:[----] [--] 'target/mips: Rewrite complex ifdef'ry'=0D
004/12:[----] [--] 'target/mips: Remove XBurst Media eXtension Unit dead co=
de'=0D
005/12:[----] [--] 'target/mips: Remove unused CPUMIPSState* from MXU funct=
io=3D=0D
ns'=0D
006/12:[----] [--] 'target/mips: Pass instruction opcode to decode_opc_mxu(=
)'=0D
007/12:[0002] [FC] 'target/mips: Use OPC_MUL instead of OPC__MXU_MUL'=0D
008/12:[down] 'target/mips: Move MUL opcode check from decode_mxu() to deco=
de=3D=0D
_legacy()'=0D
009/12:[down] 'target/mips: Convert decode_opc_mxu() to decodetree prototyp=
e'=0D
010/12:[down] 'target/mips: Simplify decode_opc_mxu() ifdef'ry'=0D
011/12:[0011] [FC] 'target/mips: Introduce mxu_translate_init() helper'=0D
012/12:[0037] [FC] 'target/mips: Extract MXU code to new mxu_translate.c fi=
le'=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (12):=0D
  target/mips/meson: Introduce mips_tcg source set=0D
  target/mips/meson: Restrict mips-semi.c to TCG=0D
  target/mips: Rewrite complex ifdef'ry=0D
  target/mips: Remove XBurst Media eXtension Unit dead code=0D
  target/mips: Remove unused CPUMIPSState* from MXU functions=0D
  target/mips: Pass instruction opcode to decode_opc_mxu()=0D
  target/mips: Use OPC_MUL instead of OPC__MXU_MUL=0D
  target/mips: Move MUL opcode check from decode_mxu() to=0D
    decode_legacy()=0D
  target/mips: Convert decode_opc_mxu() to decodetree prototype=0D
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

