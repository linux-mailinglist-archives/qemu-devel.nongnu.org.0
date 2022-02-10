Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E94B09FE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 10:52:11 +0100 (CET)
Received: from localhost ([::1]:55328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI67U-0006De-UL
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 04:52:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nI633-0004YU-79
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:47:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nI630-0007r1-UA
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 04:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644486450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kMtjl5mr2zHFie8ZK+tUcLjFlwfAM5RViG25PxeyBuU=;
 b=FG2i95NjaMGhRfWXzxFzeRDcyJsm2WVcXRF0qcTZTvIF+VvbbC8ukV4WvPkoeaXk38rgZ3
 ohB+xbHHp30UHwRp/25latSdsGwzvvtsZ6oQ4pyHA8yIIRmrKPy+yEZB1phfj5RWsApaUB
 wkdAeqKFkBJ0HsbnOJ0rmhek4tqN6Tc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-RsZigoeeMgqK3LSoPjJNUA-1; Thu, 10 Feb 2022 04:47:28 -0500
X-MC-Unique: RsZigoeeMgqK3LSoPjJNUA-1
Received: by mail-pj1-f69.google.com with SMTP id
 bj11-20020a17090b088b00b001b8ba3e7ce7so5850254pjb.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 01:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kMtjl5mr2zHFie8ZK+tUcLjFlwfAM5RViG25PxeyBuU=;
 b=D0XSg1tuyaD1R2nt9E7wCupMO7icKF3se/HmlAOp7l4qUVYnmNdq4DQwK4wSBmIEEx
 u/G5Oz64ZerftpmJCb8cL4Z0jGplEdHYz7G9PVqE+wKV0T5OIXXpCZBGFY08XekCk0HY
 QYZxSLJCOGT41tq7WDAt7u0homauogxXKPl6HYwxZqtDm5xZ9EwW7objkgRCL1XciUkx
 J/O3s71GEelKX7Zxha69nOReaHMpxCIs40c0dDigC6km5QrfVnZCSnHKkibBJzgEcH8k
 Gn8DOWq6NayoeMILLpTr3GQ1OVtJLNWvGtJ+hclGzFDRfURyt6SHOLqZDA7s/K+ZR6SY
 D6Mg==
X-Gm-Message-State: AOAM530GRZjxXhqX5LbmMqeG4r5XDTMvi2L0dcbmv24NHcW3J1mndip/
 qFeIqmjJ58jSnSfrguCTTCyQyOh+BE08qkeZxewMCQ7WEPNVHN4FE0iM1u5KlX2KOOgZ1XiSdxU
 4Jmfcei8iMpbl7QI=
X-Received: by 2002:a17:90b:701:: with SMTP id s1mr1893145pjz.60.1644486447494; 
 Thu, 10 Feb 2022 01:47:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYokmZSXOIhiaKqe7RxD6juAiBUdqHgHghdh60pCMrrIBddW+o1QriGf9wKnn5xdtG9AjqsQ==
X-Received: by 2002:a17:90b:701:: with SMTP id s1mr1893131pjz.60.1644486447217; 
 Thu, 10 Feb 2022 01:47:27 -0800 (PST)
Received: from xz-m1.local ([94.177.118.72])
 by smtp.gmail.com with ESMTPSA id f30sm8595421pgf.7.2022.02.10.01.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 01:47:26 -0800 (PST)
Date: Thu, 10 Feb 2022 17:47:22 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/2] intel-iommu: block output address in interrupt
 address range
Message-ID: <YgTfKsgeEWGXYHZm@xz-m1.local>
References: <20220210092815.45174-1-jasowang@redhat.com>
 <20220210092815.45174-2-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220210092815.45174-2-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Feb 10, 2022 at 05:28:15PM +0800, Jason Wang wrote:
> According to vtd spec v3.3 3.14:
> 
> """
> Software must not program paging-structure entries to remap any
> address to the interrupt address range. Untranslated requests and
> translation requests that result in an address in the interrupt range
> will be blocked with condition code LGN.4 or SGN.8.
> """
> 
> This patch blocks the request that result in interrupt address range.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


