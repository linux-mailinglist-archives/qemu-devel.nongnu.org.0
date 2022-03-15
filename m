Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831DF4DA41C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:39:51 +0100 (CET)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUDxO-0005Kt-2u
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:39:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUDum-0002DL-QM
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:37:08 -0400
Received: from [2607:f8b0:4864:20::102e] (port=55975
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUDul-0007R8-3y
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:37:08 -0400
Received: by mail-pj1-x102e.google.com with SMTP id e3so458307pjm.5
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 13:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NtDeXyN2SlfTfMl7ftCYhzmB6GN7IIxhrSU4jAa4sxA=;
 b=fvsSzQGwmk7swj7GVtcgMzijzGOGdwtyBT1rfu7byjrbMEe6lYeMDEf+QIB+D9MeVH
 xcMN8hTIZdWHjg+wmyvrgWFDzO7bFjIM+KW3l2ygPv5nVWe/qr+94TTjn1jI3NWQlHsI
 hib228yIj7S7g0/JC6HOnDyqcrxl0C13DpwbMK0dYh5gqWcOPhxkuGxLLfSGHSxbEfqF
 xoNqpSyHs/KOQNDkFpU0VHBeMZC4Cxg3UwTcUZgKZsQrIobmR0chRD6oLpYhEZpperDb
 JnnKnWCCz/39Cxp0gBdZK3Dhn4+8B1T9L3Su8a9dFsE7riQxhW2f8hmHGnX1R65ZZmU2
 48yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NtDeXyN2SlfTfMl7ftCYhzmB6GN7IIxhrSU4jAa4sxA=;
 b=0/bqz6UYGacYEKjZWWrr8EjEcuNTgZN4MQzXcWqwU4nvkbakfiY8dbcEH73ZGk2dgn
 vc0RzrKKbNjOUMaGBvouNCdB7nb7A6K4zUJW1YPUV8b+OCJIc5o1XDORiG2mTkykBcRC
 jeTMXpd4Qf/2VkiCWhk0oPSGIP8sxFlMqEpj1eQ8zmL1CJvemoeICON16EXrh4n3SaHb
 PLZctpQ/nqTOm4s/8Oj0mKbv9kOBNjyEsItiowNDa7MrsTiyOP4Md/+YxG5cUFgeaImL
 Wyj53DUXSaGGo6mNeHjnfTLPJejkKni/bpwX4Wt1Sk3XGe3Qr8uq9d7HQOFz6gsu2IlO
 5iCw==
X-Gm-Message-State: AOAM5320k8UEvL7qoCgZMHT5l+MZe5PgC0zhl+Pqd5N0lrAne325IpPW
 ljOeDZRtUplwiKk30tgJWXo=
X-Google-Smtp-Source: ABdhPJzJo9BIYqZ5ZQS1AfxR2Zsh1jrP0kvVfxWdWDMgbZbhM1lCtDuMdnPWw1lCfqHJAxW+mXVuTw==
X-Received: by 2002:a17:902:ce86:b0:151:a78b:44fe with SMTP id
 f6-20020a170902ce8600b00151a78b44femr29179734plg.159.1647376625705; 
 Tue, 15 Mar 2022 13:37:05 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 oa12-20020a17090b1bcc00b001bf430c3909sm4314564pjb.32.2022.03.15.13.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:37:05 -0700 (PDT)
Message-ID: <336d22c2-abf7-a060-a665-c7399fc9a1ad@gmail.com>
Date: Wed, 16 Mar 2022 05:37:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v19 4/7] net/vmnet: implement host mode (vmnet-host)
Content-Language: en-US
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>,
 qemu-devel@nongnu.org
References: <20220315202704.18263-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220315202704.18263-5-Vladislav.Yaroshchuk@jetbrains.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220315202704.18263-5-Vladislav.Yaroshchuk@jetbrains.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, dirty@apple.com, f4bug@amsat.org,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com, roman@roolebo.dev,
 hsp.cat7@gmail.com, hello@adns.io, qemu_oss@crudebyte.com, eblake@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/16 5:27, Vladislav Yaroshchuk wrote:
> Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
> ---
>   net/vmnet-host.c | 110 ++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 104 insertions(+), 6 deletions(-)
> 
> diff --git a/net/vmnet-host.c b/net/vmnet-host.c
> index a461d507c5..8f7a638967 100644
> --- a/net/vmnet-host.c
> +++ b/net/vmnet-host.c
> @@ -9,16 +9,114 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/uuid.h"
>   #include "qapi/qapi-types-net.h"
> -#include "vmnet_int.h"
> -#include "clients.h"
> -#include "qemu/error-report.h"
>   #include "qapi/error.h"
> +#include "clients.h"
> +#include "vmnet_int.h"
>   
>   #include <vmnet/vmnet.h>
>   
> +
> +static bool validate_options(const Netdev *netdev, Error **errp)
> +{
> +    const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
> +    QemuUUID uuid;

The variable uuid is used only when defined(MAC_OS_VERSION_11_0) && \
MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0 and may result in a 
compilation warning otherwise. It should be in the #if block as 
network_uuid variable in build_if_desc is in the counterpart.

Also I suggest to unify the names of identifiers. There are 
options->net_uuid, uuid, and network_uuid, but the differences tells 
nothing.

This should be the last thing to be addressed (unless I missed something 
again.) Thank you for persistence (It's v19!). I really appreciate your 
contribution.

Regards,
Akihiko Odaki

> +
> +#if defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> +
> +    if (options->has_net_uuid &&
> +        qemu_uuid_parse(options->net_uuid, &uuid) < 0) {
> +        error_setg(errp, "Invalid UUID provided in 'net-uuid'");
> +        return false;
> +    }
> +#else
> +    if (options->has_isolated) {
> +        error_setg(errp,
> +                   "vmnet-host.isolated feature is "
> +                   "unavailable: outdated vmnet.framework API");
> +        return false;
> +    }
> +
> +    if (options->has_net_uuid) {
> +        error_setg(errp,
> +                   "vmnet-host.net-uuid feature is "
> +                   "unavailable: outdated vmnet.framework API");
> +        return false;
> +    }
> +#endif
> +
> +    if ((options->has_start_address ||
> +         options->has_end_address ||
> +         options->has_subnet_mask) &&
> +        !(options->has_start_address &&
> +          options->has_end_address &&
> +          options->has_subnet_mask)) {
> +        error_setg(errp,
> +                   "'start-address', 'end-address', 'subnet-mask' "
> +                   "should be provided together");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static xpc_object_t build_if_desc(const Netdev *netdev,
> +                                  NetClientState *nc)
> +{
> +    const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
> +    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
> +
> +    xpc_dictionary_set_uint64(if_desc,
> +                              vmnet_operation_mode_key,
> +                              VMNET_HOST_MODE);
> +
> +#if defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> +
> +    xpc_dictionary_set_bool(if_desc,
> +                            vmnet_enable_isolation_key,
> +                            options->isolated);
> +
> +    QemuUUID network_uuid;
> +    if (options->has_net_uuid) {
> +        qemu_uuid_parse(options->net_uuid, &network_uuid);
> +        xpc_dictionary_set_uuid(if_desc,
> +                                vmnet_network_identifier_key,
> +                                network_uuid.data);
> +    }
> +#endif
> +
> +    if (options->has_start_address) {
> +        xpc_dictionary_set_string(if_desc,
> +                                  vmnet_start_address_key,
> +                                  options->start_address);
> +        xpc_dictionary_set_string(if_desc,
> +                                  vmnet_end_address_key,
> +                                  options->end_address);
> +        xpc_dictionary_set_string(if_desc,
> +                                  vmnet_subnet_mask_key,
> +                                  options->subnet_mask);
> +    }
> +
> +    return if_desc;
> +}
> +
> +static NetClientInfo net_vmnet_host_info = {
> +    .type = NET_CLIENT_DRIVER_VMNET_HOST,
> +    .size = sizeof(VmnetState),
> +    .receive = vmnet_receive_common,
> +    .cleanup = vmnet_cleanup_common,
> +};
> +
>   int net_init_vmnet_host(const Netdev *netdev, const char *name,
> -                        NetClientState *peer, Error **errp) {
> -  error_setg(errp, "vmnet-host is not implemented yet");
> -  return -1;
> +                        NetClientState *peer, Error **errp)
> +{
> +    NetClientState *nc = qemu_new_net_client(&net_vmnet_host_info,
> +                                             peer, "vmnet-host", name);
> +    if (!validate_options(netdev, errp)) {
> +        return -1;
> +    }
> +    return vmnet_if_create(nc, build_if_desc(netdev, nc), errp);
>   }


