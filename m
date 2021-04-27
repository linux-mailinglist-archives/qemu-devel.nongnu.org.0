Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD3836BFFF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 09:18:35 +0200 (CEST)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbHzO-0006xw-T4
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 03:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbHxE-0005g4-4O
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:16:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbHxA-0007Uu-Rm
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619507776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLgsE7w2vfTrPNF5MdWWDLPxQZDkoWtkl/yzWbA775c=;
 b=RZWkRVrzWHbqCcO642/Uq+2xwS8wRwIpfB0XwqWkanFdY1bXYPR/e69v6ol+0J1Hki9VTG
 WLhkw0E4460Ny+rrIl8sL9e/wXFROBgtglyQXPIkWGCYlD91CE95KhFmYPHNGeNGIPU2yz
 BSVLvOTqIY6o/CDg7mLTU6shaHB3/Ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-fMW7hTPmOsqPuv0e5-xuog-1; Tue, 27 Apr 2021 03:16:13 -0400
X-MC-Unique: fMW7hTPmOsqPuv0e5-xuog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E124A1926DB2
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:16:12 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-153.pek2.redhat.com
 [10.72.13.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCA025C73F;
 Tue, 27 Apr 2021 07:15:59 +0000 (UTC)
Subject: Re: [PATCH v6 9/9] virtio-net: add peer_deleted check in
 virtio_net_handle_rx
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210427033951.29805-1-lulu@redhat.com>
 <20210427033951.29805-10-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <76309507-1092-d92f-17b2-a06d6c90ac7d@redhat.com>
Date: Tue, 27 Apr 2021 15:15:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427033951.29805-10-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/4/27 ÉÏÎç11:39, Cindy Lu Ð´µÀ:
> During the test, We found this fuction will continue running
> while the peer is deleted, this will case the crash. so add
> check for this.


Please describe how the issue is reproduced and why 
qemu_flush_queued_packets() is not a better place to fix that.

Thanks


>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/net/virtio-net.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 43b912453a..1be3f8e76f 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1403,7 +1403,9 @@ static void virtio_net_handle_rx(VirtIODevice *vdev, VirtQueue *vq)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
>       int queue_index = vq2q(virtio_get_queue_index(vq));
> -
> +    if (n->nic->peer_deleted) {
> +        return;
> +    }
>       qemu_flush_queued_packets(qemu_get_subqueue(n->nic, queue_index));
>   }
>   


