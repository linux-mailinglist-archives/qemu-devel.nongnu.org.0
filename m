Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB5632B5FA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 09:39:51 +0100 (CET)
Received: from localhost ([::1]:48890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHN2s-00085r-I9
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 03:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHN1i-0007Ng-8u
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:38:38 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHN1g-0004Lg-Bu
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:38:38 -0500
Received: by mail-wm1-x333.google.com with SMTP id i9so4436418wml.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 00:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=nML+W767oUqLkPgphBEatwKec3UZTja5ifHS325U6OQ=;
 b=AiErmHHTTx0l0DUxkmQRiGdq9kJ5BS0UR53fSmdvd5Fu3/2kEskjMaVwwHCo1vpqpL
 GCZVFXsF9+qL+GvnZ6TUAD0eSEMv0BR06piDAWJod78VoYakejXWQqGTi6S1iPYMRkhr
 dY64ds5RgdeqoGm55ttlzlKNBZOU3YcIm7tmaQypl7Jx6yWPlspIGQkpMs9oU35r2yjw
 u8VWuAN2lMngEBzpB1EBi9TVPtRRnsZYniVgIUF7q8DXEhnGN2v7n8FjRuNLWO+X11Xf
 lJ+UOLPvJPhqC13Vzlqquqe9o/iIKtu6IMzCX9D+0Fu9YS1ci0Ug3aGvoKg7L96bmBgX
 gqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=nML+W767oUqLkPgphBEatwKec3UZTja5ifHS325U6OQ=;
 b=CG9/SgF+5n0lcrZKZE4Ta55Koy0sF1rHIw8JVQ2bG7eKld37EP/6dIVXitBIWlxa+h
 gANUYj2vhZiU+Vx0yrJVYBX0y3z8fT1JYnxV9aKhFUmzlxgYsIz2T5+n953q89MwSmad
 JHo0Q6nKuQmQHEeThYm0UVPANRNJg8312HPUNTUm29v18HXaveeo0lAXcCWl8xRKWz1F
 9LlWbcvgGWUCZiJ57zeFb2dHw7TVF8MDZhDQY5LZ/pvPSU3IzVoIIp1Y3KGEsPzfpuoB
 Gniw62BkS5+dt9gB4BTHzoKRe9//Rg5ew3OnaC0pTVBf/7uL+xEGL9Tkgr5dcNbBe/Ta
 93ZA==
X-Gm-Message-State: AOAM532feqKXg/qrjmIFylWZF6ftvpvxZY3O+j6NmhxvKy0YUIHt6toe
 ZEnJUDdDX9NxdY81aYqfod/KFQ==
X-Google-Smtp-Source: ABdhPJymzOMEKTeaBZ4wRaGHUMGdB2EEoNjEmKkeaQE0zg3gAUpSUjS0Mn68jtm9SK3fLD9pL5jzvw==
X-Received: by 2002:a05:600c:2947:: with SMTP id
 n7mr8145269wmd.61.1614760714136; 
 Wed, 03 Mar 2021 00:38:34 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id j11sm29704302wrm.13.2021.03.03.00.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 00:38:33 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id de21a7aa;
 Wed, 3 Mar 2021 08:38:32 +0000 (UTC)
To: Kunkun Jiang <jiangkunkun@huawei.com>, Juan Quintela
 <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 1/3] migration/ram: Modify the code comment of
 ram_save_host_page()
In-Reply-To: <20210301082132.1107-2-jiangkunkun@huawei.com>
References: <20210301082132.1107-1-jiangkunkun@huawei.com>
 <20210301082132.1107-2-jiangkunkun@huawei.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Wed, 03 Mar 2021 08:38:32 +0000
Message-ID: <m2mtvkljhz.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::333;
 envelope-from=dme@dme.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2021-03-01 at 16:21:30 +08, Kunkun Jiang wrote:

> The ram_save_host_page() has been modified several times
> since its birth. But the comment hasn't been modified as it should
> be. It'd better to modify the comment to explain ram_save_host_page()
> more clearly.

I don't think that it's reasonable for me to send Reviewed-by for this,
given that I suggested the text.

Could someone else check the sense and correctness?

> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  migration/ram.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 72143da0ac..24967cb970 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1970,15 +1970,13 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
>  }
>  
>  /**
> - * ram_save_host_page: save a whole host page
> + * ram_save_host_page: save a whole host page or the rest of a RAMBlock
>   *
> - * Starting at *offset send pages up to the end of the current host
> - * page. It's valid for the initial offset to point into the middle of
> - * a host page in which case the remainder of the hostpage is sent.
> - * Only dirty target pages are sent. Note that the host page size may
> - * be a huge page for this block.
> - * The saving stops at the boundary of the used_length of the block
> - * if the RAMBlock isn't a multiple of the host page size.
> + * Send dirty pages between pss->page and either the end of that page
> + * or the used_length of the RAMBlock, whichever is smaller.
> + *
> + * Note that if the host page is a huge page, pss->page may be in the
> + * middle of that page.
>   *
>   * Returns the number of pages written or negative on error
>   *
> -- 
> 2.23.0

dme.
-- 
Leaves are falling all around, it's time I was on my way.

