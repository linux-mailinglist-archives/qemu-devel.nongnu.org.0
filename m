Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCB84D8DAC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 21:01:56 +0100 (CET)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqt9-0005EF-7Y
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 16:01:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nTqn5-0004w2-FA
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:55:39 -0400
Received: from [2607:f8b0:4864:20::1030] (port=43617
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nTqn3-0004F3-Nd
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:55:39 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so364743pju.2
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LWALKnKv5w0dsa58jKXz3SPHL0TSIWu3ddFOLJJIuDk=;
 b=o5MbIIuFQVxPh4n6Ex5qTcbYcmYxXt4T4/h4pBWj03uNXM4u9eUKAcAACYOy3T0fqW
 /U2xuNjeHSAqRAXVEEYbyWm3g2vh5X8qPs0x7z1ScFreSvJ2ZUtjyZArmFQ2ULGZaoud
 ECP97uCobsOoPebk9PBdaFrcfQs0GMJn2xy13skdXEJoOplE25u1HF4QworYPfH212sj
 6ZRytO8sLT1W7fIa7gHw7RCzsLne5zFkF/KCH9UB7MHh5FzJyaQCte/cCiYYWvrqJkQP
 6J5Ak5dlddZP3U2b4Jc/QCslaqz35IE3EY7EzKJ2j/PRluYquctfXZI3JB24a1308SoQ
 75cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LWALKnKv5w0dsa58jKXz3SPHL0TSIWu3ddFOLJJIuDk=;
 b=shfoIUW8EMh/yrZgcF80MQAinJeQZDCZodLallUIhQW8KfZucRQEAgP6Q+a9cuuTYt
 JYybTCJk+ht7egdaE5+BvD4HJSK6SKLcmxKYVI8N5RAT0JoZrwra6aOHhYexTfnSogJ1
 zKn2qTmxP07tORIIL/t2wJxWQWw1qY+DmZjVBai/FmGVAOiloc4JUuCL8U0+1O6yjntR
 xDkaF7aFXQd2wkqT+vkPYZMr9hq4NNDe02HC2sx2gMZqCtcyDQkC3UCuB8FZ9oJPvHM6
 uGCqiQn1RkC3mQlNHOKeQeyLtTSRmNgRcRWa2H0AjwDfJOEEsc3iNCu4tUhcu64PJqnF
 Y2CA==
X-Gm-Message-State: AOAM531cYnjZZLffq+e2DLTYyNgWZbsQxQ4PT5mPNpgrEfwy53F9nfLH
 Tx2txttq9L19GxBQuweexWs=
X-Google-Smtp-Source: ABdhPJy7woaGtoghFfCz2Lg+c8l/269YZookLyRdKU152M0qPAvhHJ4zUVdmLKZIFzbsaGGOAQLjaw==
X-Received: by 2002:a17:90a:9502:b0:1bf:f7f0:816a with SMTP id
 t2-20020a17090a950200b001bff7f0816amr818432pjo.228.1647287736388; 
 Mon, 14 Mar 2022 12:55:36 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090a890c00b001b8efcf8e48sm316141pjn.14.2022.03.14.12.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 12:55:36 -0700 (PDT)
Message-ID: <734d5fcb-3ebd-5336-78ac-cd64c886a11c@gmail.com>
Date: Tue, 15 Mar 2022 04:55:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v16 4/7] net/vmnet: implement host mode (vmnet-host)
Content-Language: en-US
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>,
 qemu-devel@nongnu.org
References: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220314191545.81861-5-Vladislav.Yaroshchuk@jetbrains.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220314191545.81861-5-Vladislav.Yaroshchuk@jetbrains.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1030.google.com
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

On 2022/03/15 4:15, Vladislav Yaroshchuk wrote:
> Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
> ---
>   net/vmnet-host.c | 116 ++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 110 insertions(+), 6 deletions(-)
> 
> diff --git a/net/vmnet-host.c b/net/vmnet-host.c
> index 32dc437037..15a832701a 100644
> --- a/net/vmnet-host.c
> +++ b/net/vmnet-host.c
> @@ -9,16 +9,120 @@
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
> +typedef struct VmnetHostState {
> +    VmnetCommonState cs;
> +    QemuUUID network_uuid;
> +} VmnetHostState;
> +
> +static bool validate_options(const Netdev *netdev, Error **errp)
> +{
> +    const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
> +    QemuUUID uuid;
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
> +    VmnetCommonState *cs = DO_UPCAST(VmnetCommonState, nc, nc);
> +    VmnetHostState *hs = DO_UPCAST(VmnetHostState, cs, cs);
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
> +    if (options->has_net_uuid) {
> +        qemu_uuid_parse(options->net_uuid, &hs->network_uuid);
> +        xpc_dictionary_set_uuid(if_desc,
> +                                vmnet_network_identifier_key,
> +                                hs->network_uuid.data);

I missed this previously, but network_uuid can be a local variable since 
xpc_dictionary_set_uuid copies the UUID to a XPC UUID object box.

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
> +    .size = sizeof(VmnetHostState),
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
> +        g_assert_not_reached();

g_assert_not_reached() is inappropriate here. It should be used to 
identify programming errors, but this code path can be triggered with an 
erroneous user input. It can be simply removed.

> +        return -1;
> +    }
> +    return vmnet_if_create(nc, build_if_desc(netdev, nc), errp);
>   }


