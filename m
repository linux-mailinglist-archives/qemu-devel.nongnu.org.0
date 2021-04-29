Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1E36E64B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:52:38 +0200 (CEST)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc1TR-0008SJ-9f
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc1SU-00080u-CC
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:51:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc1SP-0001El-G2
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619682691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=heO5W4cbihg1SmYjYVunw8HLQJ65Q7FWpRhEtNzao9M=;
 b=OnbDsjgrvKaZHcI7mNBpaqcwTXdf9nq734AYLgv80QTePmBGpn/no52kEz7H38MYvuYdOB
 jHmTVZ7vBLgzqyFAsnNZOhljuoZsXEGmKkROHXOPjXFRiL1mlGtadU5XKOHyKhhMru8kjO
 DhYwVVeDPZT07rBVE3xfvV2GKEWkIQ4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-uD_V98x1MX-jt1CI7_U3LA-1; Thu, 29 Apr 2021 03:51:29 -0400
X-MC-Unique: uD_V98x1MX-jt1CI7_U3LA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so21000680wrb.9
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=heO5W4cbihg1SmYjYVunw8HLQJ65Q7FWpRhEtNzao9M=;
 b=IK8YGWdSulHBeBVYJS0dkrcY0TTnqO2r/vh5JEpC6f59ujweAbRVTL7hf0BNqQ7tck
 j4JzbCQB4wdhDOjU2gopuzYitiJfWIa7Sov2/umIdGaqCrfNRCJU4Tzwx1ANRB38yaAH
 27yTK+04TdCZgBfcpMby09xeRbC/aAiO9s7mlHvqxiPu+x4A/VuVj3+aiOXvm9bBp239
 MJVh4+nCGGj0AFsQM2SSbV7r7vVtHOreEkx7t8lABRExLdqjDXc/P2mXxZRLor3E01dj
 1z9TODdgk4yfRhzp71S6LGWatXHxi4w7kxGjI/zuW37sNS1MGreYwVtgDX9dU7YBKhhj
 yzpA==
X-Gm-Message-State: AOAM531VAcbP1QViPuE9wfZYDe3yY8AnKLhKVLUaE0alpxBUgfpVhklO
 j00BpOA29K0prdYgJJRlV9rrbWsLxJAML54h89/M2Kh01adUahc7Gf8aebgxOQ0NBHTSDMIxtv0
 PwHt9WR24Rp29POE=
X-Received: by 2002:a5d:4412:: with SMTP id z18mr27212583wrq.103.1619682688732; 
 Thu, 29 Apr 2021 00:51:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEgqoTuL31rrzT+X/kWc3AONI0XCtCEM4VGuTcwxyAV6XQH14Tm8lXiVLqycU+zNHj0kduxw==
X-Received: by 2002:a5d:4412:: with SMTP id z18mr27212554wrq.103.1619682688410; 
 Thu, 29 Apr 2021 00:51:28 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 x8sm3526294wru.70.2021.04.29.00.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:51:28 -0700 (PDT)
Subject: Re: [PATCH v1] vhost-vdpa: Set discarding of RAM broken when
 initializing the backend
To: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
References: <20210302162129.52912-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d82faa0d-d3cf-9a68-3793-fdc66224c185@redhat.com>
Date: Thu, 29 Apr 2021 09:51:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210302162129.52912-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.03.21 17:21, David Hildenbrand wrote:
> Similar to VFIO, vDPA will go ahead an map+pin all guest memory. Memory
> that used to be discarded will get re-populated and if we
> discard+re-access memory after mapping+pinning, the pages mapped into the
> vDPA IOMMU will go out of sync with the actual pages mapped into the user
> space page tables.
> 
> Set discarding of RAM broken such that:
> - virtio-mem and vhost-vdpa run mutually exclusive
> - virtio-balloon is inhibited and no memory discards will get issued
> 
> In the future, we might be able to support coordinated discarding of RAM
> as used by virtio-mem and as planned for VFIO.
> 
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Cindy Lu <lulu@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
> 
> Note: I was not actually able to reproduce/test as I fail to get the
> vdpa_sim/vdpa_sim_net running on upstream Linux (whetever vdpa, vhost_vdpa,
> vdpa_sim, vdpa_sim_net modules I probe, and in which order, no vdpa devices
> appear under /sys/bus/vdpa/devices/ or /dev/).
> 
> ---
>   hw/virtio/vhost-vdpa.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 01d2101d09..86058d4041 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -278,6 +278,17 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
>       uint64_t features;
>       assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>       trace_vhost_vdpa_init(dev, opaque);
> +    int ret;
> +
> +    /*
> +     * Similar to VFIO, we end up pinning all guest memory and have to
> +     * disable discarding of RAM.
> +     */
> +    ret = ram_block_discard_disable(true);
> +    if (ret) {
> +        error_report("Cannot set discarding of RAM broken");
> +        return ret;
> +    }
>   
>       v = opaque;
>       v->dev = dev;
> @@ -302,6 +313,8 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>       memory_listener_unregister(&v->listener);
>   
>       dev->opaque = NULL;
> +    ram_block_discard_disable(false);
> +
>       return 0;
>   }
>   
> 

@MST, do you have this on your radar? thanks

-- 
Thanks,

David / dhildenb


