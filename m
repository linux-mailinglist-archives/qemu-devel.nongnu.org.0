Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CEE360713
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:26:57 +0200 (CEST)
Received: from localhost ([::1]:56316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzD5-0000Zp-Vm
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWz9t-0007HA-AM
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:23:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWz9o-0008Q6-NH
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618482207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EN7Re+e/qT/ndd/ZuaOJRAMaVIcR4xwNF3U5DieyInM=;
 b=ZyVPp57YfczAj0t8IUN29dWvMje10fpgf0BYmKID3E+1eKBzPfdnMg/rbnqnR16Mtku4fn
 ftFNxJn0Axj8hsIfvZx7cTW2NJw6s3TxIeZhXltCAPeRW1RmivEguRG6Mp/s2gsWq6/TRU
 xukyvq/T3ZNHifFzKSAa9lcBDP11KP0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-6JxTIpJlNXWQRO2G8PLL9Q-1; Thu, 15 Apr 2021 06:23:26 -0400
X-MC-Unique: 6JxTIpJlNXWQRO2G8PLL9Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 l18-20020a0560000232b02901026f4b8548so2531327wrz.10
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 03:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WPgCPFcFXU7zhsnoT1tDmrB8VOQYz2vfXvwjXPZcR7c=;
 b=Oo0FZKwNgAy/t05SaNY8LjXR+mLu5ztSqKoWU8coBBn9yfhKM4C6QtSt6KeXVU/et4
 JEWB0mXJ8ezYB2l2SmeIEMdeGmcqbBAMMrpuY4568i7X8NivWdtYLxfBw3I6HzoQLj55
 3WMhR4EqTeUEFrQkx8CBu2nO6t4HN1L3crWhgiGpIoFDYCoWZihYDwyd33BC+O4pidKI
 tRzIpCi/ALz831aBNZdn14sc6g2dGYPcDyBntsp6KfWj4i57LkIUApIFr2h4mzwcS2ii
 usDWnt2fnwIP5ku2om8cV/uTOglN6Y+EGEPwijFgdXY4DrD0jwCz634fjgqm2gw4ctzw
 h7Pw==
X-Gm-Message-State: AOAM531NFoKfh2VT5udHQ/xOipjUel9t/A0bqxxVu2Tuej78S8wFUl0I
 Di2zeICnjXWLo7LYWB4JVzMPDG7I4b8ovat9SvZvh5rJnba84g2s/0p00oIaoYSlKpaXEAv35IX
 O2KnUEuF13Uz1W5M=
X-Received: by 2002:a1c:c918:: with SMTP id f24mr2479312wmb.12.1618482205173; 
 Thu, 15 Apr 2021 03:23:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/QIxiWQzMBljDMViGfFuRzYIWOmWqAPNxHsBID/S2I0wgk6E4O22EZgW794+sC5JhiwpWkQ==
X-Received: by 2002:a1c:c918:: with SMTP id f24mr2479273wmb.12.1618482204955; 
 Thu, 15 Apr 2021 03:23:24 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s83sm1968203wms.16.2021.04.15.03.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 03:23:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw/block/fdc: Allow Kconfig-selecting ISA bus/SysBus
 floppy controllers
Date: Thu, 15 Apr 2021 12:23:17 +0200
Message-Id: <20210415102321.3987935-1-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
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
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/block/fdc: Replace disabled fprintf() by trace event=0D
  hw/block/fdc: Declare shared prototypes in fdc-internal.h=0D
  hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c=0D
  hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c=0D
=0D
 hw/block/fdc-internal.h | 155 ++++++++++=0D
 hw/block/fdc-isa.c      | 313 +++++++++++++++++++++=0D
 hw/block/fdc-sysbus.c   | 252 +++++++++++++++++=0D
 hw/block/fdc.c          | 608 +---------------------------------------=0D
 MAINTAINERS             |   3 +=0D
 hw/block/Kconfig        |   8 +=0D
 hw/block/meson.build    |   2 +=0D
 hw/block/trace-events   |   3 +=0D
 hw/i386/Kconfig         |   2 +-=0D
 hw/isa/Kconfig          |   6 +-=0D
 hw/mips/Kconfig         |   2 +-=0D
 hw/sparc/Kconfig        |   2 +-=0D
 hw/sparc64/Kconfig      |   2 +-=0D
 13 files changed, 751 insertions(+), 607 deletions(-)=0D
 create mode 100644 hw/block/fdc-internal.h=0D
 create mode 100644 hw/block/fdc-isa.c=0D
 create mode 100644 hw/block/fdc-sysbus.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


