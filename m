Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDCE36D7B5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:53:24 +0200 (CEST)
Received: from localhost ([::1]:33628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjgw-00038O-UC
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjet-0001mU-Na
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjep-0001cl-GV
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619614270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xz4dJ52P5Aadm96iXyBR67ghFwWBarY2biBNp3F12z0=;
 b=DYXSoGGQa3RV7G/EUrxlukCJvYXg0t+MN8betb00uzLyQ5uAn7BY83h9qvxbQWGaQPbjPQ
 2j4ID4NMak/OKa9Ll1b4WZTFxT0/HDv2DGcv/QADKCYKjrlgP9AYPvVrnzM/OafkYxr1hs
 0CZrHGkTAyeNjNkpfdIUbjRDyfK3zYw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-3ElZgYU2PpKA34GSvo-Phw-1; Wed, 28 Apr 2021 08:51:08 -0400
X-MC-Unique: 3ElZgYU2PpKA34GSvo-Phw-1
Received: by mail-wr1-f71.google.com with SMTP id
 o14-20020a5d474e0000b029010298882dadso22272798wrs.2
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OFZ4bE9lGhbpGHm+Gjc6nq1ViDJJn+qSStUuP6go0rM=;
 b=Hlno8Gr8+yjBeK0tIrWHkeF3va9sVYZ5Hms6vOOg6BZSMsnteCxiePIVtPIto2A0tB
 v0/XlVWQZc4U3wX7PZm7VYJEZQs1yevP37QkHudL6PgHrA8ypU7u0TLstwvR32HWJCLT
 lq3xgxRBoXRcftrsDX5Z6Gvz04Rv9uBBQL/3lNuX1Dle9EN0wiB7JlEnMao3Kt8qolUo
 xTKCgbKNOS7+LcooHJHC0+1hQqNmRX/C6EfCb9/arwBUgZFjQJdYY57XMQeCbYLU9qZh
 EbVIg7faK6qmKolj1ARutUJkPKo08s9PSDQg92xwmJJqBupue1i87+qL6NDTgwmISMgt
 gCuA==
X-Gm-Message-State: AOAM531xX8YCVuohmrmioheg9HAIZawXSm5feppbPaJCuY29hhNGhQNh
 RLYpRVyqNk1Z7ntaJ8tH0FbGkkYM+sMt6rJrhl1MMD4UFKQ9oFXT7x11do18wPFQCvjtKhCSWEE
 hKmmAEEiH1IgHR/U=
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr3189517wmq.41.1619614267427; 
 Wed, 28 Apr 2021 05:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXg/r+SL36zj2wCbjX+WpQAdTmiyx3gTl7O5iCG6zt77iN1EBGny8xSsZ0Z9Cvlq1F2EYDog==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr3189489wmq.41.1619614267261; 
 Wed, 28 Apr 2021 05:51:07 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p3sm3593370wmc.9.2021.04.28.05.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:51:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] hw/block/fdc: Allow Kconfig-selecting ISA bus/SysBus
 floppy controllers
Date: Wed, 28 Apr 2021 14:50:56 +0200
Message-Id: <20210428125104.358535-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
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
Since v1:=0D
- added missing "hw/block/block.h" header (jsnow)=0D
- inlined hardware specific calls (Mark)=0D
- added R-b/A-b tags=0D
=0D
Missing review: 5-8 (1-4 can be queued meanwhile)=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  hw/block/fdc: Replace disabled fprintf() by trace event=0D
  hw/block/fdc: Declare shared prototypes in fdc-internal.h=0D
  hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c=0D
  hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c=0D
  hw/block/fdc: Add sysbus_fdc_init_drives() method=0D
  hw/sparc/sun4m: Inline sun4m_fdctrl_init()=0D
  hw/block/fdc-sysbus: Add 'dma-channel' property=0D
  hw/mips/jazz: Inline fdctrl_init_sysbus()=0D
=0D
 hw/block/fdc-internal.h | 156 +++++++++++=0D
 include/hw/block/fdc.h  |   7 +-=0D
 hw/block/fdc-isa.c      | 313 +++++++++++++++++++++=0D
 hw/block/fdc-sysbus.c   | 224 +++++++++++++++=0D
 hw/block/fdc.c          | 608 +---------------------------------------=0D
 hw/mips/jazz.c          |  16 ++=0D
 hw/sparc/sun4m.c        |  16 ++=0D
 MAINTAINERS             |   3 +=0D
 hw/block/Kconfig        |   8 +=0D
 hw/block/meson.build    |   2 +=0D
 hw/block/trace-events   |   3 +=0D
 hw/i386/Kconfig         |   2 +-=0D
 hw/isa/Kconfig          |   6 +-=0D
 hw/mips/Kconfig         |   2 +-=0D
 hw/sparc/Kconfig        |   2 +-=0D
 hw/sparc64/Kconfig      |   2 +-=0D
 16 files changed, 758 insertions(+), 612 deletions(-)=0D
 create mode 100644 hw/block/fdc-internal.h=0D
 create mode 100644 hw/block/fdc-isa.c=0D
 create mode 100644 hw/block/fdc-sysbus.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


