Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B9B10E4A0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 03:49:15 +0100 (CET)
Received: from localhost ([::1]:58226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibbly-0007dj-QL
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 21:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33893)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1ibbkL-0006vX-CK
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 21:47:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1ibbkK-0002bM-CV
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 21:47:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33785
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1ibbkK-0002b7-8p
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 21:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575254851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f9PFUHLnvxAQORAc944/RufRm0MnqHYJmLKKFeYaaEM=;
 b=b2kDP8hTUgbos3Zm/LBMsz0OO+8HJ4FYBR4ciLxxrQICxiCY7cywCH5ab7G8bwvUxC2X0h
 Y/wKGPb1G0oMQ+LKK0j2yzreQYxLwpBRSYx3CfCIpbPa1uM00YiZPL+VTn0caQXCN9GS+Q
 8PbYdPRm0rrnvtmtDvPeZKpP+0KZ5H8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-FcDTLP95MQ6LTTv2HvT7zQ-1; Sun, 01 Dec 2019 21:47:28 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9493800D4C;
 Mon,  2 Dec 2019 02:47:25 +0000 (UTC)
Received: from [10.72.12.226] (ovpn-12-226.pek2.redhat.com [10.72.12.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5139D6764A;
 Mon,  2 Dec 2019 02:47:17 +0000 (UTC)
Subject: Re: [RFC net-next 07/18] tun: set offloaded xdp program
To: David Ahern <dsahern@gmail.com>,
 Prashant Bhole <prashantbhole.linux@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20191126100744.5083-1-prashantbhole.linux@gmail.com>
 <20191126100744.5083-8-prashantbhole.linux@gmail.com>
 <3ff23a11-c979-32ed-b55d-9213c2c64bc4@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8d575940-ba31-8780-ae4d-6edbe1b2b15a@redhat.com>
Date: Mon, 2 Dec 2019 10:47:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3ff23a11-c979-32ed-b55d-9213c2c64bc4@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: FcDTLP95MQ6LTTv2HvT7zQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/12/2 =E4=B8=8A=E5=8D=8812:45, David Ahern wrote:
> On 11/26/19 4:07 AM, Prashant Bhole wrote:
>> From: Jason Wang <jasowang@redhat.com>
>>
>> This patch introduces an ioctl way to set an offloaded XDP program
>> to tun driver. This ioctl will be used by qemu to offload XDP program
>> from virtio_net in the guest.
>>
> Seems like you need to set / reset the SOCK_XDP flag on tfile->sk since
> this is an XDP program.
>
> Also, why not add this program using netlink instead of ioctl? e.g., as
> part of a generic XDP in the egress path like I am looking into for the
> host side.


Maybe both, otherwise, qemu may need netlink as a dependency.

Thanks


>


