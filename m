Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D042A324
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:23:04 +0200 (CEST)
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFs7-0000BP-I5
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFVK-0007Oq-4b
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFVH-0007wG-6Q
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634036366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xaeualYPohsOB8mozKyNqHsWxtxj1YjbtAojf6DQtso=;
 b=iUgLU2/1w0XLc8dYcY5Sc2SuhSCtKBfGdg1Jk7EqlBzlhkhZsJ8ZaHuJCYpUz6It/4A4br
 fMehDoBlAEKS6bRPWlQhylwHwPyEnRnpC1DANdjgivlYUP9/6zh30zvsT1LW/6Qi5ZEE3V
 SicV+5t5S1VOnst4PXCkjotTLJwuu/8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-ZT7p_aomPiqzdf7jict_dg-1; Tue, 12 Oct 2021 06:59:25 -0400
X-MC-Unique: ZT7p_aomPiqzdf7jict_dg-1
Received: by mail-ed1-f69.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so18511149edj.21
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xaeualYPohsOB8mozKyNqHsWxtxj1YjbtAojf6DQtso=;
 b=cN8BVkNIt1ctqCNYtBtMKe0FzzSWiz08O6UUMSzCcwOO7XihpopFWme5WXQFUpjsyZ
 OG0OQfToAjnxl7gTzz/HD3WNk4LQY+XIeifEeJlYOXgXhERiM/dwffaDPkY1A3BC1THp
 2oGICIIQPiAvjwK+XYLBoFH23PKSQ+NKWE9PVZp7/TtXaM+kHxOZlViNWc0o1eEaKOo0
 s7kvb4dYUnGEF6p80NZ8m3i5zkM3G0dNyc+LyqSsWjaAFgoNEylHuA8DhZ2+4nSFLKm5
 UZesGcLTLQZl1S7FIAwtVPBSkDzKh7bbLoCKsMloHUFjZRrQrrI4d32cenmFTNJJy5kK
 uhKQ==
X-Gm-Message-State: AOAM531sHBsIKVpttGt4y+d+9aEhf5dvYdmM0TMN/RhKKaSjiBXHEetA
 YGJzPkB7zlDMg0/RPHSuKDTI1hVoEq66QYuC3TppsqQeMUItO+FvE+yMOmIX+KH91rnXr7wGPhE
 BBTWi/gkERbl7DvY=
X-Received: by 2002:a17:906:4f19:: with SMTP id
 t25mr32733885eju.176.1634036363537; 
 Tue, 12 Oct 2021 03:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQTIqJd3/yZC6/XjUn0xcIpBiK06YOZVFL/e6pmLD+W+HY36Dw3o7mT6tbinWNuswKySCrUQ==
X-Received: by 2002:a17:906:4f19:: with SMTP id
 t25mr32733854eju.176.1634036363253; 
 Tue, 12 Oct 2021 03:59:23 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d30sm5808754edn.49.2021.10.12.03.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 03:59:22 -0700 (PDT)
Message-ID: <378c8641-c837-afe7-fabc-844f48cc3d13@redhat.com>
Date: Tue, 12 Oct 2021 12:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/6] monitor: numa support for 'info sgx' command
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20211011111554.12403-1-yang.zhong@intel.com>
 <20211011111554.12403-5-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211011111554.12403-5-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 13:15, Yang Zhong wrote:
> This patch can enable numa support for 'info sgx' command
> in the monitor, which can show detailed SGX EPC sections
> info.
> 
> (qemu) info sgx
>   SGX support: enabled
>   SGX1 support: enabled
>   SGX2 support: enabled
>   FLC support: enabled
>   SECTION #0: size=67108864
>   SECTION #1: size=29360128
> 
>   The QMP interface show:
>   (QEMU) query-sgx
>   {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
>   [{"index": 0, "size": 67108864}, {"index": 1, "size": 29360128}], "flc": true}}
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>   hw/i386/sgx.c         | 25 +++++++++++++++++++++++--
>   target/i386/monitor.c | 11 +++++++++--
>   2 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index 906facb645..8af45925c6 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -126,6 +126,28 @@ SGXInfo *sgx_get_capabilities(Error **errp)
>       return info;
>   }
>   
> +static SGXEPCSectionList *sgx_get_epc_sections_list(void)
> +{
> +    GSList *device_list = sgx_epc_get_device_list();
> +    SGXEPCSectionList *head = NULL, **tail = &head;
> +    SGXEPCSection *section;
> +    uint64_t i = 0;
> +
> +    for (; device_list; device_list = device_list->next) {
> +        DeviceState *dev = device_list->data;
> +        Object *obj = OBJECT(dev);
> +
> +        section = g_new0(SGXEPCSection, 1);
> +        section->index = i++;
> +        section->size = object_property_get_uint(obj, SGX_EPC_SIZE_PROP,
> +                                                 &error_abort);
> +        QAPI_LIST_APPEND(tail, section);
> +    }
> +    g_slist_free(device_list);
> +
> +    return head;
> +}
> +
>   SGXInfo *sgx_get_info(Error **errp)
>   {
>       SGXInfo *info = NULL;
> @@ -144,14 +166,13 @@ SGXInfo *sgx_get_info(Error **errp)
>           return NULL;
>       }
>   
> -    SGXEPCState *sgx_epc = &pcms->sgx_epc;
>       info = g_new0(SGXInfo, 1);
>   
>       info->sgx = true;
>       info->sgx1 = true;
>       info->sgx2 = true;
>       info->flc = true;
> -    info->section_size = sgx_epc->size;
> +    info->sections = sgx_get_epc_sections_list();
>   
>       return info;
>   }
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 196c1c9e77..08e7d4a425 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -773,6 +773,7 @@ SGXInfo *qmp_query_sgx(Error **errp)
>   void hmp_info_sgx(Monitor *mon, const QDict *qdict)
>   {
>       Error *err = NULL;
> +    SGXEPCSectionList *section_list, *section;
>       g_autoptr(SGXInfo) info = qmp_query_sgx(&err);
>   
>       if (err) {
> @@ -787,8 +788,14 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
>                      info->sgx2 ? "enabled" : "disabled");
>       monitor_printf(mon, "FLC support: %s\n",
>                      info->flc ? "enabled" : "disabled");
> -    monitor_printf(mon, "size: %" PRIu64 "\n",
> -                   info->section_size);
> +
> +    section_list = info->sections;
> +    for (section = section_list; section; section = section->next) {
> +        monitor_printf(mon, "SECTION #%" PRId64 ": ",
> +                       section->value->index);
> +        monitor_printf(mon, "size=%" PRIu64 "\n",
> +                       section->value->size);
> +    }
>   }
>   
>   SGXInfo *qmp_query_sgx_capabilities(Error **errp)
> 

This needs to be squashed in the previous patch.

Paolo


