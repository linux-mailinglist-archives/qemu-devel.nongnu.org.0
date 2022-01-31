Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6534A3F33
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:27:06 +0100 (CET)
Received: from localhost ([::1]:40386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESxl-0007gS-IV
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEStt-0005l4-Dj
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:23:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEStr-0006Rh-6m
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643620980;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VUMuO3Dv3dHoMDbGoqzB+eMpwnB9U5H9gTggytAFnHU=;
 b=JZRzoSl5fVpdYIfVXy2flyWOnL5TFDioRIiuHVQKtIX2kRblXwOqBjgFSZIRU3/CP9Atea
 cxex1HgXjkeW14X7thFo28T6NCMtBxCzFFIHGp8wbAXHiW/m5Q608Bo4oweM3/YAwo8ZBw
 EYceP5xwfz+/A86kOJyVYZtvY0oH1dg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-DqSbBuDgP0OZTzg2UGRlUw-1; Mon, 31 Jan 2022 04:22:58 -0500
X-MC-Unique: DqSbBuDgP0OZTzg2UGRlUw-1
Received: by mail-wr1-f71.google.com with SMTP id
 x4-20020adfbb44000000b001d83e815683so4542499wrg.8
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 01:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=VUMuO3Dv3dHoMDbGoqzB+eMpwnB9U5H9gTggytAFnHU=;
 b=NJcbe6hinmnoYGnrZkbv4SNbSWi7kTnSdSvEUEQ7+s8TkpPSpGhd/8ut/Q3OSSgN9W
 keQ/k+CYELas7A6nPJ9lyNAdWjFdkL71toyb5PULcABWDI3U3NTImhUVfjMWizzhjJSU
 Kt17whaLTJD4jbiZjVImlw4GgcHHlBBM4pydNszxvPPDkfZA0gMc0nnhf0XGgxI8VUNW
 6LtEBKzahK4VWcULLBqjhthmXdHEMT9XI4PueAZSordUATM0L/Ii+OXo1i4KrUWqsWPU
 j5SbESX8PX5Jl1yCGYG+ffJeuruu79CjpZME+T6vGiBMZKqReDc+/GwSzMDhRTNNsg1Q
 y1Fw==
X-Gm-Message-State: AOAM533cZUuoswyUbLFcPgcTKYqAo18fSbdw4JZFyqRa2ArkZbo5t2my
 QFZoN7Vt6OJYQC/tCuPACX6qiSTBW3AQWmC5C5+qsC5/iwSjF3P8Biq32h++HXrKQB5lTiA3al9
 1r1r9vSZ+MhLip4c=
X-Received: by 2002:a5d:64af:: with SMTP id m15mr16739309wrp.92.1643620977273; 
 Mon, 31 Jan 2022 01:22:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWp8KM9Ha44A/vJ1bw5kVeZJ1TdYzfprDD8dqUn7UHnOP66wBoCUYV30hyqc7Ne0HPW/t85A==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr16739286wrp.92.1643620977061; 
 Mon, 31 Jan 2022 01:22:57 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id n10sm13820055wrf.96.2022.01.31.01.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 01:22:56 -0800 (PST)
Subject: Re: [PATCH v2 3/4] virtio-iommu: Support bypass domain
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-4-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <bf447d9b-c039-ccdc-f24f-ab8b56c1b196@redhat.com>
Date: Mon, 31 Jan 2022 10:22:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220127142940.671333-4-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 1/27/22 3:29 PM, Jean-Philippe Brucker wrote:
> The driver can create a bypass domain by passing the
> VIRTIO_IOMMU_ATTACH_F_BYPASS flag on the ATTACH request. Bypass domains
> perform slightly better than domains with identity mappings since they
> skip translation.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/virtio/virtio-iommu.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index ec02029bb6..a112428c65 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -43,6 +43,7 @@
>  
>  typedef struct VirtIOIOMMUDomain {
>      uint32_t id;
> +    bool bypass;
I am afraid this will break the migration if you don't change
vmstate_domain.

See static const VMStateDescription vmstate_domain.
Also you need to migrate the new bypass field.

Logically we should handle this with a vmstate subsection I think to
handle migration of older devices. However I doubt the device has been
used in production environment supporting migration so my guess is we
may skip that burden and just add the missing field. Adding Juan, Dave &
Peter for advices.

Thanks

Eric

>      GTree *mappings;
>      QLIST_HEAD(, VirtIOIOMMUEndpoint) endpoint_list;
>  } VirtIOIOMMUDomain;
> @@ -258,12 +259,16 @@ static void virtio_iommu_put_endpoint(gpointer data)
>  }
>  
>  static VirtIOIOMMUDomain *virtio_iommu_get_domain(VirtIOIOMMU *s,
> -                                                  uint32_t domain_id)
> +                                                  uint32_t domain_id,
> +                                                  bool bypass)
>  {
>      VirtIOIOMMUDomain *domain;
>  
>      domain = g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
>      if (domain) {
> +        if (domain->bypass != bypass) {
> +            return NULL;
> +        }
>          return domain;
>      }
>      domain = g_malloc0(sizeof(*domain));
> @@ -271,6 +276,7 @@ static VirtIOIOMMUDomain *virtio_iommu_get_domain(VirtIOIOMMU *s,
>      domain->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
>                                     NULL, (GDestroyNotify)g_free,
>                                     (GDestroyNotify)g_free);
> +    domain->bypass = bypass;
>      g_tree_insert(s->domains, GUINT_TO_POINTER(domain_id), domain);
>      QLIST_INIT(&domain->endpoint_list);
>      trace_virtio_iommu_get_domain(domain_id);
> @@ -334,11 +340,16 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>  {
>      uint32_t domain_id = le32_to_cpu(req->domain);
>      uint32_t ep_id = le32_to_cpu(req->endpoint);
> +    uint32_t flags = le32_to_cpu(req->flags);
>      VirtIOIOMMUDomain *domain;
>      VirtIOIOMMUEndpoint *ep;
>  
>      trace_virtio_iommu_attach(domain_id, ep_id);
>  
> +    if (flags & ~VIRTIO_IOMMU_ATTACH_F_BYPASS) {
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
> +
>      ep = virtio_iommu_get_endpoint(s, ep_id);
>      if (!ep) {
>          return VIRTIO_IOMMU_S_NOENT;
> @@ -356,7 +367,12 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>          }
>      }
>  
> -    domain = virtio_iommu_get_domain(s, domain_id);
> +    domain = virtio_iommu_get_domain(s, domain_id,
> +                                     flags & VIRTIO_IOMMU_ATTACH_F_BYPASS);
> +    if (!domain) {
> +        /* Incompatible bypass flag */
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
>      QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
>  
>      ep->domain = domain;
> @@ -419,6 +435,10 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
>          return VIRTIO_IOMMU_S_NOENT;
>      }
>  
> +    if (domain->bypass) {
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
> +
>      interval = g_malloc0(sizeof(*interval));
>  
>      interval->low = virt_start;
> @@ -464,6 +484,11 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>      if (!domain) {
>          return VIRTIO_IOMMU_S_NOENT;
>      }
> +
> +    if (domain->bypass) {
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
> +
>      interval.low = virt_start;
>      interval.high = virt_end;
>  
> @@ -780,6 +805,9 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              entry.perm = flag;
>          }
>          goto unlock;
> +    } else if (ep->domain->bypass) {
> +        entry.perm = flag;
> +        goto unlock;
>      }
>  
>      found = g_tree_lookup_extended(ep->domain->mappings, (gpointer)(&interval),


