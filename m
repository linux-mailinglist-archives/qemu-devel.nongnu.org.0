Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4133446E1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:16:07 +0100 (CET)
Received: from localhost ([::1]:57798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLLh-0000uy-UQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lOL2w-0007N3-Ij
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:56:42 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:58046 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lOL2i-0001bI-0Y
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:56:34 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6947F40418;
 Mon, 22 Mar 2021 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1616421382;
 x=1618235783; bh=ywAxiStTGQqS9s7CTU2v+VI0w9ANXe59o55iLefalho=; b=
 ULmn8CmPHCLr+839VJINqj518KmzP0adhxIC5B+ERYXhfnGa2zQjzSq47WnRuYLt
 ufO527Tx3YzESgeqzqQrLIQbdp0WkJFF+pMCHTwqKRa1jqZmOEd8pFN24+0dKZ/u
 tKoFy5kHCDQ3qCZWYLOMNxyCkLeXrj/zJzo6dDah6ac=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSK-a2m5l8Ni; Mon, 22 Mar 2021 16:56:22 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1606841283;
 Mon, 22 Mar 2021 16:56:21 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 22
 Mar 2021 16:56:21 +0300
Date: Mon, 22 Mar 2021 16:56:20 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 for-6.0 1/2] tcg: Do not set guard pages on the rx
 portion of code_gen_buffer
Message-ID: <YFiiBAwESsbf2lOZ@SPB-NB-133.local>
References: <20210320165720.1813545-1-richard.henderson@linaro.org>
 <20210320165720.1813545-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210320165720.1813545-2-richard.henderson@linaro.org>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 20, 2021 at 10:57:19AM -0600, Richard Henderson wrote:
> The rw portion of the buffer is the only one in which overruns
> can be generated.  Allow the rx portion to be more completely
> covered by huge pages.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index de91bb6e9e..88c9e6f8a4 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -828,7 +828,6 @@ void tcg_region_init(void)
>      size_t region_size;
>      size_t n_regions;
>      size_t i;
> -    uintptr_t splitwx_diff;
>  
>      n_regions = tcg_n_regions();
>  
> @@ -858,8 +857,11 @@ void tcg_region_init(void)
>      /* account for that last guard page */
>      region.end -= page_size;
>  
> -    /* set guard pages */
> -    splitwx_diff = tcg_splitwx_diff;
> +    /*
> +     * Set guard pages in the rw buffer, as that's the one into which
> +     * buffer overruns could occur.  Do not set guard pages in the rx
> +     * buffer -- let that one use hugepages throughout.
> +     */
>      for (i = 0; i < region.n; i++) {
>          void *start, *end;
>          int rc;
> @@ -867,10 +869,6 @@ void tcg_region_init(void)
>          tcg_region_bounds(i, &start, &end);
>          rc = qemu_mprotect_none(end, page_size);
>          g_assert(!rc);
> -        if (splitwx_diff) {
> -            rc = qemu_mprotect_none(end + splitwx_diff, page_size);
> -            g_assert(!rc);
> -        }
>      }
>  
>      tcg_region_trees_init();
> -- 
> 2.25.1
> 

Thanks for fixing the issue, Richard,

I have two questions:
 - Should we keep guards pages for rx on all platforms except darwin?
   (that would make it similar to what Philippe proposed in the comments
   to patch 2).
 - What does mean that rx might be covered by huge pages? (perhaps I'm
   missing some context)

Otherwise,

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

BR,
Roman

