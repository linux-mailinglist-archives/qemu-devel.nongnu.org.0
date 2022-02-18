Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB8C4BC155
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 21:44:52 +0100 (CET)
Received: from localhost ([::1]:42250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLA7X-0005me-EG
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 15:44:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLA5O-0004gZ-98; Fri, 18 Feb 2022 15:42:38 -0500
Received: from [2a00:1450:4864:20::42b] (port=35626
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLA5M-0008Vq-8i; Fri, 18 Feb 2022 15:42:37 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v12so16471950wrv.2;
 Fri, 18 Feb 2022 12:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eTYAOlNG8UIZF5JvugdJ5/6WimTXw3TPiA91vcKvVn4=;
 b=HUpsnV7b54dZXEmBCcpV0fglRmd18AcNXWFNUYQoL+agEyFLHGmQNVKn1epjz535xR
 Ro5vkcd0Bfmp8AOxi6CylFPELOxCvFsPkgOgIFCTcokdAIUwQ6663hnYEvQxcXObtHrw
 KHbejDgGkrXT484g4GYeQnmOFa0bDpQsJWI9nUiWk749c5JDOvDzKfyU4JywXc+Kp1et
 5jzZg2tKm1rqyixKdtVjfMx5plfcDIi01BDaU4A2E+LY5sWlV0ENJTrz+fnjAgsrJjdz
 RqGGi2Lz/a4jTsizuoL2xedRPRW5Eo+f1bXJd0VfCkZ/lZPXO2ehQarv6114qhmcAKhK
 wwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eTYAOlNG8UIZF5JvugdJ5/6WimTXw3TPiA91vcKvVn4=;
 b=SyDnCzfdEyNehPwwaMIqNLtpQ4CIKishCwOdvBh+pJAsq10C8QNjIXc2H9A7TRu9Cm
 AkJurefxkY1vcWNtsek0FajZzKedm2xcAIqZhomf8d85asx/4OdxVjRJgKjPQXmS13VD
 yH/3SL37Yxr0BuqKi9qGtO0iNLQXpziJeO9gISR34ROENNET8qycLE2FY3gDaG69NVek
 hQHgrtXmv5vA29f6s2YQBqRCmOw7xLE3Y1IQO7ABWtfj9ylv/NGzbePxJu+1bEJdoUIa
 pAG+LdAb0wrpgsU895twm/NnlP3twepP3bf21jvdfq6An3JoiK7x/1vz/rVtxf32QKOQ
 1AhA==
X-Gm-Message-State: AOAM533EZdroI2viebA+MRIn7840aEaS2BHDAixbR53pEfkbPMuYj1A9
 dI9RdXAI9MqCDLD6naFvsDoNku2FkLM=
X-Google-Smtp-Source: ABdhPJwc0rEVujJBarY6t2fMbtMhYaNRN1rfFXL0gqbf8Wob4ym1jztvG6LPVvDRHbA272GJtS4NCQ==
X-Received: by 2002:adf:f0c6:0:b0:1e7:13f7:74b9 with SMTP id
 x6-20020adff0c6000000b001e713f774b9mr7215028wro.361.1645216953241; 
 Fri, 18 Feb 2022 12:42:33 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0037c06fe68casm377432wmq.44.2022.02.18.12.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 12:42:32 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/ide: implement ich6 ide controller support
Date: Fri, 18 Feb 2022 22:41:53 +0200
Message-Id: <20220218204155.236611-1-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: jsnow@redhat.com, Liav Albani <liavalb@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is version 2 of this patch, this time a patch series, after following
the suggestions from BALATON Zoltan. I implemented this device because I have an
old machine from 2009 which has the ICH7 south bridge in it, so when I tried to
run Linux on it, it booted just fine (as you might expect), but when I tried to
boot with the SerenityOS kernel, it struggled to initialize the IDE controller.
Therefore, upstreaming these changes might be beneficial to other OS developers
and hobbyists out there, and I will use this to fix the issues within the
SerenityOS kernel, without the need of preparing a bare metal setup each time I
need to test the code of the kernel.

Please keep in mind that while this is usable right now with the Q35 chipset,
when trying to boot with an i440FX machine, SeaBIOS doesn't handle this device
very well, so it tries no matter what type of IDE controller it sees to assign
the IO ports to legacy values. I have a patch I wrote locally which I gladly
will send to SeaBIOS, that fixes this problem by ensuring that when attaching a
storage device to this controller, SeaBIOS will relocate the IO ports to other
values so there's no collision with the default PIIX3/4 IDE controller. Even if
SeaBIOS didn't configure this device correctly, Linux will relocate the IO ports
and the user can still use the attached storage devices, given that the user
managed to boot from a storage device that is not attached to the ICH6 IDE
controller but to other storage controller in the system.

Liav Albani (2):
  hw/ide: split bmdma read and write functions from piix.c
  hw/ide: add ich6 ide controller device emulation

 hw/i386/Kconfig          |   2 +
 hw/ide/Kconfig           |   5 +
 hw/ide/bmdma.c           |  84 ++++++++++++++++
 hw/ide/ich6.c            | 204 +++++++++++++++++++++++++++++++++++++++
 hw/ide/meson.build       |   3 +-
 hw/ide/piix.c            |  51 +---------
 include/hw/ide/bmdma.h   |  34 +++++++
 include/hw/ide/pci.h     |   1 +
 include/hw/pci/pci_ids.h |   1 +
 9 files changed, 336 insertions(+), 49 deletions(-)
 create mode 100644 hw/ide/bmdma.c
 create mode 100644 hw/ide/ich6.c
 create mode 100644 include/hw/ide/bmdma.h

-- 
2.35.1


