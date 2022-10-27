Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5533160FA85
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:37:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3zi-0006fi-OR; Thu, 27 Oct 2022 10:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oo3yr-000556-MM
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:35:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oo3yq-0003m9-41
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666881331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MLqnpIPxEKxLLJj68XhbmT5hGlUNKCSvofIXVWR2Z3A=;
 b=ekOYRbNmug42xHymbbUaE3L408wEunwaseaj1TCVFISSKrKE1zqTeQuT9oXP7gW0OEUhQ8
 w4tHFi7Waabb8SQRpTr/pTRmLlI0RbplhhAcRdDwp8b7ttHK1ECvRuBLwXFh6gm4Tw4DHk
 U1RxYD1T5LHBrUJa9pi/73+mjbIIarg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118-k-3PJ2y_OOKaoG17qrIOdw-1; Thu, 27 Oct 2022 10:35:28 -0400
X-MC-Unique: k-3PJ2y_OOKaoG17qrIOdw-1
Received: by mail-qt1-f200.google.com with SMTP id
 cp8-20020a05622a420800b003a4f4f7b621so1289741qtb.6
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 07:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MLqnpIPxEKxLLJj68XhbmT5hGlUNKCSvofIXVWR2Z3A=;
 b=r3Zxo7wyyeq1ugFV9MHxn2Ueo+qktDCHA4yOaAnP9+Vsd7qWZ+8l8VUN/oV/BIbVaJ
 I5YR1toq5UfCNAj2E1VzywCYFxRGueWd7jT/RAbxF/NXeSR9ulAKHQNdZb0JR8XyCyMB
 RCS4VXJQVCotdqTppQLqUAOlPPxOVblEDJzGZVElllrJtfzV/RZxXL0ZXp64DCfxHO3f
 EEiEX2x1CUebAFqTg7tgRZH3Pzmdn7PQ71K3wId+bhlhkgbffBHc1DXgf6pxY7qG8G7c
 uUgCt6MpujNaL/e4Mc9CMIO4ISsQcRcet7Ggt1z9E9+XEowQlXR7EJ2aE9vxJzZukb6d
 JawQ==
X-Gm-Message-State: ACrzQf3UYJnWY6xDGV1VFjwINxOtTq2ryiK/86i7WSZYnU8Ra24Jp4H4
 GQd934mssB08rSK7eCjZSf/RomcNHIAcYo6A6bDDHGDvij3MMD8zqa+0ygtHT7dojhM+O7FUXvM
 p9RqbU8ZuA6jgMQ8=
X-Received: by 2002:a05:620a:448e:b0:6ce:8dd2:bc46 with SMTP id
 x14-20020a05620a448e00b006ce8dd2bc46mr35914696qkp.705.1666881328332; 
 Thu, 27 Oct 2022 07:35:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Uzcx7offmG8QxX9P8oMg/eQDjtojH+FvsonzNk34WU7yulwYIdtOPXa4Lub3RH+E1CunoUQ==
X-Received: by 2002:a05:620a:448e:b0:6ce:8dd2:bc46 with SMTP id
 x14-20020a05620a448e00b006ce8dd2bc46mr35914674qkp.705.1666881328110; 
 Thu, 27 Oct 2022 07:35:28 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05620a28cd00b006f8665f483fsm1082234qkp.85.2022.10.27.07.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:35:27 -0700 (PDT)
Date: Thu, 27 Oct 2022 10:35:26 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com, eperezma@redhat.com, lulu@redhat.com
Subject: Re: [PATCH V4 0/4] PASID support for Intel IOMMU
Message-ID: <Y1qXLtXnAwjN87wF@x1n>
References: <20221027075042.16894-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221027075042.16894-1-jasowang@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 03:50:38PM +0800, Jason Wang wrote:
> Hi All:
> 
> This series tries to introduce PASID support for Intel IOMMU. The work
> is based on the previous scalabe mode support by implement the
> ECAP_PASID. A new "x-pasid-mode" is introduced to enable this
> mode. All internal vIOMMU codes were extended to support PASID instead
> of the current RID2PASID method. The code is also capable of
> provisiong address space with PASID. Note that no devices can issue
> PASID DMA right now, this needs future work.
> 
> This will be used for prototying PASID based device like virtio or
> future vPASID support for Intel IOMMU.
> 
> Test has been done with the Linux guest with scalalbe mode enabled and
> disabled. A virtio prototype[1][2] that can issue PAISD based DMA
> request were also tested, different PASID were used in TX and RX in
> those testing drivers.
> 
> Changes since V3:
> 
> - rearrange the member for vtd_iotlb_key structure
> - reorder the pasid parameter ahead of addr for vtd_lookup_iotlb()
> - allow access size from 1 to 8 for vtd_mem_ir_fault_ops

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


