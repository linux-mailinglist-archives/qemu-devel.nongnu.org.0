Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A097B5575DA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 10:47:49 +0200 (CEST)
Received: from localhost ([::1]:37016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4IVA-0007cH-FF
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 04:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1o4IRV-0005mz-9G
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:44:01 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1o4IRT-0006eL-GI
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:44:00 -0400
Received: by mail-ed1-x529.google.com with SMTP id c65so4448248edf.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G1LL0vSNcHJ+vG6Vuey1vAbmnHdEEIGndkwIyb1z+ko=;
 b=WD9BZnh3nGMpVB5ENIyxeYr3pP0/ekdTP1xyMMax5kQfnLAJv5FoVAaQRW0UXPB4JO
 ZOiizQfpj91rVf/NeTybkKl997k0qcUFyIuTfFA/fOLJxyFuT0VD/7DoSeOmA1URGxWR
 IZ5cRfUxqlsVH9AEdrcpBx312QlBj5BdUFmLSkdGG3vc/TuBFH/6TN0PSFIRBNGENOKJ
 PX90lYdYAinC2u72xfHzzNNnaVVT0umcuhJx1KOC+sQFDJ8Y5XJJmskoAxvNNPbFY1kF
 EwGwlmBO559AwppoFr6wgDoQtwScFVxYKiFoooEgfAlmcyShwZ0+J6qg9Lu63D+mUK69
 cM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G1LL0vSNcHJ+vG6Vuey1vAbmnHdEEIGndkwIyb1z+ko=;
 b=V7Re48fc5l54Wwv84q2PY/0Vfds6LQOXvlMJ11fENRnoM7N9bHafJpCDyj2mYBEmCP
 ejg6BOqaNOc4TZ//d3fkIsQW02K3w8GfBYXkJ0HPX461qXyQJi+uRaH9CRA3lAkHUnAZ
 i9coJCBEYhOyRqcDxoPiRcYsmy8WIJ7xy/Cl4yyC/YEKgl35UEHnsF9v4EHOveW39sHc
 hpAB7Fho0Rxdd5wbWZ3+NfBhwzfF0qvI04YTrPsf7TlwMuiUijHCvkhft4al1yXcXkO3
 gJGSDNjuBLsrqeMFUel4JLoWO5OuhFjSqfABEyz2ogs0Gleu4RwQx36JGJllnr13cAZo
 pecA==
X-Gm-Message-State: AJIora+Nfvhb5lFB7SKaMOdw/7r6P37ty52Zj0dEZ9ux7h2aaBWKU2FC
 QkpTnqsy9r/msx9eBGLSPXsltQ==
X-Google-Smtp-Source: AGRyM1u8nlDXXKm5YmmyW3TNXYfEiNitWkaA8R/3QJOYnoKTarWNwhZgB/PAJRgXuNUPqWWmzvZ33Q==
X-Received: by 2002:a50:ed85:0:b0:435:6586:4b06 with SMTP id
 h5-20020a50ed85000000b0043565864b06mr9194463edr.315.1655973837894; 
 Thu, 23 Jun 2022 01:43:57 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 b23-20020aa7df97000000b004357ab9cfb1sm10210324edy.26.2022.06.23.01.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 01:43:57 -0700 (PDT)
Date: Thu, 23 Jun 2022 09:43:34 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, mst@redhat.com
Subject: Re: [PATCH v3] virtio-iommu: Fix the partial copy of probe request
Message-ID: <YrQntq/V6rQP9IED@myrica>
References: <20220623023152.3473231-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623023152.3473231-1-zhenzhong.duan@intel.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 23, 2022 at 10:31:52AM +0800, Zhenzhong Duan wrote:
> The structure of probe request doesn't include the tail, this leads
> to a few field missed to be copied. Currently this isn't an issue as
> those missed field belong to reserved field, just in case reserved
> field will be used in the future.
> 
> Changed 4th parameter of virtio_iommu_iov_to_req() to receive size
> of device-readable part.
> 
> Fixes: 1733eebb9e75b ("virtio-iommu: Implement RESV_MEM probe request")
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  v3: moved "- sizeof(struct virtio_iommu_req_tail)" to virtio_iommu_handle_req() per Jean
>  v2: keep bugfix change and drop cleanup change
> 
>  hw/virtio/virtio-iommu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 7c122ab95780..08b227e828f8 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -675,11 +675,10 @@ static int virtio_iommu_probe(VirtIOIOMMU *s,
>  
>  static int virtio_iommu_iov_to_req(struct iovec *iov,
>                                     unsigned int iov_cnt,
> -                                   void *req, size_t req_sz)
> +                                   void *req, size_t payload_sz)
>  {
> -    size_t sz, payload_sz = req_sz - sizeof(struct virtio_iommu_req_tail);
> +    size_t sz = iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
>  
> -    sz = iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
>      if (unlikely(sz != payload_sz)) {
>          return VIRTIO_IOMMU_S_INVAL;
>      }
> @@ -692,7 +691,8 @@ static int virtio_iommu_handle_ ## __req(VirtIOIOMMU *s,                \
>                                           unsigned int iov_cnt)          \
>  {                                                                       \
>      struct virtio_iommu_req_ ## __req req;                              \
> -    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req)); \
> +    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req,               \
> +                    sizeof(req) - sizeof(struct virtio_iommu_req_tail));\
>                                                                          \
>      return ret ? ret : virtio_iommu_ ## __req(s, &req);                 \
>  }
> -- 
> 2.25.1
> 

