Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F0A2F73AA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 08:22:08 +0100 (CET)
Received: from localhost ([::1]:55776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0JQt-0002RO-J8
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 02:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l0JPg-0001tT-IH
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 02:20:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l0JPZ-0006vr-9G
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 02:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610695244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23Fh5cEWSU0P3EQtrJ+SxMg+N8n27ZKKV2+B8kGzpW4=;
 b=A3PYbuGy0mhwwDPJDNrp4udFCsz4pdrJwt9LKc3PH2ILZT3UEhlAe6dkDBs9yukh0WB9QQ
 XvGbG+bNzsbP6f5M7YNcciwhcwnBRTJ9dsopzozmadD/fM2oRfOuZGFZQbJTR//uqsyjWq
 JSeaxp3Z+3xBcqXb3x0REp9sodMRrig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-jxyvVTkKOwu7KxSYd9NKhw-1; Fri, 15 Jan 2021 02:20:42 -0500
X-MC-Unique: jxyvVTkKOwu7KxSYd9NKhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CD1C107ACF8;
 Fri, 15 Jan 2021 07:20:41 +0000 (UTC)
Received: from [10.72.13.19] (ovpn-13-19.pek2.redhat.com [10.72.13.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9708E60BF3;
 Fri, 15 Jan 2021 07:20:33 +0000 (UTC)
Subject: Re: [RFC PATCH v3 5/6] virtio-net: Added eBPF RSS to virtio-net.
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com
References: <20210114211612.387052-1-andrew@daynix.com>
 <20210114211612.387052-6-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <266f9040-542e-199e-1903-fb871ae3ad81@redhat.com>
Date: Fri, 15 Jan 2021 15:20:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114211612.387052-6-andrew@daynix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/15 上午5:16, Andrew Melnychenko wrote:
> From: Andrew <andrew@daynix.com>
>
> When RSS is enabled the device tries to load the eBPF program
> to select RX virtqueue in the TUN. If eBPF can be loaded
> the RSS will function also with vhost (works with kernel 5.8 and later).
> Software RSS is used as a fallback with vhost=off when eBPF can't be loaded
> or when hash population requested by the guest.
>
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>   hw/net/vhost_net.c             |   2 +
>   hw/net/virtio-net.c            | 125 +++++++++++++++++++++++++++++++--
>   include/hw/virtio/virtio-net.h |   4 ++
>   net/vhost-vdpa.c               |   2 +
>   4 files changed, 129 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 24d555e764..16124f99c3 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -71,6 +71,8 @@ static const int user_feature_bits[] = {
>       VIRTIO_NET_F_MTU,
>       VIRTIO_F_IOMMU_PLATFORM,
>       VIRTIO_F_RING_PACKED,
> +    VIRTIO_NET_F_RSS,
> +    VIRTIO_NET_F_HASH_REPORT,
>   
>       /* This bit implies RARP isn't sent by QEMU out of band */
>       VIRTIO_NET_F_GUEST_ANNOUNCE,
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 09ceb02c9d..37016fc73a 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -691,6 +691,19 @@ static void virtio_net_set_queues(VirtIONet *n)
>   
>   static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue);
>   
> +static uint64_t fix_ebpf_vhost_features(uint64_t features)
> +{
> +    /* If vhost=on & CONFIG_EBPF doesn't set - disable RSS feature */


I still think we should not clear feature silently. This may break 
migraiton if the feature is cleared on destination.


> +    uint64_t ret = features;
> +#ifndef CONFIG_EBPF
> +    virtio_clear_feature(&ret, VIRTIO_NET_F_RSS);
> +#endif
> +    /* for now, there is no solution for populating the hash from eBPF */
> +    virtio_clear_feature(&ret, VIRTIO_NET_F_HASH_REPORT);
> +
> +    return ret;
> +}
> +
>   static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>                                           Error **errp)
>   {
> @@ -725,9 +738,9 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>           return features;
>       }
>   
> -    virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
> -    virtio_clear_feature(&features, VIRTIO_NET_F_HASH_REPORT);
> -    features = vhost_net_get_features(get_vhost_net(nc->peer), features);
> +    features = fix_ebpf_vhost_features(
> +            vhost_net_get_features(get_vhost_net(nc->peer), features));
> +
>       vdev->backend_features = features;
>   
>       if (n->mtu_bypass_backend &&
> @@ -1151,12 +1164,79 @@ static int virtio_net_handle_announce(VirtIONet *n, uint8_t cmd,
>       }
>   }
>   
> +static void virtio_net_detach_epbf_rss(VirtIONet *n);
> +
>   static void virtio_net_disable_rss(VirtIONet *n)
>   {
>       if (n->rss_data.enabled) {
>           trace_virtio_net_rss_disable();
>       }
>       n->rss_data.enabled = false;
> +
> +    virtio_net_detach_epbf_rss(n);
> +}
> +
> +static bool virtio_net_attach_ebpf_to_backend(NICState *nic, int prog_fd)
> +{
> +    NetClientState *nc = qemu_get_peer(qemu_get_queue(nic), 0);
> +    if (nc == NULL || nc->info->set_steering_ebpf == NULL) {
> +        return false;
> +    }
> +
> +    return nc->info->set_steering_ebpf(nc, prog_fd);
> +}
> +
> +static void rss_data_to_rss_config(struct VirtioNetRssData *data,
> +                                   struct EBPFRSSConfig *config)
> +{
> +    config->redirect = data->redirect;
> +    config->populate_hash = data->populate_hash;
> +    config->hash_types = data->hash_types;
> +    config->indirections_len = data->indirections_len;
> +    config->default_queue = data->default_queue;
> +}
> +
> +static bool virtio_net_attach_epbf_rss(VirtIONet *n)
> +{
> +    struct EBPFRSSConfig config = {};
> +
> +    if (!ebpf_rss_is_loaded(&n->ebpf_rss)) {
> +        return false;
> +    }
> +
> +    rss_data_to_rss_config(&n->rss_data, &config);
> +
> +    if (!ebpf_rss_set_all(&n->ebpf_rss, &config,
> +                          n->rss_data.indirections_table, n->rss_data.key)) {
> +        return false;
> +    }
> +
> +    if (!virtio_net_attach_ebpf_to_backend(n->nic, n->ebpf_rss.program_fd)) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void virtio_net_detach_epbf_rss(VirtIONet *n)
> +{
> +    virtio_net_attach_ebpf_to_backend(n->nic, -1);
> +}
> +
> +static bool virtio_net_load_ebpf(VirtIONet *n)
> +{
> +    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> +        /* backend does't support steering ebpf */
> +        return false;
> +    }
> +
> +    return ebpf_rss_load(&n->ebpf_rss);
> +}
> +
> +static void virtio_net_unload_ebpf(VirtIONet *n)
> +{
> +    virtio_net_attach_ebpf_to_backend(n->nic, -1);
> +    ebpf_rss_unload(&n->ebpf_rss);
>   }
>   
>   static uint16_t virtio_net_handle_rss(VirtIONet *n,
> @@ -1271,6 +1351,25 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
>           goto error;
>       }
>       n->rss_data.enabled = true;
> +
> +    if (!n->rss_data.populate_hash) {
> +        if (!virtio_net_attach_epbf_rss(n)) {
> +            /* EBPF must be loaded for vhost */
> +            if (get_vhost_net(qemu_get_queue(n->nic)->peer)) {
> +                warn_report("Can't load eBPF RSS for vhost");
> +                goto error;


How about stop the vhost in this case?

Thanks



