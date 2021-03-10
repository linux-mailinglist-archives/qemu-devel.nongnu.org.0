Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0E334878
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:01:56 +0100 (CET)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK51m-00084V-Ee
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lK4ya-0006N0-Ro; Wed, 10 Mar 2021 14:58:36 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lK4yZ-0001be-3J; Wed, 10 Mar 2021 14:58:36 -0500
Received: by mail-ej1-x636.google.com with SMTP id mj10so41200486ejb.5;
 Wed, 10 Mar 2021 11:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1fymtSc+a44q250yFkmJe/giLftHaaa3CihW0zMeu0=;
 b=JuEmiEgDwRXnQAI70GY284LtEvAXId8x8GTOCu7vglWBL7jWzjzj1oGdfr47Ef0STm
 NBaO/SnsrQtHACwsUyW2lktRr8EqNCNgl01OxkdhL8/r+TgLYErvsudOiDOm/vqTd8UD
 zvRAFbpsY6F35TMGaPL6vHXFHUCZkYjCJu9uy3CpkjSrcT7BDGuUGqPMG9ft+Z5bLW/u
 EdDnMJ8Apx/yX6IsrF02h8IXG2g/04e8DS3uSKN5941WkOp3C6/NyiTtibeBgbqsonXE
 +lQrRLLSJTeFcEUTQ5XfKBL5z4Vjyqe+pw9njZFOnr0s5F4Flc3TFqXFr/Vu209YhG3T
 oh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1fymtSc+a44q250yFkmJe/giLftHaaa3CihW0zMeu0=;
 b=INToTQt+9IaAwO4kygtYB+1S47d4KbgAYSL+KoqvCoLPcXIPZHvrWnW0wBFZ2BkCEC
 0cUHTIoO87UO8vZskJOp3KGlisYvmA9lsDQCcdPlD0sJ5oHxQoiTQLRKzLPejgFjLLjZ
 B0Kz0s+adJEgIWdUl9C6wFioj5PiahwI22HdYG04zMOkPDZQfTampr9ucNuIotfyPup+
 RchFNeevjFmLuXQdnmI1rVnwz3XNSprh/fbtUU4Of+Ws0yR9zVC0rdQlFs8KctmWu1qE
 pX2XpjnUdC+7N8Vjs/uvpX1SWWqa56ojAwEijGuiFcNOQSx2KAGGq3tl/Yaz8wQlmE/k
 WlwA==
X-Gm-Message-State: AOAM533+D4OMgkHflTwYyDQLog8PfD0XLHwMG3NTrQlorPZ2lTR53mWm
 rtFOKJ3KgWPN+k18MygBo2XerBgOILZcjQ==
X-Google-Smtp-Source: ABdhPJwLs5CaUAT9LJ0lA1tXQttoJ1TwNQR8EgTzo26s7hsfA4ASbpOO2uJXpMBmGnuRpb6IpMDC8g==
X-Received: by 2002:a17:906:5902:: with SMTP id
 h2mr118357ejq.416.1615406312493; 
 Wed, 10 Mar 2021 11:58:32 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-d8ed-76d3-94d3-2909.fixed6.kpn.net.
 [2a02:a456:6be8:1:d8ed:76d3:94d3:2909])
 by smtp.gmail.com with ESMTPSA id h13sm133570edz.71.2021.03.10.11.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:58:31 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] Allwinner H3 fixes for EMAC and acceptance tests
Date: Wed, 10 Mar 2021 20:58:15 +0100
Message-Id: <20210310195820.21950-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 wrampazz@redhat.com, f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following are maintenance patches for the Allwinner H3. The first patch
resolves artifact download errors by updating the URLs to the armbian.com server.

The second patch is a fix for the EMAC that is used by the Allwinner H3 / Orange Pi PC machine.

All these patches have been reviewed and tested and should be ready to pull in.

ChangeLog:

v4:
 - added Reviewed-By/Tested-By tags

v3:
 - fixed the acceptance tests by using up-to-date armbian.com URLs

v2:
 - added Reviewed-By tags
 - changed URL for artifacts to github.com/nieklinnenbank/QemuArtifacts

Kind regards,

Niek

Niek Linnenbank (5):
  hw/net/allwinner-sun8i-emac: traverse transmit queue using TX_CUR_DESC
    register value
  tests/acceptance/boot_linux_console: remove Armbian 19.11.3 bionic
    test for orangepi-pc machine
  tests/acceptance/boot_linux_console: change URL for
    test_arm_orangepi_bionic_20_08
  tests/acceptance: update sunxi kernel from armbian to 5.10.16
  tests/acceptance: drop ARMBIAN_ARTIFACTS_CACHED condition for
    orangepi-pc, cubieboard tests

 hw/net/allwinner-sun8i-emac.c          |  58 ++++++------
 tests/acceptance/boot_linux_console.py | 120 +++++++++----------------
 tests/acceptance/replay_kernel.py      |  10 +--
 3 files changed, 77 insertions(+), 111 deletions(-)

-- 
2.25.1


