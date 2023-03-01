Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9016F6A6B0F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:48:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJzz-0000J4-DU; Wed, 01 Mar 2023 05:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pXJzs-0000Gw-IZ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:47:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pXJzq-0004ZS-VY
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677667658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kfeIHqBA35iKH5mgcemT/BGcLzq5AjJYvO/BTONGOTI=;
 b=e+/5aA92cfqreBaItfBU7Y7knLL8KnYXTxsiaiv9jhbk8SLt49rw6YSXmtxJbk7lKef94f
 x35wfwWrxD8pf75ARgzsGNQEffha+IKh8SaaJ/TR/Z0Yard+KDunRlwIsRy0Hi4/Cvbzwa
 BtJIE1mc6Ho8b7YSaowsY9ZsEv2MX6g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-iFqIjLr6Mo669vuweqM6JQ-1; Wed, 01 Mar 2023 05:47:37 -0500
X-MC-Unique: iFqIjLr6Mo669vuweqM6JQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 j2-20020adfa782000000b002ca9ab26627so2204543wrc.23
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:47:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfeIHqBA35iKH5mgcemT/BGcLzq5AjJYvO/BTONGOTI=;
 b=KWz8y4sXtJ7yENmkS//wbSlgNo2tDzRlsEY7qz0/U0z0WTFv/iVcJLirAY2K0zEvam
 p1Hnbgc9vDukl/S6DXt52HppNIpI6l4BTkl8Dd9tqKrxR4UTYS+nGm5Mo3mKgM1DYi+/
 Jm+RkX5r4O4xCq3ZP1BxjGH2R7q3H/vpRzlgnrTwoRgc1MuQ4fIxV/xCzlQwh9y9Wibz
 Y2Zhu2V574qICVDHnKKcTOj5DicwdHmr9WJ0iA2hMmfUYOkrILaFeWXNQHCnj45fGGx7
 b7a3eYHBiw7G+GLQv/irPA3ONgBjowe8wK+FHxTDf959eTmfPm71Goy+yh5UQ+yeMl9r
 wghQ==
X-Gm-Message-State: AO0yUKXf3R6TRxjbS3Abh8tZ2iuHz+pF0SroV7K1jmjE8ksBBDJ34Z2M
 Av/DCHhoHvoDxu7dXQkK2ANTlo0kXjjblO6grJbEV/CMzWone2pANVE1CjuLu2Zi6aQl+QfZ30E
 1nDkNZpWybohw5as=
X-Received: by 2002:a05:600c:18a3:b0:3eb:2da4:efe7 with SMTP id
 x35-20020a05600c18a300b003eb2da4efe7mr4472851wmp.11.1677667656752; 
 Wed, 01 Mar 2023 02:47:36 -0800 (PST)
X-Google-Smtp-Source: AK7set91VAcSIdz86/QEUxgOUn4ijPApoZkncD/fdTfPmGJ0UeyGj7asAVclZfdbPMeB0LhGg34z6g==
X-Received: by 2002:a05:600c:18a3:b0:3eb:2da4:efe7 with SMTP id
 x35-20020a05600c18a300b003eb2da4efe7mr4472838wmp.11.1677667656434; 
 Wed, 01 Mar 2023 02:47:36 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b003e1f6e18c95sm19770057wmb.21.2023.03.01.02.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:47:35 -0800 (PST)
Date: Wed, 1 Mar 2023 10:47:33 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, pbonzini@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org, berrange@redhat.com
Subject: Re: [PATCH v5 07/12] hmp: add cryptodev info command
Message-ID: <Y/8tRTK4iMDtiElR@work-vm>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
 <20230301025124.3605557-8-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301025124.3605557-8-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* zhenwei pi (pizhenwei@bytedance.com) wrote:
> Example of this command:
>  # virsh qemu-monitor-command vm --hmp info cryptodev
> cryptodev1: service=[akcipher|mac|hash|cipher]
>     queue 0: type=builtin
> cryptodev0: service=[akcipher]
>     queue 0: type=lkcf
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>

