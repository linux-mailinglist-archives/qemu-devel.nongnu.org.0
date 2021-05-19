Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343B1389423
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:52:44 +0200 (CEST)
Received: from localhost ([::1]:48634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPR5-0004Zl-9Z
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljP9x-000349-5B
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:35:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljP9q-0006tU-TG
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621442094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rV9ninN+EWWtE0NMAF9tDmk6rOe+StkkqSMYVYku1cI=;
 b=PJ+43kUsbVpZnCq5UhiT0rKwc+QtWfU/FwM0OwgNgL5K9TrbLAQo/jggi8b1mZl3Uw84Lc
 YIQ4Cr/UnfApRysLjpKeslNkoz4+bpumDgOC+rIvnLl8w10Wz4qCSdSS1C6w8vNrcUQWBJ
 lllZpTsR/TZv8dXtiX6J/7UeMmO/R9Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-jcLfKWD_NDaoelMwdRhemQ-1; Wed, 19 May 2021 12:34:51 -0400
X-MC-Unique: jcLfKWD_NDaoelMwdRhemQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso7366748wre.8
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 09:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mjtlz+hBLPwtPGLKf7haxBJZl8liVUzhIpy0SiQdGCQ=;
 b=TI/UrB3XXYhIjPw4KvvrwbZK2vN5T3Jo3fUIPGgKvRdQzza+q74gASsJIdRTsxqUnK
 Wc43WXdNbEoOHdbQiicXpD+EeN9v8mXO7LRVJ38BJw9n7QlUYYF+HlKh+qv/MPzZokhu
 3oRC4XwZWSZ+wVe3+rBMVGQMbkboOrcjiUZfc6eqY23SfrGDPxGUQm/02B/06m2DVxxq
 yJ0IpWoYfHnIYw5MUetmJDfMluMPJ6gAlTukMrOw/jEXkQJGmiQotWD7a0AVnQQ7dHXr
 6yegxcNtZ9TqTcTnH+DwlhKzgei78s4KR98Ox/Oy2HjeZtMrAB/WhrLI67o7nOLsmsWq
 xiyA==
X-Gm-Message-State: AOAM530LrlJnUg64uFaDPusR5LuRxU6J5m48G6w6PTMq9YEM0kVhse2B
 hWmiVj9hh9rrhUWcXJ5uGWwAjpXr5gIn5scSS+FeubOYiLR9+RH2LPQ3P+vwn5iGRs0Qk4tGpF8
 j6rwTtjTTMd5RDWE=
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr171253wmf.53.1621442090523;
 Wed, 19 May 2021 09:34:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrVZ3OXOSiP0j8EpznB7GGnsIqvkEG+rqbVu/FgOIr4hRzVSbDU0q6MHteC9+MQBm8QLKS9Q==
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr171233wmf.53.1621442090294;
 Wed, 19 May 2021 09:34:50 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t11sm26390598wrz.57.2021.05.19.09.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 09:34:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v6 0/5] hw/block/fdc: Allow Kconfig-selecting ISA bus/SysBus
 floppy controllers
Date: Wed, 19 May 2021 18:34:43 +0200
Message-Id: <20210519163448.2154339-1-philmd@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO -> FDC=0D
  hw/block/fdc: Replace disabled fprintf() by trace event=0D
  hw/block/fdc: Declare shared prototypes in fdc-internal.h=0D
  hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c=0D
  hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c=0D
=0D
 hw/block/fdc-internal.h  | 158 ++++++++++=0D
 hw/block/fdc-isa-stubs.c |  22 ++=0D
 hw/block/fdc-isa.c       | 319 ++++++++++++++++++++=0D
 hw/block/fdc-sysbus.c    | 249 ++++++++++++++++=0D
 hw/block/fdc.c           | 621 +--------------------------------------=0D
 MAINTAINERS              |   4 +=0D
 hw/block/Kconfig         |  12 +-=0D
 hw/block/meson.build     |   5 +=0D
 hw/block/trace-events    |   3 +=0D
 hw/i386/Kconfig          |   2 +-=0D
 hw/isa/Kconfig           |   7 +-=0D
 hw/mips/Kconfig          |   2 +-=0D
 hw/sparc/Kconfig         |   2 +-=0D
 hw/sparc64/Kconfig       |   2 +-=0D
 14 files changed, 786 insertions(+), 622 deletions(-)=0D
 create mode 100644 hw/block/fdc-internal.h=0D
 create mode 100644 hw/block/fdc-isa-stubs.c=0D
 create mode 100644 hw/block/fdc-isa.c=0D
 create mode 100644 hw/block/fdc-sysbus.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


