Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC6462033
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 20:17:25 +0100 (CET)
Received: from localhost ([::1]:37500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrm9T-0008NJ-Vt
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 14:17:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mrm55-0005oc-Rz
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:12:51 -0500
Received: from [2a00:1450:4864:20::42d] (port=36480
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mrm54-0000nt-D2
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:12:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s13so39158905wrb.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 11:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VM06La+s5knpETvIftGngzAapB5VSNhHkJN6TLThw1w=;
 b=ZCguBFfgjxj4Ot2JN3BDdhVA3HtjLDcEqk0rUrApwasHqX58CucS91bq7undOCtNEd
 f2gb+F4+rFV3kEPckVg4QoZWXr3XbxD51R9zmG+lYQU1YGhePKR7TQFhM0kIfUshN3eQ
 dQufpgsoPc5s2ystdGxtt2XwRd4wCSaRn/F/t2m0kqavY7135bFFuvNEjz2+x3u6eMqx
 G3nPDNKGFCkM2yZaqtCAfljeHn9rh1GPmgDzvR8EXPc9BnZU+vwZFc7SdX34axfk2xwM
 33RDmu40U4aDVxcJYJ6f7zZ/VRS2dAzAF8/tSpQ9QiAGvlAjC5zM11S7nSJveHI0Vw9D
 GQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VM06La+s5knpETvIftGngzAapB5VSNhHkJN6TLThw1w=;
 b=ff5WGNQBRXXHMA+LQsiTGifYMcSmoeivP3yYfeMuh9xkAImO1LbrT62WBx9gSVmPFR
 fDhwfx+fmz76/1s7PnEg/G9hof5tDBalygC8R+mRG05oPzhZ5rzthydz1w+aPPflcW8O
 CIcVJd0bpE9x7dTA6NH+nHDj4dTIU2JjMzdDaP7XKp6kJQup1ayd7sTJOxTe6plwN0B1
 Y9B8QPObZIFJEQB8FOeDPBsHXWu+lrYT5dDgFc5/JUPSxA5s7HkqRnp7OHQruG1Nfh8u
 F49Cvp9qKa/5AmHa3F8Vn3fMeBJYVAUW8SJ+9qN2nB0e41WqKaGMC8NyBsarMx7KiyZa
 5NnA==
X-Gm-Message-State: AOAM531HrWYiJvy2NS8xJvNCsVasDjh7LdNIxXvCt6cV7Rl+tTk+qucX
 vGjGh4Budb797zCFd3U7kA/v/A==
X-Google-Smtp-Source: ABdhPJxAJkBkSellGHmePYF3nXG+OKFqQ56M9gD5x0nhACbXTbJMDdW81Nv4US7wRzO1DWUeGiRAPQ==
X-Received: by 2002:adf:f542:: with SMTP id j2mr35506201wrp.616.1638213169203; 
 Mon, 29 Nov 2021 11:12:49 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id s8sm14646788wro.19.2021.11.29.11.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 11:12:48 -0800 (PST)
Date: Mon, 29 Nov 2021 19:12:26 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v6 3/4] virtio-iommu: Fix the domain_range end
Message-ID: <YaUmGvfuOFbIDlUp@myrica>
References: <20211127072910.1261824-1-eric.auger@redhat.com>
 <20211127072910.1261824-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127072910.1261824-4-eric.auger@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 27, 2021 at 08:29:09AM +0100, Eric Auger wrote:
> in old times the domain range was defined by a domain_bits le32.
> This was then converted into a domain_range struct. During the
> upgrade the original value of '32' (bits) has been kept while
> the end field now is the max value of the domain id (UINT32_MAX).
> Fix that and also use UINT64_MAX for the input_range.end.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/virtio/virtio-iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 30ee09187b8..aa9c16a17b1 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -978,8 +978,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      s->event_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE, NULL);
>  
>      s->config.page_size_mask = TARGET_PAGE_MASK;
> -    s->config.input_range.end = -1UL;
> -    s->config.domain_range.end = 32;
> +    s->config.input_range.end = UINT64_MAX;
> +    s->config.domain_range.end = UINT32_MAX;
>      s->config.probe_size = VIOMMU_PROBE_SIZE;
>  
>      virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
> -- 
> 2.26.3
> 

