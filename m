Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B8E32BA24
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:14:56 +0100 (CET)
Received: from localhost ([::1]:34422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWxT-0001VR-H7
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWv0-0008GU-Sq
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWuu-0006kn-Ev
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614798732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B888mk4y7nHhhctmzQDEge9f0rSf6xoPZfvoKEVBOtg=;
 b=g9a0jMJ7x3RnUksz6RL3Do9RgetXqCqnFGq2DpSk3m1OnAJxKy2aDSC8i/5RcyGskHHYjF
 dm4YAS7BIeNQLVWTAvn/G290KYPVl3iMk+zuVepb0aNxNMyAXRhX1NnohEb0/AWgIjalNr
 k8NMsluipngSqfqAX7EglbGpcSD+JNU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-jEc4fiU5OPWqOTQf6QaqXg-1; Wed, 03 Mar 2021 14:12:09 -0500
X-MC-Unique: jEc4fiU5OPWqOTQf6QaqXg-1
Received: by mail-wr1-f71.google.com with SMTP id s10so2280419wre.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 11:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/L4XY7rNKH2iVnh0ifWMVd931CCGBlEtONmnhPpCuo=;
 b=JkGlaj+a7UARQXmwjj81p+U0pbU2OYfD9bg9hJj7Y1rqgZuh4d3u6/v5M4izu2g2xw
 maHl9DIFYy3QNb5zXuJeA9roX9c9jgcNhHvtRU/ICq2OWFP0pFlPBC7geT4t04jubSCH
 PrE6EEddgh+i47J0EOuDkzAIqmJRtTNbpKdwTz+fJQmlMG9iuZ/su5XDGKJGj0m3HNfm
 865TifF2L+66devHS9vvqxuaUWUFizo3NyZgk1Y0jBUI5K7h5wlawtMep9J4yaXy2wzb
 MftN0RI64/fSG0m27ayw3w/H9yJ4FKEZqkFvciteYLOorPwhVxcbb1Q1KAEDsILndFv8
 tcCg==
X-Gm-Message-State: AOAM533KOK2l4uDDpazSvCmdQDrRYF35cc+fklV2PedBj9IfYv66Kz5t
 jJnXdBZKbsQ8TQ6kWYHYKGcr5/UcLlOG2XQB0HCbUBz2HQJWSt2QA9aAX21yN4FEjg7CPMNwQFK
 J5e7Wh/QHA1KIcz4+uWu+xShRqjLHN9rcVz0DwvJQERICWNyr8QmBkTnOaCQzFdUU
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr88264wrw.323.1614798727656;
 Wed, 03 Mar 2021 11:12:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8vmBGoEsHWuF4TRi0GgKgJZbQVY8ltBHXCl0neb1BGcOo2W69HvVju4AosS9sxwwAurd6/Q==
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr88240wrw.323.1614798727456;
 Wed, 03 Mar 2021 11:12:07 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a6sm8827465wmm.0.2021.03.03.11.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 11:12:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 00/10] net: Handle short frames for SLiRP/TAP interfaces
Date: Wed,  3 Mar 2021 20:11:55 +0100
Message-Id: <20210303191205.1656980-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is Bin's series but using iovec structure in 1st patch=0D
for zero copy.=0D
=0D
Bin's cover:=0D
=0D
The minimum Ethernet frame length is 60 bytes. For short frames with=0D
smaller length like ARP packets (only 42 bytes), on a real world NIC=0D
it can choose either padding its length to the minimum required 60=0D
bytes, or sending it out directly to the wire. Such behavior can be=0D
hardcoded or controled by a register bit. Similarly on the receive=0D
path, NICs can choose either dropping such short frames directly or=0D
handing them over to software to handle.=0D
=0D
On the other hand, for the network backends SLiRP/TAP, they don't=0D
expose a way to control the short frame behavior. As of today they=0D
just send/receive data from/to the other end connected to them,=0D
which means any sized packet is acceptable. So they can send and=0D
receive short frames without any problem. It is observed that ARP=0D
packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send=0D
these ARP packets to the other end which might be a NIC model that=0D
does not allow short frames to pass through.=0D
=0D
To provide better compatibility, for packets sent from SLiRP/TAP, we=0D
change to pad short frames before sending it out to the other end.=0D
This ensures SLiRP/TAP as an Ethernet sender do not violate the spec.=0D
But with this change, the behavior of dropping short frames in the=0D
NIC model cannot be emulated because it always receives a packet that=0D
is spec complaint. The capability of sending short frames from NIC=0D
models are still supported and short frames can still pass through=0D
SLiRP/TAP interfaces.=0D
=0D
This commit should be able to fix the issue as reported with some=0D
NIC models before, that ARP requests get dropped, preventing the=0D
guest from becoming visible on the network. It was workarounded in=0D
these NIC models on the receive path, that when a short frame is=0D
received, it is padded up to 60 bytes.=0D
=0D
Bin Meng (9):=0D
  net: Pad short frames to minimum size before send from SLiRP/TAP=0D
  hw/net: e1000: Remove the logic of padding short frames in the receive=0D
    path=0D
  hw/net: vmxnet3: Remove the logic of padding short frames in the=0D
    receive path=0D
  hw/net: i82596: Remove the logic of padding short frames in the=0D
    receive path=0D
  hw/net: ne2000: Remove the logic of padding short frames in the=0D
    receive path=0D
  hw/net: pcnet: Remove the logic of padding short frames in the receive=0D
    path=0D
  hw/net: rtl8139: Remove the logic of padding short frames in the=0D
    receive path=0D
  hw/net: sungem: Remove the logic of padding short frames in the=0D
    receive path=0D
  hw/net: sunhme: Remove the logic of padding short frames in the=0D
    receive path=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  net: Use 'struct iovec' in qemu_send_packet_async_with_flags()=0D
=0D
 include/net/eth.h |  1 +=0D
 hw/net/e1000.c    | 11 +----------=0D
 hw/net/i82596.c   | 18 ------------------=0D
 hw/net/ne2000.c   | 12 ------------=0D
 hw/net/pcnet.c    |  9 ---------=0D
 hw/net/rtl8139.c  | 12 ------------=0D
 hw/net/sungem.c   | 14 --------------=0D
 hw/net/sunhme.c   | 11 -----------=0D
 hw/net/vmxnet3.c  | 10 ----------=0D
 net/net.c         | 47 ++++++++++++++++++++++++++---------------------=0D
 10 files changed, 28 insertions(+), 117 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


