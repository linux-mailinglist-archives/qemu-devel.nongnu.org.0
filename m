Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53E63F1B91
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:26:20 +0200 (CEST)
Received: from localhost ([::1]:38598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGizr-0005Ls-H5
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiuy-0003f2-Hh
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:21:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiuv-0006gV-IP
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629382872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEyWPjQ7Gf9BUPz8WL5PzOlCAdvMwlwVzwTeHocd/5s=;
 b=daPx9HJETfmKooFyIoZ0r0+exmFUutScKBn9dGBkrARVyM4Ekvj5HJJll7zZLIbjVJfMkE
 qfFoBlqx4DM1s18jImk0Qw22Er76YTS1BWZrOQURL9/tR5cgm/iZcw0uUFhCIHBxsNXrfT
 S7rBueqsKlQ60C+ggHz4aeODiMd5yrs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-fuL0hYlvMBKY6cZhMLpYyw-1; Thu, 19 Aug 2021 10:21:12 -0400
X-MC-Unique: fuL0hYlvMBKY6cZhMLpYyw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j33-20020a05600c1c21b02902e6828f7a20so1593975wms.7
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEyWPjQ7Gf9BUPz8WL5PzOlCAdvMwlwVzwTeHocd/5s=;
 b=ClXVsHRalQ0Bj3cZWF2mOSenR3pMHVUSBzMYYWV1xMfzZ/avdF0Csz9gcpOCS0mpZL
 0SqMu+/xMrllOWCCqYylR7OfqSgq6U+Nch6b81D1UrnG92AUc/wVGi4i8cmedTzT7vqB
 ODxe9QV1Uml47hHkXLUZ+1Kg4X1JlopO+V3jBR4DfPw838cM9+XmmgLBLTd/69Zl4RP5
 vOLeBYkDD7WNwE0c8aB7gwFG+zHrdBtQnVEON1IShgLHB+Cp2GsO9wGfzyYYxnyIjxzr
 nofpo6QGEPQZfH/u2979PJRO1/CL4KX+0wEl3k3zN1h7v2P0jleYajsd0Ssu0e1feOmE
 1TKw==
X-Gm-Message-State: AOAM5308Xipap9KUVnCVl2MXcpUbW+u+IOdnRZwy+ACGeMpP1SBRXmK8
 zp/G050ugcot+JJjb6Oxx1xdX0Me428SU/4iAZkU+WcoKZvTgtaacdUNop9dmbMpNY5g4DcnYZ8
 GU3jFD7PtM3Y+jlSBqUg8Sipp2wAu2rhU8FizG5R19CiwRj0kXEINpuBY5zyipzEW
X-Received: by 2002:a7b:c756:: with SMTP id w22mr13968329wmk.169.1629382870409; 
 Thu, 19 Aug 2021 07:21:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU2eFmgEMwmeuxPkpBabQdTNmtrIGJQ5ir7VEREfQX+1H+HLk1sQXOB7OkSAlvY+9nPvSZzg==
X-Received: by 2002:a7b:c756:: with SMTP id w22mr13968302wmk.169.1629382870176; 
 Thu, 19 Aug 2021 07:21:10 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j17sm3000947wrt.69.2021.08.19.07.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:21:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/6] memory: Have address_space_create() re-use global
 &address_space_memory
Date: Thu, 19 Aug 2021 16:20:39 +0200
Message-Id: <20210819142039.2825366-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819142039.2825366-1-philmd@redhat.com>
References: <20210819142039.2825366-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a global AddressSpace created along with the
global get_system_memory(): address_space_memory. Return it
directly instead of creating the same AS with a different name.

