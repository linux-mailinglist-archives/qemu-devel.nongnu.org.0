Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE33B1FF7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:03:17 +0200 (CEST)
Received: from localhost ([::1]:56484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7DX-00080W-6H
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7Aq-0005P1-B6; Wed, 23 Jun 2021 14:00:28 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7Ao-0002ri-71; Wed, 23 Jun 2021 14:00:28 -0400
Received: by mail-wr1-x436.google.com with SMTP id d11so3674480wrm.0;
 Wed, 23 Jun 2021 11:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGUvEh3/+LzhG5JJwRERyZmd3FW8HIp80HEkYAhaXMs=;
 b=q2XArjrt68KDX9c8IgFHqw6+wOpsuUl6uY3AgB7NXRNJYUc1nO9fLtbAK4NP2g5aC0
 aQuIX0EbQtb88DsCDBW7QPPAHRioemOdLb4DXTEF+Sb8VIrB5k8u5DtMKXexB2V1JasT
 FD32b8kw2TLRHhwHLkocHdtt9MM77fyb/PnEbMQAhFEHc6dk4pd9rU/ltHuhwH2+Phgm
 LYoyKar5kgkOK1MIMTHEucRyweCsOGNYSw58uAXAKzUczbawI9Pmf2JJbexCV580zaEQ
 h+Up98lqozMHamYaLSI8fjgCh4JU4EtnRNIhoZ8Wbbm3CQz3qmmF5BlyUQLe7g0nJIDq
 ZQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KGUvEh3/+LzhG5JJwRERyZmd3FW8HIp80HEkYAhaXMs=;
 b=jAOCGcRvAkiVZtAQHbnDLUdTcWd74sw9Ot1Fj4CyLclAQsLnuI9b94sH3fZDEa7MWn
 BlQXyI3CTBuIpWxgW5s3iO9jP9HusCHSnvAYKKwypEtUTShOQXAohFHoLHyyQcWoLHsy
 uMi3WccV8ZXZtGBxaoXqt+5kcJDkjs8dCmUMYFV8Dzkvwcn8E6JvcG+OV8bZDM6lH0pd
 v0T3TuUD6RdIfzjB7rlMxNey6/0LVlrh5KzLGfgOdcZF1jenUwHqn29+zDdtaS2PwiK2
 0MeGup2fM3JZyMp2NIMmR2iTIzyKOvh8gP4+xjdq6psaeDpZ5jLmmzeMxw7HQmfRhgUt
 t9wg==
X-Gm-Message-State: AOAM531jwzI0X5YCDSGFcJgk2o4+uLUYDuYDMJRZLeCdNbybGipWC18Y
 XEasBkPxo5TOaSi42545wcseLrh7Vi2HSw==
X-Google-Smtp-Source: ABdhPJzFVQN2kUtN4BRy0A89qYOFK+JmcIYry8uVthvS8sAEkyMcNbHNkoBkO/TbY6K+vpXC4YtAHA==
X-Received: by 2002:a5d:4dc8:: with SMTP id f8mr1541239wru.168.1624471224194; 
 Wed, 23 Jun 2021 11:00:24 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z25sm679991wmf.23.2021.06.23.11.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:00:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/9] hw/sd: Allow card size not power of 2 again
Date: Wed, 23 Jun 2021 20:00:12 +0200
Message-Id: <20210623180021.898286-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Ubi-Wan Kenubi and Tom,=0D
=0D
In commit a9bcedd (SD card size has to be power of 2) we decided=0D
to restrict SD card size to avoid security problems (CVE-2020-13253)=0D
but this became not practical to some users.=0D
=0D
This RFC series tries to remove the limitation, keeping our=0D
functional tests working. It is unfinished work because I had to=0D
attend other topics, but sending it early as RFC to get feedback.=0D
I'll keep working when I get more time, except if one if you can=0D
help me.=0D
=0D
Alexander, could you generate a qtest reproducer with the fuzzer=0D
corpus? See: https://bugs.launchpad.net/qemu/+bug/1878054=0D
=0D
Thanks,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  hw/sd: When card is in wrong state, log which state it is=0D
  hw/sd: Extract address_in_range() helper, log invalid accesses=0D
  tests/acceptance: Tag NetBSD tests as 'os:netbsd'=0D
  tests/acceptance: Extract image_expand() helper=0D
  tests/acceptance: Use image_expand() in=0D
    test_arm_orangepi_uboot_netbsd9=0D
  tests/acceptance: Use image_expand() in test_arm_orangepi_bionic_20_08=0D
  tests/acceptance: Do not expand SD card image in test_arm_orangepi_sd=0D
  tests/acceptance: Remove now unused pow2ceil()=0D
  hw/sd: Allow card size not power of 2 again=0D
=0D
 hw/sd/sd.c                             | 60 +++++++++++++-------------=0D
 tests/acceptance/boot_linux_console.py | 39 ++++++++---------=0D
 tests/acceptance/ppc_prep_40p.py       |  2 +=0D
 3 files changed, 52 insertions(+), 49 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

