Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9195A3A6222
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:54:22 +0200 (CEST)
Received: from localhost ([::1]:41080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskEX-00081x-MN
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lskD6-0007M7-2h
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lskD2-0006lP-TO
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623667967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+kpYOSdeycA2nesfzD6KZF/Z7MRIV3vhA8R7fb4dTU=;
 b=H18Y3GVur+jTD4+HlBvXU7S6RJc7UvAxN4u0S5HC3zVQ4kT5CVdZt3IkU9Tf+02Myw41pv
 gnunez6r9XIuH6SsEKuqy/pkkBUcBmvb/fatWmXszAG6NF32fUnNAamcpn2gLy7v1cu2E5
 ITF5qaEn811IEZfA4jUdAZoI748EaRo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-4g_JWfx3NWmLFN5azS1ufQ-1; Mon, 14 Jun 2021 06:52:46 -0400
X-MC-Unique: 4g_JWfx3NWmLFN5azS1ufQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j6-20020a05600c1906b029019e9c982271so6549833wmq.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 03:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R+kpYOSdeycA2nesfzD6KZF/Z7MRIV3vhA8R7fb4dTU=;
 b=VKK9Z7uLGiOny7ohUlnkdtR1waAfF0bPnAF9GLqHvpaDjmqPZzDK/njHBQo+jl/c33
 yIgFGbyOnqEGq468UjcHXu6G+h4J/Npa1d4IY5JzGD4YZd5SnPPcxv0Pb1jtx7bFn7cL
 SI8pibkLxCU1OXARl9GNtoaFRV5siesDZd9HaAEQtUo+TPrcxSJRtFSUG2EIRE3yYEAs
 OzaD9el6M2qCPGbh3gZa816ZoSTNLxvUTcWSA2SXZXc/tJGhcGaIpHX5j8nT8IoJN2UA
 juzpNAXqYv694kiN8Olm6rXw5LzHzpopqm+5TrCaaK2J7+GZnqspcw3CtuO9Xc/k+yZO
 MOCg==
X-Gm-Message-State: AOAM533+sPuhkURf5QfGxXxXOa82wbVXxjmKmXA7M2a80SDhoQ+UhhZ7
 c3DCML5ej5FUHPni+yY5+eA6jyGClyAB2wYO4XQuadSIOFWcTwrWJZ4FeBHC44pzE/0mD8eVYaB
 k30Gk1Y2P2PoTnwA=
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr16373892wmj.119.1623667965278; 
 Mon, 14 Jun 2021 03:52:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIaL4Sh3MsXhHfcJGijS6NIXEWPgjgveiWTSfI/6g3+Ln4RB2jSoejluo2e7o8N5O8O37z9g==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr16373865wmj.119.1623667965098; 
 Mon, 14 Jun 2021 03:52:45 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g17sm19993782wrh.72.2021.06.14.03.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 03:52:44 -0700 (PDT)
Subject: Re: [RFC PATCH] hw/display/virtio-gpu: Fix memory leak (CID 1453811)
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, qemu-devel@nongnu.org
References: <20210531101928.1662732-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e69a7f99-7d35-12f8-21af-48cc95172e6d@redhat.com>
Date: Mon, 14 Jun 2021 12:52:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210531101928.1662732-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 5/31/21 12:19 PM, Philippe Mathieu-Daudé wrote:
> To avoid leaking memory on the error path, reorder the
> code as:
> - check the parameters first
> - check resource already existing
> - finally allocate memory
> 
> Reported-by: Coverity (CID 1453811: RESOURCE_LEAK)
> Fixes: e0933d91b1c ("virtio-gpu: Add virtio_gpu_resource_create_blob")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> RFC because the s->iov check is dubious.
> ---
>  hw/display/virtio-gpu.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 4d549377cbc..8d047007bbb 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -340,8 +340,15 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
>          return;
>      }
>  
> -    res = virtio_gpu_find_resource(g, cblob.resource_id);
> -    if (res) {
> +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_GUEST &&
> +        cblob.blob_flags != VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid memory type\n",
> +                      __func__);
> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
> +        return;
> +    }
> +
> +    if (virtio_gpu_find_resource(g, cblob.resource_id)) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
>                        __func__, cblob.resource_id);
>          cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> @@ -352,25 +359,12 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
>      res->resource_id = cblob.resource_id;
>      res->blob_size = cblob.size;
>  
> -    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_GUEST &&
> -        cblob.blob_flags != VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid memory type\n",
> -                      __func__);
> -        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
> -        g_free(res);
> -        return;
> -    }
> -
> -    if (res->iov) {
> -        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> -        return;
> -    }
> -
>      ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
>                                          cmd, &res->addrs, &res->iov,
>                                          &res->iov_cnt);
> -    if (ret != 0) {
> +    if (ret != 0 || res->iov) {
>          cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> +        g_free(res);
>          return;
>      }
>  
> 


