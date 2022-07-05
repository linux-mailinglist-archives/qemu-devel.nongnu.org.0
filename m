Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20C6566EC7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 14:55:50 +0200 (CEST)
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8i5l-0000lM-Qk
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 08:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8i4V-0008NM-1n
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8i4S-0004u9-Ak
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657025667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5lh3CO8My+ZEKusuYh2ghhAUlJi+1Gf7+b/bJ3a33Lo=;
 b=QblpQyPY9fRxFWzPpPQMrbPe3lMQn3miVDSEpFsbxA7HINdA88i39zAmsHsagssaBNMpqv
 WZUTfzcMsMl7bp7WcWDpolQHnjQGO6MPRNgpjRBAa/LTCe/3B8IJa/st/TnVxKfDVx7xzu
 rhUqAjv+q12lfD4j/sjap50bymd+dgU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-SJXHNoIzO3qlIw-lE8YYwg-1; Tue, 05 Jul 2022 08:54:26 -0400
X-MC-Unique: SJXHNoIzO3qlIw-lE8YYwg-1
Received: by mail-wm1-f71.google.com with SMTP id
 i184-20020a1c3bc1000000b003a026f48333so5213910wma.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 05:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5lh3CO8My+ZEKusuYh2ghhAUlJi+1Gf7+b/bJ3a33Lo=;
 b=06lLXZK2usrsiTEApW9GA2qpvnqDW6zqiedjJdli1HJaEkVG4LTjIO4lWyfyqM+LFx
 33Yy6E5vMYq8FW0kWsKEs7dJ2taZcAHavfNq4dbq1gaOeYWmA+qHved86mVxsT6mbTxr
 Hkm0/2t2by0Lt4sF2+M6kTzn8wC0/8Od3eYhUGtd+J6a5MpPde8nKAvwr43N+rL95dLp
 Ea5sxdvMeCa6eDNDYfczkmPVDjyQ5XMHHP8hnYhN2vCQr1ObiXG1b3Oq28MPPleoVVHT
 bWWReMB9Wx17V/EY9shDIvAkrpj0ebXhXUV5MVEjOftPcDCDcRRyfF06w8KPfSIFI/+x
 vpHQ==
X-Gm-Message-State: AJIora+WhDPaXH+QDsLNlLNqFGuJhXJHeJu0Y9S6R7IEbIEA70yvt77b
 lD8jzCs7e1UvqibydyxB/cGPgyydRCQ3oOE0Gb9l6/P1eNA0zy/SGuLz08XydGlRuhHQUB2BAYz
 SV2xA4YTCtY6GLGA=
X-Received: by 2002:a05:600c:4fc9:b0:3a0:4d54:b315 with SMTP id
 o9-20020a05600c4fc900b003a04d54b315mr35570886wmq.62.1657025664494; 
 Tue, 05 Jul 2022 05:54:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1stF3KwXQhbCwQIPKdG8psgbgh8Kyi/U3uvgyi92MiJ12emqgB+MqFZ7Pmm+Dd7R9uJC245pg==
X-Received: by 2002:a05:600c:4fc9:b0:3a0:4d54:b315 with SMTP id
 o9-20020a05600c4fc900b003a04d54b315mr35570869wmq.62.1657025664273; 
 Tue, 05 Jul 2022 05:54:24 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bq25-20020a5d5a19000000b0021d6d74a0ecsm4456167wrb.96.2022.07.05.05.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 05:54:23 -0700 (PDT)
Date: Tue, 5 Jul 2022 13:54:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 4/5] migration: Make find_dirty_block() return a single
 parameter
Message-ID: <YsQ0fc67PKePt3rS@work-vm>
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-5-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621140507.1246-5-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> We used to return two bools, just return a single int with the
> following meaning:
> 
> old return / again / new return
> false        false   0
> false        true    1
> true         true    2  /* We don't care about again at all */

We shouldn't use magic numbers; if you want to return it in a single
value then it should be an enum so it is clear.

Dave

> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 37 +++++++++++++++++++------------------
>  1 file changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 1d4ff3185b..2c7289edad 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1481,13 +1481,16 @@ retry:
>   * find_dirty_block: find the next dirty page and update any state
>   * associated with the search process.
>   *
> - * Returns true if a page is found
> + * Returns:
> + *         0: no page found, give up
> + *         1: no page found, retry
> + *         2: page found
>   *
>   * @rs: current RAM state
>   * @pss: data about the state of the current dirty page scan
>   * @again: set to false if the search has scanned the whole of RAM
>   */
> -static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
> +static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
>  {
>      /* This is not a postcopy requested page */
>      pss->postcopy_requested = false;
> @@ -1499,8 +1502,7 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>           * We've been once around the RAM and haven't found anything.
>           * Give up.
>           */
> -        *again = false;
> -        return false;
> +        return 0;
>      }
>      if (!offset_in_ramblock(pss->block,
>                              ((ram_addr_t)pss->page) << TARGET_PAGE_BITS)) {
> @@ -1529,13 +1531,10 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>              }
>          }
>          /* Didn't find anything this time, but try again on the new block */
> -        *again = true;
> -        return false;
> +        return 1;
>      } else {
> -        /* Can go around again, but... */
> -        *again = true;
> -        /* We've found something so probably don't need to */
> -        return true;
> +        /* We've found something */
> +        return 2;
>      }
>  }
>  
> @@ -2270,18 +2269,20 @@ static int ram_find_and_save_block(RAMState *rs)
>          pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
>      }
>  
> -    do {
> +    while (true){
>          if (!get_queued_page(rs, &pss)) {
>              /* priority queue empty, so just search for something dirty */
> -            bool again = true;
> -            if (!find_dirty_block(rs, &pss, &again)) {
> -                if (!again) {
> -                    break;
> -                }
> -            }
> +            int res = find_dirty_block(rs, &pss);
> +            if (res == 0) {
> +                break;
> +            } else if (res == 1)
> +                continue;
>          }
>          pages = ram_save_host_page(rs, &pss);
> -    } while (!pages);
> +        if (pages) {
> +            break;
> +        }
> +    }
>  
>      rs->last_seen_block = pss.block;
>      rs->last_page = pss.page;
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


