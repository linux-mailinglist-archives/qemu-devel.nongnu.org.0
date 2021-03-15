Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C646733ACE5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 08:59:35 +0100 (CET)
Received: from localhost ([::1]:37592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLi8U-0001Hf-JX
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 03:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6Z-00084x-Ly
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:36 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6W-0004EZ-2B
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:35 -0400
Received: by mail-pf1-x429.google.com with SMTP id 18so6055656pfo.6
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3kRzKM79K00+pQsZHekZLMwyUh+vCtIFFe6KazY4ISQ=;
 b=k7xhD7RlEtVpgPVoiOXkQQ5zxtwW42lTTRQrjF/G7RG3J6jOH27+14k1QzH6X7DEi1
 pO+klVynZr5W+2jMo0KCXiBTDmzlPMEVPr4fBd58KDiJJMOMSw9hMWAWcYPwA9Ay+kgO
 0wO0CiEnVAoj5ArrfAIyN7/6l8GG0pSCHVWbUsy7mnkXFBvslntul66uUQE0PzLdIP2f
 /KN6KwgpcC5lz6AinQkmjH8MWDZ4dYq9xrxtcycZPFm9rFSMO79nW9hjtnXwoNtrwMpP
 fl1svJCuI/NlAq7w4+5DC09qWiZk71vCR1kK/gJxpbI/6+pSbK1KIK81EP6EAu2hRKbp
 mTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3kRzKM79K00+pQsZHekZLMwyUh+vCtIFFe6KazY4ISQ=;
 b=Q693h5W05MVbaKxyefPnpUHfIXAOj+S/FVDkHb7CUR0Majnsn2VkaUDplNIbA78zij
 QkCtUO+fNkSRp6Ma9tYwzwWQIh63BV2mdFHRR6iveapkLovp+Qy7zif/9pYsKhXmSTla
 5oYj8kFdwpqDmW7p6mQGAve6SbsYZ/FeNTQWAOTcXYR1ZNXgslNUsWiKdTGtQ7PPLAe/
 iJlmsslsBLPEX9WiYp7Ka++6bzIaEQkcXwB3ybnHAvbtCqVuSHGW/Ug5N8VB1m+7rTq8
 UzMXvm7jp69HWK1yVnlHK3d3Af+7880fJ50F/Wjxyme3WmXfSRZzxkeClzYV5UVRIMOK
 taVQ==
X-Gm-Message-State: AOAM532A711X3PrpZ2CPpy89+Lneu5Wjo0rvzBgwZMpNPL9GM13eMcdU
 x0pNRoGOLR0Uz8l6Bk/XuLk=
X-Google-Smtp-Source: ABdhPJyMrH0f/sx7PpViWibg9x5BmjOaDg6SEf3p0ihVRef3e9WY/A2wtbgq1zNcsclHe2o4x7aQqg==
X-Received: by 2002:a62:764c:0:b029:1ef:20d2:b44 with SMTP id
 r73-20020a62764c0000b02901ef20d20b44mr9032805pfc.45.1615795049525; 
 Mon, 15 Mar 2021 00:57:29 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 00/13] net: Pad short frames for network backends
Date: Mon, 15 Mar 2021 15:57:05 +0800
Message-Id: <20210315075718.5402-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x429.google.com
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
backends, we change to pad short frames before sending it out to the
other end. This ensures a backend as an Ethernet sender does not
violate the spec. But with this change, the behavior of dropping
short frames in the NIC model cannot be emulated because it always
receives a packet that is spec complaint. The capability of sending
short frames from NIC models cannot be supported as well.

This series should be able to fix the issue as reported with some
NIC models before, that ARP requests get dropped, preventing the
guest from becoming visible on the network. It was workarounded in
these NIC models on the receive path, that when a short frame is
received, it is padded up to 60 bytes.

Changes in v2:
- Do the padding in the slirp/tap codes, instead of net core
- Add a 'do_not_pad' flag to NetClientState to allow net clients to
  tell peer that no padding is needed, e.g.: virtio-net

Bin Meng (13):
  net: Add ETH_ZLEN define in eth.h
  net: Add a 'do_not_pad" to NetClientState
  net: slirp: Pad short frames to minimum size before send
  net: tap: Pad short frames to minimum size before send
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

 include/net/eth.h   |  1 +
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
 net/slirp.c         | 12 ++++++++++++
 net/tap-win32.c     | 12 ++++++++++++
 net/tap.c           | 12 ++++++++++++
 14 files changed, 43 insertions(+), 96 deletions(-)

-- 
2.25.1


