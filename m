Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DDE4DD544
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 08:33:08 +0100 (CET)
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV76g-00087U-BZ
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 03:33:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nV73r-0006bz-KR
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 03:30:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nV73q-00035e-70
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 03:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647588609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1TDz5Txlj5fJXoLxpG7mW/TvtAGaWw8N8Sr+5JR2UQg=;
 b=VjUDQj/mzbtlbP2PF8xUrtKKZDByOIugR+Ea9VNbPnQzwYUDT/i2grdFbPhE/PhB7/TM0n
 PEPNKkMdAJtucQ53RVO96HjGOdxvWIWcJ3nX2EPK0GcddfXaq8F5kf12Prx6ZkCXVgVDAJ
 4ADKc1ZypU8hAb+5qfaLH5rse3p757k=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-b6YB4XYYOLWopR2Um6ojOQ-1; Fri, 18 Mar 2022 03:30:07 -0400
X-MC-Unique: b6YB4XYYOLWopR2Um6ojOQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 ob7-20020a17090b390700b001c692ec6de4so2200606pjb.7
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 00:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1TDz5Txlj5fJXoLxpG7mW/TvtAGaWw8N8Sr+5JR2UQg=;
 b=fbhOdP7JaxwoXDqjRvgYxAkoz8C/Lk6F3BJQFUO9T1zlOMpHevM3vQTi24yyhlvG6g
 bZw1R7Bjwc+h7xQkYJ/W9JOlhcoipDhgbnpBrhX1hAE44PhnGs6lF7NaC38srAc28+gw
 LtRQdA9k1dU2XSm3uqh1Mr4kX6GJ31g7UM7sT44fcGhSAm1gT0Hvdd3OJhpPq846JKYO
 GeeO/vjFUaqrV7JnsGXkOdBQO/ZD8IakOaszZ2aDcO3GZh5VQ2UIsfQh9yVUarW/KBr7
 82aGMZiKl2hcmZhU3OH25eTIgYkbPSg+8hZ6y22McHE13oH44YNIV9XxYDPtuMUWqnba
 E31Q==
X-Gm-Message-State: AOAM530bRsGAFarCfAAD1fmmleX3q8qRar073xxFEBCYp6IOGBICmT9y
 xweUBi6h+Xvbml0IfTVehOyC82bYzjyYposunrmn6Udd5iZwuXxn6U3Qty3Eb1Z/4R/dv0hUPsc
 BT/mRwSqD0GxvLCA=
X-Received: by 2002:a63:2a8b:0:b0:380:b9e1:afe7 with SMTP id
 q133-20020a632a8b000000b00380b9e1afe7mr6746837pgq.5.1647588606508; 
 Fri, 18 Mar 2022 00:30:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJJUAyaONQw9nnD77oSz07wlqUQMLIX62JQJdzBfcXrmm5IEJo7YJGquf6f7NTZqeNfdFTIQ==
X-Received: by 2002:a63:2a8b:0:b0:380:b9e1:afe7 with SMTP id
 q133-20020a632a8b000000b00380b9e1afe7mr6746815pgq.5.1647588606188; 
 Fri, 18 Mar 2022 00:30:06 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.138])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a056a00248e00b004f77e0fbfc0sm8919482pfv.185.2022.03.18.00.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 00:30:05 -0700 (PDT)
Date: Fri, 18 Mar 2022 15:30:02 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/2] intel-iommu: update iq_dw during post load
Message-ID: <YjQ0+jY0Q6YjAOVS@xz-m1.local>
References: <20220317080522.14621-1-jasowang@redhat.com>
 <20220317080522.14621-2-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220317080522.14621-2-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 04:05:22PM +0800, Jason Wang wrote:
> We need to update iq_dw according to the DMA_IRQ_REG during post
> load. Otherwise we may get wrong IOTLB invalidation descriptor after
> migration.
> 
> Fixes: fb43cf739e ("intel_iommu: scalable mode emulation")
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


