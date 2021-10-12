Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB71D42AE70
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:03:04 +0200 (CEST)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maOvP-0008Fd-Ct
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1maOre-0005pw-O2
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 16:59:10 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1maOrc-0005BE-UA
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 16:59:10 -0400
Received: by mail-pf1-x436.google.com with SMTP id i65so547577pfe.12
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JeBFfQ/+qvVCxbX10oVdP+9CpdaapRqqSfiSwCgvArI=;
 b=xSg3DcqIagg3zegsvN5xZceTUfarxU10z2g8k74MZbJMR2mfbTZ+prX+OeQ432lzL1
 xZOYyErbRSY10blEU1mqb/vhEw9LQKVCmh8UDau9od4HvTZQ+Jt2JC9Br/f3M4z1mK6K
 UyHKGVNnm46sqi8L9hIECfDxmUqeFYkw51BwWO8bBYXCXWyDsTK1oSlGhzFpo7ipNXju
 fqc7ERywxfmHgQ5I7gSg/1T4yVfpQ1OF/CIIXPNIHApxEteLK0H4X8ePLYRXgR0Pt1ag
 Zcc6VFqXF4J1Nt6cHZqg52cOxaYWHZdONAAuD9nxHRmRDRMdVhPbi8UC2FMg6h1MVhtt
 muYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JeBFfQ/+qvVCxbX10oVdP+9CpdaapRqqSfiSwCgvArI=;
 b=47pZk0DRCPasawFy8MDLOMQcNQwM/T5H54CMVpsLwsscsSiAxrFAyv/To4tmKDJqB9
 NRZ/u1BPhkusuczQ5TFdq30ONJlQPsPriU0n3Sx5zYd0FHzUNZi+KDv2PLZtRZiZchIc
 MvSXFoOqgtnVuSdgFWHU1waJyJOT5/adM6r+oS5C7AVbVLkFT6tFzkMzZi8vBPsFR49W
 ExMOXQhB4obgWQJF5s3VJw8N79RhnMKsXYqfMc7BB2VKTHzijwcnELQeO7JAbYg2Srcl
 JsqslgIkEg+LzmzmUctYbv/3SEBpqIo9udS7qT6povm4LqkxEq3Y6I+WHftBFmh1+KYi
 iLMQ==
X-Gm-Message-State: AOAM533V1rvWoHgTmh/UTAEbA9Y2fqoEntJDVxYX2qAEdFLaphEa/YHl
 x5iLw1UdQOfOrm2MtjdJfUY7ZQ==
X-Google-Smtp-Source: ABdhPJxLp0p08Z7+FQLstc/HLFyL4klSq/frKczzyZl0jEbPWTLqICFx2dwA2/SSVjYNlRf/zo7pDg==
X-Received: by 2002:a62:5209:0:b0:44c:68a7:3a61 with SMTP id
 g9-20020a625209000000b0044c68a73a61mr33564201pfb.83.1634072346387; 
 Tue, 12 Oct 2021 13:59:06 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id e24sm11695087pfn.8.2021.10.12.13.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 13:59:05 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com
Subject: [PATCH v5 0/3] virtio: Add vhost-user based RNG 
Date: Tue, 12 Oct 2021 14:59:01 -0600
Message-Id: <20211012205904.4106769-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x436.google.com
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
the vhost-user protocol.  Aside from a new reference to file
vhost-user-rng.rst, the code and features of this revision are
unchanged.

Applies cleanly to git://git.qemu.org/qemu.git master(8be1d4ed9838).
 
Thanks,
Mathieu
 
[1]. https://github.com/rust-vmm/vhost-device/pull/29

Mathieu Poirier (3):
  vhost-user-rng: Add vhost-user-rng implementation
  vhost-user-rng-pci: Add vhost-user-rng-pci implementation
  docs: Add documentation for vhost based RNG implementation

 docs/system/device-emulation.rst       |   1 +
 docs/system/devices/vhost-user-rng.rst |  39 ++++
 hw/virtio/Kconfig                      |   5 +
 hw/virtio/meson.build                  |   2 +
 hw/virtio/vhost-user-rng-pci.c         |  79 +++++++
 hw/virtio/vhost-user-rng.c             | 289 +++++++++++++++++++++++++
 include/hw/virtio/vhost-user-rng.h     |  33 +++
 7 files changed, 448 insertions(+)
 create mode 100644 docs/system/devices/vhost-user-rng.rst
 create mode 100644 hw/virtio/vhost-user-rng-pci.c
 create mode 100644 hw/virtio/vhost-user-rng.c
 create mode 100644 include/hw/virtio/vhost-user-rng.h

-- 
2.25.1


