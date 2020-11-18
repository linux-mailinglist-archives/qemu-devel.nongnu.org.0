Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642912B7527
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 05:01:57 +0100 (CET)
Received: from localhost ([::1]:39344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfEfM-0005s9-5n
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 23:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kfEcg-0004uz-PN
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 22:59:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kfEcd-0000SJ-LE
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 22:59:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605671946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDrBUmvNadiDTByUwwh3E4C0rBYFFaDXeo1Avn7LKv0=;
 b=CGeFOEwZqUtFS4sSVyWbasbPJt8S/xsoI2Z7W9pWRKAboYWceJ5k2GdTxnOAIY0drbzLN8
 YVEfJEW05nZpwkIjA8VwcMKKSVO0M06Jyc6ZhzjIXMsEmGbojkkZwyZyL+SpKKGHaReHhY
 vTbdTu+pUopmLsCx+9Yzt+TKf8/pjfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-QxcvHM1_OTSVb7_0vGLtbg-1; Tue, 17 Nov 2020 22:59:04 -0500
X-MC-Unique: QxcvHM1_OTSVb7_0vGLtbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEABF10074D3;
 Wed, 18 Nov 2020 03:59:03 +0000 (UTC)
Received: from [10.72.13.172] (ovpn-13-172.pek2.redhat.com [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B73101759F;
 Wed, 18 Nov 2020 03:59:02 +0000 (UTC)
Subject: Re: [PATCH] virtio-net: purge queued rx packets on queue deletion
To: Yuri Benditovich <yuri.benditovich@daynix.com>, qemu-devel@nongnu.org
References: <20201112094653.20255-1-yuri.benditovich@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5d0d2522-43e4-e0c4-7667-12e723858be0@redhat.com>
Date: Wed, 18 Nov 2020 11:59:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112094653.20255-1-yuri.benditovich@daynix.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/12 下午5:46, Yuri Benditovich wrote:
> https://bugzilla.redhat.com/show_bug.cgi?id=1829272
> When deleting queue pair, purge pending RX packets if any.
> Example of problematic flow:
> 1. Bring up q35 VM with tap (vhost off) and virtio-net or e1000e
> 2. Run ping flood to the VM NIC ( 1 ms interval)
> 3. Hot unplug the NIC device (device_del)
>     During unplug process one or more packets come, the NIC
>     can't receive, tap disables read_poll
> 4. Hot plug the device (device_add) with the same netdev
> The tap stays with read_poll disabled and does not receive
> any packets anymore (tap_send never triggered)
>
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>


Applied.

Thanks


> ---
>   net/net.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/net/net.c b/net/net.c
> index 7a2a0fb5ac..a95b417300 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -411,10 +411,14 @@ void qemu_del_nic(NICState *nic)
>   
>       qemu_macaddr_set_free(&nic->conf->macaddr);
>   
> -    /* If this is a peer NIC and peer has already been deleted, free it now. */
> -    if (nic->peer_deleted) {
> -        for (i = 0; i < queues; i++) {
> -            qemu_free_net_client(qemu_get_subqueue(nic, i)->peer);
> +    for (i = 0; i < queues; i++) {
> +        NetClientState *nc = qemu_get_subqueue(nic, i);
> +        /* If this is a peer NIC and peer has already been deleted, free it now. */
> +        if (nic->peer_deleted) {
> +            qemu_free_net_client(nc->peer);
> +        } else if (nc->peer) {
> +            /* if there are RX packets pending, complete them */
> +            qemu_purge_queued_packets(nc->peer);
>           }
>       }
>   


