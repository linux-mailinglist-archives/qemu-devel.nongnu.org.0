Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F5A7028F1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:39:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUfQ-0006Mk-CC; Mon, 15 May 2023 05:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyUfN-0006MF-RQ
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:38:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyUfL-0004kN-Th
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684143530;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1zk8+H7BMQk4pyjpbMZOjzD5sD2KOggWvhGiGhkP8co=;
 b=gpzcXiaZYLXYx7BMXWavfnkFaFXgicnjg5pehw8DDfkDeJoGhSG1zaY4GNhcqagm4qPo+Z
 jfI42T1t5HyGB4+ac51g57JqG2p8iJpp6UJEaRCiXQv1pEcREOfoDF2drZhkAJBeNcR4QA
 ZOrmLs7ALF6GRVhNGs4C7RFFJzgnLVU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-00BbNE3NMbqdIE7zKqW45Q-1; Mon, 15 May 2023 05:38:49 -0400
X-MC-Unique: 00BbNE3NMbqdIE7zKqW45Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2BD03C10683;
 Mon, 15 May 2023 09:38:48 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0F5040C2063;
 Mon, 15 May 2023 09:38:46 +0000 (UTC)
Date: Mon, 15 May 2023 10:38:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Cc: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com,
 eblake@redhat.com, qemu-devel@nongnu.org,
 yuri.benditovich@daynix.com, yan@daynix.com
Subject: Re: [PATCH v2 3/6] virtio-net: Added property to load eBPF RSS with
 fds.
Message-ID: <ZGH9pBm08TzJgUfJ@redhat.com>
References: <20230512122902.34345-1-andrew@daynix.com>
 <20230512122902.34345-4-andrew@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512122902.34345-4-andrew@daynix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, May 12, 2023 at 03:28:59PM +0300, Andrew Melnychenko wrote:
> eBPF RSS program and maps may now be passed during initialization.
> Initially was implemented for libvirt to launch qemu without permissions,
> and initialized eBPF program through the helper.
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  hw/net/virtio-net.c            | 55 ++++++++++++++++++++++++++++++----
>  include/hw/virtio/virtio-net.h |  1 +
>  2 files changed, 50 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 53e1c326433..a62d7936948 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -42,6 +42,7 @@
>  #include "sysemu/sysemu.h"
>  #include "trace.h"
>  #include "monitor/qdev.h"
> +#include "monitor/monitor.h"
>  #include "hw/pci/pci_device.h"
>  #include "net_rx_pkt.h"
>  #include "hw/virtio/vhost.h"
> @@ -1305,14 +1306,55 @@ static void virtio_net_detach_epbf_rss(VirtIONet *n)
>      virtio_net_attach_ebpf_to_backend(n->nic, -1);
>  }
>  
> -static bool virtio_net_load_ebpf(VirtIONet *n)
> +static bool virtio_net_load_ebpf_fds(VirtIONet *n, Error **errp)
>  {
> -    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> -        /* backend does't support steering ebpf */
> -        return false;
> +    int fds[EBPF_RSS_MAX_FDS] = { [0 ... EBPF_RSS_MAX_FDS - 1] = -1};

Interesting, I didn't realize this initialization syntax was possible !

> +    int nfds = 0;
> +    int ret = true;
> +    int i = 0;
> +    g_autofree char **fds_strs = g_strsplit(n->ebpf_rss_fds, ":", 0)

You can't use 'g_autofree' with 'char **' I'm afraid, as that'll
merely g_free() the array, but not the individual strings.

Needs to be

   g_auto(GStrv) fds_strs

GStrv is a typedef for "char **" which gets g_strfreev() attached
as its destructor.


> +
> +    ERRP_GUARD();
> +
> +    if (g_strv_length(fds_strs) != EBPF_RSS_MAX_FDS) {
> +        error_setg(errp,
> +                  "Expected %d file descriptors but got %d",
> +                  EBPF_RSS_MAX_FDS, g_strv_length(fds_strs));
> +       return false;
> +   }
> +
> +    for (i = 0; i < nfds; i++) {
> +        fds[i] = monitor_fd_param(monitor_cur(), fds_strs[i], errp);
> +        if (*errp) {
> +            ret = false;
> +            goto exit;
> +        }
> +    }
> +
> +    ret = ebpf_rss_load_fds(&n->ebpf_rss, fds[0], fds[1], fds[2], fds[3]);
> +
> +exit:
> +    if (!ret || *errp) {
> +        for (i = 0; i < nfds && fds[i] != -1; i++) {
> +            close(fds[i]);
> +        }
>      }
>  
> -    return ebpf_rss_load(&n->ebpf_rss);
> +    return ret;
> +}
> +
> +static bool virtio_net_load_ebpf(VirtIONet *n, Error **errp)
> +{
> +    bool ret = false;
> +
> +    if (virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> +        if (!(n->ebpf_rss_fds
> +                && virtio_net_load_ebpf_fds(n, errp))) {
> +            ret = ebpf_rss_load(&n->ebpf_rss);
> +        }
> +    }
> +
> +    return ret;
>  }
>  
>  static void virtio_net_unload_ebpf(VirtIONet *n)
> @@ -3738,7 +3780,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>      net_rx_pkt_init(&n->rx_pkt);
>  
>      if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
> -        virtio_net_load_ebpf(n);
> +        virtio_net_load_ebpf(n, errp);
>      }
>  }
>  
> @@ -3900,6 +3942,7 @@ static Property virtio_net_properties[] = {
>                      VIRTIO_NET_F_RSS, false),
>      DEFINE_PROP_BIT64("hash", VirtIONet, host_features,
>                      VIRTIO_NET_F_HASH_REPORT, false),
> +    DEFINE_PROP_STRING("ebpf_rss_fds", VirtIONet, ebpf_rss_fds),
>      DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
>                      VIRTIO_NET_F_RSC_EXT, false),
>      DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index ef234ffe7ef..e10ce88f918 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -219,6 +219,7 @@ struct VirtIONet {
>      VirtioNetRssData rss_data;
>      struct NetRxPkt *rx_pkt;
>      struct EBPFRSSContext ebpf_rss;
> +    char *ebpf_rss_fds;
>  };
>  
>  size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
> -- 
> 2.39.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


