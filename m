Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5299641A2DB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:23:30 +0200 (CEST)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUz21-0003gL-CC
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1mUyt0-0000wD-Iy
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 18:14:10 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1mUysy-0005v6-Mx
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 18:14:10 -0400
Received: by mail-pf1-x435.google.com with SMTP id g14so17214039pfm.1
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 15:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WILAmHzfcOGmzytleiHCPSiU+oleN1230ub+WvObdZQ=;
 b=QzcUYiA3RpAOz3Md7/eyaz6KSV1v/ZsPcd9dzjXJlpBuXvUxccHATNcV4YgJi8Gqim
 MA+F91bzgKBAHYLKd0AJkBMeVl0w9GpNTwNS9ikh76hpUgt6fp5xkgPu3ZwUQB837FXv
 qbhkpbmkX0CcI9IhKBLMaGeaXFedvUxikmmTtAa8AUCNQ2cDSos4KrQSIpB2Pc8d58dR
 iyJFmMXkL0AAwCEyu1QGLaCmFgNBRWdDnBaYxb9Ba3IUfMc7+6e62W5gwqw7Ie8khPvf
 6W5m6Xe5L51C2Dq3eVufFCik1SYJT0+m+sm99ZqDeU5Rsgql0r5963XADpoIfO3HmjUA
 +psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WILAmHzfcOGmzytleiHCPSiU+oleN1230ub+WvObdZQ=;
 b=U61UI1MvVj9d/OHj1NFqgciPiRn1esQHHKijMdvTc8LCACzboiSf1O7ewks5LNqR6v
 Z8gKyQjwGaC7kKV9DkvD4rc/3s365fZk/GKa3XLDZfgBCsZ0rntvi8mk4FxjYYuAsxzF
 LLJ/k55ZsSE1IQ9/7he5NiKuX4TmnAYXOMEK1c0yYUl5HPJjlBq7ss+MPOyOzRhGlAPM
 yam9ajOtY2JTK+BophBfMTGZEKhxdpAQ4x3wvZHusDQfJ7D+iobbRb1XJ7bdiA9y0aRK
 iC+8qVuuW5YCTlV+hZjPlMZSj66imlIQ3RJ2YE6RWAyRFlWYi97/8rbgpTdLpdusLLjx
 y16Q==
X-Gm-Message-State: AOAM5308ZDO38i+4efkhMwC+YWe060cWOzijx1lXGajEWXX095viBwd4
 OGuofR76cp4pQMWjTqYa4eCmxw==
X-Google-Smtp-Source: ABdhPJzB0JslSvbHrsvtb3LR9KUVZYD28px3r1sG4yu1FAknPbMW7A0YV3uUFVJcZ0idlL2L3xvRWw==
X-Received: by 2002:a63:e413:: with SMTP id a19mr1602958pgi.408.1632780844436; 
 Mon, 27 Sep 2021 15:14:04 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id g27sm18817742pfk.173.2021.09.27.15.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 15:14:00 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com
Subject: [PATCH v4 0/3] virtio: Add vhost-user based RNG 
Date: Mon, 27 Sep 2021 16:13:56 -0600
Message-Id: <20210927221359.2917482-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This set implements a random number generator (RNG) device that follows
the vhost-user protocol. 

The main difference between V3 is the absence of the vhost-user daemon
implemenation.  It was dropped to favour the rust implementation
currently being considered under the vhost-device crate[1] of the
rust-vmm repository[1].

Applies cleanly to git://git.qemu.org/qemu.git master(de8ed1055c2c).

Thanks,
Mathieu

[1]. https://github.com/rust-vmm/vhost-device/pull/29

Changes for V4:
1. Addressed merge conflicts
2. Dropped error path after call to g_new0()
3. Changed #define in vhost-user-rng-pci.c 
4. Dropped vhost-user-daemon implementation
5. Modified documentation to reflect the above (4)
6. Added Alex's RB tags.

Mathieu Poirier (3):
  vhost-user-rng: Add vhost-user-rng implementation
  vhost-user-rng-pci: Add vhost-user-rng-pci implementation
  docs: Add documentation for vhost based RNG implementation

 docs/system/devices/vhost-user-rng.rst |  39 ++++
 hw/virtio/Kconfig                      |   5 +
 hw/virtio/meson.build                  |   2 +
 hw/virtio/vhost-user-rng-pci.c         |  79 +++++++
 hw/virtio/vhost-user-rng.c             | 289 +++++++++++++++++++++++++
 include/hw/virtio/vhost-user-rng.h     |  33 +++
 6 files changed, 447 insertions(+)
 create mode 100644 docs/system/devices/vhost-user-rng.rst
 create mode 100644 hw/virtio/vhost-user-rng-pci.c
 create mode 100644 hw/virtio/vhost-user-rng.c
 create mode 100644 include/hw/virtio/vhost-user-rng.h

-- 
2.25.1


