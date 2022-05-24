Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F4B5331CF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 21:37:48 +0200 (CEST)
Received: from localhost ([::1]:36738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntaLj-0001mD-2F
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 15:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ntaK1-00015G-4k
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:36:01 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ntaJz-0005V9-93
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:36:00 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q18so16701604pln.12
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dOQqJipjB7XvkB7vBfeZvym+R0VGemcRWEp42KC5/do=;
 b=Wq7LLslOzGJL9kfe/q0uEybu7QvXvdl07qEMXiycgbsX9H9w3un7Yb2KlWsbaNeKvx
 GYPng7tBLKJcK6DC6kN1Z8dZFR1A3GlGf3LnEBIErRAyJNsYJ6HhqvP25x5Nh+/rj8WK
 L2hGpCfJG6hzW74j8YeR5giyHeZZygYiKthnGtFU4QQtOSLhRgFeonMSEvR0mvuF26DW
 dfyQnKd69M1XN6ZumpMXiMbK9jzwTgDvwJf6towsdC39T3bHQ1LJURjpkbakrTLf2yie
 yxmtFWuKf5UvAewl3hRiF43th2wRFmIk883p00PDm7W+wgNXUgu4maXbeIOQfdpV1P70
 UZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dOQqJipjB7XvkB7vBfeZvym+R0VGemcRWEp42KC5/do=;
 b=s/Y18Ss9eHxtCXhcUi59KbJMrXtXCVhKwGgr/g15RYReN9jAZ2y5jL7mT3A+ZukH7W
 0sbjGCUUj6/KT/TgTvkiL3OBt0Zw+O7BJ+YppTGY+Rc4QYa7KHUbN35P6hSoPq0TK+bL
 tFTtikEtlyAa9tEXArEP5djiw/dCjMT9os2pc+9ALPFeNfYb6f3Bie9WPIBSbZ57BbIM
 w99WypKJyI7gdunM7Yw90jDM9sjAaTPtCCdtvDLUHlCod7CyP9Cd28KftxZ3/bdj/qzY
 /sKayZrKq9xIFQeqaw8uODnltb17xHycZriQ/mFF6R6i62MUX+4pyEDXTTk8GikZaK+j
 /uFw==
X-Gm-Message-State: AOAM530HJXRLvPt62ZwCefetblp8qwza3unLA3dU7R0NqmjucnoPJYie
 d9JL67MvFrQm02uE5+f2gfiqDA==
X-Google-Smtp-Source: ABdhPJyH1Zkdu32w5va1hZu7bLMZ9V1k6vip5S6YIxb0m8wD8/tNl4g58vAsT46JwafkST2fDpJmig==
X-Received: by 2002:a17:90b:3284:b0:1e0:97e7:2e4d with SMTP id
 ks4-20020a17090b328400b001e097e72e4dmr1657886pjb.187.1653420956940; 
 Tue, 24 May 2022 12:35:56 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 w15-20020a63b74f000000b003f26c2f583asm6842111pgt.61.2022.05.24.12.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 12:35:56 -0700 (PDT)
Date: Tue, 24 May 2022 19:35:52 +0000
From: Sean Christopherson <seanjc@google.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: akpm@linux-foundation.org, naoya.horiguchi@nec.com, mst@redhat.com,
 david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 jasowang@redhat.com, virtualization@lists.linux-foundation.org,
 pbonzini@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/3] virtio_balloon: Introduce memory recover
Message-ID: <Yo0zmP28FqpivlxF@google.com>
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
 <20220520070648.1794132-4-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520070648.1794132-4-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Fri, May 20, 2022, zhenwei pi wrote:
> @@ -59,6 +60,12 @@ enum virtio_balloon_config_read {
>  	VIRTIO_BALLOON_CONFIG_READ_CMD_ID = 0,
>  };
>  
> +/* the request body to commucate with host side */
> +struct __virtio_balloon_recover {
> +	struct virtio_balloon_recover vbr;
> +	__virtio32 pfns[VIRTIO_BALLOON_PAGES_PER_PAGE];

I assume this is copied from virtio_balloon.pfns, which also uses __virtio32, but
isn't that horribly broken?  PFNs are 'unsigned long', i.e. 64 bits on 64-bit kernels.
x86-64 at least most definitely generates 64-bit PFNs.  Unless there's magic I'm
missing, page_to_balloon_pfn() will truncate PFNs and feed the host bad info.

> @@ -494,6 +511,198 @@ static void update_balloon_size_func(struct work_struct *work)
>  		queue_work(system_freezable_wq, work);
>  }
>  
> +/*
> + * virtballoon_memory_failure - notified by memory failure, try to fix the
> + *                              corrupted page.
> + * The memory failure notifier is designed to call back when the kernel handled
> + * successfully only, WARN_ON_ONCE on the unlikely condition to find out any
> + * error(memory error handling is a best effort, not 100% coverd).
> + */
> +static int virtballoon_memory_failure(struct notifier_block *notifier,
> +				      unsigned long pfn, void *parm)
> +{
> +	struct virtio_balloon *vb = container_of(notifier, struct virtio_balloon,
> +						 memory_failure_nb);
> +	struct page *page;
> +	struct __virtio_balloon_recover *out_vbr;
> +	struct scatterlist sg;
> +	unsigned long flags;
> +	int err;
> +
> +	page = pfn_to_online_page(pfn);
> +	if (WARN_ON_ONCE(!page))
> +		return NOTIFY_DONE;
> +
> +	if (PageHuge(page))
> +		return NOTIFY_DONE;
> +
> +	if (WARN_ON_ONCE(!PageHWPoison(page)))
> +		return NOTIFY_DONE;
> +
> +	if (WARN_ON_ONCE(page_count(page) != 1))
> +		return NOTIFY_DONE;
> +
> +	get_page(page); /* balloon reference */
> +
> +	out_vbr = kzalloc(sizeof(*out_vbr), GFP_KERNEL);
> +	if (WARN_ON_ONCE(!out_vbr))
> +		return NOTIFY_BAD;

Not that it truly matters, but won't failure at this point leak the poisoned page?

