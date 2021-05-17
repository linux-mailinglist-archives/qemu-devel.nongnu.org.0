Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2550383CD9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:02:20 +0200 (CEST)
Received: from localhost ([::1]:47844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiVP-0005eL-Qe
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lii9v-0005Sa-Jc
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lii9o-0001l3-QH
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621276800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+zjVxPOzAvlcqA8YSi24vXTZnBTIq1HhnlcQSAHxqFM=;
 b=JRVWzY7CvWwlrgIGKJYBd2Jk55QvRZjO26rq3+BoU9rnnuKfM3p1YVmVMs18nSO0+opTxM
 uU/oYvToTIzt3mhNk7KPzDEBcDov7mnK0mPMuh3kQ5pHwsOfPbOo6jHFKgEbPAqlfbkFyU
 k9DiB5FZ5VpQ1SkXtCiyyGMWWusl63I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-LkMhOOCBNdy8kfN8lyufDw-1; Mon, 17 May 2021 14:39:58 -0400
X-MC-Unique: LkMhOOCBNdy8kfN8lyufDw-1
Received: by mail-ej1-f69.google.com with SMTP id
 16-20020a1709063010b029037417ca2d43so1405873ejz.5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Aru9z1udzcRTR5uFuZ6Acy2FR3CvdYBmZEP/Hvi3caM=;
 b=Nnpui2s76L8ERVIwVV+o8Pb5jj08fuzdEcix3mCPPRzj6MMMfT0Z0/m5w/f3xQeGSN
 HoEkQbJCFFtEsLwCJAkLqk8I3RBF9a/65QTyCOKIKKpq4jHx61KtsgX6NYOpiYcBCoL5
 SYNFf3ooV0z6VStmLGzK4N5qccA/BmtZosvxFAlFOd2Zwmd993aWlPGixIOadD42VomU
 csOEiW5uMYtIT7bbzXNu9cpR4YmqZaDjNW0E4k3UiGISERgLoK2AlFl16YXBohr5e7Zg
 WSvRq6Q8ysBoOruSQqrRS+uYN0zX9Ge9yCxkyEPM5ljP9KmIoNGkJ1fzJ+myHu2LCx5W
 PXDg==
X-Gm-Message-State: AOAM5318Sgiu27q7WgPRju5Dz7W2W2I5Ir5oorQ6LupHagi3L2GiGHjU
 CnZkP359NysnjCgi8UQUr9uBZB4QwL2Mfxj86Bde4KfbkRYBJqiYbdzNsAEqk28rjH7siR3yJAn
 sHiHAtVDqNDUc+olXgX4iW8uUCM7BFGxIbcyT7C25VtAI/p9MzP5bUX3BC2IHWT2K
X-Received: by 2002:aa7:d659:: with SMTP id v25mr1700652edr.271.1621276796751; 
 Mon, 17 May 2021 11:39:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8LMgT/5tne/x6WyQE24ehKj7R5e+VBAuvvekzeZbT4uDvxAosOd/oMQrefY50UShRa4RJXA==
X-Received: by 2002:aa7:d659:: with SMTP id v25mr1700617edr.271.1621276796411; 
 Mon, 17 May 2021 11:39:56 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r10sm8944641ejd.112.2021.05.17.11.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 11:39:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v4 0/9] hw/block/fdc: Allow Kconfig-selecting ISA bus/SysBus
 floppy controllers
Date: Mon, 17 May 2021 20:39:45 +0200
Message-Id: <20210517183954.1223193-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: #1=0D
=0D
Hi,=0D
=0D
The floppy disc controllers pulls in irrelevant devices (sysbus in=0D
an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).=0D
=0D
This series clean that by extracting each device in its own file,=0D
adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.=0D
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
Philippe Mathieu-Daud=C3=A9 (9):=0D
  hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO -> FDC=0D
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
 hw/isa/Kconfig          |   7 +-=0D
 hw/mips/Kconfig         |   2 +-=0D
 hw/sparc/Kconfig        |   2 +-=0D
 hw/sparc64/Kconfig      |   2 +-=0D
 16 files changed, 759 insertions(+), 612 deletions(-)=0D
 create mode 100644 hw/block/fdc-internal.h=0D
 create mode 100644 hw/block/fdc-isa.c=0D
 create mode 100644 hw/block/fdc-sysbus.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


