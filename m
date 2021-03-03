Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA5F32B60D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 09:57:27 +0100 (CET)
Received: from localhost ([::1]:57446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNJu-0005H0-H2
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 03:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHNIm-0004pN-LM
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:56:16 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHNIk-0001Xi-Qd
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:56:16 -0500
Received: by mail-wm1-x334.google.com with SMTP id n4so5464066wmq.3
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 00:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=Yu31mJbHSJXYnEtvcEU3QO4R33cfRJPUf08p7g9z2gs=;
 b=oFZlYhJXzPLBtNDJza3m9ccKDHvicSB58IV0jtxfAkOuYzgMcBLVXIpCbX4yzI3v3g
 e/3m7wXhq0ALesG7eYHyY7rKyjBbiC5SyYstqqGVAiQ/9aK4fkYnsxLhMij+8glshhBT
 smSMQi0F4t3YPql+4ycRgEKVmW9cgChY98oEdPvPny3iG77Z0Ef5QvKFhEj9JMebxBZY
 KocjUSIynrqlxJvWzEoug5XBIL1mmdEGwBIyIOmuBh8iKMIO7TSQZQjtgd818QR86Nxo
 fPB1iktO8SwNkwmNgeordD+DTKF3ZxicAvPnCn9MysJdDhBenZqBq9CKePvOplcwBxEC
 Fx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=Yu31mJbHSJXYnEtvcEU3QO4R33cfRJPUf08p7g9z2gs=;
 b=ZZpKqG7DHHCaUpFYy1zs0ejVkLvN3+U1bJWHXLTQYxXbT1TK83cdiEplRjEli/TauZ
 IxpLfR+3ubbguL5xakC9Le/Dn0JG3mBtLS2CLX8vc/ol8+c5rODb9qSvWa8zl8RFogj9
 uQGaeRvCBdtpUaPOCgRcU5MErkLkS7caJ2lPU033j2e52GOsrTU5BQDPwrIT8cWEKVqy
 oYZeqsv8HOx7LGDocQro8PHx1rFZIYVmP08wBKQ0tkNcA9MsH5nDIMuGGV1K+UFwORTh
 mK5KNanboRbSsMtcoP88v8iRuYAwKqgwdBXAat0mMC61Qb/UdbGK8wJ27cgtqyFxYbSn
 EXDg==
X-Gm-Message-State: AOAM530hpkDkaLt37I8IHX70Z+eAhtA283u1xm1jfZ4j5ggZTNbcpGgl
 taMoX5kPtb7AMtqi/02WEjTgmQ==
X-Google-Smtp-Source: ABdhPJx3kdRAtYHQCQK6G5DpmNpgHH6w3VpFJ+vA+465re13HI3Ah8gfB9LwQWXXY/T+toxUBEUD7g==
X-Received: by 2002:a05:600c:4f0c:: with SMTP id
 l12mr7887800wmq.16.1614761772787; 
 Wed, 03 Mar 2021 00:56:12 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id h20sm5234723wmb.1.2021.03.03.00.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 00:56:12 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id e262d07b;
 Wed, 3 Mar 2021 08:56:11 +0000 (UTC)
To: Kunkun Jiang <jiangkunkun@huawei.com>, Juan Quintela
 <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 3/3] migration/ram: Optimize ram_save_host_page()
In-Reply-To: <20210301082132.1107-4-jiangkunkun@huawei.com>
References: <20210301082132.1107-1-jiangkunkun@huawei.com>
 <20210301082132.1107-4-jiangkunkun@huawei.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Wed, 03 Mar 2021 08:56:11 +0000
Message-ID: <m2k0qoliok.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::334;
 envelope-from=dme@dme.org; helo=mail-wm1-x334.google.com
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

On Monday, 2021-03-01 at 16:21:32 +08, Kunkun Jiang wrote:

> Starting from pss->page, ram_save_host_page() will check every page
> and send the dirty pages up to the end of the current host page or
> the boundary of used_length of the block. If the host page size is
> a huge page, the step "check" will take a lot of time.
>
> This will improve performance to use migration_bitmap_find_dirty().

This is cleaner, thank you.

I was hoping to just invert the body of the loop - something like
(completely untested):

do {
  int pages_this_iteration = 0;

  /* Check if the page is dirty and, if so, send it. */
  if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
    pages_this_iteration = ram_save_target_page(rs, pss, last_stage);
    if (pages_this_iteration < 0) {
      return pages_this_iteration;
    }

    pages += pages_this_iteration;

    /*
     * Allow rate limiting to happen in the middle of huge pages if
     * the current iteration sent something.
     */
    if (pagesize_bits > 1 && pages_this_iteration > 0) {
      migration_rate_limit();
    }
  }
  pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
 } while ((pss->page < hostpage_boundary) &&
          offset_in_ramblock(pss->block,
                             ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
/* The offset we leave with is the min boundary of host page and block */
pss->page = MIN(pss->page, hostpage_boundary) - 1;

> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  migration/ram.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 3a9115b6dc..a1374db356 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1991,6 +1991,8 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>      int tmppages, pages = 0;
>      size_t pagesize_bits =
>          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> +    unsigned long hostpage_boundary =
> +        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
>      unsigned long start_page = pss->page;
>      int res;
>  
> @@ -2002,7 +2004,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>      do {
>          /* Check the pages is dirty and if it is send it */
>          if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> -            pss->page++;
> +            pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
>              continue;
>          }
>  
> @@ -2012,16 +2014,16 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>          }
>  
>          pages += tmppages;
> -        pss->page++;
> +        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
>          /* Allow rate limiting to happen in the middle of huge pages */
>          if (pagesize_bits > 1) {
>              migration_rate_limit();
>          }
> -    } while ((pss->page & (pagesize_bits - 1)) &&
> +    } while ((pss->page < hostpage_boundary) &&
>               offset_in_ramblock(pss->block,
>                                  ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
> -    /* The offset we leave with is the last one we looked at */
> -    pss->page--;
> +    /* The offset we leave with is the min boundary of host page and block */
> +    pss->page = MIN(pss->page, hostpage_boundary) - 1;
>  
>      res = ram_save_release_protection(rs, pss, start_page);
>      return (res < 0 ? res : pages);
> -- 
> 2.23.0

dme.
-- 
Don't you know you're never going to get to France.

