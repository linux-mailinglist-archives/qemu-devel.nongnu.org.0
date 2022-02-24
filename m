Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572324C31B2
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 17:41:46 +0100 (CET)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNHBZ-0007II-7E
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 11:41:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNH6U-0002Qb-Kz
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:36:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNH6P-0008MO-EC
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645720584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrrMlUlnhjOd5GuhhCfY++aG1rzAgrXz7r0N+ZjHFUA=;
 b=ax8mSMPMSJF3Ej+SJVmVAfux8KAfTbfvUOHx0HjN9dcFRmFfGQmYzPVP79PlmE2ddTwNXq
 H1o0ubFeBQUN+NHmnw7nqE0e4OpJFXai75gfM9YHusQHTdGAiqqvE0sZkvQsUqf01KKg+T
 7WMX1Uwi6cMDRt2pL/LMeeYDngqnYTA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-_M6D285VPq2TAYhfRuY5YA-1; Thu, 24 Feb 2022 11:36:23 -0500
X-MC-Unique: _M6D285VPq2TAYhfRuY5YA-1
Received: by mail-wm1-f69.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso1803312wmz.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 08:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SrrMlUlnhjOd5GuhhCfY++aG1rzAgrXz7r0N+ZjHFUA=;
 b=0/HOW6zhH8cwnRPF3mRR0WI02cmjLSx07fQoAskVsu6chuLauVCt/Qyh18+l/91D+v
 ZR/kjAVcOvFuQGQ0ceOgl84gq/FZnwusSffYDaIKpgPZoD6tYtKkoAVHHkmwpI9s4EI8
 6NquvnoTQ/ZAXBnFInbQN69ppMgjamc/1pBJ80FKOxLfTDxdXJKks1JKU++S49TfQ4mG
 xg+p3T8pOScuaVTQcjDJGgbOTIj/h9CGI19Fb598AABkLVOGcap5T/BjmLdMif6A+KEk
 UfE4fFpH8m/TueAyjXf5bFHu33OE2tG1mcoM0GnxJKbVGCdWapOZ6BnlxgKJImOhbLJ7
 9hwg==
X-Gm-Message-State: AOAM530DzaBJ1wFmZfxmr+m689KvYePTlkM4Yr50SZ23+va87movwoJV
 c0BgsVt7GCWKftOGeuqoMoI21OUeUYAoWthWX7TFDe25P/zF8ur1T1fev8q8h9V1nrsbXajCfrV
 MNwuHSYgqpdxQjp4=
X-Received: by 2002:a5d:6f0e:0:b0:1ed:aedf:d61d with SMTP id
 ay14-20020a5d6f0e000000b001edaedfd61dmr2896333wrb.311.1645720582138; 
 Thu, 24 Feb 2022 08:36:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfKFYbsglLSNRd9eYqrMjxbIqqx6PLnRaVb4osKlWA7bGN4NKd3rjL/x1NbvrDdZf9NdCwtg==
X-Received: by 2002:a5d:6f0e:0:b0:1ed:aedf:d61d with SMTP id
 ay14-20020a5d6f0e000000b001edaedfd61dmr2896310wrb.311.1645720581760; 
 Thu, 24 Feb 2022 08:36:21 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id l12sm3480457wrs.11.2022.02.24.08.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 08:36:21 -0800 (PST)
Message-ID: <403906ee-3a91-bc9d-4a60-bf6fc7d1b8ba@redhat.com>
Date: Thu, 24 Feb 2022 17:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/4] hyperv: SControl is optional to enable SynIc
To: Jon Doron <arilou@gmail.com>, qemu-devel@nongnu.org
References: <20220216102500.692781-1-arilou@gmail.com>
 <20220216102500.692781-2-arilou@gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220216102500.692781-2-arilou@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 16/02/2022 11:24, Jon Doron wrote:
