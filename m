Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF79359577
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:27:49 +0200 (CEST)
Received: from localhost ([::1]:59984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUkcN-0006N2-KV
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkYs-0004MB-Nw; Fri, 09 Apr 2021 02:24:12 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkYn-0001MF-R8; Fri, 09 Apr 2021 02:24:09 -0400
Received: by mail-ed1-x532.google.com with SMTP id r22so5165164edq.9;
 Thu, 08 Apr 2021 23:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=unWtyp00EIG+trwkOMZtQwQSkR4tc9ZFeQc/jgRGLOQ=;
 b=kFA0PGDOzgqTxaGBzmsi1hdW8B5G50aplVdC/NJfGy+R8GMWE4ALVLqyuz2GlSMi+8
 Drl5RG/+F7JX6soAwq2B7NnU/+AUoHGE+03d3sB9oo/CB4qVKX5sBIZ3xET3qIkgFmON
 5UUvZaxrBcGle0bOMlRhM6TmBMlh+7/wqCzQBSQ2XLx9t+8V6/3ffhP9TzJof5rP/gva
 PaZyR4lcwYUMMSR5OGdkeABW/fjXCn1dWkTFdjMdeZ8ADj+tUPRtH7Iin/tauGarMoIS
 C59lZTeN6/agbM/JY20nbVOB76oE7aIJwkqbbcvg4xoDXLZKVHbmapvknm6xAxcYObKB
 sR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=unWtyp00EIG+trwkOMZtQwQSkR4tc9ZFeQc/jgRGLOQ=;
 b=uUj45mFbEO0WZh8Awx/CKZSiaSjPBLOqY4GiPdPJnsUKWv7TReHkLCfPfVyzWfat+S
 ffKgXZLSFFc2tJZGDM1yTdRSdDWFwa34Z662OZYO50yAzrGhDtAO3hilqDkgKBsVgGb9
 POgrCWVu+CQQK64ktslwl98B2/xw6nFBxkh2oajMIctrjTEVvRFJI593lzwNmwHJHJvI
 pkclhjSIeQ5JG1+Sct57iIoHIqB4XKfXmb/Dig+q8RoyKBlaKz+iqbHCxZhTgaPDz3CV
 dBLlvmjrUVHTd4irOWOdU9cZyaR5uUlH+GrTpHNKZ4NfPcfa3JKW74fAWJynCyAk0Rge
 MZMw==
X-Gm-Message-State: AOAM531/SGJfa0lMt8PdjazuTHrK3eoJTMj0Lr4edlwXchEN5ZSHQfFY
 EBoF5AcGnS9jNLo5CEouz0ddI7T9odxixg==
X-Google-Smtp-Source: ABdhPJwMnRJSS1l5EBboXXC/yatXr32Wr8qWRb0Syatwp+xJauMZqI2aFEUhQgxX39UBksUNEzNyqQ==
X-Received: by 2002:aa7:d5c9:: with SMTP id d9mr15710940eds.335.1617949443609; 
 Thu, 08 Apr 2021 23:24:03 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a27sm717738ejk.80.2021.04.08.23.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:24:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev) clock
 propagation
Date: Fri,  9 Apr 2021 08:23:52 +0200
Message-Id: <20210409062401.2350436-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Damian, Luc, Peter.=0D
=0D
I've been debugging some odd issue with the clocks:=0D
a clock created in the machine (IOW, not a qdev clock) isn't=0D
always resetted, thus propagating its value.=0D
"not always" is the odd part. In the MPS2 board, the machine=0D
clock is propagated. Apparently because the peripherals are=0D
created directly in the machine_init() handler. When moving=0D
them out in a SoC QOM container, the clock isn't... I'm still=0D
having hard time to understand what is going on.=0D
=0D
Alternatively I tried to strengthen the clock API by reducing=0D
the clock creation in 2 cases: machine/device. This way clocks=0D
aren't left dangling around alone. The qdev clocks are properly=0D
resetted, and for the machine clocks I register a generic reset=0D
handler. This way is safer, but I don't think we want to keep=0D
adding generic reset handlers, instead we'd like to remove them.=0D
=0D
I'll keep debugging to understand. Meanwhile posting this series=0D
as RFC to get feedback on the approach and start discussing on=0D
this issue.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  hw/core/clock: Increase clock propagation trace events verbosity=0D
  hw/core/machine: Add machine_create_constant_clock() helper=0D
  hw/arm: Use new machine_create_constant_clock() helper=0D
  hw/mips: Use new machine_create_constant_clock() helper=0D
  hw/core/qdev-clock: Add qdev_ground_clock() helper=0D
  hw/misc/bcm2835_cprman: Use qdev_ground_clock() helper=0D
  hw/misc/bcm2835_cprman: Feed 'xosc' from the board=0D
  hw/clock: Declare clock_new() internally=0D
  hw/core/machine: Reset machine clocks using qemu_register_reset()=0D
=0D
 hw/core/clock-internal.h         | 32 ++++++++++++++++++++++++++++++++=0D
 include/hw/boards.h              | 17 +++++++++++++++++=0D
 include/hw/clock.h               | 13 -------------=0D
 include/hw/misc/bcm2835_cprman.h |  2 --=0D
 include/hw/qdev-clock.h          |  9 +++++++++=0D
 hw/arm/bcm2835_peripherals.c     |  1 +=0D
 hw/arm/bcm2836.c                 |  1 +=0D
 hw/arm/mps2-tz.c                 |  6 ++----=0D
 hw/arm/mps2.c                    |  3 +--=0D
 hw/arm/musca.c                   |  6 ++----=0D
 hw/arm/raspi.c                   |  4 ++++=0D
 hw/core/clock.c                  |  9 ++++++++-=0D
 hw/core/machine.c                | 20 ++++++++++++++++++++=0D
 hw/core/qdev-clock.c             | 12 ++++++++++++=0D
 hw/mips/fuloong2e.c              |  4 ++--=0D
 hw/mips/jazz.c                   |  6 +++---=0D
 hw/mips/loongson3_virt.c         |  4 ++--=0D
 hw/mips/mipssim.c                |  7 ++++---=0D
 hw/misc/bcm2835_cprman.c         | 12 +++---------=0D
 MAINTAINERS                      |  1 +=0D
 hw/core/trace-events             |  3 ++-=0D
 21 files changed, 126 insertions(+), 46 deletions(-)=0D
 create mode 100644 hw/core/clock-internal.h=0D
=0D
-- =0D
2.26.3=0D
=0D

