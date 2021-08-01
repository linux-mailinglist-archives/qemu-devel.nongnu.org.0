Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A4B3DCE3B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 02:01:18 +0200 (CEST)
Received: from localhost ([::1]:36948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mALOO-0004zC-SO
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 20:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALMi-0003Lt-Cz
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALMg-0006ih-Uh
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id x17so3111584wmc.5
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 16:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7lAC5/nMT4tDWkBtgdRUTumUErK0IQO01A5Nrqd4Bvs=;
 b=Fn0smZaq4GXPN+tSOgU9Q53V16RWCUoYSTAhniTGm+P2RVMw+BawuqlZ5aCsHun7Af
 eMS4lxhFZbw8vXHo28VM0PTHaCrBYqlUqwOhrZQlTEpM6M9HkQtbG25O834mm0bXAtw/
 NbRh6lvURUMecKFgYozRcoE4zn5/PcEzJHyiSn1RWJYOQtV2vpjRA+fMZZXcyHe3OeXS
 I2VWZgxOQCbFMSZq2NDbuPrIrALuebgREU7xMcUPPqwawRCaYZ3crmpfZZ9P+xdJfhx4
 Jj2IC8orvQzGzU6IvbFIuC2Ao4bMtpOmXefjbr5NlIAn5hmZaL+rizS0ogfytGWDSWYE
 Yifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7lAC5/nMT4tDWkBtgdRUTumUErK0IQO01A5Nrqd4Bvs=;
 b=CuMg3YP3teUw7Dn6kAfoF/wvIbo0a0Npef0ZGM1uZ+AtFR5pPSLRNP96PvV2B+FouB
 Ce+gSE1cRQf+2MxsYYXpI+ZhcnQ8S0enpx/0mG+HY3Iv918CMcr3ZSjnrcieHnX+q8AZ
 Zpk5UAJLrIlNpwRQG6+YS+GylIKW9D7dER/pAz5yW7MP6gfNvbaV9ui4r+mqZgf5U6kd
 R7bpGqeSyEmx9tE8rttzxVMvW2DDh1NKKKlh0IVfLIg7MOTHY0zSZwkWHTiJOS5q+de0
 /Xxv598CcUPpwefPNedvVm4CNt57qRj/Ej+GORbIi+U8DZl9eLx7qxFaHA4DNL6cDMJE
 Xmlg==
X-Gm-Message-State: AOAM532MsYCUkUcpqlueZrhdklAHl3qDiiJqYUdX6c9D6Gw8CAas0Fiu
 ULeBPYRSib4zWayCez2pqy2w4pF/IAefag==
X-Google-Smtp-Source: ABdhPJwZqks+WNDqars0e9E+RVCBH1I0DMEwDMuSSrM76OpgpjkrWBzw1+bdw2bqyhrSBFuLy3xg+A==
X-Received: by 2002:a7b:c213:: with SMTP id x19mr9810358wmi.186.1627862368853; 
 Sun, 01 Aug 2021 16:59:28 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 n5sm9299844wri.31.2021.08.01.16.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 16:59:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 0/5] target/mips: Convert NEC Vr54xx to decodetree
Date: Mon,  2 Aug 2021 01:59:21 +0200
Message-Id: <20210801235926.3178085-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial conversion, few more lines moved out of the huge translate.c.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  target/mips: Extract NEC Vr54xx helpers to vr54xx_helper.c=0D
  target/mips: Introduce decodetree structure for NEC Vr54xx extension=0D
  target/mips: Convert Vr54xx MACC* opcodes to decodetree=0D
  target/mips: Convert Vr54xx MUL* opcodes to decodetree=0D
  target/mips: Convert Vr54xx MSA* opcodes to decodetree=0D
=0D
 target/mips/tcg/translate.h        |   1 +=0D
 target/mips/tcg/vr54xx.decode      |  27 ++++++=0D
 target/mips/tcg/op_helper.c        | 118 ------------------------=0D
 target/mips/tcg/translate.c        |  98 +-------------------=0D
 target/mips/tcg/vr54xx_helper.c    | 142 +++++++++++++++++++++++++++++=0D
 target/mips/tcg/vr54xx_translate.c |  79 ++++++++++++++++=0D
 target/mips/tcg/meson.build        |   3 +=0D
 7 files changed, 257 insertions(+), 211 deletions(-)=0D
 create mode 100644 target/mips/tcg/vr54xx.decode=0D
 create mode 100644 target/mips/tcg/vr54xx_helper.c=0D
 create mode 100644 target/mips/tcg/vr54xx_translate.c=0D
=0D
-- =0D
2.31.1=0D
=0D

