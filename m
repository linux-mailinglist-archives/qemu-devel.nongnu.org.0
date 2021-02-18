Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DE531E617
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 06:59:54 +0100 (CET)
Received: from localhost ([::1]:50356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcLx-0000bd-Db
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 00:59:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lCcKV-0007ca-8t
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:58:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lCcKI-0006dS-VD
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613627889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dDQYN7LvMzlCvh4PXN73bSQLlxVGWIB7yxLeizI82Q=;
 b=JWmCPrkhLOIOtwBXZrbLLDzLJZ2k83G6zrn+wmmFIcTISguHcoGWhpDC4+tIun3FjlNAP4
 jdAn7JvMzwa3rB28vzfTykP6TP/Pv/vBFiKaTZ2zKJl+akT4RdY2vr0s8SLr45rdV6r9C4
 fwlbdYsRyT78oXvV3d695kjlwYbUPsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-anPgYIc6PMm6F_dG1n4NFw-1; Thu, 18 Feb 2021 00:58:06 -0500
X-MC-Unique: anPgYIc6PMm6F_dG1n4NFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3BC1BBEE2;
 Thu, 18 Feb 2021 05:58:04 +0000 (UTC)
Received: from [10.72.13.28] (ovpn-13-28.pek2.redhat.com [10.72.13.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 083F96267A;
 Thu, 18 Feb 2021 05:57:55 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] virtio-net: add missing object_unref()
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210210174518.2493928-1-lvivier@redhat.com>
 <20210210174518.2493928-3-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <27e955d5-c413-7cf8-3bea-ce6385b4a125@redhat.com>
Date: Thu, 18 Feb 2021 13:57:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210174518.2493928-3-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 quintela@redhat.com, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/11 上午1:45, Laurent Vivier wrote:
> failover_add_primary() calls qdev_device_add() and doesn't unref
> the device. Because of that, when the device is unplugged a reference
> is remaining and prevents the cleanup of the object.
>
> This prevents to be able to plugin back the failover primary device,
> with errors like:
>
>    (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
>    (qemu) device_del hostdev0
>
> We can check with "info qtree" and "info pci" that the device has been removed, and then:
>
>    (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev1,bus=root.3,failover_pair_id=net0
>    Error: vfio 0000:41:00.0: device is already attached
>    (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
>    qemu-kvm: Duplicate ID 'hostdev0' for device
>
> Fixes: 21e8709b29cd ("failover: Remove primary_dev member")
> Cc: quintela@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Jens Freimann <jfreimann@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/virtio-net.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 5150f295e8c5..1c5af08dc556 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -862,6 +862,8 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
>           dev = qdev_device_add(opts, &err);
>           if (err) {
>               qemu_opts_del(opts);
> +        } else {
> +            object_unref(OBJECT(dev));
>           }
>       } else {
>           error_setg(errp, "Primary device not found");


