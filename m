Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBEB554BF5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 15:59:36 +0200 (CEST)
Received: from localhost ([::1]:54418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o40tK-00057e-7q
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 09:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1o40sK-0004Ar-A0
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 09:58:32 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1o40sI-0000qL-GM
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 09:58:31 -0400
Received: by mail-ej1-x62e.google.com with SMTP id cw10so10714103ejb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Sevq3SC5xYAArbklGC1y031cIzTVPOX0TQIf5PL3t8g=;
 b=qbgRVg/jyCyMyjTqWleYDxk4R/rB+bKQIUCaY/qRiDFr6iBYsookeqqUfDotg32Ej1
 0+O4U6hCifEgw3PklZctqseOuGbOaCnV3IuWNRwDBRmUitg+GLMBLRN3BZr+69LOEC8S
 dQAd9EkpLWBolYnSLLih+qtbrrowkwTbKub8mMSjbp2Nq6xM6AkmuzDrDhAqRAyEEsbq
 arcRyud14g1R09G6H3p7a92EQcei7DA6vlydtdE9pzwZttlLLFQHALVHN+mm7iSL18il
 lKrpR6c8K8awbhBSzaASgpa5TU32sS7XWZwoLRAsth5Y4W22Ifl6n/P4r3GB4ae5FHzL
 MHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sevq3SC5xYAArbklGC1y031cIzTVPOX0TQIf5PL3t8g=;
 b=juElIWHJH3hlL82/xYhuJ02s871AUFoIJMjVkD4X4JJ7kGZcPSopvL73uCVxyL2mIH
 rsku0Tw1JLU0t9nWMxUPc2fel1m4qaHzaFsaklBhBmAFNZH4H/9FFGg0X4rmmquBsWDT
 ipJyg2phk8dTgQTRCBElw+zOVzoRdlgs2xs9+VZXG0JhmqKJc2KmHhHITOKsmsE6s5qa
 NVimL0W6SNhJraB+8yfVhI+YnUo0ckDzzShzjzXoUx1TeBxSPiq+FXN7Rs0YfjDXZI7H
 fvBNLUMDUJiU1TPxN38YERWVL3PR76OYbmsXo+h90YaNDFroyvsjLeL0nDyYXv07vUgZ
 n2Rg==
X-Gm-Message-State: AJIora+O/Njrqx68ZpjdPFUwAS3iKdzcaemUfdGi53OzKsxD3qTmV0it
 h7ledlr4otgiyHCqTPPvT91IMw==
X-Google-Smtp-Source: AGRyM1vs/kJtGFR8jYIonG49P2NPIMjUUoV6bXUH3nZzpI62MuSbnsurTvcyxlQmJ+qZCf8X9gb8HQ==
X-Received: by 2002:a17:907:8a03:b0:711:f3c3:71a6 with SMTP id
 sc3-20020a1709078a0300b00711f3c371a6mr3380941ejc.659.1655906308694; 
 Wed, 22 Jun 2022 06:58:28 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 c1-20020a17090618a100b006fea2705d18sm9353742ejf.210.2022.06.22.06.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 06:58:28 -0700 (PDT)
Date: Wed, 22 Jun 2022 14:58:04 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 mst@redhat.com
Subject: Re: [PATCH v2] virtio-iommu: Fix the partial copy of probe request
Message-ID: <YrMf7I8mFGVyt9fS@myrica>
References: <20220617062024.3168331-1-zhenzhong.duan@intel.com>
 <0f4f26de-1402-5c3a-9903-389fef9b234f@redhat.com>
 <YrMDMzfXAiEgFU+d@myrica>
 <5471e06f-b1f2-d582-3558-b775af72a0fd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5471e06f-b1f2-d582-3558-b775af72a0fd@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x62e.google.com
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

On Wed, Jun 22, 2022 at 02:22:18PM +0200, Eric Auger wrote:
> >> the spec is pretty confusing here though (virtio-v1.2-csd01.pdf) as it
> >> presents the struct as follows:
> >>
> >> struct virtio_iommu_req_probe {
> >> struct virtio_iommu_req_head head;
> >> /* Device-readable */
> >> le32 endpoint;
> >> u8 reserved[64];
> >>
> >> /* Device-writable */
> >> u8 properties[probe_size];
> >> struct virtio_iommu_req_tail tail;
> >> };
> > Hm, which part is confusing?  Yes it's not valid C since probe_size is
> > defined dynamically ('probe_size' in the device config), but I thought it
> > would be nicer to show the whole request layout this way. Besides, at
> > least virtio-blk and virtio-scsi have similar variable-sized arrays in
> > their definitions
> the fact "struct virtio_iommu_req_tail tail;" was part of the
> 
> virtio_iommu_req_probe struct

Right, it would have been better to use a different name than
virtio_iommu_req_probe in virtio_iommu.h, to make the pitfall clear.

The larger problem is using C structs across the virtio spec instead of an
abstract format. Someone implementing the device in another language would
already not encounter this problem since they would read the spec as an
abstract format. For documentation purposes I do prefer displaying the
whole struct like this rather than working around limitations of C, which
may be more confusing.


> >>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> >>> index 7c122ab95780..195f909620ab 100644
> >>> --- a/hw/virtio/virtio-iommu.c
> >>> +++ b/hw/virtio/virtio-iommu.c
> >>> @@ -708,7 +708,8 @@ static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
> >>>                                       uint8_t *buf)
> >>>  {
> >>>      struct virtio_iommu_req_probe req;
> >>> -    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req));
> >>> +    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req,
> >>> +                    sizeof(req) + sizeof(struct virtio_iommu_req_tail));
> > Not sure this is correct, because what we are doing here is reading the
> > device-readable part of the property from the request. That part is only
> > composed of fields 'head', 'endpoint' and 'reserved[64]' and its size is
> > indeed sizeof(struct virtio_iommu_req_probe).
> >
> > The 'properties' and 'tail' fields shouldn't be read by the device here,
> > they are instead written later. It is virtio_iommu_handle_command() that
> > copies both of them into the request:
> >
> >             output_size = s->config.probe_size + sizeof(tail);
> >             buf = g_malloc0(output_size);
> >
> >             ptail = (struct virtio_iommu_req_tail *)
> >                         (buf + s->config.probe_size);
> >             ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
> > 	    // and virtio_iommu_probe() fills 'properties' as needed
> > 	    ...
> >
> > 	// then copy the lot
> >         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
> >                           buf ? buf : &tail, output_size);
> >
> > So I think the current code is correct, as all fields are accounted for
> 
> In virtio_iommu_iov_to_req(), payload_sz is computed as
> 
> payload_sz = req_sz - sizeof(struct virtio_iommu_req_tail);
> 
> sz = iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
> 
> This works for other command structs but not for probe one.

Aah right sorry. The resulting code may be less confusing if we moved
"- sizeof(struct virtio_iommu_req_tail)" to virtio_iommu_handle_req()

Thanks,
Jean

