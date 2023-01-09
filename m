Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA86631B3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:43:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyyb-0006lD-SW; Mon, 09 Jan 2023 15:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEyyX-0006kt-4P
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:42:33 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEyyV-0002sO-Ek
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:42:32 -0500
Received: by mail-ed1-x52c.google.com with SMTP id 18so14413805edw.7
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yOzJ3VJ5vGdulfKIfWme6JP1/gQuvzjt8i6hSU0RGsI=;
 b=pF991pAEhxX/EAnF34UrryrmyJ0sYy52JeqJs4ULo9rdkYLka/v0nHH+bg0N4xootd
 9jwd8MXDgXfuVonYG4kVT620k69NYTV1eA8YPwSmURboakCdJZX9/vZNd+4Yj8F+gV21
 HP9BQ/3OUPFvdmas8Ykw4yk4qp228MURBOXd357g6pQX9zV5KbMpQ63adU7XHNYZ8KkX
 1vApdARpK4gHq2TJR/CrzCJ5lrIm/yBuWgUr5aM27pOymfJ1My6QtVRlAO4wqmAoDnjC
 kQEjwnTAHCqlzcVB3J1LkUARijARg1Ex4iwf1J6TV+uzMNrb0gEulNNvr9MFdIy6/0Dt
 PD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yOzJ3VJ5vGdulfKIfWme6JP1/gQuvzjt8i6hSU0RGsI=;
 b=fxJigA/I/4+r+7x8gNL8vwzIEWAuH/EVhgii6zmJckwt1Yf4bugB/o6C4tfU96Shk+
 dIS06Sgh4b4b7Tk08C1YwtWbErXpCn41yZYFNP6+Rz8YDLpf8kJYWV+w0OpnCDsV2eZh
 gB4wamGZVwcPs99FtTnTejuGko6pgcDo+VENDinCiPfN3jVlGY8YduuWMDMoNJHiAaB8
 FRbb3hvc9d/wkA0zn/Gad7Abs7lU6rgy41+z02v2BxM5ppgKMdUWXaW2jch8dWu5PKVI
 n+rBkCsnySFeUtfJoYkjfDDvcNz9/J6dY/YE2Ap8XLJoEagX1ejjLwUFauFXtJdv+afx
 MlOQ==
X-Gm-Message-State: AFqh2kqfDfo5/P5c5m9Skwtd6x40uLVjwz35z94cPuFYX/r04ck3nPuy
 Apxy1PZAlWHub2f+Ix/Qhd8PMu/SlTc=
X-Google-Smtp-Source: AMrXdXs2IS0ibP11uiDgKqM/H1QTXrltDNPqt1S/XDUfyPD83FPXE5BB39CDyX4jq0aUPsmz+pfbCg==
X-Received: by 2002:a05:6402:5485:b0:497:c96b:4ded with SMTP id
 fg5-20020a056402548500b00497c96b4dedmr9244211edb.34.1673296949511; 
 Mon, 09 Jan 2023 12:42:29 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-30.ptr.icomera.net.
 [185.104.138.30]) by smtp.gmail.com with ESMTPSA id
 ca20-20020aa7cd74000000b0046267f8150csm4078018edb.19.2023.01.09.12.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:42:29 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/4] More precise dependency tracking for MIPS boards
Date: Mon,  9 Jan 2023 21:41:20 +0100
Message-Id: <20230109204124.102592-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series aims for cleaning up the dependency graphs of MIPS boards in or=
der=0D
to see much quicker which board uses which hardware -- and thus, which boar=
d=0D
can be used to test which hardware.=0D
=0D
The final patch has been compiled successfully multiple times for mips64el =
with=0D
only one board enabled respectively. The boards considered were:=0D
- CONFIG_MALTA=0D
- CONFIG_MIPSSIM=0D
- CONFIG_FULOONG=0D
- CONFIG_LOONGSON3V=0D
- CONFIG_JAZZ=0D
- CONFIG_MIPS_BOSTON=0D
=0D
Based-on: <20230109172347.1830-1-shentey@gmail.com>=0D
          "[PATCH v6 00/33] Consolidate PIIX south bridges"=0D
=0D
Bernhard Beschow (4):=0D
  hw/isa/Kconfig: Add missing PARALLEL dependency to ISA_SUPERIO=0D
  hw/mips/Kconfig: Remove ISA dependencies from MIPSsim board=0D
  configs/devices/mips-softmmu/common: Remove redundant selections of=0D
    SuperIO and ISA devices=0D
  hw/mips/Kconfig: Move device selections to respective boards=0D
=0D
 configs/devices/mips-softmmu/common.mak      | 16 ----------------=0D
 configs/devices/mips64el-softmmu/default.mak |  3 ---=0D
 hw/mips/mipssim.c                            |  1 -=0D
 hw/isa/Kconfig                               |  1 +=0D
 hw/mips/Kconfig                              | 15 +++++++++++++--=0D
 5 files changed, 14 insertions(+), 22 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D