This drastically reduce 'info mtree' on some boards (diff -c100):

  (echo info mtree; echo q) | ./qemu-system-aarch64 -S -monitor stdio -M raspi3b
  QEMU 6.0.93 monitor - type 'help' for more information
  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-000000003fffffff (prio 0, ram): ram
      000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
        000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
        000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
        000000003f006000-000000003f006fff (prio 0, i/o): mphi
        000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
        000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
        000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
        000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
        000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
        000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
        000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
        000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
        000000003f201000-000000003f201fff (prio 0, i/o): pl011
        000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
        000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
        000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
        000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
        000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
        000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
        000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
        000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
        000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
        000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
        000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
        000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
        000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
        000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
        000000003f980000-000000003f990fff (prio 0, i/o): dwc2
          000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
          000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
        000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
        000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
        000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15
      0000000040000000-00000000400000ff (prio 0, i/o): bcm2836-control

  address-space: I/O
    0000000000000000-000000000000ffff (prio 0, i/o): io

  address-space: bcm2835-mbox-memory
    0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
      0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
      0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property

  address-space: bcm2835-fb-memory
    0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
      0000000000000000-000000003fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      0000000040000000-000000007fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
      0000000080000000-00000000bfffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      00000000c0000000-00000000ffffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff

  address-space: bcm2835-property-memory
    0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
      0000000000000000-000000003fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      0000000040000000-000000007fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
      0000000080000000-00000000bfffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      00000000c0000000-00000000ffffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff

  address-space: bcm2835-dma-memory
    0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
      0000000000000000-000000003fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      0000000040000000-000000007fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
      0000000080000000-00000000bfffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      00000000c0000000-00000000ffffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff

  address-space: dwc2
    0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
      0000000000000000-000000003fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      0000000040000000-000000007fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
      0000000080000000-00000000bfffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      00000000c0000000-00000000ffffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff

- address-space: cpu-secure-memory-0
-   0000000000000000-ffffffffffffffff (prio 0, i/o): system
-     0000000000000000-000000003fffffff (prio 0, ram): ram
-     000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
-       000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
-       000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
-       000000003f006000-000000003f006fff (prio 0, i/o): mphi
-       000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
-       000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
-       000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
-       000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
-       000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
-       000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
-       000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
-       000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
-       000000003f201000-000000003f201fff (prio 0, i/o): pl011
-       000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
-       000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
-       000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
-       000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
-       000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
-       000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
-       000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
-       000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
-       000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
-       000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
-       000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
-       000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
-       000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
-       000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
-       000000003f980000-000000003f990fff (prio 0, i/o): dwc2
-         000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
-         000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
-       000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
-       000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
-       000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15
-     0000000040000000-00000000400000ff (prio 0, i/o): bcm2836-control
-
- address-space: cpu-memory-0
-   0000000000000000-ffffffffffffffff (prio 0, i/o): system
    [...]
-
- address-space: cpu-secure-memory-1
-   0000000000000000-ffffffffffffffff (prio 0, i/o): system
    [...]
-
- address-space: cpu-memory-1
-   0000000000000000-ffffffffffffffff (prio 0, i/o): system
    [...]
-
- address-space: cpu-secure-memory-2
-   0000000000000000-ffffffffffffffff (prio 0, i/o): system
    [...]
-
- address-space: cpu-memory-2
-   0000000000000000-ffffffffffffffff (prio 0, i/o): system
    [...]
-
- address-space: cpu-secure-memory-3
-   0000000000000000-ffffffffffffffff (prio 0, i/o): system
    [...]
-
- address-space: cpu-memory-3
-   0000000000000000-ffffffffffffffff (prio 0, i/o): system
    [...]
-
  memory-region: ram
    0000000000000000-000000003fffffff (prio 0, ram): ram

  memory-region: bcm2835-peripherals
    000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
      000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
      000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
      000000003f006000-000000003f006fff (prio 0, i/o): mphi
      000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
      000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
      000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
      000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
      000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
      000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
      000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
      000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
      000000003f201000-000000003f201fff (prio 0, i/o): pl011
      000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
      000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
      000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
      000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
      000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
      000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
      000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
      000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
      000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
      000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
      000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
      000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
      000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
      000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
      000000003f980000-000000003f990fff (prio 0, i/o): dwc2
        000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
        000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
      000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
      000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
      000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15

  (qemu) q

Inspired-by: Jianxian Wen <jianxian.wen@verisilicon.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Note, we loose the specific description of the duplicated
address spaces, but this doesn't seem very useful in this
output, it is rather more confusing IMO.
---
 softmmu/memory.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 16a2b518d8d..e4506b5a0d5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2941,6 +2941,10 @@ AddressSpace *address_space_create(MemoryRegion *root, const char *name)
 {
     AddressSpace *as;
 
+    if (root == get_system_memory()) {
+        return &address_space_memory;
+    }
+
     as = g_new(AddressSpace, 1);
     address_space_init(as, root, name);
 
@@ -2961,6 +2965,10 @@ void address_space_destroy(AddressSpace *as)
 {
     MemoryRegion *root = as->root;
 
+    if (as == &address_space_memory) {
+        return;
+    }
+
     /* Flush out anything from MemoryListeners listening in on this */
     memory_region_transaction_begin();
     as->root = NULL;
-- 
2.31.1


