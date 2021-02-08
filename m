Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47C313662
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:10:41 +0100 (CET)
Received: from localhost ([::1]:48778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98BS-0002FL-2I
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l93IO-0002ZC-CE
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:57:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l93I6-0003wU-TK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612778227;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nEzxkeQyeZVEE1J5rR969PtYCGsCfILrthKiUHLGMsA=;
 b=Ds2vVHD/O0/1pvKUCYG00zt9EIpYb3HFWm2AJocnF0cHMUB6OjlCPxdJbQgKIVgqGCtHrx
 T0hmPI776oU6iJ70sM2tC6AQW9YMdn5sTn54UvvDd+RI1drnYvXEEK7TTOApumfzqdWahQ
 85OL/BO4itpGta8UhC5BliKjiHTNPBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-OOb9MrV4OWqDp4NRRe0yKQ-1; Mon, 08 Feb 2021 04:57:05 -0500
X-MC-Unique: OOb9MrV4OWqDp4NRRe0yKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 555071005501;
 Mon,  8 Feb 2021 09:57:04 +0000 (UTC)
Received: from redhat.com (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39D5F5D9DC;
 Mon,  8 Feb 2021 09:56:57 +0000 (UTC)
Date: Mon, 8 Feb 2021 09:56:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Subject: Re: [RFC PATCH v4 5/7] virtio-net: Added eBPF RSS to virtio-net.
Message-ID: <20210208095654.GC1141037@redhat.com>
References: <20210204170951.91805-1-andrew@daynix.com>
 <20210204170951.91805-6-andrew@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20210204170951.91805-6-andrew@daynix.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: yan@daynix.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 07:09:49PM +0200, Andrew Melnychenko wrote:
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
>  hw/net/vhost_net.c             |   2 +
>  hw/net/virtio-net.c            | 129 ++++++++++++++++++++++++++++++++-
>  include/hw/virtio/virtio-net.h |   4 +
>  net/vhost-vdpa.c               |   2 +
>  4 files changed, 133 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 24d555e764..16124f99c3 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -71,6 +71,8 @@ static const int user_feature_bits[] = {
>      VIRTIO_NET_F_MTU,
>      VIRTIO_F_IOMMU_PLATFORM,
>      VIRTIO_F_RING_PACKED,
> +    VIRTIO_NET_F_RSS,
> +    VIRTIO_NET_F_HASH_REPORT,
>  
>      /* This bit implies RARP isn't sent by QEMU out of band */
>      VIRTIO_NET_F_GUEST_ANNOUNCE,
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 5150f295e8..322d035f8c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -691,6 +691,19 @@ static void virtio_net_set_queues(VirtIONet *n)
>  
>  static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue);
>  
> +static uint64_t fix_ebpf_vhost_features(uint64_t features)
> +{
> +    /* If vhost=on & CONFIG_EBPF doesn't set - disable RSS feature */
> +    uint64_t ret = features;
> +#ifndef CONFIG_EBPF
> +    virtio_clear_feature(&ret, VIRTIO_NET_F_RSS);
> +#endif
> +    /* for now, there is no solution for populating the hash from eBPF */
> +    virtio_clear_feature(&ret, VIRTIO_NET_F_HASH_REPORT);

How is this made safe from the POV of live migration ?

The existing code below unconditionally cleared both features.

This code is not clearing _RSS if EBPF is merely enabled at
compile time.

This would seem to break live migration compatibility on upgrade
if moving from a QEMU without EBPF to one with EBPF. Or the reverse
is worse if moving from new to old QEMU we loose the RSS feature.

This needs to be conditional on an explicit command line property
that the user sets.

> +
> +    return ret;
> +}
> +
>  static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>                                          Error **errp)
>  {
> @@ -725,9 +738,9 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>          return features;
>      }
>  
> -    virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
> -    virtio_clear_feature(&features, VIRTIO_NET_F_HASH_REPORT);
> -    features = vhost_net_get_features(get_vhost_net(nc->peer), features);
> +    features = fix_ebpf_vhost_features(
> +            vhost_net_get_features(get_vhost_net(nc->peer), features));
> +
>      vdev->backend_features = features;
>  
>      if (n->mtu_bypass_backend &&
> @@ -1151,12 +1164,79 @@ static int virtio_net_handle_announce(VirtIONet *n, uint8_t cmd,
>      }
>  }
>  
> +static void virtio_net_detach_epbf_rss(VirtIONet *n);
> +
>  static void virtio_net_disable_rss(VirtIONet *n)
>  {
>      if (n->rss_data.enabled) {
>          trace_virtio_net_rss_disable();
>      }
>      n->rss_data.enabled = false;
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
>  }
>  
>  static uint16_t virtio_net_handle_rss(VirtIONet *n,
> @@ -1271,6 +1351,25 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
>          goto error;
>      }
>      n->rss_data.enabled = true;
> +
> +    if (!n->rss_data.populate_hash) {
> +        if (!virtio_net_attach_epbf_rss(n)) {
> +            /* EBPF must be loaded for vhost */
> +            if (get_vhost_net(qemu_get_queue(n->nic)->peer)) {
> +                warn_report("Can't load eBPF RSS for vhost");
> +                goto error;
> +            }
> +            /* fallback to software RSS */
> +            warn_report("Can't load eBPF RSS - fallback to software RSS");
> +            n->rss_data.enabled_software_rss = true;
> +        }
> +    } else {
> +        /* use software RSS for hash populating */
> +        /* and detach eBPF if was loaded before */
> +        virtio_net_detach_epbf_rss(n);
> +        n->rss_data.enabled_software_rss = true;
> +    }
> +
>      trace_virtio_net_rss_enable(n->rss_data.hash_types,
>                                  n->rss_data.indirections_len,
>                                  temp.b);
> @@ -1656,7 +1755,7 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
>          return -1;
>      }
>  
> -    if (!no_rss && n->rss_data.enabled) {
> +    if (!no_rss && n->rss_data.enabled && n->rss_data.enabled_software_rss) {
>          int index = virtio_net_process_rss(nc, buf, size);
>          if (index >= 0) {
>              NetClientState *nc2 = qemu_get_subqueue(n->nic, index);
> @@ -2760,6 +2859,18 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
>      }
>  
>      if (n->rss_data.enabled) {
> +        n->rss_data.enabled_software_rss = n->rss_data.populate_hash;
> +        if (!n->rss_data.populate_hash) {
> +            if (!virtio_net_attach_epbf_rss(n)) {
> +                if (get_vhost_net(qemu_get_queue(n->nic)->peer)) {
> +                    error_report("Can't post-load eBPF RSS for vhost");

This appears to be reporting a fatal error but then carrying on as
normal, which feels like a bad idea to me.

> +                } else {
> +                    warn_report("Can't post-load eBPF RSS - fallback to software RSS");
> +                    n->rss_data.enabled_software_rss = true;
> +                }
> +            }
> +        }
> +
>          trace_virtio_net_rss_enable(n->rss_data.hash_types,
>                                      n->rss_data.indirections_len,
>                                      sizeof(n->rss_data.key));

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


