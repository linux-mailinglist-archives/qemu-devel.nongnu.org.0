Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2A6112DA4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 15:42:56 +0100 (CET)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icVrj-0007rV-LB
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 09:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1icVqi-0007Jl-TQ
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 09:41:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1icVqh-0006cQ-SY
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 09:41:52 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31176
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1icVqh-0006cF-P9
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 09:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575470510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJEIQPrEsxkvvNG9Qd4bPxGqYZkE6elT9GXs9ePojJc=;
 b=QnAlIA3f30lOmwBXp4cs+Esr0C4DILkYM9bsEgqPJH42Oy+LlxG0WKf+1bqoXA6gvJGUiz
 MtAWtyY7ma5pnCFu8TsXqvOUm3c+ms55iSAKmARMqpAaS7dTBXXzaDlAdR+d2uQkEzBo1V
 5A2lAxdZM/SI7/s138A4NCdN3Xr0YHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-Jng4xPMqPkW0Yfgf2VPglQ-1; Wed, 04 Dec 2019 09:41:48 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19E55102CE26;
 Wed,  4 Dec 2019 14:41:46 +0000 (UTC)
Received: from [10.3.116.171] (ovpn-116-171.phx2.redhat.com [10.3.116.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3120E5D9C5;
 Wed,  4 Dec 2019 14:41:38 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] virtio-serial-bus: fix memory leak while attach
 virtio-serial-bus
To: pannengyuan@huawei.com, mst@redhat.com
References: <1575444716-17632-1-git-send-email-pannengyuan@huawei.com>
 <1575444716-17632-3-git-send-email-pannengyuan@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b810d699-967c-2f22-4659-f1a2d906b1c8@redhat.com>
Date: Wed, 4 Dec 2019 08:41:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1575444716-17632-3-git-send-email-pannengyuan@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Jng4xPMqPkW0Yfgf2VPglQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: liyiting@huawei.com, Laurent Vivier <lvivier@redhat.com>,
 zhang.zhanghailiang@huawei.com, kuhn.chenqun@huawei.com,
 Amit Shah <amit@kernel.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/19 1:31 AM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
>=20
> ivqs/ovqs/c_ivq/c_ovq is forgot to cleanup in

s/is //

> virtio_serial_device_unrealize, the memory leak stack is as bellow:

below

>=20
> Direct leak of 1290240 byte(s) in 180 object(s) allocated from:
>      #0 0x7fc9bfc27560 in calloc (/usr/lib64/libasan.so.3+0xc7560)
>      #1 0x7fc9bed6f015 in g_malloc0 (/usr/lib64/libglib-2.0.so.0+0x50015)
>      #2 0x5650e02b83e7 in virtio_add_queue hw/virtio/virtio.c:2327
>      #3 0x5650e02847b5 in virtio_serial_device_realize hw/char/virtio-ser=
ial-bus.c:1089
>      #4 0x5650e02b56a7 in virtio_device_realize hw/virtio/virtio.c:3504
>      #5 0x5650e03bf031 in device_set_realized hw/core/qdev.c:876
>      #6 0x5650e0531efd in property_set_bool qom/object.c:2080
>      #7 0x5650e053650e in object_property_set_qobject qom/qom-qobject.c:2=
6
>      #8 0x5650e0533e14 in object_property_set_bool qom/object.c:1338
>      #9 0x5650e04c0e37 in virtio_pci_realize hw/virtio/virtio-pci.c:1801
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Amit Shah <amit@kernel.org>
> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


