Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0746D399D6B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:08:02 +0200 (CEST)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojKb-0003V9-3X
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojG0-0003nc-Nj
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:16 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojFy-0008SU-B1
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:16 -0400
Received: by mail-ej1-x636.google.com with SMTP id g8so8168520ejx.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=osXGq53UvZ57uuTLXwvdVHc4OxoEbaQE10RT0WZMp6M=;
 b=BFT4QKH0D/xOXYsrDr45W8BefFEqgGk/KDEBNqomQC8RwtiU8/aX6gnbX4a4T7Ogys
 4lFxXsXX3X1JJBFP5b5NyBYHWupf9NRa5NXSpCy5UzkMyJ2npee/tTwZQwnyVI1qj1VE
 JTxNH3uKSkqdr2bJsNjmzMSM/QRkYu7vNkBzx8Rcy/t3FlGoaJwalf2nNtE/PyRZEv7h
 Zqjj5r1R/PPx7B5G2KglEzZlMY49cpXw75T32bzxqSVdQgSfoRkynl21R8ktd0WLcvpv
 vYG1qkLRcviHqBNmiksKQWrP9W9YYaeZ4vobQd3nOWBaRFhSwX+nLXBLwmBEQ+LLtVWB
 Rh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=osXGq53UvZ57uuTLXwvdVHc4OxoEbaQE10RT0WZMp6M=;
 b=HWJD6Rhfb/qnDrc6DXvub4RoNeon40Py5bcsMZ64RoiWmiLDd77uUMFcI6bJfdhmL7
 COkMZcl9y4P7yy9Kowqm053VNiZaw9L2XvWUhP7U3mMiAFPqjqxpGfXTzTcqjs4V+XRF
 nFzEt6UAsogDakiemB3J5yqgYvpakk7YbP4mwlyofhfHa41F17pn7f0t9UBi3feqijzI
 TZi8kvnu5wsZz1Lf5xt9jeC2ra1n4K8WtOV80ZH9v+h2iIWUv6uT8fwcGF1q0dVIv9p8
 jHuioShepUbBZhNKYOxXsqjBAKVwhDOcpMebp0t9lIbFCboH9RMVl3PecnJucoPCTiVE
 3Rhw==
X-Gm-Message-State: AOAM532YpuMoamg+SKCHTssjWIVtpgQTKK5WJowFkEDcS3DR41Stw90A
 vkxwO+28D7jWXtofvspoAfhKOiLrZI2SUg==
X-Google-Smtp-Source: ABdhPJx87ZZHPp/NIF1z9eiN3SnPjwe/ffUgw0AOfoiw6jsHkFXDODDjFdin5VIsIzsY+g3WD80S0Q==
X-Received: by 2002:a17:906:c00f:: with SMTP id
 e15mr40644353ejz.458.1622710992605; 
 Thu, 03 Jun 2021 02:03:12 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id z19sm491653edr.77.2021.06.03.02.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:03:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] target/microblaze: Clean up MMU translation failed path
Date: Thu,  3 Jun 2021 11:03:04 +0200
Message-Id: <20210603090310.2749892-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,=0D
=0D
While reviewing/auditing how each arch handles failed MMU=0D
transactions, I noticed some confusing code regarding the=0D
On-chip Peripheral Bus (OPB) interface which is currently=0D
not implemented. I took some notes and re-ordered the code=0D
a bit, resulting in this series.=0D
=0D
Q: Should we exit gracefully in mb_cpu_realizefn() if the=0D
user requests features that are not implemented?=0D
=0D
Thanks,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  target/microblaze: Use the IEC binary prefix definitions=0D
  target/microblaze: Extract FPU helpers to fpu_helper.c=0D
  target/microblaze: Assert transaction failures have exception enabled=0D
  target/microblaze: Fix Exception Status Register 'Cause' definitions=0D
  target/microblaze: Replace magic values by proper definitions=0D
  target/microblaze: Set OPB bits in tlb_fill, not in transaction_failed=0D
=0D
 target/microblaze/cpu.h        |   8 +-=0D
 target/microblaze/fpu_helper.c | 308 +++++++++++++++++++++++++++++++++=0D
 target/microblaze/helper.c     |  35 +++-=0D
 target/microblaze/mmu.c        |   5 +-=0D
 target/microblaze/op_helper.c  | 304 +-------------------------------=0D
 target/microblaze/meson.build  |   1 +=0D
 6 files changed, 349 insertions(+), 312 deletions(-)=0D
 create mode 100644 target/microblaze/fpu_helper.c=0D
=0D
-- =0D
2.26.3=0D
=0D

