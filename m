Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50DE2B979C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:19:28 +0100 (CET)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmed-0000sw-MI
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmca-0007ch-9W
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:20 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmcY-0006QQ-Px
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:19 -0500
Received: by mail-wr1-x436.google.com with SMTP id o15so7047476wru.6
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VuHeoxQ87kDmF4w49Na9+smPzrx1RQcSNnlEhYHw+W8=;
 b=uJEVsSmJ6USSIEpleKQf7VDbUxKN95N1JA9Tq8iZPnu1zT6CT+1Fj1pQXI6pdpjItz
 VF0OMa28vrUA243g2frCdvyJgGUiHaQ76FhKXfXLtKjo/MIg7HNIdf59M1NCqvMuZr/R
 cXCbwUYEk8CYRgv94luqOXaxa/3H5SZe4NrxhexGqXa0dmw7OZwAkNvgpriubuFmHwU/
 qF/irn+XVMp9rZGIzT+DjBiAIQPG28hoMO1xhEAvdPATxIp1GB+HMrvTb+o/NY81RACm
 blABorm2YBnqrFdJbcLNfHQbksfWLDJ8sCA1pLAkCizdQSvdXoRwftjGpHnBP9sqMyst
 0KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VuHeoxQ87kDmF4w49Na9+smPzrx1RQcSNnlEhYHw+W8=;
 b=az7G2BtU60oQhjd5Y/0Bt6MesGgVpQmoSs8Zlm9oVnLurJInHL9ptshAJkGxfzQKx0
 yTFuGV00pxbQEBYb6ue3k8F1h+x06aMbPRIKoh6blDJAPHZ2657n4hCRZWKEmJDI07xd
 HhzbC77/G8N/Z8ofwDqpP8THnUPH73CwFfFvwiLd2uh49leQSscISsMo46zjaO/F7cpS
 J02EPb/OIdp2oO9HeiVlVLi6lFDyBszbmUjJ7S65C9TDtjmFOjaXeWLQiq2KiA+cmMmo
 R0dzTr/qOZa+KiNjN389zHEFi5ove98btM2egPkT/O5EirDf2ZMwASpONdQwqspFkXCZ
 holQ==
X-Gm-Message-State: AOAM5317keeo2DvB/4lGOXSolUBat/Z7nl7icgn5DdSxs/TZGaw1ylwT
 VPgOt1kkZfa65QQnnshXiyqOfz+Y9+0=
X-Google-Smtp-Source: ABdhPJzSO6adJ0iMmG2Z9ihQPHPw9Nnu5l4h5BdcY3K5DCaRkNqEgZCTfewlUU8u6MINqs3C6dA9Yg==
X-Received: by 2002:adf:f783:: with SMTP id q3mr10652843wrp.88.1605802633078; 
 Thu, 19 Nov 2020 08:17:13 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id q16sm379948wrn.13.2020.11.19.08.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 08:17:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] linux-user: Support o32 ABI with 64-bit MIPS CPUs
Date: Thu, 19 Nov 2020 17:17:06 +0100
Message-Id: <20201119161710.1985083-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series allow building linux-user emulator to run ELF=0D
binaries built for the MIPS o32 ABI on 64-bit CPUs (binaries=0D
produced by Sony Linux Toolkit for Playstation 2 for the=0D
R5900 CPU).=0D
=0D
The new QEMU binary is named 'qemu-mips64o32'.=0D
=0D
The binfmt config isn't correct, as it matches mipsel/mipsn32el.=0D
I missed to understand how mipsel (o32) and mipsn32el (n32) are=0D
differenciated.=0D
=0D
Based-on: <20201119160838.1981709-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  linux-user/mips64: Restore setup_frame() for o32 ABI=0D
  linux-user/mips64: Support o32 ABI syscalls=0D
  default-configs: Support o32 ABI with 64-bit MIPS CPUs=0D
  RFC qemu-binfmt-conf.sh: Add MIPS64 o32 ABI=0D
=0D
 docs/user/main.rst                                 | 3 +++=0D
 default-configs/targets/mips64o32el-linux-user.mak | 7 +++++++=0D
 linux-user/mips64/syscall_nr.h                     | 5 ++++-=0D
 linux-user/mips64/target_signal.h                  | 4 ++++=0D
 scripts/qemu-binfmt-conf.sh                        | 4 ++++=0D
 5 files changed, 22 insertions(+), 1 deletion(-)=0D
 create mode 100644 default-configs/targets/mips64o32el-linux-user.mak=0D
=0D
-- =0D
2.26.2=0D
=0D

