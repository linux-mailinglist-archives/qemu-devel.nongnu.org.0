Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D35A2DA193
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:33:06 +0100 (CET)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kouWl-0006cZ-BK
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kouUj-0004zW-DP
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:30:58 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kouUh-0007bN-CI
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:30:56 -0500
Received: by mail-wr1-x444.google.com with SMTP id 91so17725947wrj.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XiNJ+mL4y6Ph+oUhYFNcX7LRMIG8qqdoAQ1Y05akCKA=;
 b=zKW1AYbhXlLJNSlJwVC1i+8FSSo2eWchMouNPMCIl8tBc+Wg3QmBJ89zkUNO4Fb5/M
 ydJafFtOnRzNMJ6FLwu0j0r7OHk5BBcx/qRZ0Nqehgb94qxOZQlljdGaUaxpNyyOIRNc
 DrZgqUc6I5fXEgkA5/u7kaNlR3iyq+DiS6dMb5zIoabFJPdu886heSoMLvxi9pMXLiMT
 JWcuzkUHrwLIYkuatamdaZLs38Ynmn7rT+8wxBzLr2CIXudz9MQcfuxo/EiQohWYnmbN
 53OHezyzIn8AzNuiKbWTo6BOo3zRT/4L9rc0De8APdYjaRr4rgjfCPs9ee8xDqrG8xYw
 z1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XiNJ+mL4y6Ph+oUhYFNcX7LRMIG8qqdoAQ1Y05akCKA=;
 b=VJvB7fCm4bgur4uoKSlZ/d5wADLKkG1umSQ/Pxi/jrTmv+ZpHTXNs5EILVh8WYsbMJ
 tMenh5AtCygCDDAqO3IqBRz0IyloYb6m18VQYpVyUk0PgSVnRTUGCe1oqEfMCgeU1yx2
 zI8QmspYcFzKN3Ca7/v7xF7Oz3cO+SprrCRGPicI/2BtHikigF9JgMaFK3WfzaJtlcKR
 AezK2iMj9j7y6tNx5xVDlcK/TH1vpw8BAg7T5I5+ZoQF5saS7m8WPgEGpIbdCjdv0dsw
 H594C+iS/0uRZWp7cUVxcS+EJ3MFCaPYOOpdh6w55cL77BFtyIHX4O5ViW1EH0ybK+Kj
 4FTg==
X-Gm-Message-State: AOAM533j5EHakZheZYDKrUXQS0xjixaPZ/cCWxza+hCqoAfDAMVnYqTp
 BtsRxjaRVpu0MBKdNNGa3oYs2/doBWRPEA==
X-Google-Smtp-Source: ABdhPJy7gBE1OJbubPt01n2PRNiJw4TmL/GifmeifpGUeVJ9G1SmGgT4EGmqwNr/SPsV3dW7m8AT4Q==
X-Received: by 2002:adf:db51:: with SMTP id f17mr31531185wrj.83.1607977852523; 
 Mon, 14 Dec 2020 12:30:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b7sm34273589wrv.47.2020.12.14.12.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 12:30:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] qemu-timer: Make timer_free() imply timer_del()
Date: Mon, 14 Dec 2020 20:30:47 +0000
Message-Id: <20201214203050.6993-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently timer_free() is a simple wrapper for g_free().  This means
that the timer being freed must not be currently active, as otherwise
QEMU might crash later when the active list is processed and still
has a pointer to freed memory on it.  As a result almost all calls to
timer_free() are preceded by a timer_del() call, as can be seen in
the output of
  git grep -B1 '\<timer_free\>'

This is unfortunate API design as it makes it easy to accidentally
misuse (by forgetting the timer_del()), and the correct use is
annoyingly verbose.

Patch 1 makes timer_free() call timer_del() if the timer is active.
Patch 2 is a Coccinelle script to remove any timer_del() calls
that are immediately before the timer_free().
Patch 3 is the result of running the Coccinelle script on the
whole tree.

I could split up patch 3, but for 58 deleted lines over 42 files
created entirely automatedly, it seemed to me to be simpler as one
patch.

thanks
-- PMM

Peter Maydell (3):
  util/qemu-timer: Make timer_free() imply timer_del()
  scripts/coccinelle: New script to remove unnecessary timer_del() calls
  Remove superfluous timer_del() calls

 scripts/coccinelle/timer-del-timer-free.cocci | 18 +++++++++++++
 include/qemu/timer.h                          | 27 +++++++++++--------
 block/iscsi.c                                 |  2 --
 block/nbd.c                                   |  1 -
 block/qcow2.c                                 |  1 -
 hw/block/nvme.c                               |  2 --
 hw/char/serial.c                              |  2 --
 hw/char/virtio-serial-bus.c                   |  2 --
 hw/ide/core.c                                 |  1 -
 hw/input/hid.c                                |  1 -
 hw/intc/apic.c                                |  1 -
 hw/intc/ioapic.c                              |  1 -
 hw/ipmi/ipmi_bmc_extern.c                     |  1 -
 hw/net/e1000.c                                |  3 ---
 hw/net/e1000e_core.c                          |  8 ------
 hw/net/pcnet-pci.c                            |  1 -
 hw/net/rtl8139.c                              |  1 -
 hw/net/spapr_llan.c                           |  1 -
 hw/net/virtio-net.c                           |  2 --
 hw/s390x/s390-pci-inst.c                      |  1 -
 hw/sd/sd.c                                    |  1 -
 hw/sd/sdhci.c                                 |  2 --
 hw/usb/dev-hub.c                              |  1 -
 hw/usb/hcd-ehci.c                             |  1 -
 hw/usb/hcd-ohci-pci.c                         |  1 -
 hw/usb/hcd-uhci.c                             |  1 -
 hw/usb/hcd-xhci.c                             |  1 -
 hw/usb/redirect.c                             |  1 -
 hw/vfio/display.c                             |  1 -
 hw/virtio/vhost-vsock-common.c                |  1 -
 hw/virtio/virtio-balloon.c                    |  1 -
 hw/virtio/virtio-rng.c                        |  1 -
 hw/watchdog/wdt_diag288.c                     |  1 -
 hw/watchdog/wdt_i6300esb.c                    |  1 -
 migration/colo.c                              |  1 -
 monitor/hmp-cmds.c                            |  1 -
 net/announce.c                                |  1 -
 net/colo-compare.c                            |  1 -
 net/slirp.c                                   |  1 -
 replay/replay-debugging.c                     |  1 -
 target/s390x/cpu.c                            |  2 --
 ui/console.c                                  |  1 -
 ui/spice-core.c                               |  1 -
 util/throttle.c                               |  1 -
 44 files changed, 34 insertions(+), 69 deletions(-)
 create mode 100644 scripts/coccinelle/timer-del-timer-free.cocci

-- 
2.20.1


