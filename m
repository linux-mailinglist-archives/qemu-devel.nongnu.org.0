Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6323A6F2B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:34:56 +0200 (CEST)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssMI-0007D3-Lp
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssJz-0004Zb-Rb
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:32:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssJu-0004mw-GD
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623699144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cyilP+oQLbKv+hCJ1T72/cCIVOySTe5lWQSgo9UNA2I=;
 b=dEZ4kTqVxsvLK9FKUhUVFPyCYTu6sS8DiqngS49InQGrQeubEuZPSmTPyym/cNlkDG4UEC
 sJyv1HqLVG3aioDt53VLUKtRxHDtUYuIIuYw3yIGZjW+sGtEIKezM1DVKrxHZ3N/BcVKQ7
 qIbh3LrnltgnGFQG8qmbtZSkUxWGySs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-HIyD9ySvN0-Qn2KhFrqz2w-1; Mon, 14 Jun 2021 15:32:23 -0400
X-MC-Unique: HIyD9ySvN0-Qn2KhFrqz2w-1
Received: by mail-wr1-f71.google.com with SMTP id
 z4-20020adfe5440000b0290114f89c9931so7431828wrm.17
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TUA3/xVwxvCo3aPEcMufUuyNpN/mCBCgEu1zwA2U/Gs=;
 b=oUVfFkM1zUIEmzByMiNbatLA+X3JGIqL16t+0ikJ2Z6CzPkv4fstQecZp2G0fsyEMD
 1sshbLPK91tWozdfGU0mYtTGAjU3HJLzAeN7Ptre9NEfRdq5eOFwvuPBj5iqzdHH4cpt
 PNn4Xav+ELlxrEo5hqY4OA308dDMnazCRegbLB53mCpJ4E2wV0dy9UVMFr1hXKHIPyOU
 S+2XeMXd/S9i1KD70u/0F5qbGY+7/BkQQ6usEgNGlgFpk6ktldTfUHToravBDWTP1upT
 JMxyNWGyhGqkLxNPLb0uzCjc00eKqlBopidiwV2AmljhaB4Q9o34Flr1bDyWygpzVXyq
 gC3A==
X-Gm-Message-State: AOAM533WDuTaYv6HgMFV0AMVIt2/jpVYqRN1aO9kA0QOtvS9Ara2ZTgK
 yhvrNAf8vVmh6OkLwcFhxfsgk9A9C5OYyd+gppyELGodv6PcOqfAK7/YdgXrfW76b37NlZRugo0
 MR60rHE+8hE7eGi6lkjgKugroBg/4WA9JT9Sn4+MbQHCTuc6UD1I4JpYDZnw9KUIW
X-Received: by 2002:a1c:c256:: with SMTP id s83mr18042363wmf.86.1623699142080; 
 Mon, 14 Jun 2021 12:32:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMKQNFEH9u9EdrTtFfsbcbMlGxszuQa3FNy4qz4yQHbi4mKXdjYDZAWGOz66bYSCLm0Yb6hw==
X-Received: by 2002:a1c:c256:: with SMTP id s83mr18042339wmf.86.1623699141818; 
 Mon, 14 Jun 2021 12:32:21 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e16sm16876244wrw.49.2021.06.14.12.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 12:32:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/6] hw/block/fdc: Allow Kconfig-selecting ISA bus/SysBus
 floppy controllers
Date: Mon, 14 Jun 2021 21:32:14 +0200
Message-Id: <20210614193220.2007159-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
The floppy disc controllers pulls in irrelevant devices (sysbus in=0D
an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).=0D
=0D
This series clean that by extracting each device in its own file,=0D
adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.=0D
=0D
Since v6:=0D
- Rebased=0D
- Added A-b/R-b tags=0D
- Removed stub (thuth)=0D
=0D
Since v5:=0D
- Added stub (thuth)=0D
=0D
Since v4:=0D
- Dropped machine patches for later due to DMA jazz issue=0D
=0D
Since v3:=0D
- Fix ISA_SUPERIO -> FDC Kconfig dependency (jsnow)=0D
=0D
Since v2:=0D
- rebased=0D
=0D
Since v1:=0D
- added missing "hw/block/block.h" header (jsnow)=0D
- inlined hardware specific calls (Mark)=0D
- added R-b/A-b tags=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO -> FDC=0D
  hw/block/fdc: Replace disabled fprintf() by trace event=0D
  hw/block/fdc: Declare shared prototypes in fdc-internal.h=0D
  hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c=0D
  hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c=0D
  hw/block/fdc: Add description to floppy controllers=0D
=0D
 hw/block/fdc-internal.h | 158 ++++++++++=0D
 hw/block/fdc-isa.c      | 320 +++++++++++++++++++++=0D
 hw/block/fdc-sysbus.c   | 251 ++++++++++++++++=0D
 hw/block/fdc.c          | 621 +---------------------------------------=0D
 MAINTAINERS             |   3 +=0D
 hw/block/Kconfig        |  12 +-=0D
 hw/block/meson.build    |   2 +=0D
 hw/block/trace-events   |   3 +=0D
 hw/i386/Kconfig         |   2 +-=0D
 hw/isa/Kconfig          |   7 +-=0D
 hw/mips/Kconfig         |   2 +-=0D
 hw/sparc/Kconfig        |   2 +-=0D
 hw/sparc64/Kconfig      |   2 +-=0D
 13 files changed, 763 insertions(+), 622 deletions(-)=0D
 create mode 100644 hw/block/fdc-internal.h=0D
 create mode 100644 hw/block/fdc-isa.c=0D
 create mode 100644 hw/block/fdc-sysbus.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


