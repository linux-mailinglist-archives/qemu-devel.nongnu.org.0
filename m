Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1395575C6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 10:44:33 +0200 (CEST)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4IS0-0005Uk-PK
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 04:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1o4IP6-0003ms-My
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:41:32 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1o4IP4-0006RA-Vw
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:41:32 -0400
Received: by mail-wr1-x432.google.com with SMTP id o16so26875400wra.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4jW8j4N69H2ZjZlJjB5ufMjtW3EpLyV2huJcE2kkVDo=;
 b=qaLr+1mb+lSFOk4s/H+R/I7yo6ofduizsk9NcIL2eejIEzai+WskyLkjlVIonm08R+
 vFKg4bcdqV/m6qABD4vDjkOd4ZW1ialUUWhpIXdWm6MZ5Aol4N4rjT0vA9zgt/ZMfFFi
 /N6pcEn1uaxGHGBWJks87j7M/4QJEC5YXV0b++SLlFCWv/KsF434VssX+RXc4cvZ2lGe
 TDVR7EbWXRIT8FPh09cy3EFLWbN9LWclnYgSGwP6Odn1r0WSjA/pdezP+NUW+kVAYOIi
 YiLoyxoLZF9GiSHYGKVx7L1KwzI6KpZurBy/68fLWS8Ev4FLu4xFNqA+Lgu7xxQzMor2
 7uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4jW8j4N69H2ZjZlJjB5ufMjtW3EpLyV2huJcE2kkVDo=;
 b=yA6uRPqzr4zTZDaZhSCLx40y267zoW3IUnoNT/x/Izt59RfDhRFQx9+SP27UzKHy0l
 SFEgzn9wH6YeBb6FZY/IZsIKAnljCuBA5XGFIPDDn2brirCU9dCVKrxtxgi8jBzCmo+m
 homLKjj6cfyKCeynh8kjwr4XFyCVIavP4Nvkx+dgJToyDUrHrR00lT/HkmRCNb9MLYiw
 8da+BsKBqcda+RmgkoyF/IE14PN2ORwL+rMZNNuPLGofJD6TdpFBKrji0ae3gdWXI+Ox
 KT9e0k24WM1y9yIj9f8Ob2yFjgta6x7ChsU88efERl8a6MrqTaLgRnEbd6qXLb/wNlfY
 7dJQ==
X-Gm-Message-State: AJIora8Wd08aFsWtchSSQzjBsKcibH8fgm7lS5i40bI/Xi/fXxO4t+d4
 0qAID8aviSYuCk0Z9kwg6jC8xA==
X-Google-Smtp-Source: AGRyM1vm9a/MCYPbDxyjI8oTOp6gU9iaGMZEtB2f9yxL9nOpNFatAP9dv5cV7zapj+yO/hGwD7XZ1g==
X-Received: by 2002:a5d:67cf:0:b0:21b:9fb8:e6d6 with SMTP id
 n15-20020a5d67cf000000b0021b9fb8e6d6mr7053078wrw.205.1655973689323; 
 Thu, 23 Jun 2022 01:41:29 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 o21-20020a05600c2e1500b003a02b135747sm2094372wmf.46.2022.06.23.01.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 01:41:28 -0700 (PDT)
Date: Thu, 23 Jun 2022 09:41:05 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
Cc: Eric Auger <eric.auger@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Subject: Re: [PATCH v2] virtio-iommu: Fix the partial copy of probe request
Message-ID: <YrQnIfNpOIhmMPKS@myrica>
References: <20220617062024.3168331-1-zhenzhong.duan@intel.com>
 <0f4f26de-1402-5c3a-9903-389fef9b234f@redhat.com>
 <YrMDMzfXAiEgFU+d@myrica>
 <5471e06f-b1f2-d582-3558-b775af72a0fd@redhat.com>
 <YrMf7I8mFGVyt9fS@myrica>
 <MWHPR1101MB2110E6A7F68546E2232E5A5E92B59@MWHPR1101MB2110.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR1101MB2110E6A7F68546E2232E5A5E92B59@MWHPR1101MB2110.namprd11.prod.outlook.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x432.google.com
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

On Thu, Jun 23, 2022 at 01:40:58AM +0000, Duan, Zhenzhong wrote:
> 
> 
> >-----Original Message-----
> >From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >Sent: Wednesday, June 22, 2022 9:58 PM
> >To: Eric Auger <eric.auger@redhat.com>
> >Cc: Duan, Zhenzhong <zhenzhong.duan@intel.com>; qemu-
> >devel@nongnu.org; mst@redhat.com
> >Subject: Re: [PATCH v2] virtio-iommu: Fix the partial copy of probe request
> >
> >On Wed, Jun 22, 2022 at 02:22:18PM +0200, Eric Auger wrote:
> >> >> the spec is pretty confusing here though (virtio-v1.2-csd01.pdf) as
> >> >> it presents the struct as follows:
> >> >>
> >> >> struct virtio_iommu_req_probe {
> >> >> struct virtio_iommu_req_head head;
> >> >> /* Device-readable */
> >> >> le32 endpoint;
> >> >> u8 reserved[64];
> >> >>
> >> >> /* Device-writable */
> >> >> u8 properties[probe_size];
> >> >> struct virtio_iommu_req_tail tail;
> >> >> };
> >> > Hm, which part is confusing?  Yes it's not valid C since probe_size
> >> > is defined dynamically ('probe_size' in the device config), but I
> >> > thought it would be nicer to show the whole request layout this way.
> >> > Besides, at least virtio-blk and virtio-scsi have similar
> >> > variable-sized arrays in their definitions
> >> the fact "struct virtio_iommu_req_tail tail;" was part of the
> >>
> >> virtio_iommu_req_probe struct
> >
> >Right, it would have been better to use a different name than
> >virtio_iommu_req_probe in virtio_iommu.h, to make the pitfall clear.
> >
> Maybe virtio_iommu_req_probe_no_tail?

Yes, we can't change the probe struct anymore since it's API, but we could
use the no_tail prefix on future structs

Thanks,
Jean

