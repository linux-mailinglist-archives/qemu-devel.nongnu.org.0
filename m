Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278FB3AD187
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 19:52:23 +0200 (CEST)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luIfG-0001lJ-6t
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 13:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1luId9-0008TX-4l
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:50:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1luId6-0006n5-8i
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624038607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGL/FUquJVQARNjdZRrNEsCbKnpknnd//bxMRP3/Jts=;
 b=hH0P8NuxM1vQlczE85R6f/A+/SKTrxzloQI9NM1pzEnTii/Ko25nOLW33+YpZpX6+tzYpJ
 AsvtRdCkv3gBr+vjvxj/lMVGOmUc9cE2u+MQwUZo4ibqywe+cTpI+hzn4BeaIEyyoMnvyG
 UrWoLbIFrM7DzeFS8yLV1AEeuHvvzgk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-9Cen3yJpM7yag2MJmS30Qw-1; Fri, 18 Jun 2021 13:50:06 -0400
X-MC-Unique: 9Cen3yJpM7yag2MJmS30Qw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y18-20020a0564022712b029038ffac1995eso4128850edd.12
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eGL/FUquJVQARNjdZRrNEsCbKnpknnd//bxMRP3/Jts=;
 b=JPK93eqpfUacUf3Z6mbSxRdWCawiVNkwxords8ZPP8IzpUUmZlEr/yKS5sjAmQLbMC
 09ndJ5IcSxsDyKJZo408spMjoDBkgdhzTTGUZy9C0SebFbI82VhSwuAN1vD5+g6w0Mmj
 y0ZsNA8nxUpbuQna2L4fYSQ3RMdlrmXhcC1gibQ/9+or9Oh0Yons+z9mtNnmszSoNTE8
 iZZBhRF3hJ2ZezkgCLu/urzGDC5FSn9crry/0AOwERcToGH0bpIb6mG8Ar4GbCrMeqO5
 +pZQek4YGbl+/98oZnITETux22YBzifY+pbt1s9SgONsOZYWPaNlkzEHPaPtVYRqjyQ0
 QeVA==
X-Gm-Message-State: AOAM533x5OE7QOE/ONUjVCkz/emVtKdjO6QPkmWR+z2iOfPhlVck1hPp
 NNFt76YAPzls2m20D9HnEwN+c8DQishyAB49lRI/pzSkfWS9YkojAj7eISp4qdTi8NgGGO9XBug
 h9xhq5AzXCjQ0ll4=
X-Received: by 2002:a05:6402:27d1:: with SMTP id
 c17mr6668067ede.28.1624038605056; 
 Fri, 18 Jun 2021 10:50:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3Z1Ruil399DNVTEYVJWcvNiI64x1qaQa9k8+U4YfDQxpy6AkLT0LwRTZCCMFhE7eH/NW11Q==
X-Received: by 2002:a05:6402:27d1:: with SMTP id
 c17mr6668043ede.28.1624038604889; 
 Fri, 18 Jun 2021 10:50:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v26sm1323714ejk.70.2021.06.18.10.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 10:50:04 -0700 (PDT)
Subject: Re: [PATCH v3 15/24] modules: use modinfo for qemu opts load
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210618045353.2510174-1-kraxel@redhat.com>
 <20210618045353.2510174-16-kraxel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0c38282e-ba3e-18a0-f660-dfa2fb684d97@redhat.com>
Date: Fri, 18 Jun 2021 19:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618045353.2510174-16-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/06/21 06:53, Gerd Hoffmann wrote:
> Use module database to figure which module adds given QemuOpts group.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   softmmu/vl.c        | 17 -----------------
>   stubs/module-opts.c |  4 ----
>   util/module.c       | 19 +++++++++++++++++++
>   3 files changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index a4857ec43ff3..c91d63e3cc02 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2675,23 +2675,6 @@ void qmp_x_exit_preconfig(Error **errp)
>       }
>   }
>   
> -#ifdef CONFIG_MODULES
> -void qemu_load_module_for_opts(const char *group)
> -{
> -    static bool spice_tried;
> -    if (g_str_equal(group, "spice") && !spice_tried) {
> -        ui_module_load_one("spice-core");
> -        spice_tried = true;
> -    }
> -
> -    static bool iscsi_tried;
> -    if (g_str_equal(group, "iscsi") && !iscsi_tried) {
> -        block_module_load_one("iscsi");
> -        iscsi_tried = true;
> -    }
> -}
> -#endif
> -
>   void qemu_init(int argc, char **argv, char **envp)
>   {
>       QemuOpts *opts;
> diff --git a/stubs/module-opts.c b/stubs/module-opts.c
> index a7d0e4ad6ead..5412429ea869 100644
> --- a/stubs/module-opts.c
> +++ b/stubs/module-opts.c
> @@ -1,6 +1,2 @@
>   #include "qemu/osdep.h"
>   #include "qemu/config-file.h"
> -
> -void qemu_load_module_for_opts(const char *group)
> -{
> -}
> diff --git a/util/module.c b/util/module.c
> index 745ae0fb20ed..a9ec2da9972e 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -20,6 +20,7 @@
>   #include "qemu/queue.h"
>   #include "qemu/module.h"
>   #include "qemu/cutils.h"
> +#include "qemu/config-file.h"
>   #ifdef CONFIG_MODULE_UPGRADES
>   #include "qemu-version.h"
>   #endif
> @@ -322,8 +323,26 @@ void module_load_qom_all(void)
>       module_loaded_qom_all = true;
>   }
>   
> +void qemu_load_module_for_opts(const char *group)
> +{
> +    const QemuModinfo *modinfo;
> +    const char **sl;
> +
> +    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
> +        if (!modinfo->opts) {
> +            continue;
> +        }
> +        for (sl = modinfo->opts; *sl != NULL; sl++) {
> +            if (strcmp(group, *sl) == 0) {
> +                module_load_one("", modinfo->name, false);
> +            }
> +        }
> +    }
> +}
> +
>   #else
>   
> +void qemu_load_module_for_opts(const char *group) {}
>   void module_load_qom_one(const char *type) {}
>   void module_load_qom_all(void) {}
>   
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


