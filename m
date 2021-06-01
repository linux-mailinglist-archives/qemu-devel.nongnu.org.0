Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51B397AF6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 22:05:35 +0200 (CEST)
Received: from localhost ([::1]:54056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loAdq-0004EW-59
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 16:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1loAbW-0002J4-Js
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:03:10 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1loAbU-0002rC-VE
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:03:10 -0400
Received: by mail-pf1-x434.google.com with SMTP id q25so355017pfh.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 13:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mEe9xNGKXj7ZHYAKaZUFtm1o1lJS2SDL4UJcbNhoIvU=;
 b=R/wLB6fYXB5wHILj43O7q0XqVdp5cAOA4iOPfBYtGjcGclPGYyDiS2nhwiSPrC5ACs
 NBwC+IFxw1ZO78imtFQqOMxeZY4jLoSLmsFgujILY/PU1HHpInoq3bv/Y9mixUfhQaUi
 Y9aiGksGJs2maq7q+1ppERbdvcsuRPv8TA4nxNTK1+UbL71gWvdItE24Q1h+SpDKssnq
 T/iDE6GYgQD5lh+poV63U8vHCghjNlAidikiFrNE2CaurdmPk3gfewzeGwomgsScieFP
 Z8FdNjsgg0zw89cooRn1gVbdPvRfgBLbt6NIjG3xVw6BO/KPKMQjDmf7MS6sYvCqZLa8
 s4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mEe9xNGKXj7ZHYAKaZUFtm1o1lJS2SDL4UJcbNhoIvU=;
 b=WPlANWTOl2HuTZhWpxpv8fcv+Hze3X1AS8DwgQZPOEX0bpoa5UaAp+sspvCdBYFz9T
 YHonFlQgEvktvoY27m75kD0LV6m8fGgsx6Qp9eYqlqe4g/itWDOMMHEssuxapXgRQEn0
 parsd4E/+Eha9YWOGtX2P54+wj1iLQs0Fz4qZtzlZXWxqzdfWwe8grmiTj2WQ92q77FF
 Xmwxukve1sAfWHExoP+vwY96wx0ihPJcobfP5w5h8xLUsBCneHH2v19Q0huNej5MTPFJ
 UxUDUYhTGcv6NabfzbkSOeB/PNyBeUHaLFErzCDEhhykDSbLYOPGk2hQSJkgURdNRxf5
 54/w==
X-Gm-Message-State: AOAM5319RitbQXhQLM5lnU04EzNj3PqUw8oCynU+n+dZC1vfqP9FxPxC
 OnPeS6nPDD3ABYa8ebLBIv4pFQ==
X-Google-Smtp-Source: ABdhPJyUAg3yjGzYjNJ3p/bsJRdaHcdWszyiDhOx1qeyCQSaa/K+xQ5xAswe+I+CfLwRQKXc14V03w==
X-Received: by 2002:a62:1890:0:b029:2e8:f5e5:a05b with SMTP id
 138-20020a6218900000b02902e8f5e5a05bmr23440842pfy.81.1622577787297; 
 Tue, 01 Jun 2021 13:03:07 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 23sm15486229pgv.90.2021.06.01.13.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 13:03:06 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com
Subject: [PATCH 0/5] virtio: Add vhost-user based RNG service
Date: Tue,  1 Jun 2021 14:03:00 -0600
Message-Id: <20210601200305.1772391-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: viresh.kumar@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This sets adds a vhost-user based random number generator (RNG),
similar to what has been done for i2c and virtiofsd.  In fact
the implementation for vhost-user-rng and vhost-user-rng-pci
follow what was done for vhost-user-i2c.

Applies cleanly to git://git.qemu.org/qemu.git master (52848929b70d).

Regards,
Mathieu

Mathieu Poirier (5):
  vhost-user-rng: Add vhost-user-rng implementation
  vhost-user-rng-pci: Add vhost-user-rng-pci implementation
  vhost-user-rng: backend: Add RNG vhost-user daemon implementation
  docs: Add documentation for vhost based RNG implementation
  MAINTAINERS: Add maintainer for vhost-user RNG implementation

 MAINTAINERS                              |   9 +
 docs/tools/vhost-user-rng.rst            |  74 +++++
 hw/virtio/Kconfig                        |   5 +
 hw/virtio/meson.build                    |   2 +
 hw/virtio/vhost-user-rng-pci.c           |  79 +++++
 hw/virtio/vhost-user-rng.c               | 294 +++++++++++++++++
 include/hw/virtio/vhost-user-rng.h       |  33 ++
 tools/meson.build                        |   8 +
 tools/vhost-user-rng/50-qemu-rng.json.in |   5 +
 tools/vhost-user-rng/main.c              | 403 +++++++++++++++++++++++
 tools/vhost-user-rng/meson.build         |  10 +
 11 files changed, 922 insertions(+)
 create mode 100644 docs/tools/vhost-user-rng.rst
 create mode 100644 hw/virtio/vhost-user-rng-pci.c
 create mode 100644 hw/virtio/vhost-user-rng.c
 create mode 100644 include/hw/virtio/vhost-user-rng.h
 create mode 100644 tools/vhost-user-rng/50-qemu-rng.json.in
 create mode 100644 tools/vhost-user-rng/main.c
 create mode 100644 tools/vhost-user-rng/meson.build

-- 
2.25.1


