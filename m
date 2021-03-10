Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236793339EF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:26:53 +0100 (CET)
Received: from localhost ([::1]:50740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw3I-0006yc-5S
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvp8-0000p5-6l
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:14 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvp4-0006kS-2t
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:13 -0500
Received: by mail-ej1-x636.google.com with SMTP id r17so37499832ejy.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0QCCBJaEXUVn3N/pVsDnKfdh8WE+LKtRP9bM2lE2mKk=;
 b=ZS6OYKXT2FLtkuHWA+MAFbDQlzvNtclKF97hOat107LOpuftFpxILvPexZNw3gvQ6z
 vGgEXdRihhr2v1oGjOmYg1OufRDE0Pb1mZ9q8JQDM9AESEy4+UQzyvqjnvXHoy3I0vb6
 c73tmodEVfGrOya2160Gx/Cq/7ets07zCt2HjsBt5SU60WColdwWmTSdz7bfowvZOwTJ
 n0kQaPA4Iz2Drc8SDBRU1an6bd52hkVsBfiIHL/C1oURgwdlY0LR4/D3mJiRC6v1khVE
 0Lxxq6hNOPuiaqDkhO/TPbTeywU+vFWs5i32kTllqjWikA7HNupiSvwGeUYynfceoV+Q
 +Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0QCCBJaEXUVn3N/pVsDnKfdh8WE+LKtRP9bM2lE2mKk=;
 b=fhXuAtKyyqZEjiOnMVAwsiBwiQzY8vSvUn9PWW1es6IW506Kl05WsG+tlZqdDwQcn6
 npEknBEO3lp2p26QDOXd2AajHAJkHcEmXzHFyAgFEDRJlH7/81RVRUSQgYeitvicnZLE
 3WXSwsArT8GzGKVrlIfEaWk9wUpD+6b2l6TLfSrtYmRHog6ClRG/98lJIKgj6QiFzBIz
 2LUgEERpcOxwxW+kyyjrPs1Lux2XUOckXN+0DHd3WQZxeGPQdQcB52zwUaKX+HilRzW5
 23ksPnJlYq2rY0nhKKu2QnVSbiQfekeax458Oy1SQ2szuPHauEXtdvYG+DkNxGGEkO8i
 pTNg==
X-Gm-Message-State: AOAM531c5Y7BV5TFOqUjfSLU3aWw4jZdZfSiCLBHdZMeAjE6arAjJ5DM
 Y+gB7Oeu7jcFDbwq4b1HMHo=
X-Google-Smtp-Source: ABdhPJzwdokbrIDg7zoYyRhrdldeOOz6Zu/3+PjYm7cgxZZBdOsBhbznOgN+wnHj9s/hzNnKkg7jPA==
X-Received: by 2002:a17:906:1352:: with SMTP id
 x18mr2734235ejb.545.1615371128479; 
 Wed, 10 Mar 2021 02:12:08 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n26sm5966864eds.22.2021.03.10.02.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:12:08 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH 00/10] net: Pad short frames for network backends
Date: Wed, 10 Mar 2021 18:11:47 +0800
Message-Id: <20210310101157.15136-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
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


Bin Meng (9):
  net: Pad short frames to minimum size before send
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

Philippe Mathieu-Daudé (1):
  net: Use 'struct iovec' in qemu_send_packet_async_with_flags()

 hw/net/e1000.c    | 11 +----------
 hw/net/i82596.c   | 18 ------------------
 hw/net/ne2000.c   | 12 ------------
 hw/net/pcnet.c    |  9 ---------
 hw/net/rtl8139.c  | 12 ------------
 hw/net/sungem.c   | 14 --------------
 hw/net/sunhme.c   | 11 -----------
 hw/net/vmxnet3.c  | 10 ----------
 include/net/eth.h |  1 +
 net/net.c         | 44 +++++++++++++++++++++++---------------------
 10 files changed, 25 insertions(+), 117 deletions(-)

-- 
2.17.1


