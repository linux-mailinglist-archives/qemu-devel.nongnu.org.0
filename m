Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499483F2565
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 05:38:07 +0200 (CEST)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGvM1-0000RZ-5J
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 23:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mGvKz-0008C9-35
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:36:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mGvKx-0003mU-G1
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629430615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=24y2kKhHf9mSGUYxT/tRsCk6AGXbkJRWtYbcglKK5bc=;
 b=O+93XJ2jWnw+ucOgvTMHBCSWEpGkHlO2+olhSQxd4upNR9bPC6BrUtskJCHTyfbQD1auyB
 7Ov8E74l9jkof6xG+me+SZe6wKtyuCoyozSzVLiwwFhh7ifxMpa+zrhdeM1KuXQ2pbT+Qw
 UgA8KeyAU+MuM14eBsLojzNBh0Kgpvs=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-e6G2SW2HPGmgqSJMRJqvEg-1; Thu, 19 Aug 2021 23:36:53 -0400
X-MC-Unique: e6G2SW2HPGmgqSJMRJqvEg-1
Received: by mail-pf1-f199.google.com with SMTP id
 s53-20020a056a001c7500b003e0f67df507so4021535pfw.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 20:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=24y2kKhHf9mSGUYxT/tRsCk6AGXbkJRWtYbcglKK5bc=;
 b=Oq5tGJeWfLxYNxd347yYWIA/6vPz0Aww2izBHSfpSahE8O0HvVaVTqfMC5zoDgkUaY
 W1E3hQKisFzM5OyRNCVPe9Oz4un95/LR1zrmgu334kZJsSwv/FKFFAtWjWQJlYasSX3F
 crXtOhC/AMCRNT6v1bWzTSy4ojIJxRM8Xakdr3yiPjBu85KiOeQ2pyrGmfDM2NceiL02
 YggywBMBNR5qB3XEF41KEmafB5X5TKz4TsS4P1P/Z7im1cXAFVG/bnxLj+CKhyglwn9L
 O9jq8bvqxW1Oq9Thm5JBHvpYmyJlU2C87QZnOpv+/7Wxzo8nxDOFKs0ZxbeeYTfXkKMx
 pJXg==
X-Gm-Message-State: AOAM531MGpv+DNgCE9N4Wn84UI/sob6Nu6COBW+XEZOoUuuiN1KnAwRX
 GhMQr1TgcxrM109CtJALrtyjxNIHQG4qHRVy/rXRXHI1nbuw2VouKnYeDBoz01jHPKTRNX9WHIh
 bUAzBYrGhtJMJ/DE=
X-Received: by 2002:a17:902:b193:b029:11a:a179:453a with SMTP id
 s19-20020a170902b193b029011aa179453amr14685721plr.69.1629430612808; 
 Thu, 19 Aug 2021 20:36:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR9EDKeRDcGbs8dhCdi6Y183aPDQeaj4ZfBUjT5JIXQ3vC4f+rl+BD3RkggK7PHu0Bos2q9A==
X-Received: by 2002:a17:902:b193:b029:11a:a179:453a with SMTP id
 s19-20020a170902b193b029011aa179453amr14685704plr.69.1629430612580; 
 Thu, 19 Aug 2021 20:36:52 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r78sm5177216pfc.206.2021.08.19.20.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 20:36:52 -0700 (PDT)
Subject: Re: [PATCH 2/5] virtio-net: Added property to load eBPF RSS with fds.
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com,
 yuri.benditovich@daynix.com, armbru@redhat.com, eblake@redhat.com,
 berrange@redhat.com
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-3-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <76ba645f-b34b-e63e-8116-0a1dd80fbbae@redhat.com>
Date: Fri, 20 Aug 2021 11:36:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210713153758.323614-3-andrew@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/13 下午11:37, Andrew Melnychenko 写道:
> eBPF RSS program and maps now may be passed during initialization.
> Initially was implemented for libvirt to launch qemu without permissions.
>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>   hw/net/virtio-net.c            | 77 ++++++++++++++++++++++++++++++++--
>   include/hw/virtio/virtio-net.h |  1 +
>   2 files changed, 74 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index bd7958b9f0..0602b1772e 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -41,6 +41,7 @@
>   #include "sysemu/sysemu.h"
>   #include "trace.h"
>   #include "monitor/qdev.h"
> +#include "monitor/monitor.h"
>   #include "hw/pci/pci.h"
>   #include "net_rx_pkt.h"
>   #include "hw/virtio/vhost.h"
> @@ -1223,14 +1224,81 @@ static void virtio_net_detach_epbf_rss(VirtIONet *n)
>       virtio_net_attach_ebpf_to_backend(n->nic, -1);
>   }
>   
> -static bool virtio_net_load_ebpf(VirtIONet *n)
> +static int virtio_net_get_ebpf_rss_fds(char *str, char *fds[], int nfds)
>   {
> -    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> -        /* backend does't support steering ebpf */
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
> +
> +    return i;
> +}
> +
> +static bool virtio_net_load_ebpf_fds(VirtIONet *n)
> +{
> +    char *fds_strs[EBPF_RSS_MAX_FDS];
> +    int fds[EBPF_RSS_MAX_FDS];
> +    int nfds;
> +    int ret = false;
> +    Error *errp;
> +    int i = 0;
> +
> +    if (n == NULL || !n->ebpf_rss_fds) {
>           return false;
>       }
>   
> -    return ebpf_rss_load(&n->ebpf_rss);
> +    nfds = virtio_net_get_ebpf_rss_fds(n->ebpf_rss_fds,
> +                                       fds_strs, EBPF_RSS_MAX_FDS);
> +    for (i = 0; i < nfds; i++) {
> +        fds[i] = monitor_fd_param(monitor_cur(), fds_strs[i], &errp);
> +    }
> +
> +    if (nfds == EBPF_RSS_MAX_FDS) {
> +        ret = ebpf_rss_load_fds(&n->ebpf_rss, fds[0], fds[1], fds[2], fds[3]);
> +    }
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
>   }
>   
>   static void virtio_net_unload_ebpf(VirtIONet *n)
> @@ -3605,6 +3673,7 @@ static Property virtio_net_properties[] = {
>                       VIRTIO_NET_F_RSS, false),
>       DEFINE_PROP_BIT64("hash", VirtIONet, host_features,
>                       VIRTIO_NET_F_HASH_REPORT, false),
> +    DEFINE_PROP_STRING("ebpf_rss_fds", VirtIONet, ebpf_rss_fds),
>       DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
>                       VIRTIO_NET_F_RSC_EXT, false),
>       DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index 824a69c23f..993f2f3036 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -213,6 +213,7 @@ struct VirtIONet {
>       VirtioNetRssData rss_data;
>       struct NetRxPkt *rx_pkt;
>       struct EBPFRSSContext ebpf_rss;
> +    char *ebpf_rss_fds;


I wonder if it's better to use separated properties instead of implying 
an order here?

E.g "program_fd", "key_map_fd", "indirection_table_map_fd" etc.

Thanks


>   };
>   
>   void virtio_net_set_netclient_name(VirtIONet *n, const char *name,


