Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5353C3DCE21
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 01:44:47 +0200 (CEST)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAL8Q-0004RR-C5
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 19:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAL5t-0002VO-3g
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:42:09 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAL5q-0003iG-Gi
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:42:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id x17so3097858wmc.5
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 16:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W4oFm4D6gS04bIKsWR2XhXjXG3mrAoRhdMVRkTjrJvI=;
 b=Xmr7WnaH0KcOVH5Jk9IqLouqoo7bOQT9EkjVAPIDzRbqudvqectCL+MeqivRnMp46A
 Ep4apSfB318hwKwAFMxfHT7FQkRy2+F88TIS0GOTbU+/eXSFlnZmoPhEPpHTkseiXnGh
 OEconP8vJQodI2Py5tFKw9+bVdilfhPcNOYz5MV70/ypMDdZ2cxUYQEgIt9Ah5lIG2zT
 9WlouzmQXPMxMKtpBzKzKxxpmqr2qPfj87TI/HmCLvO133j1Bt7e6AfH/Tw9VKmaDTi7
 FeZZrZUdMJpJmZDLOrhZHr+UYFcrDWzMVG3Kfgm4g4my3qzFEVF32CwVCz5Wg2frmL/9
 G57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=W4oFm4D6gS04bIKsWR2XhXjXG3mrAoRhdMVRkTjrJvI=;
 b=PpXWkex5YBVOpmzT9V9nBikfX00Rjj2wFHk6xukSKYRnlew/VSRmrbkLcuhn26bbCo
 eusR99+YihYyhY6Nl9Y7QipPg8BNTZk8oQh1k0hA56toZnw+qBI9Gf2pDFuwwxEzQ4oc
 Lm8PnPM0+BGU6mqRbq8yEnD5sPvYYs+3o8Xs1if+ob6Qmh4bb+HAsKX+e28vV++a0/eh
 AWm/tHs3JTxCG0XkGe2D20pJspNeL9rroaKQODU9ihZRW1jzI8T4nt8TLWSYOHgd1RWf
 esxxtSI3kakKNI9VHRhokignffd/IqXQV80lOpDh8dwrR3R2zZpwA86xCOG3y0NSgaf8
 7Jpw==
X-Gm-Message-State: AOAM533nzPTpMfmewscUrX0fnZXUqrps3pxVSWCVQCmD3zZpGfmD92TP
 aYv33YKuYd/y3Pkl8ZdVr0zMYsCosqNWYQ==
X-Google-Smtp-Source: ABdhPJyqlxR7lxZu22NA21YP9/Q+eNoOpV/Ou/wLxn7PXK5astvHfY5V+faAajQeLFlmEDIzNBTZPQ==
X-Received: by 2002:a7b:c204:: with SMTP id x4mr13753255wmi.70.1627861324304; 
 Sun, 01 Aug 2021 16:42:04 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 u11sm9262173wrr.44.2021.08.01.16.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 16:42:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 0/4] target/mips: Decodetree housekeeping
Date: Mon,  2 Aug 2021 01:41:58 +0200
Message-Id: <20210801234202.3167676-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

Minor cleanups while looking at converting more opcodes to decodetree.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  target/mips: Simpify PREF opcode=0D
  target/mips: Decode vendor extensions before MIPS ISAs=0D
  target/mips: Merge 32-bit/64-bit release6 decodetree definitions=0D
  target/mips: Rename 'rtype' as 'r'=0D
=0D
 target/mips/tcg/mips64r6.decode               | 27 --------=0D
 target/mips/tcg/msa.decode                    |  4 +-=0D
 .../mips/tcg/{mips32r6.decode =3D> rel6.decode} | 17 ++++-=0D
 target/mips/tcg/tx79.decode                   | 14 ++---=0D
 target/mips/tcg/msa_translate.c               |  4 +-=0D
 target/mips/tcg/rel6_translate.c              | 20 +++---=0D
 target/mips/tcg/translate.c                   | 16 +++--=0D
 target/mips/tcg/tx79_translate.c              | 62 +++++++++----------=0D
 target/mips/tcg/meson.build                   |  3 +-=0D
 9 files changed, 72 insertions(+), 95 deletions(-)=0D
 delete mode 100644 target/mips/tcg/mips64r6.decode=0D
 rename target/mips/tcg/{mips32r6.decode =3D> rel6.decode} (64%)=0D
=0D
-- =0D
2.31.1=0D
=0D

