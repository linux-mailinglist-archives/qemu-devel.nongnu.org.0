Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE25207208
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:28:29 +0200 (CEST)
Received: from localhost ([::1]:59836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3Zs-0008C4-7D
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noh4hss@gmail.com>) id 1jo3Yf-0006ec-12
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:27:13 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:39589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <noh4hss@gmail.com>) id 1jo3Yd-00075C-G1
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:27:12 -0400
Received: by mail-lf1-x141.google.com with SMTP id d21so1075124lfb.6
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 04:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9/cGYk8trZnOQeKgj1xBJl7f5Cw2cPfzBLUfudUzD3c=;
 b=sIPZIAuNZiXEDyN1TxOn4tPZAYCim2vo9BuEXeEJk5+7LkIkPf2C3JIoIbbAFV3r1g
 fXW4cc0lLfNqNMa//dJmNbiv7lHgu1XuA8/d2YsixQEEIQM6f3oVASsimeXWUVZWL7vl
 VPcLMhPqfckUzkDh3yM3A8c9g15ofclQ+35Y8ra6f5M3Ai1Qk5mteIPQQ0VT2tqoS3g8
 AJFMVcgwbA+ljmMC++dgfv0BEil/BFnTntDdA7LfYMz/PcI8CAXMA8kYlKGSBXgLzNke
 zM+asQWUic5vv6Tu11PaozdITgYu1mnDmP3wgI/VaFLaG+mNmW/oijPwCdKYy1CO/Y6n
 5xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9/cGYk8trZnOQeKgj1xBJl7f5Cw2cPfzBLUfudUzD3c=;
 b=FnyBPhGnQq2voX83yRJNuIyN66hkU3FpmbqNiULw1FwLQJDfsulKXvsHtLaTbRFYUe
 MoS8GhWhm0NKhuO3/mBnG6BckDSRGO3UGS5vMgTRqxfzaLiHcYjEJdS52sHnUsMTvCqi
 048+TK2lpd4IS2VlxhGTD6pXy3F8gYd3fv/VXPy7s+IrD+a/G7ZSF1l1Dhkzm8RfLGUN
 /F2ISnQf2fOqRMiowRL54esvFi6F4my97NqTxUf+I4nF81ico0E+c/ZFCeOprBc1+6eC
 dkPZprj/YXGhz5uCrQwXmy9cJK1m+iPsHsrNlAlb/8yQjmKMxrkYs35VOcnfh1Hkxus7
 6eMA==
X-Gm-Message-State: AOAM5329RIa/cRmAy+BfREhHrEoNXBfE3pFHK2Rlb0Pv2C1KVXnXx5PQ
 AQ14Rhdi7TJ4oiBX2On+e/dktu/TbSNcUA==
X-Google-Smtp-Source: ABdhPJx7yqPZyhnEK4n7zlIAeK3I9EbHlBBRZY0Y9L7iUr2mDkygi6dHWfxUGEMPMy7/ITUrGJ3jZg==
X-Received: by 2002:a19:c8c2:: with SMTP id y185mr15276087lff.52.1592998028913; 
 Wed, 24 Jun 2020 04:27:08 -0700 (PDT)
Received: from localhost.localdomain (193-239-39-51.ksi-system.net.
 [193.239.39.51])
 by smtp.gmail.com with ESMTPSA id d6sm1202635lja.77.2020.06.24.04.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 04:27:08 -0700 (PDT)
From: Szymon Lukasz <noh4hss@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] virtio-console: notify about the terminal size
Date: Wed, 24 Jun 2020 13:26:34 +0200
Message-Id: <20200624112640.82673-1-noh4hss@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=noh4hss@gmail.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: lvivier@redhat.com, amit@kernel.org, mst@redhat.com,
 Szymon Lukasz <noh4hss@gmail.com>, marcandre.lureau@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The goal of this series is to have a resizable terminal into a guest
without having to set up networking and using, e.g. ssh.

The virtio spec allows a virtio-console device to notify the guest about
terminal resizes in the host. Linux Kernel implements the driver part of
the spec. This series implement the device part in QEMU.

In this series resize notifications are only supported for the stdio
backend but I think it should be easy to add support for the vc backend.
Support for tty/serial backends is complicated by the fact that there is
no clean way to detect resizes of the underlying terminal.

Also there is a problem with the virtio spec and Linux Kernel
implementation, the order of fields in virtio_console_resize struct
differs between the kernel and the spec. I do not know if there is any
implementation of the virtio-console driver that handles resize messages
and uses a different order than Linux.


v2:
fix adding a new virtio feature bit to the virtio console device


Szymon Lukasz (6):
  main-loop: change the handling of SIGWINCH
  chardev: add support for retrieving the terminal size
  chardev: add support for notifying about terminal resizes
  char-stdio: add support for the terminal size
  virtio-serial-bus: add terminal resize messages
  virtio-console: notify the guest about terminal resizes

 backends/cryptodev-vhost-user.c   |  1 +
 chardev/char-fe.c                 | 11 ++++++
 chardev/char-mux.c                |  7 ++++
 chardev/char-stdio.c              | 35 +++++++++++++++++
 chardev/char.c                    |  1 +
 hw/block/vhost-user-blk.c         |  1 +
 hw/char/terminal3270.c            |  1 +
 hw/char/trace-events              |  1 +
 hw/char/virtio-console.c          | 65 +++++++++++++++++++++++++++++--
 hw/char/virtio-serial-bus.c       | 42 +++++++++++++++++++-
 hw/core/machine.c                 |  1 +
 hw/ipmi/ipmi_bmc_extern.c         |  1 +
 hw/usb/ccid-card-passthru.c       |  1 +
 hw/usb/dev-serial.c               |  1 +
 hw/usb/redirect.c                 |  1 +
 include/chardev/char-fe.h         | 11 ++++++
 include/chardev/char.h            |  2 +
 include/hw/virtio/virtio-serial.h |  5 +++
 include/qemu/main-loop.h          |  4 ++
 monitor/hmp.c                     |  1 +
 monitor/qmp.c                     |  1 +
 net/vhost-user.c                  |  1 +
 ui/curses.c                       | 11 +++---
 util/main-loop.c                  | 21 ++++++++++
 24 files changed, 216 insertions(+), 11 deletions(-)

-- 
2.27.0


