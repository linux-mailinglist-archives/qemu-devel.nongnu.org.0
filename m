Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61614668FD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:19:26 +0100 (CET)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspjx-0007Px-Rm
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:19:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mspcn-0006eV-Ie
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:12:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mspck-0001dB-6W
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638465116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9SXDlo6M3a1XCLfMTmLv/Dt2eBvVRMdJRm3woaLy3Wo=;
 b=SNpscf+hJA1+zYJ0skJ3oHRRVTJV50IZq4oiwKaquTiW8r6TLCu5imrRz9kgQfA5Rr/rbN
 UeeugEK517xd5rQ7orWGLtDsuYZ5c+kItrsY+fU6FT6MzB4uKMn5w2o+Oarz6KVe41SR1W
 2s2t1P6FQzk+tYSfQUaA/oHnRUctw4c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-wS6OPVloP2mjwVMCmNB65g-1; Thu, 02 Dec 2021 12:11:55 -0500
X-MC-Unique: wS6OPVloP2mjwVMCmNB65g-1
Received: by mail-wr1-f71.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so8449wrc.22
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 09:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9SXDlo6M3a1XCLfMTmLv/Dt2eBvVRMdJRm3woaLy3Wo=;
 b=CPKHwidjNfQEo/CJqgQ9tlwWfNK1E1eTvAgE5DpJxlC11Pe+PGmgs+J69s475beI64
 HZn7iTguB9aOrcnUSIxR0nBe3wcD0s8k2Dz2nX1CuuJYoM+JGw5EjUeq8GLHIb/jmmiN
 lsCrzEDvoWCCYdbTND+k8BTniH1leKDZRHPxxP6+6tMbyGfIJE8kEgWDe442ePytbqZa
 iI9UkGL/+olLgs8OAnVJ8WbfzoFeV8/aPOHhHG3FhA8zG4rUV9CZaq8dtyO4f2KOzU15
 DQ2LUVuPRouAr8wJA4bN19FEzGTmMcU19v6ozzdLLnbI7SINxzItE2fsDVlS2byPY48N
 Hd8A==
X-Gm-Message-State: AOAM530Q6jBuKoioOhh4tTabEX4G4tKljKTi0grosmkyBeIaU3Ovo2T/
 aXajyi0sRRXORClAzDKFb9EGFviGlbX/PY5GYaKUTTpIOzCewCW+YmbBzAQlfOllsu3ztbsM42P
 LG231OgTkttEDsOI=
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr14992403wro.484.1638465114619; 
 Thu, 02 Dec 2021 09:11:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyODk4WKXZZq1rvA+1BrqrzkR/092j0tAqO9TJ1nB9XBgFVVQhdk8XKbE9PV8iM7fzeZtgSag==
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr14992381wro.484.1638465114346; 
 Thu, 02 Dec 2021 09:11:54 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id h15sm2943590wmq.32.2021.12.02.09.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 09:11:53 -0800 (PST)
Date: Thu, 2 Dec 2021 17:11:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 23/23] migration: Use multifd before we check for the
 zero page
Message-ID: <Yaj+V6LstcnNERaZ@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-24-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-24-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> So we use multifd to transmit zero pages.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 57efa67f20..3ae094f653 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2138,6 +2138,17 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
>      ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
>      int res;
>  
> +    /*
> +     * Do not use multifd for:
> +     * 1. Compression as the first page in the new block should be posted out
> +     *    before sending the compressed page
> +     * 2. In postcopy as one whole host page should be placed
> +     */
> +    if (!save_page_use_compression(rs) && migrate_use_multifd()
> +        && !migration_in_postcopy()) {
> +        return ram_save_multifd_page(rs, block, offset);
> +    }
> +
>      if (control_save_page(rs, block, offset, &res)) {
>          return res;
>      }

Although I don't think it currently matters, I think that should be
after the control_save_page.

Dave

> @@ -2160,17 +2171,6 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
>          return res;
>      }
>  
> -    /*
> -     * Do not use multifd for:
> -     * 1. Compression as the first page in the new block should be posted out
> -     *    before sending the compressed page
> -     * 2. In postcopy as one whole host page should be placed
> -     */
> -    if (!save_page_use_compression(rs) && migrate_use_multifd()
> -        && !migration_in_postcopy()) {
> -        return ram_save_multifd_page(rs, block, offset);
> -    }
> -
>      return ram_save_page(rs, pss, last_stage);
>  }
>  
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


