Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2130765F066
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 16:47:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDSQb-0002qI-GJ; Thu, 05 Jan 2023 10:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDSQZ-0002pj-VZ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:45:11 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pDSQY-0003dx-9D
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:45:11 -0500
Received: by mail-ed1-x530.google.com with SMTP id j16so20768975edw.11
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=suyzOb86E3A9WAWKt9ove/edEpZ6nGAaS7T882gzoc4=;
 b=a8v3BJVkONpfd6lr4b/6SczhuDGUxgNfpoXMfac90BItjbQ2PkGr3atrXBHlFatL95
 gFFjY/rfwXhKvSfEZnIWioDkicM2hwLHaupB8ia/Ac7VscvMUyztmQ/3RsjLYlmHDxnX
 BnKMRaAXcYyOZQyocDySESGw4be6gsCS3GUT+G0QIeEA/DD3EOWKCnIkzAdXfZ51gJjj
 PUwr4dcB6sqoDCD/aMgUnhlX8lmC1KNljmJxRafQSzrlnE+DTpivRedBVDgqyc+acEJc
 OzAz0f8ai9OzXjlQl1LF2iHJzZYVTdhx33jwnT6E4WTNFdZrmQMuasNl1isD2zD9RUbS
 yB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=suyzOb86E3A9WAWKt9ove/edEpZ6nGAaS7T882gzoc4=;
 b=pyOdhD/06nfNVYEj4YZ/CPNqToL9HLI4t1l8aZuhFyTggiabZZDcR4qbcwipuVk63R
 unx2JshxHIvYBbpQO20hceUH03tJmMXJ25UJ5WzaxxNY8x2BD3ZpyUpLwMLZGc7ljW6r
 99HRt2EHlOYN4Exv9NcA3H9Fn48vJGSwtV9P4qRMIrkabpyHR2CZ/wqHw7tlRnf1D5sB
 79SprpjiRkwGofeY+SK5P5OWfK69QE0N1xhI8miJ/7yGXZfamJ81Kvm8etlbzWv3q6k3
 ++8gX0YCfHvWaPbnl/zEPuyK2wG+WQMCaFsiOINVDqN5VkyGZICP1Lkj1kpcvEK9janC
 y1BQ==
X-Gm-Message-State: AFqh2kpiVusHKruGtZu9c6bIuHQ+71N4WSVQFT2uwSJx4/Y1kyd0yxiS
 Uc9oFrj02Y2AG6l+hiCa3scRvTabHTJVFQ==
X-Google-Smtp-Source: AMrXdXsSmJr01R0QR0eg9rG0pF6pnn91q1jozG7aaVsHC0jSDIiCV1+lbWDO4PfteTULpBvN9eUTdw==
X-Received: by 2002:a50:d616:0:b0:47c:6ed2:43d1 with SMTP id
 x22-20020a50d616000000b0047c6ed243d1mr47379664edi.30.1672933507960; 
 Thu, 05 Jan 2023 07:45:07 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 dk28-20020a0564021d9c00b004856bba2c8bsm12371004edb.47.2023.01.05.07.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 07:45:07 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/2] Move Fuloong2e PCI IRQ mapping to board code
Date: Thu,  5 Jan 2023 16:44:38 +0100
Message-Id: <20230105154440.259361-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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

This is a follow-up on [1] '[PATCH 0/8] hw/pci-host/bonito: Housekeeping' w=
hich=0D
resolves a coupling of the Bonito north bridge with the Fuloong2e machine.=
=0D
Since [2] '[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges'=
 is=0D
already in the mips-next queue this cleanup can now be done.=0D
=0D
[1] https://patchew.org/QEMU/20230105130710.49264-1-philmd@linaro.org/=0D
[2] https://patchew.org/QEMU/20221120150550.63059-1-shentey@gmail.com/=0D
=0D
Based-on: <20221120150550.63059-1-shentey@gmail.com>=0D
          "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges"=
=0D
Based-on: <20230105130710.49264-1-philmd@linaro.org>=0D
          "[PATCH 0/8] hw/pci-host/bonito: Housekeeping"=0D
=0D
Bernhard Beschow (2):=0D
  hw/pci-host/bonito: Inline pci_register_root_bus()=0D
  hw/pci-host/bonito: Map PCI IRQs in board code=0D
=0D
 include/hw/pci-host/bonito.h |  2 ++=0D
 hw/mips/fuloong2e.c          | 22 ++++++++++++++++++++++=0D
 hw/pci-host/bonito.c         | 31 ++++---------------------------=0D
 3 files changed, 28 insertions(+), 27 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D

