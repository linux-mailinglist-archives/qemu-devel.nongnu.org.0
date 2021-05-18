Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A71C38827C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:58:10 +0200 (CEST)
Received: from localhost ([::1]:57328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7j7-0000XL-7O
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7gw-0006v5-Ma
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:55:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7gu-00031U-4X
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621374950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iwPTSnUzasJPCowJwZrFFLROiQKhyLGntXBxpLTtUpw=;
 b=LGfn7AmgkWOaeresUJKOiKGz95mLxyn7jBDlg7sLg752HFE3sCu0Ms5ih7Ire8IEeCMxG7
 sD0TV9DqWNesScAzQFsH4c9CvMlxZ+emlysAulR1lspkapt59N1xNAMUZiWrlD5eawe81Y
 xws3NMu0KliFNQAVQ5PLUxoe7G9czPQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-Gdpqr1toOLuHPXuYHd9kBw-1; Tue, 18 May 2021 17:55:48 -0400
X-MC-Unique: Gdpqr1toOLuHPXuYHd9kBw-1
Received: by mail-ed1-f69.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso6480387edd.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dTDS+3SoFn9/Vi3XTWJF6ZY2c+drXEKjdXhqZt4x4Ko=;
 b=TAS0xfwzs0XNXEAXAFgunJ/8yAjXpHx/VSVHWE7pvoPF2mJJ5N6tgXpiqToC2OZk+4
 Xafn3IEQgtu/QsoeXQ66ZEQxiimWOHOWcPti16blJpMch3KQ3CbYLM8GlHdOQAfLQoxb
 l9t0r2/mkqv0s5Nhxsh8/70crVafrNXnYyHYnX+9QpSa44hKeLILhCtO21mjY2gnodaY
 ovx+cCTO66DmYgfMc4Pdi7k22HLhD4fpfyircla6w2z9VeoNLPTZqVgQ/Brz7NGuzKgn
 yDedLhR/pWpxvkxk69UHb23iTmFnbS04bYmvP62oyNCtdWHM+tC1/2+IenFadQx8aQmV
 fZUQ==
X-Gm-Message-State: AOAM531xYUx2PNqyLmBi66sFexHE3bCbE946tdDj0SZHIWXNGo1izymX
 s5DeEnfWZPWw2uoO3FkdnqgzXFA2OAtoOFsAEse+IKp1WRwKEchCBEM3A5vVDCNW0yDrRClDeuo
 OB4mqJlUKrLmU1xE=
X-Received: by 2002:a17:906:604a:: with SMTP id
 p10mr8205564ejj.148.1621374947029; 
 Tue, 18 May 2021 14:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPIjDLM2eZESH8CIzhg3sPw39Bmrj1Yh/df+01hiYBOnGt2nN7ZYGZNZdFMelrEj2eVp3FwQ==
X-Received: by 2002:a17:906:604a:: with SMTP id
 p10mr8205544ejj.148.1621374946869; 
 Tue, 18 May 2021 14:55:46 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m19sm8442996edd.12.2021.05.18.14.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:55:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 00/11] hw/isa: Remove dependencies on ISA bus singleton
Date: Tue, 18 May 2021 23:55:34 +0200
Message-Id: <20210518215545.1793947-1-philmd@redhat.com>
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series implements the suggestions from Markus analysis:=0D
https://www.mail-archive.com/qemu-block@nongnu.org/msg84090.html=0D
on the ISA bus.=0D
=0D
There is still work to do (remove global get_system_io?) but=0D
this is enough to convert a crash to an error message, and=0D
the changes are simple, so posting now as RFC.=0D
=0D
TBC...=0D
=0D
Philippe Mathieu-Daud=C3=A9 (11):=0D
  hw/isa: Explode pci_create_simple() calls=0D
  hw/ide: Add PCIIDEState::isa_bus link=0D
  hw/ide/piix: Set the ISA-bus QOM link=0D
  hw/ide/via: Set the ISA-bus QOM link=0D
  hw/isa: Extract isa_bus_get_irq() from isa_get_irq()=0D
  hw/ide: Replace isa_get_irq() by isa_bus_get_irq()=0D
  hw/isa: Simplify isa_get_irq()=0D
  hw/isa: Extract bus part from isa_register_portio_list()=0D
  hw/ide: Let ide_init_ioport() take an ISA bus argument instead of=0D
    device=0D
  hw/isa: Remove use of global isa bus=0D
  hw/isa: Rename isabus singleton as 'g_isabus'=0D
=0D
 include/hw/ide/internal.h |  3 +-=0D
 include/hw/ide/pci.h      |  1 +=0D
 include/hw/isa/isa.h      |  5 ++++=0D
 hw/i386/pc_piix.c         |  7 +++--=0D
 hw/ide/ioport.c           | 11 +++----=0D
 hw/ide/isa.c              |  3 +-=0D
 hw/ide/piix.c             | 22 +++++++++++---=0D
 hw/ide/via.c              | 18 ++++++++++--=0D
 hw/isa/isa-bus.c          | 61 +++++++++++++++++++++++++++++----------=0D
 hw/isa/piix4.c            | 13 ++++++---=0D
 hw/mips/fuloong2e.c       |  7 ++++-=0D
 hw/ppc/pegasos2.c         |  7 ++++-=0D
 12 files changed, 122 insertions(+), 36 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


