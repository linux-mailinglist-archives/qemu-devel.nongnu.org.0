Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D715536D090
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 04:33:29 +0200 (CEST)
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lba12-00047x-SA
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 22:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbZwn-0002aJ-AI
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 22:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbZwl-0003aW-P1
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 22:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619576943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7KhivdBmDMmdOYcs9IBlyaRq3JFBLAaHTKqizJFGfI=;
 b=ej7f2ODYtmeqw/xTlDuXhq9WylpMP7LbKCOHTpmii1Mwql2UeovK/8O3+nwmlCKvopog2E
 83/76KSDN/EqCPSCo6M/oksDzg9WNNb8LGsQ8tiY4MhZL6rUxqxwdMUnupcrvfzv5RbIO6
 UkO1R6gOOw3Y+6ZXSXYZnZrI9KM66vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-cgQd7tGJOGKzYBWVR_pdLA-1; Tue, 27 Apr 2021 22:29:00 -0400
X-MC-Unique: cgQd7tGJOGKzYBWVR_pdLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B298107ACC7
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 02:28:59 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-131.pek2.redhat.com
 [10.72.12.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E104F60C05;
 Wed, 28 Apr 2021 02:28:54 +0000 (UTC)
Subject: Re: [PATCH] virtio-net: failover: add missing
 remove_migration_state_change_notifier()
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210427135147.111218-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f43a7283-d1a6-6559-efc6-c0aa6c16a511@redhat.com>
Date: Wed, 28 Apr 2021 10:28:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427135147.111218-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/4/27 ÏÂÎç9:51, Laurent Vivier Ð´µÀ:
> In the failover case configuration, virtio_net_device_realize() uses an
> add_migration_state_change_notifier() to add a state notifier, but this
> notifier is not removed by the unrealize function when the virtio-net
> card is unplugged.
>
> If the card is unplugged and a migration is started, the notifier is
> called and as it is not valid anymore QEMU crashes.
>
> This patch fixes the problem by adding the
> remove_migration_state_change_notifier() in virtio_net_device_unrealize().
>
> The problem can be reproduced with:
>
>    $ qemu-system-x86_64 -enable-kvm -m 1g -M q35 \
>      -device pcie-root-port,slot=4,id=root1 \
>      -device pcie-root-port,slot=5,id=root2 \
>      -device virtio-net-pci,id=net1,mac=52:54:00:6f:55:cc,failover=on,bus=root1 \
>      -monitor stdio disk.qcow2
>    (qemu) device_del net1
>    (qemu) migrate "exec:gzip -c > STATEFILE.gz"
>
>    Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
>    0x0000000000000000 in ?? ()
>    (gdb) bt
>    #0  0x0000000000000000 in  ()
>    #1  0x0000555555d726d7 in notifier_list_notify (...)
>        at .../util/notify.c:39
>    #2  0x0000555555842c1a in migrate_fd_connect (...)
>        at .../migration/migration.c:3975
>    #3  0x0000555555950f7d in migration_channel_connect (...)
>        error@entry=0x0) at .../migration/channel.c:107
>    #4  0x0000555555910922 in exec_start_outgoing_migration (...)
>        at .../migration/exec.c:42
>
> Reported-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>

This should be added to stable I guess.

Thanks


> ---
>   hw/net/virtio-net.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 66b9ff451185..914051feb75b 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3373,6 +3373,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
>   
>       if (n->failover) {
>           device_listener_unregister(&n->primary_listener);
> +        remove_migration_state_change_notifier(&n->migration_state);
>       }
>   
>       max_queues = n->multiqueue ? n->max_queues : 1;


