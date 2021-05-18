Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE23876EC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:49:59 +0200 (CEST)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixIU-0000cJ-II
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1liwfa-0003us-6R
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1liwfW-0008FH-WC
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eiSsSeErmC2hW7/fQln7xFrH8HTIiWLMvto+jzRQZgg=;
 b=L90aF0KyhqERkIPX3u3tDHW4p2iSgAZCGhse02KXx5dpC6oCoDhBEzsPig5s2ozJJZoCTX
 4lYIVVFua3maySnhXT196EqI/GQJ5913Hvcc1vKo04Kf31Por6mE2wJukB5Vw1FNT+Ngt2
 uB6YNci7HQXGdwMUiweGvoGcKT0vy4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-x6-khlDkPvGu4q2rrTGgtg-1; Tue, 18 May 2021 06:09:40 -0400
X-MC-Unique: x6-khlDkPvGu4q2rrTGgtg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2C43802B78;
 Tue, 18 May 2021 10:09:38 +0000 (UTC)
Received: from [10.36.115.203] (ovpn-115-203.ams2.redhat.com [10.36.115.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 344C95C582;
 Tue, 18 May 2021 10:09:38 +0000 (UTC)
Subject: Re: [PULL 09/10] virtio-net: failover: add missing
 remove_migration_state_change_notifier()
To: Jason Wang <jasowang@redhat.com>
References: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
 <1620458319-5670-10-git-send-email-jasowang@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <93ca1ecd-8a0d-d1ef-ff2b-f411c200ac98@redhat.com>
Date: Tue, 18 May 2021 12:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1620458319-5670-10-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

do you plan to resend the PR?

Thanks,
Laurent

On 08/05/2021 09:18, Jason Wang wrote:
> From: Laurent Vivier <lvivier@redhat.com>
> 
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
>   $ qemu-system-x86_64 -enable-kvm -m 1g -M q35 \
>     -device pcie-root-port,slot=4,id=root1 \
>     -device pcie-root-port,slot=5,id=root2 \
>     -device virtio-net-pci,id=net1,mac=52:54:00:6f:55:cc,failover=on,bus=root1 \
>     -monitor stdio disk.qcow2
>   (qemu) device_del net1
>   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> 
>   Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
>   0x0000000000000000 in ?? ()
>   (gdb) bt
>   #0  0x0000000000000000 in  ()
>   #1  0x0000555555d726d7 in notifier_list_notify (...)
>       at .../util/notify.c:39
>   #2  0x0000555555842c1a in migrate_fd_connect (...)
>       at .../migration/migration.c:3975
>   #3  0x0000555555950f7d in migration_channel_connect (...)
>       error@entry=0x0) at .../migration/channel.c:107
>   #4  0x0000555555910922 in exec_start_outgoing_migration (...)
>       at .../migration/exec.c:42
> 
> Reported-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/virtio-net.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 7ed11a3..dc71aa8 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3480,6 +3480,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
>  
>      if (n->failover) {
>          device_listener_unregister(&n->primary_listener);
> +        remove_migration_state_change_notifier(&n->migration_state);
>      }
>  
>      max_queues = n->multiqueue ? n->max_queues : 1;
> 


