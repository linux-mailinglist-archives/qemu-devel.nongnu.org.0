Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5C4A877E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 16:18:03 +0100 (CET)
Received: from localhost ([::1]:40366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFds1-0005Km-IZ
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 10:18:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFdpm-0004aB-Fx
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:15:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFdpi-0006lW-Bz
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:15:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643901336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Chp0oQy6+633OCEnLORaVy2OVXwSaW8WowKZ59KZzRM=;
 b=YWkhZpvl2h/e2JA5t/Frk3wCi6mHatk/LHxu+Ot5k02GDEteh36McRl4/KJ5ftXNLLpGTM
 A1aV3RaS8zLN3LVLQv7bGM8kXQ6yV26O3JMWY+PkgkXF83FfVuxprUoGtJ131PKA/UbQve
 opLcwYhLqTizHBDuFpTqysiAYd5X340=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-xvaEckugOjO5Vwuyu6tlXA-1; Thu, 03 Feb 2022 10:15:35 -0500
X-MC-Unique: xvaEckugOjO5Vwuyu6tlXA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h2-20020adfa4c2000000b001e26b5f1ec5so753751wrb.13
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 07:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Chp0oQy6+633OCEnLORaVy2OVXwSaW8WowKZ59KZzRM=;
 b=sOFzKRHeYPPTjGiVoRTyJrchppnRe1Mz6G7RHf2IiQjmdqX7bCROfdBoKHcqlLmfHF
 iOPRugxL2/Y9/DnyC2HoMdGczdU3uLglhhlr6jXYgDYJbndwU6i93bx88DbNVBYGse4B
 uH+o9vP1hRmeLnVxvT5bOxNdryO5N3SG/p7AmuewSFGQoIDlDsALMY3hh1W+J0bI2VDr
 jPh0BF51Yc6ZTowrNm+2rKtGnDm1Aran243L3ML02PhOysTEK8A+rlvsGKTihIXMgT8w
 cicAorPuE+VBx1pkN98Gocco64Hu0cn9V8WdnKdJceTamrFoEYCaDnLWIUzvd+LsAlk7
 X7Ug==
X-Gm-Message-State: AOAM533GFxK8K38QwYdmTiHZTrRs7NUn1E3t9YRqC7pVFNQB0j+9zKK7
 7AF9JkjfHk4I7+dmrxF+sl5WfktXt9VU+FJoBKKt+A8nfQCIPynY1TXzb2EvtEy06Qr+EyIWKtz
 YLFNPpZ+Rt3F4jLI=
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr11188499wmh.57.1643901334296; 
 Thu, 03 Feb 2022 07:15:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWjR9vRC+vsxfWOUuRvSJzkpdPkTK/wZCbelnSsjw2+x3t8Ix9Iuw1kMo/udUPBLa5F0pAZg==
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr11188479wmh.57.1643901334065; 
 Thu, 03 Feb 2022 07:15:34 -0800 (PST)
Received: from work-vm (82-132-239-190.dab.02.net. [82.132.239.190])
 by smtp.gmail.com with ESMTPSA id m8sm19785634wrn.106.2022.02.03.07.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 07:15:33 -0800 (PST)
Date: Thu, 3 Feb 2022 15:15:31 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 08/15] migration: Dump ramblock and offset too when
 non-same-page detected
Message-ID: <YfvxkzSsjMGlEdzn@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-9-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-9-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> In ram_load_postcopy() we'll try to detect non-same-page case and dump error.
> This error is very helpful for debugging.  Adding ramblock & offset into the
> error log too.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 930e722e39..3f823ffffc 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3705,8 +3705,12 @@ static int ram_load_postcopy(QEMUFile *f)
>              } else if (tmp_page->host_addr !=
>                         host_page_from_ram_block_offset(block, addr)) {
>                  /* not the 1st TP within the HP */
> -                error_report("Non-same host page %p/%p", tmp_page->host_addr,
> -                             host_page_from_ram_block_offset(block, addr));
> +                error_report("Non-same host page detected.  Target host page %p, "
> +                             "received host page %p "
> +                             "(rb %s offset 0x"RAM_ADDR_FMT" target_pages %d)",
> +                             tmp_page->host_addr,
> +                             host_page_from_ram_block_offset(block, addr),
> +                             block->idstr, addr, tmp_page->target_pages);
>                  ret = -EINVAL;
>                  break;
>              }
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


