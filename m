Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1842343A4F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 08:11:19 +0100 (CET)
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOEid-0005kW-0a
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 03:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOEhP-0005I2-87
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 03:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOEgU-00016W-6C
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 03:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616396943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4HoyIeXQkO4fMBpuUrAY3r0iVeOu+VPJX/6LJG3tG60=;
 b=Cwfnf+fMgliGWAB1IplSde/TPmzpvzA6T/FYp73nGaOIZZAfV5qjQVeU7xwRdW8Jld6MGf
 qfcneCeBC9Wl87/BvIzYuLN/i+DRqnCdEy99C/TLu3bceuvBcN+D3DOVH9KPPs9HBUMO0P
 nri7ArzghEARhoYQfvJPcE3w8SwbdWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-Bt6X1QyVNranxJjXN8xusw-1; Mon, 22 Mar 2021 03:09:01 -0400
X-MC-Unique: Bt6X1QyVNranxJjXN8xusw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E72EE107ACCA
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:09:00 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-188.pek2.redhat.com
 [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1537863622
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:08:59 +0000 (UTC)
Subject: Re: [PATCH v5 00/12] net: Pad short frames for network backends
To: qemu-devel@nongnu.org
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <859cd26a-feb2-ed62-98d5-764841a468cf@redhat.com>
Date: Mon, 22 Mar 2021 15:08:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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


在 2021/3/17 下午2:26, Bin Meng 写道:
> The minimum Ethernet frame length is 60 bytes. For short frames with
> smaller length like ARP packets (only 42 bytes), on a real world NIC
> it can choose either padding its length to the minimum required 60
> bytes, or sending it out directly to the wire. Such behavior can be
> hardcoded or controled by a register bit. Similarly on the receive
> path, NICs can choose either dropping such short frames directly or
> handing them over to software to handle.
>
> On the other hand, for the network backends like SLiRP/TAP, they
> don't expose a way to control the short frame behavior. As of today
> they just send/receive data from/to the other end connected to them,
> which means any sized packet is acceptable. So they can send and
> receive short frames without any problem. It is observed that ARP
> packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> these ARP packets to the other end which might be a NIC model that
> does not allow short frames to pass through.
>
> To provide better compatibility, for packets sent from QEMU network
> backends like SLiRP/TAP, we change to pad short frames before sending
> it out to the other end, if the other end does not forbid it via the
> nc->do_not_pad flag. This ensures a backend as an Ethernet sender
> does not violate the spec. But with this change, the behavior of
> dropping short frames from SLiRP/TAP interfaces in the NIC model
> cannot be emulated because it always receives a packet that is spec
> complaint. The capability of sending short frames from NIC models is
> still supported and short frames can still pass through SLiRP/TAP.
>
> This series should be able to fix the issue as reported with some
> NIC models before, that ARP requests get dropped, preventing the
> guest from becoming visible on the network. It was workarounded in
> these NIC models on the receive path, that when a short frame is
> received, it is padded up to 60 bytes.
>
> Changes in v5:
> - minor update on commit message
> - update the eth_pad_short_frame() comment
>
> Changes in v4:
> - change 'ethernet' to 'Ethernet'
> - do not inline the helper
> - check the padded buffer size to avoid buffer overflow
> - squash slirp/tap commits into one
>
> Changes in v3:
> - use 'without' instead of 'sans'
> - add a helper to pad short frames
> - add a comment to 'do_not_pad'
> - use the pad_short_frame() helper
>
> Bin Meng (12):
>    net: eth: Add a helper to pad a short Ethernet frame
>    net: Add a 'do_not_pad" to NetClientState
>    net: Pad short frames to minimum size before sending from SLiRP/TAP
>    hw/net: virtio-net: Initialize nc->do_not_pad to true
>    hw/net: e1000: Remove the logic of padding short frames in the receive
>      path
>    hw/net: vmxnet3: Remove the logic of padding short frames in the
>      receive path
>    hw/net: i82596: Remove the logic of padding short frames in the
>      receive path
>    hw/net: ne2000: Remove the logic of padding short frames in the
>      receive path
>    hw/net: pcnet: Remove the logic of padding short frames in the receive
>      path
>    hw/net: rtl8139: Remove the logic of padding short frames in the
>      receive path
>    hw/net: sungem: Remove the logic of padding short frames in the
>      receive path
>    hw/net: sunhme: Remove the logic of padding short frames in the
>      receive path
>
>   hw/net/e1000.c      | 11 +----------
>   hw/net/i82596.c     | 18 ------------------
>   hw/net/ne2000.c     | 12 ------------
>   hw/net/pcnet.c      |  9 ---------
>   hw/net/rtl8139.c    | 12 ------------
>   hw/net/sungem.c     | 14 --------------
>   hw/net/sunhme.c     | 11 -----------
>   hw/net/virtio-net.c |  4 ++++
>   hw/net/vmxnet3.c    | 10 ----------
>   include/net/eth.h   | 17 +++++++++++++++++
>   include/net/net.h   |  1 +
>   net/eth.c           | 17 +++++++++++++++++
>   net/slirp.c         | 10 ++++++++++
>   net/tap-win32.c     | 10 ++++++++++
>   net/tap.c           | 10 ++++++++++
>   15 files changed, 70 insertions(+), 96 deletions(-)


I've queued patch 1-4 for 6.0 and the reset for 6.1.

Thanks


>


