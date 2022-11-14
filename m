Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC56628E35
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:21:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouij0-0002hE-WC; Mon, 14 Nov 2022 18:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ouieW-0001X6-0M
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oue0n-0003qD-US
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 13:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668449803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JGy9wfj9pqAjXMRArLAphnl2EPN/vZM7uuc2Iu2LotA=;
 b=N633IwyFEzY+amCQDU4EqlapXbTc3ajDEAkKDys4tyBcflLnDNxM07n3LZJ+xIVXKWcw8C
 OJWMWijMTFXZTGZIl4+8NV0BmKucT3RX8NWPswxgI17oUIobaq6GK9tGGcjMBRZQMhKAoo
 lyqEdF1x38m3ln059pY2qSTqnRv6hJc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-335-qxyf4Oj5PJqqyS5lreoOTQ-1; Mon, 14 Nov 2022 13:16:42 -0500
X-MC-Unique: qxyf4Oj5PJqqyS5lreoOTQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso9282936wms.4
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 10:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGy9wfj9pqAjXMRArLAphnl2EPN/vZM7uuc2Iu2LotA=;
 b=D7tTiZboA+K6ZHDQQMyvk3i0+ObtdUHpPWmdDiAWd5VD9oEwbLMfB/DX5hKwKtdENR
 9QIGQZioaQ08ITrbklR/ExB4pV7sEcG9RAYe/y7p4W79hZOEftqJ/B/XO27pwn+y6GjE
 0EvWJy+TDeEcyoZvJbfqiV7Iw0AQ9r8+bcZ6jf+oO295+dCHn7UOAbY2GKpwGWgCJMCq
 silrRlK9cDlai11FmPMQGWr5RaTWL+AjYae5+gbM1ZqQKFWGB755vsTXtUiKI4agbEls
 usaEjvIPa69QX1Txz647D0lA1zbBSJ79IykkOawWPxTIyMt6bc0gO4swypbne74s3Ntu
 ZUUQ==
X-Gm-Message-State: ANoB5pk45pr+d8XrUuIGUZemiSEv0A5KGtR3A/61VtgcTYD4ZZyJQUS+
 srkYsWtJSJvACdPUMazm5X4qcYivdlYXhpTi9CArpgIFmZpQ+mqBNuPAtSaJrj0NR8zS3TkIfv2
 uybYbNDBAEfDuSqM=
X-Received: by 2002:adf:f347:0:b0:236:6dd1:eb68 with SMTP id
 e7-20020adff347000000b002366dd1eb68mr8283219wrp.261.1668449801053; 
 Mon, 14 Nov 2022 10:16:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7ALYdtnV1gxuoJvbyaobg1Omddp8VJK7kPLWNstedwsBf5+fDRxE7MGuN6XneY6kxola10WA==
X-Received: by 2002:adf:f347:0:b0:236:6dd1:eb68 with SMTP id
 e7-20020adff347000000b002366dd1eb68mr8283204wrp.261.1668449800800; 
 Mon, 14 Nov 2022 10:16:40 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 t5-20020a5d4605000000b0022dc6e76bbdsm10350689wrq.46.2022.11.14.10.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 10:16:40 -0800 (PST)
Date: Mon, 14 Nov 2022 18:16:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: arei.gonglei@huawei.com, mst@redhat.com, eblake@redhat.com,
 armbru@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org
Subject: Re: [PATCH for 8.0 8/8] hmp: add cryptodev info command
Message-ID: <Y3KGBiYh3QpzhVOX@work-vm>
References: <20221111064553.246932-1-pizhenwei@bytedance.com>
 <20221111064553.246932-9-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111064553.246932-9-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
> ---
>  hmp-commands-info.hx  | 14 ++++++++++++++
>  include/monitor/hmp.h |  1 +
>  monitor/hmp-cmds.c    | 36 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 51 insertions(+)
> 
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
> index dfbc0c9a2f..b6b2b49202 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -143,5 +143,6 @@ void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_human_readable_text_helper(Monitor *mon,
>                                      HumanReadableText *(*qmp_handler)(Error **));
>  void hmp_info_stats(Monitor *mon, const QDict *qdict);
> +void hmp_info_cryptodev(Monitor *mon, const QDict *qdict);
>  
>  #endif
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 01b789a79e..3f1054aa1e 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -33,6 +33,7 @@
>  #include "qapi/qapi-commands-block.h"
>  #include "qapi/qapi-commands-char.h"
>  #include "qapi/qapi-commands-control.h"
> +#include "qapi/qapi-commands-cryptodev.h"
>  #include "qapi/qapi-commands-machine.h"
>  #include "qapi/qapi-commands-migration.h"
>  #include "qapi/qapi-commands-misc.h"
> @@ -2761,3 +2762,38 @@ void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
>  
>      qapi_free_VirtioQueueElement(e);
>  }
> +
> +void hmp_info_cryptodev(Monitor *mon, const QDict *qdict)
> +{
> +    CryptodevInfoList *info_list;
> +    CryptodevInfo *info;
> +    QCryptodevBackendServiceTypeList *service_list;
> +    CryptodevBackendClientList *client_list;
> +    CryptodevBackendClient *client;
> +    char services[128] = {};

I'd rather avoid magic length buffers; the magic is always the wrong
number!

> +    int len;
> +
> +    info_list = qmp_query_cryptodev(NULL);
> +    for ( ; info_list; info_list = info_list->next) {

maybe:
 for ( info_list = qmp_query_cryptodev(NULL);
       info_list;
       info_list = info_list->next) {

> +        info = info_list->value;
> +
> +        service_list = info->service;
> +        for (len = 0; service_list; service_list = service_list->next) {
> +            len += snprintf(services + len, sizeof(services) - len, "%s|",
> +                QCryptodevBackendServiceType_str(service_list->value));

Consider using a dynamically allocated string and then just using
g_strconcat or g_strjoin() to glue them all together.

    new_services = g_strjoin("|", services,  NULL);   ?
    g_free(services);
    services = new_services;

Maybe?


> +        }
> +        if (len) {
> +            services[len - 1] = '\0'; /* strip last char '|' */
> +        }
> +        monitor_printf(mon, "%s: service=[%s]\n", info->id, services);
> +
> +        client_list = info->client;
> +        for ( ; client_list; client_list = client_list->next) {
> +            client = client_list->value;
> +            monitor_printf(mon, "    queue %ld: type=%s\n", client->queue,
> +                          QCryptodevBackendType_str(client->type));
> +        }
> +    }
> +
> +    qapi_free_CryptodevInfoList(info_list);
> +}
> -- 
> 2.20.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


