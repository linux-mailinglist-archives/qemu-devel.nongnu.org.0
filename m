Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAE0655233
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 16:38:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8k6k-0005kY-Hp; Fri, 23 Dec 2022 10:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p8k6f-0005ja-3o
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:37:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p8k6d-0005ee-1s
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671809824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8hNqRsmbfnciSlPhxVlIJCOHfddUbto8FnBcD6Hbrng=;
 b=dZp7blqIqjPL9vovD0JmHIhQns3SFaJfwYVoxZQieHVJ/93YRduyIRaeKbZuo4SZNeuI5X
 t4J87A8cKOO5xPzU2PoGPA33qowFJsQmKxls5/epHmwl29VBx/m4kdV1dSJpfMLZt0T3hk
 jDGYm2EHtjgvzSIIgWw86afCEN5sF54=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-FjMCLHIHM9-fEhXKfoX8xQ-1; Fri, 23 Dec 2022 10:37:03 -0500
X-MC-Unique: FjMCLHIHM9-fEhXKfoX8xQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 k4-20020ac84784000000b003a96744cee6so2150710qtq.7
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 07:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8hNqRsmbfnciSlPhxVlIJCOHfddUbto8FnBcD6Hbrng=;
 b=vGC8ckcI1KN7xSfL0Czvwa+stDi+E9iqObWW73jIZHHBx2M9MOIFwzh4sXnh9SVDXu
 3EfzsbkzxmgPxMXQM7AvBgRcbqRzjuduWHKJtBDBpeXGmgD4r5xKwgmdmmahVtMZ1gq0
 7z2XkA49XmQzjZ+tnl+6oZ7BWp1UtzcLVIqVKEy8aKsNF7CRCgY0drfcpWRy7IyGVXXp
 QXShuQbHnYNgVQYCDbcgbTOxo+KvLlldIa0KQDxUarEdbKjS9gaiHbUuuzmZrFhGYjU0
 dpIT+wrNAWbhMhp6aeWz9FTYlmHPXvnt7TqrMLBijlREvEcY8ulK5WsEtedMWhqfY1Ra
 CnOg==
X-Gm-Message-State: AFqh2ko5RhmIGP/6dkZklhJ122ZHErhzYHEDTYjufySofJS783lcL5/E
 HyhPmnl8ViAy2tIGQOPq7HsDrhLR4PyUrJDgU0OMC/ZygJ7Flpe+BC8oI4krqoBagWWzXJ/pMqe
 POhrKzAsaUifwOgk=
X-Received: by 2002:ac8:4795:0:b0:3a6:a5c3:fd28 with SMTP id
 k21-20020ac84795000000b003a6a5c3fd28mr18386094qtq.35.1671809822736; 
 Fri, 23 Dec 2022 07:37:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsrqsCT2/MwP5G1vv5cZpKlrcWmboFhLU2LG7Gvu8eU1sz+m6A1W9oEeDg/EOdX23n62Vweeg==
X-Received: by 2002:ac8:4795:0:b0:3a6:a5c3:fd28 with SMTP id
 k21-20020ac84795000000b003a6a5c3fd28mr18386074qtq.35.1671809822469; 
 Fri, 23 Dec 2022 07:37:02 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca.
 [70.31.26.132]) by smtp.gmail.com with ESMTPSA id
 o6-20020ac872c6000000b003a57a317c17sm2097646qtp.74.2022.12.23.07.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 07:37:01 -0800 (PST)
Date: Fri, 23 Dec 2022 10:37:00 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
Message-ID: <Y6XLHFNqKzcXaeSD@x1n>
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Fri, Dec 23, 2022 at 10:23:06PM +0800, Chuang Xu wrote:
> Before using any flatview, sanity check we're not during a memory
> region transaction or the map can be invalid.
> 
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
> ---
>  include/exec/memory.h | 9 +++++++++
>  softmmu/memory.c      | 5 +++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 91f8a2395a..66c43b4862 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1069,8 +1069,17 @@ struct FlatView {
>      MemoryRegion *root;
>  };
>  
> +int memory_region_transaction_get_depth(void);
> +
>  static inline FlatView *address_space_to_flatview(AddressSpace *as)
>  {
> +    /*
> +     * Before using any flatview, sanity check we're not during a memory
> +     * region transaction or the map can be invalid.  Note that this can
> +     * also be called during commit phase of memory transaction, but that
> +     * should also only happen when the depth decreases to 0 first.

Nitpick: after adding the RCU check the comment may need slight touch up:

        * Meanwhile it's safe to access current_map with RCU read lock held
        * even if during a memory transaction.  It means the user can bear
        * with an obsolete map.

> +     */
> +    assert(memory_region_transaction_get_depth() == 0 || rcu_read_locked());
>      return qatomic_rcu_read(&as->current_map);
>  }
>  
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bc0be3f62c..01192e2e5b 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1116,6 +1116,11 @@ void memory_region_transaction_commit(void)
>     }
>  }
>  
> +int memory_region_transaction_get_depth(void)
> +{
> +    return memory_region_transaction_depth;
> +}
> +
>  static void memory_region_destructor_none(MemoryRegion *mr)
>  {
>  }
> -- 
> 2.20.1
> 

-- 
Peter Xu


