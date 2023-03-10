Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF0D6B4920
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 16:09:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paeM7-0008Rf-TB; Fri, 10 Mar 2023 10:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paeM3-0008OM-Uc
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:08:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paeM1-0008Fw-6b
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678460899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FqlOWDeVqgWm0xE3T/gn3gNCxuQ/ecMH2CjtJ0cAFTo=;
 b=K8jCga0aelvshjyVgeNuuaiytTyaKmyBEKgCZM7iabVj5cU/fKE0zwDtvSBCtteYKoSAMv
 dTm+2/vDlZ/H9sWrzSyFe8VvwbBQkJN9la6yuW41wvbi2crgdGBaXe34TO4bKqr7ds9m3g
 6qoCguzm5RDan7cyOnUJ8Bd/1difV6A=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-IpQAftrTM1mwz_cYfPqflg-1; Fri, 10 Mar 2023 10:08:17 -0500
X-MC-Unique: IpQAftrTM1mwz_cYfPqflg-1
Received: by mail-qk1-f198.google.com with SMTP id
 d10-20020a05620a240a00b0073baf1de8ebso3210285qkn.19
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 07:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678460895;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FqlOWDeVqgWm0xE3T/gn3gNCxuQ/ecMH2CjtJ0cAFTo=;
 b=t071Rk1DQQEhcz4M24F+QqZamxu3VR7R+CUh+Hk6VbFtZHjAIKPyD/un840qwld4mY
 KVE/HrDJLx8B9hoD5z4pMQkX4wepjh1uMCoZHlMKXvihxXlrGx9kpULCCdCuEuGMpLnp
 vuLLmO7M+wPRoNeJwu7xkO3ThbkAuJYxBtJa24bFuVzx8j4qftdKXc0rRK6Zeizyd7mA
 e4Tgo51dB+Nz81I0wHmG940ymdMDoVNvCEplF2H/5w9F+HaEqcrMRTxPCHSEZLj7e3/O
 9MfYBj78II4HFgm6LWZti+J9/eoh6qtm+bc8CBDbgJ6JwotK3Ne8NloKoak0RlwomgMb
 VXYw==
X-Gm-Message-State: AO0yUKWEobcFlCfJdCZ3x9qrgzjaOt+hf5kq1GMoZ2GsqsK8DM8T5Xqc
 JfMzzLRwI7RM6ygT/ELv+oEUMWl7/D27VWBJeG8JFJBlizDCx5/8YddP3Cbk2Ec4YMEvBwXYGf9
 uILOVg4d5IExY5AE=
X-Received: by 2002:a05:622a:282:b0:3c0:3e3e:2f96 with SMTP id
 z2-20020a05622a028200b003c03e3e2f96mr12147501qtw.2.1678460895287; 
 Fri, 10 Mar 2023 07:08:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8+ovLMAPBYHWP51TF3SZ5gnLQWxSldKMvHUTBl1ySZ1LFsNHomvwlhz4eZ4Ev332oH3dXBfQ==
X-Received: by 2002:a05:622a:282:b0:3c0:3e3e:2f96 with SMTP id
 z2-20020a05622a028200b003c03e3e2f96mr12147465qtw.2.1678460894953; 
 Fri, 10 Mar 2023 07:08:14 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 n80-20020a374053000000b00741a984943fsm1500037qka.40.2023.03.10.07.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 07:08:14 -0800 (PST)
Date: Fri, 10 Mar 2023 10:08:13 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH v7 6/6] memory: Introduce address_space_to_flatview_rcu()
Message-ID: <ZAtH3XgTtqwTpcOS@x1n>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
 <20230310022425.2992472-7-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230310022425.2992472-7-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Fri, Mar 10, 2023 at 10:24:25AM +0800, Chuang Xu wrote:
> In last patch, we wrap vm_load with begin/commit, here we introduce
> address_space_to_flatview_rcu() to avoid unnecessary enforce commit
> during vm_load.
> 
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
> ---
>  include/exec/memory-internal.h |  2 +-
>  include/exec/memory.h          | 20 ++++++++++++++++++++
>  softmmu/memory.c               |  2 +-
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
> index 100c1237ac..1432240449 100644
> --- a/include/exec/memory-internal.h
> +++ b/include/exec/memory-internal.h
> @@ -30,7 +30,7 @@ static inline AddressSpaceDispatch *flatview_to_dispatch(FlatView *fv)
>  
>  static inline AddressSpaceDispatch *address_space_to_dispatch(AddressSpace *as)
>  {
> -    return flatview_to_dispatch(address_space_to_flatview(as));
> +    return flatview_to_dispatch(address_space_to_flatview_rcu(as));
>  }

I'm not sure whether this one is always safe.

tcg_commit() seems to be safe, but maybe address_space_translate_iommu() is
not?  Maybe easier to leave this untouched?

>  
>  FlatView *address_space_get_flatview(AddressSpace *as);
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index d6fd89db64..235e3017bc 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1100,6 +1100,9 @@ bool memory_region_transaction_in_progress(void);
>  
>  void memory_region_transaction_do_commit(void);
>  
> +/*
> + * We recommend using this by default.
> + */

I think this comment doesn't really help.. drop it?

>  static inline FlatView *address_space_to_flatview(AddressSpace *as)

-- 
Peter Xu


