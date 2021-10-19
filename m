Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24484330F2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:19:51 +0200 (CEST)
Received: from localhost ([::1]:51000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mckLe-0004VD-Gi
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mck91-0002qX-Ov
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:06:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mck8z-0006Jp-0M
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634630802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncbdNyA4hVV+vsf+mbJ0CvXXx/Ij6l4ugJgqT8iAPec=;
 b=EtO6+alVc7DFST62nUpVDLCnz49p+JvkQ5qAZuv3D3DJHCPfvJKD+QjeZtAn474a0FY01F
 SF8paR0Ao+W0AmrVioLeH7VGatgf92kQd5oFhRRpLqpGW5QDXqbmn0s0rQjCNoYyaWQznr
 ICTnRxEhyK2/e/16FsbTkN6fHV/h3pM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-OfvyFVhANWiKfI0pd4BoXw-1; Tue, 19 Oct 2021 04:06:39 -0400
X-MC-Unique: OfvyFVhANWiKfI0pd4BoXw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so829001wmh.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 01:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ncbdNyA4hVV+vsf+mbJ0CvXXx/Ij6l4ugJgqT8iAPec=;
 b=wZx/Ru69Xn0AWlZ6qc5qHLD1NTjYHuyX5nKRfVwYssb2YKjJlcqrYTBdjdNfX79xGv
 NjCqi4zi1DbJGw5I6uHuy7WPlzqTTsggwKJWwXNowGfMHn4hptwC/526cyNHJ+8X0cyO
 YWecM2XZvJJuetHYg47RjUwwic/6bIJGpNFRyLBnzW8V9XhPEcBHluA6/qtC4MynbacE
 SntF02nFDHd54mFTvNXz0VWvGAB+qNde/tXB46HUDNLpRre6k4Sr/9Miwn+kKfX9wjeW
 KTPvVfyrcL5NriQvXMEkEUp3D3oYhZrlFVL2tTYgQKlyMSfjs0rSV59ByoVSWUecPmxU
 njkQ==
X-Gm-Message-State: AOAM533BE6tUa4Tvfgy26VEpW0WHzRpXfAAcQaOtF8ofS/TsU8HsujmH
 2lgX3QcsnhvEK8tYIjynKLNzeSF3J8gZPqJO8ekpnXuLAoaCeBkxAXrik/pLd5ThRge/3YU/INN
 qw0jIhD9BZ9r1E60=
X-Received: by 2002:adf:959a:: with SMTP id p26mr40708318wrp.342.1634630797998; 
 Tue, 19 Oct 2021 01:06:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZBk+qxoF38UlXmazwrpalFBmWJayTvJ8+HqjnozeKS6iO0htCZ5HeW1OF8Sofhm0KGBTJxA==
X-Received: by 2002:adf:959a:: with SMTP id p26mr40708293wrp.342.1634630797721; 
 Tue, 19 Oct 2021 01:06:37 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.24.54])
 by smtp.gmail.com with ESMTPSA id u14sm9878399wrw.91.2021.10.19.01.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 01:06:37 -0700 (PDT)
Message-ID: <3be47c0d-817b-b5e6-fa7f-234a417ec2c5@redhat.com>
Date: Tue, 19 Oct 2021 10:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 12/15] virtio-net: Store failover primary opts pointer
 locally
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-13-kwolf@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211008133442.141332-13-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: damien.hedde@greensocs.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 libvir-list@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 armbru@redhat.com, vsementsov@virtuozzo.com, its@irrelevant.dk,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/10/2021 15:34, Kevin Wolf wrote:
> Instead of accessing the global QemuOptsList, which really belong to the
> command line parser and shouldn't be accessed from devices, store a
> pointer to the QemuOpts in a new VirtIONet field.
> 
> This is not the final state, but just an intermediate step to get rid of
> QemuOpts in devices. It will later be replaced with an options QDict.
> 
> Before this patch, two "primary" devices could be hidden for the same
> standby device, but only one of them would actually be enabled and the
> other one would be kept hidden forever, so this doesn't make sense.
> After this patch, configuring a second primary device is an error.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/hw/virtio/virtio-net.h |  1 +
>   hw/net/virtio-net.c            | 26 ++++++++++++++++++--------
>   2 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index 824a69c23f..d118c95f69 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -209,6 +209,7 @@ struct VirtIONet {
>       bool failover_primary_hidden;
>       bool failover;
>       DeviceListener primary_listener;
> +    QemuOpts *primary_opts;
>       Notifier migration_state;
>       VirtioNetRssData rss_data;
>       struct NetRxPkt *rx_pkt;
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index a17d5739fc..ed9a9012e9 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -858,27 +858,24 @@ static DeviceState *failover_find_primary_device(VirtIONet *n)
>   static void failover_add_primary(VirtIONet *n, Error **errp)
>   {
>       Error *err = NULL;
> -    QemuOpts *opts;
> -    char *id;
>       DeviceState *dev = failover_find_primary_device(n);
>   
>       if (dev) {
>           return;
>       }
>   
> -    id = failover_find_primary_device_id(n);
> -    if (!id) {
> +    if (!n->primary_opts) {
>           error_setg(errp, "Primary device not found");
>           error_append_hint(errp, "Virtio-net failover will not work. Make "
>                             "sure primary device has parameter"
>                             " failover_pair_id=%s\n", n->netclient_name);
>           return;
>       }
> -    opts = qemu_opts_find(qemu_find_opts("device"), id);
> -    g_assert(opts); /* cannot be NULL because id was found using opts list */
> -    dev = qdev_device_add(opts, &err);
> +
> +    dev = qdev_device_add(n->primary_opts, &err);
>       if (err) {
> -        qemu_opts_del(opts);
> +        qemu_opts_del(n->primary_opts);
> +        n->primary_opts = NULL;
>       } else {
>           object_unref(OBJECT(dev));
>       }
> @@ -3317,6 +3314,19 @@ static bool failover_hide_primary_device(DeviceListener *listener,
>           return false;
>       }
>   
> +    if (n->primary_opts) {
> +        error_setg(errp, "Cannot attach more than one primary device to '%s'",
> +                   n->netclient_name);
> +        return false;
> +    }
> +

This part has introduced a regression, I've sent a patch to fix that.

https://patchew.org/QEMU/20211019071532.682717-1-lvivier@redhat.com/

Thanks,
Laurent


