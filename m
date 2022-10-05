Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C77D5F531C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 13:04:42 +0200 (CEST)
Received: from localhost ([::1]:33814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og2Ce-00053B-7r
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 07:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og1yL-00066c-RC
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 06:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og1yK-0002f7-08
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 06:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664966987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JTMu2/S4i0uutoSlvsG2ttwOmiScnjVwgfX8iSIvARY=;
 b=OZO4UOdz+fvn7Gvj9QnP7WCXdOwm9G0XHMLLHyLYgWFtvfcjK3j/561aXSB0OcuvnXd3X8
 5Wj9HGYaaRhE4zlsSp38TkhEelnJTAXMagcMQZvb0aSxroSMdz08JPzwspUYG6BZyfTn7Z
 c2DVhC9BkweN9RveGkFK7ZJiC5mQ4mE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-dx3ZjND6P3iargMGh1VvcA-1; Wed, 05 Oct 2022 06:49:31 -0400
X-MC-Unique: dx3ZjND6P3iargMGh1VvcA-1
Received: by mail-wm1-f72.google.com with SMTP id
 p24-20020a05600c1d9800b003b4b226903dso775547wms.4
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 03:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JTMu2/S4i0uutoSlvsG2ttwOmiScnjVwgfX8iSIvARY=;
 b=iKbAvlfMitt1iyW5JcVZ24s5IZAqHTnwgpjMk9jUZqX7sRQ7oiwmwU6iEbUTSkCzUo
 wWUKE4siMO21d8nMYsJiLJNNaKt0cw6x2Px4aAluB/mN1BL0t11AoZyh8fcDsZK0WHoT
 ttozvVxepxONFo5C42GebsgkG9uoSep51CYLv3yjHph5Fvir/Nd/MukTGgZ/VzgTod4R
 +dTY2aRK/L5E5v6CQVtzTSwQcBIJkntGXYiPzhBHfzL6MKeTLor159pWAEBN/VdBO7j6
 /pjWDbm3OOeN3t5Yd+7YggRHdO0UaLnxmvKo6uG9u/W/oTadTI3A2xvcJtXIwGAbDjf1
 1PhA==
X-Gm-Message-State: ACrzQf3XPKZCJ/wtehGQeFb3yyZZBdMqVSuToEw4tmSD+IjnXl/KRFz6
 sHmH692OzZhNz3+eOwq+9gU5UtbAt59nc+zB7SlROdJfMjlLQmOC9ZvZupaVzRZI+xnyp27xc3F
 FzCUhPQyFTgaPV3Y=
X-Received: by 2002:a5d:6c6b:0:b0:225:dde:ab40 with SMTP id
 r11-20020a5d6c6b000000b002250ddeab40mr19355536wrz.690.1664966970105; 
 Wed, 05 Oct 2022 03:49:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6y/HgtEfv4v+hoXCONHKogWaFaLkqt69b70muQLZZ/TlgdpSvbRGV8n81eIGGOjIlE9SgJyA==
X-Received: by 2002:a5d:6c6b:0:b0:225:dde:ab40 with SMTP id
 r11-20020a5d6c6b000000b002250ddeab40mr19355523wrz.690.1664966969865; 
 Wed, 05 Oct 2022 03:49:29 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 d16-20020adfe890000000b0022e035a4e93sm14354157wrm.87.2022.10.05.03.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 03:49:28 -0700 (PDT)
Date: Wed, 5 Oct 2022 11:49:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 5/5] migration: Disable multifd explicitly with
 compression
Message-ID: <Yz1hNvh9E/ymQAQ5@work-vm>
References: <20221004182430.97638-1-peterx@redhat.com>
 <20221004182430.97638-6-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004182430.97638-6-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Multifd thread model does not work for compression, explicitly disable it.
> 
> Note that previuosly even we can enable both of them, nothing will go
> wrong, because the compression code has higher priority so multifd feature
> will just be ignored.  Now we'll fail even earlier at config time so the
> user should be aware of the consequence better.
> 
> Note that there can be a slight chance of breaking existing users, but
> let's assume they're not majority and not serious users, or they should
> have found that multifd is not working already.
> 
> With that, we can safely drop the check in ram_save_target_page() for using
> multifd, because when multifd=on then compression=off, then the removed
> check on save_page_use_compression() will also always return false too.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yes, and of course if they were trying to use it, they should have been
trying to use multifd-compression parameter instead, which is different
code.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c |  7 +++++++
>  migration/ram.c       | 11 +++++------
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 844bca1ff6..ef00bff0b3 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1349,6 +1349,13 @@ static bool migrate_caps_check(bool *cap_list,
>          }
>      }
>  
> +    if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
> +        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
> +            error_setg(errp, "Multifd is not compatible with compress");
> +            return false;
> +        }
> +    }
> +
>      return true;
>  }
>  
> diff --git a/migration/ram.c b/migration/ram.c
> index 1d42414ecc..1338e47665 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2305,13 +2305,12 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
>      }
>  
>      /*
> -     * Do not use multifd for:
> -     * 1. Compression as the first page in the new block should be posted out
> -     *    before sending the compressed page
> -     * 2. In postcopy as one whole host page should be placed
> +     * Do not use multifd in postcopy as one whole host page should be
> +     * placed.  Meanwhile postcopy requires atomic update of pages, so even
> +     * if host page size == guest page size the dest guest during run may
> +     * still see partially copied pages which is data corruption.
>       */
> -    if (!save_page_use_compression(rs) && migrate_use_multifd()
> -        && !migration_in_postcopy()) {
> +    if (migrate_use_multifd() && !migration_in_postcopy()) {
>          return ram_save_multifd_page(rs, block, offset);
>      }
>  
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


