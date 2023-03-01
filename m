Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D29A6A6AF3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:41:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJtO-0003Yr-Il; Wed, 01 Mar 2023 05:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pXJtH-0003YL-RB
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:40:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pXJtG-0003Ld-5X
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677667253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cxQU8SnFBNMDfsOLIcCqAQaBj4KtcooV3mFft5xBMp4=;
 b=dfADEI9NrLuxbputLXvZhEtCzRrrNJuxo/n5Az7xiN6rKepOZUdNvdTlgRKIO0ARt7PAIM
 SF+qO4Kj2Zx0IZpxN8sIwHwNG8WfWYbuUfonvUm9mrm4kd0y1IUQ8DfCgJOAcWxlwLvC19
 uuFOJA1jAFGyxpGX+x4xZrXwmPOm5gA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-k3SvxWf8MFSG4_6iyXngYg-1; Wed, 01 Mar 2023 05:40:52 -0500
X-MC-Unique: k3SvxWf8MFSG4_6iyXngYg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z6-20020a05600c220600b003e222c9c5f4so4427879wml.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:40:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cxQU8SnFBNMDfsOLIcCqAQaBj4KtcooV3mFft5xBMp4=;
 b=wvPrnQyNUYfsDQFZr3mNDVUjHvpGPgCOg2ZyljNJ30rwyrZMhAqoqtiNjg4K5OShBo
 F2tfbmvH+INHAIvn9zsROBI+6BU2lCGgDzr0bjHscaKPq1FJd/XI7YfcjSsfEfRDCxnf
 Y3BC+3q7vhwCWdtsClNZXQLC1pq7k9Q1msEvV9Di4QaQhkmvz1tDUZS8yA52TpqlNFfE
 2KVX3qpELxzPTIbom5MNru4Ah1NxeDunuEP+tiocEjQWUkBrNmhHmBsiLSMmaRjnYVf+
 MO73HVQZ1CjNXSVQE/RJpL/Jk1/Ik0/NVuZ3A61E0i8YqrX+bCDB0KJvkdWfPAX8y6yU
 wilA==
X-Gm-Message-State: AO0yUKUVAgj/2DcYCQ5Gcir2Uls+pkzNEJaXJanHvy/mbzxi4lH4Alu4
 YIa5G1b4+8Bm1PZsmQmhjiJYTnkjFWp8On6ESLnDm/nQayYGJvskqC8wRU3zivFCfFdzPYXMu+P
 tgO/QtvIekeIhayg=
X-Received: by 2002:adf:ee0d:0:b0:2c7:da1:4694 with SMTP id
 y13-20020adfee0d000000b002c70da14694mr4463437wrn.62.1677667250922; 
 Wed, 01 Mar 2023 02:40:50 -0800 (PST)
X-Google-Smtp-Source: AK7set8MpCK8F83yDA1CICotmUh5IliLl/Aeo2n02gBjoZBaL7rYRUsp0Zkzbk4wT4xXkAWdcI5Hhg==
X-Received: by 2002:adf:ee0d:0:b0:2c7:da1:4694 with SMTP id
 y13-20020adfee0d000000b002c70da14694mr4463429wrn.62.1677667250592; 
 Wed, 01 Mar 2023 02:40:50 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 n7-20020adfe787000000b002c573778432sm12264437wrm.102.2023.03.01.02.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:40:50 -0800 (PST)
Date: Wed, 1 Mar 2023 10:40:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, pbonzini@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org, berrange@redhat.com
Subject: Re: [PATCH v5 07/12] hmp: add cryptodev info command
Message-ID: <Y/8rr2QgBswG8y5z@work-vm>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
 <20230301025124.3605557-8-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301025124.3605557-8-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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


