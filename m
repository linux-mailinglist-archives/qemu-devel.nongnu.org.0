Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7643A423E70
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:12:02 +0200 (CEST)
Received: from localhost ([::1]:60720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6iH-0006ZZ-3m
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mY6gq-0005Ra-Pq
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:10:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mY6gm-0000xx-7G
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633525826;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9voh/KcOwcEExQ1nJsQDviAGkaMicobNss0oMSxLNc=;
 b=RLgV6Mbd+Hc+K87BHjnK2sQQDhdUnUH7fuKz+gDqGPMPmx2TViJlVz2H+XUmF77T5JQ5aq
 jaOuVGQ5oyYC6mgYNke1CSbumDfaWm1qLhen+3hXPeBIZRWaOtn9XYkjmqXZUMrslfhAmy
 LBEMvyDOrcxuaib33sMNk+R5uOrkVnM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-56vkwetbOv6Wpe7Z4KUgIg-1; Wed, 06 Oct 2021 09:10:25 -0400
X-MC-Unique: 56vkwetbOv6Wpe7Z4KUgIg-1
Received: by mail-wr1-f72.google.com with SMTP id
 m17-20020adffa11000000b00160c1ac74e9so1996033wrr.9
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 06:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=q9voh/KcOwcEExQ1nJsQDviAGkaMicobNss0oMSxLNc=;
 b=eoX6aw1ucLLHbg6uitPYEbB9JG1IWS8kaAEDZpsqpx31W6lkT1ZY/7M5d7OXstoGc7
 qeAAG7NEs1mqiAw0GwpqgI803uAjtCScQLdQBKYFPJh7O70K8b2apKzMU3cg/1qkYA8S
 2JvdxYOk/aHnTH3dtHD5X+jOY9LxM+CtLPoAsHKOUIHduHZPZN2kv7HRrihtgYSRxmHE
 Af4lJL3pVhkBufEDagD2P3JnxzhpedsxS9wsc/8xuJabX/3TXQZ0BfD8uzii6I50pLRp
 tMqWBgdfduPXF5Xi/HwtFBX3YOHpkOP28ne8LuY4cH0x38oV3igDOoD92DCyaoFPxXaA
 r3BA==
X-Gm-Message-State: AOAM533Gt1dTFszPthShoE0QfsJOtQla0jKjUpnqIXtltFT9DL7z9mw5
 EGoLNxn4PZ7yWO0dvwF3f9uHWhTAK6zRTkyzDqzfRpEIqmTxP2q9W7RpXN/DzgDAAVWkwCxQCAz
 Ac8Rid6cgjlISp9w=
X-Received: by 2002:a1c:1dcb:: with SMTP id d194mr9434724wmd.161.1633525824575; 
 Wed, 06 Oct 2021 06:10:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKk8ZMd9Y94CALhG/xVfapKKIDwcQEEUGi6cas0mUWSudZjVnhCz2IPmgBh5j9OKutpCHUHQ==
X-Received: by 2002:a1c:1dcb:: with SMTP id d194mr9434699wmd.161.1633525824309; 
 Wed, 06 Oct 2021 06:10:24 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id l26sm5057254wmp.9.2021.10.06.06.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 06:10:23 -0700 (PDT)
Subject: Re: [PATCH 3/3] virtio-iommu: Support bypass domain
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210930185050.262759-1-jean-philippe@linaro.org>
 <20210930185050.262759-4-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <6efa6f64-d410-9732-15ba-7651c3e9fd76@redhat.com>
Date: Wed, 6 Oct 2021 15:10:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210930185050.262759-4-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi jean,

On 9/30/21 8:50 PM, Jean-Philippe Brucker wrote:
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
> index 82edeaa101..4f0207a3eb 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -42,6 +42,7 @@
>  
>  typedef struct VirtIOIOMMUDomain {
>      uint32_t id;
> +    bool bypass;
>      GTree *mappings;
>      QLIST_HEAD(, VirtIOIOMMUEndpoint) endpoint_list;
>  } VirtIOIOMMUDomain;
> @@ -257,12 +258,16 @@ static void virtio_iommu_put_endpoint(gpointer data)
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
> @@ -270,6 +275,7 @@ static VirtIOIOMMUDomain *virtio_iommu_get_domain(VirtIOIOMMU *s,
>      domain->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
>                                     NULL, (GDestroyNotify)g_free,
>                                     (GDestroyNotify)g_free);
> +    domain->bypass = bypass;
>      g_tree_insert(s->domains, GUINT_TO_POINTER(domain_id), domain);
>      QLIST_INIT(&domain->endpoint_list);
>      trace_virtio_iommu_get_domain(domain_id);
> @@ -333,11 +339,16 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
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
> @@ -355,7 +366,12 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>          }
>      }
>  
> -    domain = virtio_iommu_get_domain(s, domain_id);
> +    domain = virtio_iommu_get_domain(s, domain_id,
> +                                     flags & VIRTIO_IOMMU_ATTACH_F_BYPASS);
> +    if (!domain) {
> +        /* Incompatible flags */
Incompatible bypass flag
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
>      QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
>  
>      ep->domain = domain;
> @@ -418,6 +434,10 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
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
> @@ -463,6 +483,11 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
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
> @@ -779,6 +804,9 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              entry.perm = flag;
>          }
>          goto unlock;
> +    } else if (ep->domain->bypass) {
> +        entry.perm = flag;
> +        goto unlock;
>      }
>  
>      found = g_tree_lookup_extended(ep->domain->mappings, (gpointer)(&interval),
Otherwise looks good to me.

Eric


