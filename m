Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6BA671B72
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:05:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7B6-0004QO-5x; Wed, 18 Jan 2023 07:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pI7AX-0003mT-85
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:03:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pI7AQ-0005mU-JP
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674043382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/isF+wR1nVg7pAhmrjupLml0IEUQOe56DRoCvQfgkMI=;
 b=bgA8pTz83b2V0f2b6UUaGNMlWc8iFFozzzmWwSXjz2e+UWlOn1XbUSnS0U5qrLRQzgjlis
 6zTuE1aqlsNxdqC7PPunes/yPGZ+NjNqZoROQhUCKQX3mgQwbmaN0+/oL3X/ntEgkc9eq5
 vjRZ+UdyRUlyVQMOi7qoDyxLTE83cvo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-pNo1Y_VjOde3oGpce67AcQ-1; Wed, 18 Jan 2023 07:03:00 -0500
X-MC-Unique: pNo1Y_VjOde3oGpce67AcQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 q19-20020a1cf313000000b003d96c95e2f9so454716wmq.2
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 04:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/isF+wR1nVg7pAhmrjupLml0IEUQOe56DRoCvQfgkMI=;
 b=k47b0SasLSYoFKUVJKJWx9Y9eA44OrniZ/3XuEYcNfRVJnPOkIikY8F53NsT2nBtoX
 AXjENpSNsTwqIS5YryOs6JSWUkK3w8bDxsgYctcZqbBV0Z4EPLz9bC7NCRqFRo+jFXT/
 J+0B7O6QirfbEvI3BmNgJhwtSx5dtPBLG3jimAUJLlkVuaUeh942OvURgSjGcNrEgMbU
 zIXG5vZ3M6KZycaFevKDXRlSSbd7rJswrdkGa74mLbbIUgX4HxPLT3GS3PFwWoCXNod2
 NE3KWh5r96ql8NDJvcaiKtFNRYtWl1HMp9GFeHr2E4Xlo2obcQ5OOaaUqZmRGyXkMz/0
 CraA==
X-Gm-Message-State: AFqh2kotbXd7C0i2XBOzG/pNvrolqgiVCeHMmzcuA88nUyG/o91AUq7C
 06n5TvhYibYWVsewBAp7dxjFg6JPmKy0VVLzWNL+H8ZqcERfBl5o4ou5DWNmhbDKjxkzMuNUd4e
 9G101L+3CR07q9+g=
X-Received: by 2002:a05:600c:3b82:b0:3d3:5d0f:6dfc with SMTP id
 n2-20020a05600c3b8200b003d35d0f6dfcmr6308118wms.30.1674043379825; 
 Wed, 18 Jan 2023 04:02:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu2/UNRfKuBCTjUn5dqMjnPooSefO6k7DRSowT7AwBbUPZhXJ8VDZRz1h4Aj88V/QqaJCiEng==
X-Received: by 2002:a05:600c:3b82:b0:3d3:5d0f:6dfc with SMTP id
 n2-20020a05600c3b8200b003d35d0f6dfcmr6308106wms.30.1674043379664; 
 Wed, 18 Jan 2023 04:02:59 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 fk6-20020a05600c0cc600b003c6b70a4d69sm1731872wmb.42.2023.01.18.04.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 04:02:59 -0800 (PST)
Date: Wed, 18 Jan 2023 12:02:57 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 03/21] physmem: Add qemu_ram_is_hugetlb()
Message-ID: <Y8ff8ewUInIocSTt@work-vm>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-4-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117220914.2062125-4-peterx@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Xu (peterx@redhat.com) wrote:
> Returns true for a hugetlbfs mapping, false otherwise.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yeh OK, it feels a little delecate perhaps if anything else
ever allows large mappings.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/exec/cpu-common.h | 1 +
>  softmmu/physmem.c         | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 6feaa40ca7..94452aa17f 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -95,6 +95,7 @@ void qemu_ram_unset_migratable(RAMBlock *rb);
>  int qemu_ram_get_fd(RAMBlock *rb);
>  
>  size_t qemu_ram_pagesize(RAMBlock *block);
> +bool qemu_ram_is_hugetlb(RAMBlock *rb);
>  size_t qemu_ram_pagesize_largest(void);
>  
>  /**
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index edec095c7a..a4fb129d8f 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1798,6 +1798,11 @@ size_t qemu_ram_pagesize(RAMBlock *rb)
>      return rb->page_size;
>  }
>  
> +bool qemu_ram_is_hugetlb(RAMBlock *rb)
> +{
> +    return rb->page_size > qemu_real_host_page_size();
> +}
> +
>  /* Returns the largest size of page in use */
>  size_t qemu_ram_pagesize_largest(void)
>  {
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


