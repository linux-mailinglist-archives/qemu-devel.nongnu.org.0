Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640F482406
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:52:53 +0100 (CET)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HOt-0000D8-Ca
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:52:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKG-0005o7-QZ
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKD-0000gd-2S
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bnUZAIsn5+Vv9R9ZqUw0tkJjIRahUkiN92W+81pV1dM=;
 b=axLK0Vm4MBFH4zoSbspX22OobLj1+98xwtnrRhzXemZx0HjeigrvGCKvZZVhtUCnJe5LeW
 bm72ZkwfxEiUxRIB+vvHq0YLGku2AyoIl32/8Ed7OMLWr2vt510YU6gwDY+TvKCveMvVrC
 VKku187Rv/f32uvTLpmzTDAm8iET4xU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-_GDS0uaSOJ24_7HbYIieOQ-1; Fri, 31 Dec 2021 07:47:57 -0500
X-MC-Unique: _GDS0uaSOJ24_7HbYIieOQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c511200b00345c1603997so6080005wms.1
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cf6ZhdG1yBcL3nZvjqvfqNtd9LsnThgHYxQXTlHgQR8=;
 b=w/vIA84Xfl1iTaxpKCEqwQk8YoR4XqrM+6J4TsrrZjsVn7L+QZUthWCfPJvhHikoro
 KFAwtmQPg3YgkPl0T+prjnuLJS5jp0oLs409fWOH4RPOyt3AhnAr6M3Z89wckHAfRsw3
 aMNdNizEe7B9nh+lCpBNNEDW8Gi/SC9jQhXesIdtZN2GzwQR/BcBmc1gWHiB+tvEiUK1
 Vp4u5bjFjJ5mruZ7rqV1xJftT8HwcHGy+OZ9kHXRRuPiBpSjtgreuwISzhL7U9nABHCb
 hrXJPXCja/taP/T7Ow6ibstINZhT/76A5VIqknudQrI5y66Ggbl/XsM/xI4Cr+ap2SoN
 toAw==
X-Gm-Message-State: AOAM531UE+3h2AMZrPOYm5aj/RTVjlvufnXh0bcWL7lmagDUQ/7IUjPx
 PvVu1arJbfif1c+wICSgdKYEqw2ac++2/iop7nfLRw7Rwa2NgZ2tGgqladQQPIbHsaTo420Sbww
 og0i1LldrRstBLTgTWJ/ZuYOvFdeDIQNtZ3hdFf2eBptmQCYO4DV4y2nYfRmYsnaT
X-Received: by 2002:a05:600c:24c:: with SMTP id
 12mr30590756wmj.191.1640954876306; 
 Fri, 31 Dec 2021 04:47:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybXRItVI1lCGdgbW4q0GsoNoRX4YEPX75TFkPYiJQGRXJEXO23AJvx/fD2rxDCvviqd1oa5w==
X-Received: by 2002:a05:600c:24c:: with SMTP id
 12mr30590742wmj.191.1640954876005; 
 Fri, 31 Dec 2021 04:47:56 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id g1sm27177337wri.103.2021.12.31.04.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:47:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] Machine-next patches for 2021-12-31
Date: Fri, 31 Dec 2021 13:47:34 +0100
Message-Id: <20211231124754.1005747-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 69f153667fce723ee546d2f047d66d0cfa67c3cc=
:=0D
=0D
  Merge tag 'memory-api-20211231' of https://github.com/philmd/qemu into st=
aging (2021-12-30 17:02:42 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/machine-core-20211231=0D
=0D
for you to fetch changes up to 2ece6e64846e1929c4ed338c73328d3b126e48d3:=0D
=0D
  MAINTAINERS: email address change (2021-12-31 13:42:54 +0100)=0D
=0D
----------------------------------------------------------------=0D
Machine core patches=0D
=0D
- Clarify qdev_connect_gpio_out() documentation=0D
- Rework test-smp-parse tests following QOM style=0D
- Introduce CPU cluster topology support (Yanan Wang)=0D
- MAINTAINERS updates (Yanan Wang, Li Zhijian, myself)=0D
=0D
----------------------------------------------------------------=0D
=0D
Li Zhijian (1):=0D
  MAINTAINERS: email address change=0D
=0D
Philippe Mathieu-Daud=C3=A9 (13):=0D
  hw/qdev: Cosmetic around documentation=0D
  hw/qdev: Correct qdev_init_gpio_out_named() documentation=0D
  hw/qdev: Correct qdev_connect_gpio_out_named() documentation=0D
  hw/qdev: Rename qdev_connect_gpio_out*() 'input_pin' parameter=0D
  tests/unit/test-smp-parse: Pass machine type as argument to tests=0D
  tests/unit/test-smp-parse: Split the 'generic' test in valid / invalid=0D
  tests/unit/test-smp-parse: Add 'smp-with-dies' machine type=0D
  tests/unit/test-smp-parse: Add 'smp-generic-invalid' machine type=0D
  tests/unit/test-smp-parse: Add 'smp-generic-valid' machine type=0D
  tests/unit/test-smp-parse: Simplify pointer to compound literal use=0D
  tests/unit/test-smp-parse: Constify some pointer/struct=0D
  hw/core: Rename smp_parse() -> machine_parse_smp_config()=0D
  MAINTAINERS: Change philmd's email address=0D
=0D
Yanan Wang (6):=0D
  qemu-options: Improve readability of SMP related Docs=0D
  hw/core/machine: Introduce CPU cluster topology support=0D
  tests/unit/test-smp-parse: Add testcases for CPU clusters=0D
  tests/unit/test-smp-parse: No need to explicitly zero MachineClass=0D
    members=0D
  tests/unit/test-smp-parse: Keep default MIN/MAX CPUs in=0D
    machine_base_class_init=0D
  MAINTAINERS: Self-recommended as reviewer of "Machine core"=0D
=0D
 qapi/machine.json            |   5 +-=0D
 include/hw/boards.h          |   9 +-=0D
 include/hw/qdev-core.h       |  24 ++-=0D
 hw/core/gpio.c               |  13 +-=0D
 hw/core/machine-smp.c        |  32 ++--=0D
 hw/core/machine.c            |   5 +-=0D
 softmmu/vl.c                 |   3 +=0D
 tests/unit/test-smp-parse.c  | 295 ++++++++++++++++++++++++++---------=0D
 .gitlab-ci.d/edk2/Dockerfile |   2 +-=0D
 .mailmap                     |   1 +=0D
 MAINTAINERS                  |  21 +--=0D
 qemu-options.hx              |  79 +++++++---=0D
 12 files changed, 358 insertions(+), 131 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


