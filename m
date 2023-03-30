Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470896CFF35
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 10:54:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pho1p-000204-WC; Thu, 30 Mar 2023 04:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pho1l-0001wd-LD
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:53:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pho1j-0002Ce-Ci
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680166378;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uBC9oPToI0rRaeNL/13eWHJTk2HOz4fmLmZq1VSjUb8=;
 b=MmAIbakcV0qqQMNFaoAB0+Uf/igaHMplCcJ++sol2n6CNhdXinkpj95bcFxIo52NE1hDPZ
 djcg0eOmgBd2nZrrG1kXa4FqgTMFtyjyqv7t33M3tZBfRUpf39Uxh6UgLQUH7C9Gbnw1U+
 jfxSQTAlF5jYrR/Hb/yWOec7Gnq3mNk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-yYN7KEciN26SrSxDhyOlNA-1; Thu, 30 Mar 2023 04:52:54 -0400
X-MC-Unique: yYN7KEciN26SrSxDhyOlNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75E72185A78B;
 Thu, 30 Mar 2023 08:52:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E78D18EC7;
 Thu, 30 Mar 2023 08:52:52 +0000 (UTC)
Date: Thu, 30 Mar 2023 09:52:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org,
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 toke@redhat.com, mprivozn@redhat.com, yuri.benditovich@daynix.com,
 yan@daynix.com
Subject: Re: [RFC PATCH 2/5] virtio-net: Added property to load eBPF RSS with
 fds.
Message-ID: <ZCVN4TWwDsXJGfwi@redhat.com>
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-3-andrew@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330001522.120774-3-andrew@daynix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Mar 30, 2023 at 03:15:19AM +0300, Andrew Melnychenko wrote:
> eBPF RSS program and maps may now be passed during initialization.
> Initially was implemented for libvirt to launch qemu without permissions,
> and initialized eBPF program through the helper.
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  hw/net/virtio-net.c            | 77 ++++++++++++++++++++++++++++++++--
>  include/hw/virtio/virtio-net.h |  1 +
>  2 files changed, 74 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 53e1c32643..45d448a83d 100644
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
> @@ -1305,14 +1306,81 @@ static void virtio_net_detach_epbf_rss(VirtIONet *n)
>      virtio_net_attach_ebpf_to_backend(n->nic, -1);
>  }
>  
> -static bool virtio_net_load_ebpf(VirtIONet *n)
> +static int virtio_net_get_ebpf_rss_fds(char *str, char *fds[], int nfds)

Needs to have an 'Error **errp' parameter

> +{
> +    char *ptr = str;
> +    char *cur = NULL;
> +    size_t len = strlen(str);
> +    int i = 0;
> +
> +    for (; i < nfds && ptr < str + len;) {
> +        cur = strchr(ptr, ':');
> +
> +        if (cur == NULL) {
> +            fds[i] = g_strdup(ptr);
> +        } else {
> +            fds[i] = g_strndup(ptr, cur - ptr);
> +        }
> +
> +        i++;
> +        if (cur == NULL) {
> +            break;
> +        } else {
> +            ptr = cur + 1;
> +        }
> +    }

...and here needs to error_setg(...) if the string being parsed has
more FDs present than 'nfds', and return error.

It should also report error if less than 'nfds' were present.

> +
> +    return i;
> +}
> +
> +static bool virtio_net_load_ebpf_fds(VirtIONet *n)
>  {
> -    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> -        /* backend does't support steering ebpf */
> +    char *fds_strs[EBPF_RSS_MAX_FDS];
> +    int fds[EBPF_RSS_MAX_FDS];
> +    int nfds;
> +    int ret = false;
> +    Error *errp;

This method should be having 'Error **errp' passed into it
instead

> +    int i = 0;
> +
> +    if (n == NULL || !n->ebpf_rss_fds) {
>          return false;
>      }

The only caller has already de-referenced 'n' so n == NULL is
impossible. The caller has also chck ebpf_rss_fds != NULL.
IOW, this is redundant

> -    return ebpf_rss_load(&n->ebpf_rss);
> +    nfds = virtio_net_get_ebpf_rss_fds(n->ebpf_rss_fds,
> +                                       fds_strs, EBPF_RSS_MAX_FDS);

Needs to pass in 'errp' and check for the error condition on return

  if (nfds != EBPF_RSS_MAX_FDS)
      return false;

> +    for (i = 0; i < nfds; i++) {
> +        fds[i] = monitor_fd_param(monitor_cur(), fds_strs[i], &errp);

if (fds[i] < 0)
   ....close all FDs so far and return error...


> +    }
> +
> +    if (nfds == EBPF_RSS_MAX_FDS) {
> +        ret = ebpf_rss_load_fds(&n->ebpf_rss, fds[0], fds[1], fds[2], fds[3]);
> +    }

This condition is not required, since we should have check
it immediately after the virtio_net_get_ebpf_rss_fds() call


> +
> +    if (!ret) {
> +        for (i = 0; i < nfds; i++) {
> +            close(fds[i]);
> +        }
> +    }
> +
> +    for (i = 0; i < nfds; i++) {
> +        g_free(fds_strs[i]);
> +    }
> +
> +    return ret;
> +}
> +
> +static bool virtio_net_load_ebpf(VirtIONet *n)

This needs to have "Error **errp' added to it and return an
error on failure. The caller already has an 'errp' available
to pass in.

> +{
> +    bool ret = true;
> +
> +    if (virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> +        if (!(n->ebpf_rss_fds
> +                && virtio_net_load_ebpf_fds(n))) {
> +            ret = ebpf_rss_load(&n->ebpf_rss);
> +        }
> +    }
> +
> +    return ret;
>  }
>  
>  static void virtio_net_unload_ebpf(VirtIONet *n)
> @@ -3900,6 +3968,7 @@ static Property virtio_net_properties[] = {
>                      VIRTIO_NET_F_RSS, false),
>      DEFINE_PROP_BIT64("hash", VirtIONet, host_features,
>                      VIRTIO_NET_F_HASH_REPORT, false),
> +    DEFINE_PROP_STRING("ebpf_rss_fds", VirtIONet, ebpf_rss_fds),
>      DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
>                      VIRTIO_NET_F_RSC_EXT, false),
>      DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index ef234ffe7e..e10ce88f91 100644
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


