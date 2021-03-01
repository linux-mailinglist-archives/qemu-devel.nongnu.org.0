Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EB7327DA9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:54:58 +0100 (CET)
Received: from localhost ([::1]:59694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGh8b-0006mF-0x
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGh7J-0005Dt-Fg
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:53:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGh7H-0007RZ-RF
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614599615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iw5RyteciEGyS2LHoM6+QdQCy4TkFtSr2LwnklkHPLM=;
 b=Tt0e9qB/pFoZIYutESba/JdhXa4kQGdSD/0MMBMDJvuxi8rN/hAaP3QiSeTHZQZZoI2Jel
 vEQWsKIQK4DD7diuNhOeKeV3dkBiAqhxZrwrNTBYEu/lKAt9gHs/BtPryXkp+AwlT3Ja+W
 x78TFCKCMRyO7QRxc1h0SyJV0ebJJbE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-FMOyr_twMUaeY8HhnmwXyA-1; Mon, 01 Mar 2021 06:53:33 -0500
X-MC-Unique: FMOyr_twMUaeY8HhnmwXyA-1
Received: by mail-wm1-f70.google.com with SMTP id p8so5529275wmq.7
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:53:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SbDmQ+ERZ+963Yvf4hg5sxoJ18L0ASeBqMoyWNPm4Fs=;
 b=IQ7h9Xu3IlLEmscsWSipV6PG+fvInGus/dwq/mBwU9d4VHdrInPeCnSYNnwMPr6u5V
 pW+FoPmrSI7UbGlXcpdVjVZwQr8vFtTjPxkaXsvdA/pPMIekNZYMqdT9PK4V9Nmcl3mC
 lpSNptEGhOn387qxUMVY2NSk9eNE3B8JWZVZEJPURHriJzZi5zEV+eizYceKP+UU1y6k
 kyjWtgUQnwqx2m3O815h2RFAFOlpWq6I56yeF2b3rwlpwNvqA3egrK9ASgUGiCOW8Wah
 HK1PXMZlq/44LS4Ryh1t86I3Icx6diXe13goHQbp5dy6UlvZRSPFUVtCol2rJEZjq9El
 SyZA==
X-Gm-Message-State: AOAM530wftQDv3KQF7zWmT2zjp89IhfW787jBmEr8jICE00QzJTQdtlN
 eK+DV0JJzvM5WSdz+GlJukRvvKl6YyMbekA93gHs4nM12ryJ/p6mSUNxu2BhATWHgKaKZSM6oY+
 PQqEshcJW6WWOlRDyoMVw6ZnNswzaEdEKoGWPtx10e2E0XJGbO99EaORD20m3FBXS
X-Received: by 2002:a1c:bc82:: with SMTP id
 m124mr15509862wmf.118.1614599611406; 
 Mon, 01 Mar 2021 03:53:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMLjy0X5rU3GddhsEzkrpUEErIubMYd3qJWhIfaAggd4Ior3RJRCKvmy27194bn9N/5C2KdQ==
X-Received: by 2002:a1c:bc82:: with SMTP id
 m124mr15509842wmf.118.1614599611252; 
 Mon, 01 Mar 2021 03:53:31 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t14sm25904124wru.64.2021.03.01.03.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 03:53:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	David Edmondson <david.edmondson@oracle.com>
Subject: [RFC PATCH v2 0/3] hw/block/pflash: Mmap read-only backend files with
 MAP_SHARED
Date: Mon,  1 Mar 2021 12:53:26 +0100
Message-Id: <20210301115329.411762-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, haibinzhang <haibinzhang@tencent.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
- check driver is "raw" (David)=0D
- ignore CFI02 for now=0D
=0D
Hi,=0D
=0D
This series aims to reduce the memory footprint of flash devices=0D
when the backing file is read-only.=0D
=0D
When a backing file is read-only, the model considers the flash=0D
is in "protected" mode. No write are allowed, but the MMIO=0D
state machine is still usable.=0D
=0D
This series introduces a new memory region helper to mmap files=0D
and use it with the pflash device (only with read-only backing=0D
files).=0D
=0D
The goal is to reduce QEMU's memory footprint when multiple VMs=0D
are instantiated using the same read-only backing file, which is=0D
the case with the CODE flash from OVMF and AAVMF.=0D
=0D
Previous attempts:=0D
=0D
- Huawei=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html=0D
- Tencent=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html=0D
- Oracle=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg760065.html=0D
=0D
RFC because yet another approach to tackle this technical debt,=0D
and very little tested.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  exec/memory: Introduce memory_region_init_rom_device_from_file()=0D
  hw/block/pflash: Move code around=0D
  hw/block/pflash: use memory_region_init_rom_device_from_file()=0D
=0D
 include/exec/memory.h   | 85 +++++++++++++++++++++++++++++++++++=0D
 hw/block/pflash_cfi01.c | 49 +++++++++++++++------=0D
 hw/block/pflash_cfi02.c | 18 ++++----=0D
 softmmu/memory.c        | 98 +++++++++++++++++++++++++++++++++++++++++=0D
 4 files changed, 228 insertions(+), 22 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