Yes, I think that's fine from HMP; you might want to use some of the
qapi list macros;


Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  backends/cryptodev-hmp-cmds.c | 54 +++++++++++++++++++++++++++++++++++
>  backends/meson.build          |  1 +
>  hmp-commands-info.hx          | 14 +++++++++
>  include/monitor/hmp.h         |  1 +
>  4 files changed, 70 insertions(+)
>  create mode 100644 backends/cryptodev-hmp-cmds.c
> 
> diff --git a/backends/cryptodev-hmp-cmds.c b/backends/cryptodev-hmp-cmds.c
> new file mode 100644
> index 0000000000..4f7220bb13
> --- /dev/null
> +++ b/backends/cryptodev-hmp-cmds.c
> @@ -0,0 +1,54 @@
> +/*
> + * HMP commands related to cryptodev
> + *
> + * Copyright (c) 2023 Bytedance.Inc
> + *
> + * Authors:
> + *    zhenwei pi<pizhenwei@bytedance.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "monitor/hmp.h"
> +#include "monitor/monitor.h"
> +#include "qapi/qapi-commands-cryptodev.h"
> +#include "qapi/qmp/qdict.h"
> +
> +
> +void hmp_info_cryptodev(Monitor *mon, const QDict *qdict)
> +{
> +    QCryptodevInfoList *il;
> +    QCryptodevBackendServiceTypeList *sl;
> +    QCryptodevBackendClientList *cl;
> +
> +    for (il = qmp_query_cryptodev(NULL); il; il = il->next) {
> +        g_autofree char *services = NULL;
> +        QCryptodevInfo *info = il->value;
> +        char *tmp_services;
> +
> +        /* build a string like 'service=[akcipher|mac|hash|cipher]' */
> +        for (sl = info->service; sl; sl = sl->next) {
> +            const char *service = QCryptodevBackendServiceType_str(sl->value);
> +
> +            if (!services) {
> +                services = g_strdup(service);
> +            } else {
> +                tmp_services = g_strjoin("|", services, service, NULL);
> +                g_free(services);
> +                services = tmp_services;
> +            }
> +        }
> +        monitor_printf(mon, "%s: service=[%s]\n", info->id, services);
> +
> +        for (cl = info->client; cl; cl = cl->next) {
> +            QCryptodevBackendClient *client = cl->value;
> +            monitor_printf(mon, "    queue %" PRIu32 ": type=%s\n",
> +                           client->queue,
> +                           QCryptodevBackendType_str(client->type));
> +        }
> +    }
> +
> +    qapi_free_QCryptodevInfoList(il);
> +}
> diff --git a/backends/meson.build b/backends/meson.build
> index 954e658b25..b369e0a9d0 100644
> --- a/backends/meson.build
> +++ b/backends/meson.build
> @@ -1,5 +1,6 @@
>  softmmu_ss.add([files(
>    'cryptodev-builtin.c',
> +  'cryptodev-hmp-cmds.c',
>    'cryptodev.c',
>    'hostmem-ram.c',
>    'hostmem.c',
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 754b1e8408..47d63d26db 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -993,3 +993,17 @@ SRST
>    ``info virtio-queue-element`` *path* *queue* [*index*]
>      Display element of a given virtio queue
>  ERST
> +
> +    {
> +        .name       = "cryptodev",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "show the crypto devices",
> +        .cmd        = hmp_info_cryptodev,
> +        .flags      = "p",
> +    },
> +
> +SRST
> +  ``info cryptodev``
> +    Show the crypto devices.
> +ERST
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 2220f14fc9..e6cf0b7aa7 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -178,5 +178,6 @@ void hmp_ioport_read(Monitor *mon, const QDict *qdict);
>  void hmp_ioport_write(Monitor *mon, const QDict *qdict);
>  void hmp_boot_set(Monitor *mon, const QDict *qdict);
>  void hmp_info_mtree(Monitor *mon, const QDict *qdict);
> +void hmp_info_cryptodev(Monitor *mon, const QDict *qdict);
>  
>  #endif
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


