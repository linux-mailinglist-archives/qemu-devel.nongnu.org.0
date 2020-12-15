Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C562E2DB050
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:44:10 +0100 (CET)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCUj-0006ME-S3
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpCRt-0003Mt-RQ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:41:13 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpCRr-0004tp-Tn
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:41:13 -0500
Received: by mail-wr1-x434.google.com with SMTP id r7so20309917wrc.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=26NGPHSQLV8LcV/Z4zDtw3XpXCDw0Dj1JsugWufRvVE=;
 b=kLK1XfyDoqHG8+8AKA2HJdiFFv3J044FJaYTftiL2G0mWAnemfhsW7WN7d/8LKkH1b
 vYHpLymUrvCxsII6d1fDgRVjGE8w+4NZ8DF9AWbpRioIJZgKLyPEHmQRN6QeFiBbpRke
 EbF4XJgpPoD6q8db9vguhbRA5dFjzCIAxI6+giwPOVr2XA4WwmxuXyRaDk/ioAvifCZb
 2jea9MqTeic7o7OQvishGf8OuTgOZfUX02/lCWZ9GjxUR6BNyIGWf4lagGuC/RA8tiVd
 RWkppJwPHwzD+PNBlrMoDekbFDmHwXcwfEjdiPGPrVwE8SjpPVYF50udIYy8J/rhQbd8
 mn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=26NGPHSQLV8LcV/Z4zDtw3XpXCDw0Dj1JsugWufRvVE=;
 b=Q2Zqj55d6RP6d4em+tBrxybklAUZs9MfYTrDSJtKDe4vNy1bAyUpd28EI2qrX4oFsW
 eFBbdZm3l/mnzwc8Gxg3joOO2Nhn44gg/i6dP4g3bG/M4uY3roZs222b7oAf5UZC81Q2
 SVXG/bIIpAmBAjxa3AI1T9xI2T6SY86e1VqIN8sDW2Q8Y25LyTdqd4XFazyiqsK9Xizm
 cyL7yhUv1VMvUw/4CglO01we+cpqsMDRpzSGoOn/3/owFf6Yue2XNwTRxivrpWZbX2Mv
 kXSTsAvgeMNCMzS5FodoPTUPmSjkziet3L3rnzkN67vJlP3y2HTp+8er6s6jeBTFk2Cl
 8tzg==
X-Gm-Message-State: AOAM531xvmCrpVfjQWob4CqprB5aRWDhAdX/Tga+qU0yWwTEuRO2dBRD
 z+ZhhX8BeZTXK/IQ+XyMXCispxDAK+JQog==
X-Google-Smtp-Source: ABdhPJyIqj2o9eH1kMuTyaYGqBonTxBKKtQExfhroqn3DLSOqxU9WemDLdvYg4Uj2rPSogOuDye6pA==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr27157948wrt.396.1608046869954; 
 Tue, 15 Dec 2020 07:41:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 34sm38259978wrh.78.2020.12.15.07.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:41:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] qemu-timer: Make timer_free() imply timer_del()
Date: Tue, 15 Dec 2020 15:41:03 +0000
Message-Id: <20201215154107.3255-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Patch 4 makes a by-hand cleanup of a bit of the Arm CPU code
not caught by Coccinelle because it included a pointless
timer_deinit() between timer_del() and timer_free().

I could split up patch 3, but for 58 deleted lines over 42 files
created entirely automatedly, it seemed to me to be simpler as one
patch.

Changes v1->v2:
 * patch 1: unconditionally call timer_del() rather than trying
   to be clever
 * patch 4: new patch

thanks
-- PMM

Peter Maydell (4):
  util/qemu-timer: Make timer_free() imply timer_del()
  scripts/coccinelle: New script to remove unnecessary timer_del() calls
  Remove superfluous timer_del() calls
  target/arm: Remove timer_del()/timer_deinit() before timer_free()

 scripts/coccinelle/timer-del-timer-free.cocci | 18 +++++++++++++
 include/qemu/timer.h                          | 25 +++++++++++--------
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
 target/arm/cpu.c                              |  2 --
 target/s390x/cpu.c                            |  2 --
 ui/console.c                                  |  1 -
 ui/spice-core.c                               |  1 -
 util/throttle.c                               |  1 -
 45 files changed, 32 insertions(+), 71 deletions(-)
 create mode 100644 scripts/coccinelle/timer-del-timer-free.cocci

-- 
2.20.1


