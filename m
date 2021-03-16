Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2914933D385
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:06:54 +0100 (CET)
Received: from localhost ([::1]:43340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8TN-0004EC-5i
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RA-0002OH-3U
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:36 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:56183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8R4-0003gc-Jf
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:35 -0400
Received: by mail-pj1-x1036.google.com with SMTP id bt4so10503889pjb.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XGs0cESKg54US3MieKzD9mjNvNrBnzNfShHqBVMa7GU=;
 b=gzLCPTxZfXJqVNWqVDBKjh6lQ6HNcDK1VAhc85HPigNtuyCFn/6rLV8HNRY2UmPuEA
 fQB0qhgHlxF6HyFlrDKXc0Q2isJ2gX+B8sTxFcRJzO6IKZp64ysD3FJZ5PfK5AxBm3uM
 qHkkJJu2Xn6FjUOLqgmWwxG2zlvUq9Qh45EMnOcAHBFPWDmtqNY7Fy/1XcmU7oPnv1el
 4QgCGsq1F35pXeztlyA19xjZ6Y1TqvShe+OxaP8d/LYc4K0NRLhhWXDISpscllcgwFKu
 Kh1f5VHzV8FYkRSrXpDeQPB5laoxQ05qXwlSKgnOSCotdlF8buBhK78nVIguutDBIRQH
 z7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XGs0cESKg54US3MieKzD9mjNvNrBnzNfShHqBVMa7GU=;
 b=WjSgDrtU8KEaVA4SS5UGc+6wAPeqBYmo8f9zFJnW/ik+7/+ZmgFs7jwxavRaGg7kPN
 UuYThUZZ7Ly6/XrgIE6533mWvJwmhOq/p5PXMIFeDQZfDMojAe9Y7lETH04c7Wn8dXLA
 UAu4ZWuV2VQq2RpBEzWxZpwXqgn1sH4HuLqjiwPaFpfsSyGsyA0BsXinybgXzNPFv2z2
 IKz9+//szWWJB3N3dlNJeNNXctmv+YYmJ3P1EsUOACp8SvISLxexhv5ygtqfngA9hkBY
 lUO3jTFuf0XtZmHM20dy9Stmt9iy/HSDze7JI+OR+ky4AZKWu1k3z2UHOmehcblAaufn
 dUfw==
X-Gm-Message-State: AOAM533pMFSJimb7gFQXcFlmjxqZ0WTSPcuIaD54UZD4tNWrJRmH2qWw
 /u25q9utvWnuvozMix7NAek=
X-Google-Smtp-Source: ABdhPJy69wSuNWRmsdyQrU2UFCvu3UUw/nGMBaF5DFe4EAji3CuFxOpd9ogsQL7Q0oslNP3YaijanQ==
X-Received: by 2002:a17:902:b185:b029:e6:6d17:6ea with SMTP id
 s5-20020a170902b185b02900e66d1706eamr16281739plr.40.1615896269141; 
 Tue, 16 Mar 2021 05:04:29 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 00/12] net: Pad short frames for network backends
Date: Tue, 16 Mar 2021 20:04:08 +0800
Message-Id: <20210316120420.19658-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The minimum Ethernet frame length is 60 bytes. For short frames with
smaller length like ARP packets (only 42 bytes), on a real world NIC
it can choose either padding its length to the minimum required 60
bytes, or sending it out directly to the wire. Such behavior can be
hardcoded or controled by a register bit. Similarly on the receive
path, NICs can choose either dropping such short frames directly or
handing them over to software to handle.

On the other hand, for the network backends like SLiRP/TAP, they
don't expose a way to control the short frame behavior. As of today
they just send/receive data from/to the other end connected to them,
which means any sized packet is acceptable. So they can send and
receive short frames without any problem. It is observed that ARP
packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
these ARP packets to the other end which might be a NIC model that
does not allow short frames to pass through.

To provide better compatibility, for packets sent from QEMU network
backends like SLiRP/TAP, we change to pad short frames before sending
it out to the other end, if the other end does not forbid it via the
nc->do_not_pad flag. This ensures a backend as an Ethernet sender
does not violate the spec. But with this change, the behavior of
dropping short frames from SLiRP/TAP interfaces in the NIC model
cannot be emulated because it always receives a packet that is spec
complaint. The capability of sending short frames from NIC models is
still supported and short frames can still pass through SLiRP/TAP.

This series should be able to fix the issue as reported with some
NIC models before, that ARP requests get dropped, preventing the
guest from becoming visible on the network. It was workarounded in
these NIC models on the receive path, that when a short frame is
received, it is padded up to 60 bytes.

Changes in v4:
- change 'ethernet' to 'Ethernet'
- do not inline the helper
- check the padded buffer size to avoid buffer overflow
- squash slirp/tap commits into one

Changes in v3:
- use 'without' instead of 'sans'
- add a helper to pad short frames
- add a comment to 'do_not_pad'
- use the pad_short_frame() helper

Bin Meng (12):
  net: eth: Add a helper to pad a short Ethernet frame
  net: Add a 'do_not_pad" to NetClientState
  net: Pad short frames to minimum size before sending from SLiRP/TAP
  hw/net: virtio-net: Initialize nc->do_not_pad to true
  hw/net: e1000: Remove the logic of padding short frames in the receive
    path
  hw/net: vmxnet3: Remove the logic of padding short frames in the
    receive path
  hw/net: i82596: Remove the logic of padding short frames in the
    receive path
  hw/net: ne2000: Remove the logic of padding short frames in the
    receive path
  hw/net: pcnet: Remove the logic of padding short frames in the receive
    path
  hw/net: rtl8139: Remove the logic of padding short frames in the
    receive path
  hw/net: sungem: Remove the logic of padding short frames in the
    receive path
  hw/net: sunhme: Remove the logic of padding short frames in the
    receive path

 include/net/eth.h   | 17 +++++++++++++++++
 include/net/net.h   |  1 +
 hw/net/e1000.c      | 11 +----------
 hw/net/i82596.c     | 18 ------------------
 hw/net/ne2000.c     | 12 ------------
 hw/net/pcnet.c      |  9 ---------
 hw/net/rtl8139.c    | 12 ------------
 hw/net/sungem.c     | 14 --------------
 hw/net/sunhme.c     | 11 -----------
 hw/net/virtio-net.c |  4 ++++
 hw/net/vmxnet3.c    | 10 ----------
 net/eth.c           | 17 +++++++++++++++++
 net/slirp.c         | 10 ++++++++++
 net/tap-win32.c     | 10 ++++++++++
 net/tap.c           | 10 ++++++++++
 15 files changed, 70 insertions(+), 96 deletions(-)

-- 
2.25.1


