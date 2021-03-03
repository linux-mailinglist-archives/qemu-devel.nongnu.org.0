Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA432B61D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:23:16 +0100 (CET)
Received: from localhost ([::1]:38494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNit-0005ZO-CF
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhf-0004ZK-Uq
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:00 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhe-00019a-C3
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:21:59 -0500
Received: by mail-ej1-x631.google.com with SMTP id bm21so21950445ejb.4
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AdwKcsQOtYhn8C1H1H0Ug50/Ck6i9sPew0DK4/B5TEk=;
 b=OrW+TBfdLR0xawpMTS53EiQNg06sy0PGCXKmCkr8b9+gC8usrVwUIswFtoxYSEALQG
 lwCt8/JZSB2nljrgRj9gm4Z8MvlMeYToiQDIL6fGvEUt13+U82o0ixPlS59Uxjtq5ASD
 oYh8YSQw6gG1qEf5jhx4hJPNz28QQcVR+5RM2SVThxtp2GNvagOkWqENd2y1A/fQaTh/
 GQF1Z3fKOYj56pfWodMr5a2RBiloeXsIOrbYflRUn5r9T1MB7F16qq7ymNkBxKGEM5Hd
 693MuVaAWRCrMIrZHH7xhtEywwEriBIphSU71NaXI8WyenolN3V8Cb+G04hLg8KuDUIA
 E8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AdwKcsQOtYhn8C1H1H0Ug50/Ck6i9sPew0DK4/B5TEk=;
 b=GuHfCvDuspcsKuWbu/2V65+flHOcuhgXdM/w/JSiBxV0wbpALx3bXF63kK//C0TSa/
 M58STeUtI01MmP89GvlZFJkjuRMneBY5zPX895yg2Np6Ftn3b4DFeE5XbaGqOShcHV+4
 G7Be60bsXy1poc+Hk6b9OWrLlqsBNorEbt0z4yrMxfInu0Kt7BVD03xNw5sQa8Z6cqvy
 Nl2AZu/11Bo0sYYAoHhr1bxTxeb9idK1udwjVphqyuEDRwYfkw9Kh/9NqFMc344yNU6N
 OZiuYqWsusubylykNpssM038wDiw8iNHeEs8QPPlF5YLByazXNOjrnDIzZnIX/bCffXD
 MQyg==
X-Gm-Message-State: AOAM531eOFP+DXVJEjKE8eDhvgpQVKJ/uw/q+KVJfOuFtRTxoIFX1j6x
 +mU9bIAF390rTKPkbKgY5bc=
X-Google-Smtp-Source: ABdhPJz+cYOvG7CaiG1MnD0py7eAkiSL58F/TtTh3gHyFJH+TPHvNuRSHvGkRx2rzNH2o7uKjtPWRA==
X-Received: by 2002:a17:907:7692:: with SMTP id
 jv18mr9641685ejc.475.1614763316850; 
 Wed, 03 Mar 2021 01:21:56 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id i6sm16614865ejz.95.2021.03.03.01.21.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 01:21:56 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/9] net: Handle short frames for SLiRP/TAP interfaces
Date: Wed,  3 Mar 2021 17:21:37 +0800
Message-Id: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>


The minimum Ethernet frame length is 60 bytes. For short frames with
smaller length like ARP packets (only 42 bytes), on a real world NIC
it can choose either padding its length to the minimum required 60
bytes, or sending it out directly to the wire. Such behavior can be
hardcoded or controled by a register bit. Similarly on the receive
path, NICs can choose either dropping such short frames directly or
handing them over to software to handle.

On the other hand, for the network backends SLiRP/TAP, they don't
expose a way to control the short frame behavior. As of today they
just send/receive data from/to the other end connected to them,
which means any sized packet is acceptable. So they can send and
receive short frames without any problem. It is observed that ARP
packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
these ARP packets to the other end which might be a NIC model that
does not allow short frames to pass through.

To provide better compatibility, for packets sent from SLiRP/TAP, we
change to pad short frames before sending it out to the other end.
This ensures SLiRP/TAP as an Ethernet sender do not violate the spec.
But with this change, the behavior of dropping short frames in the
NIC model cannot be emulated because it always receives a packet that
is spec complaint. The capability of sending short frames from NIC
models are still supported and short frames can still pass through
SLiRP/TAP interfaces.

This commit should be able to fix the issue as reported with some
NIC models before, that ARP requests get dropped, preventing the
guest from becoming visible on the network. It was workarounded in
these NIC models on the receive path, that when a short frame is
received, it is padded up to 60 bytes.

Changes in v2:
- only pad short frames for SLiRP/TAP interfaces

Bin Meng (9):
  net: Pad short frames to minimum size before send from SLiRP/TAP
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

 include/net/eth.h |  1 +
 hw/net/e1000.c    | 11 +----------
 hw/net/i82596.c   | 18 ------------------
 hw/net/ne2000.c   | 12 ------------
 hw/net/pcnet.c    |  9 ---------
 hw/net/rtl8139.c  | 12 ------------
 hw/net/sungem.c   | 14 --------------
 hw/net/sunhme.c   | 11 -----------
 hw/net/vmxnet3.c  | 10 ----------
 net/net.c         | 12 ++++++++++++
 10 files changed, 14 insertions(+), 96 deletions(-)

-- 
2.7.4


