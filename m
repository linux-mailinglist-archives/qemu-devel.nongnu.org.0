Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A133252D0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:57:32 +0100 (CET)
Received: from localhost ([::1]:41618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFJ1A-00011A-10
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lFJ0A-0000To-Up
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:56:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lFJ09-0001Mp-Db
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614268588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hpQPOnB6Md6K9kFbFsiD78ry0yvucg4/u1aMCB3awsE=;
 b=dehLlYDkj5hgWtgKMjG7Te1ADvf+XHj5XODmiDfqaB5fCyKJ90otfGdZ0b5pKTvfUWk5VA
 /4vvuGJOdyRQOD/qL0ox9JZCJr053VZimeYSa2q8TASR9mm+xFn3ppFzWFBGzisWTCIhMB
 ulSkOrHbbXGPx3Jtsh3s47rLT8Thx9o=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-OxcC1HrFMS2HWBWL34t5mA-1; Thu, 25 Feb 2021 10:56:25 -0500
X-MC-Unique: OxcC1HrFMS2HWBWL34t5mA-1
Received: by mail-qk1-f200.google.com with SMTP id t6so631116qkt.14
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 07:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hpQPOnB6Md6K9kFbFsiD78ry0yvucg4/u1aMCB3awsE=;
 b=ZwnSPHFufowSwTdPDumdw+dejahpaUSD/Tn7b5XmhsW01xhPpPPO6sSnFpeRd9qgDl
 t8pr38KbM0PZ5Rr8C/9aB/8S67FpQKblBIqqEKt4cDODC8ywSTRM7nRlpLYLotadF7RX
 v7EUo+gOh9eRR+FmvWNE5tpBMPrIKqxt9BMKj6dtlzFmjFjfqIw0HbrGsjIc1k3jG2Mo
 LMcWSobHZXcMiXYQpkou3KSDaN05L3IAk4QzsX3A6jimOYqmLQu4J8HUyz69P9Gm5c7w
 O8mrH12pIUhpQPMeSVL48jB1IlNBJShhaLTiZomUeLFZkdy9irDWub2CxDJ8AV/XvOLB
 wdPw==
X-Gm-Message-State: AOAM532jWWuKZm/0mQDZcNN+9tKnaoN7i+CLRDrSUffdBSlJZVub4qk9
 9cg5kUH/tvN57fLYqt+k5ukBEgElv9wiaf7dt+NmSMVmXDC2vBspi7nSyWP2qHMVVRNj5F+hthX
 FQlNhJDVE4uBdMJ8=
X-Received: by 2002:a05:620a:4055:: with SMTP id
 i21mr3288778qko.55.1614268585268; 
 Thu, 25 Feb 2021 07:56:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQUDZPz3PzX0bdMCPoCURmAsbYIiVlLIr7taT6pigIF9SmeVGScP0njHapb3Wg8+wn4UDZwQ==
X-Received: by 2002:a05:620a:4055:: with SMTP id
 i21mr3288761qko.55.1614268585001; 
 Thu, 25 Feb 2021 07:56:25 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id s4sm1065277qtw.24.2021.02.25.07.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 07:56:24 -0800 (PST)
Date: Thu, 25 Feb 2021 10:56:23 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/7] dma: Introduce dma_aligned_pow2_mask()
Message-ID: <20210225155623.GB250483@xz-x1>
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210225091435.644762-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
 vivek.gautam@arm.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 10:14:30AM +0100, Eric Auger wrote:
> @@ -296,4 +296,7 @@ uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg);
>  void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
>                      QEMUSGList *sg, enum BlockAcctType type);
>  
> +uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end,
> +                               int max_addr_bits);
> +
>  #endif
> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 29001b5459..7d766a5e89 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -330,3 +330,29 @@ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
>  {
>      block_acct_start(blk_get_stats(blk), cookie, sg->size, type);
>  }
> +
> +uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end, int max_addr_bits)

Nitpick: If to make it a common function, shall we comment the interface to
avoid misusing it? E.g., start/end seem to be inclusive. Also, max_addr_bits
should be <=64 (and we can also assert in the code, maybe?).

> +{
> +    uint64_t max_mask = UINT64_MAX, addr_mask = end - start;
> +    uint64_t alignment_mask, size_mask;
> +
> +    if (max_addr_bits != 64) {
> +        max_mask = (1ULL << max_addr_bits) - 1;
> +    }
> +
> +    alignment_mask = start ? (start & -start) - 1 : max_mask;
> +    alignment_mask = MIN(alignment_mask, max_mask);
> +    size_mask = MIN(addr_mask, max_mask);
> +
> +    if (alignment_mask <= size_mask) {
> +        /* Increase the alignment of start */
> +        return alignment_mask;
> +    } else {
> +        /* Find the largest page mask from size */
> +        if (addr_mask == UINT64_MAX) {
> +            return UINT64_MAX;
> +        }
> +        return (1ULL << (63 - clz64(addr_mask + 1))) - 1;
> +    }
> +}
> +

In all cases, the code looks right to me:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


