Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77B5362F3F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 12:32:56 +0200 (CEST)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXiFy-00031W-5B
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 06:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiDj-0001Gu-K2; Sat, 17 Apr 2021 06:30:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiDh-0000fF-Pu; Sat, 17 Apr 2021 06:30:35 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r7so17019985wrm.1;
 Sat, 17 Apr 2021 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RQcCnrkki2wULF0Ux+64ovXIK00r70LiEXiOjNlziVQ=;
 b=qwtuGwtNQyip9L2Z9LS33y0TYKmZcKyPKRpe/xXnCkLbBlu51+0HfSrWdMvotw+uAC
 abY87EALdyAOMRzSsGovYbhPEmrDuNfCV5tBhg4/rsvVQSZGBPWgN4A2jkbGL99+NqtC
 AbmK1gqpPTER+NFjDrz0YealRi+oqnAO6IaYmjgUf+45TJ1+n+gwqbXC/QA8pb/zT/HN
 8C4kOkweoseKHOyAGjCyXdWLhBRCVd2UUP/6kXmJB3yHvsql8ubpKsfr4fwrd/W6DV5O
 7qv2hIk2+eD7je4YgqB+v0cS9bTO3h9tDDdHWakOo5c/dhK10kdPbd+F9ny33fUoYI7U
 8ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RQcCnrkki2wULF0Ux+64ovXIK00r70LiEXiOjNlziVQ=;
 b=YLfNEJzBue+o4S7Ukr42NJonB5m81xnM3teq4RmytVA+siFIJA6/oGODqNWHqdpqCs
 1XNe+Cp7m80YcUbqG1wtvU/r8fFlSivdVW9BrwjiPWurSFBtHzCpqpxcNMdBvQ4fPfU7
 HkkgWYbyTWlD1SqB1odpMYvTKuXD76EweQFqzejD22ZYigg+YcDQZq5ywJEpphjalun7
 +wyf0t8FH0YCjjkA95h03lRgGn6QU18KpcyU6cJGVwLriCo9ccoNFR7rApdaS+ws1JyK
 fFeKIzpyKlsWV43IeDdJSGxThV4EstGrX0uLcskwSaIi2CemSD9i6I3wqzngvuLpjNwX
 l8IQ==
X-Gm-Message-State: AOAM532GNixh/kuU4xwVES23c1H+NKZ03dtl9YNfyUSRlXBIKFecfnGM
 oUkTrtggJ4VoluOTfcCyKAbOD0HRhU0=
X-Google-Smtp-Source: ABdhPJztc63fVTmn6hopGjfY/8QTl0gl/REHUF7xfc2kzPfLkCXaPIe0l5/27DXI6IOTryuTjyAThw==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr3744346wrx.295.1618655431257; 
 Sat, 17 Apr 2021 03:30:31 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 200sm12554254wmb.1.2021.04.17.03.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:30:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/11] memory: Forbid mapping AddressSpace root MemoryRegion
Date: Sat, 17 Apr 2021 12:30:17 +0200
Message-Id: <20210417103028.601124-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series is the result of a long thread with Peter:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg788366.html=0D
and IRC chats...=0D
=0D
AddressSpace are physical address view and shouldn't be using=0D
non-zero base address. The correct way to map a MR used as AS=0D
root is to use a MR alias.=0D
=0D
Fix the current incorrect uses, then forbid further use.=0D
=0D
Since v1:=0D
- Split the Raven patch in multiple changes, easier to follow/review=0D
  (https://www.mail-archive.com/qemu-devel@nongnu.org/msg791116.html)=0D
=0D
Note, the Aspeed patches are already queued in C=C3=A9dric tree. I had=0D
to cherry-pick them from his tree to have the series pass CI.=0D
=0D
C=C3=A9dric Le Goater (1):=0D
  hw/aspeed/smc: Use the RAM memory region for DMAs=0D
=0D
Peter Xu (1):=0D
  memory: Make sure root MR won't be added as subregion=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  hw/arm/aspeed: Do not directly map ram container onto main address bus=0D
  hw/arm/aspeed: Do not sysbus-map mmio flash region directly, use alias=0D
  hw/pci-host: Rename Raven ASIC PCI bridge as raven.c=0D
  hw/pci-host/raven: Add PCI_IO_BASE_ADDR definition=0D
  hw/pci-host/raven: Assert PCI I/O AddressSpace is based at 0x80000000=0D
  hw/pci-host/raven: Use MR alias for AS root, not sysbus mapped MR=0D
  hw/pci-host/raven: Remove pointless alias mapping onto system bus=0D
  hw/pci-host/prep: Do not directly map bus-master region onto main bus=0D
  hw/pci-host/raven: Remove temporary assertion 'root MR is zero-based'=0D
=0D
 include/exec/memory.h           |  1 +=0D
 include/hw/ssi/aspeed_smc.h     |  1 +=0D
 hw/arm/aspeed.c                 |  8 ++++++--=0D
 hw/pci-host/{prep.c =3D> raven.c} | 19 ++++++++++---------=0D
 hw/ssi/aspeed_smc.c             | 10 +++++-----=0D
 softmmu/memory.c                |  2 ++=0D
 MAINTAINERS                     |  2 +-=0D
 hw/pci-host/Kconfig             |  2 +-=0D
 hw/pci-host/meson.build         |  2 +-=0D
 hw/ppc/Kconfig                  |  2 +-=0D
 10 files changed, 29 insertions(+), 20 deletions(-)=0D
 rename hw/pci-host/{prep.c =3D> raven.c} (96%)=0D
=0D
-- =0D
2.26.3=0D
=0D