> SynIc can be enabled regardless of the SControl mechanisim which can
> register a GSI for a given SintRoute.
> 
> This behaviour can achived by setting enabling SIMP and then the guest
> will poll on the message slot.
> 
> Once there is another message pending the host will set the message slot
> with the pending flag.
> When the guest polls from the message slot, in case the pending flag is
> set it will write to the HV_X64_MSR_EOM indicating it has cleared the
> slot and we can try and push our message again.
> 
> Signed-off-by: Jon Doron <arilou@gmail.com>
> ---
>  hw/hyperv/hyperv.c | 109 +++++++++++++++++++++++++++++++--------------
>  1 file changed, 76 insertions(+), 33 deletions(-)
> 
> diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
> index cb1074f234..aaba6b4901 100644
> --- a/hw/hyperv/hyperv.c
> +++ b/hw/hyperv/hyperv.c
> @@ -27,13 +27,16 @@ struct SynICState {
>  
>      CPUState *cs;
>  
> -    bool enabled;
> +    bool sctl_enabled;
>      hwaddr msg_page_addr;
>      hwaddr event_page_addr;
>      MemoryRegion msg_page_mr;
>      MemoryRegion event_page_mr;
>      struct hyperv_message_page *msg_page;
>      struct hyperv_event_flags_page *event_page;
> +
> +    QemuMutex sint_routes_mutex;
> +    QLIST_HEAD(, HvSintRoute) sint_routes;
>  };
>  
>  #define TYPE_SYNIC "hyperv-synic"
> @@ -51,11 +54,11 @@ static SynICState *get_synic(CPUState *cs)
>      return SYNIC(object_resolve_path_component(OBJECT(cs), "synic"));
>  }
>  
> -static void synic_update(SynICState *synic, bool enable,
> +static void synic_update(SynICState *synic, bool sctl_enable,
>                           hwaddr msg_page_addr, hwaddr event_page_addr)
>  {
>  
> -    synic->enabled = enable;
> +    synic->sctl_enabled = sctl_enable;
>      if (synic->msg_page_addr != msg_page_addr) {
>          if (synic->msg_page_addr) {
>              memory_region_del_subregion(get_system_memory(),
> @@ -80,7 +83,7 @@ static void synic_update(SynICState *synic, bool enable,
>      }
>  }
>  
> -void hyperv_synic_update(CPUState *cs, bool enable,
> +void hyperv_synic_update(CPUState *cs, bool sctl_enable,
>                           hwaddr msg_page_addr, hwaddr event_page_addr)
>  {
>      SynICState *synic = get_synic(cs);
> @@ -89,7 +92,7 @@ void hyperv_synic_update(CPUState *cs, bool enable,
>          return;
>      }
>  
> -    synic_update(synic, enable, msg_page_addr, event_page_addr);
> +    synic_update(synic, sctl_enable, msg_page_addr, event_page_addr);
>  }
>  
>  static void synic_realize(DeviceState *dev, Error **errp)
> @@ -110,16 +113,20 @@ static void synic_realize(DeviceState *dev, Error **errp)
>                             sizeof(*synic->event_page), &error_abort);
>      synic->msg_page = memory_region_get_ram_ptr(&synic->msg_page_mr);
>      synic->event_page = memory_region_get_ram_ptr(&synic->event_page_mr);
> +    qemu_mutex_init(&synic->sint_routes_mutex);
> +    QLIST_INIT(&synic->sint_routes);
>  
>      g_free(msgp_name);
>      g_free(eventp_name);
>  }
> +
>  static void synic_reset(DeviceState *dev)
>  {
>      SynICState *synic = SYNIC(dev);
>      memset(synic->msg_page, 0, sizeof(*synic->msg_page));
>      memset(synic->event_page, 0, sizeof(*synic->event_page));
>      synic_update(synic, false, 0, 0);
> +    assert(QLIST_EMPTY(&synic->sint_routes));
>  }
>  
>  static void synic_class_init(ObjectClass *klass, void *data)
> @@ -214,6 +221,7 @@ struct HvSintRoute {
>      HvSintStagedMessage *staged_msg;
>  
>      unsigned refcount;
> +    QLIST_ENTRY(HvSintRoute) link;
>  };
>  
>  static CPUState *hyperv_find_vcpu(uint32_t vp_index)
> @@ -259,7 +267,7 @@ static void cpu_post_msg(CPUState *cs, run_on_cpu_data data)
>  
>      assert(staged_msg->state == HV_STAGED_MSG_BUSY);
>  
> -    if (!synic->enabled || !synic->msg_page_addr) {
> +    if (!synic->msg_page_addr) {
>          staged_msg->status = -ENXIO;
>          goto posted;
>      }
> @@ -343,7 +351,7 @@ int hyperv_set_event_flag(HvSintRoute *sint_route, unsigned eventno)
>      if (eventno > HV_EVENT_FLAGS_COUNT) {
>          return -EINVAL;
>      }
> -    if (!synic->enabled || !synic->event_page_addr) {
> +    if (!synic->sctl_enabled || !synic->event_page_addr) {
>          return -ENXIO;
>      }
>  
> @@ -364,11 +372,12 @@ int hyperv_set_event_flag(HvSintRoute *sint_route, unsigned eventno)
>  HvSintRoute *hyperv_sint_route_new(uint32_t vp_index, uint32_t sint,
>                                     HvSintMsgCb cb, void *cb_data)
>  {
> -    HvSintRoute *sint_route;
> -    EventNotifier *ack_notifier;
> +    HvSintRoute *sint_route = NULL;
> +    EventNotifier *ack_notifier = NULL;
>      int r, gsi;
>      CPUState *cs;
>      SynICState *synic;
> +    bool ack_event_initialized = false;
>  
>      cs = hyperv_find_vcpu(vp_index);
>      if (!cs) {
> @@ -381,57 +390,77 @@ HvSintRoute *hyperv_sint_route_new(uint32_t vp_index, uint32_t sint,
>      }
>  
>      sint_route = g_new0(HvSintRoute, 1);
> -    r = event_notifier_init(&sint_route->sint_set_notifier, false);
> -    if (r) {
> -        goto err;
> +    if (!sint_route) {
> +        return NULL;
>      }
>  
> +    sint_route->synic = synic;
> +    sint_route->sint = sint;
> +    sint_route->refcount = 1;
>  
>      ack_notifier = cb ? &sint_route->sint_ack_notifier : NULL;
>      if (ack_notifier) {
>          sint_route->staged_msg = g_new0(HvSintStagedMessage, 1);
> +        if (!sint_route->staged_msg) {
> +            goto cleanup_err_sint;
> +        }
>          sint_route->staged_msg->cb = cb;
>          sint_route->staged_msg->cb_data = cb_data;
>  
>          r = event_notifier_init(ack_notifier, false);
>          if (r) {
> -            goto err_sint_set_notifier;
> +            goto cleanup_err_sint;
>          }
> -
>          event_notifier_set_handler(ack_notifier, sint_ack_handler);
> +        ack_event_initialized = true;
> +    }
> +
> +    /* See if we are done or we need to setup a GSI for this SintRoute */
> +    if (!synic->sctl_enabled) {
> +        goto cleanup;
> +    }
> +
> +    /* We need to setup a GSI for this SintRoute */
> +    r = event_notifier_init(&sint_route->sint_set_notifier, false);
> +    if (r) {
> +        goto cleanup_err_sint;
>      }
>  
>      gsi = kvm_irqchip_add_hv_sint_route(kvm_state, vp_index, sint);
>      if (gsi < 0) {
> -        goto err_gsi;
> +        goto cleanup_err_sint_notifier;
>      }
>  
>      r = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
>                                             &sint_route->sint_set_notifier,
>                                             ack_notifier, gsi);
>      if (r) {
> -        goto err_irqfd;
> +        goto cleanup_err_irqfd;
>      }
>      sint_route->gsi = gsi;
> -    sint_route->synic = synic;
> -    sint_route->sint = sint;
> -    sint_route->refcount = 1;
> -
> +cleanup:
> +    qemu_mutex_lock(&synic->sint_routes_mutex);
> +    QLIST_INSERT_HEAD_RCU(&synic->sint_routes, sint_route, link);
> +    qemu_mutex_unlock(&synic->sint_routes_mutex);
>      return sint_route;
>  
> -err_irqfd:
> +cleanup_err_irqfd:
>      kvm_irqchip_release_virq(kvm_state, gsi);
> -err_gsi:
> +
> +cleanup_err_sint_notifier:
> +    event_notifier_cleanup(&sint_route->sint_set_notifier);
> +
> +cleanup_err_sint:
>      if (ack_notifier) {
> -        event_notifier_set_handler(ack_notifier, NULL);
> -        event_notifier_cleanup(ack_notifier);
> +        if (ack_event_initialized) {
> +            event_notifier_set_handler(ack_notifier, NULL);
> +            event_notifier_cleanup(ack_notifier);
> +        }
> +
>          g_free(sint_route->staged_msg);
>      }
> -err_sint_set_notifier:
> -    event_notifier_cleanup(&sint_route->sint_set_notifier);
> -err:
> -    g_free(sint_route);
>  
> +    g_free(sint_route);
>      return NULL;
>  }
>  
> @@ -442,6 +471,8 @@ void hyperv_sint_route_ref(HvSintRoute *sint_route)
>  
>  void hyperv_sint_route_unref(HvSintRoute *sint_route)
>  {
> +    SynICState *synic;
> +
>      if (!sint_route) {
>          return;
>      }
> @@ -452,21 +483,33 @@ void hyperv_sint_route_unref(HvSintRoute *sint_route)
>          return;
>      }
>  
> -    kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
> -                                          &sint_route->sint_set_notifier,
> -                                          sint_route->gsi);
> -    kvm_irqchip_release_virq(kvm_state, sint_route->gsi);
> +    synic = sint_route->synic;
> +    qemu_mutex_lock(&synic->sint_routes_mutex);
> +    QLIST_REMOVE_RCU(sint_route, link);
> +    qemu_mutex_unlock(&synic->sint_routes_mutex);
> +
> +    if (sint_route->gsi) {
> +        kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
> +                                              &sint_route->sint_set_notifier,
> +                                              sint_route->gsi);
> +        kvm_irqchip_release_virq(kvm_state, sint_route->gsi);
> +        event_notifier_cleanup(&sint_route->sint_set_notifier);
> +    }
> +
>      if (sint_route->staged_msg) {
>          event_notifier_set_handler(&sint_route->sint_ack_notifier, NULL);
>          event_notifier_cleanup(&sint_route->sint_ack_notifier);
>          g_free(sint_route->staged_msg);
>      }
> -    event_notifier_cleanup(&sint_route->sint_set_notifier);
>      g_free(sint_route);
>  }
>  
>  int hyperv_sint_route_set_sint(HvSintRoute *sint_route)
>  {
> +    if (!sint_route->gsi) {
> +        return 0;
> +    }
> +
>      return event_notifier_set(&sint_route->sint_set_notifier);
>  }
>  
> 

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


